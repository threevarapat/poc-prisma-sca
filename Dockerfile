FROM ubuntu:18.04
ENV TZ=Asia/Bangkok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get upgrade -y
RUN apt install net-tools iputils-ping python3.8 python3-pip -y
RUN ln -s /usr/bin/pip3 /usr/bin/pip
WORKDIR /apps/
RUN mkdir -p /apps/result
RUN mkdir -p /apps/input
COPY requirements.txt requirements.txt
COPY *.py ./
CMD [ "python3", "app.py"]