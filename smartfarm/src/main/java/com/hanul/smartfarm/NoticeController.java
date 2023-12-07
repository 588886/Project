package com.hanul.smartfarm;

import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hanul.smartfarm.common.PageVO;

import com.hanul.smartfarm.notice.NoticeService;

import com.hanul.smartfarm.common.CommonService;

import com.hanul.smartfarm.notice.NoticeVO;

import com.hanul.smartfarm.common.FileVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired private NoticeService service;
	@Autowired private CommonService common;
	
	//공지글 새글저장처리 요청
	@RequestMapping("/register")
	public String register(NoticeVO vo, MultipartFile[] file, HttpServletRequest request) {
		//첨부된 파일들을 NoticeVO의 files에 담기
		vo.setFiles(  common.fileAttach("notice", file, request) );
		//화면에서 입력한 정보를 DB에 신규저장 후 목록화면으로 연결
		service.notice_register(vo);
		return "redirect:list";
	}
	
	
	//공지글 삭제처리 요청
	@RequestMapping("/delete")
	public String delete(int id, HttpServletRequest request, PageVO page) throws Exception{
//		NoticeVO vo = service.notice_info(id);
		//첨부된 파일이 있는 경우: DB삭제+물리적파일 삭제
		List<FileVO> files = service.notice_files_list(id);
		//선택한 공지글을 DB에서 삭제한 후 목록화면으로 연결
		if( service.notice_delete(id)==1 ) {
			//첨부파일이 있으면 물리적파일도 삭제
			for(FileVO vo : files) {
				common.fileDelete(vo.getFilepath(), request);
			}
		}
		return "redirect:list"
				+ "?curPage=" + page.getCurPage()
				+ "&search=" + page.getSearch()
				+ "&keyword=" + URLEncoder.encode( page.getKeyword(), "utf-8" )
				;
	}
	
	
	//공지글 수정저장처리 요청
	@RequestMapping("/update") 
	public String update(NoticeVO vo, MultipartFile file[], PageVO page
						, String remove, HttpServletRequest request) throws Exception {
		//변경전 공지글정보 조회
		//첨부된 파일이 있는 경우
				vo.setFiles( common.fileAttach("notice", file, request) );
				//화면에서 입력한 정보를 DB에 변경저장한 후 정보화면으로 연결
				if( service.notice_update(vo)==1 ) {
					//삭제된 파일이 있으면: DB에서 삭제 + 물리적파일 삭제
					if( ! remove.isEmpty() ) {
						//삭제대상인 파일 정보를 조회해두기
						List<FileVO> files = service.notice_remove_files(remove);
						if( service.notice_files_delete(remove) > 0 ) { // DB에서 삭제
							for(FileVO filevo : files ) {
								common.fileDelete(filevo.getFilepath(), request); //물리적파일 삭제
							}
						}
					}
				}
		return "redirect:info?id=" + vo.getId() 
						+ "&curPage=" + page.getCurPage()
						+ "&search=" + page.getSearch()
						+ "&keyword=" + URLEncoder.encode( page.getKeyword(), "utf-8" )
						;
	}
	
	
	//공지글 수정화면 요청
	@RequestMapping("/modify") 
	public String modify( int id, Model model, PageVO page ) {
		//해당 공지글정보를  DB 에서 조회해와 수정화면에 출력할 수 있도록  Model객체에 담기
		model.addAttribute("vo", service.notice_info(id) );
		model.addAttribute("page", page);
		return "notice/modify";
	}
	
	
	//공지글 새글쓰기 화면 요청
	@RequestMapping("/new")
	public String notice() {
		return "notice/register";
	}
	
	
	
	//첨부파일 다운로드처리 요청
	@ResponseBody @RequestMapping(value="/download", produces="text/html; charset=utf-8")
	public String download( int id, HttpServletRequest request
								, HttpServletResponse response ) throws Exception{
		//선택한 글의 첨부파일을 저장된 위치(서버)에서 가져와 클라이언트에 저장하기
		NoticeVO vo = service.notice_info(id);
		boolean download 
			= common.fileDownload( vo.getFilename(), vo.getFilepath(), request, response);
		if( download ) return null;
		else {
			//다운로드할 파일이 물리적으로 존재하지 않는 경우 처리
			StringBuffer msg = new StringBuffer("<script>");
			msg.append(" alert('다운로드할 파일이 없습니다!!'); history.go(-1) ");
			msg.append("</script>");
			return msg.toString();
		}
	}
	
	//파일을 읽어들여 binary로 변환해 응답하기
		@ResponseBody @RequestMapping( value="/convertFile"
							, produces= MediaType.APPLICATION_OCTET_STREAM_VALUE)
		public byte[] convert(String file, HttpServletRequest request) throws Exception  {
			//http://192.168.0.49:80/upload/board/2023/10/26/423b33e6-bfe7-4731-96da-5e0cfd9d7c72_pp.jpg
			//d://app/upload/board/....
			//http://192.168.0.49:80/iot/upload/board/2023/10/26/423b33e6-bfe7-4731-96da-5e0cfd9d7c72_pp.jpg
			//d://app/iot/upload/board/....
			file = "d://app" + request.getContextPath() + file.substring( file.indexOf("/upload") );
			//해당 위치의 물리적인 파일을 읽어들여 byte로 변환
			return Files.readAllBytes( Paths.get( file ) );
		}
		
	//선택한 공지글 정보화면 요청
	@RequestMapping("/info")
	public String info(int id, Model model, PageVO page) {
		//조회수증가처리
		
		//선택한 공지글 정보를 DB에서 조회해와 화면에 출력할 수 있도록 Model객체에 담기
		model.addAttribute("page", page);
	 	model.addAttribute("vo",  service.notice_info(id) );
	 	model.addAttribute("crlf", "\r\n"); 
		return "notice/info";
	}
	
	
	//공지글 목록화면 요청
	@RequestMapping("/list")
	public String list(Model model, HttpSession session, PageVO page) {
		//---------------------------------
		//임시로 관리자로 로그인해두기 - 나중에 삭제
//		String userid = "park2023", userpw = "Park2023";
//		String userid = "hong2023", userpw = "Hong2023";
		/*
		 * String userid = "admin1", userpw = "0000"; MemberVO user =
		 * member.member_info(userid); if( user!=null && pwEncoder.matches(userpw,
		 * user.getUserpw()) ) { session.setAttribute("loginInfo", user); }
		 */
		//---------------------------------
		
		session.setAttribute("category", "no");
		//DB에서 공지글목록을 조회해와 화면에 출력할 수 있도록 Model객체에 담기
		//model.addAttribute("list", service.notice_list() ); //전체 목록조회
		model.addAttribute("page", service.notice_list(page)); //페이지처리된 목록조회
		return "notice/list";
	}
	
	
}
