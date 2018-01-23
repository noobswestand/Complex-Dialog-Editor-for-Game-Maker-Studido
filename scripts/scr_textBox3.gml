///scr_textBox2(str,x,y,w,h,star)
var xx,yy,ww,hh;
xx=argument[1]
yy=argument[2]+5//12  7
ww=argument[3]
hh=argument[4]
//draw_set_valign(fa_top)
/*
xx=x+5;
yy=y+20;
ww=w-10
hh=h-20
*/

var str=string_replace_all(argument[0],"#",chr(13));
str=string_replace_all(str,chr(35),chr(13))
var str2;
if argument[5]=1{
    str2=string_repeat('*',string_length(str));
}else{
    str2=str
}

if keyboard_check(vk_right) || keyboard_check(vk_left){
    blink=1
    
    if !keyboard_check(vk_shift){
        strPos0+=(keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left))
        strPos1=strPos0
    }else{
        strPos1+=(keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left))
    }
    arrowDelay--
    if arrowDelay<=0{
        if !keyboard_check(vk_shift){
            strPos0+=(keyboard_check(vk_right)-keyboard_check(vk_left))
            strPos1=strPos0
        }else{
            strPos1+=(keyboard_check(vk_right)-keyboard_check(vk_left))
        }
    }
    strPos0=clamp(strPos0,0,string_length(str))
    strPos1=clamp(strPos1,0,string_length(str))
    //strPos0=clamp(strPos0,0,string_length(string_replace_all(str,chr(13),"")))
    
}else{
    if !(keyboard_check(vk_up) || keyboard_check(vk_down)){
        arrowDelay=15
    }
}

var _ww=0
if strPos0!=0{
    _ww=string_width(string_replace_all(string_copy(str,1,strPos0),chr(13),""));
}
var _hh=0;
if strPos0!=0{
    //var _hh=string_height_ext(string_copy(str,1,strPos0+1),20,ww)-20;
    //var _hh=string_height(string_copy(str,1,strPos0+1))-20;
}

var hh2=_hh;
var c=0;
var strPosTemp=1;
//if argument[5]=1{draw_set_font(fnt_mainBig2)}

/*
while(hh2>0){
    //find width of line of text
    var ww2=0;
    var pos0=strPosTemp, pos1=strPosTemp;
    while(pos0>0 
    //&&
    //( string_char_at(str,pos0)!=chr(13) &&
    //string_height_ext(string_copy(str,strPosTemp,(pos0+1)-strPosTemp+string_count(chr(13),string_copy(str,1,strPosTemp))),20,ww)<20  )
    ){
        pos0--
    }
    
    while(pos1<=string_length(str) 
    //&&(string_char_at(str,pos1)!=chr(13)  && string_width(string_copy(str,pos0,pos1-pos0))<=ww )
      ){
        pos1++
    }
    
    //ww2=string_width(string_replace_all(string_copy(str,pos0,pos1-pos0),chr(13),""))
    ww2=string_width(string_copy(str2,pos0,pos1-pos0 ))
    //show_debug_message(string(ww2)+"   "+string_replace_all(string_copy(str,pos0,pos1-pos0),chr(13),""))
    //ww2=string_width(string_copy(str,pos0,pos1-pos0))
    
    strPosTemp+=(pos1-pos0)
    
    _ww-=ww2
    hh2-=20
    c++
}
*/
/*
if keyboard_check(vk_up) || keyboard_check(vk_down){
    var do0=false,do1=false;
    if keyboard_check_pressed(vk_up){do0=true}
    if keyboard_check_pressed(vk_down){do1=true}
    arrowDelay--
    if arrowDelay<=0{
        if keyboard_check(vk_up){do0=true}
        if keyboard_check(vk_down){do1=true}
    }
    
    if do0=true{
        
        if !keyboard_check(vk_shift){
            var pos0=strPos0;
            while(pos0>0 && string_char_at(str,pos0)!=chr(13) ){
                pos0--
            }
            var pos1=pos0-1;
            while(pos1>0 && string_char_at(str,pos1)!=chr(13) ){
                pos1--
            }
            
            if pos0>0{
                strPos0=pos0;
                while(point_distance( string_width(string_copy(str,pos1,strPos0-pos1)),0,_ww,0 )>5 && strPos0>=pos1){
                    strPos0--
                }
                if strPos0<pos1{
                    strPos0=pos0-1
                }
            }
            strPos1=strPos0
        }else{
            //Shift
            var pos0=strPos1;
            while(pos0>0 && string_char_at(str,pos0)!=chr(13) ){
                pos0--
            }
            var pos1=pos0-1;
            while(pos1>0 && string_char_at(str,pos1)!=chr(13) ){
                pos1--
            }
            
            if pos0>0{
                strPos1=pos0;
                while(point_distance( string_width(string_copy(str,pos1,strPos1-pos1)),0,_ww,0 )>5 && strPos1>=pos1){
                    strPos1--
                }
                if strPos1<pos1{
                    strPos1=pos0-1
                }
            }
            
        }
        
    }
    
    if do1=true{
        
        if !keyboard_check(vk_shift){
            var pos0=strPos0;
            while(pos0<string_length(str) && string_char_at(str,pos0)!=chr(13) ){
                pos0++
            }pos0++
            var pos1=pos0+1;
            while(pos1<string_length(str) && string_char_at(str,pos1)!=chr(13) ){
                pos1++
            }
            
            if pos0<string_length(str){
                strPos0=pos0;
                while(point_distance( string_width(string_copy(str,pos0,strPos0-pos0)),0,_ww,0 )>5 && strPos0<pos1){
                    strPos0++
                }
                
                  
            }
            strPos1=strPos0
        }else{
            //Shift
            var pos0=strPos1;
            while(pos0<string_length(str) && string_char_at(str,pos0)!=chr(13) ){
                pos0++
            }pos0++
            var pos1=pos0+1;
            while(pos1<string_length(str) && string_char_at(str,pos1)!=chr(13) ){
                pos1++
            }
            if pos0<string_length(str){
                strPos1=pos0;
                while(point_distance( string_width(string_copy(str,pos0,strPos1-pos0)),0,_ww,0 )>5 && strPos1<pos1){
                    strPos1++
                }
            }
            
        }
    }
    
}
*/




