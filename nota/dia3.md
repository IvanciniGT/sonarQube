Hemos automatizado:
- La ejecución de algunas pruebas mediante: Un framework de pruebas llamado JUnit en JAVA
- La invocación de esos programas de prueba: mvn test
- La generación de un informe de cobertura de pruebas: mvn jacoco:report (que adicionalmente se invoca en automático desde mvn verify)
- El envío de nuestro código + informe de cobertura a Sonar: mvn sonar:sonar

Quién sería un buen perfil para hacer estas automatizaciones? DESARROLLADOR

Otro tema es...
Ya tengo todo (lo referente a este trabajo) automatizado? NO
Por qué? porque sigo teniendo que ejecutar yo a manita esos comandos en una terminal.

- mvn test
- mvn jacoco:report
- mvn sonar:sonar \
     -Dsonar.host.url=http://localhost:8080 \
     -Dsonar.login=squ_961d0f79d23f47823d2573a3cb86bb301c7be74f

Ese trabajo me gustaría también automatizarlo: Pipeline de Integración Continua:
- Extraer mi código en un entorno limpio de pruebas desde git
- Ejecutar todos esos comandos
- Generar un informe de pruebas <<< PRODUCTO de un Pipeline de CI

Evidentemente para montar este trabajo necesito previamente las otras automatizaciones:
- El poder ejecutar pruebas AUTOMATICAMENTE
- El ser capaz de mandar mi proyecto a sonar AUTOMATICAMENTE
- El ser capaz de generar un informe de cobertura AUTOMATICAMENTE

Aquí es donde entra una herramienta tipo JENKINS o AZURE DEVOPS (alternativa a Jenkins de la mano de Microsoft)
Estas herramientas son las que serían configuradas por ese perfil llamado DEVOPS.

En estas herramientas (JENKINS, AZURE DEVOPS)... lo que hacemos es solicitar la ejecución de esos automatismos bajo ciertas condiciones:
- Cuando se haga un nuevo commit en el repo de git
- A las 9am todos los días.
- ...

Si configuro un pipeline de CI, el objetivo es disponer de un informe de pruebas que me permita ver la evolución del proyecto.
Hay algún problema si las pruebas unitarias que se ejecutan funcionan mal? Esto va a ser lo habitual
Yo estoy haciendo código... Estoy 1 mes picando código... y las pruebas irán funcionando / o no...
Mientras creando código, tampoco hay problema con que sonar identifique cosas que no se están construyendo de la mejor forma: REFACTORIZACION

    ¿Qué tal voy? y lo quiero todos los días
    Mandaré el código a Sonar... a ver que me cuenta

Otra cosa diferente será si quiero montar un pipeline de CD (Continuous delivery): Entrega continua, donde ya voy a poner AUTOMATICAMENTE en manos 
de mi cliente la última versión de mi producto para que la monte en su entorno de producción.
Qué pasa aquí si las pruebas fallan?
Qué pasa aquí si el código no tiene una buena calidad? 
    PROBLEMON. No debería permitirse que ese código pase a producción.

    Ahí la llevas! listo para producción... y esto no lo quiero todos los días... lo quiero 1 vez al mes.. cuando el desarrollador diga que nos vamos !
    Mando el código a Sonar. a ver si le da el visto bueno o no... Si no se lo da, el artefacto (ejecutable) no se publica
    
Podría ir a más... y montar un pipeline de Despliegue continuo (Continuous Deployment), donde monto AUTOMATICAMENTE EN PRODUCCION la última 
versión disponible del sistema.
Esto por ejemplo tiene sentido si monto un microservicio web dentro de mi empresa...
O si monto una aplicación web dentro de mi empresa.

No tendría sentido si lo que estoy haciendo es una app para telefonos moviles... donde mi trabajo consiste en dejar esa app el:
- PlayStore (Android/Google)
- AppStore  (iOS/Apple)
^ Esto acabaría en un pipeline de Entrega Continua

---

Sistema de control de código fuente que necesitamos usar para poner todo esto a funcionar: SCM
Herramientas tipo: GIT / SVN / CVS / Mercurial / TFS

A día de hoy la herramienta es GIT

