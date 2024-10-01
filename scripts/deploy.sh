##!/bin/bash

BUILD_JAR=$(ls /home/ubuntu/app/build/libs/*.jar)
JAR_NAME=$(basename $BUILD_JAR)
echo "#### JAR NAME: $JAR_NAME" >> /home/ubuntu/deploy.log

echo "#### CP START" >> /home/ubuntu/deploy.log
DEPLOY_PATH=/home/ubuntu/app/build/libs/
cp $BUILD_JAR $DEPLOY_PATH
echo "#### CP FIN $DEPLOY_PATH" >> /home/ubuntu/deploy.log

sudo ps -ef | grep java | awk '{print $2}' | xargs kill -15

DEPLOY_JAR=$DEPLOY_PATH$JAR_NAME
echo "#### DEPLOY $DEPLOY_JAR $JAR_NAME " >> /home/ubunru/deploy.log
nohup java -jar $DEPLOY_JAR >> /home/ubuntu/deploy.log 2> /home/ubuntu/deploy_err.log &