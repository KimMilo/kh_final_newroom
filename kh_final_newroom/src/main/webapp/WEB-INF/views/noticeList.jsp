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
<title>공지사항 글목록</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container text-center mt-5" style="margin-bottom:0">
        <h3>공지사항</h3>
    </div>

    <nav class="container navbar navbar-expand-sm navbar-light">
    	<c:if test="${loginInfo.role eq 1}">
        	<button id="btnWrite" class="btn btn-outline-primary" onclick="location.href='${rUrl}/noticeWrite.do'">글쓰기</button>
        </c:if>
        <form class="navbar-nav ml-auto" action="${rUrl}/noticeSearch.do" method="post">
            <div class="form-group mr-1">
                <select class="form-control" name="search_type">
                    <option value="btitle">제목</option>
                    <option value="bcontent">내용</option>
                    <option value="userid">작성자</option>
                </select>
            </div>
            <div class="form-group mr-1">
                <input type="text" id="userId" class="form-control" name="keyword" placeholder="검색어 입력.">
            </div>
            <div class="form-group">
                <button id="btnWrite" class="btn btn-outline-primary">검색</button>
            </div>
        </form>
    </nav>
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
			<c:when test="${empty pageDto or empty pageDto.noticeList}">
				<tr><td colspan="5">작성된 게시글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${pageDto.noticeList}" var="dto">
					<tr>
						<td>${dto.bnum}</td>
						<td id="title"><a href="${rUrl}/noticeRead.do?bnum=${dto.bnum}">${dto.btitle} 
						<c:if test="${!empty dto.cmtCnt}">
							[${dto.cmtCnt}]
						</c:if>
						</a></td>
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
  <div class="container" style="margin-bottom:0">
    <ul class="pagination justify-content-center">
    <c:if test="${pageDto.startPage>1}">
		<a href="notice.do?action=listAll&page=${pageDto.startPage-1}">이전</a>
    </c:if>
    <c:forEach begin="${pageDto.startPage}" end="${pageDto.endPage}" var="i">
    	<li class="page-item">
			<a class="page-link" href="noticeList.do?pageStr=${i}">
				<c:if test="${i eq pageDto.curPage}">${i}</c:if>
				<c:if test="${i ne pageDto.curPage}">${i}</c:if>
			</a>
		</li>
	</c:forEach>
	<c:if test="${pageDto.endPage < pageDto.totalPage}">
		<a href="notice.do?action=listAll&page=${pageDto.endPage+1}">다음</a>
	</c:if>
    </ul>
  </div>

	<jsp:include page="footer.jsp" />
</body>
</html>