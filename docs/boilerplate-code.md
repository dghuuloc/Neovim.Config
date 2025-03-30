### How to create makefile code for executing Java Code
#### Windows
#### x86 32/64 bits
```
java -classpath bin;lib\commons-lang-2.6.jar;lib\gson-2.10.1.jar;lib\guava-20.0.jar;lib\ojdbc8.jar;lib\gson-2.10.1.jar com.package.example.Main
```

#### Linux
#### x86 (32/64 bits)
#### ARM (32/64 bits)
```
java -classpath bin:lib\commons-lang-2.6.jar:lib\gson-2.10.1.jar:lib\guava-20.0.jar:lib\ojdbc8.jar:lib\gson-2.10.1.jar com.package.example.Main
```

#### MacOS X (UNTESTED)
```
java -classpath bin:lib\commons-lang-2.6.jar:lib\gson-2.10.1.jar:lib\guava-20.0.jar:lib\ojdbc8.jar:lib\gson-2.10.1.jar com.package.example.Main
```

### makefile Boilerplate
```makefile
# Target for running up compiled classes
comp:
	javac -classpath ./lib/gson-2.10.1.jar;lib/ojdbc8.jar -d ./bin/ ./src/com/*.java ./src/com/impl/*.java
run:
	java -classpath bin;lib/gson-2.10.1.jar;lib/ojdbc8.jar Main
```
#### How to run Java Code from nvim Command
```
:!makefile run
```

---
### How to create makefile for executing Maven Project
```makefile
exec:
	@mvn -q exec:java "-Dexec.mainClass=com.mv.start.App"

debug:
	@mvndebug compile exec:java "-Dexec.mainClass=com.mv.start.App"

attach:
	@jdb -connect com.sun.jdi.SocketAttach:hostname=localhost,port=8000
```

### How to run junit tests
#### With Junit 4
```Makefile
comp:
	@javac -cp ./lib/junit-4.12.jar -d ./out/ ./src/main/jv/*.java ./src/test/jv/*.java
exec:
	@java -cp ./out;./lib/junit-4.12.jar;./lib/hamcrest-core-1.3.jar main.jv.TestRunner
```
#### With Junit 5
```
comp:
	@javac -cp ./lib/junit-platform-console-standalone-1.11.4.jar -d ./out  ./src/main/Invoker.java ./src/main/tree/*.java ./src/test/*.java
deb:
	@javac -g -cp ./lib/junit-platform-console-standalone-1.11.4.jar -d ./out  ./src/main/Invoker.java ./src/main/tree/*.java ./src/test/*.java
exec:
	@java -jar ./lib/junit-platform-console-standalone-1.11.4.jar --class-path ./out --scan-classpath --include-classname test.InvokerTest
	@java -jar ./lib/junit-platform-console-standalone-1.11.4.jar --class-path ./out --scan-classpath
jdb:
	@jdb -sourcepath ./src -classpath ./out main.Invoker
```

## Reference
* [How to compile, package and run a Java program using command-line tools (javac, jar and java)](https://www.codejava.net/java-core/tools/how-to-compile-package-and-run-a-java-program-using-command-line-tools-javac-jar-and-java)
* [Compiling to Java](https://javarush.com/en/groups/posts/en.2318.compiling-to-java)
* [Running JUnit Tests in Command Line](https://jojozhuang.github.io/programming/running-junit-tests-in-command-line/)
* [How to run JUnit test cases from the command line](https://codemia.io/knowledge-hub/path/how_to_run_junit_test_cases_from_the_command_line)
* [Dynamic Tests with JUnit 5 in Command Line](https://jojozhuang.github.io/programming/dynamic-tests-with-junit5-in-command-line/)
