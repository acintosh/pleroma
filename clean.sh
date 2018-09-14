rm -rf ./uploads
rm -rf ./pleroma
rm -rf ./config
rm -rf ./priv
sudo docker-compose down -v --rmi all
sudo rm -rf ./postgres
