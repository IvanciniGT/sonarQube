# Tranformarnos en root (superusuario)
sudo su -


chmod 777 -R /home/ubuntu/environment/data
# Una vez somos root, configuramos algunas variables que hacen falta en la maquina
sysctl -w vm.max_map_count=262144
sysctl -w fs.file-max=65536
ulimit -n 65536
ulimit -u 4096

exit
