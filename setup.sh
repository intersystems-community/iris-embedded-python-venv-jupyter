#!/bin/bash

# STEP 1: Create an embedded python virtual environment
python3 -m venv embeddedpython
rm embeddedpython/bin/python3
ln -s /usr/irissys/bin/irispython embeddedpython/bin/python3

# STEP 2: Register the virtual environment as an ipykernel
source ./embeddedpython/bin/activate
python3 -m ipykernel install --user --name=embeddedpython
sed -i "s|/usr/bin/python3|/usr/irissys/bin/irispython|" ~/.local/share/jupyter/kernels/embeddedpython/kernel.json
