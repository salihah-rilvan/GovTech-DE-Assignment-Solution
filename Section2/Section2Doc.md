I already have docker installed in my company previously and using WSL 2.

I am using Ubuntu 20.04 for Windows.

I started my docker engine by typing:

sudo /etc/init.d/docker start

I created postgres database within Docker:
docker run --name postgres-db -e POSTGRES_PASSWORD=docker -p 5432:5432 -d postgres

Host: localhost
Port: 5432
User: postgres
Password: docker

Then, I pulled the postgres docker image:

docker pull postgres