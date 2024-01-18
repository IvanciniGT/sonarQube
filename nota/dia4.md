Jenkins
    Pipeline CI ya lo teníamos para un proyecto JAVA / MAVEN
        Pero estaba montado un poco de aquella manera
    Montar una versión mucho más robusta de este pipeline. (APTA para entornos de producción)

SonnarScanner:
    Hemos usado el sonnarScanner de maven 
    Hoy vamos a usar:
    - El de .net
    - el genérico (que permite trabajar con cualquier tipo de proyecto)
    
SonarLint

Vamos a ver cómo editar reglas en SonarQube para adaptarlas a nuestra organización.
Instalar un plugin dentro de SonarQube



---

Jenkins
    ---> pipeline ---> maven ---> Sonarqube
                        URL Servidor de SONAR
                        Token (Credencial)
                        
    Sonar recibe el encargo... y se pone a trabajar.
    Analiza el proyecto
    Y cuando acaba, queremos que avise a Jenkins
    
        Sonarqube ---> Jenkins
            URL Jenkins (URL de un servicio REST que se ha instalado dentro de Jenkins al montar el plugin de Sonar)
            Credencial de Jenkins
            
---

Antaño, montabamos aplicaciones de Escritorio.
Tenían un problema, cuando quiero compartir datos entre usuarios.

Empezamos en un momento dado a montar apps con arquetecturas CLIENTE-SERVIDOR

    Apps de Escritorio ----> Servidor (BBDD)
        Cliente 1 - PC1
        Cliente 2 - PC2

Esto era un trabajon:
- Tenía que montar la parte del servidor
- Tenía que montar la parte de Escritorio
- Tenía que definir un protocolo de comunicación entre ambos

En un momento dado surjen las arquitecturas WEB
    Lo crea un hombrecillo llamado Tim Berners Lee (HTTP + HTML)
    Desde ese momento se empezó a usar esta arquitectura no solo para montar Páginas web... sino apps web
    Esto nos ayudó a:
    - Olvidarnos del desarrollo del cliente: Se estandariza: Navegador WEB
    - Olvidarnos del protocolo de comunicación: HTTP siempre
    - Olvidamos de la implementación en el servidor de ese protocolo

Más adelante comienzan:
    - Nuevos dispositivos de acceso a las apps por parte de los usuarios:
        - Teléfonos móviles
        - Altavoces inteligentes
        - Asistentes virtuales
                    
            Amazon
            Netflix
        La arquitectura cliente / Servidor WEB se queda pobre para este tipo de nuevas aplicaciones.
            - No todos los clientes tienen ya la misma app de escritorio
            - El formato HTML se queda pobre (Es un formato orientado a seres humanos)
        Aquí surjen las arquitecturas oprientadas a servicios y microservicios.
        

BANCO:
    BACKEND                                             FRONTALES
        servicio login                                      Cajero automático
        servicio transferencia        json                  App teléfono movil
        servicio de saldo             xml                   App web
        servicio de movimientos                             App asistente virtual
                                                            App IVR
        
    Esos servicios pueden estar en comunicación entre si... o no
    
Se empiezan a usar formatos más planos (genéricos) de transporte de información:
- json
- xml

Igual que HTML tenía su protocolo: HTTP 
Salen protocolos nuevos (que a su vez se montan sobre HTTP) para la gestión/transporte de estos ficheros: 
- REST (json)
- SOAP (xml)

Esto nos permite estandarizar la forma de crear unos servicios en backend que puedan ser consumidos por múltiples clientes.

Adicionalmente ocurre otra cosa... 
YA NO SOLO QUIERO tener usuarios (humanos) accediendo a esos servicios de backend)...
OTROS PROGRAMAS también accederán a esos servicios.

Esas comunicaciones también las montamos haciendo uso de estos mismos protocolos / formatos:

    SONARQUBE ----> JENKINS
            http:// al servidor de Jenkins
            Y le manda un archivo JSON con los datos del proyecto que acaba de analizarse y su resultado.
            
        En JENKINS tenemos un servicio REST que puede ser invocado por otros usuarios/programas(como es el caso de SONARQUBE)

