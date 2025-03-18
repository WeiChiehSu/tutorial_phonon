這裡的matlab code是用來繪製Phononpy計算的聲子性質.

# phononpy_phonon_band.m

phononpy_phonon_band.m可以讀取band.yaml進行繪製聲子譜:

下面為phononpy_phonon_band.m的輸入參數

material_name = 'NaCl'; #材料名

high_symmetry_point_name = {'\Gamma','X','M','\Gamma','R','interpreter','LaTex'}; #高對稱點

natom = 2; #原子數

hs = 5;       % # of high symmetry point

ymin = 0;    % frequency range [THz]

ymax = 7;

