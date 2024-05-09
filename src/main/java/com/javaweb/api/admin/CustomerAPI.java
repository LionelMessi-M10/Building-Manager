package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private TransactionService transactionService;

	@GetMapping("/{id}/staffs")
	public ResponseDTO loadStaffs(@PathVariable Long id) {
		ResponseDTO responseDTO = this.customerService.listStaff(id);
		return responseDTO;
	}

	@PostMapping("/assignment")
	public void updateAssignmentBuilding(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
		this.customerService.updateAssignmentCustomer(assignmentCustomerDTO);
	}

	@DeleteMapping("/{ids}")
	public void deleteCustomer(@PathVariable("ids") List<Long> ids){
		customerService.deleteCustomerByIds(ids);
	}

	@PostMapping
	public void createCustomer(@RequestBody CustomerDTO customerDTO){
		this.customerService.saveCustomer(customerDTO);
	}

	@PostMapping("/transaction")
	public void createTransaction(@RequestBody(required = true) TransactionDTO transactionDTO){
		this.transactionService.saveTransaction(transactionDTO);
	}

	@GetMapping("/transaction/{id}")
	public TransactionDTO loadTransaction(@PathVariable Long id){
		TransactionDTO transactionDTO = this.transactionService.findById(id);
		return transactionDTO;
	}
}
