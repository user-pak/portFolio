package com.mycompany.portfolio.employee.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.mycompany.portfolio.employee.model.service.EmployeeService;
import com.mycompany.portfolio.employee.model.vo.Employee;
import com.mycompany.portfolio.employee.model.vo.EmployeeOption;
import com.mycompany.portfolio.member.model.vo.Member;

@Controller
public class EmployeeController {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	/* @Value("${adminId}") */
	private String adminId = "admin";

	@Autowired
	private EmployeeService service;

	@RequestMapping("employeesInfo.do")
	public String humanresourceView() {
		return "employee/employeesInfo";
	}
	@RequestMapping("selectEmployeeList.do")
	public ModelAndView selectEmployeeList(ModelAndView mav) {
		ArrayList<Employee> employeeList = service.selectEmployeeList();
		mav.addObject("employeeList", new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(employeeList)).setViewName("employee/selectEmployeeList");
		return mav;
	}
	@RequestMapping("registerEmpJsp.do")
	public String registerEmpJsp(String id, Model model) {
		model.addAttribute("member", service.selectMember(id)).addAttribute("deptList", service.selectDeptList()).addAttribute("jobList", service.selectJobList());
		return "employee/registerEmp";
	}
	@RequestMapping("selectMemberList.do")
	public ModelAndView selectMemberList(ModelAndView mav) {
		ArrayList<Member> memberList = service.selectMemberList(adminId);
		mav.addObject("memberList", new GsonBuilder().setDateFormat("yyyy년MM월dd일").create().toJson(memberList)).setViewName("employee/selectMemberList");
		return mav;
	}
	@RequestMapping("registerEmp.do")
	public String registerEmp(Employee emp, Model model) {
		if(emp.getSalary() != null) {
			emp.setSalaryLevel(getSalLevel(emp.getSalary()));
		}
		int result = service.registerEmp(emp);
		if(result>0) {
			model.addAttribute("msg", "성공적으로 등록되었습니다");
			return "redirect: home.do";
		}else {
			model.addAttribute("msg", "registerEmp");
			return "common/error";
		}
	}
	@ResponseBody
	@RequestMapping("selectManager.do")
	public String selectManager(String deptCode, @RequestParam(required=false)String empNo) {	
		Employee manager = new Employee(empNo, deptCode);
		List<Map<String, String>> managers = service.selectManager(manager);
		return new Gson().toJson(managers);
	}
	@RequestMapping("updateEmpJsp.do")
	public ModelAndView updateEmpJsp(String empNo, ModelAndView mav) {
		Employee employee = service.selectEmployee(empNo);
		mav.addObject("employee", employee).addObject("deptList", service.selectDeptList()).addObject("jobList", service.selectJobList()).addObject("managerList",service.selectManager(new Employee(employee.getEmpNo(),employee.getDeptCode()))).setViewName("employee/updateEmp");
		return mav;
	}
	@RequestMapping("updateEmp.do")
	public String updateEmp(Employee emp, Model model) {
		if(emp.getSalary() != null) {
			emp.setSalaryLevel(getSalLevel(emp.getSalary()));
		}
		int result = service.updateEmp(emp);
		if(result > 0) {
			model.addAttribute("msg", "사원정보가 수정되었습니다");
			return "redirect: home.do";
			}
		else {
			model.addAttribute("msg", "사원정보 수정 중 에러가 발생했습니다 다시 수정해주세요");
			return "common/error";}
	}	
	@RequestMapping("deleteEmp.do")
	public String deleteEmp(String empNo, Model model) {
		int result = service.deleteEmp(empNo);
		if(result >0) {
			model.addAttribute("msg", "사원이 삭제되었습니다");
			return "redirect: home.do";
		}
		else {
			model.addAttribute("msg", "사원삭제 중 에러가 발생했습니다 다시 진행해주세요");
			return "common/error";
		}
	}
	private String getSalLevel(int salary) {
		return service.getSalLevel(salary);
	}
	@RequestMapping("employeeInfo.do")
	public ModelAndView employeeInfoJsp(ModelAndView mav) {
		mav.addObject("selectDeptList", service.selectDeptList()).addObject("selectJobList",service.selectJobList()).addObject("selectSalGradeList",service.selectSalGradeList()).setViewName("employee/employeesInfo");
		return mav;
	}

//	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("insertEmployeeOptions.do")
//	public String insertEmployeeOptions(String deptOpt, String jobOpt, String salGradeOpt) {
	public String insertEmployeeOptions(String options, String delList, String updateList) {
		Gson gson = new GsonBuilder().enableComplexMapKeySerialization().create(); 	
	    Type optType = new TypeToken<ArrayList<ArrayList<EmployeeOption>>>(){}.getType();
		ArrayList<ArrayList<EmployeeOption>> optList = gson.fromJson(options, optType);
//		ArrayList<EmployeeOption> deptList = optList.get(0).get("deptOpt");
//		Gson gson = new Gson();
//		Type listType = new TypeToken<ArrayList<ArrayList<EmployeeOption>>(){}.getType();	 
//		ArrayList<EmployeeOption> deptList = gson.fromJson(deptOpt, listType); 
//		ArrayList<EmployeeOption> jobList = gson.fromJson(jobOpt, listType);
//		ArrayList<EmployeeOption> salGradeList = gson.fromJson(salGradeOpt, listType);
		ArrayList<EmployeeOption> deptList = optList.get(0);
		ArrayList<EmployeeOption> jobList = optList.get(1);
		ArrayList<EmployeeOption> salGradeList = optList.get(2);
		
		int deptResult = 0; int jobResult = 0; int salGradeResult = 0;
		if(!deptList.isEmpty()) {
			deptResult = service.insertDeptList(deptList);
		}
		if(!jobList.isEmpty()) {
			jobResult = service.insertJobList(jobList);
		}
		if(!salGradeList.isEmpty()) {
			salGradeResult = service.insertSalGradeList(salGradeList);
		}
		Type delType = new TypeToken<ArrayList<ArrayList<String>>>() {}.getType();
		ArrayList<ArrayList<String>> delArr = gson.fromJson(delList, delType);
		ArrayList<String> deptDelList = delArr.get(0);
		ArrayList<String> jobDelList = delArr.get(1);
		ArrayList<String> salGradeDelList = delArr.get(2);
		int deptDelResult = 0; int jobDelResult = 0; int salGradeDelResult = 0;
		if(!deptDelList.isEmpty()) {
			deptDelResult = service.deleteDeptList(deptDelList);
		}
		if(!jobDelList.isEmpty()) {
			jobDelResult = service.deleteJobList(jobDelList);
		}
		if(!salGradeDelList.isEmpty()) {
			salGradeDelResult = service.deleteSalGradeDelList(salGradeDelList);
		}
		ArrayList<ArrayList<EmployeeOption>> modList = gson.fromJson(updateList, optType);
		ArrayList<EmployeeOption> modDeptList = modList.get(0);
		ArrayList<EmployeeOption> modJobList = modList.get(1);
		ArrayList<EmployeeOption> modSalGradeList = modList.get(2);
		int updateDeptResult = 0; int updateJobResult = 0; int updateSalGradeResult = 0;
		if(!modDeptList.isEmpty()) {
			updateDeptResult = service.updateDept(modDeptList);
		}
		if(!modJobList.isEmpty()) {
			updateJobResult = service.updateJob(modJobList);
		}
		if(!modSalGradeList.isEmpty()) {
			updateSalGradeResult = service.updateSalGrade(modSalGradeList);
		}
		return gson.toJson("부서 " + deptResult + "건, 직급 " + jobResult + "건, 급여등급 " + salGradeResult +"건이 추가되었습니다 \n" + "부서 " + updateDeptResult + "건, 직급 " + updateJobResult + "건, 급여등급 " + updateSalGradeResult +"건이 수정되었습니다 \n" + "부서 " + deptDelResult + "건, 직급 " + jobDelResult + "건, 급여등급 " + salGradeDelResult + "건이 삭제되었습니다");
	}
}
