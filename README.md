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
