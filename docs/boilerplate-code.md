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
create:
	mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-archetype

tree:
	mvn dependency:tree

analyze:
	mvn dependency:analyze

validate:
	mvn clean validate

compile:
	mvn clean compile

test:
	mvn clean test

build:
	mvn clean package

verify:
	mvn clean verify

install:
	mvn clean install

run:
	@mvn -q exec:java -Dexec.mainClass=com.mv.start.App

debug:
	@mvndebug compile exec:java -Dexec.mainClass="com.mv.start.App"

attach:
	@jdb -connect com.sun.jdi.SocketAttach:hostname=localhost,port=8000
```


