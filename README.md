# Semana Omnistack 11 - HERO

Nodejs and React app created to semana omnistack 11

## Installation

#### Docker
```bash
# Instalando Docker no Ubuntu
snap install docker

# IMPORTANTE ========
# Caso de erro de conexão Wi-Fi após instalar o Docker se atente aos seguintes passos:
# 	Edite /etc/NetworkManager/NetworkManager.conf
# 	Adicione:
#		[keyfile]
#		unmanaged-devices=interface-name:docker0
```

#### Servidor
```bash
# Criando uma network para comunicar entre containers
docker network create node-net --subnet=172.100.0.0/16 --gateway=172.100.0.1

# Criando a imagem a partir do Dockerfile
export DUID=$(id -u) && export DGID=$(id -g)
docker build -t semana_omnistack_11 --build-arg USER=$USER --build-arg UID=$DUID --build-arg GID=$DGID --build-arg PW=1234 -f Dockerfile .

# Criando o container a partir da imagem criada
# 	Criando um volume do local atual para dentro de /root/app
#	Adicionando a network criada ao container
# 	Abrindo as portas 3001, 3333 e 3000
docker run -it --name semana_omnistack_11 -v /home/${USER}/app --network=node-net -p 3000:3000 -p 3001:3001 -p 3333:3333 -d semana_omnistack_11

# Parando o container
docker stop semana_omnistack_11

# Iniciando o container usando o bash
docker start -i semana_omnistack_11

# Commitando o container 
# docker tag semana_omnistack_11 lgehlen/semana_omnistack_11:version1.0
# docker push lgehlen/semana_omnistack_11:version1.0
```

#### Mongo
```bash
# Puxando imagem do mongodb
docker pull mongo

# Criando container do mongodb
#	Adicionando a network criada ao container
# 	Abrindo as portas 27017 (saida padrão do mongo)
docker run --name mongodb --network=node-net -p 27017:27017 -d mongo

# Iniciando mongodb 
docker start mongodb

```
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
