# Utiliza la imagen de la versión específica de Python.
FROM python:3.12.3-slim

# Establece un directorio de trabajo en el contenedor.
WORKDIR /app

# Copia el archivo de requisitos primero para aprovechar la caché de las capas de Docker.
COPY requirements.txt .

# Instala las dependencias de Python.
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código fuente de la aplicación en el contenedor.
COPY . .

# Expone el puerto 3001 para que coincida con el que está configurado en Flask dentro del contenedor.
EXPOSE 3001

# Define el comando para ejecutar la aplicación.
CMD ["flask", "run", "--host=0.0.0.0", "--port=3001"]

