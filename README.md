## 개발 목표
커뮤니티 게시판 웹 **개인 프로젝트**
- 카테고리 별로 게시판 분류
- 케테고리 안에 소분류로 원하는 게시판 분류 가능
- 검색기능 "선택한 게시판(카테고리)내에서 검색 및 뒤로가기 적용"
- Spring Security를 이용하여 권한이 주어진 회원만 게시물 등록, 수정 및 삭제
- text edition 'summernote edition' 적용

## 사용기술
- Spring Tool Suite 3
- Mybatis
- Spring Security
- Ajax
- summernote edition
- Database : Oracle SQL Developer

사용 언어 : Java, HTML, CSS, Jquery, SQL
서버 : apache - tomcat - 9.0.11
버전 관리 : Git 


## 개선 및 업데이트 예정
- 회원 마이 페이지
- 게시물 스크렙 기능
- 회원 프로파일 이미지
- 게시물 리스트 정렬 방식(필터)
- 소셜 로그인
------
### 메인페이지
- 사이드 박스에 조회수 순위가 높은 게시물, 댓글 달린 순위가 높은 게시물, 게시물 작성 순위가 높은 회원순을 사이드 박스에 표시
- 카테 고리 네개를 최신 순서로 박싱처리
![main](https://user-images.githubusercontent.com/98436199/231664133-747e60f4-a5fb-4ef5-8584-1499900fc5bc.png)


### 전체 게시물 
- 전체 게시물을 생성 시간으로 페이징 정렬
![ListAll](https://user-images.githubusercontent.com/98436199/231664325-0e38a48c-69f6-4e6c-a71a-d0b918a3dab2.png)
---
### 원하는 게시판 선택
![KakaoTalk_20230413_152456526_01](https://user-images.githubusercontent.com/98436199/231672196-09011ae7-699b-4813-bcf6-47d734d7dc65.jpg)
---
### 선택한 게시판 내에서 소분류 가능
![KakaoTalk_20230413_152456526](https://user-images.githubusercontent.com/98436199/231672113-71da4845-ea9d-4375-81a8-89983f90eb0b.jpg)
---
### summernote edtion 적용
- 첨부파일 첨부시 DB서버에 저장
![writePage](https://user-images.githubusercontent.com/98436199/231668638-8eb8d565-9d62-4483-ab12-aaee570854b0.png)
---
### spring security를 통하여 게시물 및 댓글 작성, 수정, 삭제 권한 부여
![afterLoginAvailableReply](https://user-images.githubusercontent.com/98436199/231669008-0b9e6d88-5a49-4a6d-bdf8-0259a727b904.png)
--
![modifyReplyForAuthUser](https://user-images.githubusercontent.com/98436199/231669046-e7c68218-60f2-4fa2-80a1-c8183ae7941a.png)
