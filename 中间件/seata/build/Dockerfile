FROM  seataio/seata-server:1.3.0

#工作目录
#ARG WORKDIR=/opt/application

#作者
LABEL maintainer="lhy"

#环境变量
# 防止乱码环境变量默认值
ENV LANG C.UTF-8
ENV TZ Asia/Shanghai


#指定seata-server启动的IP, 该IP用于向注册中心注册时使用, 如eureka等
#ENV SEATA_IP 192.168.1.1
#可选, 指定seata-server启动的端口, 默认为 8091
ENV SEATA_PORT 8091
#指定seata-server的事务日志存储方式, 支持db ,file,redis(Seata-Server 1.3及以上版本支持), 默认是 file
ENV STORE_MODE=db
#ENV STORE_MODE=file
#用于指定seata-server节点ID, 如 1,2,3..., 默认为 根据ip生成
#ENV SERVER_NODE
#可选, 指定 seata-server 运行环境, 如 dev, test 等, 服务启动时会使用 registry-dev.conf 这样的配置
#ENV SEATA_ENV dev
#可选, 指定配置文件位置, 如 file:/root/registry, 将会加载 /root/registry.conf 作为配置文件，
#如果需要同时指定 file.conf文件，需要将registry.conf的config.file.name的值改为类似file:/root/file.conf：
#ENV SEATA_CONFIG_NAME
# docker build -t seata:1.0 .
#  docker run --name seata-server -it  -p 8091:8091 seata:1.0
#  docker run --name seata-server -d  -p 8091:8091 seata:1.0
#docker exec -it seata-server  /bin/bash

#ENV LOCALHOST_ADDR host.docker.internal

COPY registry.conf /seata-server/resources/registry.conf
#COPY registry-dev.conf /seata-server/resources/registry-dev.conf

COPY file.conf /seata-server/resources/file.conf

#暴露端口
EXPOSE ${SEATA_PORT}