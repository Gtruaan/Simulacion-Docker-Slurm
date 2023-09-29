# Cosas choras

## Docker compose

### Script para levantar los contenedores

```bash
sudo sh scripts/rebuild.sh
```

### Conectarse directo al contenedor de node-master

```bash
sudo docker exec -it node-master bash
```

### Cerrar los contenedores

```bash
sudo docker compose down
```

alternativamente (si no funciona el anterior)

```bash
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q -f status=exited)
```

## Cluster

### Script para conectarse al nodo master por *SSH*

Por default se conecta a `root`. La contraseña es `1111`.
    
```bash
sudo sh scripts/connect-master.sh
```
