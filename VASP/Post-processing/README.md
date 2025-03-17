擁有FORCE_SETS和phonopy_disp.yaml後,便能計算聲子性質,以下是計算聲子性質的方法:

# 聲子譜

Band structure 可以通過以下命令繪製：

phonopy-load --band "0.5 0.5 0.5  0.0 0.0 0.0  0.5 0.5 0.0  0.0 0.5 0.0" -p -s 

PS. 0.5 0.5 0.5 為高對稱點 -p 表示繪製圖片 -s 表示將圖片儲存成pdf

or

運行腳本 phonopy_phonon_band.sh:

qsub phonopy_phonon_band.sh

PS.推薦 可在腳本中改變聲子譜切點密度(BAND_POINTS = 200表示在設置的高對稱點路徑間切200個點)

運行過後會生成band.yaml和band.pdf band.yaml可以用VASP_phononpy_phonon_band.m進行繪製聲子譜

下圖為用VASP_phononpy_phonon_band.m進行繪製的無磁性的GdSbTe聲子譜

![圖片描述](https://github.com/WeiChiehSu/tutorial_phonon/blob/main/VASP/Post-processing/phonon_band/phonon-band.png)


# 聲子態密度

狀態密度（DOS）通過以下命令繪製：

phonopy-load --mesh 20 20 20 -p -s

PS. mesh 20 20 20 表示對晶體的三個晶軸XYZ切20個點進行計算 切點多寡會影響計算結果收斂 需測試

or

運行腳本 phonopy_phonon_dos_change.sh:

qsub phonopy_phonon_dos_change.sh

PS.推薦 可在腳本中改變聲子狀態密度的繪製設置(DOS_RANGE = 0 5 0.0001表示繪製0-5THZ間的聲子狀態密度 每0.0001THZ繪製一個數值)

運行過後會生成total_dos.dat和total_dos.pdf total_dos.dat可以用VASP_phononpy_phonon_dos.m進行繪製聲子譜

下圖為用VASP_phononpy_phonon_band.m進行繪製的有磁性 DFT+U的GdSbTe聲子態密度:

![圖片描述](https://github.com/WeiChiehSu/tutorial_phonon/blob/main/VASP/Post-processing/DOS/dos_total.png)
