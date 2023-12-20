package com.hanul.smartfarm.notice;

import java.sql.Date;
import java.util.List;

import com.hanul.smartfarm.common.FileVO;
import com.hanul.smartfarm.program.ProgramVO;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NoticeVO {

	private int id, no, indent, plan_id ;
	private String title, content, writer, name;
	private Date writedate;
	private List<FileVO> files;
	private ProgramVO program /*체험프로그램연결용*/;
}
