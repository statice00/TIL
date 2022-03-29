getwd() #�۾� ���͸� Ȯ��#
setwd("C:/Users/123gu/Documents") #�۾����͸� ����#

help(mean)
?mean  #�Լ��� ���� ����#
help.search("histogram")
??histogram   #()���� �Լ��� ���õ� ��� ��Ű���� ����� ������#

c(1,1,2,3,5,8,13,21)
c(1*pi, 2*pi, 3*pi, 4*pi)
c("Everyone", "loves", "stats")
c(TRUE, TRUE, FALSE, TRUE)
#���ͻ���  ��ġ��, ������, ������#

1:5
seq(1,5,2)
rep(1,5)
#��������#


##��������##
#1 1~100������ ���� ������ 5�� ������ ���� ������ ����#
seq(1,100,5)

#2 1.���� ������ �ڷḦ �������� ��Ÿ����#
rev(seq(1,100,5))

#3 1,5,10,20�� 3�� �ݺ� ���� �ڷᰪ���� ���� ���� ����#
rep(c(1,5,10,20),3)



fib<-c(0,1,1,2,3,5,8,13,21,34);fib
fib[2]  #fib�� 2��° ���� ����#
fib[-1] #fib�� 1��° ���� ����#
fib[c(1,2,4,8)] #fib�� 1,2,3,8��° ���� ����#
fib[fib<10] #fib�� ���ҵ��� 10���� �������鸸 ����#

grp<-c("control", "treatment", "control", "treatment")
grp<-factor(grp) #������ �����Ϳ� factor()�Լ� ���#
grp   #������ ������ҵ��� �ݺ��Ǵ� ��� ������ ����ϴ°��� ���������� ȿ����#

trt<-c(1,1,1,1,2,2,2,2,3,3,3,3)
y<-c(20,20,18,25,16,18,17,19,30,34,29,27)
trt<-as.factor(trt)
nlevels(trt)  #���� ������ 3���̴�#
tapply(y, trt, mean) #���� ���� ������ ��հ�#

gl(3,7) #factor level ���� level 3��, ���� ���� 7��#


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
array(dat,c(3,5)) # array(data,dim) data�� ��������#

m[2,2] #2��2�� ����#
m[3,1] #3��1�� ����#
m[1,]  #1�� ����#
m[,3]  #3�� ����#


##����  0�� 1�� �̷���� ���� d=[0,1]���� 56���� sample�� ���������ϰ�#
#8x7��ķ� ǥ��##
d<-c(0,1)
matrix(sample(d,56,rep=T),8,7)
#sampe(data,�����Ұ���,�ݺ����)#


# ^ : n����  %/% : ��  %% : ������  %*% : ����� ��#
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
t(a) #��ġ���# 
det(a) #��Ľ�#
solve(a) #�����#
tr(a)


num<-c(1,2,3,4,5)
log<-c(TRUE, FALSE, TRUE, TRUE, FALSE)
char<-c("a","b","c","d","e")
df<-data.frame(num, log, char); df
#������������ ����#
str(df)

myframe<-data.frame(numbers=1:3, characters=c("a","b","c"), logicals=c(T,F,T))
myframe #������������ ����#

myframe$numbers  #numbers ������ ����#
with(myframe, numbers) #numbers ������ ����#
attach(myframe) #�������������� ���� ����#
numbers  #��������#
detach(myframe) #�������������� ����#
numbers  #�������� �ȵ�#

myframe<-transform(myframe, weight=c(80,75,68))
myframe
#������������ �ǿ����ʿ� �����߰�#

which(myframe$weight>70) #weight�� 70���� ū ����ġ ���#
subset(myframe, subset=(weight>70)) 
#�����������ӿ��� weight�� 70���� ū ��ĸ� ���#

#array > 3���� �̻��� ������ ���� �� �ִ� ����(����� ���������� Ȯ��)#
arr1<-array(1:10);arr1
arr2<-array(1:10, dim=c(2,5));arr2
arr3<-array(1:12, dim=c(2,2,3));arr3

arr1
dim(arr1)<-c(5,2) #array�� ���ο� ������ �ο�#
arr1

#����Ʈ�� ���� �ٸ� ������ Ÿ�� ��ä�� ���� ����#
obj<-list() #�� ����Ʈ ��ü ����#
obj[[1]]<-"user1" #ù��° ����Ʈ ��ü ����#
obj[[2]]<-20 #�ι�° ����Ʈ ��ü ����#
obj[[3]]<-F #������ ����Ʈ ��ü ����#
obj[[4]]<-c(70,80,90,100) #�׹�° ����Ʈ ��ü ����#
obj

list.user<-list("user1", 23, "M", c(80,85,90,95))
list.user
list.user2<-list(ID="user1", age=23, gender="M", grade=c(80,85,90,95))
# �̸������ؼ� �������� #


## �Լ� ����, �ݺ��� ##

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
#�Լ� �������� ����Ұ� �׳ɽᵵ �ǰ�, print(), return()#


#���ǹ�(if)#

## if(����){���� ���๮} else{���� ���๮}

gender<-"F"
age<-11
if(gender=="M"){
if(age>20){
print("���γ���")}
else{
print("�̼��Ⳳ��")}
}else{
if(age>20){
print("���ο���")}
else{
print("�̼��⿩��")}
}

score<-60
if(score>100){
print("���� �Է��� �߸��Ǿ����ϴ�.")
}else if(score>=95){
print("A+")
}else if(score>=90){
print("A")
}else if(score>=85){
print("B+")
}else if(score>=80){
print("B")
}else{
print("C �����Դϴ�.")
}


#�ݺ��� for��#
#� ó���� �ݺ��ؼ� �����ϰ� ���� �� ���� ���#
#�ݺ� Ƚ���� ������ ����Ʈ���� ����(c(1,2,3)�̳� 1:5��)�� �����Ѵ�.#

for(i in 1:9){
print(rep(3,i))
}

for(i in 9:1){
print(rep(3,i))
}


#������#
gugu<-matrix(0, nrow=9,, ncol=9)
for(x in 1:9){
for(y in 1:9){
gugu[x,y]<-x*y
}
}
print(gugu)

#������ ���տ��� ¦���� �հ� Ȧ���� �� ���ϱ�#
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
#¦������ ¦���鳢�� Ȧ������ Ȧ���鳢�� ���#




#NA�� �ƴϸ鼭 ¦���� ���� ���#
n<-c(1,NA,3,NA,5,6,NA,8,NA,10)
n3<-c()
for(x in n)
if(!is.na(x) & x%%2==0){
n3<-c(n3,x)
print(n3)
}else{
next
}

# break : �ݺ��� ����  next : ���� ���� ���� ���� �ݺ��� ���� #
#�������� �׿����� �ϱ� ���ؼ��� ������� �־����. �ű�ٰ� �׾ư��°�
 is.na(x) : x��na�� ����ֳ�?
 ! : ����ִ°� �ƴѰŸ� ���� �����Ŵϱ� �ݴ���ϴ°Ŵϱ� !
 x%%2==0 : x�� ¦���� �ǹ�
 na�� �ƴϸ鼭 ¦���� �Ŵ� n3���ٰ� �������� �׾ư��ڴ�#


#while�� � Ư�� ������ �����ϴ� �� ����� ��� ����(���Ǻ� �ݺ���)#
#if for while �� ��ǻ�� �˰������̴� ���� �򰥸����� �����ϱ� ó������ ��Ʈ�� ����
 ������� �غ��°� ��õ#

#���ǵμ������� �Ǻ���ġ���� ���������� 300���� ����������#
fibonacci<-0
last_fib<-1
while(last_fib<300){
fibonacci<-c(fibonacci,last_fib)
last_fib<-fibonacci[length(fibonacci)-1]+fibonacci[length(fibonacci)]
}
fibonacci


