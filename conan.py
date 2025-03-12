#!/usr/bin/python

import os
from datetime import datetime
from pprint import pprint

timestamp = datetime.today().strftime("%Y-%m-%d %H:%M")

archivos = (
    ("ejercicio 1", "informes/java.md", "code"),
    ("ejercicio 2", "informes/HolaApp.md", "code"),
    ("ejercicio 3A", "build/reports/checkstyle/main.html", "exists"),
    ("ejercicio 3B", "build/reports/checkstyle/test.html", "exists"),
    ("ejercicio 3C", "build/reports/pmd/main.html", "exists"),
    ("ejercicio 3D", "build/reports/pmd/test.html", "exists"),
    ("ejercicio 3E", "build/reports/tests/test/index.html", "exists"),
    ("ejercicio 3F", "build/reports/tests/test/classes/ar.unrn.DesordenadoAppTest.html", "exists"),
    ("ejercicio 4", "src/main/java/ar/unrn/DesordenadoApp.java", "code"),
    ("ejercicio 5", "informes/similitudes.md", "markdown")
)

practicas = [f for f in os.listdir("tp1-2025-submissions")]

pprint(f"procesando: {practicas}")

for tp in practicas:
    print(f"Repositorio: {tp} / {timestamp}")
    with open(f"{tp}.md", "w") as informe:
        informe.write(f"# Informe creado el {timestamp}\n")
        informe.write(
            "\n\nImportante, este informe no es el resultado de la corrección (eso es en un comentario separado.\n\n")
        informe.write(
            "![Mira como te revisa conan](https://github.com/INGCOM-UNRN-PII/cursada-2025/blob/main/plantel/bot/conan.png?raw=true)\n")
        informe.write(
            "\n\n**Importante** Este informe no es el resultado de la corrección, es lo que se usa para corregir en otro comentario a continuación.\n")
        contador = 0
        for punto, nombre_archivo, tipo in archivos:
            print(("*" * 4) + punto)

            informe.write(f"\n\n# {punto} / {nombre_archivo}\n\n")
            path_archivo = "tp1-2025-submissions" + "/" + tp + "/" + nombre_archivo
            try:
                ejercicio = open(path_archivo, encoding="utf8",
                                 errors='ignore').read()
                msg = f"`{punto}::/{nombre_archivo}` con '{len(ejercicio)}' bytes"
                print(msg)
                contador = contador + 1  # cuantos archivos encontró
                if tipo == "code":
                    informe.write("```\n")
                    informe.writelines(ejercicio)
                    informe.write("\n```")
                elif tipo == "exists":
                    informe.write("\n")
                    informe.writelines(msg)
                else:
                    informe.write("\n")
                    informe.writelines(ejercicio)
            except FileNotFoundError as exc:
                err_msg = f"{nombre_archivo} no fue encontrado en la ubicación esperada\n    `{path_archivo}`"
                print(err_msg)
                informe.write(err_msg)
            except Exception as exc:
                err_msg = f"    La excepcion fue {exc}"
                print(err_msg)
                informe.write(err_msg)
        stats = f"\n# {tp}:{contador}/{len(archivos)}"
        print(stats)
        informe.write(stats)
