///draw_text_bb(x,y,string)
var color=c_black,alpha=1,font=fnt_chat;
var _x=0,_y=0;
var _str=argument[2];

var i=1;
while(_str!=""){
    var draw=true;
    
    if string_copy(_str,1,1)=="["{
        
        if string_count("=",string_copy(_str,1,string_pos("]",_str)))!=0{
            switch(string_copy(_str,2,string_pos("=",_str)-2)){
                
                case "color":
                    color=string_to_color(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
                
                case "alpha":
                    alpha=real(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
                
                case "font":
                    font=asset_get_index(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
            }
            _str=string_delete(_str,1,string_pos("]",_str)-1) draw=false
        }else{
            //end tags
            switch(string_copy(_str,2,string_pos("]",_str)-2)){
                case "/color": color=c_black    break;
                case "/alpha": alpha=1          break;
                case "/font":  font=fnt_chat    break;
            }
            _str=string_delete(_str,1,string_pos("]",_str)-1) draw=false
        }
    }
    
    if draw==true{
        draw_set_font(font)
        draw_set_color(color)
        draw_set_alpha(alpha)
        var _s=string_copy(_str,1,1);
        draw_text(argument[0]+_x,argument[1]+_y,_s)
        _x+=string_width(_s)
        if _s=="#" || _s==chr(13){
            _y+=argument[3] _x=0
        }
    }
    
    _str=string_delete(_str,1,1)
}



