getwd() #작업 디렉터리 확인#
setwd("C:/Users/123gu/Documents") #작업디렉터리 변경#

help(mean)
?mean  #함수에 대한 설명#
help.search("histogram")
??histogram   #()안의 함수와 관련된 모든 패키지의 목록이 생성됨#

c(1,1,2,3,5,8,13,21)
c(1*pi, 2*pi, 3*pi, 4*pi)
c("Everyone", "loves", "stats")
c(TRUE, TRUE, FALSE, TRUE)
#벡터생성  수치형, 문자형, 논리형#

1:5
seq(1,5,2)
rep(1,5)
#수열생성#


##연습문제##
#1 1~100까지의 범위 내에서 5의 간격을 갖는 값들을 생성#
seq(1,100,5)

#2 1.에서 생성한 자료를 역순으로 나타내기#
rev(seq(1,100,5))

#3 1,5,10,20의 3번 반복 값을 자료값으로 갖는 벡터 생성#
rep(c(1,5,10,20),3)



fib<-c(0,1,1,2,3,5,8,13,21,34);fib
fib[2]  #fib의 2번째 원소 선택#
fib[-1] #fib의 1번째 원소 제외#
fib[c(1,2,4,8)] #fib의 1,2,3,8번째 원소 선택#
fib[fib<10] #fib의 원소들중 10보다 작은값들만 선택#

grp<-c("control", "treatment", "control", "treatment")
grp<-factor(grp) #범주형 데이터에 factor()함수 사용#
grp   #벡터의 구성요소들이 반복되는 경우 요인을 사용하는것이 문자형에서 효율적#

trt<-c(1,1,1,1,2,2,2,2,3,3,3,3)
y<-c(20,20,18,25,16,18,17,19,30,34,29,27)
trt<-as.factor(trt)
nlevels(trt)  #묶인 집합이 3개이다#
tapply(y, trt, mean) #묶인 집합 각각의 평균값#

gl(3,7) #factor level 생성 level 3개, 각각 원소 7개#


m<-matrix(c(2,1,1,-5,-3,0,1,1,-1),3,3,T);m 
#matrix(data,nrow,ncol,byrow=F)
v1<-c(2,-5,1)
v2<-c(1,-3,1)
v3<-c(1,0,-1)
v_matrix<-cbind(v1,v2,v3);v_matrix

r1<-c(1:3)
r2<-c(4:6)
r3<-c(7:9)
a<-rbind(r1,r2,r3);a

dat<-c(1,4,3,8,2,6,7,8,3,4,9,6,7,8,1)
array(dat,c(3,5)) # array(data,dim) data랑 차원지정#

m[2,2] #2행2열 원소#
m[3,1] #3행1열 원소#
m[1,]  #1행 벡터#
m[,3]  #3열 벡터#


##예제  0과 1로 이루어진 벡터 d=[0,1]에서 56개의 sample을 복원추출하고#
#8x7행렬로 표현##
d<-c(0,1)
matrix(sample(d,56,rep=T),8,7)
#sampe(data,추출할개수,반복허용)#


# ^ : n제곱  %/% : 몫  %% : 나머지  %*% : 행렬의 곱#
x<-matrix(1:9, nrow=3, byrow=F)
y<-matrix(1:9, nrow=3, byrow=T)
x+y
x-y
x/y
x%/%y
x%%y
x^y
x%*%y 
 
a<-matrix(c(2,9,6,7,5,2,6,4,1), nrow=3); a
t(a) #전치행렬# 
det(a) #행렬식#
solve(a) #역행렬#
tr(a)


num<-c(1,2,3,4,5)
log<-c(TRUE, FALSE, TRUE, TRUE, FALSE)
char<-c("a","b","c","d","e")
df<-data.frame(num, log, char); df
#데이터프레임 생성#
str(df)

myframe<-data.frame(numbers=1:3, characters=c("a","b","c"), logicals=c(T,F,T))
myframe #데이터프레임 생성#

myframe$numbers  #numbers 변수만 선택#
with(myframe, numbers) #numbers 변수만 선택#
attach(myframe) #데이터프레임을 장착 고정#
numbers  #변수선택#
detach(myframe) #데이터프레임을 해제#
numbers  #변수선택 안됨#

myframe<-transform(myframe, weight=c(80,75,68))
myframe
#데이터프레임 맨오른쪽에 변수추가#

which(myframe$weight>70) #weight가 70보다 큰 행위치 출력#
subset(myframe, subset=(weight>70)) 
#데이터프레임에서 weight가 70보다 큰 행렬만 출력#

#array > 3차원 이상의 차원을 가질 수 있는 구조(행렬을 다차원으로 확장)#
arr1<-array(1:10);arr1
arr2<-array(1:10, dim=c(2,5));arr2
arr3<-array(1:12, dim=c(2,2,3));arr3

arr1
dim(arr1)<-c(5,2) #array에 새로운 차원값 부여#
arr1

#리스트는 서로 다른 데이터 타입 객채를 저장 가능#
obj<-list() #빈 리스트 객체 생성#
obj[[1]]<-"user1" #첫번째 리스트 객체 저장#
obj[[2]]<-20 #두번째 리스트 객체 저장#
obj[[3]]<-F #세번재 리스트 객체 저장#
obj[[4]]<-c(70,80,90,100) #네번째 리스트 객체 저장#
obj

list.user<-list("user1", 23, "M", c(80,85,90,95))
list.user
list.user2<-list(ID="user1", age=23, gender="M", grade=c(80,85,90,95))
# 이름지정해서 생성가능 #


## 함수 조건, 반복문 ##

# f(x)=-x^2 + 5 #
f=function(x){-x^2+5}
f(0)
f(3)

# f(x) = log(x) #
f=function(x){
if(x>0) y=x else y=-x
log(y)
}
f(7)
#함수 마지막에 출력할거 그냥써도 되고, print(), return()#


#조건문(if)#

## if(조건){다중 실행문} else{다중 실행문}

gender<-"F"
age<-11
if(gender=="M"){
if(age>20){
print("성인남성")}
else{
print("미성년남성")}
}else{
if(age>20){
print("성인여성")}
else{
print("미성년여성")}
}

score<-60
if(score>100){
print("점수 입력이 잘못되었습니다.")
}else if(score>=95){
print("A+")
}else if(score>=90){
print("A")
}else if(score>=85){
print("B+")
}else if(score>=80){
print("B")
}else{
print("C 이하입니다.")
}


#반복문 for문#
#어떤 처리를 반복해서 실행하고 싶을 때 쓰는 방법#
#반복 횟수를 지정한 리스트에는 수열(c(1,2,3)이나 1:5등)을 지정한다.#

for(i in 1:9){
print(rep(3,i))
}

for(i in 9:1){
print(rep(3,i))
}


#구구단#
gugu<-matrix(0, nrow=9,, ncol=9)
for(x in 1:9){
for(y in 1:9){
gugu[x,y]<-x*y
}
}
print(gugu)

#데이터 집합에서 짝수의 합과 홀수의 합 구하기#
n<-c(10,21,30,43,50,65,70,87,99,100)
even.sum<-0
odd.sum<-0
for(x in n){
if(x%%2==0){
even.sum <- even.sum + x
}else{
odd.sum <- odd.sum + x
}
}
print(even.sum);print(odd.sum)
#짝수들은 짝수들끼리 홀수들은 홀수들끼리 출력#




#NA가 아니면서 짝수인 값만 출력#
n<-c(1,NA,3,NA,5,6,NA,8,NA,10)
n3<-c()
for(x in n)
if(!is.na(x) & x%%2==0){
n3<-c(n3,x)
print(n3)
}else{
next
}

