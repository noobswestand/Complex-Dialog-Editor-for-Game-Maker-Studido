///scr_textBox(x,y,w,h)
var xx,yy,ww,hh;
xx=argument[0]
yy=argument[1]
ww=argument[2]
hh=argument[3]

mih=50
mah=50
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




xx+=50 ww-=50 //make room for selection box
draw_set_alpha(1)
draw_set_color(merge_color(c_white,color,0.5))
draw_rectangle(xx,yy,xx+ww,yy+hh,false)
draw_set_color(merge_color(c_dkgray,c_gray,0.5))
/*draw_line(xx-1,yy,xx+ww,yy)
draw_set_color(c_gray)
draw_line(xx,yy,xx,yy+hh)
draw_set_color(c_ltgray)
draw_line(xx,yy+hh,xx+ww,yy+hh)
draw_set_color(c_gray)
draw_line(xx+ww,yy,xx+ww,yy+hh)
*/
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
*/


if select=1{
    text=scr_textBox3(text,xx+2,yy-3,ww,hh,0)
}else{
    draw_text(xx+2,yy+2,text)
}

//stringHandling
/*
if select=1{
    if keyboard_check_pressed(vk_enter){
        keyboard_string+="#"
        scroll++
    }
    if keyboard_check(vk_control) && keyboard_check_pressed(ord("C")){
        clipboard_set_text(text)
    }
    if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")){
        keyboard_string+=clipboard_get_text()
        scroll++
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
*/

//Select
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


while(string_length(text)>2){
    text=string_delete(text,string_length(text),1)
    keyboard_string=""
}


/*
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

//==,>,<...
xx-=50
ww=50-5
hh-=2
yy+=1

if checkT=1{
    checkH+=((20*(checkM+1))-checkH)/2
}else{
    checkH+=((hh)-checkH)/2
}

draw_set_halign(fa_center)

var _c=merge_color(c_ltgray,c_gray,0.5)
draw_rectangle_colour(xx,yy,xx+ww,yy+checkH,c_ltgray,c_ltgray,_c,_c,false)
draw_set_color(c_black)
draw_rectangle(xx-1,yy-1,xx+ww,yy+checkH,true)

draw_text(xx+(ww/2),yy,check[checkS])

if scr_hover(xx,yy,xx+ww,yy+hh)
&& mouse_check_button_released(mb_left)
&& !instance_exists(objNPC){
    checkT=!checkT
}else{
    if instance_exists(objNPC)
    || (!scr_hover(xx,yy,xx+ww,yy+hh)
    && mouse_check_button_released(mb_left)){
        checkT=0
    }
}
if checkT=1{
    var yyy=yy+20;
    for(i=0;i<checkM;i++){
        if scr_hover(xx,yyy,xx+ww,yyy+19){
            draw_text(xx+(ww/2),yyy,check[i])
        }else{
            draw_text(xx+(ww/2)-3,yyy,check[i])
        }
        if scr_hover(xx,yyy,xx+ww,yyy+19)
        && mouse_check_button_released(mb_left){
            checkT=0
            checkS=i
        }
        yyy+=20
    }
}
