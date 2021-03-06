;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
[iscript]
f.编辑用字典=dictoForm(f.参数);
//如果是空白行就清掉
if  (f.编辑用字典[0]=="_blank") f.编辑用字典[0]="";
[endscript]

*window
[window_middle width=700 height=550 title="直接输入"]
[line title="指令 @" name="f.编辑用字典[0]" x=30 y=50]

[eval exp="tf.循环=1"]

*circle
[iscript]
if (f.编辑用字典[tf.循环]==void)
{
f.编辑用字典[tf.循环]=%[];
}
tf.操作属性="f.编辑用字典["+tf.循环+"].elm";
tf.操作值="f.编辑用字典["+tf.循环+"].value";
[endscript]

[line title="&('参数'+tf.循环)" name=&tf.操作属性 x=30 y=&(50+30*tf.循环)]
[line title="=" name=&tf.操作值 x=290 y=&(50+30*tf.循环)]
[eval exp="tf.循环++"]
[jump target=*circle cond="tf.循环<16"]
[s]

*确认
[commit]
[iscript]
if (f.编辑用字典[0]!=void)
{
//参数格式设置
f.参数=formtoDic(f.编辑用字典);
//参数正式写入
commitLine(f.参数);
}
[endscript]

*擦除窗口
[rclick enabled="false"]
[freeimage layer="5"]
[current layer="message5"]
[er]
[layopt layer="message5" visible="false"]
[return storage="window_tag.ks" target=*关闭选单]

*关闭选单
[iscript]
//变数重设
f.参数=%[];
[endscript]
[rclick enabled="false"]
[freeimage layer="5"]
[current layer="message5"]
[er]
[layopt layer="message5" visible="false"]
[return]
