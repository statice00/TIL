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

  shareRes - **models.py** 코드 추가

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

  

- 테이블 생성

  shareRes - **models.py** 코드 추가

  ```python
  class Restaurant(models.Model):
      category = models.ForeignKey(Category, on_delete=models.SET_DEFAULT, default=3)
      restaurant_name = models.CharField(max_length = 100)
      restaurant_link = models.CharField(max_length = 500)
      restaurant_content = models.TextField()
      restaurant_keyword = models.CharField(max_length = 50)
  ```

  - model을 데이터베이스에 반영

    ```bash
    python manage.py makemigrations
    ```

  - 실제 적용

    ```bash
    python manage.py migrate
    ```





- cmd창(db처리)으로 확인

  ```bash
  conda activate restDoList
  cd C:\study\RestaurantShare-with-Django\restproject
  
  python manage.py dbshell
  .tablesvs code는 웹서버 처리
  ```

- vs code는 웹서버 처리

  ```bash
  python manage.py runserver
  ```

  <br/>
---
  <br/>

### categoryCreate/  카테고리 만들기

- 작동할 함수 생성

  shareRes - **views.py** 에 코드 추가

  ```python
  def categoryCreate(request):
      return render(request, 'shareRes/categoryCreate.html')
  ```

- categoryCreate/ 가 입력되면 views .categoryCreate 함수 실행되게 하는 path 지정

  shareRes - **urls.py** 에 코드 추가

  ```python
  urlpatterns = [
      path('', views.index, name='index'),
      path('categoryCreate/', views.categoryCreate, name='cateCreatePage')
  ]
  ```

  

- cagoryCreate/ 에서 입력한 category받아서 create/ 창 실행

  shareRes - **views.py** 에 코드 추가

  ```python
  from django.http.response import HttpResponseRedirect
  from django.urls import reverse
  
  from .models import *
  
  def index(request):
      #return HttpResponse('index')
      categories = Category.objects.all() # select * from shapreRes_category;
      restaurants = Restaurant.objects.all()
      content = {'categories' : categories, 'restaurants' : restaurants}
      return render(request, 'shareRes/index.html', content)
  
  
  def create_category(request):
      category_name = request.POST['categoryName']
      new_category = Category(category_name = category_name)
      new_category.save()
      return HttpResponseRedirect(reverse('index'))
  ```
  
  <br/>

- categoryCreate/create 가 입력되면 views .create_category 함수 실행되게 하는 path 지정

  shareRes - **urls.py** 에 코드 추가

  ```python
  urlpatterns = [
      path('', views.index, name='index'),
      path('categoryCreate/', views.categoryCreate, name='cateCreatePage'),
      path('categoryCreate/create', views.create_category, name='cateCreate'),
  ]
  ```

<br/>

- 맛집추가하기 누르면 /restaurantCreate/ 입력

  http://127.0.0.1:8000/restaurantCreate/ 에서 입력후 맛집 추가를 누르면 /restaurantCreate/create 입력

  shareRes - **views.py** 에 코드 추가

  ```python
  def restaurantCreate(request):
      categories = Category.objects.all()
      content = {'categories' : categories}
      return render(request, 'shareRes/restaurantCreate.html', content)
  
  
  def Create_restaurant(request):
      category_id = request.POST['resCategory']
      category = Category.objects.get(id = category_id)
      name = request.POST['resTitle']
      link = request.POST['resLink']
      content = request.POST['resContent']
      keyword = request.POST['resLoc']
      new_res = Restaurant(category = category, restaurant_name = name, restaurant_link = link, restaurant_content = content, restaurant_keyword = keyword)
      new_res.save()
      return HttpResponseRedirect(reverse('index'))
  ```

<br/>

- restaurantCreate/ 가 입력되면 views .restaurantCreate 함수 실행되게 하는 path 지정

  restaurantCreate/create 가 입력되면 views.Create_restaurant 함수 실행되게 하는 path 지정

  shareRes - **urls.py** 에 코드 추가

  ```python
  path('restaurantCreate/', views.restaurantCreate, name='resCreatePage'),
  ```

  - 데이터 확인

    cmd창에서 입력

    ```bash
    select * from shareRes_restaurant;
    ```

    카테고리 데이터 삭제(1 한식 2 중식) 하는법

    ```bash
    delete from shareRes_category;
    ```

    카테고리는 삭제됐지만 데이터는 그대로 남아있음

    새로 카테고리를 만들면 (3 한식 4 중식)으로 생성되어서 데이터를 안가져옴 


