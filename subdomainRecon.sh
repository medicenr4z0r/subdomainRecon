#!/bin/bash
echo ""
echo ""
echo ""
echo "     ~ subdomainRecon by R4z0r ~     "
echo ""
echo ""
echo ""


get_subdomains() {
    if [ "$1" = "-h" ]; then
        echo "Uso: $0 -t <objetivo>"
        echo "Descripción: Esta herramienta recopila subdominios utilizando findomain, subfinder, assetfinder y sublist3r, y luego verifica si los subdominios están vivos utilizando httprobe."
        exit 0
    fi

    if [ $# -ne 2 ] || [ "$1" != "-t" ]; then
        echo "Error: Uso incorrecto."
        echo "Uso: $0 -t <objetivo>"
        exit 1
    fi

    target="$2"

    read -p "[!] Hola tormenta del desierto, ingresa el nombre de la carpeta para los resultados: " folder_name

    mkdir -p "$folder_name" && cd "$folder_name" || exit

    echo -e "\\n[!] Gracias bestia, estoy orgulloso de vos, ahora aguardame un toque que voy a ejecutar las herramientas, tomate unos mates mientras."

    echo -e "\\n[*] Ejecutando findomain\\n"
    findomain -q -t "$target" -r -u "${target}_findomain_domains.txt"

    echo -e "\\n[*] Ejecutando subfinder\\n"
    subfinder -d "$target" -o "${target}_subfinder_domains.txt"

    echo -e "\\n[*] Ejecutando assetfinder\\n"
    assetfinder --subs-only "$target" >> "${target}_assetfinder_domains.txt"

    echo -e "\\n[*] Ejecutando sublist3r\\n"
    sublist3r -d "$target" -o "${target}_sublist3r_domains.txt"

    echo -e "\\n[!] Listo pa, ahora voy a procesar los archivos para que te quede bien clean...\\n"

    sort -u *_domains.txt -o domains.txt
    find . -type f -not -name 'domains.txt' -delete

    echo -e "\\n[*] Último step, comprobando si los subdominios responden, te los guardaré en alive.txt ;) \\n"
    cat domains.txt | httprobe -c 50 -t 3000 >alive.txt

    echo -e "\\n[!] Proceso completado. ¡Ya podés ir a analizar los subdominios, crack!"
}

get_subdomains "$@"
