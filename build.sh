#!/bin/bash

javac Main.java

# javac com/google/gerrit/pgm/TestMain.java
javac -classpath .tmp/gerrit-3.4.1/WEB-INF/lib/sshd-osgi-2.6.0.jar com/google/gerrit/pgm/TestMain.java