psql

CREATE DATABASE chrip_chrip;
\c chrip_chrip;

CREATE TABLE users (id SERIAL PRIMARY KEY, user VARCHAR(255));
