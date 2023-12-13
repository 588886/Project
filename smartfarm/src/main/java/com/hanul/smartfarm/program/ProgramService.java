package com.hanul.smartfarm.program;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hanul.smartfarm.common.PageVO;
import com.hanul.smartfarm.notice.NoticeVO;

@Service
public class ProgramService {
	@Autowired @Qualifier("sql_hanul") private SqlSession sql;
	
	//공지글목록 조회
		public List<ProgramVO> program_list() {
			return sql.selectList("program.list");
		}
		public PageVO program_list(PageVO page) {
			//데이터행의 건수 조회
//			page.setTotalList( sql.selectOne("program.totalCount", page) );
			//해당 페이지의 글목록 조회
			page.setList( sql.selectList("program.list", page) );
//			List<NoticeVO> list = (List<NoticeVO>)page.getList();
			
			return page;
		}
}
