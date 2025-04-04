#!/usr/bin/bash

github_repo=https://github.com/INGCOM-UNRN-PII/"$1"/pull/1

printf "Procesando comentarios de corrección para '%s'\n" "$1"

if [ -z "$2" ]; then
  printf "El formuario no contenia comentario adicional.\n"
else
  printf "\n\n### Comentario en el formulario de entrega\n'%s'\n\n" "$2" >> "$1".md
fi

if [ -z "$3" ]; then
  printf "La entrega es dentro de los plazos establecidos\n"
else
  printf "\n\n\# La entrega esta fuera de plazo, ⏰\n\n" >> "$1".md
fi

if [ -f "$1.md" ]; then
    #glow "$1".md
    firefox -new-tab -url "$github_repo/files" -new-tab -url "$(gh pr comment "$github_repo" -F "$1".md)"
else
    printf "El reporte '%s.md' no fue encontrado\n" "$1"
    printf "\tParece que dredd no pasó por acá aún.\n"
fi
