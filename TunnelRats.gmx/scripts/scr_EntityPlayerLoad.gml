/// scr_EntityPlayerLoad(identityName);
var loadDir = working_directory + "/Worlds/" + string(global.worldData[? "name"]) + "/Players/" + string(argument0) + ".dat";
var loadFile = file_text_open_read(loadDir);
    var readString = file_text_read_string( loadFile);
    var playerDat = json_decode(readString);
file_text_close(loadFile);

if(is_undefined(playerDat))
{
    playerDat = -1;
}

return playerDat;
