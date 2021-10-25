## datetime

파이썬 내장 모듈 `datetime`을 이용한 날짜, 시간 데이터 처리

</br>

### timedelta

`timedelta` 클래스는 기간을 표현하기 위해 사용함

`timedelta` 클래스의 생성자는 [ 밀리 초, 마이크로 초, 초, 분, 시, 일, 주 ] 를 인자로 받음

산술, 대소 연산자 사용 가능

```python
from datetime import date, timedelta

week = timedelta(week=1)
week
# datetime.timedelta(days=7)

multiplication = week * 2
multiplication
# datetime.timedelta(days=14)

week < multiplication
# True

multiplication == timedelta(weeks = 2)
# True

next_week = date.today() + week
next_week
# datetime.date(2021, 9, 15)

last_week = next_week - multiplication
last_week
# datetime.date(2021, 9, 1)
```



### timezone

`timezone` 클래스는 시간대를 표현하기 위해 사용

`timezone` 클래스의 생성자는 UTC 기준으로 시차를 표현하는 `timedelta` 객체를 인자로 받아 `timezone` 객체를 생성함

한국은 UTC 기준으로 9시간이 빠르므로 다음과 같이 `timezone` 객체 생성 가능

```python
from datetime import timedelta, timezone

timezone(timedelta(hours=9))
# datetime.timezone(datetime.timedelta(seconds=32400))
```

모든 시간대의 기준이 되는 UTC 시간대는 `utc` 속성을 통해 얻을 수 있음

```python
timezone(timedelta(0))
# datetime.timezone.utc

timezone.utc
# datetime.timezone.utc
```

`timezone` 객체는 `time`과 `datetime` 객체의 `tzinfo`속성값으로 사용됨



## date

`date` 클래스는 날짜를 표현하는데 사용

연, 월, 일 데이터를 인자로 받음

```python
from datetime import date

date(2021, 9, 8)
# datetime.date(2021, 9, 8)
```

오늘 날짜를 얻으려면 `today()` 메서드 사용

```python
today = date.today()
today
# datetime.date(2021, 9 ,8)
```

`isoformat()` 메서드는 `date` 객체를 `YYYY-MM-DD` 형태의 문자열로 변환해줌

```python
today.isoformat()
# '2021-09-08'
```

`fromisoformat()` 메서드는 `YYYY-MM-DD` 형태의 문자열을 `date` 객체로 변환해줌

```python
date.fromisoformat('2021-09-08')
# datetime.date(2021, 9, 8)
```

`date` 객체의 연, 월, 일 데이터는 `year`, `month`, `day`, 속성으로 접근 가능

```python
today.year
# 2021

today.month
# 9

today.day
# 8
```

`weekday()` , `isoweekday()` 메서드는 해당 날짜가 무슨 요일인지 확인하기 위해 사용

`weekday()` 는 월요일이 0으로 시작

`isoweekday()` 는 월요일이 1로 시작

```python
```





