# package-demo

#### 项目介绍
本项目是基于 maven-assembly 插件对象项目进行打包的一个的简单应用。主要用于将项目依赖的三方包、配置文件和项目自身的jar包进行分离，
通过执行两次 package ,可分别生成基础包（三方包、日志文件目录）和升级包（配置文件、项目自身jar包）。针对只是项目自身代码改动而依赖
的三方包没有变更的情况，只需重新生成及升级包即可。

#### 依赖工具
    jdk:        1.8
    SpringBoot: 1.5.17
    maven-assembly: 3.1.0

#### 目录结构
    src
        |-main
            |-build --构建文件
                |-bin -- 用于存放脚本
                    |-server.sh 用于启动、停止、重启、查看应用状态等
                |-logs --用于存放日志
                |-package   --用于存放打包描述文件
                    |-basic-package.xml --基础包
                    |-append-package.xml    --升级包
            |-java
                |-com.suns.packagedemo
                    |-PackageDemoApplication    --入口类
            |-resources
                |-config
                    |-application.properties    --应用配置
                    |-logback.xml   --日志文件配置

#### 使用说明

1. server.sh 针对不同应用只需修改 APP_NAME 即可；
2. 在pom.xml文件中通过修改 <package.type>和 <package.name> 实现打基础包和升级包；
3. 将基础包和升级包解压到同一目录下，执行 sh server.sh start 即可启动项目。