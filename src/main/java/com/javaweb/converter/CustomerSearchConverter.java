package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.enums.StatusCode;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.TransactionSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerSearchConverter {
    @Autowired
    private ModelMapper modelMapper;

    public CustomerSearchResponse toCustomerResponse(CustomerEntity customerEntities){
        CustomerSearchResponse customerSearchResponse = modelMapper.map(customerEntities, CustomerSearchResponse.class);
        if(customerSearchResponse.getActive() == null){
            customerSearchResponse.setActive(1L);
        }
        if(customerSearchResponse.getStatus() == null){
            customerSearchResponse.setStatus(StatusCode.Chua_Xu_Ly.getStatusName());
        }
        else{
            customerSearchResponse.setStatus(StatusCode.valueOf(customerEntities.getStatus()).getStatusName());
        }
        return customerSearchResponse;
    }
    public TransactionSearchResponse toTransactionResponse(TransactionEntity transactionEntities){
        TransactionSearchResponse transactionSearchResponse = modelMapper.map(transactionEntities, TransactionSearchResponse.class);
        return transactionSearchResponse;
    }
}
