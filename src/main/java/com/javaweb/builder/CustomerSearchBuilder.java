package com.javaweb.builder;

public class CustomerSearchBuilder {
    private String fullName;
    private String phone;
    private String email;
    private Long staffId;

    private CustomerSearchBuilder(customerBuilder builder) {
        this.fullName = builder.fullName;
        this.phone = builder.phone;
        this.email = builder.email;
        this.staffId = builder.staffId;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public Long getStaffId() {
        return staffId;
    }


    public static class customerBuilder{
        private String fullName;
        private String phone;
        private String email;
        private Long staffId;

        public customerBuilder setFullName(String fullName) {
            this.fullName = fullName;
            return this;
        }

        public customerBuilder setPhone(String phone) {
            this.phone = phone;
            return this;
        }

        public customerBuilder setEmail(String email) {
            this.email = email;
            return this;
        }

        public customerBuilder setStaffId(Long staffId) {
            this.staffId = staffId;
            return this;
        }


        public CustomerSearchBuilder build() {
            return new CustomerSearchBuilder(this);
        }


    }
}
