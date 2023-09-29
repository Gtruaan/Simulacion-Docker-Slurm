masterip=$(
    docker inspect \
  -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' node-master
)
echo "Conectando al master en $masterip..."
ssh -o StrictHostKeyChecking=no root@$masterip
