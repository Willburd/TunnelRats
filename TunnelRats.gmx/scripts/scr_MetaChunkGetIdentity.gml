/// scr_MetaChunkGetIdentity(x,y,layer);
var xx = argument0;
var yy = argument1;
var layer = argument2;

var xReg = floor((xx/(global.chunkWidth*global.metaChunkWidth))/global.tilePixelSize);
var yReg = floor((yy/(global.chunkHeight*global.metaChunkHeight))/global.tilePixelSize);

return string(layer) + "." + string(xReg) + "," + string(yReg); 
