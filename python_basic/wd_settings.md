## jupyter notebook 실행 시 시작폴더 지정

<br/>

1. 해당 가상환경 anaconda prompt 실행
    ```bash
    jupyter notebook --generate-config
    ```
<br/>

2. 경로 설정
    1. user/.jupyter 폴더에 "jupyter_notebook_config.py" 파일을 메모장으로 열기
    2. notebook_dir 검색해서 주석 해제하고 따옴표안에 원하는 경로 입력

<br/>

- SyntaxError: (unicode error) 'unicodeescape' 해결  
  1. r'주소'
  2. \를 2번 입력


3. jupyter notebbok (가상환경이름) 우클릭 - 파일위치 이동 - 해당파일 우클릭 - 속성
    대상 맨뒤 Homepath 삭제, 시작위치 공백
    

