## Gerador_Projetos_Python_Dados

- Este projeto tem como seu objetivo criar uma estrutura de diretórios inicial capaz de organizar um projedo de dados utilizando python
- Adicione o arquivo gerador_projetos_python_dados.sh em um diretório no seu sistema que está no PATH de seu sistema para que o mesmo possa ser chamado de qualquer lugar em seu sistema.

## Arvore de diretórios

  - .
  - ├── data
  - │   ├── base
  - │   └── raw
  - ├── docs
  - ├── Makefile
  - ├── README.md
  - ├── requirements-dev.txt
  - ├── requirements.txt
  - └── nome_do_projeto
    - ├── __init__.py
    - ├── python
    - │   ├── extract
    - │   │   ├── collect.py
    - │   │   └── __init__.py
    - │   ├── __init__.py
    - │   ├── load
    - │   │   ├── __init__.py
    - │   │   └── load.py
    - │   └── transform
    - │       ├── __init__.py
    - │       └── transform.py
    - └── sql
        - ├── sql_extract
        - ├── sql_load
        - └── sql_transform


## Requisitos

- Rodar este script em linux usando interpretador bash com o usuário comum
- Para rodar o script gerador_projetos_python_dados:
    - é necessário ter acesso a internet
- O sistema deverá ter os seguintes programas instalados:
    - git
