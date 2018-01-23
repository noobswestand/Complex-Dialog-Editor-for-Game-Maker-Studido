///load_npcChat()


//Checks to see if the file exists
if !file_exists(global.NPCdirectory+"\"+string(argument[0])+".txt"){return 0}

//Opens the file and checks to see if it starts with "[text]"
file=file_text_open_read(global.NPCdirectory+"\"+string(argument[0])+".txt")
if file_text_read_string(file)!="[text]"{file_text_close(file) return 0}
file_text_readln(file)

//Loops through the entire file, reading all of the dialog and storing it in variables
while(!file_text_eof(file)){
    var str=file_text_read_string(file);
    
    //Stops the loop once it reaches the "[config]" part of the file (read more at next while loop)
    if str="[config]"{break}
    
    //Starts to deconstruct the line
    var str2=string_copy(str,1,string_pos("=",str)-1);
    var _on0,_on1;
    
    if string_count("text[",str2){
        
        //Reads (on0,on1) from "text[on0,on1]=..."
        _on0=real(string_copy(str2,string_length("text[")+1,string_pos(",",str2)-string_length("text[")-1))
        _on1=real(string_copy(str2,string_pos(",",str2)+1,string_pos("]",str2)-string_pos(",",str2)-1))
        
        //Gets the content of the line(on0,on1)
        line[_on0,_on1]=string_copy(str,string_pos("=",str)+1,999)
        
        //Checks for branching dialog options!
        
        if string_count("(OPTION): ",line[_on0,_on1])=1{//OPTIONS
            
            //Gets the text content
            var str3=string_copy(str,string_pos("=",str)+string_length("(OPTION): "),99999);
            line[_on0,_on1]=str3
            
            //Reads the options + what line to jump to if those options are pressed
            repeat(2){
                file_text_readln(file)
                str=file_text_read_string(file);
                var on=0;
                if string_count("op0[",str)=0{
                    on=1
                }
                
                //Gets what line to jump to
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
                
                //Gets the text for the different options
                if on==1{
                    //op1
                    op1[_on0,_on1]=ds_list_create()
                    var _c=0;
                    while(string_count(":",str)){
                        if _c=0{var len=string_length("op0["+string(_on0)+","+string(_on1)+"]");}else{var len=0;}
                        var str3=(string_copy(str,len+1+(_c=0),string_pos(":",str)-1-len-(_c=0)))
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
        
        
        
        
    }
    
    file_text_readln(file)
}


//"[config]" Load
file_text_readln(file)
while(!file_text_eof(file)){
    if str="[vars]"{break}
    var str=file_text_read_string(file);
    var str2=string_copy(str,1,string_pos("=",str)-1);
    var str3=string_copy(str,string_pos("=",str)+1,99);
    
    //Deconstructs the "quest[QuestID,QuestStep]"
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


//Read in the default variables
while(!file_text_eof(file)){
    if str="[default]"{break}
    var str=file_text_read_string(file);
    var str2=string_copy(str,1,string_pos("=",str)-1);
    var str3=string_copy(str,string_pos("=",str)+1,999);
    if str2=="vars"{
        //do the simple built in command for reading ds_maps
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
