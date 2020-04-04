/// scr_BlockTriggerUpdate(chunk,xx,yy,wall/ground/floor selector,neightboursToo?)
var chunk = argument0;
var xx = argument1;
var yy = argument2;
var selector = argument3; // wall/ground/floor
var neighbours = argument4;

chunk.updateTimer = 0;
var blockData = scr_ChunkGetBlock(chunk,xx,yy,selector);
if(blockData != -1) blockData[? "NeedUpdate"] = true;

if(neighbours)
{
    scr_BlockTriggerUpdate(chunk,xx-16,yy,selector,false);
    scr_BlockTriggerUpdate(chunk,xx+16,yy,selector,false);
    scr_BlockTriggerUpdate(chunk,xx,yy-16,selector,false);
    scr_BlockTriggerUpdate(chunk,xx,yy+16,selector,false);
}
