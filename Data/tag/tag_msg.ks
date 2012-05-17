;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
[iscript]
f.参数.autor=false;
f.参数.autow=false;

f.文本框=new MultiEditLayer(kag , kag.fore.base);
f.文本框.text=f.参数.text;
f.文本框.left=(kag.scWidth-700)/2+25;
f.文本框.top=10+105;
[endscript]

*window
[window_middle width=700 height=600 title="编辑文本"]
[locate x=30 y=40]
タグ
[locate x=160 y=40]
[link exp="f.文本框.insertCharacter('[lr]')"]改行待ち
[endlink]
[locate x=250 y=40]
[link exp="f.文本框.insertCharacter('[w]')"]改ページ待ち
[endlink]
[locate x=100 y=40]
[link exp="f.文本框.insertCharacter('[r]')"]改行[endlink]
[locate x=400 y=40]
[link exp="f.文本框.insertCharacter('[indent]')"]インデント[endlink]
[locate x=500 y=40]
[link exp="f.文本框.insertCharacter('[endindent]')"]インデント终了[endlink]

[locate x=30 y=70]
記号
[locate x=100 y=70]
[link exp="f.文本框.insertCharacter('【】')"]【】[endlink]  
[link exp="f.文本框.insertCharacter('『』')"]『』[endlink]  
[link exp="f.文本框.insertCharacter('〖〗')"]〖〗[endlink]  
[link exp="f.文本框.insertCharacter('「」')"]「」[endlink]

[line title="文字色" name="f.参数.fontcolor" x=300 y=70 type="color"]
[locate x=590 y=70]
[link exp="f.文本框.insertCharacter('[font color='+f.参数.fontcolor+']') if (f.参数.fontcolor!=void)"]插入[endlink]

[line title="段落末尾" x=30 y=415]
[locate x=130 y=415]
[checkbox name="f.参数.autor" opacity=0] 改行  
[checkbox name="f.参数.autow" opacity=0] 改ページ クリック待ち

[iscript]
f.文本框.visible=true;
[endscript]

[s]

*确认
[commit]

[iscript]
//文本处理
multiLine(spiltLine());

f.文本框.visible=false;
f.文本框=void;

[endscript]
[jump storage="tag_direct.ks" target=*擦除窗口]

*关闭选单
[iscript]
f.文本框.visible=false;
f.文本框=void;
[endscript]
[jump storage="tag_direct.ks" target=*关闭选单]

*选择颜色
[call storage="window_color.ks"]
[jump target=*window]
