package com.javaweb.converter;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class CustomerSearchBuilderConverter {
    public CustomerSearchBuilder toCustomerSearchBuilder(Map<String, Object> mp) {
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            CustomerSearchBuilder buildingSearchBuilder = new CustomerSearchBuilder.customerBuilder()
                    .setFullName(MapUtils.getObject(mp, "fullName", String.class))
                    .setPhone(MapUtils.getObject(mp, "phone", String.class))
                    .setEmail(MapUtils.getObject(mp, "email", String.class))
                    .setStaffId(staffId)
                    .build();
            return buildingSearchBuilder;
        }
        else{
            CustomerSearchBuilder buildingSearchBuilder = new CustomerSearchBuilder.customerBuilder()
                    .setFullName(MapUtils.getObject(mp, "fullName", String.class))
                    .setPhone(MapUtils.getObject(mp, "phone", String.class))
                    .setEmail(MapUtils.getObject(mp, "email", String.class))
                    .setStaffId(MapUtils.getObject(mp, "staffId", Long.class))
                    .build();
            return buildingSearchBuilder;
        }
    }
}
