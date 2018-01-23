///scr_export([file])
on0=0
on1=0

instance_activate_all()

if !instance_exists(objNode){
    show_message_async("There is nothing to export!")
    return 0;
    exit
}
with(objNode){
    saved=false
    select=false
    on0=-1
    on1=-1
    //pon0=-1
    //pon1=-1
    ponWrote=false
    start=false
}

if argument_count=0{
    saveFile=get_save_filename("text|*.txt", "text")
    if saveFile=""{exit}
    if file_exists(saveFile){
        file_delete(saveFile)
    }
}else{
    saveFile=argument[0]
}

//warn them
found=false
with(objNode){
    alphaCheck=1
    event_user(1)
    if alpha<1{
        other.found=true
    }
}
if found=true{
    show_message_async("Warning! There are some nodes that have problems!#This dialogue structure might not work like intended")
}



file=file_text_open_write(saveFile)
file_text_write_string(file,"[text]")
file_text_writeln(file)

//find the first one without an "in" connection point-- begin there
nn=-1
if global.pinNode!=-1
&& instance_exists(global.pinNode){nn=global.pinNode}

with(objConvo){
    saved=false
    if other.nn=-1{
        if pinNodeConvo!=-1
        && instance_exists(pinNodeConvo){
            other.nn=pinNodeConvo
        }
    }
}


with(objNode){  
    if other.nn=-1{
        var _d=true
        if (type!=0 && type!=2){_d=false}
        for(i=0;i<15;i++){
            if in[i]!=-1 || !instance_exists(in[i]){
                _d=false
            }
        }
        if _d=true{
            other.nn=id
            break
        }
        
    }
}

//Recongize loops
loop=false
if nn=-1{
    loop=true
    
    //start
    file_text_close(file)
    show_debug_message("loop? D:")
    show_message("There seems to be no clear start to this dialogue!")
    return 0;
    exit
}


//repeat until you get everything into the file!
while(nn!=-1){
    nn=-1
    
    //check for pins
    if global.pinNode!=-1
    && instance_exists(global.pinNode)
    && global.pinNode.saved=false{nn=global.pinNode}
    
    
    with(objConvo){
        if other.nn=-1 && saved=false{
            if pinNodeConvo!=-1
            && instance_exists(pinNodeConvo){
                saved=true
                other.nn=pinNodeConvo
            }
        }
    }

    
    //find the one without an "in" connection point-- begin there
    with(objNode){  
        if other.nn=-1 && saved=false{
            var _d=true
            if (type!=0 && type!=2){_d=false}
            for(i=0;i<15;i++){
                if in[i]!=-1 || !instance_exists(in[i]){
                    _d=false
                }
            }
            if _d=true{
                other.nn=id
            }
        }
    }
    
    if nn!=-1{
        nn.start=true
        scr_saveRec(nn,on0,on1)
        file_text_writeln(file)
    }
    on0=0
    on1++
    
}



//add the config- quest[questID,questON]=on0,on1
file_text_writeln(file)
file_text_write_string(file,"[config]")
file_text_writeln(file)
with(objConvo){
    nn=-1
    with(objNode){
        if convo=other.id && start=true{
            other.nn=id;
        }
    }
    if nn!=-1{
        file_text_write_string(other.file,"quest["+string(name)+","+string(name2)+
        "]="+string(nn.on0)+","+string(nn.on1))
        file_text_writeln(other.file)
    }
}


//add the default variables
file_text_writeln(file)
file_text_write_string(file,"[vars]")
file_text_writeln(file)
file_text_write_string(file,"vars="+ds_map_write(chatMap))
file_text_writeln(file)

file_text_writeln(file)
file_text_write_string(file,"[default]")
file_text_writeln(file)
file_text_write_string(file,"default="+ds_map_write(defaultMap))
file_text_writeln(file)


file_text_close(file)


//get rid of quotes and extra enters
queue = ds_queue_create();
file=file_text_open_read(saveFile)
while(!file_text_eof(file))
    {
    ds_queue_enqueue( queue, string_replace_all(file_text_read_string(file),chr(13),chr(35)));
    file_text_readln(file);
    }
file_text_close(file)

f = file_text_open_write(saveFile);
file_text_write_string(f, ds_queue_dequeue(queue))
var e=false;
 while(!ds_queue_empty(queue))
    {
    if e=false{
        file_text_writeln(f);
    }else{
        e=false
    }
    var s=string_replace_all(ds_queue_dequeue(queue),chr(13),chr(35));
    if string_char_at(s,string_pos("=",s)+1)='"'{
        s=string_delete(s,string_pos("=",s)+1,1)
    }
    if string_char_at(s,string_length(s))=='"'{
        s=string_delete(s,string_length(s),1)
    }
    if s!=""{
        file_text_write_string(f, s);
    }else{
        e=true
    }
    
    
    }
file_text_close(f);
ds_queue_destroy(queue)


//Jumping conversations!-- replace the convo/conv() commands
queue = ds_queue_create();
file=file_text_open_read(saveFile)
while(!file_text_eof(file))
    {
    ds_queue_enqueue( queue, string_replace_all(file_text_read_string(file),chr(13),chr(35)));
    file_text_readln(file);
    }
file_text_close(file)

f = file_text_open_write(saveFile);
while(!ds_queue_empty(queue)){
    
    var str=ds_queue_dequeue(queue);
    
    if string_count("convo(",str)>0 && string_count("|",str)>0{
        
        str2=scr_saveConvo(string_copy(str,string_pos("|",str),999))
        file_text_write_string(f,string_copy(str,1,string_pos("|",str)-1)+str2)
        file_text_writeln(f)
        
    }else if string_count("conv(",str)>0 && string_count("|",str)>0{
    
        str2=scr_saveConv(string_copy(str,string_pos("|",str),999))
        file_text_write_string(f,string_copy(str,1,string_pos("|",str)-1)+str2)
        file_text_writeln(f)
        
    }else{
        //just write the line
        file_text_write_string(f, str)
        file_text_writeln(f)
    }
}
file_text_close(f)




return 1;

