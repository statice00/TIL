### while 반복문
![while](https://media.geeksforgeeks.org/wp-content/uploads/20191101170515/while-loop.jpg) 
a += 1 : a = a + 1  
a -+ 1 : a = a - 1  
while문이 완벽히 돌았으므로 end 출력
```python
a = 10
while a>10:
    a -= 1
    print(a)
else:
    print('end')
# out : end
```
break는 반복문을 중단시킴  
break가 실행되면 반복문이 완벽하게 실행된 것이 아니므로 else가 실행되지 않음
```python
a = 10
while a>1:
    a -= 1
    if a==5:
        break
    print(a)
else:
    print('end')

# out : 9 8 7 6
```
continue는 다음 루프로 바로 넘어감  
반복문을 중단하지 않음
```python
a = 10
while a>1:
    a -= 1
    if a==5:
        continue
    print(a)
else:
    print('end')

# out : 9 8 7 6 5 4 3 2 1 end
```
