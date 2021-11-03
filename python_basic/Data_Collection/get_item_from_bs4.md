## get item from bs4.element.Tag

```python
source = driver.page_source
html_s = BeautifulSoup(source, 'lxml')
title_list = html_s.select('td.tL > a')

for i  in range(0,len(title_list)) : 
    print(title_list[i].get('href'))
```



### iframe으로 들어가기 나오기

```python
from selenium import webdriver

# 웹 드라이버 켜기
driver = webdriver.Chrome(executable_path='드라이버 위치')

# 원하는 url로 이동하기
url = "원하는 url"
driver.get(url)

# iframe 안으로 이동하기
## 몇 번째 iframe인지 확인 후, 그에 맞게 넣어주셔야해요. 저는 첫 번째 iframe에 들어가고 싶어 0을 넣어줬습니다!
pop_up = driver.find_elements_by_tag_name('iframe')[0]
driver.switch_to.frame(pop_up)

# 만약 iframe이 많으시다면,
iframes = driver.find_elements_by_tag_name('iframe')

# iframe의 name을 출력한 후,
for iframe in iframes:
	print(iframe.get_attribute('name')

# 아래 명령어로 iframe을 전환할 수 있습니다.
driver.switch_to.frame('프레임 이름') 

# 만약 default html로 넘어가고 싶으시다면, 
driver.switch_to.default_content()

# 모든 크롤링이 완료되었다면 브라우저 종료
driver.quit()
```