# break : 반복문 종료  next : 현재 블록 종료 다음 반복문 시작 #
#차곡차곡 쌓여가게 하기 위해서는 빈공간이 있어야함. 거기다가 쌓아가는것
 is.na(x) : x에na가 들어있나?
 ! : 들어있는게 아닌거를 쓰고 싶은거니까 반대로하는거니까 !
 x%%2==0 : x가 짝수를 의미
 na가 아니면서 짝수인 거는 n3에다가 차곡차곡 쌓아가겠다#


#while문 어떤 특정 조건을 만족하는 한 계산을 계속 수행(조건부 반복문)#
#if for while 은 컴퓨터 알고리즘이다 보니 헷갈릴때가 많으니까 처음에는 노트에 직접
 순차대로 해보는거 추천#

#앞의두수열의합 피보나치수열 마지막값이 300보다 작을때까지#
fibonacci<-0
last_fib<-1
while(last_fib<300){
fibonacci<-c(fibonacci,last_fib)
last_fib<-fibonacci[length(fibonacci)-1]+fibonacci[length(fibonacci)]
}
fibonacci


## 16p - 1~100사이의 3의 배수 중에서 짝수의 합 구하기
a<-1; sum<-0
while(a<=100){
if(a%%3==0 & a%%2==0){
sum <- sum + a
print(a)
}
a<-a+1
}
print(sum)



##행렬의 대각화##
#고유벡터인 람다값으로만 줄이는 대각행렬
#1. C^(-1)AC = D
#   C -> 고유벡터로만 구성되어있음
#2. AX=람다X
#   (A-람다I)X=0
#   우리는 X=0이 아니어야하기 때문에 (A-람다I)는 역행렬이 존재하면 안됨.   
#A=matrix(a:d,2,2)
#람다I=cbind(c(람다,0),c(0,람다))
#
#|A-람다I| = 0 
#
#+A는 정방행렬, C는정칙핼렬인지 확인
#A의 고유값을 대각원소로 갖는 D라는 대각행렬을 구할 수 있다

##정방행렬의 대각화##
#역행렬을 못 구하는 경우#
A<-matrix(c(1,0,1,1),nrow=2)
A
egA <- eigen(A)
#eigen함수에 행렬 넣으면 고유값(람다1,람다2),를 구해주고, 람다1에대한 고유벡터,
람다2에 대한 고유벡터를 구해줌, 이 행렬이 C#
egA
A.egvec <- egA$vectors
sA.egvec <- solve(A.egvec)

A<-matrix(c(1,0,1,1),2)
egA<-eigen(A)
egA
#Error in solve.default(A.egvec) : 
#  system is computationally singular: reciprocal condition number = 1.11022e-16
> 역행렬을 구할 수 없다, C^(-1)존재안하므로 대각화 불가능#

#역행렬을 구할 수 있는 경우#
B<-matrix(c(2,1,2,3),nrow=2)
B
egB<-eigen(B)
egB
B.egvec<-egB$vectors
sB.egvec<-solve(B.egvec)
sB.egvec%*%B%*%B.egvec
D<-diag(egB$values)
#C^-1BC=D#
#e-16 : 10^16, 매우작은값이므로 0으로 취급가능#


##대칭행렬의 대각화##

#C가 직교행렬
#CC^T=I
#cc^-1=I
#즉, C^-1 = C^T

#직교행렬을 의미하는 용어가 P

A<-matrix(c(2,-2,-2,5),nrow=2)
A
egA<-eigen(A)
egA
P<-egA$vectors
solve(P)%*%A%*%P
t(P)%*%A%*%P
D<-diag(egA$values)
#람다들인 6과1로 구성된 대각행렬이 쟤네랑 똑같네#
D


##R-review 그래픽스 함수##

#고수준 그래픽스 함수(plot), 저수준 그래픽 함수(plot 위에 문자나 선)#
#고수준 그래픽스 함수#

##plot()##
par(mfrow=c(2,2)) #화면을 2x5로 분할#
x<-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y<-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
plot(x,y,main="PLOT",sub="Test",xlab="x-label",ylab="y-label",type="l",lty=4)
#type = "p"점 "l"선 "b"점과선 "h"각점에서x축수직선#
#"l"선으로 했다면 선의 형식 지정가능
#lty=1 실선 lty=2 대시선 lty=3 도트선 lty=4 도트와대시선#

##curve() 그래프 안에 곡선을 그릴 때 사용하는 함수##
x<-function(x)(x^2)
curve(x,add=T)
curve(x,xlim=c(-3,3),ylim=c(0,3))

