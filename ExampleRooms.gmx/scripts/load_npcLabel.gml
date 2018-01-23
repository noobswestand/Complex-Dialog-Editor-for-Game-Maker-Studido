///load_npcLabel(string,on0,on1)
/*
    Takes in a string: |scr_showmsg()|label(start)|goto(end)|if statement(){statement()}|...|
    Parses out the "label" tags, and puts them in a list for later "goto" tags
    
*/
var str=argument[0];
var _on0,_on1;
_on0=argument[1]
_on1=argument[2]

while(str!=""){
    if string_count("|",str)=0{break}
    var str2=string_copy(str,0,string_pos("|",str)-1);
    
    
    if string_count("label(",str2){
        str2=string_delete(str2,1,string_length("label("))
        
        lbl[lblAmount]=string_copy(str2,1,string_pos(")",str2)-1)
        lblText0[lblAmount]=_on0
        lblText1[lblAmount]=_on1
        
        //show_message(lbl[lblAmount]+"  "+string(_on0)+","+string(_on1))
        
        lblAmount++
    }
    
    str=string_delete(str,1,string_pos("|",str))
}
