# Testing / Pruebas de software

Antiguamente se consideraba un gasto en los proyectos de desarrollo de software, pero hoy en día se considera una inversión.

## Vocabulario en el mundo del testing

- Error     Los humanos cometemos errores (somos humanos... errar es de humanos)
            Motivos: falta de conocimiento, falta de experiencia, falta de atención, etc.
- Defecto   Al cometer un error (un humano) podemos introducir un DEFECTO en un producto.
- Fallo     Un fallo es la manifestación de un defecto en un producto.

## Para qué sirven las pruebas que hacemos en un software?

- Para verificar el cumplimiento de unos requisitos.
- Nos ayudan a identificar la mayor cantidad posible de Defectos antes del paso a producción de un sistema:
  - Normalmente lo que hacemos es usar el producto y ver si falla: Identificar fallos.
    Una vez identificado un Fallo, procedemos a identificar el defecto que lo ocasiona:
        Eso se denomina depuración (debugging).
        - Las pruebas deben proveer información para la rápida detección y corrección de defectos, desde los fallos que han sido identificados.
  - En ocasiones busco directamente Defectos en el producto: Hago una revisión del producto.
       (NOTA: AQUI ES DONDE ENTRA SONARQUBE) 
- Hoy en día las pruebas ayudan al desarrollador a confeccionar su producto.
  Existen un montón de metodologías de desarrollo de software que se basan en las pruebas:
    - Test-Fist Development
    - TDD (Test Driven Development): Test-First Development + Refactoring
    - BDD (Behavior Driven Development)
    - ATDD (Acceptance Test Driven Development)
- Para saber en qué estado se encuentra el proyecto (su grado de avance... si voy con retraso?) (1)

## Tipos de pruebas que existen

Las pruebas las clasificamos en base a distintas taxonimoías, paralelas entre si:

### En base al objeto de prueba

- Funcionales       Se centran en la funcionalidad del producto.
- No funcionales    Se centran en otros aspectos:
  - Rendimiento
  - Seguridad
  - Usabilidad / UX
  - Accesibilidad
  - HA
  - Estrés
  - Carga
  - ...

### En base al nivel de la prueba

- Unitarias:     Se centran en una característica de un componente AISLADO del sistema
- Integración:   Se centran en la COMUNICACION entre 2 componentes
- Sistema (E2E): Se centran en el COMPORTAMIENTO del sistema como un todo
  - Pruebas de aceptación: Habitualmente son un subconjunto de las pruebas E2E

### En base al procedimiento de ejecución:

- Pruebas estáticas:  Se ejecutan sin necesidad de ejecutar el producto (poner el software en funcionamiento)
                        Se centran en detectar DEFECTOS (SONARQUBE)
- Pruebas dinámicas:  Se ejecutan con el producto en funcionamiento
                        Se centran en detectar FALLOS

### Pruebas en base al conocimiento del producto

- Caja negra:   Cuando no conozco el funcionamiento interno del producto
- Caja blanca:  Cuando conozco el funcionamiento interno del producto

### Otras clasificaciones

- Pruebas de regresión: Es cualquier prueba que vuelvo a ejecutar más adelante para asegurar que una característica del producto sigue funcionando correctamente tras haber realizado un cambio en el producto. SON CANDIDATAS IDEALES A SER AUTOMATIZADAS.

# Dev-->ops

Devops NO ES UN PERFIL PROFESIONAL.... o al menos no lo era en su comienzo.

Es una cultura, una filosofía, un movimiento en pro de la AUTOMATIZACION.
Automatización de qué? de TODO lo que se pueda automatizar... entre el DESarrollo y la OPeración de un producto de software.
Con devops, reinventamos la forma de entender el ciclo de vida de un producto de software.

Trabajos en el mundo devops:
                                                                        AUTOMATIZABLES
- Plan      Planificar los trabajos a hacer en las próximas 2 semanas         NO
- Code      Picar código                                                      NO -> GIT
- Build     Empaquetar el proyecto (compilar, ejecutable...)                  SI
                Java: maven, gradle, sbt
                .net: msbuild, dotnet, nuget
                js:   npm, yarn, webpack
