package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.CustomerDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class CustomerConverter {

	@Autowired
	private ModelMapper modelMapper;

	public CustomerEntity convertToEntity(CustomerDTO customerDTO){
		return modelMapper.map(customerDTO, CustomerEntity.class);
	}

	public CustomerDTO convertToDto(CustomerEntity customerEntity){
		CustomerDTO customerDTO = modelMapper.map(customerEntity, CustomerDTO.class);
		for(Map.Entry<String, String> entry : Status.type().entrySet()){
			if(entry.getKey().equals(customerEntity.getStatus())){
				customerDTO.setStatus(entry.getValue());
				break;
			}
		}
		return customerDTO;
	}
}
