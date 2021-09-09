### ubuntu에서 파이썬 버전 변경

putty로 접속한 aws에서 python 버전문제 발생

우분투 기본 python path 설정 : 2.7

2.7버전에서 호환이 안되는 라이브러리가 많아 변경 필요



보통 경로는 /usr/bin 또는 /usr/lib 에 python경로가 설정되어있다.



### 설정 방법

putty login계정이름 : ubuntu

- `--config python` 옵션은 python의 버전을 변경하는 옵션이다.
- `$ sudo update-alternatives --config python` 를 입력하면 python의 버전을 변경 할 수 있다.

```bash
$ sudo update-alternatives --config python
update-alternatives: error: no alternatives for python
```

- 만약 위와같이 error로 python에 대한 alternative가 설정된것이 없다 뜰 경우, `--install [symbolic link path] python [real path] number` 명령어로 3.8같은 파이썬 버전 등을 등록해주면 된다.


 ```bash
  $ sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
  
  $ sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2
 
 ```

- 만약 경로를 하나만 등록한다면 

  ```bash
  update-alternatives: using /usr/lib/python3.8 to provide /usr/lib/python (python) in auto mode
  ```

  라는 문구가 뜬다.

  

- 이 후 다시 `sudo update-alternatives --config python`를 입력하면 설치되어있는 python 버전 선택 메뉴가 등장한다.

  원하는 python 버전의 번호를 선택한 후 엔터를 치면 해당 버전이 default path로 설정되게 된다.


```bash
$ sudo update-alternatives --config python
There are 2 choices for the alternative python (providing /usr/bin/python).

  Selection    Path                Priority   Status
------------------------------------------------------------
* 0            /usr/bin/python3.6   2         auto mode
  1            /usr/bin/python2.7   1         manual mode
  2            /usr/bin/python3.6   2         manual mode

Press <enter> to keep the current choice[*], or type selection number: 2
```

-   만약 경로 설정을 하나만 했다면 

    ```bash
    There is only one alternative in link group python (providing /usr/lib/python): /usr/lib/python3.8
    Nothing to configure.
    ```

    라는 문구가 뜬다.



### jupyternotebook에서..

그냥 kernel을 기본값인 python3(ipykernel)로 바꿔주면 해결..

