package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum TransactionCode {
    CSKH ("Chăm sóc khách hàng"),
    DDX ("Dẫn đi xem");

    private final String transactionName;

    TransactionCode(String transactionName) {
        this.transactionName = transactionName;
    }

    public String getTransactionName() {
        return transactionName;
    }
    public static Map<String,String> transactionType(){
        Map<String,String> listType = new TreeMap<>();
        for(TransactionCode item : TransactionCode.values()){
            listType.put(item.toString() , item.transactionName);
        }
        return listType;
    }
}
