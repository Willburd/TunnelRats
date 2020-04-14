/// scr_BlockDataToFloorTile( blockData, chunk, q, c)
// returns a tileID, sized, and placed automatically 
var newBlock = argument0;
var chunk = argument1;
var QQ = argument2;
var CC = argument3;

var xx = newBlock[? "x"];
var yy = newBlock[? "y"];

var depthOffset = -17;

var packedTiles = ds_list_create();
var texture = scr_BlockGetTileset(newBlock); // get texture to cut up for tile data!
if(texture == -1)
{
    // no texture
    return packedTiles;
}

// core floor tile
ds_list_add(packedTiles, scr_ExtractTile(texture,0,6,xx,yy,-(yy+depthOffset)));

// cardinals
var BlockNorth = scr_ChunkGetBlock(chunk, xx, yy-16, BlockGridType.floors);
var BlockSouth = scr_ChunkGetBlock(chunk, xx, yy+16, BlockGridType.floors);
var BlockEast = scr_ChunkGetBlock(chunk, xx+16, yy, BlockGridType.floors);
var BlockWest = scr_ChunkGetBlock(chunk, xx-16, yy, BlockGridType.floors);
var blockedNorth = !( BlockNorth == -1 || scr_BlockCheckRule(BlockNorth,"Transparent")  );
var blockedSouth = !( BlockSouth == -1 || scr_BlockCheckRule(BlockSouth,"Transparent")  );
var blockedEast = !( BlockEast == -1 || scr_BlockCheckRule(BlockEast,"Transparent")  );
var blockedWest = !( BlockWest == -1 || scr_BlockCheckRule(BlockWest,"Transparent")  );

// special corners
var BlockNorthWest = scr_ChunkGetBlock(chunk, xx-16, yy-16, BlockGridType.floors);
var BlockNorthEast = scr_ChunkGetBlock(chunk, xx+16, yy-16, BlockGridType.floors);
var BlockSouthWest = scr_ChunkGetBlock(chunk, xx-16, yy+16, BlockGridType.floors);
var BlockSouthEast = scr_ChunkGetBlock(chunk, xx+16, yy+16, BlockGridType.floors);

var blockedNorthWest = !( BlockNorthWest == -1 || scr_BlockCheckRule(BlockNorthWest,"Transparent")  );
var blockedNorthEast = !( BlockNorthEast == -1 || scr_BlockCheckRule(BlockNorthEast,"Transparent")  );
var blockedSouthWest = !( BlockSouthWest == -1 || scr_BlockCheckRule(BlockSouthWest,"Transparent")  );
var blockedSouthEast = !( BlockSouthEast == -1 || scr_BlockCheckRule(BlockSouthEast,"Transparent")  );

if(!blockedSouth)
{
    ds_list_add(packedTiles, scr_ExtractTile(texture,1,6,xx,yy+16,-(yy+depthOffset)));
}

if(!blockedNorth)
{
    ds_list_add(packedTiles, scr_ExtractTile(texture,2,6,xx,yy-16,-(yy+depthOffset)));
}

if(!blockedWest)
{
    ds_list_add(packedTiles, scr_ExtractTile(texture,3,6,xx-16,yy,-(yy+depthOffset)));
}

if(!blockedEast)
{
    ds_list_add(packedTiles, scr_ExtractTile(texture,4,6,xx+16,yy,-(yy+depthOffset)));
}

if(!blockedSouthWest)
{
    ds_list_add(packedTiles, scr_ExtractTile(texture,5,6,xx-16,yy+16,-(yy+depthOffset)));
}

if(!blockedSouthEast)
{
    ds_list_add(packedTiles, scr_ExtractTile(texture,6,6,xx+16,yy+16,-(yy+depthOffset)));
}

if(!blockedNorthWest)
{
    ds_list_add(packedTiles, scr_ExtractTile(texture,7,6,xx-16,yy-16,-(yy+depthOffset)));
}

if(!blockedNorthEast)
{
    ds_list_add(packedTiles, scr_ExtractTile(texture,8,6,xx+16,yy-16,-(yy+depthOffset)));
}

return packedTiles;
