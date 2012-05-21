;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
*window
[window_middle width=400 height=350 title="停止音效"]

[group title="停止音效" name="f.參數.tagname" x=30 y=50 comp="stopse"]
[group title="音效漸變" name="f.參數.tagname" x=30 y=80 comp="fadese"]
[group title="音效漸出" name="f.參數.tagname" x=30 y=110 comp="fadeoutse"]

[line title="編號" name="f.參數.buf" x=30 y=150]

[if exp="f.參數.tagname=='fadeoutse'"]
[line title="時間" name="f.參數.time" x=30 y=180]

[elsif exp="f.參數.tagname=='fadese'"]
[line title="時間" name="f.參數.time" x=30 y=180]
[line title="音量" name="f.參數.volume" x=30 y=210]
[endif]

[s]

*確認
[commit]
[iscript]
//清理非必要參數
if (f.參數.tagname=="stopse") 
{
f.參數.time=void;
f.參數.volume=void;
}
else if (f.參數.tagname=="fadeoutse")
{
f.參數.volume=void;
}
[endscript]
[eval exp="commitLine(f.參數)"]
[jump storage="tag_direct.ks" target=*擦除窗口]

*關閉選單
[jump storage="tag_direct.ks" target=*關閉選單]
