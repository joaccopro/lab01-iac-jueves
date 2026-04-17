# lab02-iac-jueves

Este proyecto demuestra la creación de una arquitectura de tres capas utilizando Infraestructura como Código (IaC). Utiliza Terraform para aprovisionar y gestionar contenedores de Docker de manera automatizada, separando los recursos en múltiples entornos mediante el uso de *workspaces*.

## Arquitectura del Proyecto

El sistema está compuesto exactamente por 4 componentes principales integrados:

1. **Frontend (Web):** Contenedor basado en `nginx:alpine` que sirve una página estática HTML.
2. **Backend (API):** Contenedor basado en `node:alpine` que ejecuta un servidor básico en el puerto 3000.
3. **Base de Datos (BD):** Contenedor oficial de `postgres:alpine` para almacenamiento.
4. **Orquestador (Terraform):** Archivos de configuración `.tf` que gestionan el ciclo de vida y los puertos de los contenedores según el entorno.

## Entornos y Puertos (Workspaces)

El despliegue está configurado para manejar dos entornos distintos, asignando puertos específicos de forma dinámica mediante `terraform.tfvars`:

| Servicio | Puerto Interno | Puerto Externo (localhost) | Puerto Externo (dev) |
| :--- | :--- | :--- | :--- |
| **Frontend** | 80 | 4001 | 5001 |
| **Backend** | 3000 | 4002 | 5002 |
| **Base de Datos**| 5432 | 4003 | 5003 |

## Requisitos Previos

* **Docker Desktop:** Debe estar instalado, actualizado (WSL 2) y ejecutándose en segundo plano.
* **Terraform:** Instalado y accesible desde la línea de comandos.
* **Node.js y Nginx:** No requieren instalación local, ya que se construyen y ejecutan directamente desde los contenedores.

## Guía de Despliegue

Sigue estos comandos en la terminal para levantar el proyecto desde cero.

### 1. Construcción de Imágenes (Local)
Primero, es necesario compilar las imágenes locales para la API y la Web:

```bash
# Construir imagen de la API
cd src/api
docker build -t lab/api .

# Construir imagen del Frontend
cd ../web/web1
docker build -t lab/web .