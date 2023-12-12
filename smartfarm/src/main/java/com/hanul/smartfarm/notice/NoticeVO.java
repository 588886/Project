package com.hanul.smartfarm.notice;

import java.sql.Date;
import java.util.List;

import com.hanul.smartfarm.common.FileVO;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NoticeVO {

	private int id, no, indent;
	private String title, content, writer, name;
	private Date writedate;
	private List<FileVO> files;
}
