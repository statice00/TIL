### WSL에서 윈도우즈 파일 사용


리눅스 응용 프로그램에서 윈도우즈 파일에 접근해야 하는 경우는   
``/mnt/c/Users/윈도우즈사용자명/Documents/Projects/파일명``  
과 같이 접근할수 있다.   

다만 모든 리눅스 응용 프로그램이 /mnt를 사용하여 파일에 접근할 수 있는 것은 아니다.

이 문제는 심볼릭링크(symbolic link)를 이용하여 해결할 수 잇는데, 윈도우즈 디렉토리가 C:\Users\윈도우즈 사용자명\Documents\Projects와 같다면 아래와 같이 원하는 리눅스 디렉토리로 심볼릭링크를 설정하고 접근이 가능해진다.


```bash
$ ln -s "/mnt/c/Users/윈도우즈 사용자명/Documents/Projects" /home/리눅스 사용자명(홈디렉토리명)/Projects

```