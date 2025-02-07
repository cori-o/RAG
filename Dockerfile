# 기본 Docker Image 설정   
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel    
LABEL description='Docker image created for rag architecture'

# Docker 내 작업 경로 설정 
WORKDIR /rag  
COPY . .

# 한글 입력을 위한 환경 변수 설정 
ENV LC_ALL ko_KR.UTF-8 

# 패키지 설치 (한글 입력을 위한 locale)
RUN apt-get update && apt-get install -y locales
RUN locale-gen ko_KR.UTF-8   
RUN apt-get install python3-pip -y
RUN pip install -r requirements.txt