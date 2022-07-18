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
        mkdir $nome
        
        # chamada da função

        _ARQUIVOS

        echo "PROJETO ' $nome ' CRIADO COM SUCESSO!"    

        exit 0 ;
    
    fi

}

# função responsavel em coletar os arquivos de base de um projeto de dados

_ARQUIVOS() {

   git clone https://github.com/WesleySteve/arquivos_base_projeto_python_dados.git

  # copiando os diretorios data e docs para raiz do projeto $nome
  
  # o diretorio data é responsavel em armazenar os arquivos de leitura para analises
    # e responsavel em guardar os arquivos de banco de dados 

  # o diretorio docs é responsavel em armazenar os arquivos de documentação

   cp -r arquivos_base_projeto_python_dados/estrutura_projeto_dados/data . &&
   cp -r arquivos_base_projeto_python_dados/estrutura_projeto_dados/docs . &&

# copiando os diretorio python sql

# o diretorio python é responsavel em armazenar arquivos .py que iram controlar 
  # as chamadas das analises

# o diretorio sql é resposavel em armazenar arquivos .sql que iram executar as 
  # consultas responsavel em trazer os resultados das analises

# o arquivo analise.ipynb é responsavel por fazer as analises de teste antes de
  # estruturar o projeto em formato de produção

# o arquivo __init__.py mostra para o interpretador python que aquele diretório
  # é um pacote

   cp -r arquivos_base_projeto_python_dados/estrutura_projeto_dados/nome_projeto/python $nome &&
   cp -r arquivos_base_projeto_python_dados/estrutura_projeto_dados/nome_projeto/sql $nome &&
   cp -r arquivos_base_projeto_python_dados/estrutura_projeto_dados/nome_projeto/analise.ipynb $nome &&
   cp -r arquivos_base_projeto_python_dados/estrutura_projeto_dados/nome_projeto/__init__.py $nome &&
   
# copiando arquivos de configuração do projeto

# os arquivos seguintes são responsaveis por manter um padrão do projeto

   cp -r arquivos_base_projeto_python_dados/.gitignore . &&
   cp -r arquivos_base_projeto_python_dados/.flake8 . &&
   cp -r arquivos_base_projeto_python_dados/.pylintrc . &&
   cp -r arquivos_base_projeto_python_dados/.pre-commit-config.yaml . &&
   cp -r arquivos_base_projeto_python_dados/.vscode . &&
   rm -rf arquivos_base_projeto_python_dados/


   echo "## ${nome}
   
   ## Instruções iniciais quando estiver usando virtualenv:
     - Após gerar o projeto:
       - copie toda a configuracao menos a primeira linha do arquivo .pylintrc localizado na raiz do projeto gerado
       - remova o arquivo .pylintrc
      
      - use o comandon na raiz do projeto:
         ->  pylint --generate-rcfile > .pylintrc
       - cole as configuracoes do .pylintrc que foi removido da raiz
      
      - inicie um repositório git dentro do projeto
       - rode o script **init_project.sh**:
         -> para iniciar o ambiente virtual e instalar as dependencias
       - use a opção reload window e abra um novo terminal:
         -> para aparecer a virtualenv ativa
      
       - em seguida aplique o commit inicial." > README.md
    
    echo "    
   ## Instruções iniciais quando estiver usando conda:
     - Crie o ambiente com o nome do projeto
     - Apos criar o ambiente gere o projeto
     - Após gerar o projeto:
       - abra um arquivo .py para o vscode reconhecer o ambiente
       - escolha o ambiente virtual criado com o nome do projeto
       - no script **init_project.sh**:
         -> remova as 2 primeiras linhas referente ao virtualenv
       - no arquivo **.pre-commit-config.yaml:
         -> substitua no hook flake8 dentro da opcao entry:
            bash -c .venv, mantendo do /bin para frente por:
             -> caminho_do_seu_anaconda/envs/nome_do_ambiente_virtual
       - copie toda a configuracao menos a primeira linha do arquivo .pylintrc localizado na raiz do projeto gerado
       - remova o arquivo .pylintrc
      
      - use o comandon na raiz do projeto:
         ->  pylint --generate-rcfile > .pylintrc
       - cole as configuracoes do .pylintrc que foi removido da raiz
      
      - inicie um repositório git dentro do projeto
       - rode o script **init_project.sh**:
         -> para instalar as dependencias do projeto no ambiente virtual selecionado anteriormente
       - use a opção reload window e abra um novo terminal:
         -> para aparecer a virtualenv ativa
       
       - em seguida aplique o commit inicial." >> README.md

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
