## Git commit 삭제 취소 - reset

- git log 확인
    ```git
    git log
    ```
    최신 커밋에 (**HEAD** -> master) 표시됨

</br>

- git reset  
커밋도 취소되고 스테이지에서도 파일 내려짐
    - commit 전체 삭제
        ```git
        git reset HEAD^
        ```
    - commit 최근 3개 삭제
        ```git
        git reset HEAD^3
        ```
</br>

- 특정 커밋으로 되돌리기  
    commit hash 필요
    ```git 
    $ git log
    commit 466bcb2158654e228955fa3528cddb15db10be85 (HEAD -> master, origin/master, origin/HEAD)
    Author: statice00 <123gusdyd@gmail.com>
    Date:   Mon Jun 5 21:17:53 2023 +0900
    ```
    에서 commit 뒤에 부분이 hash  
    hash 부분만 복사하고
    ```git
    git reset 466bcb2158654e228955fa3528cddb15db10be85
    ```