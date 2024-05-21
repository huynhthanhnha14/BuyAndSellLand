package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum StatusCode {
    Dang_Xu_Ly("Đang xử lý"),
    Da_Xu_Ly("Đã xử lý"),
    Chua_Xu_Ly("Chưa xử lý");

    private final String statusName;

    StatusCode(String statusName) {
        this.statusName = statusName;
    }

    public String getStatusName() {
        return statusName;
    }

    public static Map<String,String> statusType(){
        Map<String,String> listType = new TreeMap<>();
        for(StatusCode item : StatusCode.values()){
            listType.put(item.toString(), item.statusName);
        }
        return listType;
    }
}
