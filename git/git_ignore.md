# 특정 폴더나 파일 제외 or 무시하기
.gitignore 파일이란 Git 버전 관리에서 제외 or 무시할 파일 목록을 설정하는 파일이다.
- .gitignore 생성
1. .git 폴더가 있는 최상위 디렉터리로 이동
2. .git 폴더가 존재하는 곳과 같은 디렉토리에 생성
```bash
touch .gitignore
```
3. VS code로 실행 후, .gitignore 파일 open
제외하고 싶은 파일이나 폴더 형식 입력  
ex)  
git폴더 내부에 이름이 .assets로 끝나는 폴더 제외  
git/*.assets/   


프로젝트 진행 중인 경우  
[.gitignore.io](https://www.toptal.com/developers/gitignore) 에 접속해 현재 프로젝트에서 사용중인 운영체제(보통 window mac 둘다 넣는다.)   
또는 통합 개발 환경 또는 프로그래밍 언어를 넣는다.  
생성 후, 모두 복사해 .gitignore 파일에 붙여넣기한 후 저장한다.  

4. add - commit -push  
까지 해야 원격저장소에 적용된다.
```bash
git add .gitiignore
git commit -m "ignore folder, file"
git push origin master
```




 

