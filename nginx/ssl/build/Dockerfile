FROM  nginx:stable-perl

LABEL maintainer="lhy"

RUN mkdir -p  /web \
    && mkdir -p ssl \
    && mkdir -p  /fileauth/.well-known/pki-validation

WORKDIR /web

#1. 登录阿里云Docker Registry
#$ sudo docker login --username=15897476550 registry.cn-hangzhou.aliyuncs.com
#用于登录的用户名为阿里云账号全名，密码为开通服务时设置的密码。


#2. 从Registry中拉取镜像
# sudo docker pull registry.cn-hangzhou.aliyuncs.com/leihuangyan/nginx:[镜像版本号]
#3. 将镜像推送到Registry
# sudo docker login --username=15897476550 registry.cn-hangzhou.aliyuncs.com
# sudo docker tag [ImageId] registry.cn-hangzhou.aliyuncs.com/leihuangyan/nginx:[镜像版本号]
# sudo docker push registry.cn-hangzhou.aliyuncs.com/leihuangyan/nginx:[镜像版本号]
#docker run -d  -p 8001:80 -v /Users/lhy/Downloads/scp/docker/DockerFile/nginx/conf:/etc/nginx/conf.d  -v /Users/lhy/Downloads/scp/docker/DockerFile/nginx/html:/usr/share/nginx/html -v /Users/lhy/Downloads/scp/docker/DockerFile/nginx/logs:/var/log/nginx --name=nginx-test lhy/nginx:1.0
#docker run -d  -p 8001:80 -v /Users/lhy/Downloads/scp/docker/DockerFile/nginx/conf:/etc/nginx/conf.d  --name=nginx-test lhy/nginx:1.0
#docker run -d  -p 8001:80 --name=nginx-test lhy/nginx:1.0

ADD ./dist.tar.gz  /web
ADD ./4601011_lhy.pp.ua.key /ssl
ADD ./4601011_lhy.pp.ua.pem  /ssl

ADD ./fileauth/.well-known/pki-validation/fileauth.txt  /fileauth/.well-known/pki-validation
ADD ./default.conf  /etc/nginx/conf.d/

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
