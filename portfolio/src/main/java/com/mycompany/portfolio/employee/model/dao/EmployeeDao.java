package com.mycompany.portfolio.employee.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.portfolio.employee.model.vo.Employee;
import com.mycompany.portfolio.employee.model.vo.EmployeeOption;
import com.mycompany.portfolio.member.model.vo.Member;

@Repository
public class EmployeeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<Employee> selectEmployeeList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("EmployeeMapper.selectEmployeeList");
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Member> selectMemberList(String adminId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("EmployeeMapper.selectMemberList", adminId);
	}

	public int registerEmp(Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("EmployeeMapper.registerEmp", emp);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map<String, String>> selectManager(Employee manager) {
		// TODO Auto-generated method stub
		return (List)sqlSession.selectList("EmployeeMapper.selectManager", manager);
	}

	public Member selectMember(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("EmployeeMapper.selectMember", id);
	}

	public Employee selectEmployee(String empNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("EmployeeMapper.selectEmployee", empNo);
	}

	public int updateEmp(Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.update("EmployeeMapper.updateEmp", emp);
	}

	public int deleteEmp(String empNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("EmployeeMapper.deleteEmp", empNo);
	}

	public String getSalLevel(int salary) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("EmployeeMapper.getSalLevel", salary);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<EmployeeOption> selectDeptList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("EmployeeMapper.selectDeptList");
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<EmployeeOption> selectJobList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("EmployeeMapper.selectJobList");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList<EmployeeOption> selectSalGradeList() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("EmployeeMapper.selectSalGradeList");
	}

	public int insertDeptList(ArrayList<EmployeeOption> deptList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("EmployeeMapper.insertDeptList", deptList);
	}

	public int insertJobList(ArrayList<EmployeeOption> jobList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("EmployeeMapper.insertJobList", jobList);
	}

	public int insertSalGradeList(ArrayList<EmployeeOption> salGradeList) {
		// TODO Auto-generated method stub
		return sqlSession.insert("EmployeeMapper.insertSalGradeList",salGradeList);
	}

	public int deleteDeptList(ArrayList<String> deptDelList) {
		// TODO Auto-generated method stub
		return sqlSession.delete("EmployeeMapper.deleteDeptList",deptDelList);
	}

	public int deleteJobList(ArrayList<String> jobDelList) {
		// TODO Auto-generated method stub
		return sqlSession.delete("EmployeeMapper.deleteJobList",jobDelList);
	}

	public int deleteSalGradeDelList(ArrayList<String> salGradeDelList) {
		// TODO Auto-generated method stub
		return sqlSession.delete("EmployeeMapper.deleteSalGradeDelList",salGradeDelList);
	}

	
	
}
