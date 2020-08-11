#!/bin/bash
echo "开始部署docker nacos..."

docker stop nacos

echo  "停止成功!!"

docker rm nacos

echo "删除老容器"+$#

docker run -d  --name nacos -e MODE=standalone -e SPRING_DATASOURCE_PLATFORM=mysql -e MYSQL_SERVICE_HOST=39.108.172.78 -e MYSQL_SERVICE_PORT=3306 -e MYSQL_SERVICE_USER=root -e MYSQL_SERVICE_PASSWORD=1223 -e MYSQL_SERVICE_DB_NAME=nacos -v /Users/lhy/tools/docker/nacos/nacos-docker-sh/plugins:/home/nacos/plugins/mysql -v /Users/lhy/tools/docker/nacos/nacos-docker-sh/conf:/home/nacos/conf -p 8848:8848  nacos/nacos-server 


if test 0 -eq $#
    then 
        echo 'docker nacos 启动成功!!!'
    else
        if  test $1 = "log"
            then
                echo "启动nacos命令结束,输出日志。。"
                docker logs -f nacos   
            else
            echo 'docker nacos 启动成功!!!'
        fi
fi


