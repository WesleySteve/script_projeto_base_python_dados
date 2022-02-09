#!/usr/bin/env bash

# -------------------------- inicio do programa ----------------------------- #

(($UID == 0)) && { echo "ROOT não!" ; exit 1 ; }

# ----------------------- variaveis ---------------------------------------- #
nome=''

# --------------------- help do programa ---------------------------------- #

_HELP() {

    clear

    cat << EOF
        INFORMAÇÕES DE USO
            - Este programa foi desenvolvido para rodar em um sistema linux 
                que use o interpretador bash
            - Para rodar o programa deve-se ter acesso a internet
            - O sistema deve ter instalado o programa:
                - git

EOF

}

# ------------------- fim help do programa -------------------------------- #

# ---------------------- ajuda do programa ---------------------------- #

_AJUDA() {

    cat << EOF
        OPÇÕES DISPONIVEIS
            -h ou --help
            -c ou --criar
EOF
}

# --------------------- fim ajuda do programa ------------------------- #

# ---------------------  criar estrutura de diretórios -------------------- #

# função responsavel em criar uma estrutura inicial de um projeto de dados

_CRIAR() {

    read -p "Digite o nome do projeto: " nome

    if [[ -z $nome ]] 
    then
        echo "NOME DO PROJETO NÃO DEFINIDOR!"
        exit 1 ;

    else
        mkdir $nome && cd $nome &&
        mkdir docs && cd docs && > .gitkeep && cd .. &&
        mkdir data && cd data &&
        mkdir raw && cd raw && > .gitkeep && cd .. &&
        mkdir base && cd base && > .gitkeep && cd .. && cd .. &&
        mkdir src && cd src && > __init__.py &&
        mkdir sql && cd sql &&
        mkdir sql_extract && cd sql_extract && > .gitkeep && cd .. &&
        sql_transform && cd sql_transform && > .gitkeep && cd .. &&
        mkdir sql_load && cd sql_load && > .gitkeep && cd .. && cd .. &&
        mkdir python && cd python && > __init__.py &&
        
        # chamada da função

        _ARQUIVOS

        echo "PROJETO ' $nome ' CRIADO COM SUCESSO!"    

        exit 0 ;
    
    fi

}

# função responsavel em coletar os arquivos de base de um projeto de dados

_ARQUIVOS() {

   git clone https://github.com/WesleySteve/arquivos_base_projeto_python_dados.git

   cp arquivos_base_projeto_python_dados/* . &&
   cp arquivos_base_projeto_python_dados/.gitignore . &&
   cp arquivos_base_projeto_python_dados/.flake8 . &&
   cp arquivos_base_projeto_python_dados/.pylintrc . &&
   rm -rf arquivos_base_projeto_python_dados/


   echo "## ${nome}" > README.md

}

# ------------------- fim criar estrutura de diretórios ------------------- #

# ---------------------------- menu entrada ------------------------------- #

case "$1" in
    -h|--help) _HELP        ;;
    -c|--criar) _CRIAR      ;;
    *) _AJUDA
esac

# ------------------------ fim do menu entrada ---------------------------- #

# ---------------------------- fim do programa ------------------------------ #