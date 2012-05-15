;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
[iscript]
f.參數.autor=false;
f.參數.autow=true;

f.文本框=new MultiEditLayer(kag , kag.fore.base);
f.文本框.text=f.參數.text;
f.文本框.left=(kag.scWidth-700)/2+25;
f.文本框.top=10+205;
[endscript]

*window
[window_middle width=700 height=600 title="顯示對話"]
[line title="姓名" name="f.參數.name" x=30 y=50 type="list" target=*選擇姓名]
[line title="顏色" name="f.參數.color" x=30 y=80 type="color"]
[line title="頭像" name="f.參數.face" x=30 y=110 type="pic" path="face"]

[line title="角色" name="f.參數.fg" x=330 y=50 type="pic" path="fgimage"]
[line title="編號" name="f.參數.layer" x=330 y=80 type=list target="*選擇前景層"]
[line title="語音" name="f.參數.vo" x=330 y=110 type="voice"]
[locate x=30 y=140]
指令
[locate x=100 y=140]
[link exp="f.文本框.insertCharacter('[lr]')"]換行等待
[endlink]
[locate x=200 y=140]
[link exp="f.文本框.insertCharacter('[w]')"]分頁等待
[endlink]
[locate x=300 y=140]
[link exp="f.文本框.insertCharacter('[r]')"]單純換行[endlink]
[locate x=400 y=140]
[link exp="f.文本框.insertCharacter('[indent]')"]文字縮進[endlink]
[locate x=500 y=140]
[link exp="f.文本框.insertCharacter('[endindent]')"]解除縮進[endlink]

[locate x=30 y=170]
符號
[locate x=100 y=170]
[link exp="f.文本框.insertCharacter('【】')"]【】[endlink]  
[link exp="f.文本框.insertCharacter('『』')"]『』[endlink]  
[link exp="f.文本框.insertCharacter('【】')"]【】[endlink]  
[link exp="f.文本框.insertCharacter('「」')"]「」[endlink]

[line title="文字色" name="f.參數.fontcolor" x=300 y=170 type="color"]
[locate x=590 y=170]
[link exp="f.文本框.insertCharacter('[font color='+f.參數.fontcolor+']') if (f.參數.fontcolor!=void)"]插入[endlink]

[line title="段落末尾" x=30 y=515]
[locate x=130 y=515]
[checkbox name="f.參數.autor" opacity=0] 自動換行  
[checkbox name="f.參數.autow" opacity=0] 自動分頁

[iscript]
f.文本框.visible=true;
[endscript]
[s]

*確認
[commit]
;----------------------------------------
[iscript]
//假如有人物姓名
if (f.參數.name!=void)
{
     //人物姓名輸入
     var dic=%[];
     if (findName(f.參數.name)) dic.tagname=f.參數.name;
     else
     {
       dic.tagname="npc";
       dic.id=f.參數.name;
     }
     //其他的處理
     dic.color=f.參數.color;
     dic.face=f.參數.face;
     dic.fg=f.參數.fg;
     dic.layer=f.參數.layer;
     //寫入
     commitLine(dic);
     //新增一行空白
     addLine();
     
     //假如有語音
	if (f.參數.vo!=void)
	{
	     var dic=%[];
	     dic.tagname="vo";
	     dic.storage=f.參數.vo;
	     //寫入
	     commitLine(dic);
	     f.參數.vo=void;
	     //新增一行空白
	     addLine();
	}
     
     //寫入文本處理
     multiLine(spiltLine());
}
//假如沒有人物姓名
else
{
   //文本處理
   multiLine(spiltLine());
}
[endscript]
;----------------------------------------
[iscript]
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

;-----------------------------------------------------------------
*選擇圖片
[call storage="window_picture.ks"]
[jump target=*window]

*選擇顏色
[call storage="window_color.ks"]
[jump target=*window]

*選擇音聲
[call storage="window_bgm.ks"]
[jump target=*window]

*選擇前景層
[list_fglayer x=334 y=80]
[s]

*選擇姓名
[list x=34 y=50 line=&"f.config_name.count-1" layer="message6"]
[link target=*關閉下拉菜單 exp="f.參數.name='主角'"]主角[endlink]
[iscript]
for (var i=2;i<f.config_name.count;i++)
{
      kag.tagHandlers.r(%[]);
      //描繪列表
      var setting=new Dictionary();
      setting.target="*關閉下拉菜單";
      setting.exp="f.參數.name=\'"+f.config_name[i].tag+"\'";
      kag.tagHandlers.link(setting);
      kag.tagHandlers.ch(%["text"=>f.config_name[i].tag]);
      kag.tagHandlers.endlink(%[]);

}
[endscript]
[s]

*關閉下拉菜單
[rclick enabled="false"]
[current layer="message6"]
[er]
[layopt layer="message6" visible="false"]
[jump target=*window]

*輸入姓名
[rclick enabled="false"]
[current layer="message6"]
[er]
[layopt layer="message6" visible="false"]
[input name="f.參數.name" title=輸入姓名 prompt="請輸入要顯示的人名：          "]
[jump target=*window]
