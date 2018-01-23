///scrNPCDialogContinue()


///////////////////////COMMANDS///////////////////////
if string_count("|",line[on0,on1])>0{
    scr_npcDialogCommands(string_copy(line[on0,on1],string_pos("|",line[on0,on1]),9999))
}
on0++


//Check for the ending of the dialog
if line[on0,on1]=""{
    //on0--
    on0=max(on0--,0)
    showText2=false
}

//Get the next line
var str=line[on0,on1];

