package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	private TransactionRepository transactionRepository;
	@Autowired
	private TransactionConverter transactionConverter;

	@Override
	public List<TransactionDTO> findByCustomerIdAndCode(Long customerId, String code) {
		List<Long> ids = new ArrayList<>();
		ids.add(customerId);
		List<TransactionEntity> transactionEntities = this.transactionRepository.findByCustomerEntity_IdInAndCode(ids, code);

		List<TransactionDTO> transactionDTOS = new ArrayList<>();

		for (TransactionEntity transactionEntity : transactionEntities) {
			transactionDTOS.add(this.transactionConverter.convertToDTO(transactionEntity));
		}
		return transactionDTOS;
	}

	@Transactional
	@Override
	public void saveTransaction(TransactionDTO transactionDTO) {
		TransactionEntity transactionEntity = new TransactionEntity();

		if(transactionDTO.getId() != null){
			transactionEntity = this.transactionRepository.findById(transactionDTO.getId()).get();
			transactionEntity.setNote(transactionDTO.getNote());
		}
		else transactionEntity = this.transactionConverter.convertToEntity(transactionDTO);

		this.transactionRepository.save(transactionEntity);
	}

	@Override
	public TransactionDTO findById(Long id) {
		return this.transactionConverter.convertToDTO(this.transactionRepository.findById(id).get());
	}

}
