;-------------------------------------------------------------------------------------------
;    THE NVL Maker——GUI Editor for Kirikiri/KAG
;     Copyright (C) 2011  VariableD <wang.siying@gmail.com>

;     You should have received a copy of the GNU General Public License
;     along with this program.  If not, see <http://www.gnu.org/licenses/>.     
;-------------------------------------------------------------------------------------------
[iscript]
if (f.参数.left!=void || f.参数.top!=void)
{
   f.参数.locate=true;
}
if (f.参数.rceil==0 && f.参数.gceil==0 && f.参数.bceil==0 && f.参数.rfloor==255 && f.参数.gfloor==255 &&  f.参数.gfloor==255)
{
   f.参数.convert=true;
}
if (f.参数.visible==void)
{
   f.参数.visible=true;
}
if (f.参数.layer==void)
{
   f.参数.layer="base";
}
if (f.参数.storage==void)
{
   f.参数.storage="empty";
}
[endscript]

*window
[window_middle width=690 height=430 title="载入图片"]
[eval exp="drawFrame('基本信息',3,15,40,kag.fore.layers[5],314)"]
[line title="图片" name="f.参数.storage" x=30 y=60 type="pic" path="bgimage"]
[line title="编号" name="f.参数.layer" x=30 y=90 type=list target="*选择图层"]
[line title="载入" name="f.参数.page" x=30 y=120 type=list target="*选择页"]

[eval exp="drawFrame('位置设定',6,15,175,kag.fore.layers[5],314)"]
[group title="居中" name="f.参数.pos" x=30 y=190 comp="center"]
[group title="居左" name="f.参数.pos" x=120 y=190 comp="left"]
[group title="居右" name="f.参数.pos" x=210 y=190 comp="right"]
[check title="直接指定" name="f.参数.locate" x=30 y=220]
[pos valuex="f.参数.left" valuey="f.参数.top" x=30 y=250 true="f.参数.locate"]

[check title="图层可见" name="f.参数.visible" x=30 y=345]

[eval exp="drawFrame('特殊效果',3,345,40,kag.fore.layers[5],314)"]
[check title="黑白" name="f.参数.grayscale" x=360 y=60]
[check title="反色" name="f.参数.convert" x=500 y=60]
[line title="蒙板色" name="f.参数.mcolor" x=360 y=90 type="color"]
[line title="蒙板透明度" name="f.参数.mopacity" x=360 y=120]

[eval exp="drawFrame('其他',3,345,175,kag.fore.layers[5],314)"]
[line title="模式" name="f.参数.mode" x=360 y=190 type=list target="*显示模式"]
[line title="透明" name="f.参数.opacity" x=360 y=220]
[check title="上下反转" name="f.参数.flipud" x=360 y=255]
[check title="左右反转" name="f.参数.fliplr" x=500 y=255]
[s]

*确认
[commit]
[iscript]
if (f.参数.locate==false)
{
   f.参数.left=void;
   f.参数.top=void;
}
f.参数.locate=void;
//-------------------------------------
if (f.参数.convert==true)
{
   with(f.参数)
   {
      .rceil=0;
      .gceil=0;
      .bceil=0;
      .rfloor=255;
      .bfloor=255;
      .gfloor=255;
      .convert=void;
   }
}
else
{
   with(f.参数)
   {
      .rceil=void;
      .gceil=void;
      .bceil=void;
      .rfloor=void;
      .bfloor=void;
      .gfloor=void;
      .convert=void;
   }
}
//-------------------------------------

[endscript]
[eval exp="commitLine(f.参数)"]
[jump storage="tag_direct.ks" target=*擦除窗口]

*关闭选单
[jump storage="tag_direct.ks" target=*关闭选单]
;-----------------------------------------------------------------
*选择图层
[list_layer x=34 y=90]
[s]

*选择页
[list_page x=34 y=120]
[s]

*关闭下拉菜单
[rclick enabled="false"]
[current layer="message6"]
[er]
[layopt layer="message6" visible="false"]
[jump target=*window]
;-----------------------------------------------------------------
*选择图片
[call storage="window_picture.ks"]
[jump target=*window]

*选择颜色
[call storage="window_color.ks"]
[jump target=*window]
;-----------------------------------------------------------------
*显示模式
[commit]
[list x=364 y=190 line=16 layer="message6"]
[link target=*关闭下拉菜单 exp="f.参数.mode='alpha'"]一般透过（默认）[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='opaque'"]完全不透过[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='addalpha'"]加算透过[endlink][r]

[link target=*关闭下拉菜单 exp="f.参数.mode='psadd'"]PS加算[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='pssub'"]PS減算[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='psmul'"]PS正片叠底[endlink][r]

[link target=*关闭下拉菜单 exp="f.参数.mode='psscreen'"]PS屏幕[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='psoverlay'"]PS叠加[endlink][r]

[link target=*关闭下拉菜单 exp="f.参数.mode='pshlight'"]PS强光[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='psslight'"]PS柔光[endlink][r]

[link target=*关闭下拉菜单 exp="f.参数.mode='psdodge'"]PS减淡[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='psburn'"]PS加深[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='pslighten'"]PS变亮[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='psdarken'"]PS变暗[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='psdiff'"]PS差值[endlink][r]
[link target=*关闭下拉菜单 exp="f.参数.mode='psexcl'"]PS排除[endlink]
[s]
