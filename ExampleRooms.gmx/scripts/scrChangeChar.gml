///scrChangeChar(name)
//change the char that is talking


//search for the NPC with the name
found=-1;
with(parNPC){
    if namePERM=string_replace_all(argument[0],"'",""){
        other.found=id
    }
}

//if it can't find any, just change to the player SPR
if found=-1{
    dialougeSprite=sprNPCFred
    name="Player"
}else{
    //change to the NPC's image
    dialougeSprite=found.dialougeSpritePERM
    name=found.namePERM
}
