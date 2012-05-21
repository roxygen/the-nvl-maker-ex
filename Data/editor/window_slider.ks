;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
;--------------------------------------------------
;滑動槽設定,包括x,y,base,normal,over,on幾個選項
;--------------------------------------------------
*window
[window_middle width=400 height=400 title="滑動槽樣式設定"]
[line title="位置" x=30 y=50]
[line title="x" name="f.參數.x" x=30 y=80]
[line title="y" name="f.參數.y" x=30 y=110]
[line title="底圖" name="f.參數.base" x=30 y=150 type="pic" path="others"]
[line title="滑動按鈕" x=30 y=190]
[line title="一般" name="f.參數.normal" x=30 y=220 type="pic" path="others"]
[line title="選中" name="f.參數.over" x=30 y=250 type="pic" path="others" copyfrom="f.參數.normal"]
[line title="按下" name="f.參數.on" x=30 y=280 type="pic" path="others" copyfrom="f.參數.over"]
[s]

*選擇圖片
[call storage="window_picture.ks"]
[jump target=*window]

*確認
[commit]
[eval exp=&"tf.當前操作層+'.Reset(f.參數)'"]

*關閉選單
[freeimage layer="5"]
[current layer="message5"]
[er]
[layopt layer="message5" visible="false"]
[return]
