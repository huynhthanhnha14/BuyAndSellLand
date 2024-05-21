package com.javaweb.converter;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.entity.AssignmentBuildingEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AssignmentBuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    public AssignmentBuildingDTO convertToDto (AssignmentBuildingEntity entity){
        AssignmentBuildingDTO result = modelMapper.map(entity, AssignmentBuildingDTO.class);
        return result;
    }

    public AssignmentBuildingEntity convertToEntity (AssignmentBuildingDTO dto){
        AssignmentBuildingEntity result = modelMapper.map(dto, AssignmentBuildingEntity.class);
        return result;
    }
}
