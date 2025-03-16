# Tutorial_phononpy
This is a tutorial for running and installing Phonopy and phono3py.

Please Check that VASP or Quantum ESPRESSO is installed on Linux before proceeding with the installation.

For the tutorial of VASP phonon calculation with Phonopy , please refer to:https://github.com/WeiChiehSu/tutorial_phonon/tree/main/VASP

For the tutorial of Quantum ESPRESSO phonon calculation with Phonopy, please refer to:[https://github.com/WeiChiehSu/tutorial_phonon/tree/main/VASP](https://github.com/WeiChiehSu/tutorial_phonon/tree/main/Quantum_Espresso)

# Introduction

Phonopy(https://phonopy.github.io/phonopy/) is an open-source software used for calculating lattice phonon properties. It can handle calculations ranging from structure optimization to phonon frequencies, and it is capable of calculating the distribution of phonons at different wave vectors (q-points), phonon density of states (DOS), and specific heat, among other properties. Phonopy supports various quantum calculation methods, such as VASP, Quantum ESPRESSO, and other computational platforms, for lattice dynamics analysis.

Phonopy 是一個用於計算晶格聲子性質的開源軟件。它能夠處理從結構優化到聲子頻率的計算，並且能夠計算聲子在不同波矢 (q-point) 的分佈，聲子態密度 (phonon density of states, DOS)，以及熱容量等。Phonopy 支援使用各種不同的量子計算方法，如 VASP、Quantum ESPRESSO 和其他計算平台，來進行晶格動力學的分析。

Phono3py(https://phonopy.github.io/phono3py/) is an extension of Phonopy, specifically designed for calculating three-phonon processes and properties like thermal conductivity. It takes into account the effects of three-phonon interactions, which are crucial for accurately describing properties such as thermal conductivity. Phono3py is primarily used in heat transport studies of metals and semiconductors and can compute phonon-phonon scattering, thermal conductivity, and contributions from three-phonon scattering processes.

Phono3py 是 Phonopy 的擴展，專門用於計算三聲子過程和熱導率等性質。它能夠考慮到三聲子相互作用的影響，這對於精確描述熱導率等性質非常重要。Phono3py 主要用於金屬和半導體材料中的熱輸運研究，並且能夠計算聲子-聲子散射、熱導率、三聲子散射過程的貢獻等。

# Compile Anaconda

Before installing Phonopy, we need to install Anaconda on Linux:

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

we can see: [test_phonopy.txt](https://github.com/WeiChiehSu/tutorial_phonon/blob/main/test_phonopy.txt)

Tt mean we successfully installed phonopy.

The list of phonopy at [list_phonopy](https://github.com/WeiChiehSu/tutorial_phonon/blob/main/list_phonopy.txt)

# The solution of install phonopy

If you have some problem from installing phonopy, you can see: [problem.txt](https://github.com/WeiChiehSu/tutorial_phonon/blob/main/problem.txt)

