///scr_saveGetStackedScripts(nn)

var st=string_replace_all(argument[0].text+"|",chr(13),chr(35));
var _s=st;


//show_message(string(on0)+","+string(on1)+": "+string(argument[0].text))
argument[0].on0=on0
argument[0].on1=on1


for(var _b=0;_b<15;_b++){
    if argument[0].out[_b]!=-1 && instance_exists(argument[0].out[_b]){
        if argument[0].out[_b].type=1{
            _s+=scr_saveGetStackedScripts(argument[0].out[_b])
        }
    }
}
return _s;
