package com.hanul.smartfarm.company;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


@Service
public class CompanyService {
	//CRUD
	@Autowired @Qualifier("sql_hanul") private SqlSession sql;
	
	//해당 아이디의 회원정보 조회
	public CompanyVO company_info() {
		
		return sql.selectOne("company.info");
	}
}
