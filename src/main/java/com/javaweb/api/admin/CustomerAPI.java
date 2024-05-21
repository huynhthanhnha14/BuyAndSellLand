package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.impl.CustomerService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService userService;

    @GetMapping("/{customerId}/staffs")
    public StaffResponseDTO loadStaff(@PathVariable("customerId") Long id) {
        return customerService.listStaff(id);
    }

    @PostMapping
    public void addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO) {
        customerService.insertOrUpdate(customerDTO);
    }

    @PostMapping("/transaction")
    public void addOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO){
        customerService.insertOrUpdateTransaction(transactionDTO);
    }

    @PutMapping("/{id}/assignment")
    public void update(@PathVariable("id") Long id, @RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        userService.updateCustomer(id, assignmentCustomerDTO);
    }
    @PostMapping("/contact")
    public void addCustomer(@RequestBody CustomerDTO customerDTO){
        customerService.addCustomer(customerDTO);
    }

    @DeleteMapping
    public void deleteBuilding(@RequestBody Long[] buildingId) {
        customerService.deleteCustomer(buildingId);
    }
}
