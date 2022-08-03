FROM postgres
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB carsales
COPY carsales.sql /docker-entrypoint-initdb.d/
