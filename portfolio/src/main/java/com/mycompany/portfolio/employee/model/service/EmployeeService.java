package com.mycompany.portfolio.employee.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.mycompany.portfolio.employee.model.vo.Employee;
import com.mycompany.portfolio.employee.model.vo.EmployeeOption;
import com.mycompany.portfolio.member.model.vo.Member;

@Component
public interface EmployeeService {

	public abstract ArrayList<Employee> selectEmployeeList();

	public abstract ArrayList<Member> selectMemberList(String adminId);

	public abstract int registerEmp(Employee emp);

	public abstract List<Map<String, String>> selectManager(Employee manager);

	public abstract Member selectMember(String id);

	public abstract Employee selectEmployee(String empNo);

	public abstract int updateEmp(Employee emp);

	public abstract int deleteEmp(String empNo);

	public abstract String getSalLevel(int salary);

	public abstract ArrayList<EmployeeOption> selectDeptList();

	public abstract ArrayList<EmployeeOption> selectJobList();

	public abstract ArrayList<EmployeeOption> selectSalGradeList();

	public abstract int insertDeptList(ArrayList<EmployeeOption> deptList);

	public abstract int insertJobList(ArrayList<EmployeeOption> jobList);

	public abstract int insertSalGradeList(ArrayList<EmployeeOption> salGradeList);

	public abstract int deleteDeptList(ArrayList<String> deptDelList);

	public abstract int deleteJobList(ArrayList<String> jobDelList);

	public abstract int deleteSalGradeDelList(ArrayList<String> salGradeDelList);

	
}
