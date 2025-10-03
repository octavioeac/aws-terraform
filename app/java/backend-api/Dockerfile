# --- Etapa 1: Build con Maven y JDK 17 ---
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /workspace

# Copiamos solo lo necesario para cachear dependencias
COPY pom.xml .
# Si usas wrapper, copia también .mvn/ y mvnw
COPY .mvn/ .mvn/
COPY mvnw mvnw

# Descarga dependencias en cache (rápido en rebuilds)
RUN ./mvnw -B -q -DskipTests dependency:go-offline || mvn -B -q -DskipTests dependency:go-offline

# Copiamos el código y compilamos
COPY src/ src/
RUN ./mvnw -B -DskipTests package || mvn -B -DskipTests package

# --- Etapa 2: Runtime con JRE 17 mínimo ---
FROM eclipse-temurin:17-jre-jammy AS runtime
WORKDIR /app

# Copia el JAR construido
ARG JAR_FILE=target/*.jar
COPY --from=build /workspace/${JAR_FILE} app.jar

# Puerto por defecto de Spring Boot
ENV SERVER_PORT=8080 \
    JAVA_OPTS=""

EXPOSE 8080

# (Opcional) ejecuta con usuario no root
# RUN useradd -m app && chown -R app:app /app
# USER app

ENTRYPOINT ["sh","-c","exec java $JAVA_OPTS -jar app.jar"]
