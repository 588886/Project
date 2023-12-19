package com.hanul.smartfarm.program;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hanul.smartfarm.common.PageVO;


@Service
public class ProgramService {
	@Autowired @Qualifier("sql_hanul") private SqlSession sql;
	
		//신규 체험신청 저장
		public int program_application( ApplicantVO vo ) {
			return sql.insert("program.application", vo);
		}
	
		//체험프로그램글목록 조회
		public List<ProgramVO> program_list() {
			return sql.selectList("program.list");
		}
		public PageVO program_list(PageVO page) {
			//데이터행의 건수 조회
			page.setTotalList( sql.selectOne("program.totalCount", page) );
			//해당 페이지의 글목록 조회
			page.setList( sql.selectList("program.list", page) );

			return page;
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
}
