#!/bin/bash

mkdir ServWeb
mkdir ServWeb/templates
mkdir ServWeb/static
cp app.py ServWeb/.
cp -r templates/* ServWeb/templates/.
cp -r static/* ServWeb/static/.
echo "FROM python" >> ServWeb/Dockerfile
echo "RUN pip install flask" >> ServWeb/Dockerfile
echo "COPY ./static /home/myapp/static" >> ServWeb/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> ServWeb/Dockerfile
echo "COPY app.py /home/myapp/" >> ServWeb/Dockerfile
echo "EXPOSE 8092" >> ServWeb/Dockerfile
echo "CMD python3 /home/myapp/app.py" >> ServWeb/Dockerfile
cd ServWeb
docker build -t servweb .
docker run -t -d -p 8092:8092 --name servwebct --restart unless-stopped servweb
docker ps -a
