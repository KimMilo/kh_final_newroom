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
<title>공지사항 글쓰기</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
</head>

<body>
    <jsp:include page="header.jsp" />

    <!--content-->
    <div class="container text-center mt-5">
        <h3>글쓰기</h3>
    </div>
    <!--contents-->
    <div class="container">
        <form class="form form-group" action="${rUrl}/noticeWrite" method="post">
            <div class="form-group">
                <label for="btitle">제목: </label>
                <input type="text" id="btitle" class="form-control" name="btitle" placeholder="제목을 입력하세요">
            </div>
            <div class="form-group">
                <label for="bcontent">내용: </label>
                <textarea rows="20" stype="height:100%;" id="bcontent" class="form-control" name="bcontent"
                    placeholder="내용을 입력하세요"></textarea>
            </div>
            <div class="form-group container row justify-content-center" style="margin-bottom:0">
                <input type="submit" class="btn btn-outline-primary mr-1" value="글작성">
                <input type="reset" class="btn mr-1 btn-outline-warning" value="초기화">
                <input type="button" class="btn btn-outline-secondary" value="목록" onclick="location.href='${rUrl}/noticeList'">
            </div>
        </form>
    </div>
</body>

<!-- Footer -->
	<jsp:include page="footer.jsp" />
</body>

</html>