<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<br>
<div class="container-md">

<h2>회원 수정</h2><br>
<form action="/member/modify" method="post">
<div class="mb-3">
  <label for="e" class="form-label">email</label>
  <input type="email" name="email" class="form-control" id="eamil" value="${mvo.email }">
</div>
<div class="mb-3">
  <label for="p" class="form-label">password</label>
  <input type="password" name="pwd" class="form-control" id="p"placeholder="password" >
</div>
<div class="mb-3">
  <label for="p" class="form-label">nick_name</label>
  <input type="text" name="nickName" class="form-control" id="n" value="${mvo.nickName }" >
</div>
<div class="mb-3">
  <label for="p" class="form-label">${mvo.email }</label>
  <p>( <c:forEach items="${mvo.authList }" var="authList"> ${authList.auth } </c:forEach> )</p>
</div>

 <button type="submit" class="btn btn-secondary" id="regBtn">modify</button> 
 <a href="/member/delete"><button type="button" class="btn btn-secondary" id="regBtn">delete</button> </a>
 
 <!-- 해당 멤버의 권한을 출력 (2개일 수도 있음) -->
 </form>
 </div>