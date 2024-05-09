package com.javaweb.enums;


import java.util.*;

public enum TypeCode {
    TANG_TRET ("Tầng Trệt "),
    NGUYEN_CAN ("Nguyên Căn "),
    NOI_THAT ("Nội Thất ");

    private final String name;

    TypeCode(String name) {
        this.name = name;
    }

    public String getCode() {
        return name;
    }

    public static Map<String,String> type(){
        Map<String,String> listType = new HashMap<>();
        for(TypeCode item : TypeCode.values()){
            listType.put(item.toString() , item.name);
        }
        return listType;
    }
}
