Hola me queda 3 minutos para presentar, lo siento profesor:
Para el despliegue de Web1:
cd src/web/web1
docker build -t imagen-web1 .
docker run -d --name contenedor-web1 -p 4000:80 imagen-web1

Para el despliegue de Web2:
cd ../web2
docker build -t imagen-web2 .
docker run -d --name contenedor-web2 -p 4001:80 imagen-web2