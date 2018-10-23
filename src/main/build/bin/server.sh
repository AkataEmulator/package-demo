#!/bin/bash
#应用jar包名称
APP_NAME=package-demo-1.0.0.jar
TIME=`date +%Y%m%d`

#使用参数提示
usage() {
    echo "usage: sh server.sh [start|stop|restart|status]"
    exit 1
}

#检查程序是否执行
is_exist() {
    pid=`ps -ef|grep $APP_NAME|grep -v grep|awk '{print $2}'`
    #不存在则返回1，存在则返回0
    if [ -z "${pid}" ]; then
        return 1
    else
        return 0
    fi
}

#启动
start() {
    is_exist
    if [ $? -eq "0" ]; then
        echo "${APP_NAME} is already running. pid = ${pid}."
    else
        nohup java -jar $APP_NAME > ./logs/${TIME}.log 2>&1 &
    fi

}

#停止
stop() {
    is_exist
    if [ $? -eq "0" ]; then
        kill -9 $pid
    else
        echo "${APP_NAME} is not running"
    fi
}

#运行状态
status() {
    is_exist
    if [ $? -eq "0" ]; then
        echo "${APP_NAME} is running.pid is ${pid}."
    else
        echo "${APP_NAME} is not running."
    fi
}

#重启
restart() {
    stop
    start
}

#根据输入参数选择执行的方法，不输入参数则执行使用说明
case "$1" in
    "start")
        start
        ;;
    "stop")
        stop
        ;;
    "status")
        status
        ;;
    "restart")
        restart
        ;;
    *)
        usage
        ;;
esac
