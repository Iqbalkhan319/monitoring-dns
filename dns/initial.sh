#!/bin/bash
docker network create frontend-net &> /dev/null
docker volume create dns-data
