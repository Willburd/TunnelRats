/// scr_BlockGetTileset(blockData)
// returns the background texture that will be cutup and used as tiles
// will probably only be called by scr_BlockDataToTile()

// hardcoded base:air data
if(argument0[? "DataName"] == "Base" && argument0[? "Name"] == "Air")
{
    return -1;
}

// lets get to this proper....
var texName = argument0[? "DataName"] + ":" + argument0[? "Name"] + "_" + string(argument0[? "TextureSelect"]);
if(is_undefined(global.TextureLibrary[? texName]))
{
    return bg_testBlock;
}
return global.TextureLibrary[? texName];
