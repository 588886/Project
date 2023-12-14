package com.hanul.smartfarm.program;

import java.sql.Date;
import java.util.List;

import com.hanul.smartfarm.common.FileVO;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProgramVO {

	private int id, headcount;
	private String name,phone,email,state,plan_name;
	private Date plan_start_date,plan_end_date ,create_at;
}
