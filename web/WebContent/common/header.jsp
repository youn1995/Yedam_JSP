<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
<%--ShareObject obj1 = (ShareObject) application.getAttribute("data1"); 
if(obj1==null) {
obj1.setCount(obj1.getCount()+1);--%>
<br>application: 
<%--=obj1.getCount() --%> : <%--=obj1.getStr() --%>
<br>session: 
<%--ShareObject obj2 = (ShareObject) session.getAttribute("data"); 
obj2.setCount(obj2.getCount()+1);--%>
<%--=obj2.getCount() --%> : <%--=obj2.getStr() --%>
<%-- } --%>
 -->

<ul>
<!-- html에서 /를 앞에쓰는거는 localhost 부터 -->
<!-- servlet forword /는 web부터 -->
<c:if test="${empty sessionScope.id}">
<li><a href="/web/member/login.jsp">로그인</a>
</c:if>
<c:if test="${not empty sessionScope.id}">
<li>${sessionScope.id}님 <a href="/web/member/logout">로그아웃</a>
</c:if>
<li><a href="/web/member/memberUpdate">내정보수정</a>


<li><a href="/web/board/boardInsert.do">보드입력</a>
<li><a href="/web/dept/DeptInsertFormServ">부서등록폼</a>
<li><a href="/web/dept/deptSelectAll">부서전체조회</a>
<li><a href="<%=application.getContextPath() %>/member/memberInsert.do">멤버입력</a>
<li><a href="/web/member/memberSelectAll.do">멤버전체조회</a>
<li><a href="/web/board/boardInsert.do">보드입력</a>
</ul>