package com.javaweb.controller.admin;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.enums.Status;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.service.TransactionService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "customerControllerOfAdmin")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private IUserService userService;
	@Autowired
	private TransactionService transactionService;

	@PostMapping("/lien-he")
	public String saveCustomer(@ModelAttribute("model")CustomerDTO customerDTO){
		this.customerService.saveCustomer(customerDTO);
		return "redirect:/lien-he";
	}

	@GetMapping("/admin/customer-list")
	public ModelAndView customerList(@ModelAttribute("modelSearch") CustomerDTO customerDTO, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/customer/list");

		DisplayTagUtils.of(request, customerDTO);
		MyUserDetail user = SecurityUtils.getPrincipal();
		List<CustomerDTO> customers = this.customerService.searchCustomer(user, customerDTO, PageRequest.of(customerDTO.getPage() - 1, customerDTO.getMaxPageItems()));

		customerDTO.setListResult(customers);
		customerDTO.setTotalItems(this.customerService.totalItems(user, customerDTO));

		List<String> roles = SecurityUtils.getAuthorities();

		mav.addObject("listStaff", userService.getStaffs());
		mav.addObject("customerList", customers);
		mav.addObject("role", SecurityUtils.getAuthorities().get(0));

		return mav;
	}

	@GetMapping("/admin/customer-edit-{id}")
	public ModelAndView customerEdit(@PathVariable("id") Long id){
		ModelAndView mav = new ModelAndView("admin/customer/edit");

		CustomerDTO customerDTO = this.customerService.findById(id);
		List<TransactionDTO> CSKH = this.transactionService.findByCustomerIdAndCode(id, "CSKH");
		List<TransactionDTO> ddx = this.transactionService.findByCustomerIdAndCode(id, "DDX");

		mav.addObject("customerEdit", customerDTO);
		mav.addObject("transactionType", TransactionType.type());
		mav.addObject("cskh", CSKH);
		mav.addObject("ddx", ddx);
		mav.addObject("statuses", Status.type());

		return mav;
	}

	@GetMapping("/admin/customer-edit")
	public ModelAndView buildingAdd(@ModelAttribute("customerEdit") CustomerDTO customerDTO){
		ModelAndView mav = new ModelAndView("admin/customer/edit");

		mav.addObject("statuses", Status.type());

		return mav;
	}
}
