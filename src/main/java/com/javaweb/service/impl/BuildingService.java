package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.converter.BuildingSearchConverter;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.model.response.TypeCodeResponseDTO;
import com.javaweb.entity.*;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.ListRentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.IBuildingService;
import com.javaweb.utils.FileUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class BuildingService implements IBuildingService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingSearchConverter buildingSearchConverter;
    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    ListRentAreaRepository listRentAreaRepository;
    @Autowired
    AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<BuildingSearchResponse> findAll(Map<String, Object> param, List<String> typeCode) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(param, typeCode);
        List<BuildingSearchResponse> result = new ArrayList<>();
        List<BuildingEntity> buildingEntites = buildingRepository.findAll(buildingSearchBuilder);
        for (BuildingEntity item : buildingEntites) {
            BuildingSearchResponse buildingSearchResponse = buildingSearchConverter.toBuildingResponse(item);
            result.add(buildingSearchResponse);
        }
        return result;
    }



    @Override
    public StaffResponseDTO listStaff(Long buildingId) {
        List<UserEntity> staff = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<ResponseDTO> list = new ArrayList<>();
        List<AssignmentBuildingEntity> staffAssignmentBuilding = building.getBuildingId();
        StaffResponseDTO result = new StaffResponseDTO();
        for (UserEntity it : staff) {
            ResponseDTO staffDTO = new ResponseDTO();
            staffDTO.setFullName(it.getFullName());
            staffDTO.setStaffId(it.getId());
            for (AssignmentBuildingEntity it1 : staffAssignmentBuilding) {
                Long staffs = it1.getStaffId().getId();
                if (staffs.equals(it.getId())) {
                    staffDTO.setChecked("checked");
                    break;
                } else {
                    staffDTO.setChecked("");
                }
            }
            list.add(staffDTO);
        }
        result.setData(list);
        return result;
    }

    @Override
    public String listRentArea(Long id) {
        BuildingEntity building = buildingRepository.findById(id).get();
        List<RentAreaEntity> rentArea = building.getRentAreas();
        //java-8
        String listRentArea = rentArea.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        return listRentArea;
    }


    @Override
    @Transactional
    public void deleteBuilding(Long[] id) {
        for (Long item : id) {
            List<RentAreaEntity> list = listRentAreaRepository.listRentArea(item);
            for (RentAreaEntity item1 : list) {
                listRentAreaRepository.deleteById(item1.getId());
            }
            List<AssignmentBuildingEntity> results = assignmentBuildingRepository.findAll();
            results.forEach(it -> {
                if (it.getBuildingId().getId().equals(item)) {
                    assignmentBuildingRepository.deleteById(it.getId());
                }
            });
            buildingRepository.deleteById(item);
        }


    }

    @Override
    @Transactional
    public void saveBuilding(BuildingEntity buildingEntity) {
        buildingRepository.save(buildingEntity);
    }

    @Override
    @Transactional
    public BuildingDTO insertAndUpdate(BuildingDTO buildingDTO) {
        BuildingEntity result = modelMapper.map(buildingDTO, BuildingEntity.class);
        String[] list = buildingDTO.getRentAreas().split(",");
        if(result.getId()!=null){
            List<RentAreaEntity> listRentArea = listRentAreaRepository.listRentArea(buildingDTO.getId());
            for (RentAreaEntity item1 : listRentArea) {
                listRentAreaRepository.deleteById(item1.getId());
            }
        }
        for (String it : list) {
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setValue(Long.parseLong(it));
            rentAreaEntity.setBuilding(result);
            listRentAreaRepository.save(rentAreaEntity);
        }
        return buildingConverter.convertToDto(buildingRepository.save(result));
    }



    @Override
    public BuildingEntity findById(Long id) {
        BuildingEntity building = buildingRepository.findById(id).get();
        return building;
    }

    @Override
    public TypeCodeResponseDTO listTypeCode(Long id) {
        BuildingEntity building = buildingRepository.findById(id).get();
        List<ResponseDTO> list = new ArrayList<>();
        TypeCodeResponseDTO result = new TypeCodeResponseDTO();
        if (building.getTypeCode() == null) {
            for (TypeCode it : TypeCode.values()) {
                ResponseDTO typeDTO = new ResponseDTO();
                typeDTO.setFullName(it.getCode());
                typeDTO.setTypeCode(it.name());
                typeDTO.setChecked("");
                list.add(typeDTO);
            }

        } else {
            String[] buildingType = building.getTypeCode().split(",");
            for (TypeCode it : TypeCode.values()) {
                ResponseDTO typeDTO = new ResponseDTO();
                typeDTO.setFullName(it.getCode());
                typeDTO.setTypeCode(it.name());
                for (String it1 : buildingType) {
                    if (it1.equals(it.name())) {
                        typeDTO.setChecked("checked");
                        break;
                    } else {
                        typeDTO.setChecked("");
                    }
                }
                list.add(typeDTO);
            }
        }
        result.setData(list);
        return result;
    }

    @Override
    public List<BuildingSearchResponse> getAllBuilding(Map<String, Object> param, List<String> typeCode, Pageable pageable) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(param, typeCode);
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchBuilder);
        List<BuildingSearchResponse> results = new ArrayList<>();
        for (BuildingEntity item : buildingEntities) {
            BuildingSearchResponse buildingSearchResponse = buildingSearchConverter.toBuildingResponse(item);
            results.add(buildingSearchResponse);
        }
        return results;
    }

    @Override
    public int countTotalItems() {
        return buildingRepository.countTotalItems();
    }

}
