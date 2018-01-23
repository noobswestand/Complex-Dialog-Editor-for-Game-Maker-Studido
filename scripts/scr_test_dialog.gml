///scr_test()


if scr_export_dialog("temp.txt")=0{
    show_message("Could not test because of errors.#Please go fix them")
    return 0;
}
if saveFile=""{exit}

if instance_exists(objNPC){
    with(objNPC){
        instance_destroy()
    }
}

nn=instance_create(0,0,objNPC)
nn.saveFile=saveFile
with(nn){
    event_user(0);
}
