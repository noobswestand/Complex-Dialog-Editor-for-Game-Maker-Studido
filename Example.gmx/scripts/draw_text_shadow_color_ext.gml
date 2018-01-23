////draw_text_shadow_color_ext(x,y,string,sep,w,color0,color1)

draw_set_color(argument[5])
draw_text_ext(argument[0]+1,argument[1]+1,argument[2],argument[3],argument[4])

draw_set_color(argument[6])
draw_text_ext(argument[0],argument[1],argument[2],argument[3],argument[4])

