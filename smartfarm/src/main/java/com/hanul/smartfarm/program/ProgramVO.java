package com.hanul.smartfarm.program;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProgramVO {

	private int id, notice_id /*체험프로그램연결용*/;
	private String plan_name, plan_time_am, plan_time_pm;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")  private Date plan_start_date,plan_end_date;

}
