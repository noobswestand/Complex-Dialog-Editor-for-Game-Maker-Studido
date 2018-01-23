///scr_new()

if instance_exists(objNode){
    if show_question("Do you want to save changes before exiting?"){
        scr_save_dialog()
    }
}
instance_activate_all()
if instance_exists(objNode){
    with(objNode){
        instance_destroy()
    }
    ds_list_clear(nodeList)
    for(i=0;i<1000;i++){
        nodeList[| i]=-1
    }
    
}
if instance_exists(objConvo){
    with(objConvo){
        instance_destroy()
    }
}


ds_map_clear(chatMap)
event_user(0)//Resets default map

saveFile2=""
