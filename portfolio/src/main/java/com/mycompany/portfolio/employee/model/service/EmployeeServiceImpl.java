package com.mycompany.portfolio.employee.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.portfolio.employee.model.dao.EmployeeDao;
import com.mycompany.portfolio.employee.model.vo.Employee;
import com.mycompany.portfolio.employee.model.vo.EmployeeOption;
import com.mycompany.portfolio.member.model.vo.Member;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeDao dao;

	@Override
	public ArrayList<Employee> selectEmployeeList() {
		// TODO Auto-generated method stub
		return dao.selectEmployeeList();
	}

	@Override
	public ArrayList<Member> selectMemberList(String adminId) {
		// TODO Auto-generated method stub
		return dao.selectMemberList(adminId);
	}

	@Override
	public int registerEmp(Employee emp) {
		// TODO Auto-generated method stub
		return dao.registerEmp(emp);
	}

	@Override
	public List<Map<String, String>> selectManager(Employee manager) {
		// TODO Auto-generated method stub
		return dao.selectManager(manager);
	}

	@Override
	public Member selectMember(String id) {
		// TODO Auto-generated method stub
		return dao.selectMember(id);
	}

	@Override
	public Employee selectEmployee(String empNo) {
		// TODO Auto-generated method stub
		return dao.selectEmployee(empNo);
	}

	@Override
	public int updateEmp(Employee emp) {
		// TODO Auto-generated method stub
		return dao.updateEmp(emp);
	}

	@Override
	public int deleteEmp(String empNo) {
		// TODO Auto-generated method stub
		return dao.deleteEmp(empNo);
	}

	@Override
	public String getSalLevel(int salary) {
		// TODO Auto-generated method stub
		return dao.getSalLevel(salary);
	}

	@Override
	public ArrayList<EmployeeOption> selectDeptList() {
		// TODO Auto-generated method stub
		return dao.selectDeptList();
	}

	@Override
	public ArrayList<EmployeeOption> selectJobList() {
		// TODO Auto-generated method stub
		return dao.selectJobList();
	}

	@Override
	public ArrayList<EmployeeOption> selectSalGradeList() {
		// TODO Auto-generated method stub
		return dao.selectSalGradeList();
	}

	@Override
	public int insertDeptList(ArrayList<EmployeeOption> deptList) {
		// TODO Auto-generated method stub
		return dao.insertDeptList(deptList);
	}

	@Override
	public int insertJobList(ArrayList<EmployeeOption> jobList) {
		// TODO Auto-generated method stub
		return dao.insertJobList(jobList);
	}

	@Override
	public int insertSalGradeList(ArrayList<EmployeeOption> salGradeList) {
		// TODO Auto-generated method stub
		return dao.insertSalGradeList(salGradeList);
	}

	@Override
	public int deleteDeptList(ArrayList<String> deptDelList) {
		// TODO Auto-generated method stub
		return dao.deleteDeptList(deptDelList);
	}

	@Override
	public int deleteJobList(ArrayList<String> jobDelList) {
		// TODO Auto-generated method stub
		return dao.deleteJobList(jobDelList);
	}

	@Override
	public int deleteSalGradeDelList(ArrayList<String> salGradeDelList) {
		// TODO Auto-generated method stub
		return dao.deleteSalGradeDelList(salGradeDelList);
	}

}
