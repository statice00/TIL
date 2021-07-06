fork 후 작업공간에서 bash실행

- 로컬에 해당 저장소의 파일 내려받음
```bash
git clone https://github.com/statice00/data-visualization-8.git
```

- pull request 요청 전에 필요한 작업

원본저장소의 주소도 저장
```bash
git remote -v
git remote add origin-data-visualization-8 https://github.com/geatrigger/data-visualization-8.git

git remote -v
```

- 파일 생성,변경 작업 후 fork 저장소에 push
```bash
git add .
git commit -m "Add ~"
git push origin master
```

1. 내 fork 저장소 페이지에서 code탭 옆의 Pull requests를 누른다.
2. New Pull Request 버튼을 누른다.
3. 내가 push한 내용 확인, 원본 저장소의 어느 브랜치로 머지할지 확인, 내 fork저장소의 어느 브랜치로 pull request할지 확인
4. Create pull request 버튼 클릭
5. 제목, 내용 작성 후 Create pull request 버튼 누르면 원본 저장소에 pull request 요청 완료


- fork 저장소 동기화  

외부 저장소의 최신 내용 가져옴
```bash
git fetch origin-data-visualization-8
```

merge할 브랜치로 변경, 가져온 최신 내용을 merge
```bash
git checkout master
git merge origin-data-visualization-8/master
```
내 fork 저장소에도 반영
```bash
git push origin master
```