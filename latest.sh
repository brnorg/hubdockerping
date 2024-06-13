#!/bin/bash

# URL da API do Docker Hub
URL='https://hub.docker.com/v2/repositories/pingidentity/pingfederate/tags?page_size=25&page=1&ordering=&name=latest'

# Obtendo os dados JSON usando o curl e filtrando a última versão que segue o padrão
latest_version=$(curl -s "$URL" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+-latest' | sort -V | tail -n 1)

echo "A última versão com o padrão 'x.x.x-latest' é: $latest_version"
