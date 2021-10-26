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
today.weekday()
# 2

today.isoweekday()
# 3
```

`replace` 함수를 사용하면 immutable인 `date`객체를 변경된 속성값으로 새로 생성하여 반환함

```python
today.replace(year=2022)

# datetime.date(2022, 9, 8)
```



### time

`time` 클래스는 시간을 표현할 때 사용

시, 분, 초, 마이크로 초, 시간대를 인자로 받으며, 생략할 경우 0이 기본값

```pytrhon
from datetime import time

time(13, 42, 35)
# datetime.time(13, 42, 35)
```

`time` 클래스의  `fromisoformat()` 메서드는 `HH[:MM[:SS[.fff[fff]]]][+HH:MM[:SS[.ffffff]]]` 형태의 문자열을 `time` 객체로 변환함

```python
time.fromisoformat('13:42:35.458+09:00')

#datetime.time(13, 42, 35, 458000, tzinfo=datetime.timezone(datetime.timedelta(seconds=32400)))xxxxxxxxxx time.fromisoformat('13:42:35time.fromisoformat('13:42:35.458+09:00')datetime.time(13, 42, 35, 458000, tzinfo=datetime.timezone(datetime.timedelta(seconds=32400)))')
```

반대로 `time` 클래스의 `isoformat` 메서드는 `time` 객체를 `HH[:MM[:SS[.fff[fff]]]][+HH:MM[:SS[.ffffff]]]` 형태의 문자열로 변환함

```python
from datetime import time, timedelta, timezone
t = time(13, 42, 35, 458000, tzinfo=timezone(timedelta(hours=9)))
t.isoformat()
# '13:42:35.458000+09:00'
```

`time`객체의 시, 분, 초 데이터 접근

```python
t = time(13, 42, 35, 458000, tzinfo = timezone(timedelta(houurs=9)))

t.hour
# 13

t.minute
# 42

t.second
# 35

t.microsecond
# 458000

t.tzinfo
# datetime.timezone(datetime.timedelta(seconds=32400))
```

`replace` 로 시, 분, 초 데이터 변경 가능

```python
t.replace(hour=4)
# datetime.time(14, 42, 35, 458000, tzinfo=datetime.timezone(datetime.timedelta(seconds=32400)))
```



 ### datetime

날짜와 시간을 동시에 표현하기 위해 사용하며, `date`와 `time` 클래스에서 지원하는 대부분의 기능 지원함

연, 월, 일, 시, 분, 초, 마이크로초 , 시간대를 인자로 받으며, 생략할 경우 0이 기본값

```python
from datetime import datetime

datetime(2021, 9, 8, 13, 26, 23)
# datetime.datetime(2021, 9, 8, 13, 26, 23)
```

`combine()`메서드를 사용하면 기존에 생성한 `date` 나 `time`객체를 활용하여 `datetime` 객체를 생성가능

```python
from datetime import date, datetime, time

d = date(2021, 9, 8)
t = time(13, 26, 23)

datetime.combine(d, t)
# datetime.datetime(2021, 9, 8, 13, 26, 23)
```

`now()` 메서드로 현재 시각을 얻을 수 있음.

```python
from datetime import datetime, timezone

datetime.now()
# datetime.datetime(2021, 9, 8, 13, 50, 32, 12303)

datetime.now(timezone.utc)
# datetime.datetime(2021, 9, 8, 13, 50, 32, 12303, tzinfo=datetime.timezone.utc)
```

`strftime()` 메서드는 `datetime` 객체를 다양한 포맷의 문자열로 변환해줌

```python
today.strftime('%Y%m%d')
# '20210908'
```

`strptime()` 메서드는 다양한 포멧의 문자열을 `datetime` 객체로 변환해줌

datetime 클래스에서만 지원함

```python
datetime.strptime('20210908', '%Y%m%d')
# datetime.datetime(2021, 9, 8, 0, 0)
```





