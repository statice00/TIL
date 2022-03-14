## 작업 스케줄러로 자동 실행



### schedule 라이브러리

정해진 시간에 파이썬 스크립트 내부 함수 등 자동 실행

스크립트가 실행상태여야 함

```python
!pip install schedule
```

```python
import schedule
import time

def job():
    print("자연, 우리의 미래...")

schedule.every(3).seconds.do(job) # 3초마다 job 실행
schedule.every(3).minutes.do(job) # 3분마다 job 실행
schedule.every(3).hours.do(job) # 3시간마다 job 실행
schedule.every(3).days.do(job)  # 3일마다 job 실행
schedule.every(3).weeks.do(job) # 3주마다 job 실행

schedule.every().minute.at(":23").do(job) # 매분 23초에 job 실행
schedule.every().hour.at(":42").do(job) # 매시간 42분에 작업 실행

# 5시간 20분 30초마다 작업 실행
schedule.every(5).hours.at("20:30").do(job)

# 매일 특정 HH:MM 및 다음 HH:MM:SS에 작업 실행
schedule.every().day.at("10:30").do(job)
schedule.every().day.at("10:30:42").do(job)

# 주중 특정일에 작업 실행
schedule.every().monday.do(job)
schedule.every().wednesday.at("13:15").do(job)

while True:
    schedule.run_pending()
    time.sleep(1)
```

```python
import webbrowser

url= "https://www.google.co.kr/search?q=national+park&source=lnms&tbm=nws"
webbrowser.open(url) # Google 뉴스에서 'national park' 검색결과

import schedule
import time
import webbrowser

def job():
    url= "https://www.google.co.kr/search?q=national+park&source=lnms&tbm=nws"
    webbrowser.open(url) # Google 뉴스에서 'national park' 검색결과
    
# 매일 특정 HH:MM 및 다음 HH:MM:SS에 작업 실행
schedule.every().day.at("17:00").do(job)

while True:
    schedule.run_pending()
    time.sleep(1)
```



### window 작업 스케줄러

배치 파일로 파이썬 프로그램 자동 실행

스크립트가 실행중이 아니어도 되며, 노트북이 절전모드여도 작동하게 설정 가능



- 작업 표시줄에 `작업` 검색해 `작업 스케줄러` 클릭

  ![1](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FNUqU7%2Fbtq126Lswer%2FU97xm2tBYN6vibW4oDV931%2Fimg.png)

  

- `작업 스케줄러 라이브러리` 폴더 우클릭 - `작업 만들기` 선택

  ![2](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2F2cnNj%2Fbtq1Yli5gTN%2FblZTeG9wx2mN1PhFMtmUv1%2Fimg.png)

  

- `일반`

  생성할 작업 이름, 설명 넣고

  권한은 작업 성격에 맞게 설정

  ![3](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FkTpMM%2Fbtq1XVdw73G%2F6ystxUeHk88eqD8j7gNIs1%2Fimg.png)

- `트리거`

  트리거 탭에서 작업 실행 주기, 시간 등 설정

  고급 설정에서 시간 당 반복 설정 가능

  ![4](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FD35Go%2Fbtq127wWrPM%2FuOCXn9XFIWZcQEprDdO7Rk%2Fimg.png)

- `동작`

  `새로 만들기` 선택 - 해당 작업으로 작동할 동작 선택

  프로그램/스크립트에 실행할 파일 입력

  시작 위치에는 배치파일이 입력한 경로 입력

  ![5](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fz9unZ%2Fbtq16r2z5cA%2FSCUATNmIS7O2983vFZ0I40%2Fimg.png)

- 배치파일 만들기

  메모장을 열고

  ```
  "파이썬 프로그램 경로""실행할 파이썬 스크립트 경로"
  ```

  입력

  ![7](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcOYRmQ%2Fbtq150xBvB4%2FwjMFucL09XaY8XKv4enIt0%2Fimg.png)

  저장한 뒤 확장자를 .bat 로 변경하면 완료

  - 확장자 변경법

    폴더에서 `보기` - 표시/숨기기 탭에서 `파일 확장명` 체크

    하면 파일의 확장자까지 표시됨

    F2 이름변경으로 확장자 편집 가능



