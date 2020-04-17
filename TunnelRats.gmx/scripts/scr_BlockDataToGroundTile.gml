/// scr_BlockDataToGroundTile( blockData, chunk, q, c)
// returns a tileID, sized, and placed automatically 
var newBlock = argument0;
var chunk = argument1;
var QQ = argument2;
var CC = argument3;

var xx = newBlock[? "x"];
var yy = newBlock[? "y"];

var depthOffset = -34;

var packedTiles = ds_list_create();
var texture = scr_BlockGetTileset(newBlock); // get texture to cut up for tile data!
if(texture == -1)
{
    // no texture
    return packedTiles;
}


ds_list_add(packedTiles,scr_ExtractTile(texture,0,0,xx,yy,-(yy+depthOffset)));

var BlockSouth = scr_ChunkGetBlock(chunk, xx, yy+global.tilePixelSize, BlockGridType.ground);
if( BlockSouth == -1 || scr_BlockCheckRule(BlockSouth,"Transparent")  )
{
     ds_list_add(packedTiles,scr_ExtractTile(texture,0,4,xx,yy-global.tilePixelSize,-(yy+depthOffset)));
}

return packedTiles;
