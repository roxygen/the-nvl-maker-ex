;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
*window
[window_middle width=400 height=370 title="顯示姓名欄(主角)"]
[eval exp="drawFrame('基本信息',2,15,40,kag.fore.layers[5],314)"]
[line title="簡稱" name="f.參數.tagname" x=30 y=60 type="list" target=*選擇姓名]
[line title="顏色" name="f.參數.color" x=30 y=90 type="color"]
[eval exp="drawFrame('同時顯示',3,15,150,kag.fore.layers[5],314)"]
[line title="頭像" name="f.參數.face" x=30 y=170 type="pic" path="face"]
[line title="角色" name="f.參數.fg" x=30 y=200 type="pic" path="fgimage"]
[line title="編號" name="f.參數.layer" x=30 y=230 type=list target="*選擇前景層"]
[s]

*確認
[commit]
[eval exp="commitLine(f.參數)"]
[jump storage="tag_direct.ks" target=*擦除窗口]

*關閉選單
[jump storage="tag_direct.ks" target=*關閉選單]

*選擇前景層
[list_fglayer x=34 y=230]
[s]

*選擇姓名
[list x=34 y=60 line=&"f.config_name.count-1" layer="message6"]
[link target=*關閉下拉菜單 exp="f.參數.tagname='主角'"]主角[endlink]
[iscript]
for (var i=2;i<f.config_name.count;i++)
{
      kag.tagHandlers.r(%[]);
      //描繪列表
      var setting=new Dictionary();
      setting.target="*關閉下拉菜單";
      setting.exp="f.參數.tagname=\'"+f.config_name[i].tag+"\'";
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

*選擇圖片
[call storage="window_picture.ks"]
[jump target=*window]

*選擇顏色
[call storage="window_color.ks"]
[jump target=*window]