## 16p - 1~100������ 3�� ��� �߿��� ¦���� �� ���ϱ�
a<-1; sum<-0
while(a<=100){
if(a%%3==0 & a%%2==0){
sum <- sum + a
print(a)
}
a<-a+1
}
print(sum)



##����� �밢ȭ##
#���������� ���ٰ����θ� ���̴� �밢���
#1. C^(-1)AC = D
#   C -> �������ͷθ� �����Ǿ�����
#2. AX=����X
#   (A-����I)X=0
#   �츮�� X=0�� �ƴϾ���ϱ� ������ (A-����I)�� ������� �����ϸ� �ȵ�.   
#A=matrix(a:d,2,2)
#����I=cbind(c(����,0),c(0,����))
#
#|A-����I| = 0 
#
#+A�� �������, C����Ģ�۷����� Ȯ��
#A�� �������� �밢���ҷ� ���� D��� �밢����� ���� �� �ִ�

##��������� �밢ȭ##
#������� �� ���ϴ� ���#
A<-matrix(c(1,0,1,1),nrow=2)
A
egA <- eigen(A)
#eigen�Լ��� ��� ������ ������(����1,����2),�� �����ְ�, ����1������ ��������,
����2�� ���� �������͸� ������, �� ����� C#
egA
A.egvec <- egA$vectors
sA.egvec <- solve(A.egvec)

A<-matrix(c(1,0,1,1),2)
egA<-eigen(A)
egA
#Error in solve.default(A.egvec) : 
#  system is computationally singular: reciprocal condition number = 1.11022e-16
> ������� ���� �� ����, C^(-1)������ϹǷ� �밢ȭ �Ұ���#

#������� ���� �� �ִ� ���#
B<-matrix(c(2,1,2,3),nrow=2)
B
egB<-eigen(B)
egB
B.egvec<-egB$vectors
sB.egvec<-solve(B.egvec)
sB.egvec%*%B%*%B.egvec
D<-diag(egB$values)
#C^-1BC=D#
#e-16 : 10^16, �ſ��������̹Ƿ� 0���� ��ް���#


##��Ī����� �밢ȭ##

#C�� �������
#CC^T=I
#cc^-1=I
#��, C^-1 = C^T

#��������� �ǹ��ϴ� �� P

A<-matrix(c(2,-2,-2,5),nrow=2)
A
egA<-eigen(A)
egA
P<-egA$vectors
solve(P)%*%A%*%P
t(P)%*%A%*%P
D<-diag(egA$values)
#���ٵ��� 6��1�� ������ �밢����� ���׶� �Ȱ���#
D


##R-review �׷��Ƚ� �Լ�##

#������ �׷��Ƚ� �Լ�(plot), ������ �׷��� �Լ�(plot ���� ���ڳ� ��)#
#������ �׷��Ƚ� �Լ�#

##plot()##
par(mfrow=c(2,2)) #ȭ���� 2x5�� ����#
x<-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y<-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
plot(x,y,main="PLOT",sub="Test",xlab="x-label",ylab="y-label",type="l",lty=4)
#type = "p"�� "l"�� "b"������ "h"��������x�������#
#"l"������ �ߴٸ� ���� ���� ��������
#lty=1 �Ǽ� lty=2 ��ü� lty=3 ��Ʈ�� lty=4 ��Ʈ�ʹ�ü�#

##curve() �׷��� �ȿ� ��� �׸� �� ����ϴ� �Լ�##
x<-function(x)(x^2)
curve(x,add=T)
curve(x,xlim=c(-3,3),ylim=c(0,3))

