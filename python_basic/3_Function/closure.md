### 클로저(closure)
- 함수의 중첩 : 함수 안에 함수를 정의할 수 있다.  
- 함수를 중첩해서 사용하는 기법이다.  
- 함수를 정의할 때 outer함수는 inner함수를 return하고(일급객체함수 성질), inner함수에서는 outer함수의 자원을 사용한다.  
- 즉, 함수의 자원을 외부에서 사용하기 위한 목적이다

```python
def multiply(x):
    def multiple(n):
        return x * n
    return multiple

mt = multiply(3) # multiple(n) : 3 * n
mt(2) # multiple(2) : 3 * 2

multiply(3)(2) # out : 6
```

