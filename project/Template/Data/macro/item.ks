;------------------------------------------------------------
;物品菜單
;------------------------------------------------------------
*start
[locksnapshot]
[tempsave]
;------------------------------------------------------------
*window
[history enabled="false"]

[locklink]
[rclick enabled="true" jump="true" storage="item.ks" target=*返回]

[backlay]
[image layer=14 page=back storage="Sample_PANEL" left=0 top=0 visible="true"]

[current layer="message4" page="back"]
[layopt layer="message4" visible="true" page="back" left=0 top=0]
[er]
[locate x=200 y=95]
[slider vertical=true value="f.index" max=&(f.abc.count-1-6) min=0 bgcolor=0xFFFFFF opacity=128 width=20 height=150 mychangefunc="draw_item"]

[trans method="crossfade" time=300]
[wt]

[eval exp="draw_item()"]
[s]

;------------------------------------------------------------
*返回
[jump storage="main_menu.ks" target=*返回]
