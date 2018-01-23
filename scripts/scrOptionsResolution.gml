ini_open("settings.ini")
var ww,hh;
ww=get_integer("Width",1280)
hh=get_integer("Height",720)
ww=clamp(ww,640,4096)
hh=clamp(hh,480,2160)
ini_write_real("settings","resw",ww)
ini_write_real("settings","resh",hh)
global.gui_width=ww
global.gui_height=hh
display_set_gui_size(global.gui_width,global.gui_height)

view_wport[0]=ww
view_hport[0]=hh

window_set_size(ww,hh)
ini_close()
