/// scr_ChunkUpdateCollision(chunk, q, c);
var chunk = argument0;
var QQ = argument1;
var CC = argument2;

enum colType
{
    empty,
    hasWall,
    hasFloor
}

if(scr_BlockRules(chunk.walls[# QQ,CC],"Solid"))
{
    chunk.collisionData[# QQ,CC] = colType.hasWall;
}
else
{
    if(scr_BlockRules(chunk.floors[# QQ,CC],"Solid") || scr_BlockRules(chunk.ground[# QQ,CC],"Solid"))
    {
        chunk.collisionData[# QQ,CC] = colType.hasFloor;
    }
    else
    {
        chunk.collisionData[# QQ,CC] = colType.empty;
    }
}

