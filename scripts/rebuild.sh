docker compose down
docker rmi node-master
docker rmi node-slave
cd ./node-master
docker build -t node-master .
cd ../node-slave
docker build -t node-slave .
cd ..
echo "Rebuild completado :) Iniciando contenedores..."
docker compose up -d
