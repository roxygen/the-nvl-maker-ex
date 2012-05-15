;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
[iscript]
f.參數.autor=false;
f.參數.autow=false;

f.文本框=new MultiEditLayer(kag , kag.fore.base);
f.文本框.text=f.參數.text;
f.文本框.left=(kag.scWidth-700)/2+25;
f.文本框.top=10+105;
[endscript]

*window
[window_middle width=700 height=600 title="編輯文本"]
[locate x=30 y=40]
指令
[locate x=100 y=40]
[link exp="f.文本框.insertCharacter('[lr]')"]換行等待
[endlink]
[locate x=200 y=40]
[link exp="f.文本框.insertCharacter('[w]')"]分頁等待
[endlink]
[locate x=300 y=40]
[link exp="f.文本框.insertCharacter('[r]')"]單純換行[endlink]
[locate x=400 y=40]
[link exp="f.文本框.insertCharacter('[indent]')"]文字縮進[endlink]
[locate x=500 y=40]
[link exp="f.文本框.insertCharacter('[endindent]')"]解除縮進[endlink]

[locate x=30 y=70]
符號
[locate x=100 y=70]
[link exp="f.文本框.insertCharacter('【】')"]【】[endlink]  
[link exp="f.文本框.insertCharacter('『』')"]『』[endlink]  
[link exp="f.文本框.insertCharacter('【】')"]【】[endlink]  
[link exp="f.文本框.insertCharacter('「」')"]「」[endlink]

[line title="文字色" name="f.參數.fontcolor" x=300 y=70 type="color"]
[locate x=590 y=70]
[link exp="f.文本框.insertCharacter('[font color='+f.參數.fontcolor+']') if (f.參數.fontcolor!=void)"]插入[endlink]

[line title="段落末尾" x=30 y=415]
[locate x=130 y=415]
[checkbox name="f.參數.autor" opacity=0] 自動換行  
[checkbox name="f.參數.autow" opacity=0] 自動分頁

[iscript]
f.文本框.visible=true;
[endscript]

[s]

*確認
[commit]

[iscript]
//文本處理
multiLine(spiltLine());

f.文本框.visible=false;
f.文本框=void;

[endscript]
[jump storage="tag_direct.ks" target=*擦除窗口]

*關閉選單
[iscript]
f.文本框.visible=false;
f.文本框=void;
[endscript]
[jump storage="tag_direct.ks" target=*關閉選單]

*選擇顏色
[call storage="window_color.ks"]
[jump target=*window]