A la hora de trabajar con git, al igual que con otro SCM, necesitamos definir la forma de trabajar con esa herramienta.
En el mundo git es lo que llamamos el GITFLOW.... y desgraciadamente se le da a día de hoy aún poca importancia al gitflow.

Básicamente nos referimos al esquema de ramas que vamos a usar en git... y a cómo hacemos los transpasos de commits de unas ramas a otras.
Condiciona totalmente los pipelines de CI/CD que vamos a montar.

COMMIT en git: Es una fotografía/copia de seguridad completa de un proyecto en un momento dado del tiempo.
Como si hubiera comprimido toda la carpeta de mi proyecto en un zip... y lo guardo.

Los commit los guardamos en RAMAS... secuencialmente.

RAMA: Una rama es una linea de evolución paralela en el tiempo de mi proyecto.

Habitualmente usamos una RAMA llamada: master > main (antiguamente se llamaba trunk)
Esa rama tiene unas condiciones:
- NUNCA SE PUEDE HACER UN COMMIT DIRECTAMENTE EN ESA RAMA !
- Todo lo que hay en esta rama se asume listo para PRODUCCION

Otra rama es la rama DESARROLLO / DEVELOP / DEVELOPMENT/ DEV. Esta es la rama que incluye todos los cambios que en un momento
dado se están haciendo al código para la siguiente versión que se liberará

Y luego... dependiendo de:
- La empresa
- El tamaño del proyecto
- Metodología que use
- El número de participantes...
solemos crear ramas adicionales. Habituales son:
- Ramas para cada persona / desarrollador
- O Ramas para cada característica que quiero incluir en el desarrollo (requisito)
- O Ramas para las distintas versión que voy a subir a producción.
- A veces varias de estas a la vez


    RAMA: Master/Main                                          C7 (v.2.3.5)   
                                                              /     <<<< Este trabajo lo someteré a un pipeline de automatización
    RAMA: Release 1                                          C7 (Tengo un Release Candidate v.2.3.5-RC1)    Se hacen pruebas de sistema
                                                            /       <<<< Este trabajo lo someteré a un pipeline de automatización
    RAMA: desarrollo    C1 --> C2 --> C3 --> C6 ---------> C7
                                        \                 /         <<<< Esta flecha simboliza la integración del código de ese requisito con el resto del código del proyecto
    RAMA: Requisito1                     \-C3 --> C4 --> C5              Antes de hacer esto, debería asegurar que el código C5 es bueno (1)
                                            ^^^^^^^^^^^^^^
                                            diariamente me puede interesar que el código se vaya mandando al sonar
                                            igual que me puede interesar que se vayan ejecutando por las mañanas las pruebas que hayan sido definidas
                                                PARA DISPONER EN "TIEMPO REAL" de un informe que me permite conocer el estado del proyecto.

    (1) Funcionalmente funciona: Hace lo que tiene que hacer... por si mismo: Pruebas unitarias
        Su calidad sea adecuada: SonarQube
        
    El paso del Commit C5 a la rama desarrollo no debe hacerse a la ligera... Este trabajo solemos automatizarlo!
        Pipeline de desarrollo en una herramienta tipo Jenkins.
            Lo que hay en Requisito1 -> desarrollo
                - Será necesario ejecutar pruebas unitarias... y que vayan bien
                - Será necesario asegurar la calidad del código (Quality gate del SonarQube)
                - Si todo lo anterior va bien, será necesario ejecutar unas pruebas de Integración, para ver que el código nuevo sigue funcionando dentro del código existente
                - Será necesario asegurar que el código previo sigue funcionando después de añadir el cambio: Pruebas de regresión
                
    Una vez el código esté bien... en desarrollo y listo para pasar a producción... antes lo muevo a una rama de tipo RELEASE: R1
    
Esto ha sido un ejemplo de GITFLOW...
Si estoy en un proyecto donde trabajo yo y mi compañero... seguramente no me hacen falta tantas ramas.
Si estoy en un proyecto gestionado por una metodología en cascada no necesito tantas ramas.
En un proyecto que siga una metodología ágil, necesito muchas mas ramas.