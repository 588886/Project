package com.hanul.smartfarm.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.json.JSONObject;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.hanul.smartfarm.member.MemberService;
import com.hanul.smartfarm.member.MemberVO;

@Service
public class CommonService {

	
	
	
	
	// 웹, 안드로이드, IoT 에서 공통으로 사용할 수 있는 로그인인증된 사용자 정보
	public MemberVO loginUser( MemberService memberService, MemberVO dto) {
		MemberVO user = memberService.member_info(dto.getUserid());
		boolean result = user==null ? false : true;
		
		return dto.getUserpw().equals(user.getUserpw()) ? user : null;
	}
	
	// 웹, 안드로이드, IoT 에서 공통으로 사용할 수 있는 로그인인증
	public String loginCheck( MemberService memberService, MemberVO dto, BCryptPasswordEncoder pwEncoder ) {
		MemberVO user = memberService.member_info(dto.getUserid());
		boolean result = user==null ? false : true;
		if( result ) {
			result = pwEncoder.matches(dto.getUserpw(), user.getUserpw());
		}
		return result == true ? "success" : "fail";
	}
	
	public MemberVO loginInfo(HttpSession session) {
		return (MemberVO)session.getAttribute("loginInfo");
	}
	
	public String requestAPI( String apiURL, String property ) {
		String response = "";
	    try {
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("Authorization", property);
	        
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        if(responseCode==200) { // 정상 호출
	          br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
	        } else {  // 에러 발생
	          br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
	        }
	        String inputLine;
	        StringBuffer res = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	          res.append(inputLine);
	        }
	        br.close();
	        response = res.toString();
	        if(responseCode==200) {
	          System.out.println(res.toString());
	        }
	      } catch (Exception e) {
	        System.out.println(e);
	      }		
		
		return response;
	}
	
	public String requestAPI( String apiURL ) {
		String response = "";
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "utf-8"));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			response = res.toString();
			if(responseCode==200) {
				System.out.println(res.toString());
			}
		} catch (Exception e) {
			System.out.println(e);
		}		
		
		return response;
	}
	
	
	
	
	
	private String EMAIL_ADDRESS = "itstudydev@naver.com";
//	private String EMAIL_ADDRESS = "ojink2@gmail.com";
	
	private void emailServer( HtmlEmail email ) {
		String id = EMAIL_ADDRESS.substring(0, EMAIL_ADDRESS.indexOf("@"));
		String service = EMAIL_ADDRESS.substring( EMAIL_ADDRESS.indexOf("@")+1 );
		//gmail 인 경우 앱비밀번호(16자리), 그 외는 해당 이메일아이디에 대한 비밀번호
		String pw = service.contains("gmail") ? "mkevmvbhdsyzixbn" : "Itstudy10102";
		
		email.setDebug(true);
		email.setCharset("utf-8");
		
		//이메일전송 서버 지정
		email.setHostName("smtp." + service);
		
		//아이디/비번 입력하여 로그인하기: 관리자의 이메일
		email.setAuthentication( id , pw );
		email.setSSLOnConnect(true);
	}
	
	
	
	//임시비번 이메일로 보내기
	public boolean sendPassword( MemberVO vo, String pw ) {
		boolean send = true;
		
		HtmlEmail email = new HtmlEmail();
		emailServer( email ); //이메일서버에 연결하기
		
		try {
			email.setFrom( EMAIL_ADDRESS, "e-IoT 융합SW 관리자"); //이메일 전송자 지정
			email.addTo( vo.getEmail(), vo.getName() ); //이메일 수신자 지정
			
			//이메일 제목
			email.setSubject( "e-IoT 로그인 임시 비밀번호 발급" );
			
			//이메일 내용
			StringBuffer msg = new StringBuffer();
			msg.append( "<h3>[").append( vo.getName() )
								.append("]님 임시 비밀번호가 발급되었습니다</h3>" );
			
			msg.append("<div>아이디: ").append( vo.getUserid() ).append("</div>");
			msg.append("<div>임시 비밀번호: <strong>").append( pw ).append("</strong></div>");
			msg.append("<hr><div>발급된 임시 비밀번호로 로그인 후 비밀번호를 변경하세요</div>");
			email.setHtmlMsg( msg.toString() );
			
			email.send(); //보내기버튼 클릭
			
		}catch(Exception e) {
			send = false;
		}
		return send;
	}
	
	public String appURL( HttpServletRequest request ) {
		StringBuffer url = new StringBuffer( "http://" );
		url.append( request.getServerName() ).append( ":" ); // http://localhost:
		url.append( request.getServerPort() );  			 // http://localhost:80
		url.append( request.getContextPath() );				 // http://localhost:80/iot
		return url.toString();
	}
	
	public Map<String, Object> requestAPIInfo(String url) {
		JSONObject json= new JSONObject(requestAPI(url));
		json=json.getJSONObject("response");
		return json.getJSONObject( "body" ).toMap();
	}
	
}
