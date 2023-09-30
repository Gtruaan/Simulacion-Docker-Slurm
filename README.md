# Cosas choras

* [Generador del archivo `slurm.conf`](https://slurm.schedmd.com/configurator.html)
* [Quickstart SLURM](https://slurm.schedmd.com/quickstart_admin.html)

## Docker compose

### Script para levantar los contenedores

**Nota**: Este script demora mucho en ejecutarse la primera vez.

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

## SLURM

### Correr el trabajo de prueba

Se puede editar este trabajo de prueba en `/node-master/test-job`.

```bash
salloc -N 2 bash
sbcast /test-job/job.py /tmp/job.py
srun python3 /tmp/job.py
srun rm /tmp/job.py
```