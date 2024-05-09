package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum TransactionType {

	CSKH ("Chăm sóc khách hàng"),
	DDX ("Dẫn đi xem");

	private final String transaction;

	TransactionType(String transaction) {
		this.transaction = transaction;
	}

	public String getStatus() {
		return transaction;
	}

	public static Map<String, String> type(){
		Map<String,String> listType = new TreeMap<>();
		// item.toString() la value
		for(TransactionType item : TransactionType.values()){
			listType.put(item.toString() , item.transaction);
		}
		return listType;
	}
}
