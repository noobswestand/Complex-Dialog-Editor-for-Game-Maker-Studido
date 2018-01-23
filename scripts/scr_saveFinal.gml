///scr_saveFinal()
/*
    Does the final pass through + makes sure everything is in order
*/

/*
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
    
    if string_count("op0[",str)>0 && string_count("op1[",pstr)>0{
        
        
        file_text_writeln(f)
    }else{
        //just write the line
        file_text_write_string(f, str)
        file_text_writeln(f)
    }
    pstr=str
    
}

file_text_close(f)

*/
