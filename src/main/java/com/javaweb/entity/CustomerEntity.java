package com.javaweb.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "customer")
public class CustomerEntity extends BaseEntity{

	@Column(name = "fullname")
	private String name;

	@Column(name = "email")
	private String email;

	@Column(name = "phone")
	private String customerPhone;

	@Column(name = "companyname")
	private String companyName;

	@Column(name = "demand")
	private String demand;

	@Column(name = "status")
	private String status;

	@Column(name = "is_active")
	private Integer isActive;

	@ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST})
	@JoinTable(name = "assignmentcustomer",
			  joinColumns = @JoinColumn(name = "customerid", nullable = false),
			  inverseJoinColumns = @JoinColumn(name = "staffid", nullable = false))
	private List<UserEntity> staffs = new ArrayList<>();

	@OneToMany(mappedBy = "customerEntity", fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST}, orphanRemoval = true)
	private List<TransactionEntity> transactions = new ArrayList<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getDemand() {
		return demand;
	}

	public void setDemand(String demand) {
		this.demand = demand;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public List<UserEntity> getStaffs() {
		return staffs;
	}

	public void setStaffs(List<UserEntity> staffs) {
		this.staffs = staffs;
	}

	public List<TransactionEntity> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<TransactionEntity> transactions) {
		this.transactions = transactions;
	}
}
