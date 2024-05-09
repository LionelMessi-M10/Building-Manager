package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransactionConverter {

	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private CustomerRepository customerRepository;

	public TransactionDTO convertToDTO(TransactionEntity transactionEntity){
		TransactionDTO transactionDTO =  modelMapper.map(transactionEntity, TransactionDTO.class);

		transactionDTO.setCustomerId(transactionEntity.getCustomerEntity().getId());

		return transactionDTO;
	}

	public TransactionEntity convertToEntity(TransactionDTO transactionDTO){
		TransactionEntity transactionEntity = modelMapper.map(transactionDTO, TransactionEntity.class);

		if(transactionDTO.getCustomerId() != null){
			transactionEntity.setCustomerEntity(this.customerRepository.findById(transactionDTO.getCustomerId()).get());
		}

		return transactionEntity;
	}
}
