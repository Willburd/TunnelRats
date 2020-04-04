/// scr_LayerGetBiomes(LayerNumber)
var returnListOfBiomes = ds_list_create();

var copyOfBiomeLib = ds_priority_create();
ds_priority_copy(copyOfBiomeLib,global.BiomeLibrary)

while (ds_priority_size(copyOfBiomeLib))
{
    var checkBiome = ds_priority_delete_min(copyOfBiomeLib);
    
    var biomeLayerBounds = checkBiome[? "LayerBounds"];
    if(argument0 >= biomeLayerBounds[| 0] && argument0 <= biomeLayerBounds[| 1])
    {
        // appears on this layer!
        ds_list_add(returnListOfBiomes, checkBiome);
    }
}
ds_priority_destroy(copyOfBiomeLib);

return returnListOfBiomes;
