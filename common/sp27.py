#coding=utf-8

import re
import time
import unicodedata

import sys
import binascii
from binascii import b2a_hex, a2b_hex
from string import atoi
reload(sys)
sys.setdefaultencoding('utf8')

class PDU27(object):
    """description of class"""

    type = 'PDU27'

    Tp_sender=''
    Tp_phone_number=''
    Tp_dcscode='' #7bit 00;8bit 04;ucs2 08
    Tp_msgcontent=''
    Tp_pdutype='' #01 deliver 发送;00 submit 接收
    def __init__(self,sender,phone_number,msgcontent,dcscode='00',pdutype='01',datestamp=None):
        self.Tp_sender=sender
        self.Tp_phone_number=phone_number
        if len(dcscode)==0:dcscode='00'
        self.Tp_dcscode=dcscode
        self.Tp_msgcontent=msgcontent
        self.Tp_pdutype=pdutype
        self.datestamp = datestamp or time.time()

    @classmethod
    def create(cls,sender,phone_number,msgcontent,dcscode='00',pdutype='01',datestamp=None):
        """ 创建类方法---
            参数描述：
            sender 信息中心号码
            phone_number 发送或接收电话号码
            msgcontent 信息内容
            dcscode  7bit（不含中文） 00;8bit（不含中文） 04;ucs2（含中文） 08
            pdutype  发送01，接收00
            datestamp 时间戳
            """
        resultCls=cls
        errorMsg=''
        if cls.is_chinese(msgcontent) and dcscode=='08':
            resultCls=cls(sender,phone_number,msgcontent,dcscode,pdutype,datestamp)
        else:
            resultCls=None
            errorMsg='pdutype and msgcontent is not match!'

        return errorMsg,resultCls
        
    @classmethod
    def encodingSendMsg(cls,sender,phone_number,msgcontent,dcscode='00'):
        """ 发送信息的编码---
            发送的信息组成：
            sca 编码
            pdu-type  发送位11，接收位24
            mr  固定00 （发送）
            phonenumber 编码 DA
            PID 固定00
            DCS 7bit 00;8bit 04;ucs2 08
            VP 有效时间 （发送）VPF=10则VP固定取AA（四天）
            UDL 
            UD """
        msg=[]
        #sca
        sca=cls.encodingSCA(sender)
        msg.append(sca)

        #pdu-type
        msg.append('11')

        #mr
        msg.append('00')

        #phonenumber
        phone=cls.encodingNumber(phone_number)
        msg.append(phone)

        #pid
        msg.append('00')

        #DCS
        msg.append(dcscode)

        #VP
        msg.append('AA')

        #udl,ud
        udlud=cls.getUdlAndUd(dcscode,msgcontent)
        msg.append(udlud)

        return ''.join(msg)

    @classmethod
    def encodingReceiveMsg(cls,sender,phone_number,msgcontent,dcscode='00',datestamp=None):
        """ 接收信息的编码---
            接收的信息组成：
            sca 编码
            pdu-type  发送位11，接收位24
            phonenumber 编码 OD
            PID 固定00
            DCS 7bit 00;8bit 04;ucs2 08
            SCTS 时间戳 （接收）如：2017052720303000
            UDL 
            UD
             """
        msg=[]
        #sca
        sca=cls.encodingSCA(sender)
        msg.append(sca)

        #pdu-type
        msg.append('24')

        #phonenumber
        phone=cls.encodingNumber(phone_number)
        msg.append(phone)

        #pid
        msg.append('00')

        #DCS
        msg.append(dcscode)

        #SCTS
        sctstr=cls.interChangeNo(time.strftime("%Y%m%d%H%M%S00", time.localtime())[2:])
        msg.append(sctstr)

        #udl,ud
        udlud=cls.getUdlAndUd(dcscode,msgcontent)
        msg.append(udlud)

        return ''.join(msg)

    #@classmethod
    def encodingMsg(cls):
        """ 信息的编码"""
        msgstr=''
        if cls.Tp_pdutype=='01':
            msgstr=cls.encodingSendMsg(cls.Tp_sender,cls.Tp_phone_number,cls.Tp_msgcontent,cls.Tp_dcscode)
        else:
            msgstr=cls.encodingReceiveMsg(cls.Tp_sender,cls.Tp_phone_number,cls.Tp_msgcontent,cls.Tp_dcscode)

        return msgstr


    @classmethod
    def decodingMsg(cls,hexstring):
        """ 信息的解码---
            信息组成：
            sca 编码
            pdu-type  一般来说发送位固定11，接收位固定24(mti表示短信发送还是接收(submit or deliver)：00--接收；01--发送)
            mr  固定00 （发送）
            phonenumber 编码 DA/OD
            PID 固定00
            DCS 7bit 00;8bit 04;ucs2 08
            VP 有效时间 （发送）VPF=10则VP固定取AA（四天）
            SCTS 时间戳 （接收）
            UDL 
            UD
             """
        ss=hexstring
        #sca,mti
        sca=''
        scatmp=[]
        ilength=int(ss[0:2],16)

        if ilength>0:
            if ss[2:4]=='91':
                scatmp.append('+')
                ilength-=1
            senderphone=cls.interChangeNo(ss[4:ilength*2+4])
            if senderphone[-1]=='F':
                senderphone=senderphone[:-1]

            scatmp.append(senderphone)        
            sca=''.join(scatmp)

            pdutype=int(ss[ilength*2+4:ilength*2+6],16)

        else:
            pdutype=int(ss[ilength*2+2:ilength*2+4],16)
        #mti 
        pdutypetmp='{0:08b}'.format(pdutype) #固定长度为8位二进制
        mti=pdutypetmp[-2]+pdutypetmp[-1]
        #vpf and vp length
        vpf=pdutypetmp[-5]+pdutypetmp[-4]
        vplen=0
        if vpf=='11':
            vplen=14
        elif vpf=='10':            
            vplen=2
        else:
            vplen=0

        if ilength>0:
            if mti=='01':
                ss=ss[ilength*2+8:]
            else:
                ss=ss[ilength*2+6:]  
        else:
            if mti=='01':
                ss=ss[ilength*2+6:]
            else:
                ss=ss[ilength*2+4:]  
   

        #phone
        phone=''
        phonetmp=[]
        ilength=int(ss[0:2],16)
        if ss[2:4]=='91':phonetmp.append('+')

        if ilength%2==1:ilength=ilength+1

        dphone=cls.interChangeNo(ss[4:ilength+4])
        if dphone[-1]=='F':
            dphone=dphone[:-1]
            phonetmp.append(dphone)

        phone=''.join(phonetmp)

        ss=ss[ilength+6:]

        #DCS
        dcscode=ss[0:2]
        ss=ss[2:]

        #SCTS(接收00) or VP（发送01）
        sctsstr=''
        sctstmp=[]
        vpstr=''
        vptmp=[]

        if mti=='01':
            if vplen==11:
                vptmp.append('20'+ss[1]+ss[0])
                vptmp.append('-'+ss[3]+ss[2])
                vptmp.append('-'+ss[5]+ss[4])
                vptmp.append(' '+ss[7]+ss[6])
                vptmp.append(':'+ss[9]+ss[8])
                vptmp.append(':'+ss[11]+ss[10])
                vpstr=''.join(vptmp)
                ss=ss[16:]
            elif vplen==2:
                vpstr=ss[0:2]
                ss=ss[4:]
            else:
                ss=ss[2:]
        else:
            #ss=ss[ilength*2+4:]         
            sctstmp.append('20'+ss[1]+ss[0])
            sctstmp.append('-'+ss[3]+ss[2])
            sctstmp.append('-'+ss[5]+ss[4])
            sctstmp.append(' '+ss[7]+ss[6])
            sctstmp.append(':'+ss[9]+ss[8])
            sctstmp.append(':'+ss[11]+ss[10])
            sctsstr=''.join(sctstmp)
            ss=ss[16:]

        #ud
        usedata=''
        if dcscode=='00':
            usedata=cls.decodingBit7(ss[0:])
        elif dcscode=='08':
            usedata=cls.decodingUCS2(ss[0:])
        else:
            usedata=cls.decodingBit8(ss[0:])

        return sca,phone,mti,dcscode,sctsstr,vpstr,usedata

    @classmethod
    def encodingSCA(cls,sender):
        """encoding the SCA"""
        sca=[]
        scastr=''
        ss=sender
        if len(sender)==0: return '00'

        #91=国际号码；81=未知
        if sender[0]=='+':
            sca.append('91')
            ss=ss[1:]
        else:
            sca.append('81')
        
        if (len(ss) % 2==1):ss += 'F'

        ii=len(ss)/2-1
        i=0
        j=0
        while (i<=ii):
            ff1=ss[j]
            ff2=ss[j+1]
            sca.append(ff2+ff1)
            j+=2
            i+=1

        scastr=''.join(sca)
        head="%02X" %(len(scastr)/2)

        return head+scastr

    @classmethod
    def encodingNumber(cls,mobileNo): 
        """encoding the phonenumber"""           
        sb=[]
        ss=mobileNo

        #91=国际号码；81=未知
        if ss[0]=='+':
            sb.append('91')
            ss=ss[1:]
        else:
            sb.append('81')

        head="%02X" %(len(ss))

        if (len(ss) % 2==1):ss += 'F'

        ii=len(ss)/2-1
        i=0
        j=0
        while (i<=ii):
            ff1=ss[j]
            ff2=ss[j+1]
            sb.append(ff2+ff1)
            j+=2
            i+=1

        return head+''.join(sb)
  
    @classmethod
    def encodingBit7(cls,message):    
        """encoding the 7-bit""" 
        n = 0

        # pack all those pesky septets into one big number
        bignum = 0
        for c in message:
            septet = ord(c)
            bignum |= septet << n
            n += 7

        # now grab octets from that big number, starting from the bottom
        #print format(bignum, 'b')
        m = 0
        l = []
        while n > 0:
            mask = 0xFF << m
            l.append((bignum & mask) >> m)
            #print format(l[-1], '08b')
            m += 8
            n -= 8
        return binascii.b2a_hex(''.join(map(chr, l))).upper()

    @classmethod
    def decodingBit7(cls,bit16str): 
          """decoding the 7-bit"""  
          bit16str = ''.join((re.findall(r'..', bit16str)[::-1]))    
          r = ''
 
          d = int(bit16str, 16)
          while d:
            r += chr(d & 0x7f)
            d >>= 7
 
          return r

    @classmethod
    def encodingBit8(cls,message):    
        """encoding the 8-bit""" 
        return b2a_hex(message)

    @classmethod
    def decodingBit8(cls,bit8str):    
        """decoding the 8-bit""" 
        return a2b_hex(bit8str)

    @classmethod
    def encodingUCS2(cls,message):    
        """encoding the UCS2""" 
        return b2a_hex(message.encode('utf_16_be')).upper()
    
    @classmethod
    def decodingUCS2(cls,bit16str):    
        """decoding the UCS2
        bit16str:unicode hex code
        """ 
        #return bit16str.decode('utf_16_be')
        return cls.hextoStr(bit16str).decode('utf_16_be')

    @classmethod
    def is_chinese(cls,s):
         """check the string have chinese or not""" 
         rt =False
         if s>= u"\u4e00" and s<= u"\u9fa6":
            rt =True
         return rt

    @classmethod
    def interChangeNo(cls,numberstr):
        """把电话号码每两个数字进行位置交换，位置不足自动补F """ 
        sb=[]
        ss=numberstr

        #if numberstr[0]=='+':            
        #    ss=ss[1:]
            

        if (len(ss) % 2==1):ss += 'F'

        ii=len(ss)/2-1
        i=0
        j=0
        while (i<=ii):
            ff1=ss[j]
            ff2=ss[j+1]
            sb.append(ff2+ff1)
            j+=2
            i+=1

        return ''.join(sb)

    @classmethod
    def getUdlAndUd(cls,dcscode,msgcontent):
        """get udl,ud by msg and dcs code""" 
        udlstr=''
        udstr=''
        if cls.is_chinese(msgcontent):
            if dcscode=='08':
                udstr=cls.encodingUCS2(msgcontent)
                udlstr="%02X" %(len(udstr)/2)                           
        else:
            if dcscode=='00':
                udstr=cls.encodingBit7(msgcontent)
                udlstr="%02X" %(len(msgcontent)) 
                #udlstr=hex(len(msgcontent))
            elif dcscode=='08':
                udstr=cls.encodingUCS2(msgcontent)
                udlstr="%02X" %(len(udstr)/2)    
            else:
                udstr=cls.encodingBit8(msgcontent)
                udlstr="%02X" %(len(udstr)/2)
                #udlstr=hex(len(udstr/2))
        return udlstr+udstr

#convert hex repr to string
    @classmethod
    def hextoStr(cls,s):
        """把16进制字符串转为字符串 """ 
        return s and chr(atoi(s[:2], base=16)) + cls.hextoStr(s[2:]) or ''

    @classmethod
    def exchangeStr(cls,s):
        """把字符串转为16进制字符串 """ 
        lambda c: "%02X" % ord(c) #把字符c转为数字，按再转为16进制的字符串，不满2位补零。
 
        map(lambda c: "%02X" % ord(c), s) #把s作为序列，对每一个字符执行上面的操作，生成十六进制串的列表。
        
        return ''.join(map(lambda c: "%02X" % ord(c), s)) #把上面的列表连起来。

