# Tutorial_phononpy
This is a tutorial for running and installing Phonopy and phono3py.

Please ensure that VASP or Quantum ESPRESSO is installed on Linux before proceeding with the installation.

Before installing Phonopy, we need to install Anaconda on Linux:
# Compile Anaconda

wget https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh

bash  Anaconda3-2024.02-1-Linux-x86_64.sh

# Enter the Anaconda virtual environment 

conda activate base

# compile phonopy

create phonopy virtual environment:

conda create -n phonopy -c conda-forge

# Enter the phonopy virtual environment

conda activate phonopy

To perform Phonopy calculations, we need to run them within the Phonopy virtual environment.

# Install phonopy and phono3py

install phonopy

conda install -c conda-forge phonopy

After installing Phonopy, we install Phono3py:

conda install -c conda-forge phono3py

# The order of Enter virtual environment

Enter the Anaconda virtual environment:

source ~/.bashrc

or 

conda activate base

Enter the phonopy virtual environment:

conda activate phonopy

Exit the virtual environment:

conda deactivate

#test phonopy

Enter the phonopy virtual environment:

conda activate phonopy

run :

phonopy

we can see: test_phonopy.txt

Tt mean we successfully installed phonopy.

The list of phonopy at list_phonopy

