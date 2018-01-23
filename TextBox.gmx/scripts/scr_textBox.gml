///scr_textBox(str)
var xx,yy;
xx=x+5;
yy=y+20;
var str=argument[0];


if keyboard_check_released(vk_right) || keyboard_check_released(vk_left){

    if !keyboard_check(vk_control) && !keyboard_check(vk_shift){
        if strPos1!=strPos0{strPos0=strPos1}
        
        strPos0+=(keyboard_check_released(vk_right)-keyboard_check_released(vk_left))
        strPos0=clamp(strPos0,0,string_length(str))
        
        strPos1=strPos0
    }else{
        
        strPos1+=(keyboard_check_released(vk_right)-keyboard_check_released(vk_left))
        strPos1=clamp(strPos1,0,string_length(str))
        
    }


}
//draw_text(xx+_ww-3,yy,"|")

draw_text(xx,yy,str)

draw_set_alpha(0.5)
var _ww;
if strPos1<=strPos0{
    _ww=string_width(string_copy(str,0,strPos0));
    if strPos0!=strPos1{
        xx+=_ww
    }

}else{
    _ww=string_width(string_copy(str,strPos1,strPos0-strPos1));
    //xx-=_ww
}

var xx0,xx1,yy0,yy1;
xx0=_ww+xx;
xx1=xx0+string_width(string_copy(str,strPos0,strPos1-strPos0));
draw_rectangle(xx0,yy+3,xx1+1,yy+15,false)




return str;

