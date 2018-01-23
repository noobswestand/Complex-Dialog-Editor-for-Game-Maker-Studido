///scr_saveNode(nn,on0,on1)
argument[0].saved=true
if argument[0].alpha<.75{exit}
switch(argument[0].type){
    //Text
    case 0:
        var str=string(argument[0].text);
        argument[0].on0=argument[1]
        argument[0].on1=argument[2]
        
        var ad=false
        //check for scripts
        for(var _a=0;_a<15;_a++){
            if argument[0].out[_a]!=-1 && instance_exists(argument[0].out[_a])
            && argument[0].out[_a].type=1{
                if ad=false{
                    str+="|"
                    ad=true
                }
                str+=scr_saveGetStackedScripts(argument[0].out[_a])
            }
        }
        //fix GM loading  .-.
        str=string_replace_all(str,chr(13),chr(35))
        str=string_replace_all(str,chr(10),"")
        file_text_write_string(file,"text["+
        string(argument[1])+","+string(argument[2])+"]="+'"'+str+'"')
        file_text_writeln(file)
        //pon0=on0
        //pon1=on1
        on0++
    break;
    
    //Script
    case 1:
        
        //argument[0].on0=argument[1]
        //argument[0].on1=argument[2]
        //show_message(string(on0)+","+string(on1)+": "+string(argument[0].text))
        
    break;
    
    //Switch
    case 2:
        file_text_write_string(file,"text["+
        string(argument[1])+","+string(argument[2])+"]=(OPTION): "+string_replace_all(string(argument[0].text),chr(13),chr(35)))
        file_text_writeln(file)
        var str="";
        for(var _a=0;_a<argument[0].switchCount;_a++){
            str+=argument[0].selectT[_a]+":"
        }
        //fix GM loading  .-.
        str=string_replace_all(str,chr(13),chr(35))
        file_text_write_string(file,"op0["+
        string(argument[1])+","+string(argument[2])+"]="+str)
        file_text_writeln(file)
        argument[0].on0=argument[1]
        argument[0].on1=argument[2]
        
        //pon0=on0
        //pon1=on1
        //ponID=argument[0]
        argument[0].ponWrote=false
        on0=0
        on1++
    break;
    
    
    //Check
    case 3:
        str=""
        var _on0,_on1,pon0,pon1,ponID;
        _on0=argument[1]
        _on1=argument[2]
        pon0=-1;
        pon1=-1;
        ponID=-1;
        
        
        
        var ponID=-1;
        //find corresponding Switch Node
        for(var _a=0;_a<15;_a++){
            if argument[0].in[_a]!=-1 && instance_exists(argument[0].in[_a]){
                if argument[0].in[_a].type==2{
                    ponID=argument[0].in[_a]
                    pon0=argument[0].in[_a].on0
                    pon1=argument[0].in[_a].on1
                    break;
                }
            }
        }
        var ponWrote=ponID.ponWrote;
        
        var __pon0=on0,__pon1=on1,__pon01=on0,__pon11=on1;
        
        var gotI=-1;
        for(var _a=0;_a<15;_a++){
            if argument[0].out[_a]!=-1 && instance_exists(argument[0].out[_a]){
                if (argument[0].out[_a].type==0 || argument[0].out[_a].type==2 || argument[0].out[_a].type==1){
                    if argument[0].out[_a].saved=false{
                        str+=string(0)+","+string(on1)+"|"
                        scr_saveRec(argument[0].out[_a],on0,on1)
                        on0=0
                        on1++
                    }else{
                        str+=string(argument[0].out[_a].on0)+","+string(argument[0].out[_a].on1)+"|"
                    }
                    gotI=_a
                }
                
            }
        }
        
        //To get the correct [on0,on1] for scripts attached to the switches!
        __pon0=on0 __pon1=on1
        on0=__pon01
        on1=__pon11
        for(var _a=0;_a<15;_a++){
            if argument[0].out[_a]!=-1 && instance_exists(argument[0].out[_a]){
                switch(argument[0].out[_a].type){
                    case 1://script
                        str+=scr_saveGetStackedScripts2(argument[0])
                    break;
                }
            }
        }
        on0=__pon0
        on1=__pon1
        
        
        if ponID.ponWrote=false{
            file_text_close(file)
            /*
            file_text_writeln(file)
            file_text_write_string(file,"op1["+string(pon0)+","+string(pon1)+"]="+str+":")
            //show_message(str)
            file_text_writeln(file)
            */
            var str3="op1["+string(pon0)+","+string(pon1)+"]="+str+":"
            file=file_text_open_read(saveFile)
            var str2="",_b=0;
            while(string_pos("op0["+string(pon0)+","+string(pon1)+"]=",str2)=0){
                str2=file_text_read_string(file)
                file_text_readln(file)
                _b++
                if file_text_eof(file){
                    break;
                }
            }
            file_text_close(file)
            file_text_insert(saveFile,_b,str3)
            file=file_text_open_append(saveFile)
            file_text_writeln(file)//check here
            
            ponID.ponWrote=true
        }else{
            if ponID!=-1{//argument[0].in[0]
                //refind, and add string
                file_text_close(file)
                
                file=file_text_open_read(saveFile)
                var _c=0,str2="",_b=0;
                while(string_pos("op1["+string(pon0)+","+string(pon1)+"]=",str2)=0){
                    str2=file_text_read_string(file)
                    file_text_readln(file)
                    _c++
                    if file_text_eof(file){
                        break;
                    }
                }
                
                if string_char_at(str,string_length(str))=='"'{
                    str=string_delete(str,string_length(str),1)
                }
                if string_char_at(str2,string_length(str2))=='"'{
                    str2=string_delete(str2,string_length(str2),1)
                }
                if string_char_at(str2,string_length("op1["+string(pon0)+","+string(pon1)+"]=")+1)=='"'{
                    str2=string_delete(str2,string_length("op1["+string(pon0)+","+string(pon1)+"]=")+1,1)
                }
                
                str=string_insert(str2,str,1)+":"
                file_text_close(file)
                
                file=file_text_open_read(saveFile)
                while(string_pos("op0["+string(pon0)+","+string(pon1)+"]=",str2)=0){
                    str2=file_text_read_string(file)
                    file_text_readln(file)
                    _b++
                    if file_text_eof(file){
                        break;
                    }
                }
                file_text_close(file)
                
                
                //show_message("check0")
                file_text_delete(saveFile,_c-1)
                
                //show_message(string(_b)+"  "+string(fileLineCount))
                while(_b>=fileLineCount){
                    _b--
                    //show_message(string(_b)+"  "+string(fileLineCount))
                }
                //show_message("check1")
                file_text_insert(saveFile,_b,str)
                
                file=file_text_open_append(saveFile)
                file_text_writeln(file)//check here
            }
        }
        
    break;
}