#저수준 그래픽스 함수#
par(mfrow=c(2,4)
plot(1:10)
abline(h=5) #y=5 직선#
rect(1,6,4,9) #(1,6),(4,9)대각꼭지점으로하는 사각형#
arrows(1,1,4,4) #(1,1) -> (4,4) 화살표#
text(8,9,"ABCD")#특정좌표에 문자입력#
title("main","sub") #주제목, 부제목#
legend(8,3,lty=1.3,c("P","Q","R")) #범례다는거#

points(6,4)#그래프위 (6,4)좌표에 점 찍음#
lines(c(2,1),c(8,2)) #(1,2)->(2,8) 선#


## 19p - points() 함수: 그래프에 점을 그리는 함수
x<-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y<-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
z<-c(3.5, 1.5, 2.3, 6.6, 4.7)
par(mfrow=c(1,3))
plot(x,y,main="PLOT",sub="Test",xlab="x-label",ylab="y-label", type="n")
points(z, pch=1, cex=1)
plot(x,y,main="PLOT",sub="Test",xlab="x-label",ylab="y-label",type="n")
points(z, pch=3, cex=1)
plot(x,y,main="PLOT",sub="Test",xlab="x-label",ylab="y-label",type="n")
points(z, pch=5, cex=1)

## 21p - lines() 함수 : 그래프에 선을 그리는 함수
plot(0:8, 0:8, type="n", ylim=c(0,6))
lines(c(2,6),c(1,1),lty=1)
lines(c(2,6),c(2,2),lty=2)
lines(c(2,6),c(3,3),lty="solid")
lines(c(2,6),c(4,4),lty="dashed")
lines(c(2,6),c(5,5),lty="dotted")

## 23p - text() 함수 : 그래프 안의 원하는 위치에 글자 표시
x<-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y<-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
plot(x,y,main="PLOT",xlab="x-label",ylab="y-label",type="p")
text(9,10, "Plotting", col="red")

## 24p - abline() 함수 : 그래프 안에 직선을 그림
x<-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y<-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
plot(x,y,main="PLOT",xlab="x-label", ylab="y-label", type="p")
abline(h=6,v=9,lty=3)

## 25p - legend() 함수 : 그래프 안에 범례 박스를 그림
x<-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y<-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
plot(x,y,type="n")
legend("center",legend=c("x","y"), pch=c(1,2),title="center")
legend("bottom",legend=c("x","y"), pch=c(1,2),title="bottom")
legend("left",legend=c("x","y"), pch=c(1,2),title="left")
legend("right",legend=c("x","y"), pch=c(1,2),title="right")


###그래프의 중첩###
plot(sin, -pi, pi, xlab="", ylab="", lty=2)
par(new=T)
plot(cos, -pi, pi, xlab="x", ylab="y")


#그람슈미트과정#
a1=matrix(c(1,1,1),c(3,1))
a2=matrix(c(1,-2,1),c(3,1))
a3=matrix(c(1,2,3),c(3,1))
w1=a1;w1
k1=(t(a2)%*%w1)/(t(w1)%*%w1)
w2=a2-as.numeric(k1)*w1;w2
k1_2=(t(a3)%*%w1)/(t(w1)%*%w1)
k2=(t(a3)%*%w2)/(t(w2)%*%w2)
w3=a3-as.numeric(k1_2)*w1-as.numeric(k2)*w2;w3


#스펙트럼 분해#
#대칭행렬일때는 쉽게 분해#
#하나의 대칭행렬을 여러 개의 행렬의 합으로 분해#

A<-matrix(c(2,0,0,0,4,3,0,3,-4),nrow=3)
egval<-eigen(A)$values
egvec<-eigen(A)$vectors
eigen(A)
C<-egvec
D<-diag(egval)
C%*%D%*%t(C);A


eigA<-eigen(A);eigA
eigA_values<-eigA$values
eigA_vectors<-eigA$vectors
mat1<-eigA_values[1]*eigA_vectors[,1]%*%t(eigA_vectors[,1])
mat2<-eigA_values[2]*eigA_vectors[,2]%*%t(eigA_vectors[,2])
mat3<-eigA_values[3]*eigA_vectors[,3]%*%t(eigA_vectors[,3])
mat1;mat2;mat3
mat1+mat2+mat3;A
#고유값*고유벡터*t(고유벡터)?#


#특이값분해#
#대부분은 대칭행렬이 아니기때문에 대부분의경우에
#적용되는 특이값분해


A<-matrix(c(5,0,3,4,0,7,0,1,2,6,0,3),nrow=4);A
svdA<-svd(A);svdA
#d값은 특이값#
svdA_values<-svdA$d;svdA_values
svdA_u<-svdA$u;svdA_u
#u의 4번째열 짤림. 4x3#
svdA_v<-svdA$v;svdA_v
#v는 걍 3x3#
mat1<-svdA_values[1]*svdA_u[,1]%*%t(svdA_v[,1])
mat2<-svdA_values[2]*svdA_u[,2]%*%t(svdA_v[,2])
mat3<-svdA_values[3]*svdA_u[,3]%*%t(svdA_v[,3])
mat1;mat2;mat3
mat1+mat2+mat3

##svd함수를 사용안하고 특이값분해##
B<-matrix(c(5,0,3,4,1,0,7,0,0,8,1,6,10,0,5,7,1,5,9,1),nrow=5);B
BBt<-B%*%t(B);BBt
U<-eigen(BBt)$vectors;U
U<-U[,-5];U #B의 랭크는 4이기 때문에 5번째 고유벡터 열 제거 ?코드가안됨?#
U.eigval<-eigen(BBt)$values;U.eigval

BtB<-t(B)%*%B
V<-eigen(BtB)$vectors
V
V.eigval<-eigen(BtB)$values
V.eigval
D<-diag(sqrt(V.eigval))#랭크가 작은것의 고유값사용#
D

U%*%D%*%t(V)
# B54 = U54 D44 V44 #



#몬테카를로 시뮬레이션#

#균일난수 생성 1. 선형합동법 2. 승산합동법 (c를 더해주냐 안해주냐 차이밖에 없음)#

#1.선형합동법

c=1013904223
b=1664525
m=2^32
random.uni_lin = function(seed){
seed<-(b*seed+c)%%m
return(seed/m)
}
random.uni_lin(seed=7)


#2.승산합동법 c를 안더하는만큼 m과 b의 값을 최대한 다르게 해줘야함

random.number<-c()
random.seed=27218;m=30269;b=171
for (i in 1:50) {
random.seed<-(b*random.seed)%%m
random.number[i]<-random.seed/m
}
random.number


#선형이나 승산 둘다 난수1개나 여러개추출 코드 가능(c가 들어가냐 안들어가냐.)#


#균일난수생성 함수

runif(10,0,1)
runif(10,0,1)

#초기 seed지정 (난수고정)

set.seed(1234)
runif(10)

runif(10)

set.seed(1234)
runif(10)


#다른확률변수 시뮬레이션

#베르누이분포

set.seed(234)
guesses<-runif(20);guesses
correct.answers<-(guesses<0.2)
correct.answers
table(correct.answers)


#이항분포
#lower.tail=TRUE -> 기억해야됨
#X~B(10,0.6)

dbinom(4,10,0.6)#확률값 P(X=4)
pbinom(4,10,0.6)#누적확률값 P(X<=4)
qbinom(0.5,10,0.6)#분위수 quantile
rbinom(100,10,0.6) #난수추출


#포아송분포
#P(X=x)= (lamda^x)exp^(-lamda)/x!
# lamda > 일정한 단위시간동안에 평균발생힛수
#X~Poisson(6)

dpois(3,6) #lamda=6, P(X=3)
ppois(3,6) #P(X<=3)
qpois(0.45,6) #45th quantile
rpois(100,6) #난수추출 


#PPT 예제 풀어보기
#1. X~Poisson(lamda=7), P(X=5)?
dpois(5,7)

#2. X~Binomial(30,0.8) 1th quantile, 3th quantile?, 사분위수 범위는?
q1<-qbinom(0.25,30,0.8) #q  1th 0.25
q3<-qbinom(0.75,30,0.8) #q  3th 0.75   
q3-q1  # 사분위수 범위

#3. X~Binomial(n,0.4)따르는 난수 500개 생성, 시행횟수 n= 5, 20, 50 각각 히스토그램
par(mfrow(1,3)) 
hist(rbinom(500,5,0.4)) ##500 ->뽑는개수
hist(rbinom(500,20,0.4))
hist(rbinom(500,50,0.4))



#지수분포  한사건이 일어나고 다음사건이 일어날 때까지의 대기시간
# X~Exponential(lamda)
# f(t) = (lamda)exp(-lamda*t) 

#지수분포#
#T~EXP(l amda), P(T=t)= lamda*exp(-lamda*t)
#1/lamda = 세타 로도 할수 있음 (-> 대기시간 1/람다 = 세타)
# 단위시간 당 평균~분 -> 람다, 그냥 평균값-> 세타

##예제 5.10##
#은행원이 1분에 3명을 처리하는 서비스를 제공하고 있음. 고객이 1분미만의 서비스를 받을 확률은?
# 3=lamda(포아송) ---> 1/3=세타(지수)
# 주어진값이 람다인지 세타인지 확인을 하고, 람다이면 그냥 넣으면 되고, 세타이면 역수취해서 넣어야함.
# >지수분포 함수안에 rate 말하는겨
# X~EXP(lamda=3)
#P(X<1) = 0.9502129  # 1사람당 20초 미만 걸리니까 1분미만에 다 몰려있는 꼴
pexp(1,rate=3)  # 1분당 3이니까 lamda=3을 대입

##연습문제##
#람다가 아니라 세타가 주어진 꼴  ->그냥 평균~일
#1. 암말기 환자 평균 100일정도 살수 있다는 통보. 사망할떄까지 걸리는시간 : X
# P(X=x) = 1/100exp(-x/100) , (x>0)
#          0, (그 외 범위)

#(1) 환자가 150일 이내 사망할 확률?
#P(X<150)
pexp(150, rate=0.01) #세타가 주어졌으니 역수취해서 rate에 대입

#(2) 200일 이상 생존할 확률?
#P(X>=200)
pexp(200, rate=0.01, lower.tail=F)


#정규확률분포#
#매개변수들 잘 넣어주시고 (매개변수 따라 분포가 달라지기 떄문에~)

#예졔5.14
x<-rnorm(100000)
x<-x[(0<x)&(x<3)]
hist(x,prob=T)
par(mfrow=c(1,2))

##연습문제##
#1. 평균51, 표준편차 5.2 정규확률변수가 가질 수 있는 값 생각. n=10,100,1000
norm1<-rnorm(10,51,5.2)
mean(norm1);sd(norm1)
norm2<-rnorm(100,51,5.2)
mean(norm2);sd(norm2)
norm3<-rnorm(1000,51,5.2)
mean(norm3);sd(norm3)

#2. 자유도가 1인 카이제곱 확률변수가 따르는 확률분포는 표준정규확률변수의 제곱이 가지는 확률분포와
#동일하다는 사실을 이용하여 10000개 난수 생성하고 X^2(1)을 따르는 난수 10000개 난수 뽑아서 비교

par(mfrow=c(1,2))
x.norm<-rnorm(10000)
y<-x.norm^2
mean(y);var(y)
hist(y)

x.chi<-rchisq(10000,1)
mean(x.chi);var(x.chi)
hist(x.chi)


###역변환법###
#가장 단순화된 상태 
#균등, 지수분포가 하기 쉬움, 정규분포같은애들은 어려움
#가장몰려있는곳이 도수가 높다
#균등분포는 cdf 꺽여진 직선 > 어디서 난수를 추출해도 간격이 같음
#지수분포는 cdf 곡선 > 간격다름
#F_X(x)=U
#F^(-1)(U) = x , 역함수를 찾은 다음에 난수추출
#역함수 = 1/lamda*log(1-lamda) #1-lamda그냥 lamda라고 써도욈(어차피 0~1값이어서)



f1<-function(x){
    return(1/sqrt(2*pi)*exp(-x^2/2))
}
print(integrate(f1, -Inf, Inf))


##Q1##
#역변환법을 이용하여 지수분포 난수 200개 생성
# X의 cdf - 1-exp(-lamda*x) , (x>0)
# 역함수(U) = -1/lamda*log(1-u) 인 경우에.
#X~EXP(lamda=3)

ran_exp<-function(n, lamda){
u<-runif(n)
x<-(-1/lamda)*log(1-u)
x
}

X<-ran_exp(200, 3)
mean(X);var(X)

hist(X)


#베르누이분포에서의 역변환법


##기각표본법##
#난수추출하기쉬운분포나 어려운분포나 2개다 확률밀도함수 알고있는상태임.
#쉽다는것은 분포함수의 역함수 구하기 쉬운애들 G^(-1)(U)
#확률밀도함수를 이미 알고 있는데, 이 확률밀도함수를 따르는 난수를 추출하고싶은것.
#역함수도 잘 모르는 경우의 어려운녀석을 알고싶다


#예제 5.20
# 삼각밀도함수로부터 의사난수 변량을 생성
# f(x) = 1 - |1-x|,  (0<=x<2)
# c*g(x)는 삼각밀도함수 덮는 사각형모양
# c*g(x)를 그냥 균등분포로 잡은 꼴, = 1
# U2<= h(x) = f(x)/c*g(x) = f(x)/1

U1<-runif(100000,0,2)
U2<-runif(100000)
X<-U1[U2<(1-abs(1-U1))]
X


#예제 5.21
#c정규화상수 (f(x)를 적분했을때 1로 만들어주는 상수)
#c별로 안중요함 비중x
#0.5e(-x^1.5)   <= e(-x)   오른쪽이 왼쪽을 포괄한다.
# k=0.5/c   k*f(x) 에 대해 기각표본법 사용
# k*f(x) = 0.5e(-x^1.5)의 난수 추출

kf<-function(x){0.5*exp(-(x^1.5))}
X<-rexp(100000,rate=1)
U2<-runif(100000)
X<-X[U2<kf(X)/dexp(X,rate=1)]

hist(X, prob=T, breaks="Scott")
par(new=T)
hist(dexp(X,rate=1),prob=T)



###몬테카를로 적분###

##적중법##

N<-10000                   # 0<y<1, 0<x<2 구간 사각형에 10000개 점 뿌리겠다
i.y<-c()                   # 조건을 만족하는 y값들을 저장하기 위한 빈공간 생성
f<-function(x){1/(1+x^2)}  # 적분값을 구하고자 하는 함수 입력
x<-runif(N,0,2)            # x축 적분구간 0~2 에서 uniform난수 N개 생성 
y<-runif(N,0,1)            # y축 적분구간 0~1 에서 uniform난수 N개 생성

for(i in 1:N){  
i.y[i]<-as.numeric(y[i]<=f(x[i]))   # 지시함수 사용, i번째 y값이 i번째 f(x)값보다 작으면 1, 아니면 0
}
theta.hat<-2*sum(i.y)/N   # 적분추정값 : (y축적분구간길이 * x축적분구간길이) * (0+1+1+...+0)/10000
                          # 사각형의 넓이 * 10000개 중 1의 비율


##표본평균법 - 2차원##
# f(u)값 평균(높이) * x축 적분구간(밑변) (=사각형 넓이라 생각하면 쉬움)

a=0; b=3                  # x축 적분구간 지정 a~b
u<-runif(10000,a,b)       # x축 적분구간에서 uniform난수 10000개 생성
theta_hat=mean(exp(-u^2/2)/sqrt(2*pi))*(b-a)
theta_hat                 # 적분추정값 : f(u)값 평균 * x축 적분구간
                 

##표본평균법 - 3차원(다중적분)##
# f(u,v) (= z)값의 평균 * xy평면 사각형 넓이

u<-runif(10000,0,1)       # x축 적분구간 0~1에서 uniform난수 10000개 생성
v<-runif(10000,0,1)       # y축 적분구간 0~1에서 uniform난수 10000개 생성
i_hat<-mean(exp(-(v+u)^2)*((u+v)^2))*1 
i_hat                 # 적분추정값 : (f(u,v)의 평균) * (xy평면 사각형 넓이)


##주표본기법##
# 표본평균법에서 확률밀도함수 = 1/(b-a) (균등분포)를 일반화 # 
# 분산을 감소시키기 위해 피적분함수의 절대값 함수와 형태가 비슷한 확률밀도함수를 사용 #
# Y=피적분함수/확률밀도함수, Y는 적분추정값I의 불편추정량 #

# 5가지 확률밀도함수(중요함수or주함수)생성해서 var(Y)/m 이 작은거 선택 #
# Y의 분산이 작아야 함 #

m<-10000               # 난수생성 갯수 지정              
theta.hat<-c()         # 적분추정값 5개 담을 빈 공간 생성
se<-c()                # 표준편차 5개 담을 빈 공간 생성
g<-function(x){exp(-x)/(1+x^2)*(x>0)*(x<1)} # 적분추정값 구할 피적분함수 지정 

x<-runif(m)            # 첫번째 주함수 f0 = 1 인 경우, x범위에서 uniform 난수생성
fg<-g(x)/1             # fg = 불편추정량 Y 값 , 난수생성한 x를 f(x)에 대입
theta.hat[1]<-mean(fg) # 1번째 적분추정값 = 불편추정량Y의 평균
se[1]<-sd(fg)          # 1번째 표준편차

x<-rexp(m,1)           # 두번째 주함수 f1 = exp(-x) 인 경우, 난수는 exponential, lamda=1
fg<-g(x)/exp(-x)       # fg = 불편추정량 Y 값 = g/f , 난수생성한 x를 f(x)에 대입
theta.hat[2]<-mean(fg) # 2번째 적분추정값 = 불편추정량Y의 평균
se[2]<-sd(fg)          # 2번째 표준편차

x<-rcauchy(m)          # 세번째 주함수 f2 = ((1+x^2)^(-1))/pi = 코시분포 확률함수 
i<-c(which(x>1),which(x<0))  # 난수 x들 중 (x<0), (x>1)인 순번을 i에 저장 
x[i]<-2 #to catch overflow errors in g(x) # i번째 x는 2로 변환
fg<- g(x)/dcauchy(x)         # 불편추정량 Y값 = g/(코시분포 확률밀도함수),난수생성한 x를 f(x)에 대입
theta.hat[3]<-mean(fg)       # 3번째 적분추정값 = 불편추정량Y의 평균
se[3]<-sd(fg)                # 3번째 표준편차


#알려지지 않은 함수는 역변환법을 통해서 난수추출해야 한다#
u<-runif(m)                  # 네번째 주함수 f3 = exp(-x)/(1-exp(-1)), u~uniform(0,1)생성
x<- -log(u*(1-exp(-1)))    # f3의 역함수에 위에서 구한 난수 u를 대입하면 x값 나옴
fg<-g(x)/(exp(-x)/(1-exp(-1))) # 불편추정량 Y값 = g/f, f3함수에 위에서 구한 x값 대입하면 y값 나옴
theta.hat[4]<-mean(fg)         # 4번째 적분추정값 = 불편추정량Y의 평균
se[4]<-sd(fg)                  # 4번째 표준편차
   # x범위에서 난수생성, x에 대한 식에서 y에 u를 대입하면 새로운 x값 나옴, 원래함수식에 새로운 x값 대입  

u<-runif(m)                  # 다섯번째 주함수 f4 = (4(1+x^2)^(-1))/pi , u~uniform(0,1)생성
x<-tan(pi*u/4)               # f4의 역함수에 위에서 구한 난수 u를 대입하면 x값 나옴  
fg<-g(x)/(4/((1+x^2)*pi))    # 불편추정량 Y값, f4함수에 위에서 구한 x값 대입하면 y값 나옴
theta.hat[5]<-mean(fg)       # 5번째 적분추정값 = 불편추정량Y의 평균
se[5]<-sd(fg)                # 5번재 표준편차

rbind(theta.hat,se)          # 적분추정값은 거의 차이가 없으므로, 표준편차가 가장 작은 4번째 f3가 적절하다

#주함수 f4를 x에 대한 식으로 나타낼 때, 굳이 tan안써도 값은 똑같이 나옴#
u<-runif(m)
x<-sqrt(((pi*u)/4)^(-1)-1)
fg<- g(x)/(4(1+x^2)^(-1))/pi
thetaa<-mean(fg);thetaa
ses<-sd(fg);ses




###수치적 최적화###

##황금분할 탐색법##

##연습문제1##

par(mfrow=c(2,2))

#(a)#

f<-function(x){
abs(x-3.5)+abs(x-2)+abs(x-1)} #최소값을 구하고 싶은 함수 입력

golden<-function(f,a,b,tol=10^-7){
ratio=2/(sqrt(5)+1)    # 1/황금비율=0.618
x1<-b-(b-a)*ratio      # 새로운구간을 찾기 위한 x1,x2값 구함  
x2<-a+(b-a)*ratio
f1<-f(x1)              # 새로운구간을 정의하기 위한 f1,f2값 구함  
f2<-f(x2)
 while(abs(a-b)>tol){  # 미리정해놓은 한계치보다 작아질 때까지 반복
  if(f2>f1){           # f(x2)값이 f(x1)값보다 큰 경우
b<-x2                  # 새로운구간 [a,x2], 이 새로 구한 구간에서 다시 새로운구간을 구하면
x2<-x1                 # 새로운 x2는 이전 구간의 x1과 같고,
f2<-f1                 # 새로운 f(x2)는 이전 구간의f(x1)값과 같다. 
x1<-b-(b-a)*ratio      # 새로운 x1값은 이전 구간값을 공식에 대입  
f1<-f(x1)}             # 새로운 f(x1)은 새로 구한 x1값을 f(x)에 대입.
 else{                 # f(x1)값이 f(x2)값보다 큰 경우
a<-x1                  # 새로운 구간은 [x1,b], 이 새로 구한 구간에서 다시 새로운구간을 구하면
x1<-x2                 # 새로운 x1은 이전 구간의 x2와 같고,
f1<-f2                 # 새로운 f(x1)은 이전 구간의 f(x2)값과 같다. 
x2<-a+(b-a)*ratio      # 새로운 x2값은 이전 구간값을 공식에 대입
f2<-f(x2)}             # 새로운 f(x2)값은 새로 구한 x1값을 f(x)에 대입.
}
return((a+b)/2)        # 구간 중앙값 출력 -> 최적해
}

curve(f,xlim=c(-5,5),ylim=c(-10,10),lwd=2)  # 초기구간 지정하기 위해 먼저 그래프를 보고 판단
golden(f,0,5)          # 함수 f의 최소값을 도출하는 최적해 
f(golden(f,0,5))       # 함수 f의 최소값

curve(f,xlim=c(0,5),ylim=c(0,10),lwd=2)
lines(c(golden(f,0,5),golden(f,0,5)),c(-1,f(golden(f,0,5))),lty=2)
points(golden(f,0,5),f(golden(f,0,5)),pch=1,cex=2)
text(golden(f,0,5),f(golden(f,0,5))+0.7,label="최솟값",col="red")


#(b)#

f<-function(x){
abs(x-3.2)+abs(x-3.5)+abs(x-2.8)+abs(x-1)}

golden<-function(f,a,b,tol=10^-7){
ratio=2/(sqrt(5)+1)    # 1/황금비율=0.618
x1<-b-(b-a)*ratio      # 새로운구간을 찾기 위한 x1,x2값 구함  
x2<-a+(b-a)*ratio
f1<-f(x1)              # 새로운구간을 정의하기 위한 f1,f2값 구함  
f2<-f(x2)
 while(abs(a-b)>tol){  # 미리정해놓은 한계치보다 작아질 때까지 반복
  if(f2>f1){           # f(x2)값이 f(x1)값보다 큰 경우
b<-x2                  # 새로운구간 [a,x2], 이 새로 구한 구간에서 다시 새로운구간을 구하면
x2<-x1                 # 새로운 x2는 이전 구간의 x1과 같고,
f2<-f1                 # 새로운 f(x2)는 이전 구간의f(x1)값과 같다. 
x1<-b-(b-a)*ratio      # 새로운 x1값은 이전 구간값을 공식에 대입  
f1<-f(x1)}             # 새로운 f(x1)은 새로 구한 x1값을 f(x)에 대입.
 else{                 # f(x1)값이 f(x2)값보다 큰 경우
a<-x1                  # 새로운 구간은 [x1,b], 이 새로 구한 구간에서 다시 새로운구간을 구하면
x1<-x2                 # 새로운 x1은 이전 구간의 x2와 같고,
f1<-f2                 # 새로운 f(x1)은 이전 구간의 f(x2)값과 같다. 
x2<-a+(b-a)*ratio      # 새로운 x2값은 이전 구간값을 공식에 대입
f2<-f(x2)}             # 새로운 f(x2)값은 새로 구한 x1값을 f(x)에 대입.
}
return((a+b)/2)        # 구간 중앙값 출력 -> 최적해
}

curve(f,xlim=c(-5,5),ylim=c(-10,10),lwd=2) # 초기구간 지정하기 위해 먼저 그래프를 보고 판단
golden(f,0,5)          # 함수 f의 최소값을 도출하는 최적해 
f(golden(f,0,5))       # 함수 f의 최소값
f(golden(f,0,seq(2.8,3.2,0.1))) # 구간[2.8,3.2]에서 f는 최소값 2.9다. 즉, 최소값이 1개이상.

curve(f,xlim=c(0,5),ylim=c(0,10),lwd=2)
lines(c(golden(f,0,5),golden(f,0,5)),c(-1,f(golden(f,0,5))),lty=2)
lines(c(golden(f,0,2.8),golden(f,0,2.8)),c(-1,f(golden(f,0,5))),lty=2)
lines(c(golden(f,0,2.8),golden(f,0,5)),c(f(golden(f,0,5)),f(golden(f,0,5))),lwd=3,lty=1,col="red")
text(golden(f,0,5)-0.2,f(golden(f,0,5))+0.5,label="최솟값",col="red")
#그래프에서 빨간색으로 칠해진 f값이 모두 최솟값이다.





##뉴튼-랍슨법##

##연습문제2##

#2차이상의 미분을 하기 위해 미분함수 정의
DD<-function(expr, name, order=1){
    if(order < 1) stop("'order' must be more than 1")
    if(order ==1) D(expr, name)
    else DD(D(expr, name), name, order-1)
}

#(a)#
f<-expression(sin(x/2)*cos(x/4))
f<-expression(sin(x/2)*cos(x/4))   # 2차미분까지 구하기 위해 f를 expression으로 먼저 정의
f1prime_e<-DD(f,"x",1);f1prime_e   # f의 1차미분 
f2prime_e<-DD(f,"x",2);f2prime_e   # f의 2차미분
 f<-function(x){sin(x/2)*cos(x/4)} # 위에서 구한 식은 함수가 아니므로, 함수로 다시 지정  
 f1prime<-function(x){cos(x/2) * (1/2) * cos(x/4) - sin(x/2) * (sin(x/4) * (1/4))}
 f2prime<-function(x){-(cos(x/2) * (1/2) * (sin(x/4) * (1/4)) + sin(x/2) * (1/2) * 
    (1/2) * cos(x/4) + (cos(x/2) * (1/2) * (sin(x/4) * (1/4)) + 
    sin(x/2) * (cos(x/4) * (1/4) * (1/4))))}

curve(f,xlim=c(-50,50))   # f의 그래프를 보고 초기값 판단
x0=22                     #초기값 x0지정
x<-c(x0,rep(NA,10))       #새로구한 x[i+1]을 저장하기 위해 x0를 포함한 공간 생성
fval<-rep(NA,11)          #새로구한 x[i+1]을 f에 대입한 값을 저장하기 위한 공간 생성
f1primeval<-rep(NA,11)    #새로구한 x[i+1]을 f1prime에 대입한 값을 저장하기 위한 공간 생성 
f2primeval<-rep(NA,11)    #새로구한 x[i+1]을 f2prime에 대입한 값을 저장하기 위한 공간 생성

for(i in 1:10){              #10번만 반복하겠다.
fval[i]<-f(x[i])             #i번째 fval에 f(x[i])값 저장
f1primeval[i]<-f1prime(x[i]) #i번째 f1primeval에 f1prime(x[i])값 저장
f2primeval[i]<-f2prime(x[i]) #i번째 f2primeval에 f2prime(x[i])값 저장
x[i+1]<-x[i]-f1primeval[i]/f2primeval[i]  #새로구할 x[i+1]의 공식
}

data.frame(x,fval,f1primeval,f2primeval)  #data.frame에서 f1primeval가 0인 x를 찾자
f(-10.10445);f(-2.461919);f(15.02829);f(22.67082)  # x=0 근처에 있는 4개의 최소값들 비교

# f1prime(x) = 0이 되는 점이 약 25.1327의 주기를 두고
# 약 7.64의 간격으로 2개씩 발생한다.

#(b)#

f<-expression(exp(2*x)-x-6)      # 2차미분까지 구하기 위해 f를 expression으로 먼저 정의
f1prime_e<-DD(f,"x",1);f1prime_e   # f의 1차미분 
f2prime_e<-DD(f,"x",2);f2prime_e   # f의 2차미분
 f<-function(x){exp(2*x)-x-6} # 위에서 구한 식은 함수가 아니므로, 함수로 다시 지정  
 f1prime<-function(x){exp(2 * x) * 2 - 1}
 f2prime<-function(x){exp(2 * x) * 2 * 2}

curve(f,xlim=c(-5,4),ylim=c(-20,100))   #f의 그래프를 보고 초기값 판단
x0=0                      #초기값 x0지정
x<-c(x0,rep(NA,10))       #새로구한 x[i+1]을 저장하기 위해 x0를 포함한 공간 생성
fval<-rep(NA,11)          #새로구한 x[i+1]을 f에 대입한 값을 저장하기 위한 공간 생성
f1primeval<-rep(NA,11)    #새로구한 x[i+1]을 f1prime에 대입한 값을 저장하기 위한 공간 생성 
f2primeval<-rep(NA,11)    #새로구한 x[i+1]을 f2prime에 대입한 값을 저장하기 위한 공간 생성

for(i in 1:10){              #10번만 반복하겠다.
fval[i]<-f(x[i])             #i번째 fval에 f(x[i])값 저장
f1primeval[i]<-f1prime(x[i]) #i번째 f1primeval에 f1prime(x[i])값 저장
f2primeval[i]<-f2prime(x[i]) #i번째 f2primeval에 f2prime(x[i])값 저장
x[i+1]<-x[i]-f1primeval[i]/f2primeval[i]  #새로구할 x[i+1]의 공식
}

data.frame(x,fval,f1primeval,f2primeval)  #data.frame에서 f1primeval가 0인 x를 찾자
f(-0.3465736)                             #x=-0.3465736에서 f가 최소.

lines(c(-0.3465736,-0.3465736),c(-25,f(-0.3465736)),lty=2)
points(-0.3465736,f(-0.3465736),pch=1,cex=2)
text(-0.3465736,f(-0.3465736)+7,label="최솟값",col="red")



### 마코프 체인 몬테카를로 MCMC ###
# 주어진 다변량 확률분포가 복잡하여, 이를 따르는 i.i.d난수를 얻을 수 없는 경우 사용
# i.i.d난수 대신 마코프 체인 난수 추출하여 사용
# 마코프 체인 난수는 정확하게 주어진 확률분포를 따르지는 않으나, 계속 추출하면
# 적정한 시간이 지난 후에 얻어지는 난수들은 원하는 분포에 수렴
# 1.복잡한 다변량 분포 or 우도함수를 갖는 문제에서의 모수추정, 최적해를 구하는 문제의 경우
# 2.베이지안 통계기법에서 사후분포가 복잡한 경우의 추론문제의 경우 
# 1.일반적인 몬테카를로, 2.MCMC(2.1깁스표본법, 2.2일반적인MCMC)



##이변량정규분포 밀도함수 그리기##
install.packages("mvtnorm"); install.packages("akima")
library(mvtnorm); library(akima)

plot.bivnormal <- function(mu=rep(0,2), stddev=c(1,1),r=0.8){
ngen<-500                 # 랜덤샘플 개수 지정
sigma<-diag(stddev)       # x,y의 분산을 대각으로 하는 공분산 행렬(대칭행렬)생성
sigma[1,2]<-sigma[2,1]<-r # 위에서 만든 행렬의 대각이 아닌 스칼라는 상관계수
xy<-rmvnorm(ngen, mean = mu, sigma) # multivariate normal dist에서 난수생성
i<-interp(xy[, 1], xy[, 2], dmvnorm(xy, mean = mu, sigma)) # interp함수로 위에서 생성한 난수 (x,y)에 대응하는 z(확률밀도함수)생성 
persp(i, theta=0, phi=50, ticktype="detailed",col="skyblue", shade=0.5)} # 위에서 생성한 밀도함수 그래프

par(mfrow=c(1.3))
plot.bivnormal(mu=rep(0,2), stddev = c(1,1), r=0)
plot.bivnormal() #디폴트값
plot.bivnormal(mu=c(0,2),stddev=c(1,2),r=0.5)


# 3차원 함수 그리기 # 
z.hat<-function(x,y){
exp(-(x+y)^2)*((x+y)^2)}
x<-seq(0,1,length=20)
y<-seq(0,1,length=20)
z<-outer(x,y,z.hat)

par(mfrow=c(1,1))
persp(x,y,z,theta=30,phi=-10,col="skyblue",shade=0.5,ticktype="detailed")
    #theta는 z축을 기준으로 xy평면 시계방향(+), phi는 올려다보거나 내려다 보는거
    #col ""지정가능, shade=숫자 명암넣기,ticktype="detailed" 축에 숫자 넣는거



##1.일반적인 몬테칼로 표본을 얻는 방법##
#x는 분포가 주어져 있고, y는 조건부 분포#
#이변량정규분포로부터의 난수추출#

rbvn<-function(n,rho){            # function(난수생성개수, 상관계수)
x<-rnorm(n,0,1)                   # x 먼저 생성, 지정값(평균=0,분산=1)  
y<-rnorm(n, rho*x, sqrt(1-rho^2)) # y는 위에서 생성한 x값에 종속돼서 생성,(평균=rho*x,분산=sqrt(1-rho^2))
cbind(x,y)}                       # 이변량 난수 묶음 cbind

rbvn(n=1000,rho=0.98)             # 난수생성 1000개, 상관계수 = 0.98

bvn<-rbvn(1000,0.98)              # 생성한 (x,y)를 bvn에 지정     

cor(bvn[,1],bvn[,2])              # x와 y는 원래 설정한 상관계수 따름
cor(bvn[999,],bvn[1000,])         # 나중에 추출할 표본일수록 표본간에 상관성이 떨어져 독립성을 띈다

par(mfrow=c(3,2))            
plot(bvn, col=1:1000)             # (x,y)들 상관계수가 1에 가까워서 우상향 선형 그래프가 나온다        
plot(bvn, type=“l”)               # 위와 똑같은 선형그래프, 색깔만 없음
plot(ts(bvn[,1]))                 # x벡터 transpose해서 1000개가 나오는 과정 보임
plot(ts(bvn[,2]))                 # y벡터 transpose해서 1000개가 나오는 과정 보임
hist(bvn[,1],20)                  # x값들의 빈도수
hist(bvn[,2],20)                  # y값들의 빈도수





##2. MCMC##
##2.1 깁스표본법##
#각각의 조건부분포가 다 알려져 있어야함#
#x,y 둘다 조건부 분포#
#다변량분포에서 표본추출
#난수추출 초반에는 x,y간에 강한 상관관계 존재,  #
#메트로폴리스헤스팅스에서 alpha가 항상 1이어서 새로운 난수를 무조건 채택하는 경우밈

gibbs<-function(n,rho){
mat<-matrix(ncol=2,nrow=n)          # (n x 2) 인 행렬 생성
x<-0                                # x초기값 지정
y<-0                                # y초기값 지정
mat[1,]<-c(x,y)                     # 1행은 (x,y) 초기값 (0,0)
for(i in 2:n){                      # i행은 2행부터 n행까지
x<-rnorm(1,rho*y,sqrt(1 - rho^2))   # x는 y에 대한 조건부분포 (평균=rho*y,분산=sqrt(1-rho^2))
y<-rnorm(1,rho*x,sqrt(1 - rho^2))   # y는 x에 대한 조건부분포 (평균=rho*x,분산=sqrt(1-rho^2))

mat[i,]<-c(x,y)                     # i행에 생성된 (x,y) 지정
}
mat                                 # 만들어진 행렬 출력
}

bvn<-gibbs(1000,0.98)                    # 표본 1000개 생성, 상관계수 0.98
par(mfrow=c(3,2))                    
plot(bvn,col=1:1000); plot(bvn,type="l") # (x,y)들 plot, 상관계수가 1에 가까워서 우상향 선형그래프
plot(ts(bvn[,1])); plot(ts(bvn[,2]))     # x벡터 time series plot으로 1000개가 어떻게 나오는지 보임;y도 보임
hist(bvn[,1],20); hist(bvn[,2],20)       # x값들 빈도수; y값들 빈도수

bvn<-gibbs(1010000,0.98)                 # 표본 1010000개 생성, 상관계수 0.98
bvn<-bvn[1000001:1010000,]               # 초기 표본 버리고, 1000001~1010000번째 난수만 선택
par(mfrow=c(3,2))
plot(bvn,type="l")
plot(bvn,col=1:10000)
plot(ts(bvn[,1])); plot(ts(bvn[,2]))
hist(bvn[,1],20); hist(bvn[,2],20)





##2.2 일반적인 MCMC##
# 일반적인 몬테카를로나 깁스표본법은 조건부분포가 있지만, 실제로는 없는경우가 많아서 일반적인 경우를 생각.
# i.i.d 표본추출이 불가능한 다변량분포에서 마코프체인을 이용해 표본을 추출하는 일반적인 방법
# MCMC는 주어진 문제에 적절하게 만들어진 마코프체인을 이용하여 긴 시간동안 난수를 구한 후 
# 앞의 깁스 표본법에서와 같이 초기 표본을 버리고 이후에 추출된 표본을 사용하여 여러 가지 필요한 통계적 추론들에 사용하는 방법.
# 주어진 문제에 적절한 마코프체인을 만드는 방법은 여러 가지가 있음. 
# 앞의 깁스 표본법은 만들어진 마코프체인이 각 변수에 대한 조건부(모든 다른변수들이 주어 졌을 때의) 분포인 특수한 경우이다.



# 마코프체인 : 다음시점(t+1)의 상태가 바로 전 시점(t)에만 의존하는 수열 #

## 1차 자기상관 마코프체인 ##
# 일변량, 에러항이 정규분포에서 추출
# beta의 절대값이 1보다 작아야 수렴해서 체인이 사용 가능하다.
# X_t = beta(베타값) * X_t-1(전 시점) + e_t(현시점 에러)

#발산하는경우#
mu0=5               # 초기값 지정
beta=1.0025         # 베타값 지정
chain <- c()        # 빈공간 생성
chain[1] <- mu0     # 첫번째 스칼라는 초기값
for (i in 1:1000){  # 1000번 반복, i+1번째 스칼라는 beta값 * i번째chain값 + 에러값(1개추출 N(0,(0.5)^2)
chain[i+1] <- beta * chain[i] + rnorm(1, sd=0.5)
}
plot(ts(chain))     # chain벡터를 time series plot으로 표본 1000개 생성과정 보임, 발산함

#수렴하는경우#
mu0=5               # 초기값 지정
beta=0.7            # 베타값 지정
chain <- c()        # 빈공간 chain벡터 생성, 
chain[1] <- mu0     # 첫번째 스칼라는 초기값  
for (i in 1:1000){  # 1000번 반복 i+1번째 스칼라는 beta값 * i번째chain값 + 에러값(1개추출 N(0,(0.5)^2)
chain[i+1] <- beta * chain[i] + rnorm(1, sd=0.5)
}
plot(ts(chain))     # chain벡터를 time series plot으로 표본 1000개 생성과정 보임, 수렴함





## 메트로폴리스 헤스팅스 ##
# 일변량이 아닌 다변량 확률변수에 대해 난수를 뽑을 때. <다변량 마코프체인>

# <<주어진 다변량분포와 마코프체인이 같도록 하는 마코프체인을 만들어, 표본을 추출하는 방법>>
# 파이(x) : 난수의 추출을 원하나 기존의 방법으로 난수 추출이 어렵거나 불가능한 <다변량 분포>
# q(y|x) : 체인이 수렴하도록 만드는 분포(표본추출함수), ,<사용하는 마코프체인>(조건x를 가지고 다음 y를 생성)
#          파이((x) 분포보다 분산이 크거나     
# 1. x초기값 지정하고, 
# 2. (j=1~N만큼 반복) 선택된 마코프 체인(q(y|x))에 x(j) 대입하여 y'생성, 선별기준 u~uniform(0.1)생성
#                   채택확률 alpha = (파이(y')/파이(x_j))/(q(y'|x_j)/q(x_j|y')
#                   /*표본추출함수 q가 대칭이면, q(y'|x_j) = q(x_j|y') 이므로, (q(y'|x_j)/q(x_j|y') = 1 */
#                   즉, alpha = 파이(y')/파이(x_j) --> 메트로폴리스 알고리즘                                    
#                         파이(x_j)>0 이면, alpha = min(파이(y')/파이(_j),1) /*u가 0~1이므로, alpha도 0~1 나오게 하고 시어서 min 사용*/
#                         파이(x_j)<0 이면, alpha = 1 
#                             선별기준 u <= alpha 이면, 새로운 x는 추출된 y로 채택
#                             선별기준 u > alpha 이면, 새로운 x는 원래 x (추출된 y 기각)
# 3. 앞부분을 버리고, 뒷부분만의 x들 사용. (일정한 시간후의 난수는 원하는 다변량 분포에 수렴함.) 
  
# 정형화된 몇가지 방법으로 만들어진 마코프 체인(1. 랜덤워크 체인, 2. 자기상관체인 ...)
# 기각표본법에서 f(x)/c*g(x) 의 유형과 비슷함
# uniform(0,1)의 난수 u가 채택확률 alpha보다 작으면 채택, 크면 기각
# alpha 값은 q(표본추출함수)가 대칭인 경우 약분되어서, 파이(y')/파이(x_j)로 나옴. -> 메트로폴리스 알고리즘



#이변량정규분포((평균(0,0), 분산(1,1), 상관계수r)에서 난수추출을 하고 싶은데, 사용하는 마코프체인은 "랜덤워크"#
#이 경우, 파이(x) = (det(2*pi*sigma)^-0.5)*exp((-1/2)*t(x-m)%*%solve(sigma)%*%(x-m)
#랜덤워크 : 에러값이 랜덤(u1<-runif(1,-0.75,0.75), u2<-runif(1,-1,1) #

mcmcbvn<-function (n, rho){                # function(표본생성수, 상관계수)
mat <- matrix(ncol = 2, nrow = n)          # (n X 2) 행렬 생성
sigma <- matrix(c(1, rho, rho, 1), ncol=2) # 공분산행렬 생성
sigmaInv <- solve(sigma)                   # 공분산행렬의 역행렬(inverse)
x <- c(0, 0)                               # 1.초기값 지정
mat[1, ] <- x                              # 행렬 1행에 생성한 초기값 대입 
 for (i in 2:n) {                          # i행은 2행부터 n행까지
u1 <- runif(1, -0.75, 0.75)                # 랜덤워크에서 에러값은 랜덤
u2 <- runif(1, -1, 1)                      # 랜덤워크에서 에러값은 랜덤
z <- c(u1, u2)                             # 하나의 에러벡터 z로 묶음
y <- x + z                                 # 마코프체인 지정 y' = x_j + z
utest <- runif(1)                          # 선별기준으로 삼을 하나의 난수 u ~ uniform(0,1)
                                         # 약분할거는 다 약분하고 코드작성한거임, 메트로폴리스 알고리즘 적용 
numer <- exp((-1/2)*t(y)%*%sigmaInv%*%y)   # 파이(y')
denom <- exp((-1/2)*t(x)%*%sigmaInv%*%x)   # 파이(x_j)
if (denom > 0) alpha <- min(numer/denom, 1)# 분모 파이(x_j)>0 이면 alpha값은 min[파이(y')/파이(x_j),1] 
else alpha <- 1                            # 분모 파이(x_j)<=0 이면 alpha값은 1
if (utest <= alpha) x <- y                 # u값이 alpha값보다 작거나 같으면 y'를 새로운 표본으로 채택한다
else x <- x                                # u값이 alpha값보다 크면 y'채택 안한다
mat[i,]<-x                                 # i번째 행 x 생성
}                                          # for반복문 닫음 
mat                                        # 표본들 들어 있는 행렬 출력
}

bvn<- mcmcbvn(6000,0.98)                   # 표본 6000개, 상관계수 0.98   
bvn<-bvn[2001:6000,]                       # 앞의 2000개 버리고, 뒤에 4000개만 선택
par(mfrow=c(3,2))
plot(bvn,type="l")                         # 1열과 2열의 상관관계를 보여주는 산점도, 점들을 선으로 연결
plot(bvn,col=1:4000)                       # 1열과 2열의 상관관계를 보여주는 산점도, 각 점들의 색을 다르게 함
plot(ts(bvn[,1]))                          # 1열을 time series plot으로 4000개가 순서대로 어떻게 생성되나 보여줌
plot(ts(bvn[,2]))                          # 2열을 time series plot으로 4000개가 순서대로 어떻게 생성되나 보여줌       



###재표본(resampling) 기법###

##부스트랩 방법##
# 크기가 n인 표본에서 복원추출로 m개의 부스트랩 표본들을 구함
# m개의 각각의 표본을 이용하여 m개의 추정치를 구함

 ## 변동계수 ##
# 평균의 크기에 대한 표준편차의 크기. 자료의 변동정도를 알아보는 척도
# = 표본표준편차/표본평균

 #단순히 변동계수 값 구하라고 하면 이렇게 하면 됨#

rats<-c(57,60,52,49,56,46,51,63,49,57,59,54,56,59,57,52,52,61,59,53,59,51,51,56,58,46,53)
cvrats<-sd(rats)/mean(rats)
cvrats

## 변동계수에 대한 표준편차 및 95% 신뢰구간 ##
# 크기가 각각 27인 1000개의 부스트랩 표본을 이용하여 비모수적으로 변동계수에 대한 표준편차와 신뢰구간 구함
# 완전한 값은 아니지만 추론이 가능한것
 #변동계수의 표준편차, 신뢰구간 구하라고 하면 이렇게 하면 됨#

#1. boostrap함수사용#
# boostrap(데이터, 부스트랩샘플갯수, 구할 추정량 함수)
 
install.packages("bootstrap")                               # bootstrap함수 사용하기 위해서 패키지 필요
library(bootstrap)                                          # bootstrap 패키지 불러옴

theta1 <- function(x){sd(x)/mean(x)}                        # theta1에 변동계수 함수 지정
results <- bootstrap(rats, 1000, theta1); results           # 1000개 부스트랩표본 각각의 변동계수 추정치 1000개 나옴
sdcvrats <- sd(results$thetastar); sdcvrats                 # 변동계수의 표준편차에 대한 부스트랩 추정치
lowlimit1 <- quantile(results$thetastar, 0.025)             # quantile함수 이용해서 95%신뢰구간의 하한값
lowlimit1
upperlimit1 <- quantile(results$thetastar, 0.975)           # quantile함수 이용해서 95%신뢰구간의 상한값
upperlimit1
c.i1<-c(lowlimit,upperlimit)                                # 변동계수의 confidence interval(신뢰구간)                            
c.i1

#2.bcanon함수 사용#
# bootstrap패키지에서 제공하는 함수 중 하나
# 부스트래핑을 새로 하게 돼서, 위에서 한 값과는 다르게 나온다
# confpotins에 신뢰도 8개로 나뉘어 뜸(간격 일정하지는 않음) -> 디폴트값은 순차적으로 8개
# 1,8 -> 95%     2,7 -> 90% ...
# bcanon(데이터, 부스트랩샘플갯수, 구할 추정량 함수)


bcanon(rats, 1000, theta1)
lowlimit2 <- bcanon(rats, 1000, theta1)$confpoints[1,]     # 1행이 95% 신뢰구간의 하한값
lowlimit2 
upperlimit2 <- bcanon(rats, 1000, theta1)$confpoints[8,]   # 8행이 95% 신뢰구간의 상한값
upperlimit2
c.i2 <- bcanon(rats, 1000, theta1, alpha=c(0.025,0.975))    # confidence interval을 bcanon함수에서 alpha값 지정해서 바로 만들 수 있음
c.i2$confpoints


##재크나이프 방법##
# 부스트랩 방법의 특수한 형태
# 주어진 표본에서 하나씩 제거함으로써 얻을 수 있는 모든 가능한 표본
# jackknife(데이터, 구할 추정량 함수)
 
rats<-c(57,60,52,49,56,46,51,63,49,57,59,54,56,59,57,52,52,61,59,53,59,51,51,56,58,46,53)
theta1 <- function(x){sd(x)/mean(x)}          # 변동계수함수를 theta1으로 지정
results.jack<- jackknife(rats, theta1)        # 재크나이프 방법을 이용해 만든 변동계수 추정치들 
results.jack                                  # jackknife함수 summary
sdcvrats.jack <- results.jack$jack.se         # 변동계수의 표준편차에 대한 재크나이프 추정치
sdcvrats.jack                                 # summary 중 jack.se가 표준편차임     
lowlimit3 <- quantile(results.jack$jack.values,0.025)   # 95% 신뢰구간의 하한값 
lowlimit3
upperlimit3 <- quantile(results.jack$jack.values,0.975) # 95% 신뢰구간의 상한값
upperlimit3
c.i3 <- c(lowlimit3,upperlimit3)              # 변동계수의 95% 신뢰구간
c.i3 

# bootstrap 패키지를 사용 안하는 경우
# sample( ,replace=F) 비복원추출
