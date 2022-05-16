### 우선순위 큐 (Priority Queue)

- 우선순위가 가장 높은 데이터를 가장 먼저 삭제하는 자료구조

- 우선순위 큐는 데이터를 우선순위에 따라 처리하고 싶을 때 사용(데이터를 자료구조에 넣었다 가치가 높은 데이터부터 꺼내 확인하는 경우)

- 우선순위 큐 구현하는 방법

  - 리스트

    - 데이터의 개수가 N일 때,  시간 복잡도

      삽입 시간 : **O(1)**  데이터를 삽입할 때 단순히 뒤쪽에 연달아 넣으면 되기 때문

      삭제 시간 : **O(N)**  삭제하고자 하는 데이터인 가장 우선순위가 높은 데이터를 찾기 위해서 선형적인 탐색시간 소요

  - 힙(heap)

    - 데이터의 개수가 N일 때,  시간 복잡도

      데이터를 넣고 빼는 과정에서 최악의 경우에도 O(logN)을 보장할 수 있는 방식으로 동작

      삽입 시간 : **O(logN)**  

      삭제 시간 : **O(logN)**

    - 단순히 N개의 데이터를 힙에 넣었다가 모두 꺼내는 작업은 그 자체로도 정렬이 수행되므로 정렬과 동일하다. (**힙 정렬**)

      이 때 이 N개의 데이터를 모두 힙에 넣고 빼기 위해서 **O(NlogN)** 의 시간복잡도가 소요된다.

</br>

---

### 힙(Heap)의 특징

![heap](https://blog.kakaocdn.net/dn/biUlKc/btquYYrEFom/xT5CqFhMPYIFsk1JNz6WLk/img.png)

- 힙은 [완전 이진 트리 자료구조](#완전-이진-트리complete-binary-tree)의 일종이다.
- 힙에서는 항상 루트 노트(root node)를 제거한다. 데이터를 넣을 때는 트리에 데이터를 넣도록 하고, 꺼낼때는 루트 노드의 데이터를 꺼낸다.
- 최소 힙(min heap)
  - 루트 노드가 가장 작은 값을 가진다.
  - 따라서 값이 작은 데이터가 우선적으로 제거된다.

- 최대 힙(max heap)
  - 루트 노드가 가장 큰 값을 가진다.
  - 따라서 값이 큰 데이터가 우선적으로 제거된다.




### 최소 힙 구성 함수 : Min-Heapify()

![min-heap](https://slid-capture.s3.ap-northeast-2.amazonaws.com/public/image_upload/3f75849a890a4de08c0f0226cb38f9ff/11f1c338-1a13-4103-bd75-9de7067bcf2e.png)

- (상향식) 부모 노드로 거슬러 올라가며, 부모보다 자신의 값이 더 작은 경우에 위치를 교체한다.

#### 힙에 새로운 원소가 삽입될 때

![enqueue](https://slid-capture.s3.ap-northeast-2.amazonaws.com/public/image_upload/3f75849a890a4de08c0f0226cb38f9ff/309b55e3-a4bf-4a44-a8ab-75b389ddd816.png)

- 2를 삽입했을 때 오른쪽 그림과 같이 힙이 갱신
- 이러한 Heapify()를 이용하게 되면 힙에 새로운 원소가 삽입될 때 **O(logN)** 의 시간 복잡도로 힙 성질을 유지하도록 할 수 있다.
- 이때 힙 자료구조는 완전 이진 트리를 따르기 때문에 균형잡힌 트리로써 동작하는 것이 특징
- 항상 부모쪽으로 거슬러 올라가거나 다시 부모에서 자식으로 내려올 때 최악의 경우에도 O(logN)의 시간복잡도를 보장할 수 있다. 

#### 힙에서 원소가 제거될 때

![dequeue](https://slid-capture.s3.ap-northeast-2.amazonaws.com/public/image_upload/3f75849a890a4de08c0f0226cb38f9ff/bcec2ce3-d351-45a8-8588-7ad31801abbc.png)

- 2를 꺼낸 후 가장 마지막 원소가 원래 2의 위치에 오도록 한다.
- 원소가 제거되었을 때 O(logN)의 시간 복잡도로 힙 성질을 유지
- 원소를 제거할 때는 가장 마지막 노드가 루트 노드의 위치에 오도록 한다.

![dequeue2](https://slid-capture.s3.ap-northeast-2.amazonaws.com/public/image_upload/3f75849a890a4de08c0f0226cb38f9ff/bdd74589-1515-447d-9f8d-3f4f9d7d9081.png)

- 이후 루트 노드에서부터 하향식으로(더 작은 자식 노드로) Heapify() 진행

#### 힙 정렬 구현

우선순위 큐 라이브러리 활용

파이썬은 기본적으로 Min-Heap이어서 오름차순 정렬이 수행

Max-Heap으로 만들고 싶으면 삽입하고 꺼낼때 -를 붙이면 된다.

```python
import sys
import heapq # 힙 라이브러리

input = sys.stdin.readline

def heapsort(iterable):
    h = []
    result = []
    # 모든 원소를 차례대로 힙에 삽입
    for value in iterable:
        heapq.heappush(h,value)
        
    # 힙에 삽입된 모든 원소를 차례대로 꺼내어 담기
    for i in range(len(h)):
        result.append(heapq.heappop(h))
    return result

n = int(input())
arr = []

for i in range(n):
    arr.append(int(input))
    
res = heapsort(arr)

for i in range(n):
    print(res[i])
```



#### 완전 이진 트리(Complete Binary Tree)

![CBT](https://slid-capture.s3.ap-northeast-2.amazonaws.com/public/image_upload/3f75849a890a4de08c0f0226cb38f9ff/7f015080-39ba-429b-8698-8d7974537633.png)

루트(root) 노드부터 시작하여 왼쪽 자식 노드, 오른쪽 자식 노드 순서대로 데이터가 차례대로 삽입되는 트리(tree)를 의미한다.
