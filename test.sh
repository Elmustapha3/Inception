#!/bin/bash


mariadb

GRANT ALL ON *.* TO 'must'@'localhost' IDENTIFIED BY 'mustpass' WITH GRANT OPTION

show databases;

echo "----------------------------"

create database mustaphadb

show databases;