# Docker Nextcloud customized Image

Customized Nextcloud Docker image for support zipper, extract, inotify Apps

##Usage

Composer.yml
```
version: '3.2'

volumes:
  nextcloud:
  db:

services:
  db:
    image: mariadb
    restart: always
    command: --transaction-isolation=READ-COMMITTED --binlog-format=ROW
    volumes:
      - /opt/nextcloud/db:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=<root password>
      - MYSQL_DATABASE=<database name>
      - MYSQL_USER=<database user>
      - MYSQL_PASSWORD=<user password>

  app:
    image: rfbeskow/nextcloud-custom:stable

    restart: always
    ports:
      - 8090:80
    links:
      - db
    volumes:
      - /opt/nextcloud/app:/var/www/html
    environment:
      - MYSQL_DATABASE=<database name>
      - MYSQL_USER=<database user>
      - MYSQL_PASSWORD=<user password>
      - MYSQL_HOST=db  
```

##For Customize
```
git clone https://github.com/engtro/nextcloud-custom.git
cd nextcloud-docker
```
**Edit Dockerfile as your needs**
```
docker build -t rfbeskow/nextcloud .
```