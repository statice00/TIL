### 우분투에 도커 설치



도커(Docker)는 응용 프로그램들을 소프트웨어 컨테이너 안에 배치시키는 일을 자동화하는 오픈 소스 프로젝트

가상머신(Virtual machine)과 비슷하지만 도커의 컨테이너는 더 이식성이 뛰어나고 리소스 친화적이며 호스트(Host) 운영 체제에 더 많이 의존

가상머신 환경에서는 게스트(Guest) 운영 체제가 존재하지만 도커의 컨테이너에는 게스트 운영 체제가 없으며 호스트 운영 체제 위에 도커 엔진이 동작

따라서 일반적인 가상머신보다는 도커의 컨테이너가 더 빠르게 동작



```bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce # 설치여부 확인


sudo apt install docker-ce #설치

sudo systemctl status docker # 실행중인지 확인
```



