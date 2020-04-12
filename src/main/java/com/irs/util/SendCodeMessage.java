package com.irs.util;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
/**
 * 发送短信验证
 * @author robb
 *
 */
public class SendCodeMessage {
	 static final String product = "Dysmsapi";
	    static final String domain = "dysmsapi.aliyuncs.com";
	    static final String accessKeyId = "LTAIJg9PHLLBbPFP";   
	    static final String accessKeySecret = "CKWHHZ2vthOjenLj2mvvkBRZyEF28u"; 
		public static SendSmsResponse sendSms(String phone,String nubstr) throws ClientException {
	        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
	        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
	        IAcsClient acsClient = new DefaultAcsClient(profile);
	        SendSmsRequest request = new SendSmsRequest(); 
	        request.setPhoneNumbers(phone);
	        request.setSignName("4v4体育");      
	        request.setTemplateCode("SMS_149102428");   
	        request.setTemplateParam("{\"code\":\""+nubstr+"\"}");
	        request.setOutId("yourOutId");
	        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
	        return sendSmsResponse;
	    }
}
