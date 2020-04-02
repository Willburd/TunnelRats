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
ds_list_add(packedTiles,tile_add(texture,0,0,16,16,xx,yy,-yy));

return packedTiles;
