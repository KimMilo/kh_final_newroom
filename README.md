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
<p align="center"><img width="680px;" height="420px;" src="https://user-images.githubusercontent.com/115056845/234472984-2d402655-955a-4427-897d-f3cee19ef756.png")></p>
  
## 3️⃣ 주요 기능

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
  
![로그인](https://user-images.githubusercontent.com/115056845/234857040-694bc8ed-2006-4745-bdd4-35ff4916c842.gif)

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
  - 수정완료 후 공지사항 목록 페이지로 이동
  - 삭제완료 후 공지사항 목록 페이지로 이동
  - 목록 클릭 시 공지사항 목록 페이지로 이동

<br>

<h3>✅  </h3>
  
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