if blink=1{
    draw_text(xx+_ww-3,yy,"|")
}
draw_text(xx,yy,str2)


//draw highlight here
    //draw white text over

var _xx,_yy,_yy2;
_xx=0
_yy=0
if argument[5]=0{
    _yy2=0
}else{_yy2=3}
for(var i=1;i<=string_length(str);i++){
    if string_char_at(str,i)=chr(13){
        _xx=0
        _yy+=20
    }else{
        if strPos0>strPos1{
            if i>strPos1 && i<=strPos0{
                draw_set_alpha(0.8)
                draw_set_color(c_white)
                draw_rectangle(xx+_xx,yy+_yy+_yy2,xx+_xx+string_width(string_char_at(str2,i)),yy+_yy+14+_yy2,false)
                draw_set_color(c_black)
                draw_set_alpha(1)
                draw_text(xx+_xx,yy+_yy,string_char_at(str2,i))
            }
            
        }
        if strPos1>strPos0{
            
            if i>strPos0 && i<=strPos1{
                draw_set_alpha(0.8)
                draw_set_color(c_white)
                draw_rectangle(xx+_xx,yy+_yy+_yy2,xx+_xx+string_width(string_char_at(str2,i)),yy+_yy+14+_yy2,false)
                draw_set_color(c_black)
                draw_set_alpha(1)
                draw_text(xx+_xx,yy+_yy,string_char_at(str2,i))
            }
            
        }
        
    _xx+=string_width(string_char_at(str2,i))
    }
}



