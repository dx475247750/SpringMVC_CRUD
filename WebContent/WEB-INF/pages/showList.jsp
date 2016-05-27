<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	table td,th {
		border: 1px solid black;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/scripts/jquery-1.7.2.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		//alert("xxx");
		
		//[GET转DELETE]获取所有“删除”功能的超链接
		$(".removeEmp").click(function(){
			
			//[GET转DELETE]获取空表单
			var $form = $("form");
			
			//[GET转DELETE]获取当前超链接的目标地址
			var url = this.href;
			
			//[GET转DELETE]将表单的action属性值设置为url值
			$form.attr("action",url);
			
			//[GET转DELETE]提交表单
			$form.submit();
			
			//[GET转DELETE]取消超链接自身的默认行为
			return false;
		});
		
	});
	
</script>
</head>
<body>
	<!-- [GET转DELETE]声明一个空的表单标签 -->
	<form action="" method="POST">
		
		<!-- [GET转DELETE]声明隐藏域 -->
		<input type="hidden" name="_method" value="DELETE"/>
		
	</form>

	<c:if test="${empty requestScope.empList}">
		暂时没有员工数据
	</c:if>
	<c:if test="${!empty requestScope.empList}">
		
		<table>
			
			<tr>
				<th>ID</th>
				<th>Emp Name</th>
				<th>SSN</th>
				<th>Dept Name</th>
				<th>Remove</th>
				<th>Edit</th>
			</tr>
			
			<c:forEach items="${requestScope.empList }" var="employee">
				
				<tr>
					<td>${employee.empId }</td>
					<td>${employee.empName }</td>
					<td>${employee.ssn }</td>
					<td>${employee.department.deptName }</td>
					<td>
						<a class="removeEmp" href="${pageContext.request.contextPath }/emp/${employee.empId }">Remove</a>
					</td>
					<td>
						<a href="${pageContext.request.contextPath }/emp/${employee.empId }">Edit</a>
					</td>
				</tr>
				
			</c:forEach>
			
		</table>
		
	</c:if>
	
	<a href="${pageContext.request.contextPath }/emp/addUI">前往表单创建页面</a>

</body>
</html>