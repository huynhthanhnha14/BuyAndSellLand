package com.javaweb.converter;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingDTO convertToDto (BuildingEntity entity){
        BuildingDTO result = modelMapper.map(entity, BuildingDTO.class);
        return result;
    }

    public BuildingEntity convertToEntity (BuildingDTO dto){
        BuildingEntity result = modelMapper.map(dto, BuildingEntity.class);
        return result;
    }
}
