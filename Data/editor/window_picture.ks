;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
[iscript]
function updatePicture()
{
	//描繪圖片顯示區域
	with(kag.fore.layers[8])
	{
	  .visible=true;
	  .width=1290;
	  .height=650;
	  .left=kag.fore.layers[7].left+20;
	  .top=kag.fore.layers[7].top+70;
	  
	  .fillRect(0,0,.width,.height,0xFFFFFFFF);
	  
	  .fillRect(0,0,.width,1,0xFFaca899);
	  .fillRect(0,0,1,.height,0xFFaca899);
	  .fillRect(0,.height-1,.width,1,0xFFaca899);
	  .fillRect(.width-1,0,1,.height,0xFFaca899);
	  .font.height=16;
	}
	//設定滾動條位置
	   with(kag.fore.layers[9])
	   {
		  .visible=true;
		  .top=kag.fore.layers[7].top+86;
		  if (f.page>1) .top+=(int)(f.curpage-1)*603/(f.page-1);
	   }
	//描繪縮略圖
	for (var i=(f.curpage-1)*15;i<f.curpage*15;i++)
	{
			if (i>=f.list.count) break;
			
			var abs=i-(f.curpage-1)*15;
			
			var posX=15+(abs%5)*(240+13);
			var posY=20+(abs\5)*(180+30);
			
			with(kag.fore.layers[8])
		   {
			  .operateRect(posX, posY, f.list[i].layer, 0, 0, 240, 180);
			  .drawText(posX,posY+180,f.list[i].name,0x000000);
			  .fillRect(posX,posY,240,1,0xFFaca899);
			  .fillRect(posX,posY,1,180,0xFFaca899);
			  .fillRect(posX,posY+180-1,240,1,0xFFaca899);
			  .fillRect(posX+240-1,posY,1,180,0xFFaca899);
		   //選中
			  if (f.select==i) 
			  {
				.colorRect(posX-4,posY-4,240+8,180+22,0x0000FF,50);
				
				.colorRect(posX-4,posY-4,240+8,1,0x0000FF,128);
				.colorRect(posX-4,posY-4,1,180+22,0x0000FF,128);
				.colorRect(posX-4,posY-5+180+22,240+8,1,0x0000FF,128);
				.colorRect(posX-5+240+8,posY-4,1,180+22,0x0000FF,128);
			  }
			}
	}
	//描繪右側大圖
	// with(kag.fore.layers[10])
	// {
	  // .visible=true;
	  // .width=750;
	  // .height=560;
	  // .left=kag.fore.layers[7].left+600;
	  // .top=kag.fore.layers[7].top+70;
	  
	  // .fillRect(0,0,.width,.height,0xFFFFFFFF);
	// }
	//預覽
	// if (f.list[f.select]!=void)
	// {
	   // with(f.templayer)
	   // {
		  // .visible=true;
		  // .loadImages(f.list[f.select].name);
		  // .setSizeToImageSize();
	   // }
	// }
	// else {f.templayer.fillRect(0,0,f.templayer.width,f.templayer.height,0xFFFFFFFF);}

}
[endscript]
;---------------------------------------------------------------
;圖片選擇
;---------------------------------------------------------------
*window
[window_up_sp width=1350 height=748 title="選擇圖片"]
;圖片選擇按鈕
[iscript]
  for (var i=0;i<15;i++)
  {
     kag.tagHandlers.locate(
     %[
         "x"=>15+30+(i%5)*(240+13),
         "y"=>20+70+(i\5)*(180+30),
      ]
      );
      var setting=new Dictionary();
      setting.normal="edit_button_selpicture";
      setting.exp="setselect("+i+","+15+")";
      kag.tagHandlers.button(setting);
  }

[endscript]
;翻頁按鈕
[button_page x=1320 y=70 length=650]
;滾動條按鈕
[image layer=9 storage="edit_slider_button" left=&"(int)kag.fore.layers[7].left+1320"]
[button_slider x=1320 y=86 normal="edit_slider_back3"]
;下拉菜單
[line title="文件夾" name="f.fold" type="list" target="*選擇文件夾" x=30 y=40]
[iscript]
//計算頁數
countPage(f.list.count,15);
f.curpage=1;
//當前窗口
f.window="picture";

//f.templayer=new Layer(kag,kag.fore.layers[10]);

if (f.list[f.select]!=void) tf.preview.getPicture(f.list[f.select].name);
kag.bringToFront();

update();
[endscript]
;縮略圖拖動
;[locate x=600 y=717]
;[slider value="f.templayer.left" max=255 height=10 width=750 min=-512 max=0]
[s]

*選擇文件夾
[list x=46 y=40 line=7 layer="message8" width=188]
[link exp="(f.bgimage=loadpic('bgimage') if f.bgimage==void),(f.list=f.bgimage)" target=*關閉下拉菜單]背景[endlink][r]
[link exp="(f.fgimage=loadpic('fgimage') if f.fgimage==void),(f.list=f.fgimage)" target=*關閉下拉菜單]前景[endlink][r]
[link exp="(f.rule=loadpic('rule') if f.rule==void),(f.list=f.rule)" target=*關閉下拉菜單]遮片[endlink][r]
[link exp="(f.face=loadpic('face') if f.face==void),(f.list=f.face)" target=*關閉下拉菜單]頭像[endlink][r]
[link exp="(f.image=loadpic('image') if f.image==void),(f.list=f.image)" target=*關閉下拉菜單]圖片[endlink][r]
[link exp="(f.others=loadpic('others') if f.others==void),(f.list=f.others)" target=*關閉下拉菜單]其他[endlink][r]
[link exp="(f.map=loadpic('map') if f.map==void),(f.list=f.map)" target=*關閉下拉菜單]地圖[endlink]
[s]

*關閉下拉菜單
[current layer="message8"]
[er]
[layopt layer="message8" visible="false"]
[jump target=*window]

*確認
[if exp="f.list[f.select]!=void"]
[eval exp=&"tf.當前編輯值+'=\''+f.list[f.select].name+'\''"]
[endif]

*關閉選單
[eval exp="f.window=''"]
[rclick enabled="false"]
[freeimage layer="7"]
[freeimage layer="8"]
[freeimage layer="9"]
;[eval exp="delete f.templayer"]
[freeimage layer="10"]
[current layer="message8"]
[er]
[layopt layer="message8" visible="false"]
[current layer="message7"]
[er]
[layopt layer="message7" visible="false"]
[return]
