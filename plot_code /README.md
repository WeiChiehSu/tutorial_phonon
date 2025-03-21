這裡的matlab code是用來繪製Phononpy計算的聲子性質.

# phononpy_phonon_band.m

phononpy_phonon_band.m可以讀取band.yaml進行繪製聲子譜

下面為 phononpy_phonon_band.m 的輸入參數:

material_name = 'NaCl'; #材料名

high_symmetry_point_name = {'\Gamma','X','M','\Gamma','R','interpreter','LaTex'}; #高對稱點

natom = 2; #原子數

hs = 5;       % # of high symmetry point

ymin = 0;    % frequency range [THz]

ymax = 7;

# phononpy_phonon_dos.m

phononpy_phonon_dos.m可以讀取total_dos.data進行繪製總聲子態密度

下面為 phononpy_phonon_dos.m 的輸入參數:

material_name = '114514'; #材料名

natom = 6; #原子數

xmin = 0;    % frequency range (THz)

xmax = 5;   

ymin = 0;    % DOS range    [modes/THz]

ymax = 8;

col = [1 0 0;0 1 0;0 0 1;0 1 1;1 0 1;1 1 0;0 0 0]; #顏色參數(不要動)

xmax_conf = 5; % frequency range (THz) From mesh.conf

pitch = 0.001; %From mesh.conf

# phononpy_phonon_pdos.m

phononpy_phonon_pdos.m可以讀取total_dos.data進行繪製每個原子的聲子投影態密度(如要考慮不同原子貢獻的總和,需要修改code)

下面為 phononpy_phonon_pdos.m 的輸入參數:

material_name = 'NaCl'; #材料名

natom = 2; #原子數

xmin = 0;    % frequency range (THz)

xmax = 40;   

ymin = 0;    % DOS range    [modes/THz]

ymax = 4;

projected_ymax = 3; % projected DOS range    [modes/meV]

xmax_conf = 40; %frequency range (THz) From mesh.conf

pitch = 0.01; %From mesh.conf

col = [1 0 0;0 1 0;0 0 1;0 1 1;1 0 1;1 1 0;0 0 0]; #顏色參數(不要動)

# phononpy_thermal_properties.m

phononpy_thermal_properties.m 可以讀取thermal_properties.yaml進行繪製材料的熵,比熱,自由能和聲子能量隨著溫度的變化

下面為 phononpy_thermal_properties.m 的輸入參數:

material_name = 'NaCl';

natom = 2; #原子數

TMIX = 0; #溫度下限

TMAX =1000; #溫度上限

TSTEP = 10; 

ymin = -100;

ymax = 250;
