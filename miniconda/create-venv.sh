#!/bin/bash

conda env create -f environment.yml

echo "Environment has been created"
echo "To activate the environment, run 'conda activate dev'"
echo "To deactivate the environment, run 'conda deactivate'"