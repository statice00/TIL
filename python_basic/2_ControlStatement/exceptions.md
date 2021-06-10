### 예외처리문
![exeptions](https://files.realpython.com/media/try_except_else_finally.a7fac6c36c55.png)

예외처리문은 에러가 발생해도 코드를 중단하지 않고 실행한다.  

예외처리문은 try ~ except ~ else ~ finally로 구성된다.  
try에서 실행되는 코드에 에러가 발생할 경우 except가 실행된다.  
try에서 실행되는 코드가 정상적 처리가 되면 else가 실행된다.  
finally는 무조건 마지막에 실행된다. 
```python
try:
    a = int(3)
    b = int('a')
except ValueError:  # 발생되는 에러 입력
    print('숫자가 아닌 문자가 입력되었습니다.')
else:
    print('{}와{}의 합:{}' .format(a,b,a+b))
finally:
    print('program end') 

# out : 숫자가 아닌 문자가 입력되었습니다.
#       program end
```
except 뒤에 에러 이름을 넣으면, 해당하는 에러가 발생했을 때만 except를 실행시킨다.

다중 except 선언이 가능하다. except 뒤에 오는 as는 try블록에서 발생한 이름을 받아온다.

```python
try:
    a = 1/'a'
except ZeroDivisionError:
    print('분모는 0보다 큰수만 가능합니다.')
except TypeError:
    print('숫자만 가능합니다.')
except:
    print('except')
else:
    print('end')
finally:
    print('program end')

# out : 숫자만 가능합니다.
#       program end
```



