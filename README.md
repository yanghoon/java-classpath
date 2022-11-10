# Java Classpath Test

## Find ClassPath for Target Class

```bash
java -verbose:class Main
java -verbose:class Main | grep Main
```

```bash
./gerrit-download.sh

java -verbose:class -jar .tmp/gerrit-3.4.1.war version > .tmp/gerrit_war_classpath_version.txt
cat .tmp/gerrit_war_classpath_version.txt | grep -vE 'jrt|java.lang|java.util|com.sun'
cat .tmp/gerrit_war_classpath_version.txt | grep -vE 'jrt|java.lang|java.util|com.sun' | grep 'ChannelOutputStream'
```

```bash
java -verbose:class -classpath '.tmp/gerrit-3.4.1/WEB-INF/lib/sshd-osgi-2.6.0.jar:.' com.google.gerrit.pgm.TestMain > .tmp/sshd_classpath.txt 
cat .tmp/sshd_classpath.txt | grep -vE 'jrt|java.lang|java.util|com.sun' | grep 'ChannelOutputStream'
```

```bash
java -verbose:class -classpath '.tmp/gerrit-3.4.1.war:.' Main TestMain > .tmp/gerrit_war_classpath_testmain.txt
cat .tmp/gerrit_war_classpath_testmain.txt | grep -vE 'jrt|java.lang|java.util|com.sun' | grep 'TestMain'
cat .tmp/gerrit_war_classpath_testmain.txt | grep -vE 'jrt|java.lang|java.util|com.sun' | grep 'ChannelOutputStream'
```

```bash
## Failed
java -verbose:class -jar .tmp/gerrit-3.4.1.war init -d .tmp/gerrit_home --batch --dev | tee .tmp/gerrit_war_classpath_init.txt | grep sshd
```

```bash
$ git config -f etc/gerrit.config --get container.javaOptions '-verbose:class'
$ echo $?  # 0(exist), 1(non-exist)
# 1
$ git config -f etc/gerrit.config --add container.javaOptions '-verbose:class'

$ bin/gerrit.sh run | grep apache.sshd
$ bin/gerrit.sh run | grep sshd-osgi
$ jps
```

```bash
$ bin/gerrit.sh start
Starting Gerrit Code Review: WARNING: Could not adjust Gerrit's process for the kernel's out-of-memory killer.
         This may be caused by bin/gerrit.sh not being run as root.
         Consider changing the OOM score adjustment manually for Gerrit's PID=2164 with e.g.:
         echo '-1000' | sudo tee /proc/2164/oom_score_adj
ps: unknown option -- o
Try `ps --help' for more information.
FAILED

$ ls -al tmp/*/sshd*.jar
-rw-r--r-- 1 yang 없음   30434 11월 10 21:53 tmp/gerrit_5631390083659370257_app/sshd-mina-2.6.0.jar
-rw-r--r-- 1 yang 없음 1723029 11월 10 21:53 tmp/gerrit_5631390083659370257_app/sshd-osgi-2.6.0.jar
-rw-r--r-- 1 yang 없음  339648 11월 10 21:53 tmp/gerrit_5631390083659370257_app/sshd-sftp-2.6.0.jar
```
