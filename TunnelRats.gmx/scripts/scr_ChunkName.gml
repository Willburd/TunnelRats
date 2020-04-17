/// scr_ChunkName(chunk);
var chunk = argument0;
return string(chunk.worldController.LoadedLayer) + "." + string(floor((chunk.x/global.chunkWidth)/global.tilePixelSize)) + "," + string(floor((chunk.y/global.chunkHeight)/global.tilePixelSize)) 
