## 정규 표현식(Regular Expression)
![regular expression](https://miro.medium.com/max/2964/1*hjsbL45MhT2Tw5DGAYoAUg.png)

---
1. 문자 클래스(character class) []  
**[]사이 문자들과 매치한다**  
[]안에서 - : [From - to]  
**[] 안에서 ^ : 반대(not)**  



    자주 사용하는 정규식은 별도의 표기법으로 표현   
    대문자로 사용된 것은 소문자의 반대임
   - \d - 숫자와 매치, [0-9]와 동일한 표현식  
   - \D - 숫자가 아닌 것과 매치, [^0-9]와 동일한 표현식
   - \s - whitespace 문자와 매치, [ \t\n\r\f\v]와 동일한 표현식. 맨 앞의 빈 칸은 공백문자(space)를 의미.
   - \S - whitespace 문자가 아닌 것과 매치, [^ \t\n\r\f\v]와 동일한 표현식.
   - \w - 문자+숫자(alphanumeric)와 매치, [a-zA-Z0-9_]와 동일한 표현식.
   - \W - 문자+숫자(alphanumeric)가 아닌 문자와 매치, [^a-zA-Z0-9_]와 동일한 표현식.

2. Dot .  
**a.b : "a + \n을 제외한 모든문자 + b"** a와 b 사이 어떤 문자가 들어가도 매치함    
**a[.]b : "a + . + b"** a와 b사이 .이 들어가야 매치함

3. 반복 *  
**메타문자 '*'의 바로 앞에 있는 문자가 0부터 무한대인 문자열과 매치**  
ber bear beaar beaaar 모두 정규식 bea*r와 매치됨  

4. 반복 +  
**메타문자 '+'의 바로 앞에 있는 문자가 최소 1번 이상 반복되는 문자열과 매치**  
ber은 매치가 안되며, bear beaar beaaar 모두 bea+r와 매치됨

5. 반복 {m,n}  
**바로 앞에 있는 문자가 반복 횟수 m이상 n이하까지 매치되게 지정**  
{5,} : 반복 횟수 5이상    
{,5} : 반복 횟수 5이하    
{1,} = '+'    
{0,} = '*'    

6. ?  
**{0,1}을 의미**   
즉, 바로 앞에 오는 문자가 있어도 되고 없어도 됨  

---

### 정규 표현식을 이용한 검색
compile된 객체로 작업 수행
```python
import re
p = re.compole('[a-z]')
```
---
- compile 옵션 (약어)  
    - DOTALL(S) : DOT.이 줄바꿈 문자(\n)를 포함해 모든 문자와 매치되게 함
    - IGNORECASE(I) : 대소문자에 관계없이 매치되게 함
    - MULTILINE(M) : ^, $를 문자열의 각 줄마다 적용해 매치되게 함
    - VERBOSE(X) : 정규식을 보기 편하게 만들고 주석 가능하게 함. 문자열에 사용된 공백은 컴파일할 때 제거됨(verbose모드)  
```python
p = re.compile('a.b', re.DOTALL)  # = re.S
m = p.match('a\nb')
print(m)
# out : <_sre.SRE_Match object at 0x01FCF3D8>
```
```python
import re
p = re.compile("^python\s\w+", re.MULTILINE)

data = """python one
life is too short
python two
you need python
python three"""

print(p.findall(data))
# out : ['python one', 'python two', 'python three']
```
---

1. match()  
문자열의 처음부터 정규식과 매치되는지 조사  
정규식과 매치되면 match 객체 반환, 매치되지 않으면 None 반환  
```python
m = p.match('python')
print(m)
# 매치돼서 match 객체 반환
# out : <_sre.SRE_Match object at 0x01F3F9F8>
```
```python
m = p.match('7 python')
print(m)
# out : None
```
2. serch()  
문자열 전체를 검색해 정규식과 매치되는지 조사  
정규식과 매치되면 match 객체 반환, 매치되지 않으면 None 반환  
```python
m = p.search('python')
print(m)
# 매치돼서 match 객체 반환
# out : <_sre.SRE_Match object at 0x01F3FA68>
```
```python
m = p.search('5 python')
print(m)
# 처음부터 검색이 아닌 문자열 전체를 검색하므로 매치됨
# out : <_sre.SRE_Match object at 0x01F3FA30>
```
---
 - match 메서드, search 메서드의 결과로 반환된 match객체의 메서드
    - group() : 매치된 문자열 반환  
    - start() : 매치된 문자열 시작 위치를 반환
    - end() : 매치된 문자열의 큰 위치를 반환
    - span() : 매치된 문자열의 (start, end) 튜플 반환
 ```python
 m = p.match('7 python')
 m.group() # out : 'python'
 m.start() # out : 2
 m.end()   # out : 8
 m.span()  # out : (2, 8)
 ```

---

3. findall()  
정규식과 매치되는 모든 문자열을 리스트로 반환  
```python
f = p.findall('lose yourself in the music')
print(f)
# 정규식과 매치되는 문자열의 단어를 각각 리스트로 반환
# out : ['lose', 'yourself', 'in', 'the', 'music']
```
4. finditer()  
정규식과 매치되는 모든 문자열을 반복 가능한 객체(iterator)로 반환
```python
iterator = p.finditer('bad meets evil')
print(f)
# out : <callable_iterator object at 0x01F5E390>
```
```python
#반환된 iterator를 for문을 사용하여 모두 추출가능    
#각각의 match객체를 요소로 포함하고 있음 
for match in iterator:
    print(match)
```

- 백슬래시 문제  
'\python' 문자열을 찾기 위한 정규식을 만드려면  
```python
p = re.compile(r'\\python')  # r을 붙이면 \ 한개를 두개로 인식
```
