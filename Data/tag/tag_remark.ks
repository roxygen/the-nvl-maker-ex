;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
*window
[window_middle width=400 height=200 title="插入註釋"]
[line title="內容" name="f.參數.text" x=30 y=50]

[s]

*確認
[commit]
[iscript]
if (f.參數.text!=void)
{
   if (f.參數.text[0]!=";") f.參數.text=";"+f.參數.text;
}
[endscript]
[eval exp="commitLine(f.參數)"]
[jump storage="tag_direct.ks" target=*擦除窗口]

*關閉選單
[jump storage="tag_direct.ks" target=*關閉選單]