- Test      Diseño de las pruebas                                             NO
            Ejecución de las mismas                                           SI
                Pruebas unitarias:
                    Java: JUnit, TestNG
                    .net: NUnit, xUnit, MSTest
                    python: unittest
                    js: jest, mocha, jasmine, karma
                Pruebas de UI:
                    Apps web                Selenium
                    Apps móviles            Appium
                    App desktop             WinAppDriver | UFT
                Pruebas de rendimiento:
                    JMeter, Gatling, Locust
                Pruebas de seguridad:
                    ZAP, BurpSuite
                Pruebas estáticas de calidad de código:
                    SonarQube, SonarLint, findbugs, checkstyle, pmd, ...

    Estas pruebas las hago en:
        la máquina del desarrollador?   Ni de coña... No me fio.... está maleada
        la máquina del tester?          Ni de coña... No me fio.... está maleada
        en un entorno de pruebas que tengo configurado de antemano?
                                        Antes si... hoy en día tampoco...
                                        Después de 10 instalaciones... el entorno está maleado
        Hoy en día la tendencia (desde hace años) es a crear entornos de pruebas bajo demanda... que son destrozados y creados de nuevo cada vez que se ejecuta una prueba.
            Clouds: AWS, Azure, GCP, DigitalOcean, Linode, OVH, ...
                    VMWare, Citrix, OpenStack, ...
            Automatizar peticiones de infra: Terraform, Vagrant
            Aprovisionamiento: Ansible, Puppet, Chef, ...
                               Script de la bash (shell) o de powershell
            Docker, Kubernetes, Openshift, ...
- Release   Poner el producto en manos de mi cliente                        SI   
- Deploy    Paso a producción (instalación)                                 SI
- Operate   Escalado, Backups, Reinicios...                                 SI - Kubernetes
- Monitor                                                                   SI /

NOTA: AUTOMATIZACION: Es montar una máquina o un PROGRAMA que haga lo que antes hacía un humano tardando una cierta cantidad de tiempo y esfuerzo.

Imaginad que he creado automatizaciones para todas las tareas posibles de un proyecto.
Habría algo más que automatizar? Quien ejecuta esos programas que he creado?
Si los sigo ejecutando yo a mano... sigo teniendo un procedimiento manual.
Ese trabajo  (una automatización de segundo nivel) también quiero automatizarla.
Y hay toda una variedad de programas que se encargan de este cometido... llamar a automatizaciones... Orquestarlas:
- Jenkins
- Azure Devops (antiguamente TFS)
- Gitlab CI/CD
- Github Actions
- Travis CI
- TeamCity
- Bamboo

Estas herramientas surgen de la necesidad de orquestar las automatizaciones que se han creado para un proyecto de software. Antiguamente no tenía sentido... porque no había automatizaciones... pero hoy en día es una necesidad.

Y antiguamente no había nadie que supera hacer todo esto... porque no había automatizaciones... pero hoy en día es una necesidad.

Necesito una persona que sepa configurar un Pipeline (una orquestación) dentro de un Jenkins... Azure Devops... Gitlab CI/CD... Github Actions... Travis CI... TeamCity... Bamboo

Esa persona debe saber de maven, msbuild, junit, aws, vmware, terraform, ansible, docker, kubernetes, openshift, ...
ESTE PERFIL NUEVO es el que inicialmente se denomina DEVOPS.
Ese concepto hoy en día se ha desvirtuado mucho.... Cada empresa llama devops a lo que le viene bien.

En la mayor parte de los casos, las empresas llaman DEVOPS a los administradores de sistemas reconvertidos capaces de usar herramientas de automatización (de administración de sistemas):
- Terraform
- Ansible
- Puppet
- ...
Pero eso es una aberración... usando el mismo argumentario, llamaría devops a un tester que ahora usa selenium para automatizar pruebas. O a un desarrollador que usa maven para empaquetar su proyecto.

