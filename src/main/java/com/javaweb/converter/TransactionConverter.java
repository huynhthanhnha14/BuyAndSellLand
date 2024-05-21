package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class TransactionConverter {
    @Autowired
    private ModelMapper modelMapper;

    public TransactionDTO convertToDto (TransactionEntity entity){
        TransactionDTO result = modelMapper.map(entity, TransactionDTO.class);
        return result;
    }

    public TransactionEntity convertToEntity (TransactionDTO dto){
        TransactionEntity result = modelMapper.map(dto, TransactionEntity.class);
        if(result.getCreatedDate() == null || result.getCreatedBy() == null){
            result.setCreatedDate(dto.getModifiedDate());
            result.setCreatedBy(dto.getModifiedBy());
        }
        return result;
    }
}
