![git_basic](https://miro.medium.com/max/1106/1*HJIbiE3SWPtAmJP1wgvOTg.png)
## git bash

1. 기초

 버전 확인

  ```bash
  git --version
  ```

현재 내가 있는 폴더에 어떤 폴더와 파일이 있는지 출력한다.

숨겨져 있는 폴더와 파일까지 출력하려면 -a 를 붙인다.(all)

.이 붙어 있으면 숨김처리된 폴더나 파일이다. (.git)

  ```bash
  ls
  ls -a
  ```



현재 내가 동작하고 있는 폴더의 위치를 출력한다. 

print working directory

  ```bash
  pwd
  ```

  ```bash
  ```

 ```bash
 
 ```

 ```bash
 ```

 ```bash
 ```

 ```bash
 ```

 ```bash
 ```

 ```bash
 ```

 ```bash
 ```

 ```bash
 ```

  ```bash
  pwd  #print working directory 현재 내가 동작하고 있는 폴더 위치 출력
  cd ~ # change directory 
       # ~는 홈폴더, /는 최상단을 의미
  cd Desktop  # 바탕화면으로 이동
  mkdir first # make directory    first라는 이름의 폴더생성
  cd first    # first폴더로 이동
  ```

- git  기본 사용법

  ```bash
  git init    # initialize  .git이라는 하위 디렉토리를 생성
              # .git 디렉토리에는 저장소에 필요한 뼈대 파일이 들어 있음
              # .git 으로 생성되었으므로 ls -a로 확인가능
              # 오른쪽에 (master) 가 떠있어야 git으로 관리되는 중임
  touch a.txt # touch : 파일을 생성
  git status  # 현재 저장소의 상태 확인
              # 아무것도 없으면 git add를 써서 tracking되는 파일을 만들라고 뜸
  git add a.txt  # a.txt 파일을 staging area에 add
                 # git status 다시 실행해보면 a.txt파일이 staging area에 올라간것을 확인
  # git을 처음 사용한다면 commit 명령어로 실제 버전을 반들기 전에 사용자를 설정해야함
  # 
  git config --global user.email " 123gusdyd@gmail.com"
  git config --global user.name "statice00"
  git commit -m "my first commit"  # 다시 돌려보면 a.txt 생성되었다고 뜸
  git commit -m "my first commit"     # git 커밋을 남길건데 
                        # -m : 문자
                        # 기본적으로 남겨야할 정보(이메일, 이름)달라고 뜸
  git log  # 고유값과 작성한시간 작성한 메세지 등등 뜸
   깃허브 로그인 후 레포 생성 후 아래 구문 복사해서 깃 배쉬에 붙여넣기 후 실행
  git remote add origin https://github.com/statice00/my-first-git.git
   #git깃이라는 프로그램에게 remote원격저장소관리해줘  add새로추가해줘 origin이라는별명으로 https://실제주소는여기야
  git remote -v  # 원격저장소의 별명과 실제주소 확인
  git push origin master # 깃허브 원격저장소에 보내기
   # 깃아 넣어줘 origin에게 master를
  ```

  

