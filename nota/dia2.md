# Contenedores

Los contenedores son la forma estandar de distribuir y desplegar software empresarial hoy en día.
TODO el software empresarial se distribuye hoy en día mediante contenedores.

## Procedimientos de instalación de software

### Instalación clásica / A hierro

        App1 + App 2 + App3         Problemas:
    --------------------------          - App1 se vuelve loca (BUG) y pone un recurso al 100% -> OFFLINE
         Sistema Operativo                      App2 y App3 van detrás
    --------------------------          - App1, App2 y App3 comparten recursos.
              HIERRO                    - Que tengan incompatibilidades

### Máquinas virtuales

        App1  | App 2 + App3         
    --------------------------      
      SO 1    |     SO 2         
    --------------------------      
      MV 1    |     MV 2         
    --------------------------      
      Hipervisor: 
      VMWare, Citrix, HyperV
      VirtualBox...
    --------------------------      
         Sistema Operativo          
    --------------------------      
              HIERRO                

### Contenedores / Docker

      App1    | App 2 + App3         
    --------------------------      
      C 1     |     C 2         
    --------------------------      
      Gestor de contenedores:
      Docker, Containerd, CRIO
      podman
    --------------------------      
        SO con Kernel Linux          
    --------------------------      
              HIERRO    

## Contenedor

Es un entorno aislado dentro de un Kernel Linux donde ejecuto procesos.
Aislado?
- Cada contenedor tiene su propia configuración de red... y por ende su propia IP
- Cada contenedor tiene sus propias variables de entorno
- Cada contenedor tiene su propio sistema de archivos (lo que sería su HDD)
- Puede tener limitaciones de acceso al hierro (recursos de hardware)

Los contenedores se crean desde IMAGENES DE CONTENEDOR.

## Imágenes de contenedor

Las imágenes de contenedor lo que contienen es un software YA INSTALADO DE ANTEMANO por alguien 
(habitualmente el fabricante del software). Son un triste fichero comprimido.

Se descargan desde REGISTROS DE REPOSITORIOS DE IMAGENES DE CONTENEDOR.

### Ejemplo: Quiero instalar en mi máquina un SQL Server

1. Hacerme con el INSTALADOR
2. Ejecutar ese instalador... que puede ser más o menos complejo
3. Operar el software

    C:\Archivos de programa\SQLServer ---> ZIP ---> EMAIL 
                                            |
                                            v
                                            Imagen de contenedor
                                            
Lo único que hago es descargar ese archivo comprimido, y desplegarlo.
La operación de un software dentro de un contenedor está estandarizada.
Cualquier contenedor, tenga dentro el software que tenga:
- Se arranca igual
- Se para igual
- Se le ven los logs igual

El registro de repositorios de imagenes de contenedor más usado del mundo se llama Docker Hub


---

# Instalación de SonarQube

La instalación de sonar la realizaremos mediante contenedores.

Sonar es un programa cuya instalación es un poquito peculiar... 
No por sonar en si mismo...
Sino por una herramienta que hay dentro de sonar.
- ElasticSearch: Motor de indexación de textos... para hacer búsquedas muy potentes a texto completo (FULL TEXT)

ElasticSearch requiere cambios en el Kernel de Linux para funcionar.

# Kubernetes

Cluster de máquinas

Maquina 1
    crio | containerd
Maquina 2
    crio | containerd
Maquina N
    crio | containerd
