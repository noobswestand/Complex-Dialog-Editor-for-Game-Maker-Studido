///scrNodeInViewConnection()
/*
    Also takes into consideration everything connecte to it
*/

if !(argument[0].x+argument[0].w>view_xview && argument[0].y+argument[0].h>view_yview
&& argument[0].x<view_xview+view_wview && argument[0].y<view_yview+view_hview){
    
    var view=false
    for(var ii=0;ii<15;ii++){
        if in[ii]!=-1 && instance_exists(in[ii]){
            view=scrNodeInView(in[ii])
        }
        if out[ii]!=-1 && instance_exists(out[ii]){
            view=scrNodeInView(out[ii])
        }
    }
    return view;
    
}else{return true}

