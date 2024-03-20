#!/usr/bin/bash

echo "Procesando comentarios de corrección para tp2-2024-submissions/$1"

if [ -d "tp2-2024-submissions/$1" ]; then

    gh pr comment https://github.com/INGCOM-UNRN-PII/$1/pull/1 -F $1.md
    echo https://github.com/INGCOM-UNRN-PII/$1/pull/1/files
    
fi
