/// scr_ChunkForceSpawn(worldController, x,y)
// force spawn a new chunk!
var spawnX = (floor(argument1 / (global.chunkWidth  * global.tilePixelSize))) * (global.chunkWidth  * global.tilePixelSize);
var spawnY = (floor(argument2 / (global.chunkHeight * global.tilePixelSize))) * (global.chunkHeight * global.tilePixelSize);
var newChunk = scr_ChunkSpawn(argument0,spawnX,spawnY);
with newChunk event_user(1);
return newChunk;
