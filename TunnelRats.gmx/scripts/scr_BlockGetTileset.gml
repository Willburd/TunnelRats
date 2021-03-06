/// scr_BlockGetTileset(blockData)
// returns the background texture that will be cutup and used as tiles
// will probably only be called by scr_BlockDataToTile()

// hardcoded base:air data
if(argument0[? "DataName"] == "None" && argument0[? "Name"] == "Air")
{
    return -1;
}

var libName = argument0[? "DataName"];
var getLib = global.BlockLibrary[? libName];
if(!is_undefined(getLib) && ds_exists(getLib,ds_type_map))
{
    var findBlock = getLib[? argument0[? "Name"]];
    var textureList = findBlock[? "Textures"];
    
    // lets get to this proper....
    var texName = "Blocks:" + argument0[? "DataName"] + ":" + string( textureList[| argument0[? "TextureSelect"]]);
    if(is_undefined(global.TextureLibrary[? texName]))
    {
        return bg_testBlock;
    }
    return global.TextureLibrary[? texName];
}
else
{
    return bg_testBlock;
}    



