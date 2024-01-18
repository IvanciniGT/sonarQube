mvn archetype:generate \
-DgroupId=curso.es \
-DartifactId=mi-aplicacion \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DarchetypeVersion=1.4 \
-DinteractiveMode=false

mvn compile
mvn test
mvn package







mvn sonar:sonar \
    -Dsonar.host.url=http://localhost:8080 \
    -Dsonar.login=squ_961d0f79d23f47823d2573a3cb86bb301c7be74f

# Token de Jenkins para sonar: 11929d1b7c14486e88edff09b981e1a11a