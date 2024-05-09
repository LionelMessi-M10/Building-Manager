package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

@Repository
public class CustomerRepositoryCustomImpl implements CustomerRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;
	@Autowired
	private UserRepository userRepository;

	public void joinTable(MyUserDetail userDetail, CustomerDTO customerDTO, StringBuilder sql) {
		if(customerDTO.getManagementStaff() != null && !customerDTO.getManagementStaff().isEmpty()){
			sql.append(" INNER JOIN assignmentcustomer ac ON ac.customerid = c.id ");
		}
		Collection<GrantedAuthority> authorities = userDetail.getAuthorities();
		String authorityString = "";
		Iterator<GrantedAuthority> iterator = authorities.iterator();
		if (iterator.hasNext()) {
			authorityString = iterator.next().toString();
		}
		if(authorityString.equals("ROLE_STAFF")){
			if(customerDTO.getManagementStaff() == null || customerDTO.getManagementStaff().isEmpty()){
				sql.append(" INNER JOIN assignmentcustomer ac ON ac.customerid = c.id ");
			}
			sql.append(" INNER JOIN user u ON u.id = ac.staffid ");
		}
	}

	public void querySpecial(MyUserDetail userDetail, CustomerDTO customerDTO, StringBuilder sql) {
		if(customerDTO.getManagementStaff() != null && !customerDTO.getManagementStaff().isEmpty()){
			sql.append(" AND ac.staffid = " + customerDTO.getManagementStaff());
		}
		Collection<GrantedAuthority> authorities = userDetail.getAuthorities();
		String authorityString = "";
		Iterator<GrantedAuthority> iterator = authorities.iterator();
		if (iterator.hasNext()) {
			authorityString = iterator.next().toString();
		}
		if(authorityString.equals("ROLE_STAFF")){
			sql.append(" AND u.username LIKE '%" + userDetail.getUsername() + "%' ");
		}
	}

	public void queryNormal(CustomerDTO customerDTO, StringBuilder sql) {
		if(customerDTO.getName() != null && !customerDTO.getName().isEmpty()){
			sql.append(" AND c.fullname LIKE '%" + customerDTO.getName() + "%' ");
		}
		if(customerDTO.getEmail() != null && !customerDTO.getEmail().isEmpty()){
			sql.append(" AND c.email LIKE '%" + customerDTO.getEmail() + "%' ");
		}
		if(customerDTO.getCustomerPhone() != null && !customerDTO.getCustomerPhone().isEmpty()){
			sql.append(" AND c.phone LIKE '%" + customerDTO.getCustomerPhone() + "%' ");
		}
	}

	@Override
	public List<CustomerEntity> searchCustomer(MyUserDetail userDetail, CustomerDTO customerDTO, Pageable pageable) {
		StringBuilder sql = new StringBuilder("SELECT c.* FROM customer c ");

		joinTable(userDetail, customerDTO, sql);

		StringBuilder where = new StringBuilder(" WHERE 1 = 1 AND c.is_active = 1 ");
		querySpecial(userDetail, customerDTO, where);
		queryNormal(customerDTO, where);

		sql.append(where);

		sql.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
				.append(" OFFSET ").append(pageable.getOffset());


		Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);

		return query.getResultList();
	}

	@Override
	public Integer totalSearchItems(MyUserDetail user, CustomerDTO customerDTO) {
		StringBuilder sql = new StringBuilder("SELECT c.* FROM customer c ");

		joinTable(user, customerDTO, sql);

		StringBuilder where = new StringBuilder(" WHERE 1 = 1 AND c.is_active = 1 ");
		querySpecial(user, customerDTO, where);
		queryNormal(customerDTO, where);

		sql.append(where);

		Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);


		return query.getResultList().size();
	}
}
