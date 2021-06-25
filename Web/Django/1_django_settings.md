## django 환경설정

- django에서 패턴 (책 p.142)

  ![mvc mvt](https://babytiger.netlify.app/media/mtv.png)
  ![pttern](https://babytiger.netlify.app/media/mvc-cycle.png)

---



1. 버전 확인

   ```bash
   conda -V
   ```
<br/>

2. 가상환경 생성

   ```bash
   conda create -n 가상환경이름 python=3.8.8 anaconda
   ```
<br/>
   

3. 생성된 가상환경 리스트 확인

   ```bash
   conda info --envs
   ```
<br/>
   

4. 가상환경 활성화  
   기존 터미털 kil하고 bash창 새로 연 다음 입력
   
   ```bash
   conda activate ToDoList
   ```
<br/>


~~가상환경 비활성화~~

~~conda deactivate ToDoList~~

~~가상환경 삭제~~
~~conda remove -n ToDoList --all~~

---

<br/>

5. django 설치

   ```bash
   conda install django
   ```
<br/>
   
6. django project 생성

   ```bash
   django-admin startproject myproject
   ```

- 위치 이동

  ```bash
  cd myproject
  ```
<br/>

7. 어플리케이션 생성

   해당 작업공간(myproject)에서 terminal 실행

   ```python
   python manage.py startapp my_to_do_app 
   ```
<br/>


8. myproject 폴더에서 **settings.py** 들어가서  
   INSTALLED_APPS 에 'my_to_do_app', 추가해서 등록  
   (앱을 생성했으면 반드시 이곳에 추가시켜야함)

<br/>
   
9. myproject폴더 **urls.py** 파일 들어가서 코드수정

   , include
   
   path('', include('my_to_do_app.urls')),  추가
   
   ```python
   from django.contrib import admin
   from django.urls import path, include
   
   urlpatterns = [
       path('', include('my_to_do_app.urls')),
       path('admin/', admin.site.urls),
   ]
   ```
<br/>

10. my_to_do_app 폴더에 urls.py 파일 생성 및 입력

    ```python
    from django.urls import path
    from . import views
    
    urlpatterns = [
        path('', views.index)  
     # ''아무것도 없이 요청이 들어오면 views.index실행해라
    ]
    ```
<br/>
    

11. my_to_do_app 폴더에 **views.py** 파일에 입력

    ```python
    from django.http import HttpResponse
    def index(request):
      return HttpResponse('my_to_do_app first page')
    ```
<br/>
    

12. server 실행 확인

    해당 작업공간(myproject)에서 terminal 실행 후 입력
    
    ```python
    python manage.py runserver
    ```

    - chrome 클라이언트에서 페이지 요청
    
       주소창에  http://127.0.0.1:8000/   입력

<br/>

---

---
<br/>


- HTML페이지를 응답

    my_to_do_app에  **templates**폴더 생성

    templates폴더 하위에 **my_to_do_app**폴더 생성(현재 앱 이름과 같게)

    templates-my_to_do_app 폴더 하위에 **index.html** 파일 생성 후 입력

    ```html
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
        <p> my homepage!!!</p>
    </body>
    </html>
    ```

   
    <br/>

    - my_to_do_app 폴더에 **views.py** 수정

      html파일을 클라이언트에 응답을 해줄때 render 함수 사용

    ```python
    from django.shortcuts import render
    from django.http import HttpResponse
    
    # Create your views here.
    def index(request):
        #return HttpResponse('my_to_do_app first page')
        return render(request, 'my_to_do_app/index.html')    
    ```

    주석처리 및 코드입력 후 서버 실행, 페이지 요청하면 my homepage!!! 뜸

<br/>
<br/>   

- DB Model  
    django에서는 table을 model로 표현하고 각각의 모델을 클래스로 정의

    my_to_do_app 폴더에 **models.py** 수정

    ```python
    from django.db import models
    
    # Create your models here.
    class Todo(models.Model):
        content = models.CharField(max_length = 255) # models.데이터타입(속성)
    ```

    - 해당 작업공간(myproject)에서 terminal 실행

      ctrl + c 로 quit server 후 입력

      ```bash
      python manage.py makemigrations
      ```

    - django에서 제공되는 model들 생성

      ```bash
      python manage.py migrate
      ```

      <br/>

    - **sqlite** 

      sqlite는 다른 db에 비해 가벼워서 모바일에서 사용됨

      ```bash
      python manage.py dbshell
      ```

      테이블 확인

      ```bash
      .tables
      ```

      테이블을 구성하는 필드의 이름과 타입 확인

      ```bash
      pragma table_info(my_to_do_app_todo);
      ```

      - out :

        ```bash
        0|id|integer|1||1
        1|content|varchar(255)|1||0
        ```

            맨뒤에 숫자 2개 의미 
            
            1 : not Null (허용안함)     1 : private key 사용
            
            0 : Null   (허용)           0 : private key 사용안함

      <br/>
      table의 데이터 검색

      ```bash 
      select * from my_to_do_app_todo;
      ```

      sqlite 종료

      ```bash
      .quit
      ```


      

