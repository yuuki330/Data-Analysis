FROM python:3.12-slim

RUN apt update && apt upgrade -y

ENV TZ=Asia/Tokyo

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && dpkg-reconfigure -f coninteractive tzdata

COPY requirements.txt /workspece/

WORKDIR /workspace

RUN pip install -r requirements.txt