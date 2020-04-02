/// scr_ChunkForceSpawn(worldController, x,y)
// force spawn a new chunk!
var spawnX = (floor(argument1 / (global.chunkWidth  * 16))) * (global.chunkWidth  * 16);
var spawnY = (floor(argument2 / (global.chunkHeight * 16))) * (global.chunkHeight * 16);
return scr_ChunkSpawn(argument0,spawnX,spawnY);
