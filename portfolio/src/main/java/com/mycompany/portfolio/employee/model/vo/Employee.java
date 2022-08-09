package com.mycompany.portfolio.employee.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import com.mycompany.portfolio.member.model.vo.Member;

public class Employee extends Member{

	private String empNo;//사원번호
	private String deptCode;//부서코드
	private String jobCode;//직급코드
	private String salaryLevel;//급여등급
	private Integer salary;//급여
	private Integer bonus;//보너스율
	private String managerId;//관리자사번
	private String hireDate;//입사일
	private Timestamp entDate;//퇴사일
	private String entYn;//퇴직여부
	private Timestamp empCreateDate;//등록일
	
	public Employee() {}

	public Employee(String id, String name, String password, String no, String email, String phone, String empNo, String deptCode,
			String jobCode, String salaryLevel, Integer salary, Integer bonus, String managerId, String hireDate,
			Timestamp entDate, String entYn, Timestamp empCreateDate) {
		super(id, name, password, no, email, phone);
		this.empNo = empNo;
		this.deptCode = deptCode;
		this.jobCode = jobCode;
		this.salaryLevel = salaryLevel;
		this.salary = salary;
		this.bonus = bonus;
		this.managerId = managerId;
		this.hireDate = hireDate;
		this.entDate = entDate;
		this.entYn = entYn;
		this.empCreateDate = empCreateDate;
	}
	
	public Employee(String empNo, String deptCode) {
		this.empNo= empNo;
		this.deptCode = deptCode;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public String getSalaryLevel() {
		return salaryLevel;
	}

	public void setSalaryLevel(String salaryLevel) {
		this.salaryLevel = salaryLevel;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public Integer getBonus() {
		return bonus;
	}

	public void setBonus(Integer bonus) {
		this.bonus = bonus;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public Timestamp getEntDate() {
		return entDate;
	}

	public void setEntDate(Timestamp entDate) {
		this.entDate = entDate;
	}

	public String getEntYn() {
		return entYn;
	}

	public void setEntYn(String entYn) {
		this.entYn = entYn;
	}

	public Timestamp getEmpCreateDate() {
		return empCreateDate;
	}

	public void setEmpCreateDate(Timestamp empCreateDate) {
		this.empCreateDate = empCreateDate;
	}

	@Override
	public String toString() {
		return "Employee [empNo=" + empNo + ", deptCode=" + deptCode + ", jobCode=" + jobCode + ", salaryLevel="
				+ salaryLevel + ", salary=" + salary + ", bonus=" + bonus + ", managerId=" + managerId + ", hireDate="
				+ hireDate + ", entDate=" + entDate + ", entYn=" + entYn + ", empCreateDate=" + empCreateDate + "]";
	}
	
	
}
