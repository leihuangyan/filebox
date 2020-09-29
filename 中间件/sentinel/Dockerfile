FROM  centos:centos8

#工作目录
ARG WORKDIR=/opt/application

ARG JAR_FILE=sentinel-dashboard.jar


#作者
LABEL maintainer="lhy"

#环境变量
# 防止乱码环境变量默认值
ENV LANG C.UTF-8
ENV TZ Asia/Shanghai
ENV JAVA_OPTS "-Xms256m -Xmx256m"
ENV JAR_NAME_ENV sentinel-dashboard.jar
ENV SERVER_PORT 8080



#启动命令
RUN set -x \
    && yum update -y \
    && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel iputils vim\
    && yum clean all

#工作目录
WORKDIR ${WORKDIR}

# 复制jar
ADD ${JAR_FILE}  ${WORKDIR}/${JAR_NAME_ENV}

#暴露端口
EXPOSE ${SERVER_PORT}

#exec格式 支持拼接
#但此处ENTRYPOINT 使用/bin/sh命令同样不支持拼接
#ENTRYPOINT ["/bin/sh", "-c","java $JAVA_OPTS -jar -client ${JAR_NAME}]

#shell格式 由 "/bin/sh -c" 启动 不支持拼接
# ${}只支持环境变量ENV, 不支持ARG
ENTRYPOINT java ${JAVA_OPTS} -server  -Dserver.port=${SERVER_PORT} -Dcsp.sentinel.dashboard.server=localhost:${SERVER_PORT} -Dproject.name=sentinel-dashboard -jar  ${JAR_NAME_ENV}
