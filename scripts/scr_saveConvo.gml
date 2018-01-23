///scr_saveConvo(string-command)

var _str=argument[0];
var _rstr="";

while(_str!=""){
    if string_count("|",_str)=0{break}
    var st=string_copy(_str,1,string_pos("|",_str)-1);
    
    if string_count("convo(",st)>0{
        
        var bstr="";
        
        o0=-1 o1=-1
        if string_count("if ",st)==0{
            var st2=string_delete(st,1,string_length("convo("))
            o0=real(string_copy(st2,0,string_pos(",",st2)-1));
            o1=real(string_replace(string_copy(st2,string_pos(",",st2)+1,string_pos(")",st2)-1),")",""));
        }else{
            bstr=string_copy(st,1,string_pos("convo(",st)-1)
            var st2=string_delete(st,1,string_length("convo(")-1+string_pos("convo(",st))
            st2=string_delete(st2,string_length(st2),1)
            o0=real(string_copy(st2,0,string_pos(",",st2)-1));
            o1=real(string_replace(string_copy(st2,string_pos(",",st2)+1,string_pos(")",st2)-1),")",""));
        }
        
        
        
        //find the conversation
        _id=-1
        with(objConvo){
            //show_message(string(name)+","+string(name2)+"    "+string(other.o0)+"  "+string(other.o1))
            if real(name)==real(other.o0) && real(name2)==real(other.o1){
                other._id=id;
            }
        }
        if _id=-1{
            show_message("Unable to find "+st+"!#Leaving it out...")
        }else{
        
            //find the first node in the conversation
            _n=-1;
            //check for the pin
            with(_id){
                if pinNodeConvo!=-1
                && instance_exists(pinNodeConvo){
                    other._n=pinNodeConvo
                }
            }
            //check everything else
            if _n=-1{
                with(objNode){
                    if convo=other._id{
                        var _d=true
                        for(i=0;i<15;i++){
                            if in[i]!=-1 || !instance_exists(in[i]){
                                _d=false
                            }
                        }
                        if _d=true{
                            other._n=id
                        }
                    }
                }
            }
            
            
            //add line(x,y) back in
            if string_count("if ",st)==0{
                _rstr+="line("+string(_n.on0)+","+string(_n.on1)+")|";
            }else{
                _rstr+=bstr+"line("+string(_n.on0)+","+string(_n.on1)+")}|";
            }
        }
        
    }else{
        _rstr+=st+"|";
    }
    
    _str=string_delete(_str,1,string_pos("|",_str))
}


if string_count(":",argument[0])!=0{
    _rstr+=":"
}

//show_message(_rstr)
_rstr=string_replace_all(_rstr,"||","|")
_rstr=string_replace_all(_rstr,"::",":")
return _rstr;