//Short cut keys
if argument[5]=0{
if strPos1!=strPos0{
    
    
    if keyboard_check(vk_control)
    && keyboard_check_pressed(ord("C")){
        var _s=string_copy(str,min(strPos0,strPos1)+1,max(strPos0,strPos1)-min(strPos0,strPos1))
        _s=string_replace_all(_s,chr(13),"
")
        clipboard_set_text(_s)
    }
    if keyboard_check(vk_control)
    && keyboard_check_pressed(ord("X")){
        clipboard_set_text(string_copy(str,min(strPos0,strPos1),max(strPos0,strPos1)-min(strPos0,strPos1)))
        str=string_delete(str,min(strPos0,strPos1),max(strPos0,strPos1)-min(strPos0,strPos1))
    }
    if keyboard_check(vk_control)
    && keyboard_check_pressed(ord("V")){
        str=string_delete(str,min(strPos0,strPos1),max(strPos0,strPos1)-min(strPos0,strPos1))
        str=string_insert(clipboard_get_text(),str,min(strPos0,strPos1))
        strPos0+=string_length(clipboard_get_text())
        strPos1=strPos0
    }
    if keyboard_string!=""{
        str=string_delete(str,min(strPos0,strPos1)+1,max(strPos0,strPos1)-min(strPos0,strPos1))
        str=string_insert(keyboard_string,str,min(strPos0,strPos1)+1)
        
        if strPos0<strPos1{
            strPos0+=string_length(keyboard_string)
            strPos1=strPos0
        }else{
            strPos1+=string_length(keyboard_string)
            strPos0=strPos1
        }
        keyboard_string=""
    }
    
    if keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_delete){
        str=string_delete(str,clamp(min(strPos0,strPos1)+1,1,string_length(str)),max(strPos0,strPos1)-min(strPos0,strPos1))
        strPos0=min(strPos1,strPos0)
        strPos1=strPos0
    }
    
}else{
    if keyboard_check(vk_control)
    && keyboard_check_pressed(ord("V")){
        str=string_insert(clipboard_get_text(),str,strPos0+1)
        strPos0+=string_length(clipboard_get_text())
        strPos1=strPos0
    }
    
    
    if keyboard_string!=""{
        str=string_insert(keyboard_string,str,strPos0+1)
        strPos0+=string_length(keyboard_string)
        strPos1=strPos0
        keyboard_string=""
    }
    
    if keyboard_check(vk_backspace) && strPos0>0{
        if keyboard_check_pressed(vk_backspace){
            str=string_delete(str,strPos0,1)
            strPos0--
        }
        backDelay--
        if backDelay<=0{
            str=string_delete(str,strPos0,1)
            strPos0--
        }
        strPos1=strPos0
    }
    if keyboard_check(vk_delete) && strPos0<string_length(str){
        if keyboard_check_pressed(vk_delete){
            str=string_delete(str,strPos0+1,1)
        }
        backDelay--
        if backDelay<=0{
            str=string_delete(str,strPos0+1,1)
        }
    }
    
    
    if !(keyboard_check(vk_backspace) || keyboard_check(vk_delete)){
        backDelay=15
    }
    
    
}

}else{
    if strPos1!=strPos0{
        if keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_delete){
            str=string_delete(str,clamp(min(strPos0,strPos1)+1,1,string_length(str)),max(strPos0,strPos1)-min(strPos0,strPos1))
            strPos0=min(strPos1,strPos0)
            strPos1=strPos0
        }
        if keyboard_string!=""{
            str=string_delete(str,min(strPos0,strPos1)+1,max(strPos0,strPos1)-min(strPos0,strPos1))
            str=string_insert(keyboard_string,str,min(strPos0,strPos1)+1)
            
            if strPos0<strPos1{
                strPos0+=string_length(keyboard_string)
                strPos1=strPos0
            }else{
                strPos1+=string_length(keyboard_string)
                strPos0=strPos1
            }
            keyboard_string=""
        }
        
    }else{
        if keyboard_check(vk_backspace) && strPos0>0{
            if keyboard_check_pressed(vk_backspace){
                str=string_delete(str,strPos0,1)
                strPos0--
            }
            backDelay--
            if backDelay<=0{
                str=string_delete(str,strPos0,1)
                strPos0--
            }
            strPos1=strPos0
        }
        if keyboard_check(vk_delete) && strPos0<string_length(str){
            if keyboard_check_pressed(vk_delete){
                str=string_delete(str,strPos0+1,1)
            }
            backDelay--
            if backDelay<=0{
                str=string_delete(str,strPos0+1,1)
            }
        }
        
        
        if !(keyboard_check(vk_backspace) || keyboard_check(vk_delete)){
            backDelay=15
        }
        
        if keyboard_string!=""{
            str=string_insert(keyboard_string,str,strPos0+1)
            strPos0+=string_length(keyboard_string)
            strPos1=strPos0
            keyboard_string=""
        }
        
    }
    
}

if keyboard_check(vk_control)
&& keyboard_check_pressed(ord("A")){
    strPos0=0
    strPos1=string_length(str)
}


scr_textBoxDrag2(str2,argument[1],argument[2],argument[3],argument[4])

//Double click
if clickDelay>-1{
    clickDelay--
    if mouse_check_button_pressed(mb_left)
    && scr_GUIhover(xx,yy,xx+ww,yy+hh){
        if clickDelayO=strPos0{
            var pos0=strPos0,pos1=strPos0;
            
            while(pos0>0 && string_char_at(str,pos0)!=chr(13) && string_char_at(str,pos0)!=" "
            && string_char_at(str,pos0)!="{" && string_char_at(str,pos0)!="}"
            && string_char_at(str,pos0)!="(" && string_char_at(str,pos0)!=")"
            && string_char_at(str,pos0)!="[" && string_char_at(str,pos0)!="]"){
                pos0--
            }
            while(pos1<string_length(str) && string_char_at(str,pos1)!=chr(13) && string_char_at(str,pos1)!=" "
            && string_char_at(str,pos1)!="{" && string_char_at(str,pos1)!="}"
            && string_char_at(str,pos1)!="(" && string_char_at(str,pos1)!=")"
            && string_char_at(str,pos1)!="[" && string_char_at(str,pos1)!="]"){
                pos1++
            }
            strPos0=pos0
            strPos1=pos1
            
            clickDelay=-10
        }else{
            clickDelay=-1
        }
    }
}else{
    if mouse_check_button_pressed(mb_left)
    && scr_GUIhover(xx,yy,xx+ww,yy+hh){
        clickDelay=15
        clickDelayO=strPos0
    }
}





return str;

