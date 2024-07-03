#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $- <Automatic_PDF_to_CSV_Converter.py>"
    exit 1
fi


PYTHON_SCRIPT="$1"


if [ ! -f "$PYTHON_SCRIPT" ]; then
    echo "Error: $PYTHON_SCRIPT not found!"
    exit 1
fi


python "$PYTHON_SCRIPT"