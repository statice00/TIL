## project

<br/>

- 가상환경 생성

  ```bash
  conda create -n restDoList python=3.8.8 anaconda
  ```

<br/>

- 가상환경 활성화

  ```bash
  conda activate restDoList
  ```

<br/>

- 가상환경에 django 설치

  ```bash
  conda install django
  ```

<br/>

- 프로젝트 생성

  ```bash
  django-admin startproject restproject
  ```

<br/>

- 작업공간 변경

  ```bash
  cd restproject
  ```

<br/>

- app 생성

  ```bash
  python manage.py startapp shareRes
  ```

<br/>

- restproject - **settings.py**  에 들어가서

  **INSTALLED_APPS**에 **'shareRes'** 추가

<br/>

- shareRes에 templates폴더 생성

  templates폴더 안에 shareRes 폴더 생성

  준비한 html파일들 넣는다

<br/>

  
- 실행할 함수 추가

  shareRes - **views.py** 에 코드 추가

  ```python
  from django.shortcuts import render
  from django.http import HttpResponse
  
  # Create your views here.
  def index(request):
      #return HttpResponse('index')
      return render(request, 'shareRes/index.html')  # render : html리턴해주는 함수
  ```

<br/>

- shareRes 폴더에 **urls.py** 파일 생성, 코드 작성

  path 지정(아무것도 없이 들어오면 views.index 실행)

  ```python
  from django.urls import path, include
  from . import views
  
  urlpatterns = [
      path('', views.index, name='index')
  ]
  ```

<br/>

- restproject.urls.py에 **shareRes.urls.py** 등록

  restproject - **urls.py** 파일에 코드 추가

  ```python
  from django.contrib import admin
  from django.urls import path, include
  
  urlpatterns = [
      path('', include('shareRes.urls')),
      path('admin/', admin.site.urls),
  ]
  ```

<br/>

- shareRes - templates - shareRes - **index.html**

  150번째 행 jquery 확인

  - javascript   vs   jquery 

    ```html
    <script>
    window.onload = function(){
        var pNode = document.getElementsByTagName('p');
    }
    </script>
    
    <script>
        $(document).ready(function(){
            var pNode = $('.aa');
        });
    </script>
    ```

  <br/>

- 테이블 생성

  shareReds - **models.py** 코드 추가

  ``` python
  class Category(models.Model):
      category_name = models.CharField(max_length=100)
  ```

  - model을 데이터베이스에 반영

    ```bash
    python manage.py makemigrations
    ```

  - 실제 적용

    ```bash
    python manage.py migrate
    ```

      - sqlite 실행해 테이블 확인

          ```bash
          python manage.py dbshell
          select * from my_to_do_app_todo;
          .quit
          ```

  <br/>

- d

  ```

