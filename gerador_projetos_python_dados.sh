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


# ---------------------------- menu entrada ------------------------------- #

case "$1" in
    -h|--help) _AJUDA       ;;

    *) _AJUDA
esac

# ------------------------ fim do menu entrada ---------------------------- #

# ---------------------------- fim do programa ------------------------------ #