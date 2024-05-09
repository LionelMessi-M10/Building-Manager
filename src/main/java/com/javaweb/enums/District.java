package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum District {
    QUAN_1 ("Quận 1"),
    QUAN_2 ("Quận 2"),
    QUAN_4 ("Quận 4");

    private final String districtName;
    District(String districtName) {
        this.districtName = districtName;
    }

    public String getDistrictName() {
        return districtName;
    }

    public static Map<String, String> type(){
        Map<String,String> listType = new TreeMap<>();
        // item.toString() la value
        for(District item : District.values()){
            listType.put(item.toString() , item.districtName);
        }
        return listType;
    }
}
