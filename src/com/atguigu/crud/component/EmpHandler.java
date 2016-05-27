package com.atguigu.crud.component;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.atguigu.crud.entity.Department;
import com.atguigu.crud.entity.Employee;
@Controller
public class EmpHandler {
	@Autowired
	private EmpDao empDao;
	
	@Autowired
	private DeptDao deptDao;
	
	
	@RequestMapping(value="/emp",method=RequestMethod.GET)
	public String showEmpList(Map<String , Object> map){
		map.put("empList",empDao.getEmpList());
		return "showList";
	}
/*	@RequestMapping("/emp/toAddUI")
 	public String toAddUI(Map<String , Object> map){
		List<Department>deptList=deptDao.getDeptList();
		map.put("deptList", deptList);
		map.put("employee", new Employee());
	    return "addUI";
	}*/
	@RequestMapping(value="/emp/addUI",method=RequestMethod.GET)
	public String toAddUI(Map<String , Object> map){
		map.put("deptList",deptDao.getDeptList());
		map.put("employee", new Employee());
		return "addUI";
	}
	@RequestMapping(value="/emp",method=RequestMethod.POST)
    public String saveEmp(Employee employee){
		empDao.saveEmp(employee);
		return "redirect:/emp";
	}
    @RequestMapping(value="/emp/{empIdPattern}",method=RequestMethod.DELETE)
    public String removeEmp(@PathVariable("empIdPattern") String empId){
    	empDao.removeEmp(empId);
    	return "redirect:/emp";
    }
    @RequestMapping(value="/emp/{empId}",method=RequestMethod.GET)
    public String editEmp(@PathVariable("empId") String empId,Map<String, Object> map){
    	Employee employee = empDao.getEmpById(empId);
        map.put("employee", employee);
    	List<Department> deptList = deptDao.getDeptList();
    	map.put("deptList", deptList);
        return"editUI";
    }
    @RequestMapping(value="/emp",method=RequestMethod.PUT)
    public String updateEmp(Employee employee){
    	empDao.updateEmp(employee);
    	return "redirect:/emp";
    }
    @ModelAttribute
	public Employee getEmployee(@RequestParam(value="empId", required=false) String empId) {
		
		return (empId == null)?new Employee():empDao.getEmpById(empId);
	}
}
