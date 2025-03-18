這裡的matlab code是用來繪製Phononpy計算的聲子性質.

# phononpy_phonon_band.m

phononpy_phonon_band.m可以讀取band.yaml進行繪製聲子譜

下面為phononpy_phonon_band.m的輸入參數:

material_name = 'NaCl'; #材料名

high_symmetry_point_name = {'\Gamma','X','M','\Gamma','R','interpreter','LaTex'}; #高對稱點

natom = 2; #原子數

hs = 5;       % # of high symmetry point

ymin = 0;    % frequency range [THz]

ymax = 7;

# phononpy_phonon_dos.m

phononpy_phonon_dos.m可以讀取total_dos.data進行繪製總聲子態密度

下面為phononpy_phonon_dos.m的輸入參數:

material_name = '114514'; #材料名

natom = 6; #原子數

xmin = 0;    % frequency range (THz)

xmax = 5;   

ymin = 0;    % DOS range    [modes/THz]

ymax = 8;

col = [1 0 0;0 1 0;0 0 1;0 1 1;1 0 1;1 1 0;0 0 0]; #顏色參數(不要動)

xmax_conf = 5; % frequency range (THz) From mesh.conf

pitch = 0.001; %From mesh.conf
