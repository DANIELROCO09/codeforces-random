# 🧠 Codeforces Random Problem Picker (800-900)

Este script en Bash descarga problemas aleatorios de Codeforces con un rango de dificultad entre 800 y 900. Ideal para practicar problemas fáciles y mejorar habilidades de programación competitiva.

## 🚀 ¿Qué hace?

- Descarga la lista completa de problemas desde la API de Codeforces.
- Filtra solo los problemas con dificultad entre 800 y 900.
- Elige un problema aleatorio del conjunto filtrado.
- Muestra el nombre, dificultad y URL del problema.
- Opción de eliminar los archivos temporales generados.

## 📋 Requisitos

- `bash`
- `wget`
- `jq` (para procesar JSON)
- Conexión a internet

## 🛠 Instalación

1. Clona este repositorio:

```bash
git clone https://github.com/DANIELROCO09/codeforces-random
cd codeforces-random
```
2. Da permisos de ejecución al script:
chmod +x codeforces_random.sh

3. Ejecuta el script:
./codeforces_random.sh

🧼 Limpieza
Al final de la ejecución, se te preguntará si deseas eliminar los archivos temporales (problems.json, filtered_problems.txt).
```
✨ Ejemplo de salida
Descargando lista de problemas de Codeforces...
Filtrando problemas de nivel 800 a 900...
Se encontraron 1234 problemas en el rango 800-900.

Problema seleccionado aleatoriamente:
1234A - Helpful Maths (Dificultad: 800)
URL: https://codeforces.com/problemset/problem/1234/A
```
