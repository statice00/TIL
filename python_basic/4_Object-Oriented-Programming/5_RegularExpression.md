### 정규 표현식(Regular Expression)
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
