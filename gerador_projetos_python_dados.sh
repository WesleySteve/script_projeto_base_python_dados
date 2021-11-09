#!/usr/bin/env bash

(($UID == 0)) && { echo "ROOT não!" ; exit 1 ; }


# ------------------------- help do programa ------------------------------ #

_AJUDA() {

    cat << EOF
        OPÇÕES DISPONIVEIS
            -h ou --help
            -c ou --criar
EOF
}

# ------------------------ fim help do programa --------------------------- #