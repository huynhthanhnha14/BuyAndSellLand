package com.javaweb.model.dto;

import java.util.List;

public class AssignmentCustomerDTO {
    private Long id;
    private Long[] staffId ;
    private Long customerId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long[] getStaffId() {
        return staffId;
    }

    public void setStaffId(Long[] staffId) {
        this.staffId = staffId;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }
}
