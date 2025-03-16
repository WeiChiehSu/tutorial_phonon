# Phonopy VASP Tutorials:Finite displacement  

# 1.預處理：

在預處理階段，會根據單位晶胞結構，充分考慮晶體對稱性來創建帶（或不帶）位移的超晶胞結構。

若要獲得帶位移的超晶胞（1×1×1），運行phonopy：

phonopy -d --dim 1 1 1 --pa auto

能看到以下檔案：SPOSCAR、phonopy_disp.yaml和POSCAR-{number}：

ls
phonopy_disp.yaml  POSCAR  POSCAR-001  POSCAR-002  POSCAR-003  SPOSCAR

SPOSCAR 是完美的超晶胞結構。
phonopy_disp.yaml 包含位移資訊。
POSCAR-{number} 是帶有原子位移的超晶胞，對應於在phonopy_disp.yaml中列出的不同原子位移。

# 2.計算力常數:

力常數是使用POSCAR-{number}（根據原子上的力計算）或SPOSCAR檔案來計算的。

對於VASP，有限位移法的計算可以直接使用POSCAR-{number}檔案作為VASP計算的POSCAR檔案。INCAR設置如下：

---------------------------------------

system = GdSbTe #標題,不會讀取

!For structure inf

PREC = Accurate #Accurate 表示使用較高的精度來進行計算，相比於默認的 Normal 精度，它會要求更多的計算資源（如更密的 k 點網格和更高的能量精度）來獲得更準確的結果。

IBRION = -1 #必加!控制離子位置的優化方式,IBRION = -1 表示不對離子進行結構優化（不進行力的計算），通常用於靜態計算或在非優化步驟中。

EDIFF = 1.0e-08 #這個參數設定了自洽場計算（SCF）的收斂準則,EDIFF 是計算中能量收斂的容忍度，1.0e-08 表示計算直到能量變化小於 1.0e-08 eV 為止。

!For smearing (note: close when band calculation)

ISMEAR = 0 #ISMEAR = 0 表示使用 Gaussian smearing 方法,這對金屬和半金屬的計算特別有效。

!spin & moment 

ISPIN = 2 #指定自旋極化,ISPIN=2：進行自旋極化計算（共線）。

LORBIT = 10

LSORBIT = .TRUE. #開啟SOC效應

LNONCOLLINEAR = .TRUE. #開啟SOC效應

SAXIS = 0 0 1 #設置相對於笛卡爾坐標的全局自旋軸(自旋極化方向為Z軸)

MAGMOM = 6*0 0 0 11 0 0 -11 6*0 #為每個原子設置初始磁矩[對兩個Gd原子設置Z方向(001)的初始磁矩(00+-11),AFM配置]

! band & dos

LWAVE=.FALSE.

LCHARG=.FALSE.

!parrallel #並行設置

LPLANE = .TRUE. #開啟在實空間中的平面數據分佈

IALGO = 48 #殘差最小化方法,比 IALGO=8 和 IALGO=38 更快，特別是在大型系統和內存帶寬較小的工作站上

LSCALU = .FALSE. #在波函數的正交化過程中關閉並行 LU 分解

NSIM = 4 #IALGO=48模式下運行

!LDA+U

LDAU = .TRUE. #開啟 DFT+U 方法

LDAUTYPE = 2 #簡化（旋轉不變）DFT+U 方法

! Sb Gd Te

LDAUL = -1 3 -1 #-1表示不加U；1|2|3分别表示 p、d、f軌道加U(對Gdf軌道加U)

LDAUU = 0.0 7.0 0.0 #設置有效的在位庫侖相互作用（單位：eV）

LDAUJ = 0.0 0.0 0.0 #設置有效的在位交換相互作用（單位：eV）

LMAXMIX = 6 #控制將中心 PAW 電荷密度傳遞到電荷密度混合器並寫入 CHGCAR 文件的 𝑙-量子數的最大值

---------------------------------------

準備好 INCAR KPOINTS POTCAR vasp_pbspro.sh run-all.sh 放進生成了SPOSCAR、phonopy_disp.yaml和POSCAR-{number}的資料夾,運行:

sh run-all.sh

腳本的作用是：

.為每個 disp-{number} 創建一個目錄。
.將需要的文件（如 POTCAR、INCAR、KPOINTS 等）複製到這些目錄中，並根據擾動情況修改 POSCAR 文件。
.在每個目錄中，提交對應的 VASP 計算作業，等待作業完成後再處理下一個目錄。

等計算全部完成後,使用VASP介面創建FORCE_SETS檔案：

phonopy -f disp-001/vasprun.xml disp-002/vasprun.xml disp-003/vasprun.xml

or

phonopy -f disp-{001..003}/vasprun.xml

(一次scf時間約6個小時)

# example

https://github.com/WeiChiehSu/tutorial_phonon/tree/main/VASP/Finite_displacement/example
