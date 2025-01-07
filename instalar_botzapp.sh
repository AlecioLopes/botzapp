#!/bin/bash
echo "##### ESTE PROCESSO PODE DEMORAR ENTRE 15 A 20 MINUTOS #####"

# Instalar Git e Go
echo "Instalando Git e Go..."
pkg install -y git golang &>/dev/null
echo "Git e Go foram instalados corretamente."

# Clonar o repositório do BotzApp
echo "Clonando o repositório do BotzApp..."
git clone https://github.com/AlecioLopes/botzapp.git &>/dev/null
echo "Repositório clonado com sucesso."

# Navegar para o diretório do projeto
cd botzapp

# Compilar o binário do BotzApp com o nome padrão
echo "Compilando o binário..."
go build . &>/dev/null

# Verificar se o binário foi compilado corretamente
if [ -f "./wuzapi" ]; then
    echo "BotzApp foi compilado com sucesso no Termux."
    
    # Dar permissões de execução ao binário
    chmod +x wuzapi
    chmod +x executar_wuzapi.sh

    echo "Permissões de execução concedidas ao BotzApp."
else
    echo "Erro ao compilar o BotzApp."
    exit 1
fi

# Conceder permissões ao Tasker
mkdir -p ~/.termux && echo "allow-external-apps=true" >> ~/.termux/termux.properties

# Executar o BotzApp
echo "Executando o BotzApp..."
./wuzapi