#������ �׷��Ƚ� �Լ�#
par(mfrow=c(2,4)
plot(1:10)
abline(h=5) #y=5 ����#
rect(1,6,4,9) #(1,6),(4,9)�밢�����������ϴ� �簢��#
arrows(1,1,4,4) #(1,1) -> (4,4) ȭ��ǥ#
text(8,9,"ABCD")#Ư����ǥ�� �����Է�#
title("main","sub") #������, ������#
legend(8,3,lty=1.3,c("P","Q","R")) #���ʴٴ°�#

points(6,4)#�׷����� (6,4)��ǥ�� �� ����#
lines(c(2,1),c(8,2)) #(1,2)->(2,8) ��#


## 19p - points() �Լ�: �׷����� ���� �׸��� �Լ�
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

## 21p - lines() �Լ� : �׷����� ���� �׸��� �Լ�
plot(0:8, 0:8, type="n", ylim=c(0,6))
lines(c(2,6),c(1,1),lty=1)
lines(c(2,6),c(2,2),lty=2)
lines(c(2,6),c(3,3),lty="solid")
lines(c(2,6),c(4,4),lty="dashed")
lines(c(2,6),c(5,5),lty="dotted")

## 23p - text() �Լ� : �׷��� ���� ���ϴ� ��ġ�� ���� ǥ��
x<-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y<-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
plot(x,y,main="PLOT",xlab="x-label",ylab="y-label",type="p")
text(9,10, "Plotting", col="red")

## 24p - abline() �Լ� : �׷��� �ȿ� ������ �׸�
x<-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y<-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
plot(x,y,main="PLOT",xlab="x-label", ylab="y-label", type="p")
abline(h=6,v=9,lty=3)

## 25p - legend() �Լ� : �׷��� �ȿ� ���� �ڽ��� �׸�
x<-c(2,5,6,5,7,9,11,5,7,9,13,15,17)
y<-c(1,2,3,4,5,6,7,8,9,10,11,12,13)
plot(x,y,type="n")
legend("center",legend=c("x","y"), pch=c(1,2),title="center")
legend("bottom",legend=c("x","y"), pch=c(1,2),title="bottom")
legend("left",legend=c("x","y"), pch=c(1,2),title="left")
legend("right",legend=c("x","y"), pch=c(1,2),title="right")


###�׷����� ��ø###
plot(sin, -pi, pi, xlab="", ylab="", lty=2)
par(new=T)
plot(cos, -pi, pi, xlab="x", ylab="y")


#�׶�����Ʈ����#
a1=matrix(c(1,1,1),c(3,1))
a2=matrix(c(1,-2,1),c(3,1))
a3=matrix(c(1,2,3),c(3,1))
w1=a1;w1
k1=(t(a2)%*%w1)/(t(w1)%*%w1)
w2=a2-as.numeric(k1)*w1;w2
k1_2=(t(a3)%*%w1)/(t(w1)%*%w1)
k2=(t(a3)%*%w2)/(t(w2)%*%w2)
w3=a3-as.numeric(k1_2)*w1-as.numeric(k2)*w2;w3


#����Ʈ�� ����#
#��Ī����϶��� ���� ����#
#�ϳ��� ��Ī����� ���� ���� ����� ������ ����#

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
#������*��������*t(��������)?#


#Ư�̰�����#
#��κ��� ��Ī����� �ƴϱ⶧���� ��κ��ǰ�쿡
#����Ǵ� Ư�̰�����


A<-matrix(c(5,0,3,4,0,7,0,1,2,6,0,3),nrow=4);A
svdA<-svd(A);svdA
#d���� Ư�̰�#
svdA_values<-svdA$d;svdA_values
svdA_u<-svdA$u;svdA_u
#u�� 4��°�� ©��. 4x3#
svdA_v<-svdA$v;svdA_v
#v�� �� 3x3#
mat1<-svdA_values[1]*svdA_u[,1]%*%t(svdA_v[,1])
mat2<-svdA_values[2]*svdA_u[,2]%*%t(svdA_v[,2])
mat3<-svdA_values[3]*svdA_u[,3]%*%t(svdA_v[,3])
mat1;mat2;mat3
mat1+mat2+mat3

##svd�Լ��� �����ϰ� Ư�̰�����##
B<-matrix(c(5,0,3,4,1,0,7,0,0,8,1,6,10,0,5,7,1,5,9,1),nrow=5);B
BBt<-B%*%t(B);BBt
U<-eigen(BBt)$vectors;U
U<-U[,-5];U #B�� ��ũ�� 4�̱� ������ 5��° �������� �� ���� ?�ڵ尡�ȵ�?#
U.eigval<-eigen(BBt)$values;U.eigval

BtB<-t(B)%*%B
V<-eigen(BtB)$vectors
V
V.eigval<-eigen(BtB)$values
V.eigval
D<-diag(sqrt(V.eigval))#��ũ�� �������� ���������#
D

U%*%D%*%t(V)
# B54 = U54 D44 V44 #



#����ī���� �ùķ��̼�#

#���ϳ��� ���� 1. �����յ��� 2. �»��յ��� (c�� �����ֳ� �����ֳ� ���̹ۿ� ����)#

#1.�����յ���

c=1013904223
b=1664525
m=2^32
random.uni_lin = function(seed){
seed<-(b*seed+c)%%m
return(seed/m)
}
random.uni_lin(seed=7)


#2.�»��յ��� c�� �ȴ��ϴ¸�ŭ m�� b�� ���� �ִ��� �ٸ��� �������

random.number<-c()
random.seed=27218;m=30269;b=171
for (i in 1:50) {
random.seed<-(b*random.seed)%%m
random.number[i]<-random.seed/m
}
random.number


#�����̳� �»� �Ѵ� ����1���� ���������� �ڵ� ����(c�� ���� �ȵ���.)#


#���ϳ������� �Լ�

runif(10,0,1)
runif(10,0,1)

#�ʱ� seed���� (��������)

set.seed(1234)
runif(10)

runif(10)

set.seed(1234)
runif(10)


#�ٸ�Ȯ������ �ùķ��̼�

#�������̺���

set.seed(234)
guesses<-runif(20);guesses
correct.answers<-(guesses<0.2)
correct.answers
table(correct.answers)


#���׺���
#lower.tail=TRUE -> ����ؾߵ�
#X~B(10,0.6)

dbinom(4,10,0.6)#Ȯ���� P(X=4)
pbinom(4,10,0.6)#����Ȯ���� P(X<=4)
qbinom(0.5,10,0.6)#������ quantile
rbinom(100,10,0.6) #��������


#���Ƽۺ���
#P(X=x)= (lamda^x)exp^(-lamda)/x!
# lamda > ������ �����ð����ȿ� ��չ߻�����
#X~Poisson(6)

dpois(3,6) #lamda=6, P(X=3)
ppois(3,6) #P(X<=3)
qpois(0.45,6) #45th quantile
rpois(100,6) #�������� 


#PPT ���� Ǯ���
#1. X~Poisson(lamda=7), P(X=5)?
dpois(5,7)

#2. X~Binomial(30,0.8) 1th quantile, 3th quantile?, ������� ������?
q1<-qbinom(0.25,30,0.8) #q  1th 0.25
q3<-qbinom(0.75,30,0.8) #q  3th 0.75   
q3-q1  # ������� ����

#3. X~Binomial(n,0.4)������ ���� 500�� ����, ����Ƚ�� n= 5, 20, 50 ���� ������׷�
par(mfrow(1,3)) 
hist(rbinom(500,5,0.4)) ##500 ->�̴°���
hist(rbinom(500,20,0.4))
hist(rbinom(500,50,0.4))



#��������  �ѻ���� �Ͼ�� ��������� �Ͼ �������� ���ð�
# X~Exponential(lamda)
# f(t) = (lamda)exp(-lamda*t) 

#��������#
#T~EXP(l amda), P(T=t)= lamda*exp(-lamda*t)
#1/lamda = ��Ÿ �ε� �Ҽ� ���� (-> ���ð� 1/���� = ��Ÿ)
# �����ð� �� ���~�� -> ����, �׳� ��հ�-> ��Ÿ

##���� 5.10##
#������� 1�п� 3���� ó���ϴ� ���񽺸� �����ϰ� ����. ������ 1�й̸��� ���񽺸� ���� Ȯ����?
# 3=lamda(���Ƽ�) ---> 1/3=��Ÿ(����)
# �־������� �������� ��Ÿ���� Ȯ���� �ϰ�, �����̸� �׳� ������ �ǰ�, ��Ÿ�̸� �������ؼ� �־����.
# >�������� �Լ��ȿ� rate ���ϴ°�
# X~EXP(lamda=3)
#P(X<1) = 0.9502129  # 1����� 20�� �̸� �ɸ��ϱ� 1�й̸��� �� �����ִ� ��
pexp(1,rate=3)  # 1�д� 3�̴ϱ� lamda=3�� ����

##��������##
#���ٰ� �ƴ϶� ��Ÿ�� �־��� ��  ->�׳� ���~��
#1. �ϸ��� ȯ�� ��� 100������ ��� �ִٴ� �뺸. ����ҋ����� �ɸ��½ð� : X
# P(X=x) = 1/100exp(-x/100) , (x>0)
#          0, (�� �� ����)

#(1) ȯ�ڰ� 150�� �̳� ����� Ȯ��?
#P(X<150)
pexp(150, rate=0.01) #��Ÿ�� �־������� �������ؼ� rate�� ����

#(2) 200�� �̻� ������ Ȯ��?
#P(X>=200)
pexp(200, rate=0.01, lower.tail=F)


#����Ȯ������#
#�Ű������� �� �־��ֽð� (�Ű����� ���� ������ �޶����� ������~)

#����5.14
x<-rnorm(100000)
x<-x[(0<x)&(x<3)]
hist(x,prob=T)
par(mfrow=c(1,2))

##��������##
#1. ���51, ǥ������ 5.2 ����Ȯ�������� ���� �� �ִ� �� ����. n=10,100,1000
norm1<-rnorm(10,51,5.2)
mean(norm1);sd(norm1)
norm2<-rnorm(100,51,5.2)
mean(norm2);sd(norm2)
norm3<-rnorm(1000,51,5.2)
mean(norm3);sd(norm3)

#2. �������� 1�� ī������ Ȯ�������� ������ Ȯ�������� ǥ������Ȯ�������� ������ ������ Ȯ��������
#�����ϴٴ� ����� �̿��Ͽ� 10000�� ���� �����ϰ� X^2(1)�� ������ ���� 10000�� ���� �̾Ƽ� ��

par(mfrow=c(1,2))
x.norm<-rnorm(10000)
y<-x.norm^2
mean(y);var(y)
hist(y)

x.chi<-rchisq(10000,1)
mean(x.chi);var(x.chi)
hist(x.chi)


###����ȯ��###
#���� �ܼ�ȭ�� ���� 
#�յ�, ���������� �ϱ� ����, ���Ժ��������ֵ��� �����
#��������ִ°��� ������ ����
#�յ������ cdf ������ ���� > ��� ������ �����ص� ������ ����
#���������� cdf � > ���ݴٸ�
#F_X(x)=U
#F^(-1)(U) = x , ���Լ��� ã�� ������ ��������
#���Լ� = 1/lamda*log(1-lamda) #1-lamda�׳� lamda��� �ᵵ��(������ 0~1���̾)



f1<-function(x){
    return(1/sqrt(2*pi)*exp(-x^2/2))
}
print(integrate(f1, -Inf, Inf))


##Q1##
#����ȯ���� �̿��Ͽ� �������� ���� 200�� ����
# X�� cdf - 1-exp(-lamda*x) , (x>0)
# ���Լ�(U) = -1/lamda*log(1-u) �� ��쿡.
#X~EXP(lamda=3)

ran_exp<-function(n, lamda){
u<-runif(n)
x<-(-1/lamda)*log(1-u)
x
}

X<-ran_exp(200, 3)
mean(X);var(X)

hist(X)


#�������̺��������� ����ȯ��


##�Ⱒǥ����##
#���������ϱ⽬������� ���������� 2���� Ȯ���е��Լ� �˰��ִ»�����.
#���ٴ°��� �����Լ��� ���Լ� ���ϱ� ����ֵ� G^(-1)(U)
#Ȯ���е��Լ��� �̹� �˰� �ִµ�, �� Ȯ���е��Լ��� ������ ������ �����ϰ�������.
#���Լ��� �� �𸣴� ����� �����༮�� �˰��ʹ�


#���� 5.20
# �ﰢ�е��Լ��κ��� �ǻ糭�� ������ ����
# f(x) = 1 - |1-x|,  (0<=x<2)
# c*g(x)�� �ﰢ�е��Լ� ���� �簢�����
# c*g(x)�� �׳� �յ������ ���� ��, = 1
# U2<= h(x) = f(x)/c*g(x) = f(x)/1

U1<-runif(100000,0,2)
U2<-runif(100000)
X<-U1[U2<(1-abs(1-U1))]
X


#���� 5.21
#c����ȭ��� (f(x)�� ���������� 1�� ������ִ� ���)
#c���� ���߿��� ����x
#0.5e(-x^1.5)   <= e(-x)   �������� ������ �����Ѵ�.
# k=0.5/c   k*f(x) �� ���� �Ⱒǥ���� ���
# k*f(x) = 0.5e(-x^1.5)�� ���� ����

kf<-function(x){0.5*exp(-(x^1.5))}
X<-rexp(100000,rate=1)
U2<-runif(100000)
X<-X[U2<kf(X)/dexp(X,rate=1)]

hist(X, prob=T, breaks="Scott")
par(new=T)
hist(dexp(X,rate=1),prob=T)



###����ī���� ����###

##���߹�##

N<-10000                   # 0<y<1, 0<x<2 ���� �簢���� 10000�� �� �Ѹ��ڴ�
i.y<-c()                   # ������ �����ϴ� y������ �����ϱ� ���� ����� ����
f<-function(x){1/(1+x^2)}  # ���а��� ���ϰ��� �ϴ� �Լ� �Է�
x<-runif(N,0,2)            # x�� ���б��� 0~2 ���� uniform���� N�� ���� 
y<-runif(N,0,1)            # y�� ���б��� 0~1 ���� uniform���� N�� ����

for(i in 1:N){  
i.y[i]<-as.numeric(y[i]<=f(x[i]))   # �����Լ� ���, i��° y���� i��° f(x)������ ������ 1, �ƴϸ� 0
}
theta.hat<-2*sum(i.y)/N   # ���������� : (y�����б������� * x�����б�������) * (0+1+1+...+0)/10000
                          # �簢���� ���� * 10000�� �� 1�� ����


##ǥ����չ� - 2����##
# f(u)�� ���(����) * x�� ���б���(�غ�) (=�簢�� ���̶� �����ϸ� ����)

a=0; b=3                  # x�� ���б��� ���� a~b
u<-runif(10000,a,b)       # x�� ���б������� uniform���� 10000�� ����
theta_hat=mean(exp(-u^2/2)/sqrt(2*pi))*(b-a)
theta_hat                 # ���������� : f(u)�� ��� * x�� ���б���
                 

##ǥ����չ� - 3����(��������)##
# f(u,v) (= z)���� ��� * xy��� �簢�� ����

u<-runif(10000,0,1)       # x�� ���б��� 0~1���� uniform���� 10000�� ����
v<-runif(10000,0,1)       # y�� ���б��� 0~1���� uniform���� 10000�� ����
i_hat<-mean(exp(-(v+u)^2)*((u+v)^2))*1 
i_hat                 # ���������� : (f(u,v)�� ���) * (xy��� �簢�� ����)


##��ǥ�����##
# ǥ����չ����� Ȯ���е��Լ� = 1/(b-a) (�յ����)�� �Ϲ�ȭ # 
# �л��� ���ҽ�Ű�� ���� �������Լ��� ���밪 �Լ��� ���°� ����� Ȯ���е��Լ��� ��� #
# Y=�������Լ�/Ȯ���е��Լ�, Y�� ����������I�� ���������� #

# 5���� Ȯ���е��Լ�(�߿��Լ�or���Լ�)�����ؼ� var(Y)/m �� ������ ���� #
# Y�� �л��� �۾ƾ� �� #

m<-10000               # �������� ���� ����              
theta.hat<-c()         # ���������� 5�� ���� �� ���� ����
se<-c()                # ǥ������ 5�� ���� �� ���� ����
g<-function(x){exp(-x)/(1+x^2)*(x>0)*(x<1)} # ���������� ���� �������Լ� ���� 

x<-runif(m)            # ù��° ���Լ� f0 = 1 �� ���, x�������� uniform ��������
fg<-g(x)/1             # fg = ���������� Y �� , ���������� x�� f(x)�� ����
theta.hat[1]<-mean(fg) # 1��° ���������� = ����������Y�� ���
se[1]<-sd(fg)          # 1��° ǥ������

x<-rexp(m,1)           # �ι�° ���Լ� f1 = exp(-x) �� ���, ������ exponential, lamda=1
fg<-g(x)/exp(-x)       # fg = ���������� Y �� = g/f , ���������� x�� f(x)�� ����
theta.hat[2]<-mean(fg) # 2��° ���������� = ����������Y�� ���
se[2]<-sd(fg)          # 2��° ǥ������

x<-rcauchy(m)          # ����° ���Լ� f2 = ((1+x^2)^(-1))/pi = �ڽú��� Ȯ���Լ� 
i<-c(which(x>1),which(x<0))  # ���� x�� �� (x<0), (x>1)�� ������ i�� ���� 
x[i]<-2 #to catch overflow errors in g(x) # i��° x�� 2�� ��ȯ
fg<- g(x)/dcauchy(x)         # ���������� Y�� = g/(�ڽú��� Ȯ���е��Լ�),���������� x�� f(x)�� ����
theta.hat[3]<-mean(fg)       # 3��° ���������� = ����������Y�� ���
se[3]<-sd(fg)                # 3��° ǥ������


#�˷����� ���� �Լ��� ����ȯ���� ���ؼ� ���������ؾ� �Ѵ�#
u<-runif(m)                  # �׹�° ���Լ� f3 = exp(-x)/(1-exp(-1)), u~uniform(0,1)����
x<- -log(u*(1-exp(-1)))    # f3�� ���Լ��� ������ ���� ���� u�� �����ϸ� x�� ����
fg<-g(x)/(exp(-x)/(1-exp(-1))) # ���������� Y�� = g/f, f3�Լ��� ������ ���� x�� �����ϸ� y�� ����
theta.hat[4]<-mean(fg)         # 4��° ���������� = ����������Y�� ���
se[4]<-sd(fg)                  # 4��° ǥ������
   # x�������� ��������, x�� ���� �Ŀ��� y�� u�� �����ϸ� ���ο� x�� ����, �����Լ��Ŀ� ���ο� x�� ����  

u<-runif(m)                  # �ټ���° ���Լ� f4 = (4(1+x^2)^(-1))/pi , u~uniform(0,1)����
x<-tan(pi*u/4)               # f4�� ���Լ��� ������ ���� ���� u�� �����ϸ� x�� ����  
fg<-g(x)/(4/((1+x^2)*pi))    # ���������� Y��, f4�Լ��� ������ ���� x�� �����ϸ� y�� ����
theta.hat[5]<-mean(fg)       # 5��° ���������� = ����������Y�� ���
se[5]<-sd(fg)                # 5���� ǥ������

rbind(theta.hat,se)          # ������������ ���� ���̰� �����Ƿ�, ǥ�������� ���� ���� 4��° f3�� �����ϴ�

#���Լ� f4�� x�� ���� ������ ��Ÿ�� ��, ���� tan�Ƚᵵ ���� �Ȱ��� ����#
u<-runif(m)
x<-sqrt(((pi*u)/4)^(-1)-1)
fg<- g(x)/(4(1+x^2)^(-1))/pi
thetaa<-mean(fg);thetaa
ses<-sd(fg);ses




###��ġ�� ����ȭ###

##Ȳ�ݺ��� Ž����##

##��������1##

par(mfrow=c(2,2))

#(a)#

f<-function(x){
abs(x-3.5)+abs(x-2)+abs(x-1)} #�ּҰ��� ���ϰ� ���� �Լ� �Է�

golden<-function(f,a,b,tol=10^-7){
ratio=2/(sqrt(5)+1)    # 1/Ȳ�ݺ���=0.618
x1<-b-(b-a)*ratio      # ���ο���� ã�� ���� x1,x2�� ����  
x2<-a+(b-a)*ratio
f1<-f(x1)              # ���ο���� �����ϱ� ���� f1,f2�� ����  
f2<-f(x2)
 while(abs(a-b)>tol){  # �̸����س��� �Ѱ�ġ���� �۾��� ������ �ݺ�
  if(f2>f1){           # f(x2)���� f(x1)������ ū ���
b<-x2                  # ���ο�� [a,x2], �� ���� ���� �������� �ٽ� ���ο���� ���ϸ�
x2<-x1                 # ���ο� x2�� ���� ������ x1�� ����,
f2<-f1                 # ���ο� f(x2)�� ���� ������f(x1)���� ����. 
x1<-b-(b-a)*ratio      # ���ο� x1���� ���� �������� ���Ŀ� ����  
f1<-f(x1)}             # ���ο� f(x1)�� ���� ���� x1���� f(x)�� ����.
 else{                 # f(x1)���� f(x2)������ ū ���
a<-x1                  # ���ο� ������ [x1,b], �� ���� ���� �������� �ٽ� ���ο���� ���ϸ�
x1<-x2                 # ���ο� x1�� ���� ������ x2�� ����,
f1<-f2                 # ���ο� f(x1)�� ���� ������ f(x2)���� ����. 
x2<-a+(b-a)*ratio      # ���ο� x2���� ���� �������� ���Ŀ� ����
f2<-f(x2)}             # ���ο� f(x2)���� ���� ���� x1���� f(x)�� ����.
}
return((a+b)/2)        # ���� �߾Ӱ� ��� -> ������
}

curve(f,xlim=c(-5,5),ylim=c(-10,10),lwd=2)  # �ʱⱸ�� �����ϱ� ���� ���� �׷����� ���� �Ǵ�
golden(f,0,5)          # �Լ� f�� �ּҰ��� �����ϴ� ������ 
f(golden(f,0,5))       # �Լ� f�� �ּҰ�

curve(f,xlim=c(0,5),ylim=c(0,10),lwd=2)
lines(c(golden(f,0,5),golden(f,0,5)),c(-1,f(golden(f,0,5))),lty=2)
points(golden(f,0,5),f(golden(f,0,5)),pch=1,cex=2)
text(golden(f,0,5),f(golden(f,0,5))+0.7,label="�ּڰ�",col="red")


#(b)#

f<-function(x){
abs(x-3.2)+abs(x-3.5)+abs(x-2.8)+abs(x-1)}

golden<-function(f,a,b,tol=10^-7){
ratio=2/(sqrt(5)+1)    # 1/Ȳ�ݺ���=0.618
x1<-b-(b-a)*ratio      # ���ο���� ã�� ���� x1,x2�� ����  
x2<-a+(b-a)*ratio
f1<-f(x1)              # ���ο���� �����ϱ� ���� f1,f2�� ����  
f2<-f(x2)
 while(abs(a-b)>tol){  # �̸����س��� �Ѱ�ġ���� �۾��� ������ �ݺ�
  if(f2>f1){           # f(x2)���� f(x1)������ ū ���
b<-x2                  # ���ο�� [a,x2], �� ���� ���� �������� �ٽ� ���ο���� ���ϸ�
x2<-x1                 # ���ο� x2�� ���� ������ x1�� ����,
f2<-f1                 # ���ο� f(x2)�� ���� ������f(x1)���� ����. 
x1<-b-(b-a)*ratio      # ���ο� x1���� ���� �������� ���Ŀ� ����  
f1<-f(x1)}             # ���ο� f(x1)�� ���� ���� x1���� f(x)�� ����.
 else{                 # f(x1)���� f(x2)������ ū ���
a<-x1                  # ���ο� ������ [x1,b], �� ���� ���� �������� �ٽ� ���ο���� ���ϸ�
x1<-x2                 # ���ο� x1�� ���� ������ x2�� ����,
f1<-f2                 # ���ο� f(x1)�� ���� ������ f(x2)���� ����. 
x2<-a+(b-a)*ratio      # ���ο� x2���� ���� �������� ���Ŀ� ����
f2<-f(x2)}             # ���ο� f(x2)���� ���� ���� x1���� f(x)�� ����.
}
return((a+b)/2)        # ���� �߾Ӱ� ��� -> ������
}

curve(f,xlim=c(-5,5),ylim=c(-10,10),lwd=2) # �ʱⱸ�� �����ϱ� ���� ���� �׷����� ���� �Ǵ�
golden(f,0,5)          # �Լ� f�� �ּҰ��� �����ϴ� ������ 
f(golden(f,0,5))       # �Լ� f�� �ּҰ�
f(golden(f,0,seq(2.8,3.2,0.1))) # ����[2.8,3.2]���� f�� �ּҰ� 2.9��. ��, �ּҰ��� 1���̻�.

curve(f,xlim=c(0,5),ylim=c(0,10),lwd=2)
lines(c(golden(f,0,5),golden(f,0,5)),c(-1,f(golden(f,0,5))),lty=2)
lines(c(golden(f,0,2.8),golden(f,0,2.8)),c(-1,f(golden(f,0,5))),lty=2)
lines(c(golden(f,0,2.8),golden(f,0,5)),c(f(golden(f,0,5)),f(golden(f,0,5))),lwd=3,lty=1,col="red")
text(golden(f,0,5)-0.2,f(golden(f,0,5))+0.5,label="�ּڰ�",col="red")
#�׷������� ���������� ĥ���� f���� ��� �ּڰ��̴�.





##��ư-������##

##��������2##

#2���̻��� �̺��� �ϱ� ���� �̺��Լ� ����
DD<-function(expr, name, order=1){
    if(order < 1) stop("'order' must be more than 1")
    if(order ==1) D(expr, name)
    else DD(D(expr, name), name, order-1)
}

#(a)#
f<-expression(sin(x/2)*cos(x/4))
f<-expression(sin(x/2)*cos(x/4))   # 2���̺б��� ���ϱ� ���� f�� expression���� ���� ����
f1prime_e<-DD(f,"x",1);f1prime_e   # f�� 1���̺� 
f2prime_e<-DD(f,"x",2);f2prime_e   # f�� 2���̺�
 f<-function(x){sin(x/2)*cos(x/4)} # ������ ���� ���� �Լ��� �ƴϹǷ�, �Լ��� �ٽ� ����  
 f1prime<-function(x){cos(x/2) * (1/2) * cos(x/4) - sin(x/2) * (sin(x/4) * (1/4))}
 f2prime<-function(x){-(cos(x/2) * (1/2) * (sin(x/4) * (1/4)) + sin(x/2) * (1/2) * 
    (1/2) * cos(x/4) + (cos(x/2) * (1/2) * (sin(x/4) * (1/4)) + 
    sin(x/2) * (cos(x/4) * (1/4) * (1/4))))}

curve(f,xlim=c(-50,50))   # f�� �׷����� ���� �ʱⰪ �Ǵ�
x0=22                     #�ʱⰪ x0����
x<-c(x0,rep(NA,10))       #���α��� x[i+1]�� �����ϱ� ���� x0�� ������ ���� ����
fval<-rep(NA,11)          #���α��� x[i+1]�� f�� ������ ���� �����ϱ� ���� ���� ����
f1primeval<-rep(NA,11)    #���α��� x[i+1]�� f1prime�� ������ ���� �����ϱ� ���� ���� ���� 
f2primeval<-rep(NA,11)    #���α��� x[i+1]�� f2prime�� ������ ���� �����ϱ� ���� ���� ����

for(i in 1:10){              #10���� �ݺ��ϰڴ�.
fval[i]<-f(x[i])             #i��° fval�� f(x[i])�� ����
f1primeval[i]<-f1prime(x[i]) #i��° f1primeval�� f1prime(x[i])�� ����
f2primeval[i]<-f2prime(x[i]) #i��° f2primeval�� f2prime(x[i])�� ����
x[i+1]<-x[i]-f1primeval[i]/f2primeval[i]  #���α��� x[i+1]�� ����
}

data.frame(x,fval,f1primeval,f2primeval)  #data.frame���� f1primeval�� 0�� x�� ã��
f(-10.10445);f(-2.461919);f(15.02829);f(22.67082)  # x=0 ��ó�� �ִ� 4���� �ּҰ��� ��

# f1prime(x) = 0�� �Ǵ� ���� �� 25.1327�� �ֱ⸦ �ΰ�
# �� 7.64�� �������� 2���� �߻��Ѵ�.

#(b)#

f<-expression(exp(2*x)-x-6)      # 2���̺б��� ���ϱ� ���� f�� expression���� ���� ����
f1prime_e<-DD(f,"x",1);f1prime_e   # f�� 1���̺� 
f2prime_e<-DD(f,"x",2);f2prime_e   # f�� 2���̺�
 f<-function(x){exp(2*x)-x-6} # ������ ���� ���� �Լ��� �ƴϹǷ�, �Լ��� �ٽ� ����  
 f1prime<-function(x){exp(2 * x) * 2 - 1}
 f2prime<-function(x){exp(2 * x) * 2 * 2}

curve(f,xlim=c(-5,4),ylim=c(-20,100))   #f�� �׷����� ���� �ʱⰪ �Ǵ�
x0=0                      #�ʱⰪ x0����
x<-c(x0,rep(NA,10))       #���α��� x[i+1]�� �����ϱ� ���� x0�� ������ ���� ����
fval<-rep(NA,11)          #���α��� x[i+1]�� f�� ������ ���� �����ϱ� ���� ���� ����
f1primeval<-rep(NA,11)    #���α��� x[i+1]�� f1prime�� ������ ���� �����ϱ� ���� ���� ���� 
f2primeval<-rep(NA,11)    #���α��� x[i+1]�� f2prime�� ������ ���� �����ϱ� ���� ���� ����

for(i in 1:10){              #10���� �ݺ��ϰڴ�.
fval[i]<-f(x[i])             #i��° fval�� f(x[i])�� ����
f1primeval[i]<-f1prime(x[i]) #i��° f1primeval�� f1prime(x[i])�� ����
f2primeval[i]<-f2prime(x[i]) #i��° f2primeval�� f2prime(x[i])�� ����
x[i+1]<-x[i]-f1primeval[i]/f2primeval[i]  #���α��� x[i+1]�� ����
}

data.frame(x,fval,f1primeval,f2primeval)  #data.frame���� f1primeval�� 0�� x�� ã��
f(-0.3465736)                             #x=-0.3465736���� f�� �ּ�.

lines(c(-0.3465736,-0.3465736),c(-25,f(-0.3465736)),lty=2)
points(-0.3465736,f(-0.3465736),pch=1,cex=2)
text(-0.3465736,f(-0.3465736)+7,label="�ּڰ�",col="red")



### ������ ü�� ����ī���� MCMC ###
# �־��� �ٺ��� Ȯ�������� �����Ͽ�, �̸� ������ i.i.d������ ���� �� ���� ��� ���
# i.i.d���� ��� ������ ü�� ���� �����Ͽ� ���
# ������ ü�� ������ ��Ȯ�ϰ� �־��� Ȯ�������� �������� ������, ��� �����ϸ�
# ������ �ð��� ���� �Ŀ� ������� �������� ���ϴ� ������ ����
# 1.������ �ٺ��� ���� or �쵵�Լ��� ���� ���������� �������, �����ظ� ���ϴ� ������ ���
# 2.�������� ��������� ���ĺ����� ������ ����� �߷й����� ��� 
# 1.�Ϲ����� ����ī����, 2.MCMC(2.1�齺ǥ����, 2.2�Ϲ�����MCMC)



##�̺������Ժ��� �е��Լ� �׸���##
install.packages("mvtnorm"); install.packages("akima")
library(mvtnorm); library(akima)

plot.bivnormal <- function(mu=rep(0,2), stddev=c(1,1),r=0.8){
ngen<-500                 # �������� ���� ����
sigma<-diag(stddev)       # x,y�� �л��� �밢���� �ϴ� ���л� ���(��Ī���)����
sigma[1,2]<-sigma[2,1]<-r # ������ ���� ����� �밢�� �ƴ� ��Į��� ������
xy<-rmvnorm(ngen, mean = mu, sigma) # multivariate normal dist���� ��������
i<-interp(xy[, 1], xy[, 2], dmvnorm(xy, mean = mu, sigma)) # interp�Լ��� ������ ������ ���� (x,y)�� �����ϴ� z(Ȯ���е��Լ�)���� 
persp(i, theta=0, phi=50, ticktype="detailed",col="skyblue", shade=0.5)} # ������ ������ �е��Լ� �׷���

par(mfrow=c(1.3))
plot.bivnormal(mu=rep(0,2), stddev = c(1,1), r=0)
plot.bivnormal() #����Ʈ��
plot.bivnormal(mu=c(0,2),stddev=c(1,2),r=0.5)


# 3���� �Լ� �׸��� # 
z.hat<-function(x,y){
exp(-(x+y)^2)*((x+y)^2)}
x<-seq(0,1,length=20)
y<-seq(0,1,length=20)
z<-outer(x,y,z.hat)

par(mfrow=c(1,1))
persp(x,y,z,theta=30,phi=-10,col="skyblue",shade=0.5,ticktype="detailed")
    #theta�� z���� �������� xy��� �ð����(+), phi�� �÷��ٺ��ų� ������ ���°�
    #col ""��������, shade=���� ���ϳֱ�,ticktype="detailed" �࿡ ���� �ִ°�



##1.�Ϲ����� ����Į�� ǥ���� ��� ���##
#x�� ������ �־��� �ְ�, y�� ���Ǻ� ����#
#�̺������Ժ����κ����� ��������#

rbvn<-function(n,rho){            # function(������������, ������)
x<-rnorm(n,0,1)                   # x ���� ����, ������(���=0,�л�=1)  
y<-rnorm(n, rho*x, sqrt(1-rho^2)) # y�� ������ ������ x���� ���ӵż� ����,(���=rho*x,�л�=sqrt(1-rho^2))
cbind(x,y)}                       # �̺��� ���� ���� cbind

rbvn(n=1000,rho=0.98)             # �������� 1000��, ������ = 0.98

bvn<-rbvn(1000,0.98)              # ������ (x,y)�� bvn�� ����     

cor(bvn[,1],bvn[,2])              # x�� y�� ���� ������ ������ ����
cor(bvn[999,],bvn[1000,])         # ���߿� ������ ǥ���ϼ��� ǥ������ ������� ������ �������� ���

par(mfrow=c(3,2))            
plot(bvn, col=1:1000)             # (x,y)�� �������� 1�� ������� ����� ���� �׷����� ���´�        
plot(bvn, type=��l��)               # ���� �Ȱ��� �����׷���, ���� ����
plot(ts(bvn[,1]))                 # x���� transpose�ؼ� 1000���� ������ ���� ����
plot(ts(bvn[,2]))                 # y���� transpose�ؼ� 1000���� ������ ���� ����
hist(bvn[,1],20)                  # x������ �󵵼�
hist(bvn[,2],20)                  # y������ �󵵼�





##2. MCMC##
##2.1 �齺ǥ����##
#������ ���Ǻκ����� �� �˷��� �־����#
#x,y �Ѵ� ���Ǻ� ����#
#�ٺ����������� ǥ������
#�������� �ʹݿ��� x,y���� ���� ������� ����,  #
#��Ʈ���������콺�ý����� alpha�� �׻� 1�̾ ���ο� ������ ������ ä���ϴ� ����

gibbs<-function(n,rho){
mat<-matrix(ncol=2,nrow=n)          # (n x 2) �� ��� ����
x<-0                                # x�ʱⰪ ����
y<-0                                # y�ʱⰪ ����
mat[1,]<-c(x,y)                     # 1���� (x,y) �ʱⰪ (0,0)
for(i in 2:n){                      # i���� 2����� n�����
x<-rnorm(1,rho*y,sqrt(1 - rho^2))   # x�� y�� ���� ���Ǻκ��� (���=rho*y,�л�=sqrt(1-rho^2))
y<-rnorm(1,rho*x,sqrt(1 - rho^2))   # y�� x�� ���� ���Ǻκ��� (���=rho*x,�л�=sqrt(1-rho^2))

mat[i,]<-c(x,y)                     # i�࿡ ������ (x,y) ����
}
mat                                 # ������� ��� ���
}

bvn<-gibbs(1000,0.98)                    # ǥ�� 1000�� ����, ������ 0.98
par(mfrow=c(3,2))                    
plot(bvn,col=1:1000); plot(bvn,type="l") # (x,y)�� plot, �������� 1�� ������� ����� �����׷���
plot(ts(bvn[,1])); plot(ts(bvn[,2]))     # x���� time series plot���� 1000���� ��� �������� ����;y�� ����
hist(bvn[,1],20); hist(bvn[,2],20)       # x���� �󵵼�; y���� �󵵼�

bvn<-gibbs(1010000,0.98)                 # ǥ�� 1010000�� ����, ������ 0.98
bvn<-bvn[1000001:1010000,]               # �ʱ� ǥ�� ������, 1000001~1010000��° ������ ����
par(mfrow=c(3,2))
plot(bvn,type="l")
plot(bvn,col=1:10000)
plot(ts(bvn[,1])); plot(ts(bvn[,2]))
hist(bvn[,1],20); hist(bvn[,2],20)





##2.2 �Ϲ����� MCMC##
# �Ϲ����� ����ī���γ� �齺ǥ������ ���Ǻκ����� ������, �����δ� ���°�찡 ���Ƽ� �Ϲ����� ��츦 ����.
# i.i.d ǥ�������� �Ұ����� �ٺ����������� ������ü���� �̿��� ǥ���� �����ϴ� �Ϲ����� ���
# MCMC�� �־��� ������ �����ϰ� ������� ������ü���� �̿��Ͽ� �� �ð����� ������ ���� �� 
# ���� �齺 ǥ���������� ���� �ʱ� ǥ���� ������ ���Ŀ� ����� ǥ���� ����Ͽ� ���� ���� �ʿ��� ����� �߷е鿡 ����ϴ� ���.
# �־��� ������ ������ ������ü���� ����� ����� ���� ������ ����. 
# ���� �齺 ǥ������ ������� ������ü���� �� ������ ���� ���Ǻ�(��� �ٸ��������� �־� ���� ����) ������ Ư���� ����̴�.



# ������ü�� : ��������(t+1)�� ���°� �ٷ� �� ����(t)���� �����ϴ� ���� #

## 1�� �ڱ��� ������ü�� ##
# �Ϻ���, �������� ���Ժ������� ����
# beta�� ���밪�� 1���� �۾ƾ� �����ؼ� ü���� ��� �����ϴ�.
# X_t = beta(��Ÿ��) * X_t-1(�� ����) + e_t(������ ����)

#�߻��ϴ°��#
mu0=5               # �ʱⰪ ����
beta=1.0025         # ��Ÿ�� ����
chain <- c()        # ����� ����
chain[1] <- mu0     # ù��° ��Į��� �ʱⰪ
for (i in 1:1000){  # 1000�� �ݺ�, i+1��° ��Į��� beta�� * i��°chain�� + ������(1������ N(0,(0.5)^2)
chain[i+1] <- beta * chain[i] + rnorm(1, sd=0.5)
}
plot(ts(chain))     # chain���͸� time series plot���� ǥ�� 1000�� �������� ����, �߻���

#�����ϴ°��#
mu0=5               # �ʱⰪ ����
beta=0.7            # ��Ÿ�� ����
chain <- c()        # ����� chain���� ����, 
chain[1] <- mu0     # ù��° ��Į��� �ʱⰪ  
for (i in 1:1000){  # 1000�� �ݺ� i+1��° ��Į��� beta�� * i��°chain�� + ������(1������ N(0,(0.5)^2)
chain[i+1] <- beta * chain[i] + rnorm(1, sd=0.5)
}
plot(ts(chain))     # chain���͸� time series plot���� ǥ�� 1000�� �������� ����, ������





## ��Ʈ�������� �콺�ý� ##
# �Ϻ����� �ƴ� �ٺ��� Ȯ�������� ���� ������ ���� ��. <�ٺ��� ������ü��>

# <<�־��� �ٺ��������� ������ü���� ������ �ϴ� ������ü���� �����, ǥ���� �����ϴ� ���>>
# ����(x) : ������ ������ ���ϳ� ������ ������� ���� ������ ��ưų� �Ұ����� <�ٺ��� ����>
# q(y|x) : ü���� �����ϵ��� ����� ����(ǥ�������Լ�), ,<����ϴ� ������ü��>(����x�� ������ ���� y�� ����)
#          ����((x) �������� �л��� ũ�ų�     
# 1. x�ʱⰪ �����ϰ�, 
# 2. (j=1~N��ŭ �ݺ�) ���õ� ������ ü��(q(y|x))�� x(j) �����Ͽ� y'����, �������� u~uniform(0.1)����
#                   ä��Ȯ�� alpha = (����(y')/����(x_j))/(q(y'|x_j)/q(x_j|y')
#                   /*ǥ�������Լ� q�� ��Ī�̸�, q(y'|x_j) = q(x_j|y') �̹Ƿ�, (q(y'|x_j)/q(x_j|y') = 1 */
#                   ��, alpha = ����(y')/����(x_j) --> ��Ʈ�������� �˰�����                                    
#                         ����(x_j)>0 �̸�, alpha = min(����(y')/����(_j),1) /*u�� 0~1�̹Ƿ�, alpha�� 0~1 ������ �ϰ� �þ min ���*/
#                         ����(x_j)<0 �̸�, alpha = 1 
#                             �������� u <= alpha �̸�, ���ο� x�� ����� y�� ä��
#                             �������� u > alpha �̸�, ���ο� x�� ���� x (����� y �Ⱒ)
# 3. �պκ��� ������, �޺κи��� x�� ���. (������ �ð����� ������ ���ϴ� �ٺ��� ������ ������.) 
  
# ����ȭ�� ��� ������� ������� ������ ü��(1. ������ũ ü��, 2. �ڱ���ü�� ...)
# �Ⱒǥ�������� f(x)/c*g(x) �� ������ �����
# uniform(0,1)�� ���� u�� ä��Ȯ�� alpha���� ������ ä��, ũ�� �Ⱒ
# alpha ���� q(ǥ�������Լ�)�� ��Ī�� ��� ��еǾ, ����(y')/����(x_j)�� ����. -> ��Ʈ�������� �˰�����



#�̺������Ժ���((���(0,0), �л�(1,1), ������r)���� ���������� �ϰ� ������, ����ϴ� ������ü���� "������ũ"#
#�� ���, ����(x) = (det(2*pi*sigma)^-0.5)*exp((-1/2)*t(x-m)%*%solve(sigma)%*%(x-m)
#������ũ : �������� ����(u1<-runif(1,-0.75,0.75), u2<-runif(1,-1,1) #

mcmcbvn<-function (n, rho){                # function(ǥ��������, ������)
mat <- matrix(ncol = 2, nrow = n)          # (n X 2) ��� ����
sigma <- matrix(c(1, rho, rho, 1), ncol=2) # ���л���� ����
sigmaInv <- solve(sigma)                   # ���л������ �����(inverse)
x <- c(0, 0)                               # 1.�ʱⰪ ����
mat[1, ] <- x                              # ��� 1�࿡ ������ �ʱⰪ ���� 
 for (i in 2:n) {                          # i���� 2����� n�����
u1 <- runif(1, -0.75, 0.75)                # ������ũ���� �������� ����
u2 <- runif(1, -1, 1)                      # ������ũ���� �������� ����
z <- c(u1, u2)                             # �ϳ��� �������� z�� ����
y <- x + z                                 # ������ü�� ���� y' = x_j + z
utest <- runif(1)                          # ������������ ���� �ϳ��� ���� u ~ uniform(0,1)
                                         # ����ҰŴ� �� ����ϰ� �ڵ��ۼ��Ѱ���, ��Ʈ�������� �˰����� ���� 
numer <- exp((-1/2)*t(y)%*%sigmaInv%*%y)   # ����(y')
denom <- exp((-1/2)*t(x)%*%sigmaInv%*%x)   # ����(x_j)
if (denom > 0) alpha <- min(numer/denom, 1)# �и� ����(x_j)>0 �̸� alpha���� min[����(y')/����(x_j),1] 
else alpha <- 1                            # �и� ����(x_j)<=0 �̸� alpha���� 1
if (utest <= alpha) x <- y                 # u���� alpha������ �۰ų� ������ y'�� ���ο� ǥ������ ä���Ѵ�
else x <- x                                # u���� alpha������ ũ�� y'ä�� ���Ѵ�
mat[i,]<-x                                 # i��° �� x ����
}                                          # for�ݺ��� ���� 
mat                                        # ǥ���� ��� �ִ� ��� ���
}

bvn<- mcmcbvn(6000,0.98)                   # ǥ�� 6000��, ������ 0.98   
bvn<-bvn[2001:6000,]                       # ���� 2000�� ������, �ڿ� 4000���� ����
par(mfrow=c(3,2))
plot(bvn,type="l")                         # 1���� 2���� ������踦 �����ִ� ������, ������ ������ ����
plot(bvn,col=1:4000)                       # 1���� 2���� ������踦 �����ִ� ������, �� ������ ���� �ٸ��� ��
plot(ts(bvn[,1]))                          # 1���� time series plot���� 4000���� ������� ��� �����ǳ� ������
plot(ts(bvn[,2]))                          # 2���� time series plot���� 4000���� ������� ��� �����ǳ� ������       



###��ǥ��(resampling) ���###

##�ν�Ʈ�� ���##
# ũ�Ⱑ n�� ǥ������ ��������� m���� �ν�Ʈ�� ǥ������ ����
# m���� ������ ǥ���� �̿��Ͽ� m���� ����ġ�� ����

 ## ������� ##
# ����� ũ�⿡ ���� ǥ�������� ũ��. �ڷ��� ���������� �˾ƺ��� ô��
# = ǥ��ǥ������/ǥ�����

 #�ܼ��� ������� �� ���϶�� �ϸ� �̷��� �ϸ� ��#

rats<-c(57,60,52,49,56,46,51,63,49,57,59,54,56,59,57,52,52,61,59,53,59,51,51,56,58,46,53)
cvrats<-sd(rats)/mean(rats)
cvrats

## ��������� ���� ǥ������ �� 95% �ŷڱ��� ##
# ũ�Ⱑ ���� 27�� 1000���� �ν�Ʈ�� ǥ���� �̿��Ͽ� ���������� ��������� ���� ǥ�������� �ŷڱ��� ����
# ������ ���� �ƴ����� �߷��� �����Ѱ�
 #��������� ǥ������, �ŷڱ��� ���϶�� �ϸ� �̷��� �ϸ� ��#

#1. boostrap�Լ����#
# boostrap(������, �ν�Ʈ�����ð���, ���� ������ �Լ�)
 
install.packages("bootstrap")                               # bootstrap�Լ� ����ϱ� ���ؼ� ��Ű�� �ʿ�
library(bootstrap)                                          # bootstrap ��Ű�� �ҷ���

theta1 <- function(x){sd(x)/mean(x)}                        # theta1�� ������� �Լ� ����
results <- bootstrap(rats, 1000, theta1); results           # 1000�� �ν�Ʈ��ǥ�� ������ ������� ����ġ 1000�� ����
sdcvrats <- sd(results$thetastar); sdcvrats                 # ��������� ǥ�������� ���� �ν�Ʈ�� ����ġ
lowlimit1 <- quantile(results$thetastar, 0.025)             # quantile�Լ� �̿��ؼ� 95%�ŷڱ����� ���Ѱ�
lowlimit1
upperlimit1 <- quantile(results$thetastar, 0.975)           # quantile�Լ� �̿��ؼ� 95%�ŷڱ����� ���Ѱ�
upperlimit1
c.i1<-c(lowlimit,upperlimit)                                # ��������� confidence interval(�ŷڱ���)                            
c.i1

#2.bcanon�Լ� ���#
# bootstrap��Ű������ �����ϴ� �Լ� �� �ϳ�
# �ν�Ʈ������ ���� �ϰ� �ż�, ������ �� ������ �ٸ��� ���´�
# confpotins�� �ŷڵ� 8���� ������ ��(���� ���������� ����) -> ����Ʈ���� ���������� 8��
# 1,8 -> 95%     2,7 -> 90% ...
# bcanon(������, �ν�Ʈ�����ð���, ���� ������ �Լ�)


bcanon(rats, 1000, theta1)
lowlimit2 <- bcanon(rats, 1000, theta1)$confpoints[1,]     # 1���� 95% �ŷڱ����� ���Ѱ�
lowlimit2 
upperlimit2 <- bcanon(rats, 1000, theta1)$confpoints[8,]   # 8���� 95% �ŷڱ����� ���Ѱ�
upperlimit2
c.i2 <- bcanon(rats, 1000, theta1, alpha=c(0.025,0.975))    # confidence interval�� bcanon�Լ����� alpha�� �����ؼ� �ٷ� ���� �� ����
c.i2$confpoints


##��ũ������ ���##
# �ν�Ʈ�� ����� Ư���� ����
# �־��� ǥ������ �ϳ��� ���������ν� ���� �� �ִ� ��� ������ ǥ��
# jackknife(������, ���� ������ �Լ�)
 
rats<-c(57,60,52,49,56,46,51,63,49,57,59,54,56,59,57,52,52,61,59,53,59,51,51,56,58,46,53)
theta1 <- function(x){sd(x)/mean(x)}          # ��������Լ��� theta1���� ����
results.jack<- jackknife(rats, theta1)        # ��ũ������ ����� �̿��� ���� ������� ����ġ�� 
results.jack                                  # jackknife�Լ� summary
sdcvrats.jack <- results.jack$jack.se         # ��������� ǥ�������� ���� ��ũ������ ����ġ
sdcvrats.jack                                 # summary �� jack.se�� ǥ��������     
lowlimit3 <- quantile(results.jack$jack.values,0.025)   # 95% �ŷڱ����� ���Ѱ� 
lowlimit3
upperlimit3 <- quantile(results.jack$jack.values,0.975) # 95% �ŷڱ����� ���Ѱ�
upperlimit3
c.i3 <- c(lowlimit3,upperlimit3)              # ��������� 95% �ŷڱ���
c.i3 

# bootstrap ��Ű���� ��� ���ϴ� ���
# sample( ,replace=F) �񺹿�����