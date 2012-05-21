;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
;--------------------------------------------------
;系統按鈕設定,包括x,y,normal,over,on幾個選項
;--------------------------------------------------
*window
[window_middle width=400 height=380 title="系統按鈕樣式設定"]
[line title="x" name="f.參數.x" x=30 y=50]
[line title="y" name="f.參數.y" x=30 y=80]
[line title="一般" name="f.參數.normal" x=30 y=110 type="pic" path="others"]
[line title="選中" name="f.參數.over" x=30 y=140 type="pic" path="others" copyfrom="f.參數.normal"]
[line title="按下" name="f.參數.on" x=30 y=170 type="pic" path="others" copyfrom="f.參數.over"]
[line title="選中SE" name="f.參數.enterse" x=30 y=200 type="sound"]
[line title="按下SE" name="f.參數.clickse" x=30 y=230 type="sound"]
[s]

*選擇圖片
[call storage="window_picture.ks"]
[jump target=*window]

*選擇音聲
[call storage="window_bgm.ks"]
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
