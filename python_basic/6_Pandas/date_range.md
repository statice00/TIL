### pandas date_range()

```python
import pandas as pd

# 해당기간 날짜 추출
dates = pd.date_range(start = '20210901', end = '20210930')

date_list = dates.strftime('%Y%m%d').tolist()
```



### **freq 매개변수에 사용되는 Frequncy strings**

자주 사용되는 빈도문자. 더 많은 빈도문자에 대하여는 [여기](https://pandas.pydata.org/pandas-docs/stable/user_guide/timeseries.html#timeseries-offset-aliases)를 클릭

| Alias | Description                                      |
| :---- | :----------------------------------------------- |
| B     | business day frequency                           |
| C     | custom business day frequency                    |
| D     | calendar day frequency                           |
| W     | weekly frequency                                 |
| M     | month end frequency                              |
| SM    | semi-month end frequency (15th and end of month) |
| BM    | business month end frequency                     |
| CBM   | custom business month end frequency              |
| MS    | month start frequency                            |
| SMS   | semi-month start frequency (1st and 15th)        |
| BMS   | business month start frequency                   |
| CBMS  | custom business month start frequency            |
| Q     | quarter end frequency                            |

```python
# 해당기간동안 월요일만 추출
dates = pd.date_range(start = '20210901', end = '20210930', freq = 'W-MON')
```



### periods 매개변수

```python
# 해당기간동안 5일간격으로 추출
dates = pd.date_range(start = '20210901', end = '20210930', periods = 5)
```

