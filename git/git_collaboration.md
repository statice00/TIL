
![collaboratiom](https://www.cs.swarthmore.edu/~adanner/cs40/f14/gitrepos.gif)

### you   
깃허브 - repository - settings - Manage access에서 초대할 사람(깃허브 아이디) 추가  

### partner  
계정 이메일 확인 - 초대받은 레포 Code - 주소복사 -  
```bash
git clone <code주소>
```
생성된 폴더에서 vs code 실행  

---


위 과정은 상대방을 기다려야 되는 등 불편함 존재
## branch  
commit들이 연결된 상태에서 새로운 방향으로 가지가 나오는 것처럼 생성
```bash
git branch #현재 만들어져 있는 모든 branch의 목록을 보여주는 명령어
           #아무것도 안만들었으면 master만 나옴
git branch yong # yong 브랜치 생성
git switch yong #yong 브랜치로 이동
     # 로그 찍었을때 HEAD -> 가 가리키는 것이 현재 브랜치
     #  브랜치는 평행세계를 만든다 생각
git push origin yong
     # 깃허브 레포에서 branch 클릭하면 추가된 브랜치 확인 가능
```
### 깃허브 내부에서 merge 진행  
pull requests 탭 클릭 - New pull request 클릭   
내가 작성한 브랜치를 master브랜치에 합침  
base:master<-compare:yong  
설정하고 create pull request 누르면 합쳐달라 요청   
merge pull request 클릭 - confirm 
풀리퀘스트가 성공적으로 merge 되었습니다 라고 뜬다  
레포 가보면 브랜치가 master임에도 불구하고 yong브랜치에만 있었던 파일이 추가되어있음

```bash
git switch master
git log --oneline --graph
```

merge를 했다는 말은 작업이 끝났다는 말임. 깃허브에서는 끝난 브랜치를 삭제하라고 추천함

```bash
git branch -d yong # 로컬에서만 브랜치 삭제
```
깃허브에서는 view all branches 들어가서 삭제 가능


###  깃허브가 아닌 로컬에서 master 브랜치에 병합(merge)하는법
```bash
git branch yong
git switch yong
# 파일수정 후 진행
git add .
git commit -m "update"
git switch master
git merge yong
# 이 시점에서 yong 브랜치는 끝남
git branch -d yong
git branch
```
```bash
git branch login
git switch login
# 파일수정 후 진행
git add .
git commit -m "login 완료"
git switch master  # master로 오면 login에서 수정한거 없음
# 파일수정 후
git add .
git commit -m "update"
git merge login    # 현재 master브랜치에 있을때 login브랜치를 master로 넣어라
# 둘중에서 뭐가 맞는지 선택 후
git add .
git commit -m "merge"
git push origin master # 같이 하고 있으면 충돌날 수도 있음
```

## 모르는 다른 사람과의 소통

클론(깃허브 -> 로컬)을 하면 push할 권한이 없음  
우측상단에 Fork(깃허브 -> 깃허브) 클릭  # 내 레포로 복제  
복제한 레포의 code를 복사해서 clone 만듦  
```bash
git clone https://github.com/statice00/project.git
add
commit
push
```
깃허브에서 좌측상단 pull request 들어가서 보내면 된다.


### reset   
왠만하면 reset할 상황이 나오면 안되게 할것  
```bash
git reset -h  # 5가지 확인가능
git log --oneline
git reset --hard <내가가고싶은로그에뜬숫자> # 과거로 간다. 깔끔하게 없어짐

git reset --soft <내가가고싶은로그에뜬숫자>  
git log --oneline  # 과거로는 갔지만 없어지지 않고 commit에서 staigng area로 가서 저장되어있음 

git reset <내가가고싶은로그에뜬숫자> # 디폴트값 --mixed 
  # 커밋에서 취소, 스테이징 에리어로 가는게 아니라 add를 하기 전인 working directory로 간다.

git reset HEAD~3 # 지금 HEAD 기준으로 3개전으로 갈래


git stash  # 내가 있는 위치에서 변경된 diff를 임시저장소 스테이시에 저장
git switch master
git stash -h
git stash pop # 내가 마지막으로 스테이시에 저장한 데이터를 불러옴
git add .
git commit 
git log --oneline
```








