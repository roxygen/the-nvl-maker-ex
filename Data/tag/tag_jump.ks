;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
*window
[window_middle width=400 height=300 title="事件跳转"]
[line title="标签" name="f.参数.target" x=30 y=50]
[line title="文件" name="f.参数.storage" x=30 y=80 type="script"]
[s]

*选择文件
[call storage="window_file.ks"]
[jump target=*window]

*确认
[commit]
[iscript]
//防止出错用——假如参数开头不是星号，强制加入星号
if (f.参数.target!=void && f.参数.target[0]!="*") f.参数.target="*"+f.参数.target;
[endscript]
[eval exp="commitLine(f.参数)"]
[jump storage="tag_direct.ks" target=*擦除窗口]

*关闭选单
[jump storage="tag_direct.ks" target=*关闭选单]
