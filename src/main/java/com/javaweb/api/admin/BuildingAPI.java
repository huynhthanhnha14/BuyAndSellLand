package com.javaweb.api.admin;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.model.response.TypeCodeResponseDTO;
import com.javaweb.service.impl.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;

    @PostMapping
    public BuildingDTO createAndUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        return buildingService.insertAndUpdate(buildingDTO);
    }

    @GetMapping("/{buildingId}/staffs")
    public StaffResponseDTO loadStaff(@PathVariable("buildingId") Long id) {
        return buildingService.listStaff(id);
    }

    @GetMapping("/{buildingId}/typeCodes")
    public TypeCodeResponseDTO loadTypeCode(@PathVariable("buildingId") Long id) {
        return buildingService.listTypeCode(id);
    }

    @DeleteMapping
    public void deleteBuilding(@RequestBody Long[] buildingId) {
        buildingService.deleteBuilding(buildingId);
    }

}
