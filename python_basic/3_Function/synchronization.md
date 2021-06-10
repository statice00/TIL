### 동기화(synchronization)

- 동기화(synchronization)  
    1. global : 내부와 외부의 객체를 동기화시킨다. 
    ```python
    t = 3
    def prn():
        global t
        t = t+1
        print(t)
    prn() # out : 4
    ```
    ```python
    t # out : 4
    ```

    2. nonlocal : 함수 안에 있는 영역에 동기화한다
    ```python
    k=1
    def outer():
        m = 1
        def inner():
            global k
            k = k+1
            nonlocal m
            m = m+1
            return k, m
        return inner()

    outer() # out : (2, 2)
    ```
    