### docker run 커맨드 정리

---

docker run은 컨테이너를 실행하기 위해서 쓰이는 커맨드

여러가지 옵션을 통해 다양한 방식으로 컨테이너를 실행할 수 있게 해준다.



### 기본 포맷

```bash
$ docker run (<옵션>) <이미지 식별자> (<명령어>) (<인자>)
```



### -d 옵션

백그라운드에서 컨테이너를 실행해야 하는 경우 사용

이 옵션을 사용하면 컨테이너가 detached 모드에서 실행되며, 실행 결과로 컨테이너 ID만을 출력함



예시: `python:3.8-alpine` 이미지로 부터  `python -m http.server` 명령어를 백그라운드로 실행

```bash
$ docker run -d python:3.8-alpine python -m http.server
0b920d2f561437418b8fdc0e9bcfdd4c9d634983ded18ba35a4dbae012753a72
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
0e4fe552200f        python:3.8-alpine   "python -m http.serv…"   5 seconds ago       Up 4 seconds                            gifted_chaplygin
```

docker ps로 컨테이너 목록 확인해보면 백그라운드로 실행한 컨테이너 확인 가능



위에서 실행한 명령어를 -d옵션 없이 실행했다면, 해당 터미널에서 `Ctrl + c`를 눌러서 빠져나오는 순간 해당 컨테이너도 종료됨



### -it 옵션

 `-i` 옵션과 `-t` 옵션은 같이 쓰이는 경우가 매우 많음. 이 두 옵션은 컨테이너를 종료하지 않은 상태로, 터미널의 입력을 계속해서 컨테이너로 전달하기 위해서 사용. 따라서, `-it` 옵션은 특히 컨테이너의 쉘(shell)이나 CLI 도구를 사용할 때 매우 유용하게 사용됨.

```bash
$ docker run -it python:3.8-alpine
Python 3.8.2 (default, Mar 24 2020, 02:56:01)
[GCC 9.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> print("Hi!")
Hi!
>>>
```



### --name 옵션

컨테이너를 제어할 때 컨테이너 id를 사용하면 기억하기 어려워 불편함. 컨테이너에 이름을 부여해주면 해당 이름으로 컨테이너 식별 가능



 `my-server`라는 이름으로 컨테이너를 실행한 후에, `docker kill` 커맨드로 해당 컨테이너를 종료하거나, `docker rm` 커맨드로 해당 컨테이너를 삭제할 때 컨테이너 이름을 컨테이너 ID 대신에 사용.

```bash
$ docker run -d --name my-server python:3.8-alpine python -m http.server
7899108d467cc423e20a3d6cb250070baae01fa541b037707afbbe8d1e9e3000
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
7899108d467c        python:3.8-alpine   "python -m http.serv…"   2 seconds ago       Up 3 second                             my-server
$ docker kill my-server
my-server
$ docker rm my-server
my-server
```



### -e 옵션

컨테이너의 환경변수를 설정하기 위해서 사용하는 옵션. 이 옵션을 사용하면 Dockerfile의 `ENV`설정도 덮어씌워짐



`FOO` 환경변수를 `bar`로 세팅하고 환경변수를 출력

```bash
$ docker run -e FOO=bar python:3.8-alpine env
```



### -p 옵션

호스트와 컨테이너 간의 포트(port) 배포(publish)/바인드(bind)를 위해서 사용. 호스트(host) 컴퓨터에서 컨테이너에서 리스닝하고 있는 포트로 접속할 수 있도록 설정해줌



아래 커맨드는 컨테이너 내부에서 `8080` 포트로 리스닝하고 있는 HTTP 서버를 호스트 컴퓨터에서 `80` 포트로 접속할 수 있도록 해줌.

```bash
$ docker run -d -p 80:8000 python:3.8-alpine python -m http.server
```



### -v 옵션

호스트와 컨테이너 간의 볼륨(volumn) 설정을 위해서 사용. 호스트(host) 컴퓨터의 파일 시스템의 특정 경로를 컨테이너의 파일 시스템의 특정 경로로 마운트(mount)를 해줌.



아래 커맨드는 호스트 컴퓨터의 현재 디렉터리를 컨테이너의 `/etc` 경로로 마운트한 후, 그 안에 있는 `test.txt` 파일의 내용을 출력.

```bash
$ echo Hi > test.txt
$ docker run -v `pwd`:/etc python:3.8-alpine cat /etc/test.txt
```



### -w 옵션

Dockerfile의 `WORKDIR`설정을 덮어쓰기 위해서 사용



컨테이너의 작업 디렉토리를 /etc로 변경하는 커맨드

```bash
$ docker run -w /etc python:3.8-alpine pwd
```



### --entrypoint 옵션

Dockerfile의 `ENTRYPOINT` 설정을 덮어쓰기 위해 사용



`python:3.8-alpine` 이미지로 부터 `python --version`을 실행하고 싶다면 다음과 같이 커맨드를 실행

```bash
$ docker run --entrypoint python python:3.8-alpine --version
```



### --rm 옵션

컨테이너를 일회성으로 실행할 때 주로 사용

컨테이너가 종료될 때 컨테이너와 관련된 리소스까지 전부 제거

```bash
$ docker run --rm -it wernight/funbox nyancat
```

