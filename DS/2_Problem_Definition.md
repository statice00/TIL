## 이슈트리 툴을 통한 문제 정의

### 목표 설정

#### 목표 설정의 필요성

- 데이터 활용, 시작이 어려운 이유

  데이터가 곧 메시지는 아니다. 데이터 안에서만 메시지나 목적을 구하는 것이 아니라 내가 먼저 어떤 문제를 해결하고 싶고, 어떤 목표가 있어서 이것을 데이터로 해야 겠다는 문제의식과 방향이 먼저 설정되어야 한다.

</br>

### 문제 구조화

#### 문제 구조화하기

1. 문제 구조화를 위한 프로세스

   분석 목적 세분화 -> 데이터 분석 -> 문제 해결

2. 문제요소와 분석방법을 구조화하기

   - 이슈트리(Issue Tree)의 활용

     나누고 쪼개기

   - 데이터로 해결할 수 있는 문제파악

     정량적인 가설검증이 가능한 문제 나누기

   - 가설 수립과 분석 계획 세우기

     구분된 문제 해결을 위한 가설과 분석계획 수립

3. 이슈트리 활용하기

   복잡하고 큰 문제에서 단순하고 작은 문제로 쪼개짐

   MECE : 중복없이 누락없이 주요요소를 빈틈없이 나열, 상위레벨에서 하위레벨로

   ![image-20220604235759256](https://ifh.cc/g/HOrRTn.png)

4. 정성적인 이슈트리 예시

   큰 상위개념을 어떻게 잡았는지에 따라서 뒷단에 찾아낼 수 있는 구체적이고 해결가능한 이슈들이 잘 나온다.

   Level1을 잡는데에 가장 많은 시간을 쏟고, 보통 Level2나 Level3까지 가능한 빠짐없이 누락없이 내가 해결하고 싶은 문제의 다양한 이슈들에 대해서 생각

   ![image-20220605000513708](https://ifh.cc/g/yvYyOO.png)

5. 정량적인 이슈트리 예시

   수치적인 것들 위주로 파악 가능

   ![image-20220605000716016](https://ifh.cc/g/PakBj7.png)

6. 구조화 이후 데이터 문제 탐색하기

   어떻게 문제와 분석방법을 구조화 할 수 있는지

   ![image-20220605000754722](https://ifh.cc/g/ZvhKt9.png)

#### 문제 설정의 맥락 파악

- 잘못된 문제점의 사례분석

  해결해야 할 진짜 문제는 무엇일까?

  - 메르스

    2015년 5월 바이러스 유입

    낙타가 발원지임이 밝혀짐

    당시 보건복지부가 내놓은 메르스 예방법

    ![image-20220605001058689](https://ifh.cc/g/Bt5ah7.png)

    문제정의, 설정을 제대로 하고나서도 그것에 대한 전반적인 맥락정보를 제대로 활용하지 못한 사례

적합한 도메인 지식을 가졌는가, 맥락적인 정보를 이해를 했는지가 명확히 인지되고 사전에 숙지된 상태에서 좋은 분석기법을 거쳐야만 제대로된 문제정의를 할 수 있다. 

즉, 우리는 문제설정의 맥락을 파악하면서도 도메인 지식을 활용하고자 하는 이슈를 파악해야 한다.

</br>

### 도메인 지식 활용

#### 도메인 지식활용의 필요성

1. 현업의 실무 전문가 vs 데이터 분석가

   - 성공적인 결과 활용을 위한 역할

     - 데이터 활용이 필요한 실무 전문가 : 데이터 활용을 하고 싶어도 분석 기법에 대해 잘 모르는 등 어려움 존재

     - 데이터 사이언티스트 : 데이터를 제대로 활용해야 하는데 데이터를 분석적으로 기능적으로 다루는 방법은 익숙하지만, 그 데이터와 연관된 실무의 히스토리라던지 현업 담당자들의 노하우나 직관같은것들이 없다면 명확하게 그 데이터의 특성이나 활용용도에 대해서 파악하기 어렵다

     ![image-20220605002235445](https://ifh.cc/g/g8bTwO.png)

2. 데이터 활용이 필요한 실무자의 역할

   - 올바른 문제정의를 위해 확인할 것들

     데이터가 무엇을 누구를 위해 활용될 것인지 맥락 확인

     맥락과 방향설정이 확인된 이후에는 문제 구조화해서 체계적으로 이슈를 쪼개고 데이터로 해결이 가능한 부분을 고름

     어떠한 분석기법 별로 어떤 장단점과 특징이 있는지 파악해서 목적에 맞는 것들을 알고

     이것을 위해 필요한 데이터 수집, 전달하고 공유하는 역량도 필수

     ![image-20220605002328957](https://ifh.cc/g/ht8JmX.png)

   - 도메인 지식이 없는 데이터의 어려움

     데이터 분석뿐만 아니라 데이터를 기획하거나 해석하는데 있어서 도메인 지식, 맥락파악의 중요성

     - numeric data -> categorial data

     ![image-20220605003026024](https://ifh.cc/g/7BjaoQ.png)

     - dummy variable

       ![image-20220605003259095](https://ifh.cc/g/s5a6Fx.png)

     - 맥락적인 이해를 떠나서 전문 지식이 필요한 경우
     
       ![image-20220605003338537](https://ifh.cc/g/blPczG.png)
     
       ![image-20220605003408126](https://ifh.cc/g/d8XjhA.png)
     
       ​										    
     


- 결측치, Null값 대체

     ![image-20220605003525737](https://ifh.cc/g/fYzYxx.png)
     
- 데이터 이해를 위한 도메인 지식

   데이터를 활용한다는 것은 시작부터 끝까지 도메인 지식도 필요하지만 맥락적인 정보도 반드시 알아야 하고 방향 설정과 꼼꼼한 문제 이슈들까지 구조화되서 여러 방향에서의 기획, 설계 등을 필요로 하게 된다.

​     ![image-20220605003748657](https://ifh.cc/g/ZRPaX3.png)

---

</br>

</br>

## 문제정의를 위한 핵심요소와 분석 기법

### 문제정의 핵심요소
#### 문제정의 핵심요소, 분석의 목적
1. 명확한 주제와 목적설정하기

   - 분석 대상과 문제의 이해를 위한 주제

     대상 -> 궁극적인 분석의 대상은 무엇인가?

     문제 -> 어떤 문제를 해결할 것인가?

     - 비즈니스의 데이터 활용 주제 규칙
       - 실무적으로 뚜렷한 방향성
       - 업무 프로세스 최적화와 실적개선을 위한 효율화에 우선 도전
       - 수요 및 가격 예측은 결코 쉽지 않은 주제
       - 부서, 조직, 회사 전체와의 합의와 커뮤니케이션 필요

2. 맥락 파악과 정보 수집하기

   - 정보수집의 유형과 필요성

     - 정보수집은 데이터로 무언가를 보든 안보든간에 항상 정성적, 정량적 자료를 최대한 많이 모을수록 좋다.

     - 맥락정보를 여러 형태로 수집해야 한다.

       우리가 앞에서 선택한 주제가 얼마나 시급하고 얼마나 당장 해결해야하는지에 대한 기준이 될 수 있다. 

       주제 하나를 해결하기 위해서 수많은 세부적인 가설들을 세우고 그 가설들을 바탕으로 하나씩 검증과 분석을 진행할텐데 그 여러가지 시행단계에 있어서 어떤 가설, 목적, 분석방법이 가장 우선순위가 될것인가는 맥락정보를 얼마나 다양하게 깊이 잘 파악했냐에 달려있다.

     - 문제의 심각성과 해결의 필요성을 위한 정보

       - 정성적 인터뷰 자료
       - 정량적 데이터를 통한 맥락정보의 수집

     - 맥락 정보를 활용한 다양한 정보 수집

       - 인구통계학적 정보
       - 정치 및 정책 관련 규제
       - 경제사회 및 환경적 정보
       - 기술 및 경쟁사 관련 정보 등

     - 정보수집을 통한 맥락 파악 예시

       ![image-20220607224901234](https://ifh.cc/g/pzMvsM.jpg)

       `공급부족에 대한 문제를 해결해보자`

       이 주제를 해결하기 위해서 얼마나 심각한지 얼마나 시급한지를 적절히 알려주는 맥락정보를 뽑아야함

       "철스크랩 가격 상승, 공급부족 겹쳐 톤당 110만원 거래.. 13년 만의 최고점 찍었다"를 보고

       - 대표적인 건설자재인 철근 가격이 가파르게 상승함
    - 국내 철근 제조기법을 분기마다 고시하던 건설사항 가격 수정까지 검토중
       
       뽑아내는 맥락정보는 선정한 주제마다, 분석의 목적마다 달라진다.

3. 성공 기준 정의하기

   명확한 합의 및 목표설정을 위한 기준

   - 성공 기준 정의

     어느 정도 수준까지 달성해야 성공으로 볼것인가에 대해 정의

     구체적인 목표 설정의 효과

     1. 가장 중요한 질문에 대한 답을 찾을 수 있다.
     2. 지금 잘 하는지 판단할 수 있다.
     3. 목표에 집중할 수 있다.
     4. 조직원이 일하는 방향과 기준을 통일할 수 있다.

     ![image-20220607230309025](https://ifh.cc/g/sgQcCB.png)

4. 분석의 목적과 핵심 변수 정의

   어떤 지표를 넣고 무엇을 볼 것인가?

   ![image-20220607230530404](https://ifh.cc/g/v1Jl5A.png)

   - Input 설계하기

     `어떤 데이터를 넣을 것인가?`

     철근가격 상승 사례 자료, 주원료 가격자료, 인터뷰, 설문조사, 철근공장 가동량, 날씨 및 국제 정세 등

   - Output 정의하기

     데이터로 분석하여 달성하고자 하는 목적

     ![image-20220607230822714](https://ifh.cc/g/12t1Vo.png)

     매출 상승, 인건비 절감 등은 데이터 분석의 목적이 아니라 분석을 통해서 달성하고자 하는 visionary한 미션이라 볼 수 있다.

     데이터 분석의 목적(Output)은 이 데이터에 따라서 어떠한 분석기법, 알고리즘을 사용했을 때 궁극적으로 데이터 안에서 나타나는 결과가 무엇이냐를 뜻한다.

     

#### 유형별 데이터 분석 기법

1. 목적과 변수 설정

   - 현상파악

     현상파악(어떤 결과를 볼 것인가?) => 기술통계,시각화(어떤 방법으로?)

     -  정의 : 대상의 상태나 상황을 지속적으로 확인하여, 예기치 못한 상황과 오류를 대비하고 극복
     - 사용자가 모니터링에서 가장 먼저 보게 되는 첫 화면인 대시보드에서는 사용자의 기본적인 궁금증을 해소할 수 있어야 하고, 결정적인 데이터를 직관적인 지표로 보여줘야 함
     - 또한 여러 서버에서 보내지는 데이터를 보여줄 때는 대상의 상황의 변화를 지속적으로 보여줄 수 있어야 함

   - 인과관계

     인과관계(어떤 결과를 볼 것인가?) => 회귀분석 등(어떤 방법으로?)

     - 정의 : 원인과 결과를 찾기 위해 조건간 차이를 찾는 것

     - **상관관계와 인과관계의 차이를 명확히 규정하는 것이 중요**

       여름에 아이스크림 판매량과 범죄율이 증가한다고 해서 아이스크림 판매량이 증가하면 범죄율이 증가한다고 해석하면 안된다. 아이스크림 판매량과 범죄율의 상관관계는 높을 수 있으나 원인과 결과로 치부하기에는 어폐가 있다.

     - 상관관계와 인과관계를 확실하게 구분하기 위해서는 각 항목들의 독립적인 이해와 다른 변수들이 동일한지, 또는 상관관계를 갖고 있는 또다른 항목들이 있다면 그 항목들도 다양하게 함께 분석해볼 필요가 있음

   - 유사도분석

     유사도분석(어떤 결과를 볼 것인가?) => 상관분석, cosine similarity(어떤 방법으로?)

     - 정의 : 비슷한 부류끼리 묶어서 분석하는 기법으로, 클러스터링(clustering)이라고도 부름
     - 유튜브, 넷플릭스, 페이스북친구, 쇼핑몰 등 추천시스템의 기반을 만드는 분석방법
     - 아웃풋에 대한 결과는 결국 "유사강도"가 나옴
     - 얼마나 유사한지, 얼마나 관련이 있는지
     - 유사도라는 것이 사람마다 기준에 차이가 있으므로 유사강도를 분석하는 수많은 알고리즘이 있음

   - 예측, 분류

     예측, 분류(어떤 결과를 볼 것인가?) => FT, 머신러닝 등(어떤 방법으로?)

     - 정의 : 전통적인 통계에서 회귀분석이라 부르며, 일어나지 않은 미래에 대한 예측, 정해진 범주대로 구분하는 분류가 있음
     - 회귀분석의 수많은 방법 중 하나를 머신러닝이라 함
     - 비슷한 부류로 딥러닝 등이 있음
     - 큰 그림에서는 모두 예측/분류라 할 수 있음
     - 예측과 분류는 자세하게는 개념이 다르므로, 활용목적에 따라 사용방법을 구분해야 함

     머신러닝과 딥러닝은 만능 분석 툴이 아니다. 예측/분류를 위한 방법 중 하나인 것이지 현상파악, 인과관계, 유사도분석을 머신러닝, 딥러닝만 배워서는 해결할 수 없다

2. 가설 수립과 우선순위

   - 가설 수립과 우선순위의 필요성

     어떤 데이터를 가지고 어떤 방법을 써서 무슨 결과를 봐야겠다고 설계를 함. 이 설계를 하는 과정에 있어서  수많은 질문인 가설들을 설정하고 그 가설들이 각각 맞는지 안맞는지에 대해서 하나하나 수립과 검증을 진행한다.

     데이터를 분석하고 문제를 해결하는데 는 가설을 수립하고 가설별로 중요도에 따라 우선순위를 둬야 한다.

     ![image-20220607233113416](https://ifh.cc/g/bFWa9Y.png)
