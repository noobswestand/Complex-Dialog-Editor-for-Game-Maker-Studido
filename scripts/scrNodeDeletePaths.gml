///scrNodeDeletePaths()

/*
if objControl.op0[0]=false{
    return 0;
}
*/

for(var ii=0;ii<15;ii++){
    if path_exists(path[ii]){
        path_delete(path[ii])
    }
    if in[ii]!=-1 && instance_exists(in[ii]){
        with(in[ii]){
            for(var _i=0;_i<15;_i++){
                if path_exists(path[_i]){
                    path_delete(path[_i])
                }
                alphaCheck=true
            }
            event_user(0)
        }
    }
}
event_user(0)
return 1;
