#!/bin/bash

# Script feito para usar em EC2/user data  para baixar o postgres versao 16
# Atualiza os pacotes
sudo apt update

# Instala gnupg2, wget e nano
sudo apt install -y gnupg2 wget nano

# Adiciona o repositório do PostgreSQL
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Adiciona a chave do repositório
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg

# Atualiza os pacotes novamente
sudo apt update

# Instala o PostgreSQL 16 e seus contribuintes
sudo apt install -y postgresql-16 postgresql-contrib-16

# Inicia o serviço do PostgreSQL
sudo systemctl start postgresql

# Habilita o serviço do PostgreSQL para iniciar automaticamente na inicialização
sudo systemctl enable postgresql
