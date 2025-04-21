#!/bin/bash

# Script para buscar problemas aleatorios de Codeforces con dificultad entre 800 y 900

# Colores para la salida
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Descargar la lista de problemas de Codeforces
echo -e "${YELLOW}Descargando lista de problemas de Codeforces...${NC}"
wget -q https://codeforces.com/api/problemset.problems -O problems.json

# Verificar si la descarga fue exitosa
if [ ! -f "problems.json" ]; then
    echo -e "${RED}Error: No se pudo descargar la lista de problemas. Verifica tu conexión a internet.${NC}"
    exit 1
fi

# Filtrar problemas con dificultad entre 800 y 900
echo -e "${YELLOW}Filtrando problemas de nivel 800 a 900...${NC}"
jq -r '.result.problems[] | select(.rating >= 800 and .rating <= 900) | "\(.contestId)\(.index) - \(.name) (Dificultad: \(.rating))"' problems.json > filtered_problems.txt

# Verificar si hay problemas en ese rango
if [ ! -s "filtered_problems.txt" ]; then
    echo -e "${RED}No se encontraron problemas en el rango de dificultad 800-900.${NC}"
    rm problems.json filtered_problems.txt
    exit 1
fi

# Contar el número de problemas disponibles
total_problems=$(wc -l < filtered_problems.txt)
echo -e "${GREEN}Se encontraron $total_problems problemas en el rango 800-900.${NC}"

# Seleccionar un problema aleatorio
random_problem=$(shuf -n 1 filtered_problems.txt)

# Extraer el ID del problema para formar la URL
contest_id=$(echo "$random_problem" | awk '{print $1}' | sed 's/[^0-9]*//g')
problem_index=$(echo "$random_problem" | awk '{print $1}' | sed 's/[^A-Z]*//g')

# Mostrar el problema seleccionado
echo -e "\n${GREEN}Problema seleccionado aleatoriamente:${NC}"
echo -e "${YELLOW}$random_problem${NC}"
echo -e "${GREEN}URL: https://codeforces.com/problemset/problem/${contest_id}/${problem_index}${NC}"

# Opcional: Limpiar archivos temporales
read -p "¿Deseas eliminar los archivos temporales? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm problems.json filtered_problems.txt
    echo "Archivos temporales eliminados."
fi
