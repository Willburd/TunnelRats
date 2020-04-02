/// scr_BlockDataToWallTile( blockData, layerGrid, chunk)
// returns a tileID, sized, and placed automatically 
var newBlock = argument0;
var gridLayerData = argument1;
var currentLayer = argument2;
var chunk = argument3;

var xx = newBlock[? "x"];
var yy = newBlock[? "y"];
var zz = newBlock[? "z"];

var texture = scr_BlockGetTileset(newBlock); // get texture to cut up for tile data!

var tileData = tile_add(texture,0,0,16,16,xx,yy,-yy);

return tileData;
