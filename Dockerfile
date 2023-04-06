#
FROM ubuntu:latest


RUN apt-get update && \
    apt-get install -y postgresql postgresql-contrib 


ENV POSTGRES_USER myuser
ENV POSTGRES_PASSWORD mypassword
ENV POSTGRES_DB mydatabase
RUN service postgresql start && \
    su - postgres -c "psql -c \"CREATE USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';\"" && \
    su - postgres -c "createdb -O $POSTGRES_USER $POSTGRES_DB"


EXPOSE 5432


CMD ["postgres", "-D", "/etc/postgresql/13/main", "-c", "config_file=/etc/postgresql/13/main/postgresql.conf"]

