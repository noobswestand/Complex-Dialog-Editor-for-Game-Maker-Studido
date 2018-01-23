///load_npcChat(file)
//if !file_exists(argument[0]){return 0}

file=file_text_open_read(argument[0])
if file_text_read_string(file)!="[text]"{return 0}
file_text_readln(file)

while(!file_text_eof(file)){
    var str=file_text_read_string(file);
    if str="[config]"{break}
    var str2=string_copy(str,1,string_pos("=",str)-1);
    var _on0,_on1;
    
    if string_count("text[",str2){
        _on0=real(string_copy(str2,string_length("text[")+1,string_pos(",",str2)-string_length("text[")-1))
        _on1=real(string_copy(str2,string_pos(",",str2)+1,string_pos("]",str2)-string_pos(",",str2)-1))
        line[_on0,_on1]=string_copy(str,string_pos("=",str)+1,999)
        //OPTIONS
        if string_count("(OPTION): ",line[_on0,_on1])=1{
            //text
            var str3=string_copy(str,string_pos("=",str)+string_length("(OPTION): "),99999);
            line[_on0,_on1]=str3
            
            repeat(2){
                file_text_readln(file)
                str=file_text_read_string(file);
                var on=0;
                if string_count("op0[",str)=0{
                    on=1
                }
            
                if on==0{
                    //op0
                    op0[_on0,_on1]=ds_list_create()
                    var _c=0;
                    while(string_count(":",str)){
                        if _c=0{var len=string_length("op0["+string(_on0)+","+string(_on1)+"]");}else{var len=0;}
                        var str3=(string_copy(str,len+1+(_c=0),string_pos(":",str)-1-len-(_c=0)))
                        ds_list_insert(op0[_on0,_on1],_c,str3)
                        str=string_delete(str,1,string_pos(":",str))
                        _c++
                    }
                }
                
                if on==1{
                    //op1
                    
                    op1[_on0,_on1]=ds_list_create()
                    var _c=0;
                    while(string_count(":",str)){
                        if _c=0{var len=string_length("op0["+string(_on0)+","+string(_on1)+"]");}else{var len=0;}
                        var str3=(string_copy(str,len+1+(_c=0),string_pos(":",str)-1-len-(_c=0)))
                        //show_message(str3)
                        ds_list_insert(op1[_on0,_on1],_c,str3)
                        //Get the Lables
                        load_npcLabel(str3,_on0,_on1)
                        
                        str=string_delete(str,1,string_pos(":",str))
                        _c++
                    }
                }
            
            }
            
        }
        
        
        
        //Get the Lables
        var str=string_copy(line[_on0,_on1],string_pos("|",line[_on0,_on1]),9999);
        load_npcLabel(str,_on0,_on1)
        /* --Old way of doing it-- easier to put into script. Kept for backup reasons
        while(str!=""){
            if string_count("|",str)=0{break}
            var str2=string_copy(str,0,string_pos("|",str)-1);
            
            
            if string_count("label(",str2){
                str2=string_delete(str2,1,string_length("label("))
                
                lbl[lblAmount]=string_copy(str2,1,string_pos(")",str2)-1)
                lblText0[lblAmount]=_on0
                lblText1[lblAmount]=_on1
                
                //show_message(lbl[lblAmount]+"  "+string(_on0)+","+string(_on1))
                
                lblAmount++
            }
            
            str=string_delete(str,1,string_pos("|",str))
        }
        */
        
        
        
        
        
        
    }
    file_text_readln(file)
}

file_text_readln(file)
while(!file_text_eof(file)){
    if str="[vars]"{break}
    var str=file_text_read_string(file);
    var str2=string_copy(str,1,string_pos("=",str)-1);
    var str3=string_copy(str,string_pos("=",str)+1,99);
    
    var _on0,_on1;
    if string_count("quest[",str2){
        _on0=real(string_copy(str2,string_length("quest[")+1,string_pos(",",str2)-string_length("quest[")-1))
        _on1=real(string_copy(str2,string_pos(",",str2)+1,string_pos("]",str2)-string_pos(",",str2)-1))
        
        //add to check list
        checkQuest[checkAmount]=_on0
        checkON[checkAmount]=_on1
        checkText0[checkAmount]=real(string_copy(str3,1,string_pos(",",str3)-1))
        checkText1[checkAmount]=real(string_copy(str3,string_pos(",",str3)+1,99))
        
        checkAmount++
    }
    file_text_readln(file)
}


//Read Vars
while(!file_text_eof(file)){
    if str="[default]"{break}
    var str=file_text_read_string(file);
    var str2=string_copy(str,1,string_pos("=",str)-1);
    var str3=string_copy(str,string_pos("=",str)+1,999);
    if str2=="vars"{
        ds_map_read(chatMap,str3)
    }
    file_text_readln(file)
}

//Default text effects
while(!file_text_eof(file)){
    var str=file_text_read_string(file);
    var str2=string_copy(str,1,string_pos("=",str)-1);
    var str3=string_copy(str,string_pos("=",str)+1,999);
    if str2=="default"{
        ds_map_read(defaultMap,str3)
    }
    file_text_readln(file)
}




//set the text based off the config we just loaded
for(var i=0;i<checkAmount;i++){
    if objControl.quest[checkQuest[i]]=checkON[i]{
        on0=checkText0[i]
        on1=checkText1[i]
    }
}





file_text_close(file)
return 1
