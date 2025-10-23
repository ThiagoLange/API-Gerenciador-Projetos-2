# Gerenciador de Projetos Sustentáveis

Este é um projeto de API REST para gerenciamento de projetos, construído com Spring Boot, Spring Security e JWT.

## Pré-requisitos

Para construir e executar esta aplicação localmente usando Docker, você precisará ter:
* [Docker](https://www.docker.com/get-started) instalado e em execução.

## Como Executar com Docker

### 1. Construa a Imagem Docker
Abra um terminal na raiz do seu projeto e execute o seguinte comando. Isso irá construir a imagem Docker, nomeando-a como gerenciador-projetos.

```Bash

docker build -t gerenciador-projetos:latest .
```

### 2. Execute o Contêiner
Após a imagem ser construída com sucesso, inicie um contêiner a partir dela:

```Bash

docker run -p 8080:8080 --name gerenciador-app gerenciador-projetos:latest
```
Detalhes do comando:

-p 8080:8080: Mapeia a porta 8080 do seu computador (host) para a porta 8080 dentro do contêiner.

--name gerenciador-app: Dá um nome fácil de lembrar ao seu contêiner.

gerenciador-projetos:latest: Especifica qual imagem executar.

Para rodar em modo "detached" (em segundo plano), adicione a flag -d:

```Bash

docker run -d -p 8080:8080 --name gerenciador-app gerenciador-projetos:latest

```
## Acessando a Aplicação

Com o contêiner em execução, você pode acessar os seguintes endpoints no seu navegador.

### 3. Documentação da API (Swagger/OpenAPI)

O projeto inclui o SpringDoc (springdoc-openapi-starter-webmvc-ui), que gera uma documentação interativa da API. O acesso a ela é permitido publicamente pela configuração de segurança.

URL do Swagger UI: http://localhost:8080/swagger-ui/index.html

URL do OpenAPI (JSON): http://localhost:8080/v3/api-docs

Você pode usar a interface do Swagger para testar todos os endpoints, incluindo a autenticação (/login) e os endpoints protegidos (lembre-se de clicar em "Authorize" e usar o token JWT).

### 4. Como Parar o Contêiner
Para parar e remover o contêiner (e apagar o banco em memória), execute:

```Bash

docker stop gerenciador-app
docker rm gerenciador-app
```
