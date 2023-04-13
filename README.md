## 개발 목표
커뮤니티 게시판 웹 ***개인 프로젝트***
- 카테고리 별로 게시판 분류
- 케테고리 안에 소분류로 원하는 게시판 분류 가능
- Spring Security를 이용하여 권한이 주어진 회원만 게시물 등록, 수정 및 삭제
- text edition 'summernote edition' 적용

## 사용기술
서버 : apache - tomcat - 9.0.11

- Spring Tool Suite 3
- Mybatis
- Spring Security
- summernote edition
Database : Oracle SQL Developer

사용 언어 : Java, HTML, CSS, Jquery, SQL

버전 관리 : Git 


## 개선 및 업데이트 예정
- 회원 마이 페이지
- 게시물 스크렙 기능
- 회원 프로파일 이미지
- 게시물 리스트 정렬 방식(필터)
------
### 메인페이지
- 사이드 박스에 조회수 순위가 높은 게시물, 댓글 달린 순위가 높은 게시물, 게시물 작성 순위가 높은 회원순을 사이드 박스에 표시
- 카테 고리 네개를 최신 순서로 박싱처리
![main](https://user-images.githubusercontent.com/98436199/231664133-747e60f4-a5fb-4ef5-8584-1499900fc5bc.png)


## 전체 기시물 
- 전체 게시물을 생성 시간으로 페이징 정렬
![ListAll](https://user-images.githubusercontent.com/98436199/231664325-0e38a48c-69f6-4e6c-a71a-d0b918a3dab2.png)
