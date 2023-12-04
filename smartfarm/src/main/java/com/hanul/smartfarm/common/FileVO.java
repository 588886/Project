package com.hanul.smartfarm.common;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class FileVO {
	private int id, parent_id;
	private String filename, filepath;

}
