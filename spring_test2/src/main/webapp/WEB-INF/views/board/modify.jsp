<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/header.jsp"></jsp:include>

<div class="container-md">
<h1>글수정</h1> <br>
<c:set value = "${bdto.bvo }" var="bvo"></c:set>
<form action="/board/modify" method="post" enctype="multipart/form-data">
<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">번호</span>
  <input type="text" class="form-control" value="${bvo.bno }" name="bno" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">작성일</span>
  <input type="text" class="form-control"value="${bvo.regAt}"  readonly="readonly">
  <span class="input-group-text" id="basic-addon1">수정일</span>
  <input type="text" class="form-control"value="${bvo.modAt}" name="modAt" readonly="readonly">
  <span class="input-group-text" id="basic-addon1">조회수</span>
  <input type="text" class="form-control" value="${bvo.readCount}" readonly="readonly">
</div>

<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">제목</span>
  <input type="text" class="form-control"  name="title" value="${bvo.title}" >
  <span class="input-group-text" id="basic-addon1">작성자</span>
  <input type="text" class="form-control" name="writer" value="${bvo.writer}" readonly="readonly">
</div>

<div class="input-group">
  <span class="input-group-text">내용</span>
  <textarea class="form-control" name="content">${bvo.content}</textarea>
</div>

<!-- 파일라인 -->
<c:set value="${bdto.flist }" var="flist"></c:set>
<div class="input-group mb-3">
	  <span class="input-group-text" id="basic-addon1">파일</span>
	    <ul class="list-group list-group-flush">
	    	<c:forEach items="${flist }" var="fvo">
	    		<li class="list-group-item">
	    			<c:choose>
	    				<c:when test="${fvo.fileType ==1 }">
	    					<div>
	    						<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}">
	    					</div>
	    				</c:when>
	    				<c:otherwise>
	    					<div>
	    					<!-- 일반 파일 표시할 아이콘 -->
	    						<i class="bi bi-card-heading" style="font-size: 50px;"></i>
	    					</div>
	    				</c:otherwise>
	    			</c:choose>
	    			<div class="ms-2 me-auto">
	    				<div class="fw-bold">${fvo.fileName }</div>
	    				<span class="badge text-bg-secondary">${fvo.fileSize }</span>
	    				<button type="button" data-uuid="${fvo.uuid }" class="btn btn-outline-danger file-x">X</button>
	    			</div>
	    		</li>
	    	</c:forEach>
	    </ul>
</div>

<!-- file입력 라인 추가 -->
<div class="mb-3">
  <label for="file" class="form-label">files...</label>
  <input type="file" name="files" class="form-control" id="files" multiple="multiple" style="display: none;"> <!-- multiple == 한번에 여러개의 파일을 업로드 -->
  <!-- 파일 버튼 트리거 사용하기 위해서 주는 버튼 -->
  <br><button type="button" class="btn btn-secondary" id="trigger">FileUpload</button>
</div>
<!-- 파일 목록 표시라인 -->
<div class="mb-3" id="fileZone">
</div>

<br>

<button type="submit" class="btn btn-secondary" id="regBtn">modify</button>
<a href="/board/list"><button type="button" class="btn btn-secondary" id="regBtn">list</button></a>
</form>
</div>
<script src="/resources/js/boardRegister.js"></script>
<script src="/resources/js/boardModify.js" ></script>