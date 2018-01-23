///scr_GUIButton(x,y,x2,y2,string)
var _re=false;

draw_set_alpha(1)
draw_set_color(c_black)
draw_rectangle(argument[0],argument[1],argument[2],argument[3],false)
if scr_GUIhover(argument[0],argument[1],argument[2],argument[3]){
    if mouse_check_button(mb_left){draw_set_color(c_ltgray)}else{draw_set_color(c_gray)}
    if mouse_check_button_released(mb_left){_re=true}
}else{draw_set_color(merge_color(c_dkgray,c_gray,0.5))}
draw_rectangle(argument[0],argument[1],argument[2]-2,argument[3]-2,false)
draw_set_font(fnt_title)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text_shadow(lerp(argument[0],argument[2],0.5),lerp(argument[1],argument[3],0.5),argument[4])
draw_set_valign(fa_top)
draw_set_halign(fa_left)
return _re;