Hoy en día va todo por REST

SOAP Está practicamente en el olvido.

<usuario>
    <nombre>Ivan</nombre>
    <apellidos>Osuna</apellidos>
    <edad>45</edad>
</usuario>

{
    nombre: "Ivan",
    apellidos: "Osuna",
    edad: 45
}

Adicionalmente el mundo del desarrollo de software ha evolucionado dejando de lado
los sistemas MONOLITICOS (arquitecturas monolíticas).
Antes haciamos apps que hacían de todo.
Estos megasistemas no había quien los mantuviese

Hoy en día, todo lo montamos con arquitecturas orientadas a servicios y microservicios... donde creamos programas muy pequeños y muy independientes entre si.
    
    
---
http://54.194.50.14:8081/job/MavenBuena/lastSuccessfulBuild/artifact/target/mi-aplicacion-1.0-SNAPSHOT.jar # Pipeline Continuous Delivery

---

Proyecto .net

# Descargo imagen de contenedor con .net Core 8
docker pull mcr.microsoft.com/devcontainers/dotnet:dev-8.0

docker container create --name mi-dotnet -w /proyecto -v $PWD:/proyecto mcr.microsoft.com/devcontainers/dotnet:dev-8.0 sleep 3600
# Creamos  un contenedor
                        # que llamamos mi-dotnet
                                        # Cualquier comando que por defecto se ejecute en la carpeta /proyecto
                                                     # Esa carpeta /proyecto del contenedor, que sea la carpeta donbde tengo mi proyecto en el host
                                                                        # imagen de contenedor que uso: .net Core v8    
                                                                                                                        # Cuando levantes el contenedor, dejalo corriendo 1 hora.
                            
apt update
apt install -y openjdk-17-jre

# Iniciamos el análisis de Sonarqube
dotnet sonarscanner begin /k:"proyectoPuntoNet" /d:sonar.host.url="http://54.194.50.14:8080"  /d:sonar.login="squ_961d0f79d23f47823d2573a3cb86bb301c7be74f"

# Empaquetamos el proyecto (lo compilamos)
dotnet build <NOMBRE DEL FICHERO DE LA SOLUCION>

# Cerramos el análisis de sonar
dotnet sonarscanner end /d:sonar.login="squ_961d0f79d23f47823d2573a3cb86bb301c7be74f"

---

DEVOPS

- Contenedores
    - Docker
    - Kubernetes
- Jenkins / AzureDevops / Github actions / Gitlb CI/CD / Travis
- Herramientas de empaquetado: MAVEN, GRADLE, DOTNET...
- Herramientas de pruebas: JUNIT (y equivalentes), sonarqube o equivalentes,....
- Herramientas de despliegue / INFRA: Clouds < Terraform (Vagrant), Ansible ...

---

# Rules

Reglas individuales que aplican a un determinado lenguaje de programación:
- En JAVA las variables deben escribirse con nomenclatura camelCase.

# Profile

Conjunto de Reglas que aplican sobre unos determinados proyectos, para unos determinados idiomas (lenguajes de programación)
Los profiles son gestionados por individuos selectos (o grupos)

Al analizar un proyecto se obtienen una métricas:
    - Tienes 15 bugs
    - Tienes 29 apestosidades (smells) en el código
    - Tienes 12% de código duplicado
Al hacer el análisis se tienen en cuenta las reglas, para calcular esos indicadores

# QualityGates

Indican si un proyecto puede considerarse APTO o no para su paso a producción:
Son restricciones a las metricas de un proyecto:
- Si tienes más de 10 bugs el proyecto no pasa
- Si tienes menos de un 70% de cobertura, el proyecto no pasa
- Si tienes menos de un 10% de comentarios, el proyecto no pasa
Los QualityGates son gestionados por individuos selectos (o grupos)

