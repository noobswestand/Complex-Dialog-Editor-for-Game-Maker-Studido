///scr_draw_box(x1,y1,x2,y2)
draw_set_alpha(0.9)
draw_set_color(c_ltgray)
draw_rectangle(argument[0],argument[1],argument[2],argument[3],false)
draw_set_alpha(1)
draw_set_color(c_dkgray)
draw_rectangle_width(argument[0],argument[1],argument[2],argument[3],3)

