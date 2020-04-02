/// scr_BlockDataToFloorTile( blockData, chunk, q, c)
// returns a tileID, sized, and placed automatically 
var newBlock = argument0;
var chunk = argument1;
var QQ = argument2;
var CC = argument3;

var xx = newBlock[? "x"];
var yy = newBlock[? "y"];

var texture = scr_BlockGetTileset(newBlock); // get texture to cut up for tile data!

var packedTiles = ds_list_create();
ds_list_add(packedTiles,tile_add(texture,0,6,16,16,xx,yy,-(yy+1)));

// cardinals
var BlockNorth = scr_ChunkGetBlock(chunk, xx, yy-16, BlockGridType.walls);
var BlockSouth = scr_ChunkGetBlock(chunk, xx, yy+16, BlockGridType.walls);
var BlockEast = scr_ChunkGetBlock(chunk, xx+16, yy, BlockGridType.walls);
var BlockWest = scr_ChunkGetBlock(chunk, xx-16, yy, BlockGridType.walls);
var blockedNorth = !( BlockNorth == -1 || scr_BlockRules(BlockNorth,"Transparent")  );
var blockedSouth = !( BlockSouth == -1 || scr_BlockRules(BlockSouth,"Transparent")  );
var blockedEast = !( BlockEast == -1 || scr_BlockRules(BlockEast,"Transparent")  );
var blockedWest = !( BlockWest == -1 || scr_BlockRules(BlockWest,"Transparent")  );


// special corners
var BlockNorthWest = scr_ChunkGetBlock(chunk, xx-16, yy-16, BlockGridType.walls);
var BlockNorthEast = scr_ChunkGetBlock(chunk, xx+16, yy-16, BlockGridType.walls);
var BlockSouthWest = scr_ChunkGetBlock(chunk, xx-16, yy+16, BlockGridType.walls);
var BlockSouthEast = scr_ChunkGetBlock(chunk, xx+16, yy+16, BlockGridType.walls);

var blockedNorthWest = !( BlockNorthWest == -1 || scr_BlockRules(BlockNorthWest,"Transparent")  );
var blockedNorthEast = !( BlockNorthEast == -1 || scr_BlockRules(BlockNorthEast,"Transparent")  );
var blockedSouthWest = !( BlockSouthWest == -1 || scr_BlockRules(BlockSouthWest,"Transparent")  );
var blockedSouthEast = !( BlockSouthEast == -1 || scr_BlockRules(BlockSouthEast,"Transparent")  );

if(!blockedSouth)
{
    ds_list_add(packedTiles,tile_add(texture,1,6,16,16,xx,yy-16,-(yy+1)));
}

if(!blockedNorth)
{
    ds_list_add(packedTiles,tile_add(texture,2,6,16,16,xx,yy+16,-(yy+1)));
}

if(!blockedWest)
{
    ds_list_add(packedTiles,tile_add(texture,3,6,16,16,xx,yy+16,-(yy+1)));
}

if(!blockedEast)
{
    ds_list_add(packedTiles,tile_add(texture,4,6,16,16,xx,yy+16,-(yy+1)));
}

if(!blockedSouthWest)
{
    ds_list_add(packedTiles,tile_add(texture,5,6,16,16,xx,yy+16,-(yy+1)));
}

if(!blockedSouthEast)
{
    ds_list_add(packedTiles,tile_add(texture,5,7,16,16,xx,yy+16,-(yy+1)));
}

if(!blockedNorthWest)
{
    ds_list_add(packedTiles,tile_add(texture,6,8,16,16,xx,yy+16,-(yy+1)));
}

if(!blockedNorthEast)
{
    ds_list_add(packedTiles,tile_add(texture,7,9,16,16,xx,yy+16,-(yy+1)));
}

return packedTiles;
