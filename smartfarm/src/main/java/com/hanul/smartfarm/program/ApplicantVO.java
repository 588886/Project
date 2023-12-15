package com.hanul.smartfarm.program;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Getter @Setter
public class ApplicantVO {
	private int id, headcount, plan_id;
	private String name,phone,email,state,plan_time, application_date;
	private Date create_at ;
}
