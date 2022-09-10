#!/bin/bash
docker network create frontend-net
docker volume create dns-data
mkdir /resolv/
