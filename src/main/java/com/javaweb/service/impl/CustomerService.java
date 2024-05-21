package com.javaweb.service.impl;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.converter.CustomerConverter;
import com.javaweb.converter.CustomerSearchBuilderConverter;
import com.javaweb.converter.CustomerSearchConverter;
import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.StatusCode;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.model.response.TransactionSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transaction;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CustomerService implements ICustomerService {
    @Autowired
    private CustomerSearchBuilderConverter customerSearchBuilderConverter;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private CustomerSearchConverter customerSearchConverter;
    @Autowired
    private CustomerConverter customerConverter;
    @Autowired
    private TransactionConverter transactionConverter;
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<CustomerSearchResponse> findAll(Map<String, Object> params, Pageable pageable) {
        CustomerSearchBuilder customerSearchBuilder = customerSearchBuilderConverter.toCustomerSearchBuilder(params);
        List<CustomerSearchResponse> result = new ArrayList<>();
        List<CustomerEntity> customerEntites = customerRepository.findAll(customerSearchBuilder);
        for (CustomerEntity item : customerEntites) {
            CustomerSearchResponse customerSearchResponse = customerSearchConverter.toCustomerResponse(item);
            result.add(customerSearchResponse);
        }
        return result;
    }
    @Override
    public StaffResponseDTO listStaff(Long customerId) {
        List<UserEntity> staff = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        CustomerEntity customer = customerRepository.findById(customerId).get();
        List<ResponseDTO> list = new ArrayList<>();
        List<UserEntity> staffAssignmentCustomer = customer.getUsers();
        StaffResponseDTO result = new StaffResponseDTO();
        for (UserEntity it : staff) {
            ResponseDTO staffDTO = new ResponseDTO();
            staffDTO.setFullName(it.getFullName());
            staffDTO.setStaffId(it.getId());
            for (UserEntity it1 : staffAssignmentCustomer) {
                Long staffs = it1.getId();
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
    public CustomerDTO addCustomer(CustomerDTO customerDTO) {
        customerDTO.setStatus(StatusCode.Chua_Xu_Ly.toString());
        CustomerEntity customerEntity = customerConverter.convertToEntity(customerDTO);
        return customerConverter.convertToDto(customerRepository.save(customerEntity));
    }

    @Override
    public void deleteCustomer(Long[] id) {
        List<CustomerEntity> delete = customerRepository.findByIdIn(id);
        for(CustomerEntity item : delete){
            item.setActive(0L);
            customerRepository.save(item);
        }
    }

    @Override
    public int countTotalItems() {
        return customerRepository.countTotalItems();
    }

    @Override
    public CustomerEntity findById(Long id) {
        CustomerEntity customer = customerRepository.findById(id).get();
        return customer;
    }

    @Override
    public List<TransactionEntity> findByIdTransaction(Long id) {
        List<TransactionEntity> transactionEntites = new ArrayList<>();
        List<TransactionEntity> results = transactionRepository.findAll();
        results.forEach(it -> {
            if (it.getCustomerId().getId().equals(id)) {
                transactionEntites.add(transactionRepository.findById(it.getId()).get());
            }
        });

        return transactionEntites;
    }

    @Override
    public void insertOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity result = transactionConverter.convertToEntity(transactionDTO);
        transactionRepository.save(result);
    }



    @Override
    public List<TransactionSearchResponse> displayTransaction(Long id, Pageable pageable) {
        List<TransactionSearchResponse> result = new ArrayList<>();
        List<TransactionEntity> transactionEntites = new ArrayList<>();
        List<TransactionEntity> results = transactionRepository.findAll();
        results.forEach(it -> {
            if (it.getCustomerId().getId().equals(id)) {
                transactionEntites.add(transactionRepository.findById(it.getId()).get());
            }
        });
        for(TransactionEntity item : transactionEntites){
            TransactionSearchResponse transactionSearchResponse = customerSearchConverter.toTransactionResponse(item);
            result.add(transactionSearchResponse);
        }
        return result;
    }

    @Override
    public CustomerDTO insertOrUpdate(CustomerDTO customerDTO) {
        CustomerEntity result = customerConverter.convertToEntity(customerDTO);
        return customerConverter.convertToDto(customerRepository.save(result));
    }
}
