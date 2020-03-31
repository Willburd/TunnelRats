/// scr_chunkInternalClearBlock(chunk, q,c,layer);
// do not call normally...
var chunk = argument0;
var qq = argument1;
var cc = argument2;
var lay = argument3;


var layerData = chunk.blockLayers[| lay];
while(true)
{
    if(lay >= ds_list_size(chunk.blockLayers) || is_undefined(layerData))
    {
        show_debug_message("Grid in chunk does not exist yet!");
        return false;
    }
    else if(layerData != -1)
    {
        if(layerData[# qq, cc] != -1)
        {
            ds_map_destroy(layerData[# qq, cc]); // clean out out block data
        }
        return true;
    }
    else
    {
        event_user(1);
    }
}
