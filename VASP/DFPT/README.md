# Phonopy VASP Tutorials:Density Functional Perturbation Theory
# 1.預處理:
根據單位晶胞結構，充分考慮晶體對稱性來創建帶（或不帶）位移的超晶胞結構。

若要獲得帶位移的超晶胞（1×1×1），運行phonopy：

phonopy -d --dim 1 1 1 -c POSCAR

為了後續的便利，建議使用SPOSCAR文件來生成phonopy_disp.yaml文件：

phonopy -d --dim 1 1 1 --pa auto -c SPOSCAR

能看到以下檔案：SPOSCAR、phonopy_disp.yaml和POSCAR-{number}：

ls

phonopy_disp.yaml  POSCAR-001  POSCAR-002  POSCAR  SPOSCAR

SPOSCAR 是完美的超晶胞結構。

phonopy_disp.yaml 包含位移資訊。

POSCAR-{number} 是帶有原子位移的超晶胞，對應於在phonopy_disp.yaml中列出的不同原子位移。

# 2.計算力常數

將創建的SPOSCAR重新命名為POSCAR，並用於VASP計算：

mv SPOSCAR POSCAR

POSCAR-{number} 文件將不會使用

準備好 INCAR KPOINTS POTCAR vasp_pbspro.sh 放進生成了POSCAR、phonopy_disp.yaml和POSCAR-{number}的資料夾:

將IBRION = -1 改為 IBRION = 8

INCAR 設置如下(和Finite_displacement的INCAR差不多 只是不設材料的磁矩和DFT+U):

---------------------------------------

system = GdSbTe

!For structure inf

PREC = Accurate

IBRION = 8 #數值計算中「BFGS」方法（Broyden–Fletcher–Goldfarb–Shanno algorithm）。

          #這種方法是一種優化算法，常用於進行結構優化和最小化計算。選擇 8 是用來進行靜態或動態計算時的離子運動優化

EDIFF = 1.0e-08

!For smearing (note: close when band calculation)

ISMEAR = 0

LWAVE=.FALSE.

LCHARG=.FALSE.

#parrallel

LPLANE = .TRUE.

IALGO = 48

LSCALU = .FALSE.

NSIM = 4

#spin & moment

ISPIN = 2

LORBIT = 10

LSORBIT = .TRUE.

LNONCOLLINEAR = .TRUE.

SAXIS = 0 0 1

MAGMOM = 6*0 0 0 0 0 0 0 6*0

---------------------------------------

運行VASP:

qsub vasp_pbspro.sh

完成VASP計算後，確認vasprun.xml包含赫西安（hessian）元素，然後創建FORCE_CONSTANTS文件：

phonopy --fc vasprun.xml

# hessian

https://github.com/WeiChiehSu/tutorial_phonon/blob/main/VASP/DFPT/hessian.txt
