///draw_text_bb_ext_black(x,y,string,sep,w)

//set up main variables
var dcolor=draw_get_color(),color=dcolor,alpha=1,font=fnt_chat,_strAdd="";
var _x=0,_y=0;
var _str=argument[2];
draw_set_halign(fa_left)


//set the default values - based on the ds_map
textSpeed=ds_map_find_value(defaultMap,"textSpeed")
color=string_to_color(ds_map_find_value(defaultMap,"textColor"))
font=asset_get_index(ds_map_find_value(defaultMap,"textFont"))
alpha=ds_map_find_value(defaultMap,"textAlpha")


textWaveA=ds_map_find_value(defaultMap,"textWaveA")
textWaveF=ds_map_find_value(defaultMap,"textWaveF")
textWaveO=ds_map_find_value(defaultMap,"textWaveO")
textShakeX=ds_map_find_value(defaultMap,"textShakeX")
textShakeY=ds_map_find_value(defaultMap,"textShakeY")
textShake=ds_map_find_value(defaultMap,"textShake")
textHSV=ds_map_find_value(defaultMap,"textHSV")



var i=0;
_x=0 _y=0
_str=argument[2];
while(string_length(_str)>0){
    var draw=true;
    
    //Search for starting bracket
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
                
                case "speed":
                    textSpeed=real(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
                
                case "waveA":
                    textWaveA=real(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
                case "waveF":
                    textWaveF=real(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
                case "waveO":
                    textWaveO=real(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
                
                case "shake":
                    textShake=real(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
                case "shakeX":
                    textShakeX=real(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
                case "shakeY":
                    textShakeY=real(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
                
                case "hsv":
                    textHSV=real(string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1))
                break;
                
                case "var":
                    _var=string_copy(_str,string_pos("=",_str)+1,
                    string_pos("]",_str)-string_pos("=",_str)-1)
                    
                    if ds_map_exists(chatMap,_var){
                        _strAdd+=string(chatMap[? _var]);
                    }
                break;
                
            }
            _str=string_delete(_str,1,string_pos("]",_str)) draw=false
            _str=" "+_strAdd+_str
            _strAdd=""
            
        }else{
            //end tags
            switch(string_copy(_str,2,string_pos("]",_str)-2)){
                case "/color": color=ds_map_find_value(defaultMap,"textColor")          break;
                case "/alpha": alpha=ds_map_find_value(defaultMap,"textAlpha")          break;
                case "/font":  font=asset_get_index(ds_map_find_value(defaultMap,"textFont")) break;
                case "/speed": textSpeed=ds_map_find_value(defaultMap,"textSpeed")      break;
                case "/waveA": textWaveA=ds_map_find_value(defaultMap,"textWaveA")      break;
                case "/waveF": textWaveF=ds_map_find_value(defaultMap,"textWaveF")      break;
                case "/waveO": textWaveO=ds_map_find_value(defaultMap,"textWaveO")      break;
                case "/shake": textShake=ds_map_find_value(defaultMap,"textShake")      break;
                case "/shakeX": textShakeX=ds_map_find_value(defaultMap,"textShakeX")   break;
                case "/shakeY": textShakeY=ds_map_find_value(defaultMap,"textShakeY")   break;
                case "/hsv": textHSV=ds_map_find_value(defaultMap,"textHSV")            break;
            }
            _str=string_delete(_str,1,string_pos("]",_str)-1) draw=false
        }
    }
    
    
    //Draws the line!
    if draw==true{
        draw_set_font(font)
        //
        draw_set_alpha(alpha)
        var _s=string_copy(_str,1,1);
        
        textHSV1+=textHSV
        random_set_seed(_time)
        var _yy=dsin((_time*textWaveF)+(textWaveO*i))*textWaveA;
        var _xx=random_range(-(textShakeX+textShake),textShakeX+textShake);
        _yy+=random_range(-(textShakeX+textShake),textShakeX+textShake);
        randomize()
        
        //Check for new lines
        //if string_pos(" ",_str)==0{
            if _x+string_width(_s)>(argument[4]/2){
                 __i++ _x=0
                _y+=argument[3]
            }
        if _s=="#" || _s==chr(13){
            __i++ _x=0
            _y+=argument[3]
        }
        
        draw_text(argument[0]+_x+_xx,argument[1]+_y+_yy,_s)
        _x+=string_width(_s)
    }
    
    i++;
    _str=string_delete(_str,1,1)
}


textHSV=0
textWaveA=0
textWaveF=0
textWaveO=0
textShakeX=0
textShakeY=0
textShake=0

