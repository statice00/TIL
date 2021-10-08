### python 메모리 에러 해결



#### **페이징 파일 크기를 증가시킨다**

윈도우10인 경우 윈도우 키 옆에 검색란에 `SystemPropertiesAdvanced`를 입력하면 다음과 같은 창이 뜬다. 

 



![img](https://blog.kakaocdn.net/dn/cF2qC3/btqEII8vnNp/wMupUvWf66Tr6RNmIQ4580/img.png)



여기서 성능의 설정을 클릭. 그 다음에 성능 옵션에서 고급으로 들어가면 다음과 같은 화면이 뜬다. 

![img](https://blog.kakaocdn.net/dn/b5nGJ6/btqEHOalDmE/srUKKX90H8yP8wkVauCeP0/img.png)



여기서 가상 메모리 파트의 변경을 클릭. 페이징 파일 크기를 변경하기 위함임. 여기에 "페이징 파일은 Windows에서 RAM처럼 사용하는 하드 디스크의 영역입니다"라고 간단히 설명되어 있음.

 

![img](https://blog.kakaocdn.net/dn/oMKmT/btqEIU10iVm/JZzmTxHLuRhCnw0mwkEig0/img.png)



사용자 지정 크기에서 처음 크기는 램 크기의 1.5배로 해주고, 최대 크기는 처음 크기의 3배로 해줌. 예를 들어, 8GB의 램이라면 1GB가 1024MB이므로 1024x8x1.5=12288을 처음 크기에 입력해주고, 최대 크기는 그것의 3배인 36864를 입력. 이렇게 설정한 후에 컴퓨터를 재부팅. 

