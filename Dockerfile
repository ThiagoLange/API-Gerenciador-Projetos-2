# --- Estágio 1: Build ---
# Imagem com Maven 3.9 e JDK 24 (Esta linha estava correta)
FROM maven:3.9-eclipse-temurin-24 AS build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia apenas o pom.xml primeiro para aproveitar o cache de camadas do Docker
COPY pom.xml .

# Baixa todas as dependências do projeto
RUN mvn dependency:go-offline

# Copia o restante do código-fonte
COPY src ./src

# Compila o projeto e gera o arquivo .jar
RUN mvn package -DskipTests

# --- Estágio 2: Runtime ---
# Imagem enxuta com apenas o JRE 24, baseada no Ubuntu "Noble"
# ESTA É A LINHA CORRIGIDA:
FROM eclipse-temurin:24-jre-noble

WORKDIR /app

# Copia o arquivo .jar gerado no estágio 'build' para a imagem final
COPY --from=build /app/target/gerenciador-projetos-0.0.1-SNAPSHOT.jar .

# Expõe a porta 8080 (porta padrão do Spring Boot)
EXPOSE 8080

# Define o comando para executar a aplicação quando o contêiner iniciar
ENTRYPOINT ["java", "-jar", "gerenciador-projetos-0.0.1-SNAPSHOT.jar"]