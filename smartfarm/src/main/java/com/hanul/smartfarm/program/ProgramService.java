package com.hanul.smartfarm.program;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.hanul.smartfarm.common.PageVO;
import com.hanul.smartfarm.member.MemberVO;
import com.hanul.smartfarm.notice.NoticeVO;



@Service
public class ProgramService {
	@Autowired @Qualifier("sql_hanul") private SqlSession sql;
	

	
	public PageVO program_list(PageVO page) {
		//데이터행의 건수 조회
//			page.setTotalList( sql.selectOne("program.totalCount", page) );
		//해당 페이지의 글목록 조회
		page.setList( sql.selectList("program.list", page) );
//			List<NoticeVO> list = (List<NoticeVO>)page.getList();
		
		return page;
	}
	
	//프로그램 추가
	public int addprogram(ProgramVO vo) {
		return sql.insert("program.newprogram",vo);
	}
	
	//프로그램 삭제
	public int program_delete(int id) {
		return sql.delete("program.deleteprogram",id);
	}
	
	//프로그램 수정
	public int modify(ProgramVO vo) {
		return sql.update("program.updateprogram",vo);
	}

	//신규 체험신청 저장
	public int program_application( ProgramVO vo ) {
		return sql.insert("program.application", vo);
	}

	//체험프로그램글목록 조회
	public List<ProgramVO> program_list() {
		return sql.selectList("program.list");
	}
	//체험프로그램글목록 조회
	public ProgramVO program_info(int id) {
		return sql.selectOne("program.info", id);
	}

	//체험프로그램글목록 조회
	public int application_headcount(ApplicantVO vo) {
//					vo.setApplication_date("2023-12-18");
		return sql.selectOne("program.applicant_headcount", vo);
	}
	
	//체험인원 조회
	public List<ApplicantVO> personnel_list() {
		return sql.selectList("program.personnel_list");
	}

}
