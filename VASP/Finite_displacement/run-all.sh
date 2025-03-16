#!/bin/bash

# 迴圈遍歷 001 002 003
for i in $(seq -f "%03g" 1 6)
do
	mkdir disp-$i
	cp POTCAR INCAR KPOINTS POSCAR-$i vasp_pbspro.sh disp-$i
	cd disp-$i
	echo "i= disp-$i"
	mv POSCAR-$i POSCAR
	qsub vasp_pbspro.sh
	wait
	cd ..
done
