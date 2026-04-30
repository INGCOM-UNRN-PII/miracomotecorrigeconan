#!/usr/bin/bash

github_repo="$1"

printf "Procesando comentarios de corrección para '%s'\n" "$1"

if [ -z "$3" ]; then
  printf "El formuario no contenia comentario adicional.\n"
else
  printf "\n\n### Comentario en el formulario de entrega\n'%s'\n\n" "$2" >> "$2".md
fi

if [ -z "$4" ]; then
  printf "La entrega es dentro de los plazos establecidos\n"
else
  printf "\n\n\# La entrega esta fuera de plazo, ⏰\n\n" >> "$2".md
fi

if [ -f "$2.md" ]; then
    #glow "$1".md
    firefox -new-tab -url "$github_repo/files" -new-tab -url "$(gh pr comment "$github_repo" -F "$2".md)"
else
    printf "El reporte '%s.md' no fue encontrado\n" "$2"
    printf "\tParece que dredd no pasó por acá aún.\n"
fi
