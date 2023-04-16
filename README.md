# 🏡 HappyHouse

공공데이터와 OPEN API를 이용한 부동산 실거래가 정보 제공 및 커뮤니티 서비스 </br>
개발기간 : 2022.05.16~2022.05.27
## 프로젝트 소개
![004](https://user-images.githubusercontent.com/77961413/232291704-a6daa3e6-cb79-427e-865d-8c0ef7ec91b1.png)
![005](https://user-images.githubusercontent.com/77961413/232292067-77388fcb-3681-4386-b36c-ba34d48e4b4d.png)
![006](https://user-images.githubusercontent.com/77961413/232292153-0794e199-910c-4103-a693-f25eecd2e160.png)
## 팀소개
![팀소개](https://user-images.githubusercontent.com/77961413/232316175-64e036ff-e4c7-4d50-a712-ee9fa0148dda.png)

## 유스케이스 다이어그램
![유스케이스](https://user-images.githubusercontent.com/77961413/232316283-aa791d30-399a-4129-a96b-986e43f80460.png)

## 테이블 구조도
![테이블다이어그램](https://user-images.githubusercontent.com/77961413/232316200-14298337-84ba-4fbd-93b3-517b89926449.png)

## 개발 환경 및 시스템 아키텍쳐
![아키텍쳐](https://user-images.githubusercontent.com/77961413/232318788-fe1c98aa-8f4a-4208-99eb-7815ef13b421.png)





## 기능

### 홈화면

![home](https://user-images.githubusercontent.com/77961413/232333173-f8fba69f-c082-4a02-b468-c5cc4c6aabaa.gif)

### 오늘의 정보 기능_현재 날씨 기능

![그림2](https://user-images.githubusercontent.com/77961413/232318868-7832ae08-91de-473d-b582-ab69bace6b89.png)

* Geolocation api를 통해 사용자의 현재 위치에 접근 후 위치에 해당하는 경도와 위도 정보를 얻었습니다.
* 위 경도와 위도 정보를 OpenWeather Open api에 파라미터로 전달하여 해당위치의 실시간 날씨 정보를 제공합니다.
 
### 오늘의 정보 기능_실시간 부동산 뉴스 기능

![그림3](https://user-images.githubusercontent.com/77961413/232318880-ab69f144-72db-417c-90f8-cbd176b572a0.png)

* 네이버 검색 Open api를 이용하여 '부동산'을 키워드로 가지는 기사들을 최신 작성 순으로 정렬하여 실시간으로 제공합니다.

### 오늘의 정보 기능_서민금융상품 기본 정보 제공 기능

![그림4](https://user-images.githubusercontent.com/77961413/232318895-00348f29-833e-461f-87ed-b4a04bbedcfb.png)

* 금융위원회에서 제공하는 서민금융상품 기본 정보 Open api를 이용해 실시간으로 서민금융상품 기본 정보를 제공합니다
</br>
</br>
</br>

### 회원 기능

![회원가입git](https://user-images.githubusercontent.com/77961413/232327452-73c850fc-e843-46bf-bc89-6ad629e8756a.gif)

- 회원가입
  - 아이디, 이메일, 비밀번호를 기입 후 회원가입이 가능합니다.
  - jwt 토큰을 이용한 회원 관리로 보안성을 높였습니다.
- 로그인
  - 아이디, 비밀번호를 통해 로그인이 가능합니다.
  - 네이버와 연동하여 회원가입 및 로그인이 가능합니다.
- 회원정보
  - 로그인 후 사용자 이름, 이메일 주소, 관심지역 정보를 제공합니다. 	
  
### QnA 기능


![ezgif com-crop (1)](https://user-images.githubusercontent.com/77961413/232334263-e8639518-318e-4068-bafb-20b839efb69f.gif)


- QnA 리스트
  * QnA 게시글을 작성 순서에 따라 리스트로 제공합니다.
  * 글번호, 제작, 작성자, 작성일시, 조회수 정보를 제공합니다.
  * 질문하기 버튼을 클릭 시 QnA 작성 페이지로 이동합니다.
  * 검색하기 기능으로 검색어가 포함된 제목을 가진 QnA의 리스트를 제공합니다.
				
![ezgif com-crop (2)](https://user-images.githubusercontent.com/77961413/232334296-363ea902-07d7-4d1b-9441-60bc9666663a.gif)

- QnA 상세 기능
  * 제목, 작성일시, 작성자, 내용, 댓글 리스트 정보를 제공합니다.
  * 수정, 삭제, 목록, 답변하기 버튼을 통해 각각의 기능 수행을 할 수 있습니다.
 
### Map 기능



![ezgif com-crop (3)](https://user-images.githubusercontent.com/77961413/232334322-87479067-76cf-4322-a933-44f5eb300ade.gif)
- Map 화면 및 매물 거래 정보
  * 시/도 선택과 구/군 선택을 진행하면 해당하는 지역의 매물 거래 정보를 리스트로 제공합니다. 지도 컴포넌트는 해당하는 지역으로 이동하며 매물 거래 정보에 일치하는 위치에 마커를 생성합니다.

![ezgif com-crop (4)](https://user-images.githubusercontent.com/77961413/232334335-c52f158b-4e6e-426a-95ae-6cde0a2cae04.gif)
- Map 키워드 검색
  * 이동한 지도에서 중심을 기준으로 2km 이내의 반경에서 키워드 검색을 통한 장소 정보 제공을 할 수 있습니다. 
 

![ezgif com-crop (5)](https://user-images.githubusercontent.com/77961413/232334342-a614c525-b545-43ba-b199-cabd9195fa83.gif)

- 매물 상세 정보, 리뷰 및 별점, 주변 상권정보 제공  
  * 매물 거래 정보 리스트에서 매물을 클릭 시 상세 정보와 리뷰를 확인할 수 있고 직접 리뷰를 달 수 있습니다. 리뷰 객체에는 리뷰 제목, 리뷰 내용, 별점이 있습니다.
  ![메일](https://user-images.githubusercontent.com/77961413/232338961-c8565212-697d-4ec0-a3f9-e723f9ab0229.png)
  * 매물 거래 정보 상세 창에서 메일 보내기 버튼을 통해 상세 정보를 사용자의 메일 주소로 보낼 수 있습니다. 
  * 선택된 지역의 주변 상권 정보를 리스트로 제공합니다.
  
  
### 부동산타임 기능 (위치 기반 커뮤니티 기능)

![ezgif com-crop (6)](https://user-images.githubusercontent.com/77961413/232334360-cd4e8c9f-0625-4dc0-b873-c2d08a990267.gif)

- 부동산타임 메인 화면
  * Geolocation api를 이용해 얻은 사용자의 위치와 사용자가 선택한 위치가 일치하는 지 확인하고 일치하는 경우에만 게시판 접근 기능을 부여합니다.	게시판 접근 기능을 가진 사용자만이 글 작성 기능을 사용할 수 있습니다.
  * 게시글 목록에서 글번호, 제목, 작성일시, 좋아요, 조회수 정보를 제공합니다. 검색하기 기능을 통해 검색단어를 포함한 제목을 가진 게시글의 목록을 제공합니다.
  * 인기 매물 기능 : 해당 지역에서 리뷰 점수가 가장 높은 매물의 정보를 제공합니다.
  * 인기 게시글 기능 : 해당 지역 게시판에서 좋아요 수가 가장 높은 게시글의 정보를 제공합니다.
  
![ezgif com-crop (7)](https://user-images.githubusercontent.com/77961413/232334366-fda52483-9cce-4011-9faa-8d672b414aa8.gif)
- 부동산타임 자유 게시판
  - 제목, 내용, 비밀번호, 관심 키워드를 입력해 글을 작성할 수 있습니다.
  
![image](https://user-images.githubusercontent.com/77961413/232339020-e1992728-cc7c-433e-bf61-efcd2a4a4350.png)

![ezgif com-crop (8)](https://user-images.githubusercontent.com/77961413/232334371-3c50a049-1663-4a32-be9b-ab9331998e46.gif)
- 자유 게시판 상세보기
  * 게시글 관련 기능 - 수정, 삭제, 목록 이동, 댓글 달기 버튼을 통해 각각의 기능을 이용할 수 있습니다.
  * 게시글의 제목, 작성일, 내용, 좋아요수, 댓글 리스트를 제공합니다. 
  * 모든 글은 익명을 기반으로 게시되며 삭제 혹은 수정이 필요할 경우에는 작성 시 기입한 비밀번호와 일치하는 지 여부를 판단 후 일치할 경우에만 기능을 사용할 수 있습니다.
  * 모든 글은 익명을 기반으로 게시되며 삭제 혹은 수정이 필요할 경우에는 작성 시 기입한 비밀번호와 일치하는 지 여부를 판단 후 일치할 경우에만 기능을 사용할 수 있습니다.
