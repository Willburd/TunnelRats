/// scr_BlockDataToTile( blockData, layerGrid, layerNumber)
// returns a tileID, sized, and placed automatically 

var newBlock = argument0;
var gridLayerData = argument1;
var currentLayer = argument2;

var exposure = newBlock[? "Exposed"];
var xx = newBlock[? "x"];
var yy = newBlock[? "y"];
var zz = newBlock[? "z"];
var drawDepth = newBlock[? "DrawDepth"]


