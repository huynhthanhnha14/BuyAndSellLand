package com.javaweb.model.dto;

import java.util.List;

public class AssignmentBuildingDTO {
    private Long id;
    private List<String> staffId ;
    private Long buildingId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<String> getStaffId() {
        return staffId;
    }

    public void setStaffId(List<String> staffId) {
        this.staffId = staffId;
    }

    public Long getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(Long buildingId) {
        this.buildingId = buildingId;
    }
}
