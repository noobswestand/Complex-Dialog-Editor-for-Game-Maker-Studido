///scr_switchBox(x,y,w,h)
var xx,yy,ww,hh;
xx=argument[0]
yy=argument[1]
ww=argument[2]
hh=argument[3]

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


//draw_text_ext(xx+2,yy+2,str,15,ww-6)
draw_text_syntax_ext(xx+2,yy+2,str,15,ww-6)

//stringHandling
if select=1{
    if keyboard_check_pressed(vk_enter){
        text+="#"
        if string_height_ext(text,15,ww-6)>hh{
            scroll++
        }
    }
    if keyboard_check(vk_control) && keyboard_check_pressed(ord("C")){
        clipboard_set_text(text)
    }
    if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")){
        text+=clipboard_get_text()
        if string_height_ext(text,15,ww-6)>hh{
            scroll++
        }
    }
    
    if keyboard_check(vk_backspace){
        if keyboard_check_pressed(vk_backspace){
            text=string_delete(text,string_length(text),1)
        }
        backDelay--
        if backDelay<=0{
            text=string_delete(text,string_length(text),1)
        }
    }
    if !(keyboard_check(vk_backspace)){
        backDelay=15
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


//Select-main box
if select=0{
    if scr_hover(xx,yy,xx+ww,yy+hh)
    && mouse_check_button_released(mb_left) && scr_checkMouseInterface(){
        select=1
        //keyboard_string=text
    }
    
}else{
    if !scr_hover(xx,yy,xx+ww,yy+hh)
    && mouse_check_button_pressed(mb_left){
        select=0
        keyboard_string=""
    }else{
        //text=keyboard_string
        if keyboard_string!=""{
            text+=keyboard_string
            keyboard_string=""
        }
        
    }
}

var yyy=yy+hh+5
var hhh=20
for(i=0;i<switchCount;i++){
    if select0[i]=0{
        if scr_hover(xx,yyy,xx+ww,yyy+hhh)
        && mouse_check_button_released(mb_left) && scr_checkMouseInterface(){
            select0[i]=1
            //keyboard_string=selectT[i]
            keyboard_string=""
        }
    }else{
        if !scr_hover(xx,yyy,xx+ww,yyy+hhh)
        && mouse_check_button_pressed(mb_left){
            select0[i]=0
            keyboard_string=""
        }else{
            //selectT[i]=keyboard_string
            if keyboard_string!=""{
                selectT[i]+=keyboard_string
                keyboard_string=""
            }
        }
    }
    yyy+=25
}

//tab
if keyboard_check_released(vk_tab){
    if select=1{
        select0[0]=1
        select=0
        //keyboard_string=selectT[0]
        keyboard_string=""
    }else{
        for(i=0;i<switchCount;i++){
            if select0[i]=1{
                if i=switchCount-1{
                    select=1
                    //keyboard_string=text
                    keyboard_string=""
                }else{
                    select0[i+1]=1
                    //keyboard_string=selectT[i+1]
                    keyboard_string=""
                }
                select0[i]=0
                blink=1
                break;
            }
        }
    }
}



//drawSwitch
yyy=yy+hh+5
ww-=15 xx+=15
for(i=0;i<switchCount;i++){
    draw_set_color(merge_color(c_white,color,0.5))
    draw_rectangle(xx,yyy,xx+ww,yyy+hhh,false)
    draw_set_color(merge_color(c_dkgray,c_gray,0.5))
    /*
    draw_line(xx-1,yyy,xx+ww,yyy)
    draw_set_color(c_gray)
    draw_line(xx,yyy,xx,yyy+hhh)
    draw_set_color(c_ltgray)
    draw_line(xx,yyy+hhh,xx+ww,yyy+hhh)
    draw_set_color(c_gray)
    draw_line(xx+ww,yyy,xx+ww,yyy+hhh)
    */
    
    draw_line(xx-1,yyy-1,xx+ww,yyy-1)
    draw_set_color(c_gray)
    draw_line(xx-1,yyy-1,xx-1,yyy+hhh)
    draw_set_color(c_ltgray)
    draw_line(xx-1,yyy+hhh,xx+ww,yyy+hhh)
    draw_set_color(c_gray)
    draw_line(xx+ww,yyy-1,xx+ww,yyy+hhh)
    
    
    
    //drawLine
    var str=selectT[i]
    if select0[i]=1 && blink=1{
        str+="|"
    }
    repeat(selectS[i]){
    var c=(string_pos("#",str));
        str=string_delete(str,1,c)
    }
    if string_height_ext(str,15,ww-6)>hhh{
        while(string_height_ext(str,15,ww-6)>hhh){
            str=string_delete(str,string_length(str),1)
        }
    }
    
    draw_set_color(c_dkgray)
    draw_text_ext(xx+2,yyy+2,str,15,ww-6)
    
    draw_set_color(c_dkgray)
    draw_text(xx-15,yyy+2,string(i+1))
    
    //lineHandle
    if select0[i]=1{
        if keyboard_check_pressed(vk_enter){
            selectT[i]+="#"
            selectS[i]++
        }
        if keyboard_check(vk_control) && keyboard_check_pressed(ord("C")){
            clipboard_set_text(selectT[i])
        }
        if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")){
            selectT[i]+=clipboard_get_text()
            if string_height_ext(selectT[i],15,ww-6)>hhh-5{
                selectS[i]++
            }
        }
        if keyboard_check(vk_backspace){
            if keyboard_check_pressed(vk_backspace){
                selectT[i]=string_delete(selectT[i],string_length(selectT[i]),1)
            }
            backDelay--
            if backDelay<=0{
                selectT[i]=string_delete(selectT[i],string_length(selectT[i]),1)
            }
        }
        if !(keyboard_check(vk_backspace)){
            backDelay=15
        }
        
    }
    if scr_hover(xx,yyy,xx+ww,yyy+hhh){
        if mouse_wheel_up(){
            selectS[i]--
        }
        if mouse_wheel_down(){
            selectS[i]++
        }
        selectS[i]=clamp(selectS[i],0,string_count("#",selectT[i]))
    }
    
    yyy+=25
}

yyy+=3
//draw Add/Subtract buttons
draw_set_color(merge_color(c_white,color,0.5))
draw_rectangle(xx+3,yyy,xx+28,yyy+20,false)
draw_rectangle(xx+ww-3,yyy,xx+ww-28,yyy+20,false)
draw_set_color(c_dkgray)
draw_rectangle(xx+2,yyy-1,xx+28,yyy+20,true)
draw_rectangle(xx+ww-3,yyy-1,xx+ww-29,yyy+20,true)

draw_set_halign(fa_center)
draw_set_color(c_black)
draw_text(xx+2+(3+25)/2,yyy,"-")
draw_text(xx+ww-2-(3+25)/2,yyy,"+")

if scr_hover(xx+3,yyy,xx+25,yyy+20)
&& mouse_check_button_released(mb_left)
&& !instance_exists(objNPC){
    select0[switchCount]=0
    selectT[switchCount]=""
    selectS[switchCount]=0
    if switchCount>1{
        h-=25
        yyy-=25
    }
    switchCount--
    switchCount=clamp(switchCount,1,14)
}
if scr_hover(xx+ww-28,yyy,xx+ww-3,yyy+20)
&& mouse_check_button_released(mb_left)
&& !instance_exists(objNPC){
    switchCount++
    select0[switchCount]=0
    selectT[switchCount]=""
    selectS[switchCount]=0
    switchCount=clamp(switchCount,1,14)
}
yyy-=3
ww+=15
mih=yyy-yy+hh+25

