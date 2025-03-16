# phonopy VASP Tutorials:Finite displacement  

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

對於VASP，有限位移法的計算可以直接使用POSCAR-{number}檔案作為VASP計算的POSCAR檔案。INCAR範例如下：
