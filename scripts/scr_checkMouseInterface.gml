///scr_checkMouseInterface()
/*
    Returns false if the mouse is ontop of an interface (not Node)
*/

if device_mouse_y_to_gui(0)<25{
    return false
}

if objControl.chatMapChange==true{
    if scr_GUIhover(global.gui_width-400,25,global.gui_width,30+((ds_map_size(objControl.chatMap)*25)+30+((ds_map_size(objControl.chatMap)==0)*30))
    +((ds_map_size(objControl.chatMap)>0)*5)){
        return false
    }
}

if instance_exists(objConvo){
    with(objConvo){
        var xx,yy,ww,hh;
        xx=x yy=y
        ww=w hh=h
        
        if xx<view_xview && xx+ww>view_xview{
            xx=clamp(xx,view_xview,view_xview+view_wview)
        }
        if yy<view_yview+25 && yy+hh>view_yview{
            yy=clamp(yy,view_yview+25,view_yview+view_hview)
        }
        if scr_hover(xx,yy,325+xx,yy+h2){
            return false
        }
    }
}


return true
