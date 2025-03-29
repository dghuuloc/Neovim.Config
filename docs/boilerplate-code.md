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

```Makefile
comp:
	@javac -cp ./lib/junit-4.12.jar -d ./out/ ./src/main/jv/*.java ./src/test/jv/*.java
	@echo "Compiled Successfully!"
exec:
	@java -cp ./out;./lib/junit-4.12.jar;./lib/hamcrest-core-1.3.jar main.jv.TestRunner
```

## Reference
* [How to compile, package and run a Java program using command-line tools (javac, jar and java)](https://www.codejava.net/java-core/tools/how-to-compile-package-and-run-a-java-program-using-command-line-tools-javac-jar-and-java)
* [Compiling to Java](https://javarush.com/en/groups/posts/en.2318.compiling-to-java)
* [Running JUnit Tests in Command Line](https://jojozhuang.github.io/programming/running-junit-tests-in-command-line/)
