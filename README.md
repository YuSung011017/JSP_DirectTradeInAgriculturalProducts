* 먼저 처음 진입 화면입니다.
* http://localhost:8080/DirectTradeInAgriculturalProducts/welcom/welcom.jsp 주소로 접근하면
![image](https://github.com/user-attachments/assets/b1956e76-2fa5-45ed-a203-fb9583723a54)
* welcom.jsp 파일이 나타나게 되며 로그인 및 회원가입을 할 수 있습니다. 회원가입을 보면 
![image](https://github.com/user-attachments/assets/52a9d1f6-2cae-4112-93d7-15d33ac62e5c)
![image](https://github.com/user-attachments/assets/530e171a-e798-4eb0-9875-8178fb101775)
* 다국어 처리를 적용하였습니다.
판매자 유형을 분리할 수 있습니다. 만약 판매자로 가입하게 된다면 자신의 상품에 대한 테이블이 자동으로 생성되게 됩니다.
![image](https://github.com/user-attachments/assets/2e96b1ab-2670-4de2-a4fe-a722af174bb6)
* 회원가입을 성공하면 위와 같은 페이지로 전송이 되어 메인페이지로 갈 수 있게됩니다.
* 다음 구매자가 접근하는 화면을 보면
![image](https://github.com/user-attachments/assets/c94491b3-66ee-448e-a37b-f7f3fe5fc38b)
* 메인페이지와 정보수정 로그아웃 페이지로 갈 수 있습니다.
* 로그인은 세션을 활용하여 구현하였습니다.
![image](https://github.com/user-attachments/assets/a0d31045-0236-4fa7-9909-3dbc1958914f)
* update 화면입니다. Info디렉토리에서 개인정보를 업데이트 할 수 있게 구현하였습니다.
![image](https://github.com/user-attachments/assets/2c6645da-0e93-455c-bc13-3d481b2375bd)
* 메인페이지로 넘어오면 위와 같이 판매자들의 개인 사이트를 방문할 수 있게됩니다.
* 상품 보기를 클릭하면
![image](https://github.com/user-attachments/assets/613fbde6-5671-4e20-b22f-04058c021b49)
* 판매자가 등록한 상품들을 볼 수 있습니다
* 상세 보기를 클릭하면
![image](https://github.com/user-attachments/assets/6e5238e2-ea5c-4297-9591-111e322f30c1)
* 위와 같이 상품의 상세 정보와 원한다면 장바구니에 담을 수 있습니다.
* 장바구니에 담으면
![image](https://github.com/user-attachments/assets/c11b54b8-e012-4d36-9a5a-2fa397be384f)
![image](https://github.com/user-attachments/assets/f76e4443-2a03-4697-919a-a0cc54030e5b)
* 위 사진들과 같이 장바구니에 담을 수 있습니다.
* 장바구니에는
![image](https://github.com/user-attachments/assets/28b7e509-cf8f-44fa-9670-6a94d8e30d92)
* 장바구니에 담은 상품들의 리스트를 볼 수 있습니다.
* 원한다면 주문을 할 수 있습니다
![image](https://github.com/user-attachments/assets/4ed10842-bd91-45e1-9a98-2ecfd9ee3ef9)
* 배송정보를 입력하고
![image](https://github.com/user-attachments/assets/c7a6cf1c-24a9-441c-84d2-fed7952f33eb)
* 주문을 완료할 수 있습니다.
* 지금까지 주문한 내역도 확인할 수 있습니다. order라는 테이블에 자신의 주문 정보가 저장되어있기 때문입니다
![image](https://github.com/user-attachments/assets/032853bd-30cb-4862-9958-099bd5a819d2)
* 이제 판매자 페이지로 가보겠습니다. 구매자와 같이 welcom페이지에서 메인페이지로 간다면
![image](https://github.com/user-attachments/assets/491ec956-132a-4913-9a9e-2df15248ddfe)
* 위와 같이 자신의 개인페이지가 나타나게 됩니다.
* 현재 자신이 등록한 상품의 개수와 구매자가 주문한 상품의 수 오늘 할일이 나타나게 됩니다.
* 상품을 추가하려면 상품 관리 버튼을 누르
![image](https://github.com/user-attachments/assets/f42f1ef5-8209-4046-8ed6-eb144c31cda4)
* 위와 같이 상품을 등록할 수 있습니다
![image](https://github.com/user-attachments/assets/596ca627-032b-4558-a7a5-16250a259c8b)
* 예외 처리를 했기 때문에 형식에 맞게 작성해야 합니다
![image](https://github.com/user-attachments/assets/e88906f0-8a52-4cf3-bc36-e11366068aec)
* 상품 정보 또한 수정할 수 있습니다



