package com.hanul.smartfarm.program;

import java.sql.Date;
import java.util.List;

import com.hanul.smartfarm.common.FileVO;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProgramVO {


	private int id;
	private String plan_name, plan_time_am, plan_time_pm;
	private Date plan_start_date,plan_end_date;

}
