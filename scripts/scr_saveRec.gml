///scr_saveRec(nn,on0,on1)

if argument[0].saved=false{
    scr_saveNode(argument[0],argument[1],argument[2])
}
//show_message(argument[0].text)

for(var i=0;i<15;i++){
    if argument[0].out[i]!=-1 && instance_exists(argument[0].out[i]){
        
        if argument[0].out[i].saved=false{
            scr_saveRec(argument[0].out[i],on0,on1)
        }else{
            //put a pointer back!--only do text boxes to be safe
            if argument[0].type=0 || argument[0].type=1{
                scr_savePointer(argument[0],argument[0].out[i])
            }
        }
        
    }
}
