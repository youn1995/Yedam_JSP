<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
	label { display: inline-block; width : 100px}
</style>
</head>
<body>
   <h1>사원수정</h1>
   <form action="empUpdateServ" method="post">  
    <div><label>employeeId</label> <input name="employee_id" value="${emp.employee_id}" readonly="readonly"></div>
    <div><label>firstName</label> <input name="first_name" value="${emp.first_name}"></div>
    <div><label>lastName</label> <input name="last_name" value="${emp.last_name}"></div>
    <div><label>email</label> <input name="email" value="${emp.email}"></div>
    <div><fmt:parseDate value="${emp.hire_date}" pattern="yyyy-MM-dd HH:mm:ss" var="parseToday"/><label>hireDate</label> 
    <input name="hire_date" value="<fmt:formatDate value="${parseToday}" pattern="yyyy/MM/dd"/>"></div>
    <div><label>department_name</label> <br>
    <input type="radio"  name="department_id" value=""> 부서음슴 <br>
    <c:forEach items="${dList}" var="dept">
    <c:if test="${dept.department_id == emp.department_id}">
    <input type="radio"  name="department_id" value="${dept.department_id}" checked="checked"> ${dept.department_name} <br>
    </c:if> 
    <c:if test="${dept.department_id != emp.department_id}">
    <input type="radio"  name="department_id" value="${dept.department_id}"> ${dept.department_name} <br>
    </c:if>
	</c:forEach>   		
    </div>
    <div><label>jobId</label> <select name="job_id">
    	<c:forEach items="${jList}" var="job">
    		<c:if test="${job.job_id == emp.job_id}"> 
    		<option value="${job.job_id}" selected="selected"> ${job.job_title}
    		</c:if> 
    		<c:if test="${job.job_id != emp.job_id}"> 
    		<option value="${job.job_id}"> ${job.job_title}
    		</c:if> 
    	</c:forEach>
    	  </select></div>
    <div><label>manager_id</label> <select name="manager_id">
    	      <option value="">음슴
		<c:forEach items="${empList}" var="emps">
		<c:if test="${emps.employee_id == emp.manager_id}">
			<option value="${emps.employee_id}" selected="selected"> ${emps.first_name} ${emp.last_name}
			</option>
			</c:if>
			<c:if test="${emps.employee_id != emp.manager_id2}">
			<option value="${emps.employee_id}"> ${emps.first_name} ${emp.last_name}
			</option>
			</c:if>
			</c:forEach>
    	       </select></div>
    <button>등록</button>
    </form>
</body>
</html>