- `조건`

  `이 작업을 실행하기 위해 절전 모드 종료` 선택하면 절전모드, 화면 잠금 상태 등에서도 작업 실행 가능

  ![8](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcrL2vY%2Fbtq16r2AfHT%2FSE1yGq3GmtReCDoswwuskk%2Fimg.png)



최종적으로 설정 확인 후 `확인` 을 누르면  작업 스케줄러 라이브러리에 등록한 작업이 추가되어 있는 모습 확인 가능

![9](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbb1cdi%2Fbtq12xoXMFV%2FZ1BRAXzG90v0kkKXPPkqQk%2Fimg.png)







### schtasks.exe

윈도우 GUI 작업 스케줄러 대신 schtasks.exe 명령으로 처리하면 파이썬에서 등록하고 삭제 가능

지정된 시간에 스크립트를 실행하게(예약 작업) 하는 방법으로 윈도우라면 작업 스케줄러 **schtasks**.**exe**를 이용할 수 있다. 윈도우의 schtasks는 리눅스의 cron에 해당한다. schtasks를 이용하는 장점은 스크립트를 일정에 맞춰 예약 실행할 수 있다는 것이다. 앞선 절에서 소개한 방법들은 파이썬 스크립트가 실행 중인 상태에서 특정한 함수를 예약 실행하는 개념이었지만, schtasks는 스크립트 자체가 실행 중이지 않아도 예약한 시간이 되면 시스템에서 알아서 스크립트를 시작하게 된다.



###### 예약 작업 확인하기

우선 ‘cmd’ 명령어를 실행하여 콘솔창(명령행 프롬프트)을 연다. 현재 등록되어 있는 시스템 예약 작업 정보는 schtasks 명령으로 확인할 수 있다. 실행 결과 예를 살펴보면 다음과 같다.

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfMTYy/MDAxNTk1MzgzNDEzMjIz.ZZDfBd8I4neL7Hj58c9AGVBwPMTi2QQ9v0SCSTT7ZyAg._1OARUISdNMy1G6iSOuFt1e47lAO_GnQLLRJOeeIAxYg.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfOTIg/MDAxNTk1MzgzNDI2OTg4.uBrXGu0tpLZvMuqvnyYi1nu4iLA_IFGzLyvs_LHIIxIg.sSk7zrQXrvNGWXEJRsryB4-US97YSPDVUiJRIhK4wRMg.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

예를 들어 ‘Office 15 Subscription Heartbeat’ 프로그램은 2020년 3월 17일 오전 6:11:4에 실행될 것이며 현재는 준비 상태임을 나타낸다. 이 프로그램은 오피스 프로그램의 설치 상태와 라이선스 정보를 주기적으로 검사하는 프로그램이다. 이 작업은 다음 명령으로 삭제할 수 있다(단, 명령행 프롬프트를 관리자 권한으로 실행해야 한다). 각 옵션에 대해서는 다음 절에서 설명한다.



###### 예약 작업 생성하기

예약 작업 생성에 필요한 내용은 schtasks /create 이후에 이어지는 옵션으로 지정한다. 사용 가능한 추가 옵션은 다음과 같다. 더 많은 옵션이 있지만 지면 관계상 중요하다고 여기는 것들만 소개한다. 옵션은 대소문자 관계없이 사용할 수 있다.

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfNDEg/MDAxNTk1MzgzNzk1MDc3.Bjvnaz2Sp1dzhWOMya65vpRNHAbuSaYKSim5qpfw6bAg.YJju8DXa7bOem_P65L6cnLXUq-25-T0CfNyk7m-8Lt4g.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfMTYx/MDAxNTk1MzgzODUxNTQ2.V_c-p9rqfq_Sh1MjAosQiMLh4AjI__i287Jn7V-Uh5sg.QCzUv7ZFva3ptrEtgZYbnlXQAzrokEszG0hLzZisW_wg.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

