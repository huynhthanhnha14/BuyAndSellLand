package com.javaweb.service;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.model.response.TypeCodeResponseDTO;
import com.javaweb.entity.BuildingEntity;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    List<BuildingSearchResponse> findAll(Map<String, Object> params, List<String> rentType);
    StaffResponseDTO listStaff(Long buildingId);
    String listRentArea(Long id);
    void deleteBuilding(Long[] id);
    void saveBuilding(BuildingEntity buildingEntity);
    BuildingDTO insertAndUpdate(BuildingDTO buildingDTO);
    BuildingEntity findById(Long id);
    TypeCodeResponseDTO listTypeCode(Long id);
    List<BuildingSearchResponse> getAllBuilding(Map<String, Object> param, List<String> typeCode,Pageable pageable);
    int countTotalItems();
}
