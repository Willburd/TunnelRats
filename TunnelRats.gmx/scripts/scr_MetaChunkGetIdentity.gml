/// scr_MetaChunkGetIdentity(x,y,layer);
var xx = argument0;
var yy = argument1;
var layer = argument2;

var xReg = floor((xx/(global.chunkWidth*global.metaChunkWidth))/16);
var yReg = floor((yy/(global.chunkHeight*global.metaChunkHeight))/16);

return string(layer) + "." + string(xReg) + "," + string(yReg); 
