///scr_savePointer(nn0,nn1)

//nn0=text box to attach the pointer to
//nn1=location of the pointer

if argument[0].on0=-1
|| argument[0].on1=-1{
    return 0;
}
//file_text_writeln(file)
//file_text_write_string(file,"aaa")
file_text_close(file)

file=file_text_open_read(saveFile)
var _c=-1;
var _s="";
while(string_count("text["+string(argument[0].on0)+","+string(argument[0].on1)+"]=",_s)<=0){
    _s=file_text_read_string(file)
    file_text_readln(file)
    _c++
    if file_text_eof(file){
        break;
    }
}
file_text_close(file)

if string_char_at(_s,string_length(_s))='"'{
    _s=string_delete(_s,string_length(_s),1)
}
if string_char_at(_s,string_length(_s))=="|"{
    _s=string_delete(_s,string_length(_s),1)
}

if _c!=-1{
    file_text_insert(saveFile,_c,_s+"|line("+string(argument[1].on0)+","+string(argument[1].on1)+")|")
    file_text_delete(saveFile,_c+1)
}


/*
ini_open(saveFile)

var s=ini_read_string("text","text["+string(argument[0].on0)+","+string(argument[0].on1)+"]","");

//fix GM loading  .-.
s=string_replace_all(s,chr(13),chr(35))

//show_message(s)
//show_message("text["+string(argument[0].on0)+","+string(argument[0].on1)+"]")

if string_char_at(s,string_length(s))=="|"{
    s=string_delete(s,string_length(s),1)
}

ini_write_string("text","text["+string(argument[0].on0)+","+string(argument[0].on1)+"]",
s+"|line("+string(argument[1].on0)+","+string(argument[1].on1)+")|")

ini_close()
*/

file=file_text_open_append(saveFile)
return 1;
