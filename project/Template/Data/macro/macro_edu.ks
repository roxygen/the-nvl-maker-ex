;------------------------------------------------------------
;養成遊戲專用宏
;和地圖相同
;背景板顯示在layer 7上
;按鈕顯示在message 1層上
;可刷新的數值顯示面板顯示在layer 9上
;------------------------------------------------------------
*start
[iscript]
//------------------------------------------------------------
//載入.edu文件
//------------------------------------------------------------
function loadedu(name)
{
//創建數組類並讀入關鍵字
var dic =[];
dic=Scripts.evalStorage(name);

 if (dic!='')
 {
   //載入背景
   kag.tagHandlers.image(%["storage" => dic[0]["bgd"],"visible" => true,"left"=>0,"top"=>0,"layer"=>"7","page"=>"back"]);
   
   //讀取空白底圖
   kag.back.layers[9].loadImages(%['storage'=>'empty','visible'=>true,'left'=>0,'top'=>0]);
   
////循環描繪按鈕-------------------------------------------------------------------------------
   for (var i=1;i<11;i++)
   {
   //定義按鈕位置
   kag.tagHandlers.locate(%["x" => dic[i]["x"], "y" => dic[i]["y"] ]);
   
   //創建按鈕用字典
   var edubutton = new Dictionary();
   //取得數據
   edubutton["normal"]=dic[i]["normal"];
   edubutton["over"]=dic[i]["over"];
   edubutton["on"]=dic[i]["on"];
   edubutton["storage"]=dic[i]["storage"];
   edubutton["target"]=dic[i]["target"];
   edubutton["exp"]=dic[i]["exp"];
   
   edubutton["enterse"]=dic[i]["enterse"];
   edubutton["clickse"]=dic[i]["clickse"];
   
   //假如有條件，取得條件表達式
   if (dic[i]["cond"]!=void) edubutton["cond"]=dic[i]["cond"];
   
       //該據點在本地圖上使用到
       if (dic[i]["use"]==1)
      {
           //滿足條件
           if (Scripts.eval(edubutton["cond"])==true) kag.tagHandlers.button(edubutton);
           //或者無需條件
           if (edubutton["cond"]==void) kag.tagHandlers.button(edubutton);
      }
      
      
   }
//
// //-------------------------------------------------------------------------------
 
   //循環描繪文字
   for (var i=11;i<21;i++)
   {
   
    var draw_layer = kag.back.layers[9];

	draw_layer.font.face=dic[i].fontname;
	draw_layer.font.bold=dic[i].bold;
	draw_layer.font.height=dic[i].size;
	
	var sha=dic[i].shadow;
	var shac=dic[i].shadowcolor;
	var edg=dic[i].edge;
	var edgc=dic[i].edgecolor;
	
	var color=dic[i].color;
	var text=Scripts.eval(dic[i].flagname);
	
	var x=dic[i].x;
	var y=dic[i].y;

	//將文字對應成預渲染文字（默認）
	if ((global.useconfigMappfont) && (f.setting.mapp_def!=void))
	{
	  draw_layer.font.mapPrerenderedFont(f.setting.mapp_def);
	}

       //該據點在本地圖上使用到
       if (dic[i]["use"]==1)
      {
           //滿足條件
           if (Scripts.eval(dic[i]["cond"])==true)  
		   {
			  if (sha) {draw_layer.drawText(x,y,text,color, 255, true, 255, shac, 0, 2, 2);}
			  else if (edg) {draw_layer.drawText(x,y,text,color, 255, true, 255, edgc, 1, 0, 0);}
			  else {draw_layer.drawText(x,y,text,color, 255, true);}
		   }
           //或者無需條件
           if (dic[i]["cond"]==void)   
		   {
			  if (sha) {draw_layer.drawText(x,y,text,color, 255, true, 255, shac, 0, 2, 2);}
			  else if (edg) {draw_layer.drawText(x,y,text,color, 255, true, 255, edgc, 1, 0, 0);}
			  else {draw_layer.drawText(x,y,text,color, 255, true);}
		   }
      }
 
   }
   //-------------------------------------------------------------------------------
      //循環描繪圖形
   for (var i=21;i<31;i++)
   {

     if (dic[i].pic!=void && dic[i]["use"]==1)
     {
       //圖形的情況，創建圖形用字典
        var edupic = new Dictionary();
        
              edupic["layer"]="9";
              edupic["page"]="back";
      
              edupic["dx"]=dic[i].x;
              edupic["dy"]=dic[i].y;
              
              edupic["storage"]=dic[i].pic;
              
              if (Scripts.eval(dic[i]["cond"])==true) kag.tagHandlers.pimage(edupic);
              if (dic[i]["cond"]==void)  kag.tagHandlers.pimage(edupic);
     
     }
     else if (dic[i].pic==void && dic[i]["use"]==1)
     {
         //假如是數字的情況
          if (Scripts.eval(dic[i]["cond"])==true) drawnum(Scripts.eval(dic[i].flagname),dic[i].num,dic[i].space,"9","back",dic[i].x,dic[i].y);
          if (dic[i]["cond"]==void) drawnum(Scripts.eval(dic[i].flagname),dic[i].num,dic[i].space,"9","back",dic[i].x,dic[i].y);  
     }
     
   }
   
   //-------------------------------------------------------------------------------
}
}
[endscript]
;------------------------------------------------------------
;顯示養成面板
;------------------------------------------------------------
[macro name=edu]
[rclick enabled="false"]
[backlay]
;隱藏一般對話層
[layopt layer="message0" page="back" visible="false"]
;隱藏系統按鈕層
[layopt layer="message2" page="back" visible="false"]
[position page="back" layer="message1" frame="empty" color="0xFFFFFF" opacity=0 left=0 top=0]
[layopt layer="message1" page="back" visible="true"]
[current layer="message1" page="back"]
[er]
;顯示按鈕
[eval exp=&"'loadedu(\''+mp.storage+'\')'"]
[trans * method=%method|crossfade time=%time|500]
[wt]
[s cond="mp.waitclick"]
[endmacro]

;------------------------------------------------------------
;清除面板
;------------------------------------------------------------
[macro name=cledu]
[backlay]
[freeimage layer=7 page="back"]
[freeimage layer=9 page="back"]
[current layer="message1" page="back"]
[er]
[layopt layer="message1" page="back" visible="false"]
;恢復對話框與系統按鈕
[layopt layer="message0" visible="true" page=back]
[layopt layer="message2" visible="true" page="back"]
[trans * method=%method|crossfade time=%time|500]
[wt]
;返回對話
[current layer="message0"]
[rclick enabled="true"]
[endmacro]
;------------------------------------------------------------

[iscript]
//------------------------------------------------------------
//顯示數字圖片
//------------------------------------------------------------
function drawnum(flagname,num,sp=20,layer="9",page="back",x=0,y=0) //數值，圖片，字間距，所在層,x,y
{

   //分析處理變數;
   var str=(string)flagname;
   //循環描繪數值;
   for (var i=0;i<str.length;i++)
   {
           kag.tagHandlers.pimage(
           %[
              "layer"=>layer,
              "page"=>page,
              "storage"=>num+str[i],
              "dx"=> (int)x+(int)i*sp,
              "dy"=> (int)y
           ]);
   
   }

}
[endscript]
;------------------------------------------------------------
;描繪數字顯示的宏
;------------------------------------------------------------
;使用範例
;@draw_num num=&"f.test" pic="num-" x=100 y=150
[macro name=draw_num]
[eval exp="drawnum(mp.num,mp.pic,mp.sp,mp.layer,mp.page,mp.x,mp.y)"]
[endmacro]

[return]