El camino para adoptar una cultura devops... es como el camino para ser un maestro jedi... largo y tortuoso! Lleva años a una empresa.
Y voy poco a poco.
Empezaré por la A: 
- Automatizar el empaquetamiento de mi proyecto.
   Cuando consigo que mis desarrolladores pongan su código en un SCM (git) y que el código se compile y se empaquete automáticamente... decimos que estamos haciendo un DESARROLLO AGIL!
    El producto final de un pipeline de desarrollo ágil: Es un paquete (un ejecutable, un war, un jar, un zip, un tar.gz, un apk, un ipa, un dmg, un exe, un msi, un deb...)
- Automatizado la instalación de la última versión del producto que han desarrollado los desarrolladores y colocado en git, en un entorno de pruebas.... y la someto a pruebas automáticas... decimos que estamos haciendo INTEGRACION CONTINUA! (CI: Continuous Integration)
    El producto final de un pipeline de CI: Es un INFORME DE PRUEBAS...
    Ese informe quiero que se genere TODAS LAS MAÑANAS... para: (1)
- Si automatizo la puesta en la mano de mi cliente de mi producto... decimos que estamos haciendo ENTREGA CONTINUA! (CD: Continuous Delivery)
    El producto final de un pipeline de CD: Es un enlace en una web, una entrada en un repositorio de artefactos (nexus, artifactory, jfrog, docker hub, ...)
- Si automatizo también la instalación en el entorno de producción, le llamamo Despliegue Continuo (CD: Continuous Deployment)
    El producto final de un pipeline de CD: Es el producto listo para su uso por mis usuarios
- Si automatizo todo, tenemos un pipeline de DEVOPS completo.

Al final quiero llegar a un pipeline de CD
- Continuos Delivery (Entrega Continua) App para teléfonos móviles
    Cuando el desarrollador dice que su app está lista, quiero la nueva versión publicada en:
    - Play Store
    - App Store
- Continuos Deployment (Despliegue Continuo) Servicio / App web que monto en mi empresa
    Cuando el desarrollador dice que su app está lista, quiero la nueva versión instalada en:
    - En mi servidor de producción para que los usuarios puedan acceder ya a esa nueva versión.

Para llegar a eso, tengo que tener MUCHA, MUCHISIMA confianza en mi producto
Esa confianza me la dan las pruebas.
Las pruebas de software han tomado un papel fundamental en el mundo del software.

Una prueba crítica a día de hoy es la de CALIDAD DE CODIGO, la que hacemos con SonarQube.
Ya dijimos que el problema gordo NO ES MONTAR UN SOFTWARE, sino diseñarlo para que sea fácilmente mantenible:
- Que sea fácil de entender
- Que sea fácil de modificar
- Que sea fácil de ampliar

Para ello seguiré buenas prácticas, arquitecturas, patrones de diseño, etc.
- Principios SOLID de desarrollo de software
- Principios FIRST de desarrollo de pruebas de software
- Arquitecturas Clean, Hexagonal, Onion, ...
- Refactoring

Antiguamente tenía en el equipo un personaje bastante introvertido, con canas, llamado desarrollador SENIOR... que era el que se encargaba de que el código fuera de calidad.
Cuando unos junior montaban un código, se lo pasaban al senior para que lo revisara y le diera el visto bueno.

Hoy en día ese trabajo lo hace SONARQUBE.

Lo usaré para 2 cosas:
- Para que diariamente me vaya generando un INFORME DE PRUEBAS de calidad de código, dentro de un pipeline de CI. Quiero todas las mañanas el código analizado con su informe.
  Si el desarrollador se acostumbra a ir mirando ese informe cada mañana (tarda 10 minutos) va resolviendo los problemas según aparecen... y de paso aprende un huevo de programación.
  Y al aprender, ya no cometo de nuevo esos errores.... y cada vez voy generando mejor código.
