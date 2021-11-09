#!/usr/bin/env bash

(($UID == 0)) && { echo "ROOT não!" ; exit 1 ; }