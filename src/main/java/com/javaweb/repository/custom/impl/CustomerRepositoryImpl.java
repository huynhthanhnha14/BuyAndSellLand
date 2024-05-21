package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.stream.Collectors;

@Repository
@PropertySource("classpath:application.properties")
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public void querySqlJoin(CustomerSearchBuilder builder, StringBuilder join) {

        Long staffId = builder.getStaffId();
        if(staffId != null) {
            join.append(" INNER JOIN assignmentcustomer ON c.id = assignmentcustomer.customerid ");
        }
    }

    public void querySpecial(CustomerSearchBuilder builder, StringBuilder where) {
        String phone = builder.getPhone();
        if(phone!=null){
            where.append(" AND phone = "+phone);
        }
        String fullName = builder.getFullName();
        if(fullName!=null){
            where.append(" AND fullname like '%"+fullName+"%'");
        }
        String email = builder.getEmail();
        if(email!=null){
            where.append(" AND email like '%"+email+"%'");
        }
        Long staffId = builder.getStaffId();
        if(staffId!=null) {
            where.append(" AND assignmentcustomer.staffid = "+ staffId);
        }
    }
    String querySql = "";
    @Override
    public List<CustomerEntity> findAll(CustomerSearchBuilder builder) {
        StringBuilder sql = new StringBuilder("Select distinct c.* from customer as c");
        querySqlJoin(builder, sql);
        sql.append(SystemConstant.ONE_EQUAL_ONE);
        querySpecial(builder, sql);
        sql.append(" AND c.is_active = 1");
        sql.append(" GROUP BY c.id");
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        querySql = sql.toString();
        return query.getResultList();
    }
    @Override
    public List<CustomerEntity> getAllBuilding(Pageable pageable) {
        StringBuilder sql = new StringBuilder(buildQueryFilter())
                .append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        System.out.println("Final query: " + sql.toString());
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    @Override
    public int countTotalItems() {
        String sql = buildQueryFilter();
        Query query = entityManager.createNativeQuery(sql);
        return query.getResultList().size();
    }

    private String buildQueryFilter() {
        return querySql;
    }
}
