function docker-bash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

function docker-vsftpd() {
  docker run --rm -it -d \
    -v $HOME/docker/ftp/srv:/srv \
    -p 21:21 \
    -p 4559-4564:4559-4564 \
    -e FTP_USER=ftp \
    -e FTP_PASSWORD=ftp \
    --name vsftpd \
    panubo/vsftpd:latest
}

function docker-mysql5() {
  docker run --rm -d \
    -v $HOME/docker/mysql/5/data:/var/lib/mysql \
    -v $HOME/docker/mysql/5/config:/etc/mysql \
    -v /tmp:/tmp \
    -p 3306:3306 \
    -p 33060:33060 \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
    -e MYSQL_DATABASE="$1" \
    --name mysql5 mysql:5
}

function docker-mysql8() {
  docker run --rm \
    -v $HOME/docker/mysql/8/data:/var/lib/mysql \
    -v $HOME/docker/mysql/8/config:/etc/mysql \
    -p 3306:3306 \
    -p 33060:33060 \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=true \
    --name mysql8 mysql:8
}

function docker-mysql5cli() {
  docker exec -it mysql5 mysql $1
}

function docker-mysql8cli() {
  docker exec -it mysql8 mysql $1
}

function docker-redis() {
  docker run --rm -d -p 6379:6379 --name redis redis
}

function docker-rediscli() {
  docker exec -it redis redis-cli
}

function docker-memcached() {
  docker run --rm -d -p 11211:11211 --name memcached memcached
}

# The host networking is not supported on mac
function docker-ngrok() {
  docker run --rm -d --name ngrok --net=host -e NGROK_PORT="$1" -e NGROK_DEBUG=true  wernight/ngrok
}

function docker-elasticsearch() {
  docker run --rm -d --name elasticsearch --net=elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:$1
}

function docker-kibana() {
  docker run --rm -d --name kibana --net=elastic -p 5601:5601 kibana:$1
}

function docker-postgres() {
  docker run --rm -d -p 5432:5432 --name postgres-$1 postgres:$1
}

function docker-node() {
	docker run --rm -it --name node -v $(pwd):/app node:current-slim /bin/bash
}