옵션의 사용법은 이어지는 예를 보면 쉽게 이해할 수 있다. 다음 예에서 monitor란 이름의 작업은 계산기를 매분 실행한다.

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfMTA2/MDAxNTk1MzgzODgwNTgy.Arc7qLpQ2CGorxoHGvHiC695oNtos8YlRrPgtKtFy7Ug.6QMGQBsWQoSmegCGvUpo82HaxKdCv2yZqTFRR4YXuvIg.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

계산기가 매분 실행되는 것이 확인되었으면, 예약 작업을 삭제해보자.

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfMTIy/MDAxNTk1MzgzODk5OTk5.Dzj9sxM7hF0cED8Zs2RyvXj1oOubpd-B3slAr0vipvog.cA5S4KNTJlWuEeH-eAFfvulmJ55sHouMzChXv5JL_M8g.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

만일 파이썬 스크립트를 실행하려고 한다면 파이썬 프로그램의 실행 경로와 스크립트를 함께 지정하면 된다. 예를 들어 다음 코드는 매분 monitor.py라는 파이썬 스크립트를 실행한다. 파이썬 실행 경로는 컴퓨터마다 다를 수 있으니 확인하고 입력하기 바란다.

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfMjcx/MDAxNTk1MzgzOTIzOTkw.UW9c8iO8oF1ld8QMIGDgP9aSd-gKyQR1BH-hC3oYn-Qg.8896Cnw8sswm5lqWGFjq_YH7MinBDC0WzFwmhoISqqgg.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

좀 더 다양한 예를 살펴보자. 다음 명령은 매일 아침 9시에 계산기를 실행한다.(물론 컴퓨터가 켜져 있어야 한다.)

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfMTE1/MDAxNTk1MzgzOTY4MTA1.jCn8OB04Yu4VPNA5NTl15XufWJ4DTWpJVSxIKwLJ1Mgg.9czaSBdux1eBJlkEPK7-RWogCOL9KnjRssVK6RG1wXIg.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

매주 월요일 9시에 계산기를 실행한다.

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfOTEg/MDAxNTk1MzgzOTg1NjEw.JeWDJLajQc8EvlwlbXhdIl7DT1JIkFdctxH6N-YkbvYg.4R3JhuqDQEyUYBulvAsrcsztxkQahRywZXz6Nnbt-_4g.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

매월 1일, 9시에 계산기를 실행한다.

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfMTAw/MDAxNTk1Mzg0MDA0MTQx.ioFlfGurcXiH3Fi2_7hS6LTYBOZ5ChJlKCR_J9_zkSYg.gvCcV2s4YWZWMUUrpQp8gB6PHL8eL6enbQYc7GNWEYsg.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

사용자 gslee가 로그온할 때 계산기를 실행한다(단, 명령행 프롬프트를 관리자 권한으로 실행해야 함)

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfMTMx/MDAxNTk1Mzg0MDI2NDQy.ZgwxdFv5z-s-aLqEVytpljrtjKyHyEvzceMYL-DOkRcg.NjPOxRnKnqsJ8fzxxubRX0-P_XoSR5wGlmfpUwQZTlQg.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

###### 예약 작업 삭제하기

예약 작업의 삭제는 작업 이름(tn)으로 할 수 있다.

[![img](https://post-phinf.pstatic.net/MjAyMDA3MjJfMjEz/MDAxNTk1Mzg0MDUzODM0.Nkk3bbBYqB0gk9c5jLT3_SI3_S88Iklc_lILuWwB9oEg.6xJ_WlukSrKrw2YIaoQeGfgY9jLgaHq6nSSraXtdyk4g.PNG/image.png?type=w1200)](https://m.post.naver.com/viewer/postView.nhn?volumeNo=28860910&memberNo=34865381#)

​    ◆ **/tn: taskname,** 작업 이름을 지정
​    ◆ **/f: force,** 작업이 수행되는 중이라도 묻지 않고 수행한다.