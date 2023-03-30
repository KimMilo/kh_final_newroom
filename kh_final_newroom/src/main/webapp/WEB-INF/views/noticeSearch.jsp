<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rUrl" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<link rel="stylesheet" type="text/css" href="${rUrl}/resources/css/style.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<title>공지 검색결과</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

</head>

<body>
    <jsp:include page="header.jsp" />
    
    <div class="container text-center mt-5" style="margin-bottom:0">
        <h3><span style="color: #1abc9c;">'${typeName}'</span>(으)로 <span style="color: #1abc9c;">'${keyword}'</span>을 검색한 결과입니다.</h3>
    </div>

    <nav class="container navbar navbar-expand-sm navbar-light">
    	<c:if test="${loginInfo.mrole eq 1}"><!-- 관리자일때만 -->
        	<button id="btnWrite" class="btn btn-outline-primary" onclick="location.href='${rUrl}/noticeWritePage'">글쓰기</button>
        </c:if>
       <input type="button" class="btn btn-outline-secondary ml-2" value="목록" onclick="location.href='${rUrl}/noticeList'">
       
        <form class="navbar-nav ml-auto" action="${rUrl}/noticeSearch" method="post">
            <div class="form-group mr-1">
                <select class="form-control" name="search_type">
                    <option value="btitle">제목</option>
                    <option value="bcontent">내용</option>
                    <option value="userid">글쓴이</option>
                </select>
            </div>
            <div class="form-group mr-1">
                <input type="text" id="userId" class="form-control" name="userId" placeholder="검색어 입력.">
            </div>
            <div class="form-group">
                <button id="btnWrite" class="btn btn-outline-primary">검색</button>
            </div>
        </form>
    </nav>

  <!--contents-->
  <div class="container my-3">
    <form role="form" method="get">
      <table class="table table-hover">
        <thead>
          <tr>
            <th width="15%">글번호</th>
            <th width="40%" class="text-center">제목</th>
            <th width="15%">작성자</th>
            <th width="15%">조회수</th>
            <th width="15%">작성일</th>
          </tr>
        </thead>
        <c:choose>
			<c:when test="${empty resultList}">
				<tr><td colspan="5">검색된 결과가 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${resultList}" var="dto">
					<tr>
						<td>${dto.bnum}</td>
						<td id="title"><a href="noticeRead?bnum=${dto.bnum}">${dto.btitle}</a></td>
						<td>${dto.userid}</td>
						<td>${dto.breadcnt}</td>
						<td>${dto.bwritedate}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
      </table>
    </form>
  </div>

    <!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>

</html>