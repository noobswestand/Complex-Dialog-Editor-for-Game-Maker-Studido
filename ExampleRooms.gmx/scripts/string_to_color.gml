///string_to_color(string)
var str;
str = argument0;

if string_count("$",str){
    
    return make_color_hex(str);
    
}else{
    
    switch (argument0){
        case "aqua":    case "c_aqua":    return c_aqua;
        case "black":   case "c_black":   return c_black;
        case "blue":    case "c_blue":    return c_blue;
        case "dkgray":  case "c_dkgray":  return c_dkgray;
        case "fuchsia": case "c_fuchsia": return c_fuchsia;
        case "gray":    case "c_gray":    return c_gray;
        case "green":   case "c_green":   return c_green;
        case "lime":    case "c_lime":    return c_lime;
        case "ltgray":  case "c_ltgray":  return c_ltgray;
        case "maroon":  case "c_maroon":  return c_maroon;
        case "navy":    case "c_navy":    return c_navy;
        case "olive":   case "c_olive":   return c_olive;
        case "orange":  case "c_orange":  return c_orange;
        case "purple":  case "c_purple":  return c_purple;
        case "red":     case "c_red":     return c_red;
        case "silver":  case "c_silver":  return c_silver;
        case "teal":    case "c_teal":    return c_teal;
        case "white":   case "c_white":   return c_white;
        case "yellow":  case "c_yellow":  return c_yellow;
        default:                          return c_black;
    }
}
