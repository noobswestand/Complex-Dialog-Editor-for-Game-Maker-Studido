///draw_text_syntax(x,y,string)

if objControl.op0[5]==0{
    draw_text(argument[0],argument[1],argument[2])
}else{
    var _s=argument[2];
    var _c=draw_get_color()
    var __x=argument[0],__y=argument[1];
    var _checkScript=0;
    
    //Stop doing this script if the rendering takes too long!!
    var _time=current_time;
    
    
    while(_s!=""){
        var _s1=string_copy(_s,1,1);
        //show_message(ord(_s1))
        if _s1=" " || _s1="#" || _s1=chr(13) || _s1="{" || _s1="}"{draw_set_color(_c) _checkScript--}
        
        var str0=string_copy(_s,1,8);
        if str0=="showChat" || str0="teleNPC("{draw_set_color(c_blue)}
        var str0=string_copy(_s,1,5);
        if str0=="line(" || str0="goto(" || str0="conv("{draw_set_color(c_blue)}
        var str0=string_copy(_s,1,6);
        if str0=="convo(" || str0="quest(" || str0="label("{draw_set_color(c_blue)}
        var str0=string_copy(_s,1,11);
        if str0=="telePlayer("{draw_set_color(c_blue)}
        
        
        str0=string_copy(_s,1,7);
        if str0=="[color=" || str0=="[/color"
        || str0=="[alpha=" || str0=="[/alpha"
        || str0=="[speed=" || str0=="[/speed"
        || str0=="[waveA=" || str0=="[/waveA"
        || str0=="[waveF=" || str0=="[/waveF"
        || str0=="[waveO=" || str0=="[/waveO"
        || str0=="[shake=" || str0=="[/shake"{draw_set_color(c_blue)}
        str0=string_copy(_s,1,6);
        if str0=="[font=" || str0=="[/font"{draw_set_color(c_blue)}
        str0=string_copy(_s,1,5);
        if str0=="[hsv=" || str0=="[/hsv"{draw_set_color(c_blue)}
        if  str0=="[var="{
            //check to see if variable exists!
            var _v=string_copy(_s,string_pos("=",_s)+1,string_pos("]",_s)-string_pos("=",_s)-1);
            if ds_map_exists(objControl.chatMap,_v){
                draw_set_color(c_blue)
            }else{
                draw_set_color(merge_color(c_red,c_orange,0.5))
            }
        }
        str0=string_copy(_s,1,8);
        if str0=="[shakeX=" || str0=="[/shakeX"
        || str0=="[shakeY=" || str0=="[/shakeY"{draw_set_color(c_blue)}
        
        if string_pos("if ",_s)=1{draw_set_color(merge_color(merge_color(c_lime,c_green,0.85),c_black,0.2)) _checkScript=2}
        
        
        
        if _checkScript==1 && string_count("(",_s)>0{
            _checkScript=0
            if asset_get_index(string_copy(_s,2,string_pos("(",_s)-2))>-1{
                draw_set_color(c_blue)
            }else{
                draw_set_color(merge_color(c_red,c_orange,0.5))
            }
        }
        if _checkScript==5{
            _checkScript=0
            if asset_get_index(string_copy(_s,1,string_pos("(",_s)-1))>-1{
                draw_set_color(c_blue)
            }else{
                var __s=string_copy(_s,1,string_pos("(",_s)-1);
                if string_pos("(",_s)==0{
                    __s=string_copy(_s,1,string_pos("}",_s)-1)
                }
                var c= __s=="goto" || __s=="showChat" || __s=="teleNPC" || __s=="line" || __s=="convo" || __s=="quest" || __s=="label" ||__s=="telePlayer"; 
                if c=true{
                    draw_set_color(c_blue)
                }else{
                    draw_set_color(merge_color(c_red,c_orange,0.5))
                }
            }
        }
        if string_pos("{",_s)=1{_checkScript=5}
        
        
        draw_text(__x,__y,_s1)
        
        if _s1="]"{draw_set_color(_c)}
        
        
        
        __x+=string_width(_s1)
        if _s1=="#" || _s1==chr(13){
            __x=argument[0]
            __y+=string_height(_s1)
        }
        _s=string_delete(_s,1,1)
        //if current_time-_time>16{break}
        
    }
}
