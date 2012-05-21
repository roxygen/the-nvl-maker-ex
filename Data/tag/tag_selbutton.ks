;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
*window
[window_middle width=500 height=440 title="選項按鈕"]
[iscript]
drawFrame("按鈕圖形",6,15,40,kag.fore.layers[5],314);

drawFrame("執行操作",3,15,270,kag.fore.layers[5],314);

[endscript]
[line title="選項文字" name="f.參數.text" x=30 y=60]
[line title="一般" name="f.參數.normal" x=30 y=90 type="pic" path="others"]
[line title="選中" name="f.參數.over" x=30 y=120 type="pic" path="others" copyfrom="f.參數.normal"]
[line title="按下" name="f.參數.on" x=30 y=150 type="pic" path="others" copyfrom="f.參數.over"]
[line title="選中SE" name="f.參數.enterse" x=30 y=180 type="sound"]
[line title="按下SE" name="f.參數.clickse" x=30 y=210 type="sound"]

[line title="標籤" name="f.參數.target" x=30 y=290]
[line title="文件" name="f.參數.storage" x=30 y=320 type="script"]
[line title="表達式" name="f.參數.exp" x=30 y=350]

[s]

*確認
[commit]
[iscript]
//防止出錯用——假如參數開頭不是星號，強制加入星號
if (f.參數.target!=void && f.參數.target[0]!="*") f.參數.target="*"+f.參數.target;
[endscript]
[eval exp="commitLine(f.參數)"]
[jump storage="tag_direct.ks" target=*擦除窗口]

*關閉選單
[jump storage="tag_direct.ks" target=*關閉選單]

*選擇音聲
[call storage="window_bgm.ks"]
[jump target=*window]

*選擇文件
[call storage="window_file.ks"]
[jump target=*window]

*選擇圖片
[call storage="window_picture.ks"]
[jump target=*window]
