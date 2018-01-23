///scr_nodeHasNoConnections(id)

with(argument[0]){
    for(i=0;i<15;i++){
        if in[i]!=-1
        || out[i]!=-1{
            return false;
        }
    }
}
return true;
