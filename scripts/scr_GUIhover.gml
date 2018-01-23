///scr_GUIhover(x1,y1,x2,y2)

return point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
argument[0],argument[1],argument[2],argument[3])

/*
if device_mouse_x_to_gui(0)>argument[0]
&& device_mouse_y_to_gui(0)>argument[1]
&& device_mouse_x_to_gui(0)<argument[2]
&& device_mouse_y_to_gui(0)<argument[3]{
    return true;
}
return false;
*/

