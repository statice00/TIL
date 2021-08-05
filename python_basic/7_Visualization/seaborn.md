### Seaborn
<br/>

사용법 정리 블로그
https://greeksharifa.github.io/machine_learning/2019/12/05/Seaborn-Module/

<br/>

1. seaborn에서만 제공되는 통계 기반 plot
2. 특별하게 꾸미지 않아도 깔끔하게 구현되는 기본 color
3. 더 아름답게 그래프 구현이 가능한 palette 기능
4. pandas 데이터프레임과 높은 호환성
: hue 옵션으로 bar 구분이 가능하며, xtick, ytick, xlabel, ylabel, legend 등이 추가적인 코딩 작업없이 자동으로 세팅된다.

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
```
<br/>

한글 폰트 설치

```python
# 한글 폰트 적용
plt.rc('font', family='NanumBarunGothic') 
# 캔버스 사이즈 적용
plt.rcParams["figure.figsize"] = (12, 9)
```

<br/>

- sns.color_palette() : 팔레트 색상 설정
- sns.set_palette() : 새로운 팔레트 설정, 선언
```python
custom_colors = ["#ff6b6b","#95d5b2","#a2d2ff","#72efdd"]
sns.set_palette(sns.color_palette(custom_colors))
```
<br/>

- sns.palplot() : 현재의 color palette 확인
```python
sns.palplot(sns.color_palette(custom_colors))
```

<br/>

- 6개 기본 팔레트

![basic palette](http://hleecaster.com/wp-content/uploads/2019/12/article2_image6.png)

```python
sns.set_palette('pastel')
```

<br/>

- color Brewer 팔레트

![color brewer](http://hleecaster.com/wp-content/uploads/2019/12/article2_image9.png)

```python
# 'Dark2' 팔레트의 색상 5개 가져오기
custom_palette = sns.color_palette("Dark2", 9)
sns.palplot(custom_palette)
```

추가 색상 참고
https://colorbrewer2.org/#type=sequential&scheme=PuRd&n=3
