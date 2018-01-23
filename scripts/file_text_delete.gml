///file_text_delete(file,pos)
/*
 * Insert a string or real value into a text file 
 * using GM's own 'file_text_*' functions.
 *
 * [String]         Argument0 - fname
 * [Real]           Argument1 - line position to insert the value
 *
 * [Example]        file_text_insert( 'example.txt', 6, 'Example String');
 *
 * Returns a negative number is an error occured.
 */
 
 if !(is_string(argument0)) return -1;
 if !(is_real(argument1)) return -1;
 
var f, file, value, pos, queue, _abc;

file = argument0;
pos = argument1;
queue = ds_queue_create();
_abc = 0;

if !(file_exists(file)) return -1;

f = file_text_open_read(file);
fileLineCount=0
 while(!file_text_eof(f))
    {
    ds_queue_enqueue( queue, file_text_read_string(f));
    
    file_text_readln(f);
    fileLineCount++
    }
file_text_close(f);

file_delete(file)


f = file_text_open_write(file);
file_text_write_string(f, ds_queue_dequeue(queue)) _abc=1
 while(!ds_queue_empty(queue))
    {
    if (_abc=pos){
        ds_queue_dequeue(queue)
    }else{
        file_text_writeln(f);
        var _s=ds_queue_dequeue(queue);
        file_text_write_string(f, _s);
    }
    
    _abc += 1;
    }
file_text_close(f);
ds_queue_clear(queue)
ds_queue_destroy(queue)
fileLineCount--
return 1;
