/// scr_EntityGetSprite(blockData)
// returns the background texture that will be cutup and used as tiles
// will probably only be called by scr_BlockDataToTile()

// hardcoded base:air data
if(argument0[? "DataName"] == "None" && argument0[? "Name"] == "Air")
{
    return -1;
}


var libName = argument0[? "DataName"];
var getLib = global.EntityLibrary[? libName];
if(!is_undefined(getLib) && ds_exists(getLib,ds_type_map))
{
    var findEntity = getLib[? argument0[? "Name"]];
    var textureList = findEntity[? "Textures"];
    if(is_undefined(textureList))
    {
        return spr_colMaskEntityCheck;
    }
    
    // lets get to this proper....
    var texSelect = argument0[? "TextureSelect"];
    if(is_undefined(texSelect)) texSelect = 0;
    
    var texName = "Entities:" + argument0[? "DataName"] + ":" + string(textureList[| texSelect]);
    if(is_undefined(global.TextureLibrary[? texName]))
    {
        return spr_colMaskEntityCheck;
    }
    return global.TextureLibrary[? texName];
}
else
{
    return spr_colMaskEntityCheck;
}    



