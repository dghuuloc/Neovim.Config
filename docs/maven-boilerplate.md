

```
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
