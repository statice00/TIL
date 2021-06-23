![mtv](https://blog.kakaocdn.net/dn/bzINQ4/btqFzcVM3ZI/4ZLxC3fNW5XGymfzagBdSk/img.jpg)

<br/>

### 데이터 입력

- 작동할 함수 생성

  my_to_do_app - **views.py**에 코드 추가

  ```python
  from .models import * #models.py에 있는 Todo 클래스 사용하기 위해 추가
  
  def createTodo(request):
      #return HttpResponse('create Todo!!!!') # 그냥 확인용
      user_input_str = request.POST['todoContent']  # POST 메소드로 받음
      new_todo = Todo(content=user_input_str) # Todo클래스의 content속성에 uwer_input_str값을 사용해라
      new_todo.save() # my_to_do_app_todo 테이블에 저장
      return HttpResponse('create Todo=' + user_input_str)
  ```

  <br/>

- path 지정

  전체에 적용되는 myproject - **urls.py**  들어감

  app경로는 하나씩만 있어야 해서 이미 my_to_do_app.urls로 이동하게 하는 path가 있으므로 추가로 작성 안한다 .

  ```python
  path('','my_to_do_app.urls')
  ```

  위 경로(my_to_do_app - **urls.py**)로 이동

  https://127.0.0.1:8000/createTodo/ 로 입력되면  views.createTodo 함수 수행하게 하는 코드 작성

  ```python
  path('createTodo/',views.createTodo)
  ```

  <br/>

- action 지정

  my_to_do_app - templates - my_to_do_app   **index.html** 코드 수정

  . : 현재  https://127.0.0.1:8000/

  ```html
  <form action="./createTodo/" method="POST">
  ```

   주소창에 https://127.0.0.1:8000/ 입력, 문자 입력 후 메모하기 누르면  https://127.0.0.1:8000/createTodo/ 로 이동됨
  
  <br/>

- 입력된 데이터 확인

  터미널 킬하고 새로운 터미널 창 시작

  ```bash
  cd myproject
  conda activate ToDoList
  ```
  
  sqlite 실행해서 table 확인
  
  ```bash
  python manage.py dbshell
  select * from my_to_do_app_todo; # 크롬에서 메모하기로 입력했던 문자가 저장되어 있음
  ```
  
<br/>  
<br/>

---

<br/>
<br/>

### 테이블에 저장된 데이터를 client로 

<br/>

- name에서 지정한 값 내부에서 자동적으로 reverse로 호출

  my_to_do_app - **views.py** 코드 추가

  ```python
  from django.http import HttpResponse,HttpResponseRedirect
  from django.urls import reverse      # django 제공 reverse 가져옴
  
  def createTodo(request):
      #return HttpResponse('create Todo!!!!')
      user_input_str = request.POST['todoContent']
      new_todo = Todo(content=user_input_str)  
      new_todo.save() # my_to_do_app_todo 테이블에 저장
      #return HttpResponse('create Todo=' + user_input_str) # 응답만 하고 끝
      
      return HttpResponseRedirect(reverse('index')) # 응답하고 내부에서 자동적으로 다시 index 요청
  ```

<br/>

- index.html과 연동

  my_to_do_app - **views.py** 코드 추가

  ```python
  def index(request):
      #return HttpResponse('my_to_do_app first page')
      # my_to_do_app_todo테이블의 모든데이터를 가져와라
      todos = Todo.objects.all()
      content = {'todos' : todos}

      # index.html에서 content값 연동
      return render(request, 'my_to_do_app/index.html', content) 
  ```
  
  <br/>
  
- path 대신에 name으로 함수가 실행되도록 지정

  소스 내부에서 다시 실행이 되도록 호출하기 위해 name속성이 지정된 값을 이용해서 호출

  my_to_do_app - **urls.py** 코드 추가

  ```python
  urlpatterns = [
      path('', views.index, name='index'),
      path('createTodo/',views.createTodo, name='createTodo'))
  ]
  ```
  
  <br/>
  
- my_to_do_app - **index.html** 코드 추가

  {{todo.content}}  

  {{todo.id}}

  ```html
        {% for todo in todos %}
        <form action="" method="GET">
            <div class="input-group" name='todo1'>
                <li class="list-group-item">{{todo.content}}</li>
                <input type="hidden" id="todoNum" name="todoNum" value="{{todo.id}}"></input>
        
            
            </div>
        </form>
        {% endfor %}
  ```

    - html에서 python 문법

      ```html
      {% for todo in todos %}
      <p>korea</p>
      <span>{{todo.content}}</span>
      {% endfor %}
      ```

  <br/>

  주소창에 https://127.0.0.1:8000/ 입력, 문자 입력 후 메모하기 누르면 테이블에 저장과 동시에 client로 

  <br/>
  <br/>
 
---

<br/>
<br/>

  ### 삭제기능 추가

  <br/>

- 작동할 함수 생성

    my_to_do_app - **views.py** 코드 추가
  
    ```python
    def deleteTodo(request):
        done_todo_id = request.GET['todoNum']
        print('완료한 todo의 id', done_todo_id)
        todo = Todo.objects.get(id=done_todo_id)
        todo.delete() # 삭제
        return HttpResponseRedirect(reverse('index')) # 화면에 보이게함
    ```
    
    <br/>
    
- path 지정

   my_to_do_app - **urls.py** 코드 추가
  
    ```python
    path('doneTodo/', views.deleteTodo, name='doneTodo')
    ```
   
   <br/>
   
- action 지정

   my_to_do_app - **index.html** 코드 추가
  
    ```html
    <form action="./doneTodo/" method="GET">
    ```
   
   https://127.0.0.1:8000/ 에서 입력된 문자 '완료' 누르면 삭제됨

  <br/>
  <br/>

### 삭제가 아닌 보이지만 않게 설정하기


<br/>

- 테이블 생성

  my_to_do_app - **models.py** 코드 추가

  ```python
  class Todo(models.Model): 
      isDone = models.BooleanField(default=False)
  ```

  - model을 데이터베이스에 반영시키기

    terminal  ctril+c로 break 후 코드 입력

    00002_todo_jsdone.py 생성됨

    ```bash
    python manage.py makemigrations
    ```

  - 실제 적용

      ```python
      python manage.py migrate
      ```

      - sqlite 실행해 테이블 확인

        ```bash
        python manage.py dbshell
        select * from my_to_do_app_todo;
        .quit
        ```

  <br/>

- 작동할 함수 생성

  완료버튼을 누른todo의  isDone을 True로 설정  

  True인 data는 보이지만 않게 하고 table에서 삭제가 안되게 한다.

  my_to_do_app - **views.py** 코드 추가

  ```python
  def boolTodo(request):
      done_todo_id = request.GET['todoNum']
      print('완료한 todo의 id', done_todo_id)
      todo = Todo.objects.get(id=done_todo_id)
      todo.isDone = True
      todo.save()
      return HttpResponseRedirect(reverse('index'))
  ```

  <br/>

- path 지정

  my_to_do_app - **urls.py** 코드 추가

  ```python
  path('isDoneTodo/', views.boolTodo, name='boolTodo')
  ```


<br/>

- html 수정  

  False이면 삭제, action = boolTodo/

  my_to_do_app - **index.html** 코드 추가

  ```html
  {% for todo in todos %}
  {% if todo.isDone == False %}
  <form action="./boolTodo/" method="GET">
        <div class="input-group" name='todo1'>
               <li class="list-group-item">{{todo.content}}</li>
                <input type="hidden" id="todoNum" name="todoNum" value="{{todo.id}}"></input>
                <span class="input-group-addon">
                <button type="submit" class="custom-btn btn btn-danger">완료</button>
                </span>
        </div>
  </form>
  {% endif %}
  {% endfor %}
  ```

<br/>

  - 크롬에서 입력된 데이터 행에 '완료' 버튼 누르면 사라짐

  <br/>

  - 테이블 확인  
    
    버튼을 누른 데이터는 True인 1값을 기지면서  table에서 삭제가 안됨

    ```bash
    python manage.py dbshell
    select * from my_to_do_app_todo;
    ```

  

  

  

  















