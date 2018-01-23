///scr_npcChatCommands(str)
var str=argument[0];

while(str!=""){
    if string_count("|",str)=0{break}
    var str2=string_copy(str,0,string_pos("|",str)-1);
    
    var ex=false;//whether it did a command or not-- if not, then it tries to do a script
    
    
    ///////////////////IF///////////////////
    if string_count("if ",str2){ex=true
        str2=string_delete(str2,1,3)
        var scr2=string_copy(str2,1,string_pos("(",str2)-1)
        var _not=string_count("!",string_copy(scr2,1,1));
        if (_not=1){
            scr2=string_delete(scr2,1,1)
        }
        scr2=string_replace_all(scr2," ","")
        scr2=string_replace_all(scr2,"#","")
        var scr=asset_get_index(scr2)
        var _r=0;
        
        if scr=-1{
            
            //check to see if you are comparing variables (in map)
            if string_count("=",string_copy(str2,1,string_pos("{",str2)-1))
            || string_count(">",string_copy(str2,1,string_pos("{",str2)-1))
            || string_count("<",string_copy(str2,1,string_pos("{",str2)-1))
            || string_count(">=",string_copy(str2,1,string_pos("{",str2)-1))
            || string_count("<=",string_copy(str2,1,string_pos("{",str2)-1)){
                str2=string_replace_all(str2,"==","=")
                var k,v;
                var sym="",symL=1;
                if string_count("=",string_copy(str2,1,string_pos("{",str2)-1)){sym="=" symL=1}
                if string_count(">",string_copy(str2,1,string_pos("{",str2)-1)){sym=">" symL=1}
                if string_count("<",string_copy(str2,1,string_pos("{",str2)-1)){sym="<" symL=1}
                if string_count(">=",string_copy(str2,1,string_pos("{",str2)-1)){sym=">=" symL=2}
                if string_count("<=",string_copy(str2,1,string_pos("{",str2)-1)){sym="<=" symL=2}
                
                k=string_copy(str2,1,string_pos(sym,str2)-symL)
                if sym!=""{
                    v=string_copy(str2,string_pos(sym,str2)+symL,string_pos("{",str2)-symL-string_pos(sym,str2))
                }
                if ds_map_exists(chatMap,k){
                    if string(real(chatMap[?k]))==(chatMap[?k]){chatMap[?k]=real(chatMap[?k])}
                    if string(real(v))==(v){v=real(v)}
                    switch(sym){
                        case "": _r=(chatMap[?k]>=0.5)break;
                        case "=": _r=(chatMap[?k]==v) break;
                        case ">": _r=(chatMap[?k]>v) break;
                        case "<": _r=(chatMap[?k]<v) break;
                        case ">=": _r=(chatMap[?k]>=v) break;
                        case "<=": _r=(chatMap[?k]<=v) break;
                    }
                    //convert back to strings
                    chatMap[?k]=string(chatMap[?k])
                    
                }else{
                    _r=0
                }
            }else{
                //ask the player for input
                _r=get_integer("There is no script "+scr2+
                    ".#Please enter what it would return in game, so that I can continue.",0)
            }
            
        }else{
            //TEST
            for(aa=0;aa<5;aa++){arg[aa]=""}
            var _count=0;
            var str4=string_copy(str2,1,string_pos("{",str2)-1)
            str3=string_copy(str4,string_pos("(",str4)+1,string_pos(")",str4)-1)
            while(str3!=""){
                
                if string_count(",",str3)=0{
                    arg[_count]=string(string_copy(str3,1,string_pos(")",str3)-1))
                    str3=""
                }else{
                    arg[_count]=string(string_copy(str3,1,string_pos(",",str3)-1))
                    str3=string_delete(str3,1,string_pos(",",str3))
                }
                arg[_count]=string_replace_all(arg[_count],'"','')
                _count++
            }
            
            str2=string_delete(str2,1,string_pos("{",str2))
           
            _r=script_execute(scr,arg[0],arg[1],arg[2],arg[3],arg[4])
        }
        
        //DO
        if (_r>0 && _not=false) || (_r=0 && _not=true){
            str3=string_copy(str2,string_pos("{",str2)+1,string_pos("}",str2)-(string_pos("{",str2)+1))
            var scr=string_copy(str3,1,string_pos("(",str2)-1)
            
            //show_message(string(on0)+","+string(on1)+"     "+scr);
            scr=string_replace_all(scr," ","")
            scr=string_replace_all(scr,"#","")
            var scr=asset_get_index(scr)
            
            if scr=-1{
                
                scr_npcDialogCommands("|"+str3+"|")
                
            }else{
            
                for(aa=0;aa<5;aa++){arg[aa]=""}
                _count=0
                str3=string_copy(str3,string_pos("(",str3)+1,string_pos(")",str3)-1)
                while(str3!=""){
                   if string_count(",",str3)=0{
                        arg[_count]=string_copy(str3,1,string_pos(")",str3)-1)
                        str3=""
                    }else{
                        arg[_count]=string_copy(str3,1,string_pos(",",str3)-1)
                        str3=string_delete(str3,1,string_pos(",",str3))
                    }
                    arg[_count]=string_replace_all(arg[_count],'"','')
                    _count++
                }
                
                script_execute(scr,arg[0],arg[1],arg[2],arg[3],arg[4])
            }//else
        }
        str2=""
    }
    
    
    ///////////////////quest(on0,on1)///////////////////
    if string_count("quest(",str2){ _did=true  ex=true
        str2=string_delete(str2,1,string_length("quest("))
        var _q=real(string_copy(str2,0,string_pos(",",str2)-1));
        var _o=real(string_replace(string_copy(str2,string_pos(",",str2)+1,string_pos(")",str2)-1),")",""));
        objControl.quest[_q]=_o
    }
    
    
    ///////////////////line(on0,on1)///////////////////
    if string_count("line(",str2){ex=true
        str2=string_delete(str2,1,string_length("line("))
        var l0=string_copy(str2,0,string_pos(",",str2)-1); str2=string_delete(str2,1,string_pos(",",str2))
        var l1=string_copy(str2,0,string_pos(")",str2)-1);
        on0=max(real(l0)-1,-1)//on0=real(l0)-1
        on1=real(l1)
    }
    
    
    ///////////////////tele(x,y)///////////////////
    if string_count("teleNPC(",str2){ex=true
        str2=string_delete(str2,1,string_length("teleNPC("))
        var xx=string_copy(str2,0,string_pos(",",str2)-1); str2=string_delete(str2,1,string_pos(",",str2))
        var yy=string_copy(str2,0,string_pos(")",str2)-1);
        if string_count("*",xx){xx=real(string_replace_all(xx,"*",""))+x}
        if string_count("*",yy){yy=real(string_replace_all(yy,"*",""))+y}
        x=real(xx) y=real(yy)
    }
    
    ///////////////////telePlayer(x,y)///////////////////
    if string_count("telePlayer(",str2){ex=true
        str2=string_delete(str2,1,string_length("tele("))
        var xx=string_copy(str2,0,string_pos(",",str2)-1); str2=string_delete(str2,1,string_pos(",",str2))
        var yy=string_copy(str2,0,string_pos(")",str2)-1);
        if string_count("*",xx){xx=real(string_replace_all(xx,"*",""))+x}
        if string_count("*",yy){yy=real(string_replace_all(yy,"*",""))+y}
        //objPlayer.x=real(xx) objPlayer.y=real(yy)
    }
    
    ///////////////////showChat///////////////////
    if string_count("showChat",str2){ex=true
        showText2=false
    }
    
    ///////////////////label(Label)///////////////////
    if string_count("label(",str2){ex=true
        //do nothing!
        //This is solved during the loading phase - it is put into a list
    }
    
    ///////////////////goto(Label)///////////////////
    if string_count("goto(",str2){ex=true
    
        show_message(str2)
        var str2=string_delete(str2,1,string_length("goto("))
        str2=string_delete(str2,string_length(str2),1)
        
        var found=false;
        //Find the label
        for(var i=0;i<lblAmount;i++){
            if lbl[i]==str2{
                on0=lblText0[i]-1
                on1=lblText1[i]
                found=true
            }
        }
        if found==false{
            show_message("Unable to find Label: "+string(str2))
        }
        
    }
    
    //Change Var
    if string_count("=",str2) && !string_count("if ",str2){
        var a,s,d,m;
        a=string_count("+=",str2)
        s=string_count("-=",str2)
        d=string_count("/=",str2)
        m=string_count("*=",str2)
        var k,v;
        k=string_copy(str2,1,string_pos("=",str2)-1-(a||s||d||m))
        v=string_copy(str2,string_pos("=",str2)+1,99)
        //check data type
        if ds_map_exists(chatMap,k){
            if string(real(chatMap[?k]))==(chatMap[?k]){
                chatMap[?k]=real(chatMap[?k])
                v=real(v)
                if a==1{
                    chatMap[?k]+=v
                }else if s==1{
                    chatMap[?k]-=v
                }else if d==1{
                    chatMap[?k]/=v
                }else if m==1{
                    chatMap[?k]*=v
                }else{
                    chatMap[?k]=v
                }
            }else{
                if a==1{
                    chatMap[?k]+=v
                }else{
                    chatMap[?k]=v
                }
            }
        }else{
            show_message("Unknown variable: "+string(k))
        }
    }
    
    
    
    //General scripts-- ingame
    if  ex=false{
        var scr=string_copy(str2,1,string_pos("(",str2)-1)
        if scr!=""{
            var scr=asset_get_index(scr)
            if scr>-1{
                //get the arguments
                str3=string_copy(str2,string_pos("(",str2)+1,string_pos(")",str2)-1)
                var _count=0;
                arg[0]=0 arg[1]=0 arg[2]=0 arg[3]=0 arg[4]=0;
                while(str3!=""){
                    
                    if string_count(",",str3)=0{
                        arg[_count]=string(string_copy(str3,1,string_pos(")",str3)-1))
                        str3=""
                    }else{
                        arg[_count]=string(string_copy(str3,1,string_pos(",",str3)-1))
                        str3=string_delete(str3,1,string_pos(",",str3))
                    }
                    arg[_count]=string_replace_all(arg[_count],'"','')
                    _count++
                }
                //do the script
                script_execute(scr,arg[0],arg[1],arg[2],arg[3],arg[4])
            }else{
                show_message("Unkown script: "+string(str2))
            }
        }
    }
    
    
    
    
    str=string_delete(str,1,string_pos("|",str))
}

