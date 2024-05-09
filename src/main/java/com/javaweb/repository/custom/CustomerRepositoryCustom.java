package com.javaweb.repository.custom;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.MyUserDetail;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerRepositoryCustom {
	List<CustomerEntity> searchCustomer(MyUserDetail userDetail, CustomerDTO customerDTO, Pageable pageable);
	Integer totalSearchItems(MyUserDetail user, CustomerDTO customerDTO);
}
