package com.hanul.smartfarm.program;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hanul.smartfarm.common.FileVO;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProgramVO {


	private int id;
	private String plan_name, plan_time_am, plan_time_pm;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")  private Date plan_start_date,plan_end_date;

}
