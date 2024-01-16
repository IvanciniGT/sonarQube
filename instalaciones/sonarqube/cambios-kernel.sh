# Tranformarnos en root (superusuario)
sudo su -


chmod 777 -R /home/ubuntu/environment/data
# Una vez somos root, configuramos algunas variables que hacen falta en la maquina
sysctl -w vm.max_map_count=262144
sysctl -w fs.file-max=65536
ulimit -n 65536
ulimit -u 4096

# Para que estos parámetros tengan persistencia, habría que modificar algunos ficheros de configuración del SO:
# VER https://www.elastic.co/guide/en/elasticsearch/reference/current/system-config.html

exit
