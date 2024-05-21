package com.javaweb.model.response;

import com.javaweb.model.dto.AbstractDTO;

import java.util.Date;

public class TransactionSearchResponse extends AbstractDTO {
    private Long id;
    private String code;
    private String note;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
