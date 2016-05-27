<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在此处插入标题</title>
</head>
<body>
    <form:form action="${pageContext.request.contextPath}/emp" method="POST" modelAttribute="employee">
    <input type="hidden" name="_method" value="PUT"/>
    <form:hidden path="empId"/>
    	
		EmpName:<form:input path="empName"/><br/>
		SSN:${employee.ssn }<br/>
		Dept:<form:select path="department.deptId"
						  items="${requestScope.deptList }"
						  itemValue="deptId"
						  itemLabel="deptName"/><br/>
		<input type="submit" value="更新"/>
		
    </form:form>
  
</body>
</html>