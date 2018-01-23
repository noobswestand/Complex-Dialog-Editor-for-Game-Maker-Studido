///draw_text_bb_ext_centered_shadow(x,y,string,sep,w,[offset])
var xx,yy,str,sep,w,off=1;
xx=argument[0];
yy=argument[1];
str=argument[2];
sep=argument[3];
w=argument[4];
if argument_count>5{
    off=argument[5];
}

draw_text_bb_ext_black_centered(xx+off,yy+off,str,sep,w);
draw_set_color(c_white);
draw_text_bb_ext_centered(xx,yy,str,sep,w);
draw_set_halign(fa_center);
