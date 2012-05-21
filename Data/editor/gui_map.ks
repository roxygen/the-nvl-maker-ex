;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
;---------------------------------------------------------------
;地圖編輯窗口
;---------------------------------------------------------------
*start
[window_down width=&"sf.gs.width+200" height=&"sf.gs.height+100" title="地圖編輯窗口"]
[iscript]
//創建層
f.uilayer=[];
for (var i=0;i<f.config_map.count-1;i++)
{
f.uilayer[i]=new uiMapButtonLayer(f.config_map[i+1]);
}
[endscript]
;---------------------------------------------------------------
*window
[window_down width=&"sf.gs.width+200" height=&"sf.gs.height+100" title="地圖編輯窗口"]
[iscript]
//--------------------------------------------
//背景重載
with(kag.fore.layers[3])
{
   .fillRect(20,50,sf.gs.width,sf.gs.height,0xFFC8C8C8);
}

with(kag.fore.layers[4])
{
   .left=kag.fore.layers[3].left+20;
   .top=kag.fore.layers[3].top+50;
   .visible=true;
   .loadImages(%["storage"=>f.config_map[0].bgd]);
   .width=sf.gs.width;
   .height=sf.gs.height;
}
//--------------------------------------------------------
//刷新圖層
      //所有層全部不選中
      for (var i=0;i<f.uilayer.count;i++)
      {
         if (f.uilayer[i].select)
         {
           f.uilayer[i].select=false;
           f.uilayer[i].drawSelect();
         }
      }
//--------------------------------------------
//設定界面
drawFrame("基本設定",1,sf.gs.width+40,50,kag.fore.layers[3],140);
drawEdit("背景圖形",,sf.gs.width+70,70);
drawLink_Picwin("f.config_map[0].bgd","map",,);
drawFrame("據點設定",12,sf.gs.width+40,130,kag.fore.layers[3],140);
//據點編輯
for (var i=0;i<f.config_map.count-1;i++)
{
drawMapButtonSetting(f.uilayer[i].place,"f.uilayer["+i+"]",sf.gs.width+50,140+i*25);
}

drawFrame("當前坐標",1,sf.gs.width+40,540,kag.fore.layers[3],140);
[endscript]
[s]

*選擇圖片
[call storage="window_picture.ks"]
[jump target=*window]


*按鈕設定
[call storage="window_mapbutton.ks"]
[jump target=*window]

*確認
[iscript]
for (var i=0;i<f.uilayer.count;i++)
{
f.config_map[i+1]=f.uilayer[i].ButtonElm();
}
//保存
f.config_map.saveStruct(sf.path+"map/"+f.mapname);
[endscript]

*關閉選單
[iscript]
delete f.uilayer;
[endscript]

[rclick enabled="false"]
[freeimage layer="3"]
[freeimage layer="4"]
[current layer="message3"]
[er]
[layopt layer="message3" visible="false"]
[jump storage="map_main.ks"]
