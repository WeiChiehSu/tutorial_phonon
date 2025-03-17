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

