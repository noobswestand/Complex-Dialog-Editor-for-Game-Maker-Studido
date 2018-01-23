///file_text_insert(_file,pos,str)
/*
 * Insert a string or real value into a text _file 
 * using GM's own 'file_text_*' functions.
 *
 * [String]         Argument0 - fname
 * [Real]           Argument1 - line position to insert the value
 * [String/Real]    Argument2 - the string/real value to insert.
 *
 * [Example]        file_text_insert( 'example.txt', 6, 'Example String');
 *
 * Returns a negative number is an error occured.
 */
 
 if !(is_string(argument0)) return -1;
 if !(is_real(argument1)) return -1;

 
var f, _file, value, pos, queue, ___i;

_file = argument0;
value = string(argument2);
pos = argument1;
queue = ds_queue_create();
___i = 0;

if !(file_exists(_file)) return -1;

f = file_text_open_read(_file);
 while(!file_text_eof(f))
    {
    ds_queue_enqueue( queue, file_text_read_string(f));
    file_text_readln(f);
    }
file_text_close(f);
var wrote=false;
f = file_text_open_write(_file);
file_text_write_string(f, string(ds_queue_dequeue(queue))) ___i=1
 while(!ds_queue_empty(queue))
    {
    file_text_writeln(f);
    if (___i == pos){
        file_text_write_string(f, string(value));
        wrote=true
    }else{
        file_text_write_string(f, string(ds_queue_dequeue(queue)));
    }
    ___i += 1;
    }
if wrote=false{
    file_text_writeln(f);
    file_text_write_string(f, value);
    //show_message("FAILED")
}
    

file_text_close(f);

ds_queue_destroy(queue)

return 1;
