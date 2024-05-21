package com.javaweb.entity;

import javax.persistence.*;

@Entity
@Table(name = "assignmentcustomer")
public class AssignmentCustomerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "staffid")
    private UserEntity staffId;

    @ManyToOne
    @JoinColumn(name = "customerid")
    private CustomerEntity customerId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UserEntity getStaffId() {
        return staffId;
    }

    public void setStaffId(UserEntity staffId) {
        this.staffId = staffId;
    }

    public CustomerEntity getCustomerId() {
        return customerId;
    }

    public void setCustomerId(CustomerEntity customerId) {
        this.customerId = customerId;
    }
}
