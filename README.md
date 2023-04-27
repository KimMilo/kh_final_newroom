# 파이널 프로젝트 - NewRoom (부동산 매물검색 사이트)

# Contents 📖
1. [개발 배경과 목표](#1️⃣-개발-배경과-목표)
2. [개발 환경](#2️⃣-개발-환경)
3. [주요 기능](#3️⃣-주요-기능)
4. [산출물](#4️⃣-산출물)

## 1️⃣ 개발 배경과 목표
### 개발 배경
- 부동산 매물 검색 사이트와 주변 부동산 연계

### 개발 목표
- 손쉽게 사용하기 위해 직관적인 UI 제공
- 부동산 매물 검색시 조건별 정렬기준 제공
- 매물의 위치와 주변 주요시설 등의 위치를 같이 제공
- 1:1 실시간 상담 제공

## 2️⃣ 개발 환경
<p align="center"><img width="920px;" height="540px;" src="https://user-images.githubusercontent.com/115056845/234916086-44fb8c8a-cfc7-4a52-99ac-cbad142fc1da.png")></p>

## 3️⃣ 주요 기능

<h3>✅ 회사소개 </h3>
  
<br>
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
회사소개 
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
</div><br>
<div align="center">

![회사소개20230426_203529](https://user-images.githubusercontent.com/115056845/234895479-a357ecca-be07-40e2-b92a-6b7631108a3e.gif)

</div>

<br>

<h3>✅ 회원가입/로그인(로그아웃) </h3>
  
<br>
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
회원가입
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">

</div><br>
<div align="center">
  
![회원가입](https://user-images.githubusercontent.com/115056845/234856171-54069a22-adc6-4505-be89-500081882589.gif)
  
</div>

- 정보입력 시 문구 안내
  - ID 중복체크 확인 안내
  - 사용 가능 / 불가능 ID 안내
  - 비밀번호 확인 입력 시 비밀번호와 일치 확인 한내

- 회원가입 성공 시 메인페이지로 이동

<br> 
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
로그인(로그아웃)
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
</div><br>
<div align="center">
 
  <div>🔶 로그인(로그아웃)</div><br><br>
<img src="https://user-images.githubusercontent.com/115056845/234857040-694bc8ed-2006-4745-bdd4-35ff4916c842.gif"><br><br><br>
  <div>🔶 아이디 찾기</div><br><br>
<img src="https://user-images.githubusercontent.com/115056845/234877187-e63b01ac-d6b4-4bf5-ade9-a9ee7113b46c.gif"><br><br><br>
  <div>🔶 비밀번호 찾기 </div><br><br>
<img src="https://user-images.githubusercontent.com/115056845/234877337-108df6a4-5cde-4c70-9026-a904ec9455bd.gif">


</div>

- 로그인 시 아이디/비밀번호가 틀릴경우 alert
- 아이디 찾기 및 비밀번호 찾기 시 해당 페이지로 이동
- 로그인 성공 시 관리자는 회원리스트, 일반회원은 관심매물 페이지로 이동
- 로그아웃 시 메인페이지로 이동(spring security session 소멸)

<br>

<h3>✅ 공지사항 </h3>
  
<br>
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
공지사항 
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
</div><br>
<div align="center">

  <div>🔶 공지사항 - 목록</div><br><br>
<img src="https://user-images.githubusercontent.com/115056845/234870342-a658a91c-d805-4227-8d51-623612c0d8f7.gif"><br><br><br>
  <div>🔶 공지사항 - 글쓰기</div><br><br>
<img src="https://user-images.githubusercontent.com/115056845/234870372-a933cdb2-b3a1-4573-98f8-8b387ad80958.gif"><br><br><br>
  <div>🔶 공지사항 - 상세</div><br><br>
<img src="https://user-images.githubusercontent.com/115056845/234870392-7269ef71-9bad-425a-a97a-0b362950b138.gif">

  
</div>

- 제목/내용/작성자 키워드 검색
- 검색 반영한 페이징 처리
- 글 작성
  - 글 작성 후 공지사항 목록 페이지로 이동
  - 초기화 클릭 시 작성 중인 내용 초기화
  - 목록 클릭 시 공지사항 목록 페이지로 이동
- 글 상세보기
  - 댓글 등록 처리
  - 수정완료 후 공지사항 목록 페이지로 이동
  - 삭제완료 후 공지사항 목록 페이지로 이동
  - 목록 클릭 시 공지사항 목록 페이지로 이동

<br>

<h3>✅ Q&A</h3>
  
<br>
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
Q&A
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">

</div><br>
<div align="center">
  
  <div>🔶 Q&A - 목록</div><br><br>
<img src="https://user-images.githubusercontent.com/115056845/234877914-3db3917d-54ee-4468-a3a9-c0bda47b2fa7.gif"><br><br><br> 
  <div>🔶 Q&A - 등록,수정,답변,삭제</div><br><br>
<img src="https://user-images.githubusercontent.com/115056845/234878035-bc6ad260-f560-4bd8-b017-c3a0e1e18045.gif"><br><br><br>

</div>

- 제목/내용/작성자 키워드명으로 검색
- FAQ가기 클릭 시 자주묻는 질문으로 검색
- 검색 반영한 페이징처리
- 질문 등록 시 Q&A 목록 페이지로 이동
- 질문 상세보기
  - 답변 등록 후 Q&A 목록페이지로 이동
  - 수정 클릭 시 수정 페이지 활성화 및 수정완료 후 Q&A 목록페이지로 이동
  - 삭제 클릭 시 삭제 완료 후 Q&A 목록 페이지로 이동
  - 닫기 클릭 시 상세보기 비활성화

<br>

<h3>✅ 매물검색 및 등록</h3>
  
<br>
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
매물검색
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">

</div><br>
<div align="center">
  
  <div>🔶 매물검색 - 목록</div><br><br>
<img src="https://user-images.githubusercontent.com/115056845/234879406-8d2caa11-405f-4f2a-8773-0526a85d74e8.gif"><br><br><br> 
  <div>🔶 매물검색 - 상세</div><br><br>
<img src="https://user-images.githubusercontent.com/115056845/234889592-beb73851-cfc7-4cd2-acf1-28634b283f0d.gif"><br><br><br>

</div>

- 조건유형별 또는 아파트명으로 검색 및 정렬기준에 따른 정렬처리
- 찜한 매물 등록 및 해제
- 매물 클릭 시 상세보기 활성화 / 주변병원, 부동산, 버스정류소 지도에 표시

<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
매물등록
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
</div><br>
<div align="center">
 
![매물등록](https://user-images.githubusercontent.com/115056845/234889800-4ab002fa-6115-404b-a887-759cba945565.gif)

</div>

- 매물등록 클릭 시 매물등록 활성화
  - 등록 완료 후 매물검색 목록 페이지로 이동
  - 닫기 클릭 시 매물등록 비활성화
  
<br>

<h3>✅ 찜한 매물 목록 </h3>
  
<br>
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
찜한 매물
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
</div><br>
<div align="center">

  ![찜등록,해제](https://user-images.githubusercontent.com/115056845/234891932-252da2c8-ed2e-4f71-b96d-7b167be8503d.gif)

  
</div>

- 자세히 보기 클릭시 상세보기 활성화
  - 찜하기 취소 클릭 시 찜등록 해제 후 찜한 매물 목록 페이지로 이동
  - 닫기 클릭 시 자세히 보기 비활성화

<br>

<h3>✅ 회원리스트 </h3>
  
<br>
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
회원리스트 
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
</div><br>
<div align="center">

![회원리스트20230426_211355](https://user-images.githubusercontent.com/115056845/234892344-30bec88b-c9cb-42e9-95d4-d21998ab71f7.gif)

  
</div>

- 회원이름으로 검색
- 검색 반영한 페이징처리
- 체크박스 체크 후 관리자 -> 관리자 해제 / 일반회원 -> 관리자로 권한 변경

<br>

<h3>✅ 마이페이지 </h3>
  
<br>
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
마이페이지 
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
</div><br>
<div align="center">

![마이페이지20230426_211611](https://user-images.githubusercontent.com/115056845/234892864-06189434-366f-43ef-92da-c582ed590674.gif)

  
</div>

- 내 정보 확인
- 정보수정 클릭 시 정보수정 영역 디스플레이
  - 정보수정 시 비밀번호 재확인 후 일치하면 수정 후 마이페이지로 이동
- 탈퇴
  - 확인 클릭 시 탈퇴 처리 후 메인페이지로 이동
  - 취소 클릭 시 마이페이지로 이동

<br>

<h3>✅ 1:1 실시간 상담 </h3>
  
<br>
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
1:1 채팅 
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
</div><br>
<div align="center">

  ![채팅20230426_212000](https://user-images.githubusercontent.com/115056845/234894032-931b930f-c9f2-43a4-8146-e1a527e1b60c.gif)

</div>

- 일반회원
  - 채팅 활성화 시 FAQ 공유 / 제목 클릭 시 해당 답변 메시지 안내
  - 관리자와 1:1 채팅
- 관리자용
  - 회원별 채팅방 클릭 시 해당 회원과 1:1 채팅
  
<br>

<h3>✅ Exception 처리 </h3>
  
<br>
  
<div align="center">
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
예외처리 
<img width="250" height="10" src="https://user-images.githubusercontent.com/115056845/234869666-5eaa3bde-d480-4bc5-8219-b234591df3e6.png">
</div><br>
<div align="center">

![Exception20230426_230436](https://user-images.githubusercontent.com/115056845/234895640-fab7fbfa-d51f-4cd2-98a0-8757b508daa6.gif)
  
</div>

- 페이징 get방식 NumberFormatException 별도 alert처리
- 404 에러, 500 및 공통 에러, 권한 접근금지, 권한없음, 로그인 Exception 처리

<br>

## 4️⃣ 산출물
## 1. 개발일정
<p align="center"><img src="https://user-images.githubusercontent.com/115056845/234551298-8249de64-7c11-49c9-853c-44b6eb4cc61c.png"></p>

## 2. 요구사항 정의서

<h3 align="center">일부 이미지</h3>

![요구사항 정의서(샘플)](https://user-images.githubusercontent.com/115056845/234485865-a895aa50-5177-4f83-9d0c-1e75e69a99fa.png)
[요구사항 정의서 전체보기(Google Drive)](https://docs.google.com/spreadsheets/d/1A4yDDKDaFBGuqHNY0vVn_qyPTB5ifYktmCiy60eF7ZU/edit?usp=share_link)

## 3. UI 설계서

<h3 align="center">일부 이미지</h3>

![UI 설계서(샘플)](https://user-images.githubusercontent.com/115056845/234537990-a3ee01b7-40be-4a1b-b93f-5c118ffd3d92.png)
[UI 설계서 전체보기(Google Drive)](https://docs.google.com/presentation/d/1GTrITCULJLhdCRnebIUGM4uWyecNLJnngN03LAYcvik/edit?usp=share_link)


## 4. ERD 다이어그램
![ERD](https://user-images.githubusercontent.com/115056845/234536834-8c377324-1280-42f2-a9af-c3392db7ee38.png)

<!--
## 5. 시퀀스 다이어그램

<h3 align="center">회원가입</h3>

![시퀀스-회원가입 기능](https://user-images.githubusercontent.com/116356234/228153950-f66c6e08-c899-4102-9359-04d46a9289a0.jpg)

<hr>
<h3 align="center">클래스 신청</h3>

![클래스 신청](https://user-images.githubusercontent.com/116356234/228153973-5e9519d3-fe60-4464-be8b-1c9889627221.png)

<hr>
<h3 align="center">리뷰 등록</h3>

![리뷰등록](https://user-images.githubusercontent.com/116356234/228153988-b4ebeb30-f361-430c-a2d3-6b50b20deace.png)

<hr>
<h3 align="center">리뷰 수정</h3>

![리뷰 수정(시퀀스)](https://user-images.githubusercontent.com/116356234/228153997-9caf0c0a-5645-48c8-8ef3-24c2b7e911b1.png)

## 6.클래스 URL 맵핑
![url mapping](https://user-images.githubusercontent.com/116356234/228155963-c840fb30-9642-44d9-bfbd-395d42d704c0.png)

## 7.클래스 다이어그램

<h3 align="center">목록 조회</h3>

![class](https://user-images.githubusercontent.com/116356234/228155785-cd863372-4c76-4d13-8124-7d88f96b7d2e.png)

## 8.history
![히스토리 일부](https://user-images.githubusercontent.com/116356234/228162768-44f63460-d3c0-4712-9e2e-95bffab03af3.png)
[history 전체 보기(Google Drive)](https://docs.google.com/spreadsheets/d/17JAPmGYTPVRHDcrvCwwMwiZ-16RYISPayvNI8cIO3gg/edit?usp=sharing)


## 9.테스트 케이스

<h3 align="center">마이페이지</h3>

![테스트 케이스(마이 페이지)](https://user-images.githubusercontent.com/116356234/228162764-1d7083af-cd17-468f-8dc9-901ce7865f4b.png)
[테스트 케이스 전체 보기(Google Drive)](https://docs.google.com/spreadsheets/d/1vm2aPEtXIhMBIqChLwXK-q4RTqgk3pphlwWo8_pCQuY/edit?usp=sharing)

-->
