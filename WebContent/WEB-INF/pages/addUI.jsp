<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form:form action="${pageContext.request.contextPath }/emp" method="POST"  modelAttribute="employee">
		
		EmpName:<form:input path="empName"/><br/>
		SSN:<form:input path="ssn"/><br/>
		Dept:<form:select path="department.deptId"
						  items="${requestScope.deptList }"
						  itemValue="deptId"
						  itemLabel="deptName"/><br/>
		<input type="submit" value="保存"/>
		
	</form:form>
	

</body>
</html>