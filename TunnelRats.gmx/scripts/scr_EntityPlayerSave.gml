/// scr_EntityPlayerSave(playerIdentity);
var playerDat = json_encode(argument0);

var saveDir = working_directory + "/Worlds/" + string(global.worldData[? "name"]) + "/Players/" + string(argument0[? "ProfileName"]) + ".dat";
var saveFile = file_text_open_write(saveDir);
    file_text_write_string( saveFile, playerDat);
file_text_close(saveFile);
