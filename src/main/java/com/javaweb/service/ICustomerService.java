package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.model.response.TransactionSearchResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<CustomerSearchResponse> findAll(Map<String, Object> params, Pageable pageable);
    int countTotalItems();
    CustomerEntity findById(Long id);
    List<TransactionEntity> findByIdTransaction(Long id);
    CustomerDTO insertOrUpdate(CustomerDTO customerDTO);
    void insertOrUpdateTransaction(TransactionDTO transactionDTO);
    List<TransactionSearchResponse> displayTransaction(Long id, Pageable pageable);
    StaffResponseDTO listStaff(Long customerId);
    CustomerDTO addCustomer(CustomerDTO customerDTO);
    void deleteCustomer(Long[] id);
}
