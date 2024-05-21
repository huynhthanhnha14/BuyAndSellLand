package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.StatusCode;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.repository.CustomerRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private CustomerRepository customerRepository;

    public CustomerDTO convertToDto (CustomerEntity entity){
        CustomerDTO result = modelMapper.map(entity, CustomerDTO.class);
        if(result.getCreatedBy().equals("")){
            entity.setCreatedDate(entity.getModifiedDate());
            entity.setCreatedBy(entity.getModifiedBy());
            customerRepository.save(entity);
        }
        return result;
    }

    public CustomerEntity convertToEntity (CustomerDTO dto){
        CustomerEntity result = modelMapper.map(dto, CustomerEntity.class);
        result.setActive(1L);
        return result;
    }
}
