/// scr_ChunkName(chunk);
var chunk = argument0;
return string(chunk.worldController.LoadedLayer) + "." + string(floor((chunk.x/global.chunkWidth)/16)) + "," + string(floor((chunk.y/global.chunkHeight)/16)) 
