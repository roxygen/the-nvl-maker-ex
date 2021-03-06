;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
;--------------------------------------------------
;存储图形样式设定
;--------------------------------------------------
*window
[window_down width=1010 height=565 title="存储图形样式设定"]
;----------------------------------------------
[iscript]
drawFrame("基本设定",2,15,50,kag.fore.layers[3]);
[endscript]
[line title="背景" name="f.config_save.bgd" type="pic" path="others" x=30 y=70]
[line title="新档标记" name="f.config_save.lastsavemark" type="pic" path="others" x=30 y=100]
;[line title="页数显示" name="f.config_save.pagecolor" type="color" x=30 y=130]

;存储按钮(normal/over/on)
[iscript]
drawFrame("存储按钮",5,15,160,kag.fore.layers[3]);
[endscript]
[line title="一般" name="f.config_save.button.normal" type="pic" path="others" x=30 y=180]
[line title="选中" name="f.config_save.button.over" type="pic" path="others" x=30 y=210 copyfrom="f.config_save.button.normal"]
[line title="按下" name="f.config_save.button.on" type="pic" path="others" x=30 y=240 copyfrom="f.config_save.button.over"]
[line title="选中SE" name="f.config_save.button.enterse" type="sound" x=30 y=270]
[line title="按下SE" name="f.config_save.button.clickse" type="sound" x=30 y=300]

;返回按钮(normal/over/on)
[iscript]
drawFrame("返回按钮",5,15,360,kag.fore.layers[3]);
[endscript]
[line title="一般" name="f.config_save.back.normal" type="pic" path="others" x=30 y=380]
[line title="选中" name="f.config_save.back.over" type="pic" path="others" x=30 y=410 copyfrom="f.config_save.back.normal"]
[line title="按下" name="f.config_save.back.on" type="pic" path="others" x=30 y=440 copyfrom="f.config_save.back.over"]
[line title="选中SE" name="f.config_save.back.enterse" type="sound" x=30 y=470]
[line title="按下SE" name="f.config_save.back.clickse" type="sound" x=30 y=500]

;上翻页按钮(normal/over/on)
[iscript]
drawFrame("向上翻页",5,345,160,kag.fore.layers[3]);
[endscript]
[line title="一般" name="f.config_save.up.normal" type="pic" path="others" x=360 y=180]
[line title="选中" name="f.config_save.up.over" type="pic" path="others" x=360 y=210 copyfrom="f.config_save.up.normal"]
[line title="按下" name="f.config_save.up.on" type="pic" path="others" x=360 y=240 copyfrom="f.config_save.up.over"]
[line title="选中SE" name="f.config_save.up.enterse" type="sound" x=360 y=270]
[line title="按下SE" name="f.config_save.up.clickse" type="sound" x=360 y=300]
;
;下翻页按钮(normal/over/on)
[iscript]
drawFrame("向下翻页",5,345,360,kag.fore.layers[3]);
[endscript]
[line title="一般" name="f.config_save.down.normal" type="pic" path="others" x=360 y=380]
[line title="选中" name="f.config_save.down.over" type="pic" path="others" x=360 y=410 copyfrom="f.config_save.down.normal"]
[line title="按下" name="f.config_save.down.on" type="pic" path="others" x=360 y=440 copyfrom="f.config_save.down.over"]
[line title="选中SE" name="f.config_save.down.enterse" type="sound" x=360 y=470]
[line title="按下SE" name="f.config_save.down.clickse" type="sound" x=360 y=500]
;----------------------------------------------
;悬停文字(章节/日期/对话)
[iscript]
drawFrame("悬停文字颜色",2,345,50,kag.fore.layers[3]);
[endscript]
[line title="章节名称" name="f.config_save.draw.bookmark" type="color" x=360 y=60]
[line title="存档日期" name="f.config_save.draw.date" type="color" x=360 y=85 copyfrom="f.config_save.draw.bookmark"]
[line title="最近对话" name="f.config_save.draw.talk" type="color" x=360 y=110 copyfrom="f.config_save.draw.bookmark"]

;按钮文字-档案编号(normal/over/on)
[iscript]
drawFrame("按钮文字颜色：档案编号",2,675,50,kag.fore.layers[3]);
[endscript]
[line title="一般" name="f.config_save.num.normal" type="color" x=690 y=60]
[line title="选中" name="f.config_save.num.over" type="color" x=690 y=85 copyfrom="f.config_save.num.normal"]
[line title="按下" name="f.config_save.num.on" type="color" x=690 y=110 copyfrom="f.config_save.num.over"]
;
;章节名称(normal/over/on)
[iscript]
drawFrame("按钮文字颜色：章节名称",2,675,150,kag.fore.layers[3]);
[endscript]
[line title="一般" name="f.config_save.bookmark.normal" type="color" x=690 y=160]
[line title="选中" name="f.config_save.bookmark.over" type="color" x=690 y=185 copyfrom="f.config_save.bookmark.normal"]
[line title="按下" name="f.config_save.bookmark.on" type="color" x=690 y=210 copyfrom="f.config_save.bookmark.over"]

;存档日期(normal/over/on)
[iscript]
drawFrame("按钮文字颜色：存档日期",2,675,250,kag.fore.layers[3]);
[endscript]
[line title="一般" name="f.config_save.date.normal" type="color" x=690 y=260]
[line title="选中" name="f.config_save.date.over" type="color" x=690 y=285 copyfrom="f.config_save.date.normal"]
[line title="按下" name="f.config_save.date.on" type="color" x=690 y=310 copyfrom="f.config_save.date.over"]
;
;对话记录(normal/over/on)
[iscript]
drawFrame("按钮文字颜色：最近对话",2,675,350,kag.fore.layers[3]);
[endscript]
[line title="一般" name="f.config_save.history.normal" type="color" x=690 y=360]
[line title="选中" name="f.config_save.history.over" type="color" x=690 y=385 copyfrom="f.config_save.history.normal"]
[line title="按下" name="f.config_save.history.on" type="color" x=690 y=410 copyfrom="f.config_save.history.over"]
;----------------------------------------------
[s]

*选择音声
[call storage="window_bgm.ks"]
[jump target=*window]

*选择图片
[call storage="window_picture.ks"]
[jump target=*window]

*选择颜色
[call storage="window_color.ks"]
[jump target=*window]

*确认
;保存当前f.config_save
[commit]
[iscript]
(Dictionary.saveStruct incontextof f.config_save)(sf.path+"macro/"+'uisave.tjs');
[endscript]

*关闭选单
;重载f.config_save
[iscript]
f.config_save=Scripts.evalStorage(sf.path+"macro/"+'uisave.tjs');
[endscript]

[rclick enabled="false"]
[freeimage layer="3"]
[freeimage layer="4"]
[current layer="message3"]
[er]
[layopt layer="message3" visible="false"]
[jump storage="gui_main.ks"]
