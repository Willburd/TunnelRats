/// scr_EntityMoveWithCollisions(xV,yV,startChunk);
var lastX = x;
var lastY = y;

// x movements
x += argument0;
y += argument1;

var failedFirstX = false;
var findColChunk = scr_ChunkGet(argument2,x,y)
var getQ = floor((x - findColChunk.x)/16);
var getC = floor((y - findColChunk.y)/16);
if(findColChunk.collisionData[# getQ,getC] == colType.hasWall)
{
    x = lastX; 
    failedFirstX = true;     
}

var findColChunk = scr_ChunkGet(argument2,x,y)
var getQ = floor((x - findColChunk.x)/16);
var getC = floor((y - findColChunk.y)/16);
if(findColChunk.collisionData[# getQ,getC] == colType.hasWall)
{
    y = lastY;      
}

if(failedFirstX)
{
    // recheck X for wall slide!
    x += argument0;
    var findColChunk = scr_ChunkGet(argument2,x,y)
    var getQ = floor((x - findColChunk.x)/16);
    var getC = floor((y - findColChunk.y)/16);
    if(findColChunk.collisionData[# getQ,getC] == colType.hasWall)
    {
        x = lastX; 
    }
}
