echo "Crear directorio 'data-helper', <presionar ENTER>"
read
sudo mkdir data-helper

echo "Crear script de backup de MySQL 'data-helper/runBackupMysql.sh', <presionar ENTER>"
read
cat << 'EOF' | sudo tee  data-helper/runBackupMysql.sh
DATE="$(date +%F_%T)"
mysqldump  --no-tablespaces -u $WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD -h $MYSQL_DB_HOST $WORDPRESS_DB_NAME  > /mnt/data-helper/"$WORDPRESS_DB_NAME"_"$DATE".sql
echo "Se ha creado el backup:  " "$WORDPRESS_DB_NAME"_"$DATE".sql
EOF
echo "Poner permisos de ejecucion y dueño  '8877:27' al directorio y script creados, <presionar ENTER>"
read
sudo chmod +x ./data-helper/runBackupMysql.sh
sudo chown -R 8877:27 ./data-helper
