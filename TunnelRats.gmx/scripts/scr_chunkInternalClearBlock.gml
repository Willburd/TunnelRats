/// scr_ChunkInternalClearBlock(chunk, q,c, wall/ground/floor selector)
// do not call normally... This is an internal function used in scr_ChunkGetBlock() and scr_ChunkSetBlock()
var chunk = argument0;
var QQ = argument1;
var CC = argument2;
var selector = argument3; // wall/ground/floor

if(selector == BlockGridType.walls)
{
    if(chunk.walls[# QQ, CC] != -1)
    {
        if(chunk.puppetWalls[# QQ, CC] != -1)
        {
            var getPackIn = chunk.puppetWalls[# QQ, CC];
            while(ds_list_size(getPackIn) > 0)
            {
                tile_delete( getPackIn[| 0]);
                ds_list_delete(getPackIn,0);
            }
            chunk.puppetWalls[# QQ, CC] = -1;
        }
        
        ds_map_destroy(chunk.walls[# QQ, CC]); // clean out out block data
    }
}
else if(selector == BlockGridType.ground)
{
    if(chunk.ground[# QQ, CC] != -1)
    {
        if(chunk.puppetGround[# QQ, CC] != -1)
        {
            var getPackIn = chunk.puppetGround[# QQ, CC]
            while(ds_list_size(getPackIn) > 0)
            {
                tile_delete( getPackIn[| 0]);
                ds_list_delete(getPackIn,0);
            }
            chunk.puppetGround[# QQ, CC] = -1;
        }
        
        ds_map_destroy(chunk.ground[# QQ, CC]); // clean out out block data
    }
}
else if(selector == BlockGridType.floors)
{
    if(chunk.floors[# QQ, CC] != -1)
    {
        if(chunk.puppetFloors[# QQ, CC] != -1)
        {
            var getPackIn = chunk.puppetFloors[# QQ, CC]
            while(ds_list_size(getPackIn) > 0)
            {
                tile_delete( getPackIn[| 0]);
                ds_list_delete(getPackIn,0);
            }
            chunk.puppetFloors[# QQ, CC] = -1;
        }
        
        ds_map_destroy(chunk.floors[# QQ, CC]); // clean out out block data
    }
}

