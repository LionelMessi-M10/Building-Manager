package com.javaweb.repository;

import com.javaweb.entity.TransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionRepository extends JpaRepository<TransactionEntity, Long> {

	List<TransactionEntity> findByCustomerEntity_IdInAndCode(List<Long> ids, String code);
}
