# Usa una imagen base de Python
FROM python:3.12-slim-bookworm
#FROM python:alpine

# Actualiza los paquetes y luego instala los paquetes necesarios
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    build-essential && apt-get autoremove -y && apt-get clean

# Instala Flask y las demás dependencias necesarias directamente
RUN pip install --no-cache-dir Flask==2.3.2 gunicorn==20.1.0


# Copia el código de la aplicación en el contenedor
COPY . /app

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Expone el puerto en el que se ejecutará Flask
EXPOSE 5000

# Comando para ejecutar la app Flask
#CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]

ENTRYPOINT ["./gunicorn.sh"]

# Comando por defecto cuando inicie el contenedor
#CMD ["bash", "-c", "cd /app/Transportes_Fernandez && bash"]
