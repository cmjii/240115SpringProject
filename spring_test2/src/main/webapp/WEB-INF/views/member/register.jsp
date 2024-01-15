<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h2>회원가입</h2><br>
<form action="/member/register" method="post">
<div class="mb-3">
  <label for="e" class="form-label">email</label>
  <input type="email" name="email" class="form-control" id="eamil" placeholder="email">
</div>
<div class="mb-3">
  <label for="p" class="form-label">password</label>
  <input type="password" name="pwd" class="form-control" id="p"placeholder="password" >
</div>
<div class="mb-3">
  <label for="p" class="form-label">nick_name</label>
  <input type="text" name="nickName" class="form-control" id="n"placeholder="nick_name" >
</div>
 <button type="submit" class="btn btn-secondary" id="regBtn">register</button> 
 </form>
 </div>