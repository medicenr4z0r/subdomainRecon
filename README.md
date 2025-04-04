# SubdomainFinder by R4z0r

SubdomainFinder es una herramienta automatizada diseñada para la recopilación y verificación de subdominios utilizando múltiples herramientas de reconocimiento. Ideal para evaluaciones de seguridad en aplicaciones web y análisis de estructuras de red.

---

## Tabla de Contenidos

1. [Características](#características)
2. [Instalación](#instalación)
3. [Requisitos Previos](#requisitos-previos)
4. [Uso](#uso)
5. [Estructura de Resultados](#estructura-de-resultados)
6. [Contribuciones](#contribuciones)

---

## Características

- Identificación de subdominios utilizando **findomain**, **subfinder**, **assetfinder** y **sublist3r**.
- Comprobación de subdominios activos con **httprobe**.
- Consolidación de resultados en un archivo único y limpio.

---

## Instalación

Clona el repositorio y sigue los pasos de instalación:

```bash
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux-i386.zip
unzip findomain-linux-i386.zip
chmod +x findomain
sudo mv findomain /usr/bin/findomain
rm ./findomain-linux-i386.zip

sudo apt install sublist3r
sudo apt install assetfinder

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
mv /root/go/bin/subfinder /usr/bin/

sudo apt install httprobe
```

## Uso
Ejecuta el script proporcionando el objetivo y una carpeta para los resultados:

```bash
subdomainRecon.sh -t <objetivo>
```

## Estructura de Resultados
El script genera la siguiente estructura en la carpeta de salida:

```plaintext
<carpeta_de_salida>/
├── domains.txt          # Lista consolidada de subdominios encontrados
├── alive.txt            # Subdominios activos (accesibles)
```

## Contribuciones
¿Quieres mejorar esta herramienta? Por favor abre un issue o envía un pull request en el repositorio oficial.

¡Gracias por usar SubdomainFinder! 🚀