- Cuando vaya a subir el sistema a producción ... o a generar la release que pongo en manos de mis clientes... En ese momento uso el sonar para emitir un veredicto sobre el código: 
  - El código es APTO 
  - El código NO ES APTO
  Y hoy en día ese trabajo está automatizado... y si sonar dice que el código no es apto, ya puedo llorar a San Pedro que el código no se sube a producción. 

# Metodologías ágiles

Antiguamente, a la hora de gestionar un proyecto de software usábamos lo que denominamos hoy en día METODOLOGIAS TRADICIONALES (metodologías en cascada/waterfall y sus variantes: espiral, v...).

Estas metodologías planteaban el proyecto como una secuencia de etapas, donde cada etapa se iniciaba una vez finalizada la anterior. De hecho se consideraba que el software que estaba construyendo iba avanzado en esa secuencia de etapas... Es decir, se encontraba en un momento dado en una de las etapas.

    Toma de requisitos >
        Plan > 
            Análisis >
                Diseño >
                    Construcción >
                        Pruebas >
                            Implantación >
                                Mantenimiento

Qué problema nos encontramos con estas metodologías? El problema es que no tienen una vuelta atrás... no hay forma de obtener feedback de los usuarios/cliente del producto a tiempo. Y se junta con un problema que tenemos en el mundo del software: Requisitos cambiantes. 

## Metodologías ágiles

Se basan en el concepto de entrega incremental de un producto de software.

Al dia 20 de comenzar un desarrollo, se hace la primera instalación en producción.
Instalación que debe ser 100% funcional.
    Quizás solo entrego el 5% de la funcionalidad... pero 100% funcional.
    Requiere pruebas... a nivel de producción! 
A los 15 días hago una segunda entrega (nueva instalación en producción)
    +10% de la funcionalidad
    Requiere pruebas... a nivel de producción! 10% + 5% = 15%
A los 15 días hago una tercera entrega
    +5% de la funcionalidad    
    Requiere pruebas... a nivel de producción! 5% + 15% = 20%
A los 15 días hago una cuarta entrega
    +10% de la funcionalidad
    Requiere pruebas... a nivel de producción! 
...
Y poco a poco te voy dando el producto entero... Si es que acaso eso tiene sentido.
Una de las cosas que hoy en día han cambiado es el entender a un producto de software como un ser vivo:
    - NACE
    - Va creciendo
    - En un momento morirá

En la metodología ágil más usada a día de hoy (SCRUM) se le llama de SPRINTS. 

Un sprint es un periodo de tiempo en el que se desarrolla una funcionalidad del producto. 

Spring 1: **En fecha**: 15 de Febrero
          Requisitos: R1, R3, R4, R8

            Qué pasa si llego al 15 de febrero y no está acabado el R8?
            Se sube a producción el R1, R3, R4...
            Y el eR8 se deja para el siguiente Sprint

HITO 1:   En fecha: 15 de Febrero
          **Requisitos**: R1, R3, R4, R8

          Qué pasaba si el día 15 de febrero no estaban esos requisitos implantados?
          - Sonaban las alarmas
          - Caían ostias pa' tos los laos
          - Se replanificaba el hito1. Nueva fecha: 21 de Febrero.

Una consecuencia de adoptar una metodología ágil es que el número de pruebas y de instalaciones crece exponencialmente.

De donde saco la pasta? y los recursos? y el tiempo? No la hay... ni pasta, ni tiempo, ni recursos. SOLUCIÓN: Automatizar TODO lo que pueda automatizar:
- Pruebas
- Instalaciones
- Empaquetamiento de un proyecto

### Extraído del manifiesto ágil:

> El software funcionando es la MEDIDA principal de progreso.

la MEDIDA principal de progreso es el "software funcionando"
La forma en la que voy a medir (a determinar) qué tal va mi proyecto, es el concepto "software funcionando" -> Esta frase define un INDICADOR/MEDIDA de progreso.

Antiguamente, la medida de progreso era el número de requisitos que se habían implantado -> Se sacaba del desarrollador.

