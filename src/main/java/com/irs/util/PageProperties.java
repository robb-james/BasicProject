package com.irs.util;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageProperties {

	private int page;
	private int pageSize;
	private int sort =1;
	private String sortFiled = "id";

}
