/// scr_chunkInternalSetBlock(chunk, q,c,layer, newData);
// do not call normally... ASSUMES you've called scr_chunkInternalClearBlock()
var chunk = argument0;
var xx = argument0.x;
var yy = argument0.y;
var qq = argument1;
var cc = argument2;
var lay = argument3;
var newData = argument4;


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
        if(newData != -1)
        {
            newData[? "x"] = xx+(qq*16);
            newData[? "y"] = yy+(cc*16);
            newData[? "z"] = lay*16;
            
            newData[? "DrawDepth"] = scr_DrawDepth( xx+(qq*16), yy+(cc*16), lay*16);
            newData[? "Exposed"] = -1; //auto refresh draw status
            
            layerData[# qq,cc] = newData;
        }
        else
        {
            layerData[# qq,cc] = -1;
        }
        return true;
    }
    else
    {
        event_user(1);
    }
}