Hoy en día, para determinar el grado de avance de un proyecto, usamos el concepto software funcionando, es decir: software que funciona, que hace lo que tiene que hacer.

Quién dice que un software funciona? Las pruebas

# SonarQube

Es una herramienta de análisis estático de código que nos permite detectar problemas de calidad en el código fuente.

Entra dentro de lo que llamamos herramienta de automatización de testing.

Sonarqube es una herramienta que montamos en un servidor. 
- Accedemos a ella a través de un navegador web.
- También ofrece una serie de servicios WEB para su integración con otras herramientas de automatización: Jenkins
- Tenemos a nuestra disposición una serie de plugins que podemos incluir en entornos de desarrollo (IDEs) para que nos vaya avisandode algunos (no todos) los problemas que tenemos en el código fuente: SonarLint:
  - Visual Studio Code
  - IntelliJ
  - Eclipse
  - Visual Studio
  Esta herramienta no hace un análisis de código fuente con tanta profundidad como lo hace SonarQube... pero nos va avisando de algunos problemas, para que los pueda ir resolviendo a medida que los voy cometiendo.
  Eso si... al final me interesa pasar con regularidad el código por SonarQube para que me haga un análisis más profundo.
  Habitualmente se hace en un pipeline de CI en automático (todas las mañanas/noches) => Informe de pruebas de calidad de código (Web)

El análisis del código es SOLAMENTE ESTÁTICO.
SonarQube no ejecuta el código... no lo pone en funcionamiento.
SOLO LO LEE, igual que haría un desarrollador senior.

Como resultado del análisis, SonarQube nos genera un informe de pruebas de calidad de código:
- Smell Code (Código que atufa, que apesta... que es una mierda!) y que es necesario cambiar.
  Habitualmente, el smellcode se refiere a malas prácticas de programación:
    - Código que no sigue estándares de nomenclatura:
      JAVA: Se utiliza camelCase para denominar las variables
            En cambio para las constantes se utiliza UPPER_CASE
                    numeroDeIteraciones
      En python no es así.
        - Las variables se escriben con snake_case
                    numero_de_iteraciones
      El seguir unas prácticas aceptadas y consistentes por la comunidad de desarrolladores, hace que el código sea más fácil de entender.
    - Patrones de diseño poco convenientes
- Bugs: Variables no inicializadas, liberadas...
- Cobertura del código: Qué porcentaje del código está cubierto por pruebas unitarias automatizadas? Las empresas suelen establecer un límite inferior entorno al 80%
    Sonarqube NO EJECUTA PRUEBAS DINÁMICAS... es más, le importa un huevo si las pruebas dan un resultado satisfactorio o no... NO SE TRATA DE ESO... solo de asegurar que tengo pruebas.
    No obstante, para poder calcular la cobertura, sonar necesita de lo que denominamos un informe de cobertura de pruebas unitarias.
        Necesitaré una herramienta externa a SonarQube que ejecute las pruebas unitarias, genere el informe de cobertura y se lo pase a SonarQube.... Sonarqube básicamente pinta un numerito en pantalla en este caso... leído del informe de cobertura.
        Ese informe habitualmente se genera en un formato estándar: XML, con un esquema XML muy concreto: Informe JaCoCo
- Vulnerabilidades en el código:
  - SQL Injection: El usuario introduce un dato, que es directamente ejecutado en una consulta SQL
  - Problemas que tenga en una de las librerías que uso.
    - Oye, se ha detectado que tal versión de la librería que has utilizado tiene un problema de seguridad... Actualiza a tal otra versión
