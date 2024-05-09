package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum Status {

	DANG_XU_LY ("Đang xử lý"),
	DA_XU_LY ("Đã xử lý"),
	CHUA_XU_LY ("Chưa xử lý");

	private final String status;

	Status(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	public static Map<String, String> type(){
		Map<String,String> listType = new TreeMap<>();
		// item.toString() la value
		for(Status item : Status.values()){
			listType.put(item.toString() , item.status);
		}
		return listType;
	}
}
