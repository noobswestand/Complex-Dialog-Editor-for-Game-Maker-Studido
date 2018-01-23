///scrNPCChooseOption(i)

//If options do not exist, STOP
if !ds_exists(op0[on0,on1],ds_type_list){exit}

//Get op1, which is which line to jump to
var op=argument[0];
var str=ds_list_find_value(op1[on0,on1],op);
if is_undefined(str){exit}

//Disassemble the string in the form of:   0,4|:
var _on0,_on1;
_on0=string_copy(str,0,string_pos(",",str)-1)
_on1=string_copy(str,string_pos(",",str)+1,string_pos("|",str)-1) str=string_delete(str,1,string_pos("|",str))
on0=real(_on0)
on1=real(_on1)

///////////////////////COMMANDS///////////////////////
scr_npcDialogCommands(str)


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
