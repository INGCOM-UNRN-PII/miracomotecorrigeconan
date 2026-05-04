#!/usr/bin/bash

# Function to display help
show_help() {
    printf "Uso: ./comment.sh <informe> <github_repo> [opciones]\n\n"
    printf "Argumentos obligatorios:\n"
    printf "  <informe>          Nombre del archivo de informe (sin .md)\n"
    printf "  <github_repo>      URL o identificador del repositorio de GitHub\n\n"
    printf "Opciones:\n"
    printf "  --pull=<n>         Número del Pull Request (por defecto: 1)\n"
    printf "  --comentario=\"<s>\" Comentario adicional para el informe (opcional)\n"
    printf "  --plazo=<0|1>      Estado de la entrega: 1 = fuera de plazo, 0 = a tiempo (por defecto: 0)\n"
    printf "  --help             Muestra este mensaje de ayuda\n\n"
    printf "Ejemplo:\n"
    printf "  ./comment.sh mi_informe INGCOM-UNRN-PII/tp1-2026-alumno --pull=2 --plazo=1 --comentario=\"Faltó un ejercicio\"\n"
}

# Check for help or missing mandatory arguments
if [[ "$1" == "--help" ]] || [[ -z "$1" ]] || [[ -z "$2" ]]; then
    show_help
    exit 0
fi

# Default values
informe=$1
github_repo="$2"
pull_number=1
comentario=""
plazo=""

# Shift the first two positional arguments (informe and github_repo)
shift 2

# Parsing named arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --pull=*) pull_number="${1#*=}"; shift ;;
        --comentario=*) comentario="${1#*=}"; shift ;;
        --plazo=*) plazo="${1#*=}"; shift ;;
        --help) show_help; exit 0 ;;
        *) printf "Parámetro desconocido: %s\n" "$1"; show_help; exit 1 ;;
    esac
done

printf "Procesando comentarios de corrección para '%s' (PR #%s)\n" "$informe" "$pull_number"

if [ -z "$comentario" ]; then
  printf "El formulario no contenia comentario adicional.\n"
else
  printf "\n\n### Comentario en el formulario de entrega\n'%s'\n\n" "$comentario" >> "$informe".md
fi

# Plazo logic: 1 for late, 0 or empty for on time
if [[ "$plazo" == "1" ]]; then
  printf "\n\n# La entrega esta fuera de plazo, ⏰\n\n" >> "$informe".md
else
  printf "La entrega es dentro de los plazos establecidos\n"
fi

if [ -f "$informe.md" ]; then
    #glow "$1".md
    printf "Enviando comentario al PR #%s en %s...\n" "$pull_number" "$github_repo"
    firefox -new-tab -url "$github_repo/pull/$pull_number/files" -new-tab -url "$(gh pr comment "$pull_number" --repo "$github_repo" -F "$informe".md)"
else
    printf "El reporte '%s.md' no fue encontrado\n" "$informe"
    printf "\tParece que dredd no pasó por acá aún.\n"
fi
