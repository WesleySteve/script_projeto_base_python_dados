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
        mkdir $nome && cd $nome && > __init__.py &&
        mkdir sql && cd sql &&
        mkdir sql_extract && cd sql_extract && > .gitkeep && cd .. &&
        mkdir sql_transform && cd sql_transform && > .gitkeep && cd .. &&
        mkdir sql_load && cd sql_load && > .gitkeep && cd .. && cd .. &&
        mkdir python && cd python && > __init__.py &&
        mkdir extract && cd extract && > __init__.py && > collect.py && cd .. &&
        mkdir transform && cd transform && > __init__.py && > transform.py && cd .. &&
        mkdir load && cd load && > __init__.py && > load.py && cd .. && cd .. && cd ..

        
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
   cp arquivos_base_projeto_python_dados/.pre-commit-config.yaml . &&
   cp -r arquivos_base_projeto_python_dados/.vscode . &&
   rm -rf arquivos_base_projeto_python_dados/


   echo "## ${nome}
   
   ## Instruções iniciais:
     - Após gerar o projeto:
       - inicie um repositório git dentro do projeto
       - rode o script **init_project.sh**:
         -> para iniciar o ambiente virtual e instalar as dependencias
       - use a opção reload window e abra um novo terminal:
         -> para aparecer a virtualenv ativa
       - em seguida aplique o commit inicial." > README.md

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
