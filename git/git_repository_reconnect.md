## Git repository 연결해제 후 재연결
### remote: Invalid username or password 에러 해결 방법

</br>

- 원격 저장소 해제  
    기존에 연결되어 있던 원격 저장소를 제거
    ```git
    git remote remove origin
    ```
- 원격 저장소 다시 연결  
    ```git
    $ git remote add origin https://github.com/깃허브아이디/깃허브저장소명.git
    ```
    삭제했던 기존 경로 그대로 추가  
    깃허브아이디 : 내 깃허브 네임  
    깃허브저장소명 : repository 이름  

    - 현재 로컬 저장소의 원격 상태 확인
        ```git
        git remote -v
        ```

- 로컬 저장소의 원격 저장소 지정  
    ```git
    git push --set-upstream origin master
    ```
    - upstream : 로컬 저장소와 연결되어 있는 저장소  
    - 즉, 로컬 저장소의 연격 저장소를 위에서 입력한 원격 저장소로 지정하여 push 하는 것  
    - 이 명령어를 입력하고 나면 push 할 때 git push 만 입력하면 됨  
    - 버전에 따라 master 또는 main  

- login - verification
    - 위 과정을 거치고 나면 VScode에서 깃허브 로그인 화면 뜸  
    - email인증 or 토큰 로그인 선택 후 인증 진행하면 끝.