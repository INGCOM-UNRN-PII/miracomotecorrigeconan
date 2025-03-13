#!/usr/bin/bash

repo="$1-submissions/$2"
git_repo="INGCOM-UNRN-PII/$2.git"

printf "Procesando '%s'\n\t'%s'\n\n" "$repo" "$git_repo"

if [ -d "$repo" ]; then
    printf "git pull en el repositorio '%s'\n" "$repo"
    git -C "$repo" restore "*"
    git -C "$repo" pull

    git_pull_output=$(git -C "$repo" pull 2>&1)

    if [[ $git_pull_output == *"Already up to date."* || $git_pull_output == *"Ya está actualizado."* ]]; then
        printf "El repositorio ya estaba actualizado.\n"
    else
        printf "No se puede continuar, ha ocurrido un error en git.\n"
        printf "Git dice\n: %s\n" "$git_pull_output"
        exit 2
    fi

    printf "OK\n"

else
    printf "No existia, intentando "
    git clone https://github.com/"$git_repo" "$repo"
fi