- Cantidad de comentarios
- Cantidad de código duplicado
- Complejidades:
  - Complejidad ciclomática: Se entiende como el número de caminos diferentes que puede tomar un bloque de código (función) al ejecutarse

        funcionA 
            SI(condicion1):
                tarea1
                SI(condicion2):
                    tarea2
                SI NO, SI SE CUMPLE(condicion3):
                    tarea3
            SINO
                tarea4
                SI(condicion5):
                    tarea5
                SI(condicion6):
                    tarea6
            tarea7

        Complejidad ciclomática? 7
            CAMINO 1 condicion1 -> tarea1 -> condicion2 -> tarea2 -> tarea7
            CAMINO 2 condicion1 -> tarea1 -> no condicion2, pero si condicion3 -> tarea3 -> tarea7
            CAMINO 3 condicion1 -> tarea1 -> no condicion2, ni condicion3 -> tarea7
            CAMINO 4 no condicion1 -> tarea4 -> condicion5 -> tarea5 -> condicion6 -> tarea6 -> tarea7
            CAMINO 5 no condicion1 -> tarea4 -> condicion5 -> tarea5 -> no condicion6 -> tarea7
            CAMINO 6 no condicion1 -> tarea4 -> no condicion5 -> Si condicion 6 -> tarea6 -> tarea7
            CAMINO 7 no condicion1 -> tarea4 -> no condicion5 ni condicion6 -> tarea7
        
        Yo no elijo la complejidad ciclomática de mi código. Viene dada por los requisitos que me han dado.
        La complejidad ciclomática tiene que ver con EL NUMERO MINIMO de pruebas que tengo que hacer para probar mi código.

        Como he dicho, no elijo la complejidad ciclomática de mi código... pero si puedo hacer unidades más pequeñas de código que tengan una complejidad ciclomática más pequeña.

        funcionA 
            SI(condicion1) funcionB
            SINO funcionC
            tarea7

        funcionB
                tarea1
                SI(condicion2):
                    tarea2
                SI NO, SI SE CUMPLE(condicion3):
                    tarea3
        funcionC
                tarea4
                SI(condicion5):
                    tarea5
                SI(condicion6):
                    tarea6

    Sonar se quejará si escribimos bloques de código con una complejidad ciclomática muy alta.
    Y me invitará (por real decreto) a que divida ese bloque de código en bloques más pequeños.

  - Complejidad cognitiva: Es una estimación de cómo de complejo es para un ser humano entender un código
  
        select case/switch(variable):
            caso1:
                tarea1
            caso2:
                tarea2
            caso3:
                tarea3
            caso4:
                tarea4
            caso5:
                tarea5
            caso6:
                tarea6
            caso por defecto:
                tarea por defecto

        Complejidad ciclomática? 7
        En cambio, qué código es más fácil de entender? el de antes con 7 ifs anidados... o éste? ESTE ES MÁS FÁCIL DE ENTENDER
    
        Sonar se quejará si escribimos bloques de código con una complejidad cognitiva muy alta.
        Y me invitará (por real decreto) a que divida ese bloque de código en bloques más pequeños o a simplificarlo.


  Esas complejidades no tienen nada que ver con lo que antiguamente se estudiaba (y en muchos sitios se sigue estudiando) llamado ORDEN DE COMPLEJIDAD de un algoritmo. Ésto tiene que ver con el cómo crece el tiempo de ejecución de un algoritmo en función del número de elementos que se procesan.... es útil si desarrollo una BBDD.

Es importante entender que sonar también se puede equivocar... y darnos falsos positivos:
Detectar como problemas cosas que no son problemas... al menos en mi caso de uso.

Tendremos la oportunidad de revisar todos los problemas que nos identifique el Sonar y decirle si le hacemos caso... o no... y por qué.

Habrá distintos perfiles de usuario, para evitar que ésto sea un coladero.

Con todos los problemas que identifique sonar en mi código realizará una estimación del tiempo que necesito invertir para su resolución: DEUDA TÉCNICA

Se tasa en horas de trabajo. Tu proyecto tiene una deuda técnica de 100 horas. 
Eso significa que si no haces nada, en el futuro necesitarás en torno a 100 horas para resolver todos los problemas que has ido acumulando en tu código.... y ten claro que ese momento llegará: Ley de Murphy.

