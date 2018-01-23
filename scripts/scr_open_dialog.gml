
///scr_open()

if instance_exists(objNode){
    if show_question("Do you want to save changes before exiting?"){
        scr_save_dialog()
    }
}

saveFile3=get_open_filename("ini|*.ini", "save")



//saveFile2=saveFile3
if saveFile3=""{exit}

instance_activate_all()
if instance_exists(objNode){
    with(objNode){
        instance_destroy()
    }
    ds_list_clear(nodeList)
}
if instance_exists(objConvo){
    with(objConvo){
        instance_destroy()
    }
}


ini_open(saveFile3)

var count=ini_read_real("!config","count",0)

view_xview=ini_read_real("!config","x",0)
view_yview=ini_read_real("!config","y",0)
view_wview=ini_read_real("!config","w",0)
view_hview=ini_read_real("!config","h",0)


//loadBasics
for(var i=0;i<1000;i++){
    if ini_section_exists(string(i)){
        var xx,yy;
        xx=ini_read_real(string(i),"x",0)
        yy=ini_read_real(string(i),"y",0)
        nn=instance_create(xx,yy,objNode)
        nn.w=ini_read_real(string(i),"w",0)
        nn.h=ini_read_real(string(i),"h",0)
        nn.type=ini_read_real(string(i),"type",0)
        nn.name=ini_read_string(string(i),"name","ERROR")
        nn.text=ini_read_string(string(i),"text","ERROR")
        nn.switchCount=ini_read_real(string(i),"txtC",1)
        for(var ii=0;ii<15;ii++){
            nn.selectT[ii]=ini_read_string(string(i),"txt"+string(ii),"")
        }
        nn.checkS=ini_read_real(string(i),"check",0)
        
        //fix GM loading  .-.
        nn.text=string_replace_all(nn.text,chr(13),chr(35))
        
        /*
        for(var a=0;a<string_length(nn.text);a++){
            show_message(ord(string_char_at(nn.text,a+1)))
        }
        */
        
        nn.pid=i
        nodeCount++
        //ds_list_add(nodeList,nn)
        nodeList[| i]=nn
        dropI[nn.type]++
    }
}

//show_message(ds_exists(nodeList,ds_type_list))

//loadConnections
for(var i=0;i<1000;i++){
    if nodeList[| i]!=-1{
        
        var nn=nodeList[| i];//ds_list_find_value(nodeList,i);
        for(ii=0;ii<15;ii++){
            //show_debug_message("1 " +string(ii))
            if ini_key_exists(string(i),"in["+string(ii)+"]"){
                var o=ini_read_real(string(i),"in["+string(ii)+"]",0);
                o=nodeList[| o]//ds_list_find_value(nodeList,o)
                if !is_undefined(o){
                //o=nodeList[i]
                //if o!=-1{
                    nn.in[ii]=o
                }else{
                    show_debug_message("Error while loading connection: node "+string(i)+"  "+"in["+string(ii)+"]="+string(ini_read_real(string(i),"in["+string(ii)+"]",0)))
                }
                
            }
            if ini_key_exists(string(i),"out["+string(ii)+"]"){
                var o=ini_read_real(string(i),"out["+string(ii)+"]",0);
                //nn.out[ii]=ds_list_find_value(nodeList,o)
                o=nodeList[| o]//ds_list_find_value(nodeList,o)
                if !is_undefined(o){
                    nn.out[ii]=o
                }else{
                    show_debug_message("Error while loading connection: node "+string(i)+"  "+"out["+string(ii)+"]="+string(ini_read_real(string(i),"out["+string(ii)+"]",0)))
                }
            }
            
        }
        
    }
    
}


//load Convos
for(var i=0;i<1000;i++){
    if ini_section_exists("C"+string(i)){
        
        nn=instance_create(0,0,objConvo)
        nn.name=ini_read_string("C"+string(i),"name","ERROR")
        nn.name2=ini_read_string("C"+string(i),"name2","ERROR")
        nn.pid=i
        var o=ini_read_real("C"+string(i),"connect",0);
        nn.connect=nodeList[| o];
        convCount=i
        nodeList[| o].convo=nn
        
        //pin
        o=ini_read_real("C"+string(i),"pin",-1);
        if o!=-1{
            nn.pinNodeConvo=nodeList[| o]
        }
        
    }
}
o=ini_read_real("!config","pin",-1)
if o!=-1{
    global.pinNode=nodeList[| o]
}
convCount++

var v=ini_read_string("vars","map","");
ds_map_clear(chatMap)
if v!=""{
    ds_map_read(chatMap,v)
}

var v=ini_read_string("default","map","");
event_user(0)//Resets default map
if v!=""{
    ds_map_read(defaultMap,v)
}




ini_close()

saveFile2=""


if instance_number(objNode)>50
&& objControl.op0[0]==true{
    show_message("There are too many nodes for 'fancy lines' to be enabled!")
    objControl.op0[0]=false
}

alarm[11]=1

