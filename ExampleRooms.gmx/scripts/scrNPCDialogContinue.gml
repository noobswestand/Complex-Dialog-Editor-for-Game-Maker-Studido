///scrNPCDialogContinue()


///////////////////////COMMANDS///////////////////////
if string_count("|",line[on0,on1])>0{
    scr_npcDialogCommands(string_copy(line[on0,on1],string_pos("|",line[on0,on1]),9999))
}
on0++

//Check for the ending of the dialog
if line[on0,on1]=""{
    on0--
    showText2=false
}
//Get the next line
var str=line[on0,on1];


//Reset text effects
textSpeed=1
textWaveA=0
textWaveF=0
textWaveO=0
textShakeX=0
textShakeY=0
textShake=0
textHSV=0 
textHSV1=0 
