#!/bin/bash

# URL da API do Docker Hub
URL='https://hub.docker.com/v2/repositories/pingidentity/pingfederate/tags?page_size=25&page=1&ordering=&name=latest'

# Obtendo os dados JSON usando o curl e filtrando a última versão que segue o padrão
latest_versions=()
while IFS= read -r line; do
    if [[ $line =~ [0-9]+\.[0-9]+\.[0-9]+-latest ]]; then
        latest_versions+=("$line")
    fi
done < <(curl -s "$URL" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+-latest')

# Ordenar as versões e pegar a última
latest_version=$(printf "%s\n" "${latest_versions[@]}" | sort -V | tail -n 1)

echo "A última versão com o padrão 'x.x.x-latest' é: $latest_version"