<br/>
<br/>

### restaurantDetail/ 상세내용 보이게 하기

-  /restaurantDetail/{{restaurant.id}} 입력되면 상세내용 보이게 하는 함수 생성

   shareRes - **views.py** 에 코드 추가

   ```python
   def restaurantDetail(request, res_id):
       restaurant = Restaurant.objects.get(id = res_id) # select * from  shareRes_restaurant where id=res_id
       content = {'restaurant' : restaurant}
       return render(request, 'shareRes/restaurantDetail.html', content)
   ```
<br/>

- /restaurantDetail/{{restaurant.id}} 입력되면 views.restaurantDetail 함수 실행되게 하는 path 지정

  shareRes - **urls.py** 에 코드 추가

  ```python
  path('restaurantDetail/<str:res_id>', views.restaurantDetail, name='resDetail'),
  ```

<br/>  
<br/>


### restaurantUpdate/ 수정하기 
- restaurantUpdate

  category도 담아와서 옮겨주게 한다

  shareRes - **views.py** 에 코드 추가
  
  ```python
  def restaurantUpdate(request, res_id):
      categories = Category.objects.all()
      restaurant = Restaurant.objects.get(id = res_id) # select * from shareRes_restaurant where id=res_id
      content = {'categories' : categories, 'restaurant' : restaurant}
      return render(request, 'shareRes/restaurantUpdate.html', content)
  
  ```
  
  - restaurantUpdate.html 에서 참조할 이름들 확인
  
    93행~
  
    categories
  
    restaurant
  
    type = "hidden" : hidden되어 있는 값도 같이 가지고 간다

<br/>

- /restaurantDetail/updatePage/{{restaurant.id}} 입력되면 views.restaurantUpdate 함수 실행되게 하는 path 지정

  shareRes - **urls.py** 에 코드 추가

  ```python
  path('restaurantDetail/updatePage/<str:res_id>', views.restaurantUpdate, name='restUpdatePage'),
  ```

 <br/> 

- 맛집 수정! 눌렀을때 작동

  shareRes - **views.py** 에 코드 추가

  ```python
  def Update_restaurant(request):
      resId = request.POST['resId']
      change_category_id = request.POST['resCategory']
      # select * from shareRes_category where id=
      change_category = Category.objects.get(id = change_category_id) 
      change_name = request.POST['resTitle']
      change_link = request.POST['resLink']
      change_content = request.POST['resContent']
      change_keyword = request.POST['resLoc']
      
      # update category=change_category, restaurant_name = chanege_name
      # from shareRes_restaurant
      # where id =
      before_restaurant = Restaurant.objects.get(id = resId)
      before_restaurant.category = change_category
      before_restaurant.restaurant_name = change_name
      before_restaurant.restaurant_link = change_link
      before_restaurant.restaurant_content = change_content
      before_restaurant.restaurant_keyword = change_keyword
      before_restaurant.save()
      return HttpResponseRedirect(reverse('resDetail', kwargs={'res_id':resId}))
  ```
  
<br/>
  
- /restaurantDetail/updatePage/update 입력되면 views.update_restaurant 함수 실행되게 하는 path 지정
  
  shareRes - **urls.py** 에 코드 추가
  
  ```python
  path('restaurantDetail/updatePage/update', views.Update_restaurant, name='resupdate'),
  ```
  
  int() error때문에 path 순서 중요.  
  
  ```python
  urlpatterns = [
      path('', views.index, name='index'),
      path('categoryCreate/', views.categoryCreate, name='cateCreatePage'),
      path('categoryCreate/create', views.create_category, name='cateCreate'),
      path('restaurantCreate/', views.restaurantCreate, name='resCreatePage'),
      path('restaurantCreate/create', views.Create_restaurant, name='rewCreate'),
      path('restaurantDetail/<str:res_id>', views.restaurantDetail, name='resDetail'),
       
      path('restaurantDetail/updatePage/update', views.Update_restaurant, name='resupdate'),
      
      path('restaurantDetail/updatePage/<str:res_id>', views.restaurantUpdate, name='restUpdatePage'), 
  ]
  ```
  
  <br/>
  <br/>
  
  
