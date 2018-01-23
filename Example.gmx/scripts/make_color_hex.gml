///make_color_hex("$RRGGBB");

/*
Credits: ThinkBoxly : https://marketplace.yoyogames.com/publishers/603/thinkboxly
Returns RGB color from Hex color code

argument0 = hex color (string)

Example usage: color = make_color_hex("$0066FF");

Note that this script attempts to be foolproof in some ways. Including a # at the beginning 
of the hex code is optional, and if any unacceptable input is made, the script will return 
c_white or nearest usable value as the output color to avoid crashing the game
*/

//Error prevention - in the event of mal-formed input, return c_white and exit the script
if is_real(argument0) { //Ensure input is a string
   return c_white;
}

//Create the needed temporary variables
var r1, r2, g1, g2, b1, b2, r, g, b, format;

//Check to see if a # was used and adapt to the given format
if string_char_at(argument0, 1) == "$" {
   format = 0;
} else {
   format = 1;
}

//Parse the given hex code into separate 16-bit channels, with two characters per channel for a total of 32 bits
r1 = string_char_at(argument0, 2 - format);
r2 = string_char_at(argument0, 3 - format);
g1 = string_char_at(argument0, 4 - format);
g2 = string_char_at(argument0, 5 - format);
b1 = string_char_at(argument0, 6 - format);
b2 = string_char_at(argument0, 7 - format);

//Convert the parsed hex strings into real numbers
switch(r1) {
   case "0": r1 = 0; break;
   case "1": r1 = 1; break;
   case "2": r1 = 2; break;
   case "3": r1 = 3; break;
   case "4": r1 = 4; break;
   case "5": r1 = 5; break;
   case "6": r1 = 6; break;
   case "7": r1 = 7; break;
   case "8": r1 = 8; break;
   case "9": r1 = 9; break;
   case "A": r1 = 10; break;
   case "B": r1 = 11; break;
   case "C": r1 = 12; break;
   case "D": r1 = 13; break;
   case "E": r1 = 14; break;
   case "F": r1 = 15; break;
   default: r1 = 15; //Error prevention
}

switch(r2) {
   case "0": r2 = 0; break;
   case "1": r2 = 1; break;
   case "2": r2 = 2; break;
   case "3": r2 = 3; break;
   case "4": r2 = 4; break;
   case "5": r2 = 5; break;
   case "6": r2 = 6; break;
   case "7": r2 = 7; break;
   case "8": r2 = 8; break;
   case "9": r2 = 9; break;
   case "A": r2 = 10; break;
   case "B": r2 = 11; break;
   case "C": r2 = 12; break;
   case "D": r2 = 13; break;
   case "E": r2 = 14; break;
   case "F": r2 = 15; break;
   default: r2 = 15; //Error prevention
}

switch(g1) {
   case "0": g1 = 0; break;
   case "1": g1 = 1; break;
   case "2": g1 = 2; break;
   case "3": g1 = 3; break;
   case "4": g1 = 4; break;
   case "5": g1 = 5; break;
   case "6": g1 = 6; break;
   case "7": g1 = 7; break;
   case "8": g1 = 8; break;
   case "9": g1 = 9; break;
   case "A": g1 = 10; break;
   case "B": g1 = 11; break;
   case "C": g1 = 12; break;
   case "D": g1 = 13; break;
   case "E": g1 = 14; break;
   case "F": g1 = 15; break;
   default: g1 = 15; //Error prevention
}

switch(g2) {
   case "0": g2 = 0; break;
   case "1": g2 = 1; break;
   case "2": g2 = 2; break;
   case "3": g2 = 3; break;
   case "4": g2 = 4; break;
   case "5": g2 = 5; break;
   case "6": g2 = 6; break;
   case "7": g2 = 7; break;
   case "8": g2 = 8; break;
   case "9": g2 = 9; break;
   case "A": g2 = 10; break;
   case "B": g2 = 11; break;
   case "C": g2 = 12; break;
   case "D": g2 = 13; break;
   case "E": g2 = 14; break;
   case "F": g2 = 15; break;
   default: g2 = 15; //Error prevention
}

switch(b1) {
   case "0": b1 = 0; break;
   case "1": b1 = 1; break;
   case "2": b1 = 2; break;
   case "3": b1 = 3; break;
   case "4": b1 = 4; break;
   case "5": b1 = 5; break;
   case "6": b1 = 6; break;
   case "7": b1 = 7; break;
   case "8": b1 = 8; break;
   case "9": b1 = 9; break;
   case "A": b1 = 10; break;
   case "B": b1 = 11; break;
   case "C": b1 = 12; break;
   case "D": b1 = 13; break;
   case "E": b1 = 14; break;
   case "F": b1 = 15; break;
   default: b1 = 15; //Error prevention
}

switch(b2) {
   case "0": b2 = 0; break;
   case "1": b2 = 1; break;
   case "2": b2 = 2; break;
   case "3": b2 = 3; break;
   case "4": b2 = 4; break;
   case "5": b2 = 5; break;
   case "6": b2 = 6; break;
   case "7": b2 = 7; break;
   case "8": b2 = 8; break;
   case "9": b2 = 9; break;
   case "A": b2 = 10; break;
   case "B": b2 = 11; break;
   case "C": b2 = 12; break;
   case "D": b2 = 13; break;
   case "E": b2 = 14; break;
   case "F": b2 = 15; break;
   default: b2 = 15; //Error prevention
}

//Calculate RGB values from hex
r = ((r1 * 16) + r2);
g = ((g1 * 16) + g2);
b = ((b1 * 16) + b2);

//Return the color
return make_color_rgb(r,g,b);

