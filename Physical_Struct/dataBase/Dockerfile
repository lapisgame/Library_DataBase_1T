FROM postgres:latest
ENV POSTGRES_USER=lapis
ENV POSTGRES_PASSWORD=QWErty777
ENV POSTGRES_DB=lapisdb

COPY init_scripts/create_table_initial_script.sql /docker-entrypoint-initdb.d/create_table_initial_script.sql
COPY init_scripts/insert_data_script.sql /docker-entrypoint-initdb.d/insert_data_script.sql