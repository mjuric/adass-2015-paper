#!/bin/bash

grep useaffil "$1" | grep -v -E '^\\(affil|def)' | cut -d , -f 1 | cut -d '$' -f 1 | tr '~' ' ' | tr '\n' ', ' | sed 's/,/, /g;' | sed -n 's/, $/, for the LSST Project/p'
