# Tutorial phonon with Quantum ESPRESSO
Quantum ESPRESSO具有內建DFPT計算聲子譜的計算方法,因此只講述Finite displacement計算方法
# Finite displacement
1.讀取 QE-PW(pw.$name.scf.in)輸入文件並使用 --qe 選項創建超胞(設:ibrav = 0)：

phonopy --qe -d --dim="2 2 2" -c NaCl.in(pw.$name.scf.in)

這將創建 2x2x2 的超胞。

supercell.in 和 supercell-xxx.in（xxx 是數字）給出了完美的超胞和帶有位移的超胞文件。

對於 NaCl 範例，會創建 supercell-001.in(完美的超胞) 和 supercell-002.in(帶有位移的超胞) 兩個文件。

在這些超胞文件中，僅包含與晶體結構相關的行。還會生成 phonopy_disp.yaml，它包含超胞和位移的信息。

2.為了生成 QE-PW 輸入文件，將需要的設置信息添加到 supercell-xxx.in 文件中,運行write_header_in.sh:

sh write_header_in.sh

這裡的 header.in 是專門為 NaCl 範例創建的文件。

這個設置是根據不同系統來編寫的，因此每個系統都需要為其編寫相應的設置文件。

需要注意的是，帶有位移的超胞在進行力計算時不能進行放鬆，因為聲子計算所需的是由小的原子位移引起的原子力。

3.執行 QE-PW 超胞計算以獲取原子上的力:

qsub qe_pw_phonopy.sh

4.接下來，使用以下 phonopy 命令創建 FORCE_CONSTANTS

phonopy -f NaCl-001.out NaCl-002.out

這裡的 .out 文件是 QE-PW 計算的標準輸出文件。

如果在步驟 1 中創建了更多帶有位移的超胞，則需要將所有的 .out 文件一起傳遞給這個命令。

運行這個命令時，phonopy_disp.yaml 必須位於當前目錄中，因為其中包含了原子位移的信息，這些信息將用來生成 FORCE_CONSTANTS。

# Post-processing

繪製phonon band:

需要band.conf檔案:

band.conf設置:

DIM = 2 2 2 [超晶格]

PRIMITIVE_AXIS = 0.0 0.5 0.5  0.5 0.0 0.5  0.5 0.5 0.0 [原始晶胞軸：X Y Z]

BAND = 0.0 0.0 0.0   0.5 0.0 0.0   0.5 0.5 0.0   0.0 0.0 0.0   0.5 0.5 0.5[倒空間路徑]

運行指令:

phonopy --qe -c NaCl.in -p band.conf

將輸出檔案:band.yaml

用 QE_phononpy_phonon_band_v1.m 進行繪製:

下圖為NaCl的聲子譜:

![圖片描述](https://github.com/WeiChiehSu/tutorial_phonon/blob/main/VASP/Post-processing/thermal_properties/total_thermal_properties.png)
