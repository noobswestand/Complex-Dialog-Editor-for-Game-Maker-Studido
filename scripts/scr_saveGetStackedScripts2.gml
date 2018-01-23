///scr_saveGetStackedScripts(nn)
var _s=""//argument[0].text+"|"; 
for(var _b=0;_b<15;_b++){
    if argument[0].out[_b]!=-1 && instance_exists(argument[0].out[_b]){
        if argument[0].out[_b].type=1{
            _s+=scr_saveGetStackedScripts(argument[0].out[_b])
        }
    }
}
return _s;
