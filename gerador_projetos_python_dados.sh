#!/usr/bin/env bash

# -------------------------- inicio do programa ----------------------------- #

(($UID == 0)) && { echo "ROOT não!" ; exit 1 ; }


# ------------------------ help do programa ----------------------------- #

_AJUDA() {

    cat << EOF
        OPÇÕES DISPONIVEIS
            -h ou --help
            -c ou --criar
EOF
}

# ----------------------- fim help do programa -------------------------- #

# ----------------- inicio criar estrutura de diretórios ------------------ #

# função responsavel em criar uma estrutura inicial de um projeto de dados

_CRIAR() {

    local _nome=''

    read -p "Digite o nome do projeto: " _nome

    if [[ -z $_nome ]] 
    then
        echo "NOME DO PROJETO NÃO DEFINIDOR!"
        exit 1 ;

    else
        mkdir $_nome && cd $_nome &&
        mkdir data src && cd data && > .gitkeep && cd .. &&
        cd src && > teste.py && cd ..

        # chamada da função

        _ARQUIVOS

        echo "PROJETO ' $_nome ' CRIADO COM SUCESSO!"

        cd $_nome

        make format        

        exit 0 ;
    
    fi

}

# função responsavel em coletar os arquivos de base de um projeto de dados

_ARQUIVOS() {

   git clone https://github.com/WesleySteve/arquivos_base_projeto_python_dados.git

   cp arquivos_base_projeto_python_dados/* . &&
   cp arquivos_base_projeto_python_dados/.gitignore . &&
   rm -rf arquivos_base_projeto_python_dados/


   echo "## Coloque o nome do seu projeto aqui" > README.md

}

# ------------------- fim criar estrutura de diretórios ------------------- #

# ---------------------------- menu entrada ------------------------------- #

case "$1" in
    -h|--help) _AJUDA       ;;
    -c|--criar) _CRIAR      ;;
    *) _AJUDA
esac

# ------------------------ fim do menu entrada ---------------------------- #

# ---------------------------- fim do programa ------------------------------ #