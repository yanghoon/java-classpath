#!/bin/bash

DIR=.tmp
WAR=gerrit-3.4.1.war
WAR_DIR=`basename $WAR .war`

rm -rf $DIR
mkdir -p $DIR && cd $DIR
curl -OL https://gerrit-releases.storage.googleapis.com/$WAR

(mkdir -p $WAR_DIR && cd $WAR_DIR && jar -xf ../$WAR)