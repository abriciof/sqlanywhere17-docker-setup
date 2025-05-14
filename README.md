# SQL Anywhere 17 no Docker

## Pré-requisitos

- Docker e Docker Compose instalados
- Arquivo de instalação do SAP SQL Anywhere 17

## Passos de instalação

1. **Baixe o SAP SQL Anywhere 17 (Full Install)**  
   https://d5d4ifzqzkhwt.cloudfront.net/sqla17developer/bin/sqla17developerlinux.tar.gz

2. **Renomeie** o arquivo para `sqla17developerlinux.tar.gz` e deixe-o no mesmo diretório do `Dockerfile`

3. **Crie e preencha** um arquivo `.env`, seguindo o template do `.env.example`

4. **Aponte** o volume `/db` para a pasta que contém o seu arquivo de banco de dados

5. **Execute** o comando final:  
   ```bash
   docker compose up --build -d