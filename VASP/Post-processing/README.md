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
