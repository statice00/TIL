# github에 잘못 올라간 폴더 및 파일 삭제하기

불필요한 폴더나 파일인데 .gitignore에 설정이 안되어 있거나 잘못 올린 경우

원격저장소(remote)에 있는 폴더, 파일 삭제
```bash
git rm --cached -r <폴더명>
git rm --cached -r <파일명>
git commit -m "불필요한 폴더,파일 삭제"
git push origin master
```
