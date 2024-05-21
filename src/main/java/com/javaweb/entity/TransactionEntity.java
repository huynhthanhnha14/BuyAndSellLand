package com.javaweb.entity;

import javax.persistence.*;

@Entity
@Table(name="transaction")
public class TransactionEntity extends BaseEntity {
    private static final long serialVersionUID = -6525302831793188081L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="code")
    private String code;

    @Column(name="note")
    private String note;

    @ManyToOne
    @JoinColumn(name = "staffid")
    private UserEntity staffId;

    @ManyToOne
    @JoinColumn(name = "customerid")
    private CustomerEntity customerId;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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