Se le llama deuda porque en el futuro tendrás que pagarla... y con intereses.
La deuda se calcula con INTERESES por sonarqube.
Esto hace que en ocasiones nos parezca descabellado el tiempo que nos da sonarqube para resolver los problemas que nos ha detectado.... por ejemplo:
- Tal variable la tienes mal nombrada... y te dice que necesitas 10 minutos para resolverlo.
  Y yo pienso... joder... que pasada el sonar... si entro y tardo en cambiar ese nombre 10 segundos.... y me dice que necesito 10 minutos.
  Claro... necesito 10 segundos: YO, EN MI MAQUINA, AHORA.
  Si lo hace dentro de un año otra persona, que no tiene si quiera el proyecto descargado en su máquina... y necesita después ejecutar las pruebas, y desplegar el sistema en producción... quizás 10 minutos son pocos... y me llevo 5 horas
La deuda técnica la pagaré cuando:
- Ahora que no tengo tiempo... pero lo saco     10 segundos.
- Tenga tiempo
- Cuando haya que hacer un evolutivo del proyecto... por otra persona o por mi mismo en 5 meses... que ya ni me acuerdo del código que escribí.
- Cuando tenga el sistema en producción, haya un fallo y haya que resolverlo + horas de trabajo por un tubo.

De cada análisis, sonarqube calcula:
- El total de bugs, deuda técnica, smell code, vulnerabilidades, duplicados, complejidad, comentarios, cobertura, etc.
  que tengo en el código del proyecto
- El número de bugs, deuda técnica, smell code, vulnerabilidades, duplicados, complejidad, comentarios, cobertura, etc. que he añadido en el último análisis

Los administradores de Sonarqube (no me refiero a los técnicos de sistemas... normalmente gente de testing con conocimientos profundos de programación) pueden establecer unos umbrales de calidad de código para el proyecto:
Quality GATE:
- Para que un código se considere APTO debe:
  - Tener un número de bugs menor a 5
  - Tener una cobertura de código superior al 80%

Estas configuraciones se hacen a nivel global... aunque pueden particularizarse para un proyecto concreto.
Además, se definen 2 juegos de reglas independientes:
- Un juego de reglas que aplican sobre TODO EL CODIGO del proyecto
- Un juego de reglas que aplican sobre el código que va siendo añadido

No es lo mismo un proyecto que empieza hoy... y que voy a someter desde el principio a Sonar.
Que un proyecto que tiene 10 años... y que tendrá mierda por un tubo... QUE AHORA no me puedo ni plantear el resolver: CODIGO LEGACY.

Hay muchas versiones de Sonarqube:
- Community Edition: Es la versión gratuita. Es la que usaremos en el curso.
   Y es capaz de analizar más de 20 lenguajes de programación: C#, Java, JS, Py
   Solo se permite analizar la rama master del proyecto en git.
   Sonar lee el código de un SCM (git) y lo analiza.
- Developer Edition: Es de pago. Tiene más funcionalidades que la Community Edition
  Sonar analizará el código de todas las ramas del proyecto en git.
- Enterprise Edition: Es de pago. Tiene más funcionalidades que la Developer Edition
  Principalmente soporte para otros lenguajes de programación: Cobol, RPG, PL/SQL, ABAP, T-SQL, ...

De cara a mandar el código a SonarQube, hay 2 formas de hacerlo:
- Mediante un programa que sea capaz de mandar el código a sonarqube:
  - Java: Maven
  - .net: msbuild
  - otros lenguajes: sonnar-scanner ( Se instala en la máquina desde donde se manda el código, que puede ser la del desarrollador o la del tester... u otras)
- Directamente haciendo que sonar lea el código de un repositorio de código fuente:
  - Git

Lo primero será montar un Sonar en una máquina:
- Vamos a hacer una instalación de pruebas. No una instalación apta para producción.
    Aunque si vamos a seguir un procedimiento recomendado por la propia gente que hace sonar.
- Os contaré cómo haríamos un despliegue en producción: Kubernetes
