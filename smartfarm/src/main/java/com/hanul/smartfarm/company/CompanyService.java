package com.hanul.smartfarm.company;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


@Service
public class CompanyService {
	//CRUD
	@Autowired @Qualifier("sql_hanul") private SqlSession sql;
	
	//회사 정보 조회
	public CompanyVO company_info() {
		
		return sql.selectOne("company.info");
	}
	
	//회사 정보 수정
	public int company_update(CompanyVO vo) {
		
		return sql.update("company.update",vo);
	}
}
