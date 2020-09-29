FROM  centos:centos8

#工作目录
ARG WORKDIR=/opt/application

#作者
LABEL maintainer="lhy"

#环境变量
# 防止乱码环境变量默认值
ENV LANG C.UTF-8
ENV TZ Asia/Shanghai
ENV JAVA_OPTS "-Xms256m -Xmx256m"
ENV SERVER_PORT 8091

ENV LOCALHOST_ADDR host.docker.internal


#工作目录
WORKDIR ${WORKDIR}

# 复制jar
ADD seata-server-1.2.0.tar.gz  ${WORKDIR}/1.2
ADD seata-server-1.3.0.tar.gz  ${WORKDIR}/1.3
ADD config.tar.gz  ${WORKDIR}

#启动命令
RUN set -x \
    && yum update -y \
    && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel iputils vim\
    && echo ${WORKDIR}/1.3/seata ${WORKDIR}/1.2/seata  | xargs -n 1 cp -v /opt/application/config/config.txt \      	  
    && echo ${WORKDIR}/1.3/seata/conf ${WORKDIR}/1.2/seata/conf  | xargs -n 1 cp -v /opt/application/config/file.conf \
    && echo ${WORKDIR}/1.3/seata/conf ${WORKDIR}/1.2/seata/conf  | xargs -n 1 cp -v /opt/application/config/nacos-config.sh \
    && echo ${WORKDIR}/1.3/seata/conf ${WORKDIR}/1.2/seata/conf  | xargs -n 1 cp -v /opt/application/config/registry-nacos-config.sh \
    && echo ${WORKDIR}/1.3/seata/conf ${WORKDIR}/1.2/seata/conf  | xargs -n 1 cp -v /opt/application/config/registry.conf \
    && rm -r ${WORKDIR}/config \
    && yum clean all

#暴露端口
EXPOSE ${SERVER_PORT}

CMD ["sh", "/opt/application/1.3/seata/bin/seata-server.sh"]
