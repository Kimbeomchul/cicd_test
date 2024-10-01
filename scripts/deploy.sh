##!/bin/bash

BUILD_JAR=$(ls /home/ubuntu/app/build/libs/*.jar)
JAR_NAME=$(basename $BUILD_JAR)
echo "#### 파일명: $JAR_NAME" >> /home/ubuntu/deploy.log

echo "#### 파일 복사" >> /home/ubuntu/deploy.log
DEPLOY_PATH=/home/ubuntu/app/build/libs/
cp $BUILD_JAR $DEPLOY_PATH

echo "#### pid" >> /home/ubuntu/deploy.log
sudo ps -ef | grep java | awk '{print $2}' | xargs kill -15

DEPLOY_JAR=$DEPLOY_PATH$JAR_NAME
echo "#### 배포"    >> /home/ubuntu/deploy.log
echo "#### $DEPLOY_JAR $JAR_NAME " >> /home/ubunru/deploy.log
nohup java -jar $DEPLOY_JAR >> /home/ubuntu/deploy.log 2> /home/ubuntu/deploy_err.log &