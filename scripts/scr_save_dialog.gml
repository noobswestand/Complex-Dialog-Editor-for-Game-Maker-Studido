///scr_save()

instance_activate_all()

if saveFile2=""{
    saveFile2=get_save_filename("ini|*.ini", "save")
}
if saveFile2=""{exit}

var day=date_current_datetime();
lastSaved=string(date_get_month(day))+"-"+string(date_get_day(day))+"-"+string(date_get_year(day))
+" "+string(date_get_hour(day))+":"+string(date_get_minute(day))+":"+string(date_get_second(day))


//Make a backup of the save file before deleting
if file_exists(saveFile2){
    
    lastSaved=string(date_get_month(day))+"-"+string(date_get_day(day))+"-"+string(date_get_year(day))
    +" "+string(date_get_hour(day))+"_"+string(date_get_minute(day))+"_"+string(date_get_second(day))
    
    var fname=filename_name(saveFile2);
    if string_count(".ini",fname){
        fname=string_delete(fname,string_length(fname)-3,4)
    }
    fname+="  "+lastSaved+".ini"
    file_copy(saveFile2,"backup\"+fname)
    show_debug_message("Backup: "+fname)
}
file_delete(saveFile2)


ini_open(saveFile2)
ini_write_real("!config","count",instance_number(objNode))
ini_write_real("!config","count2",instance_number(objConvo))
ini_write_real("!config","x",view_xview)
ini_write_real("!config","y",view_yview)
ini_write_real("!config","w",view_wview)
ini_write_real("!config","h",view_hview)

if global.pinNode!=-1 && instance_exists(global.pinNode){
    ini_write_real("!config","pin",global.pinNode.pid)
}

with(objNode){
  
    ini_write_string(string(pid),"name",name)
    ini_write_real(string(pid),"type",type)
    ini_write_real(string(pid),"x",x)
    ini_write_real(string(pid),"y",y)
    ini_write_real(string(pid),"w",w)
    ini_write_real(string(pid),"h",h)
    ini_write_real(string(pid),"color",color)
    ini_write_real(string(pid),"alpha",alpha)
    for(var i=0;i<15;i++){
        if in[i]!=-1 && instance_exists(in[i]){
            ini_write_real(string(pid),"in["+string(i)+"]",in[i].pid)
        }
        if out[i]!=-1 && instance_exists(out[i]){
            ini_write_real(string(pid),"out["+string(i)+"]",out[i].pid)
        }
    }
    
    //fix GM saving  .-.
    text=string_replace_all(text,chr(13),chr(35))
    ini_write_string(string(pid),"text",text)
    
    
    
    ini_write_real(string(pid),"txtC",switchCount)
    for(i=0;i<15;i++){
        ini_write_string(string(pid),"txt"+string(i),selectT[i])
    }
    ini_write_real(string(pid),"check",checkS)
}

if instance_exists(objConvo){
    with(objConvo){
        
        if instance_exists(connect){
            ini_write_real("C"+string(pid),"connect",connect.pid)
            ini_write_string("C"+string(pid),"name",name)
            ini_write_string("C"+string(pid),"name2",name2)
            
            if pinNodeConvo!=-1 && instance_exists(pinNodeConvo){
                ini_write_real("C"+string(pid),"pin",pinNodeConvo.pid)
            }
        }
    }
}

ini_write_string("vars","map",ds_map_write(chatMap))
ini_write_string("default","map",ds_map_write(defaultMap))

ini_close()
