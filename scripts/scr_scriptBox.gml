///scr_scriptBox(x,y,w,h)
var xx,yy,ww,hh;
xx=argument[0]
yy=argument[1]
ww=argument[2]
hh=argument[3]

mih=100
mah=100
miw=200


//check for only 1 input
var _c=0;
for(i=0;i<15;i++){
    if in[i]!=-1 && instance_exists(in[i]){
        _c++
    }
}
if _c>1{
    for(var i=0;i<15;i++){
        if _c=1{break;}
        if in[i]!=-1 && instance_exists(in[i]){
            
            with(in[i]){
                for(var a=0;a<15;a++){
                    if out[a]!=-1 && out[a]=other.id {
                        out[a]=-1
                        break
                    }
                }
            }
            in[i]=-1
            
            _c--
        }
        
    }
}



draw_set_alpha(1)
draw_set_color(merge_color(c_white,color,0.5))
draw_rectangle(xx,yy,xx+ww,yy+hh,false)
draw_set_color(merge_color(c_dkgray,c_gray,0.5))
draw_line(xx-1,yy-1,xx+ww,yy-1)
draw_set_color(c_gray)
draw_line(xx-1,yy-1,xx-1,yy+hh)
draw_set_color(c_ltgray)
draw_line(xx-1,yy+hh,xx+ww,yy+hh)
draw_set_color(c_gray)
draw_line(xx+ww,yy-1,xx+ww,yy+hh)


draw_set_color(c_black)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_default)



if select=0{
    if scr_hover(x,y,x+w,y+h)
    && mouse_check_button_pressed(mb_left) && scr_checkMouseInterface(){
        select=1
        //keyboard_string=text
        keyboard_string=""
        strPos0=string_length(text)
        strPos1=strPos0
    }
    
}else{
    if !scr_hover(x,y,x+w,y+h)
    && mouse_check_button_pressed(mb_left){
        select=0
    }else{
        //text=keyboard_string
    }
}


if select=1{
    text=scr_textBox2(text,xx+2,yy+2,ww,hh)
}else{
    //draw_text(xx+2,yy+2,text)
    draw_text_syntax(xx+2,yy+2,text)
}

/*
var str=text;
if select=1 && blink=1{
    str+="|"
}

repeat(scroll){
    var c=(string_pos("#",str));
    str=string_delete(str,1,c)
}


if string_height_ext(str,15,ww-6)>hh{
    while(string_height_ext(str,15,ww-6)>hh){
        str=string_delete(str,string_length(str),1)
    }
}

draw_text_ext(xx+2,yy+2,str,15,ww-6)



//stringHandling
if select=1{
    if keyboard_check_pressed(vk_enter){
        keyboard_string+="#"
        if string_height_ext(keyboard_string,15,ww-6)+15>hh{
            scroll++
        }
    }
    if keyboard_check(vk_control) && keyboard_check_pressed(ord("C")){
        clipboard_set_text(text)
    }
    if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")){
        keyboard_string+=clipboard_get_text()
        if string_height_ext(keyboard_string,15,ww-6)+15>hh{
            scroll++
        }
    }
}
if scr_hover(xx,yy,xx+ww,yy+hh){
    if mouse_wheel_up(){
        scroll--
    }
    if mouse_wheel_down(){
        scroll++
    }
    scroll=clamp(scroll,0,string_count("#",text))
}


//Select
if select=0{
    if scr_hover(x,y,x+w,y+h)
    && mouse_check_button_released(mb_left){
        select=1
        keyboard_string=text
    }
    
}else{
    if !scr_hover(x,y,x+w,y+h)
    && mouse_check_button_released(mb_left){
        select=0
    }else{
        text=keyboard_string
    }
}
*/


