package com.javaweb.service;

import com.javaweb.model.dto.TransactionDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TransactionService {

	List<TransactionDTO> findByCustomerIdAndCode(Long customerId, String code);
	void saveTransaction(TransactionDTO transactionDTO);

	TransactionDTO findById(Long id);
}
