### 각 프로젝트를 위한 가상환경 설정

- Anaconda Powershell Prompt (anaconda3) 실행
파이썬 버전확인
```bash
python --version
```
가상환경 리스트 확인
```bash
conda env list
```
가상환경 생성
```bash
conda create --name ds python=3.8.8 anaconda
```
가상환경 활성화하는 법
```bash
conda activate d8
```

#### 가상환경 실행error
```bash
CommandNotFoundError: Your shell has not been properly configured to use 'conda activate'.
If using 'conda activate' from a batch script, change your    
invocation to 'CALL conda.bat activate'.

To initialize your shell, run

    $ conda init <SHELL_NAME>

Currently supported shells are:
  - bash
  - cmd.exe
  - fish
  - tcsh
  - xonsh
  - zsh
  - powershell

See 'conda init --help' for more information and options.     

IMPORTANT: You may need to close and restart your shell after 
running 'conda init'.
```
가 나온 경우  
```bash
conda init bash
```
차례로 실행 후 터미널을 닫고 다시 실행하면
```bash
conda activate ds
```
가상환경 실행 가능