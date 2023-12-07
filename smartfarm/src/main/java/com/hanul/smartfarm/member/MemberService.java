package com.hanul.smartfarm.member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;



@Service
public class MemberService {
	//CRUD
	@Autowired @Qualifier("sql_hanul") private SqlSession sql;
	
	
	//로그인상태유지된 세션의 회원정보 조회
	public List<MemberVO> admin_list() {
		return sql.selectList("member.admin_list");
	}
	
	//운영자 추가
	public int admin_new(MemberVO vo) {
		return sql.insert("member.new",vo);
	}
	
	//운영자 삭제
	public int admin_delete(String userid) {
		return sql.delete("member.delete",userid);
	}
	
	//운영자 수정
	public int admin_update(MemberVO vo) {
		return sql.update("member.update",vo);
	}
	
	//로그인상태유지 정보 삭제
	public int remember_release(HashMap<String, String> map) {
		return sql.insert("member.rememberRelease", map);
	}
	
	//해당 아이디의 회원정보 조회
	public MemberVO member_info( String userid ) {
		
		return sql.selectOne("member.info", userid);
	}
	
}
