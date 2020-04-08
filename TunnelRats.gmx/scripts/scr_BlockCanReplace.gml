/// scr_BlockCanReplace( chunk, x, y, wall/ground/floor selector)
var chunk = argument0;
var xx = argument1;
var yy = argument2;
var selector = argument3; // wall/ground/floor

if(selector == BlockGridType.walls)
{
    var blockData = scr_ChunkGetBlock(chunk, xx, yy, selector);

    if(blockData == -1) return true;
    return scr_BlockRules( blockData, "AllowWallReplacement");
}
else if(selector == BlockGridType.floors)
{
    var blockData = scr_ChunkGetBlock(chunk, xx, yy, selector);
    
    if(blockData == -1) return true;
    return scr_BlockRules( blockData, "AllowFloorReplacement");
}
else
{
    // cannot edit ground level
    return false;
}
