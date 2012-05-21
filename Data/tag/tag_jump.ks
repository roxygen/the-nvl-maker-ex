;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
*window
[window_middle width=400 height=300 title="事件跳轉"]
[line title="標籤" name="f.參數.target" x=30 y=50]
[line title="文件" name="f.參數.storage" x=30 y=80 type="script"]
[s]

*選擇文件
[call storage="window_file.ks"]
[jump target=*window]

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
