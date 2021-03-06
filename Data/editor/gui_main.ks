;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
;---------------------------------------------------------------
;界面设定
;---------------------------------------------------------------
*start
[eval exp="drawPageBoard(72)"]
;---------------------------------------------------------------
[unlocklink]
[current layer="message1"]
[er]
;---------------------------------------------------------------
;有工程时，显示按钮
[if exp="sf.project!=void"]
;---------------------------------------------------------------
[frame title="主界面样式" line=1 x=15 y=15]

[locate x=50 y=40]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" target=*KAGConfig]
[eval exp="drawButtonCaption('Config.tjs',16)"]

[locate x=190 y=40]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" target=*对话画面]
[eval exp="drawButtonCaption('对话画面',16)"]

;---------------------------------------------------------------
[frame title="系统样式" line=2 x=15 y=95]

;title
[locate x=50 y=120]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" target=*标题画面]
[eval exp="drawButtonCaption('默认标题',16)"]

;menu
[locate x=190 y=120]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" target=*主菜单]
[eval exp="drawButtonCaption('主选单',16)"]

;option
[locate x=50 y=150]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" target=*系统设定]
[eval exp="drawButtonCaption('系统设定',16)"]

;history
[locate x=190 y=150]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" target=*对话履历]
[eval exp="drawButtonCaption('历史记录',16)"]

;---------------------------------------------------------------
[frame title="存取系统样式" line=2 x=15 y=205]

;版面
[locate x=50 y=230]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" target=*存取版面设定]
[eval exp="drawButtonCaption('通用排版',16)"]

;save
[locate x=50 y=260]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" target=*存储系统图形]
[eval exp="drawButtonCaption('存储画面',16)"]
;load
[locate x=190 y=260]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" target=*读取系统图形]
[eval exp="drawButtonCaption('读取画面',16)"]
;---------------------------------------------------------------
[frame title="特别模式" line=1 x=15 y=315]
[locate x=50 y=340]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" target=*CG界面]
[eval exp="drawButtonCaption('CG界面编辑',16)"]
[iscript]
tf.cgpath=Storages.getLocalName(sf.path+"macro/"+"cglist.txt");
[endscript]
[locate x=190 y=340]
[button normal="edit_button_normal" over="edit_button_over" on="edit_button_on" exp="System.shellExecute(tf.cgpath)" hint="将所有需要显示的CG图片名，每行一个写进本TXT中即可按顺序显示"]
[eval exp="drawButtonCaption('CG列表编辑',16)"]
[endif]
[s]

*标题画面
[iscript]
//重载
f.setting=getConfig();
[endscript]
[jump storage="gui_title.ks"]

*主菜单
[iscript]
//重载
f.setting=getConfig();
[endscript]
[jump storage="gui_menu.ks"]

*对话画面
[iscript]
//重载
f.setting=getConfig();
[endscript]
[jump storage="gui_dia.ks"]

*KAGConfig
[iscript]
var config_path1=System.exePath + 'project/'+sf.project+'/Data/'+'Config.tjs';
var config_path2=Storages.getLocalName(config_path1);
System.shellExecute(Storages.getLocalName(System.exePath+'tool/') + 'KAGConfigEx2.exe',"\""+config_path2+"\"");
[endscript]
[jump target=*start]

*系统设定
[iscript]
//重载
f.setting=getConfig();
[endscript]
[jump storage="gui_option.ks"]

*对话履历
[iscript]
//重载
f.setting=getConfig();
[endscript]
[jump storage="gui_history.ks"]

*存取版面设定
[iscript]
//重载
f.setting=getConfig();
[endscript]
[jump storage="gui_sl.ks"]

*存储系统图形
[jump storage="gui_savestyle.ks"]

*读取系统图形
[jump storage="gui_loadstyle.ks"]

*CG界面
[iscript]
//重载
f.setting=getConfig();
[endscript]
[jump storage="gui_cgmode.ks"]
