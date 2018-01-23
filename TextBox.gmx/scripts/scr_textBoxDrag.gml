///scr_textBoxDrag(_str)

var _str=argument[0];

if clickDelay<-1{
    clickDelay++
}else{

if scr_hover(x,y,x+w,y+h)
&& mouse_check_button_pressed(mb_left){
    draw_set_font(fnt_default)
    //get the line it is on
    var hh2=string_height(_str),hh=0;
    var strPosTemp=1;
    while(hh<hh2){
        var ww2=0;
        var pos0=strPosTemp, pos1=strPosTemp;
        
        while(pos0>0 && string_char_at(_str,pos0)!=chr(13)){
            pos0--
        }
        
        while(pos1<=string_length(_str) && string_char_at(_str,pos1)!=chr(13)){
            pos1++
        }
        ww2=string_width(string_copy(_str,pos0,pos1-pos0 ))
        
        //found line!
        var yy=20;
        if scr_hover(x,y+hh+yy,x+w,y+hh+20+yy){
            
            var xx=0;
            var found=0;
            for(var i=pos0;i<pos1;i++){
                if scr_hover(x+xx,y+hh+yy,x+string_width(string_copy(_str,i,1))+xx,y+hh+20+yy){
                    strPos0=i;
                    if strPos0>0 && strPos0<string_length(_str){strPos0--}
                    found=1
                    break;
                }
                xx+=string_width(string_copy(_str,i,1))
            }
            if found=0{
                strPos0=pos1-1
            }
            
            break;
        }
        
        strPosTemp+=(pos1-pos0)
        hh+=20
    }
    strPos1=strPos0
}






///Drag


if scr_hover(x,y,x+w,y+h)
&& mouse_check_button(mb_left){
    draw_set_font(fnt_default)
    //get the line it is on
    var hh2=string_height(_str),hh=0;
    var strPosTemp=1;
    while(hh<hh2){
        var ww2=0;
        var pos0=strPosTemp, pos1=strPosTemp;
        
        while(pos0>0 && string_char_at(_str,pos0)!=chr(13)){
            pos0--
        }
        
        while(pos1<=string_length(_str) && string_char_at(_str,pos1)!=chr(13)){
            pos1++
        }
        ww2=string_width(string_copy(_str,pos0,pos1-pos0 ))
        
        //found line!
        var yy=20;
        if scr_hover(x,y+hh+yy,x+w,y+hh+20+yy){
            
            var xx=0;
            var found=0;
            for(var i=pos0;i<pos1;i++){
                if scr_hover(x+xx,y+hh+yy,x+string_width(string_copy(_str,i,1))+xx,y+hh+20+yy){
                    strPos1=i;
                    if strPos1>0 && strPos1<string_length(_str){strPos1--}
                    found=1
                    break;
                }
                xx+=string_width(string_copy(_str,i,1))
            }
            if found=0{
                strPos1=pos1-1
            }
            
            break;
        }
        
        strPosTemp+=(pos1-pos0)
        hh+=20
    }
    //strPos1=strPos0
}

}
