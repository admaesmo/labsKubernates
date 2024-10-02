#usar imagen ligera de alpine
FROM alpine

#crer el directorio / app
RUN mkdir -p /app
#Crear un grupo y un usuario no-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Crear un script simple en el directorio /app
RUN echo -e "#!/bin/sh\nwhile true; do echo hello world; sleep 2; done" > /app/hello.sh

# Dar permisos de ejecución al script
RUN chmod +x /app/hello.sh

# Cambiar la propiedad de /app al usuario no-root
RUN chown -R appuser:appgroup /app

# Cambiar al usuario no-root
USER appuser

# Ejecutar el script cuando el contenedor se inicie
CMD ["/app/hello.sh"]