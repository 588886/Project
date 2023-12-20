package com.hanul.smartfarm.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hanul.smartfarm.common.PageVO;

import com.hanul.smartfarm.common.FileVO;

@Service
public class NoticeService {
	@Autowired @Qualifier("sql_hanul") private SqlSession sql;
	
	//CRUD
	//신규 공지글 저장
	public int notice_register( NoticeVO vo ) {
		int insert = sql.insert("notice.register", vo);
		//첨부파일이 있으면 notice_file 에 저장
		if( insert == 1 && vo.getFiles() != null ) {
			sql.insert("notice.fileRegister", vo);
		}
		return insert;
	}
	
	//공지글목록 조회
	public List<NoticeVO> notice_list() {
		return sql.selectList("notice.list");
	}
	public PageVO notice_list(PageVO page) {
		//데이터행의 건수 조회
		page.setTotalList( sql.selectOne("notice.totalCount", page) );
		//해당 페이지의 글목록 조회
		page.setList( sql.selectList("notice.list", page) );
//		List<NoticeVO> list = (List<NoticeVO>)page.getList();
		for(Object vo:page.getList()) {
			NoticeVO notice = (NoticeVO) vo;
			notice.setFiles( sql.selectList("notice.files", notice.getId()) );
		}
		return page;
	}
	
	//선택한 공지글 조회
	public NoticeVO notice_info(int id) {
		NoticeVO vo = sql.selectOne("notice.info", id);
		vo.setFiles( sql.selectList("notice.files", id) );
		/*체험프로그램연결*/
		if( vo.getPlan_id() != 0 ) {
			id = vo.getPlan_id();
			vo.setProgram( sql.selectOne("program.info",  id));
		}
		return vo;
	}

	//선택한 공지글 변경저장
	public int notice_update(NoticeVO vo) {
		//파일이 있으면 notice_file에 저장
		if( vo.getFiles() != null ) {
			sql.insert("notice.fileRegister", vo);
		}	
		return sql.update("notice.update", vo);
	}
	
	//선택한 공지글 삭제
	public int notice_delete(int id) {
		return sql.delete("notice.delete", id);
	}
	
	//선택한 첨부파일정보 조회
	public FileVO notice_file_info(int id) {
		return sql.selectOne("notice.fileInfo", id);
	}
	
	//선택한 공지사항에 첨부된 파일들목록 조회
	public List<FileVO> notice_files_list(int id) {
		return sql.selectList("notice.files", id);
	}
	
	//삭제대상인 첨부파일목록 조회
	public List<FileVO> notice_remove_files(String remove) { // 12,14
		return sql.selectList("notice.removeFiles", remove);
	}
	
	//삭제대상인 첨부파일 삭제
	public int notice_files_delete(String remove) {
		return sql.delete("notice.fileDelete", remove);
	}
}