### restaurantDetail/delete 삭제하기

- shareRes - **views.py** 에 코드 추가
  
  retaurantdetail.html에 116행 restaurant 테이블의 id값 확인 : resId
  
  ```python
  def Delete_restaurant(request):
      res_id = request.POST['resId']
  
      # delete from shareRes_restaurant where id=res_id
      restaurant = Restaurant.objects.get(id = res_id)
      restaurant.delete()
      return HttpResponseRedirect(reverse('index'))
  ```
  
  <br/>

- /restaurantDetail/delete 입력되면 views.Delete_restaurant 함수 실행되게 하는 path 지정
  
  shareRes - **urls.py** 에 코드 추가
  
  ```python
   path('restaurantDetail/delete', views.Delete_restaurant, name='catedelete'),
  ```
  
  int() error때문에 path 순서 중요.  
  
  ```python
  urlpatterns = [
      path('', views.index, name='index'),
      path('categoryCreate/', views.categoryCreate, name='cateCreatePage'),
      path('categoryCreate/create', views.create_category, name='cateCreate'),
      path('restaurantCreate/', views.restaurantCreate, name='resCreatePage'),
      
      path('restaurantDetail/delete', views.Delete_restaurant, name='resdelete'),
  
      path('restaurantCreate/create', views.Create_restaurant, name='rewCreate'),
      path('restaurantDetail/<str:res_id>', views.restaurantDetail, name='resDetail'),
      path('restaurantDetail/updatePage/update', views.Update_restaurant, name='resupdate'),
      path('restaurantDetail/updatePage/<str:res_id>', views.restaurantUpdate, name='restUpdatePage'), 
  ]
  ```
  
  <br/>
  <br/>
  
  ### Email보내기
  
- **sendEmail** 이름의 web만들기
  
  ```bash
  python manage.py startapp sendEmail
  ```
  
  <br/>

- restproject - **settings.py**  에 들어가서
  
  **INSTALLED_APPS**에 **'sendEmail'** 추가
 
  <br/>
  
- restproject - sendEmail폴더에 **urls.py**파일 생성 및 입력
  
  ```python
  from django.urls import path, include
  from . import views
  
  urlpatterns = [
      
  ]
  ```

<br/>

- restproject - **urls.py** 에 path 추가

  sendEmail/ 로 들어오면 sendEmail.urls로 권한을 넘긴다

  ```python
  path('sendEmail/', include('sendEmail.urls')),
  ```

<br/>

- sendEmail - **views.py**에 코드 추가

  ```python
  from django.shortcuts import render
  from django.http import HttpResponse, HttpResponseRedirect
  from django.urls import reverse
  from shareRes.models import *
  import smtplib
  from email.mime.text import MIMEText
  from email.mime.multipart import MIMEMultipart
  from django.core.mail import send_mail, EmailMessage
  from django.template.loader import render_to_string
  ```

<br/>

- ~하게 하는 함수 생성

  sendEmail - **views.py**에 코드 추가

  ```python
  def sendEmail(request):
      try:
          checked_res_list = request.POST.getlist('checks')
          inputReceiver = request.POST['inputReceiver']
          inputTitle = request.POST['inputTitle']
          inputContent = request.POST['inputContent']
          
          print(checked_res_list, '/', inputReceiver, '/', inputTitle, '/', inputContent)
          restaurants = []
  
          for checked_res_id in checked_res_list:
              restaurants.append(Restaurant.objects.get(id = checked_res_id))
  
          content = {'inputContent' : inputContent, 'restaurants' : restaurants}
          msg_html = render_to_string('sendEmail/email_format.html', content)
          print(msg_html)
          msg = EmailMessage(subject = inputTitle, body=msg_html, from_email="123gusdyd@gmail.com", bcc=inputReceiver.split(','))
          msg.content_subtype = 'html'
          msg.send()
          return render(request, 'sendEmail/sendSuccess.html')
  
      except :
          return render(request, 'sendEmail/sendFail.html')
  ```

<br/>

- /send 입력되면 views.sendEmail 함수 실행되게 하는 path 지정

  shareRes - **urls.py** 에 코드 추가

  ```python
  path('send/', views.sendEmail)
  ```

  

- ```python
  
  ```


  

  

  

  

