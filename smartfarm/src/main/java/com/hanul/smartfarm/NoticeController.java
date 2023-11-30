package com.hanul.smartfarm;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanul.smartfarm.common.PageVO;

import com.hanul.smartfarm.notice.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired private NoticeService service;
	//선택한 공지글 정보화면 요청
		@RequestMapping("/info")
		public String info(int id, Model model, PageVO page) {
			//조회수증가처리
			service.notice_read(id);
			//선택한 공지글 정보를 DB에서 조회해와 화면에 출력할 수 있도록 Model객체에 담기
			model.addAttribute("page", page);
		 	model.addAttribute("vo",  service.notice_info(id) );
		 	model.addAttribute("crlf", "\r\n"); 
			return "notice/info";
		}
		
		
		//공지글 목록화면 요청
		@RequestMapping("/list")
		public String list(Model model, HttpSession session, PageVO page) {

			
			session.setAttribute("category", "no");
			//DB에서 공지글목록을 조회해와 화면에 출력할 수 있도록 Model객체에 담기
			//model.addAttribute("list", service.notice_list() ); //전체 목록조회
			model.addAttribute("page", service.notice_list(page)); //페이지처리된 목록조회
			return "notice/list";
		}
}
