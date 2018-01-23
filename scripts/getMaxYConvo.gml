///getMaxYConvo(id)
var ww=argument[0].y+argument[0].h;
argument[0].saved=true

for(var i=0;i<15;i++){
    
    if argument[0].in[i]!=-1
    && !instance_exists(argument[0].in[i]){
        instance_activate_object(argument[0].in[i])
    }
    if argument[0].in[i]!=-1
    && instance_exists(argument[0].in[i])
    && argument[0].in[i].saved=false{
        ww=max(ww,getMaxYConvo(argument[0].in[i]))
    }
    
    if argument[0].out[i]!=-1
    && !instance_exists(argument[0].out[i]){
        instance_activate_object(argument[0].out[i])
    }
    if argument[0].out[i]!=-1
    && instance_exists(argument[0].out[i])
    && argument[0].out[i].saved=false{
        ww=max(ww,getMaxYConvo(argument[0].out[i]))
    }
    
}
return ww;
