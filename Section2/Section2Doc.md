I already have docker installed in my company previously and using WSL 2.

I am using Ubuntu 20.04 for Windows.

I started my docker engine by typing:

unset DOCKER_HOST

sudo /etc/init.d/docker start

I created a Dockerfile with the following typed in:
FROM postgres 
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB carsales
COPY carsales.sql /docker-entrypoint-initdb.d/

carsales.sql refers to my file with all mysql commands to create tables and populate my db  as well.

Creating image:
docker build -t carsales-db ./

To see all images:
docker images -a

Creating a container based on the image:
docker run -d --name carsales-container -p 5432:5432 carsales-db

Running the container:
sudo docker start carsales-container

To run a command in the running container:
docker exec -it carsales-container sh

Logging into psql server:
psql -U postgres carsales

To view all tables in db:
\d

To quit db:
\q

Resources referred:
https://dev.to/andre347/how-to-easily-create-a-postgres-database-in-docker-4moj

https://markheath.net/post/exploring-postgresql-with-docker
