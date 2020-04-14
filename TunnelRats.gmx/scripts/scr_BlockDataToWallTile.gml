/// scr_BlockDataToWallTile( blockData, chunk, q, c)
// returns a tileID, sized, and placed automatically 
var newBlock = argument0;
var chunk = argument1;
var QQ = argument2;
var CC = argument3;

var xx = newBlock[? "x"];
var yy = newBlock[? "y"];

var packedTiles = ds_list_create();
var texture = scr_BlockGetTileset(newBlock); // get texture to cut up for tile data!
if(texture == -1)
{
    // no texture
    return packedTiles;
}

// cardinals
var BlockNorth = scr_ChunkGetBlock(chunk, xx, yy-16, BlockGridType.walls);
var BlockSouth = scr_ChunkGetBlock(chunk, xx, yy+16, BlockGridType.walls);
var BlockEast = scr_ChunkGetBlock(chunk, xx+16, yy, BlockGridType.walls);
var BlockWest = scr_ChunkGetBlock(chunk, xx-16, yy, BlockGridType.walls);
var blockedNorth = !( BlockNorth == -1 || scr_BlockCheckRule(BlockNorth,"Transparent")  );
var blockedSouth = !( BlockSouth == -1 || scr_BlockCheckRule(BlockSouth,"Transparent")  );
var blockedEast = !( BlockEast == -1 || scr_BlockCheckRule(BlockEast,"Transparent")  );
var blockedWest = !( BlockWest == -1 || scr_BlockCheckRule(BlockWest,"Transparent")  );


// special corners
var BlockNorthWest = scr_ChunkGetBlock(chunk, xx-16, yy-16, BlockGridType.walls);
var BlockNorthEast = scr_ChunkGetBlock(chunk, xx+16, yy-16, BlockGridType.walls);
var BlockSouthWest = scr_ChunkGetBlock(chunk, xx-16, yy+16, BlockGridType.walls);
var BlockSouthEast = scr_ChunkGetBlock(chunk, xx+16, yy+16, BlockGridType.walls);

var blockedNorthWest = !( BlockNorthWest == -1 || scr_BlockCheckRule(BlockNorthWest,"Transparent")  );
var blockedNorthEast = !( BlockNorthEast == -1 || scr_BlockCheckRule(BlockNorthEast,"Transparent")  );
var blockedSouthWest = !( BlockSouthWest == -1 || scr_BlockCheckRule(BlockSouthWest,"Transparent")  );
var blockedSouthEast = !( BlockSouthEast == -1 || scr_BlockCheckRule(BlockSouthEast,"Transparent")  );

// tile logic!
if(!blockedNorth && blockedSouth)
{
    // top row
    if(!BlockWest && BlockEast)
    {
        // top left corner
        if(!blockedSouthEast)
        {
            // bottomright empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,6,4,xx,yy-16,-yy));
        }
        else
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,1,0,xx,yy-16,-yy));
        }
    }
    else if(BlockWest && !BlockEast)
    {
        // top right corner
        if(!blockedSouthWest)
        {
            // bottomleft empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,7,4,xx,yy-16,-yy));
        }
        else
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,3,0,xx,yy-16,-yy));
        }
    }
    else if(BlockWest && BlockEast)
    {
        // middle
        if(!blockedSouthWest && blockedSouthEast)
        {
            // bottomleft empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,4,3,xx,yy-16,-yy));
        }
        else if(blockedSouthWest && !blockedSouthEast)
        {
            // bottomright empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,5,3,xx,yy-16,-yy));
        }
        else if(!blockedSouthWest && !blockedSouthEast)
        {
            // both bottom corners special case
            ds_list_add(packedTiles,scr_ExtractTile(texture,7,1,xx,yy-16,-yy));
        }
        else
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,2,0,xx,yy-16,-yy));
        }
    }
    else
    {
        //upward facing strip
        ds_list_add(packedTiles,scr_ExtractTile(texture,8,2,xx,yy-16,-yy));
    }
}
else if(blockedNorth && !blockedSouth)
{
    // bottom row
    if(!BlockWest && BlockEast)
    {
        // bottom left corner
        if(!blockedNorthEast)
        {
            // topright empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,4,4,xx,yy-16,-yy));
        }
        else
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,1,2,xx,yy-16,-yy));
        }
        
        ds_list_add(packedTiles,scr_ExtractTile(texture,1,3,xx,yy,-yy));
    }
    else if(BlockWest && !BlockEast)
    {
        // bottom right corner
        if(!blockedNorthWest)
        {
            // topleft empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,5,4,xx,yy-16,-yy));
        }
        else
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,3,2,xx,yy-16,-yy));
        }
        
        ds_list_add(packedTiles,scr_ExtractTile(texture,3,3,xx,yy,-yy));
    }
    else if(BlockWest && BlockEast)
    {
        // middle
        if(!blockedNorthWest && blockedNorthEast)
        {
            // topleft empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,4,2,xx,yy-16,-yy));
        }
        else if(blockedNorthWest && !blockedNorthEast)
        {
            // topright empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,5,2,xx,yy-16,-yy));
        }
        else if(!blockedNorthWest && !blockedNorthEast)
        {
            // both top corners special case
            ds_list_add(packedTiles,scr_ExtractTile(texture,6,1,xx,yy-16,-yy));
        }
        else
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,2,2,xx,yy-16,-yy));
        }
        
        ds_list_add(packedTiles,scr_ExtractTile(texture,2,3,xx,yy,-yy));
    }
    else
    {
        // downward facing strip
        ds_list_add(packedTiles,scr_ExtractTile(texture,8,4,xx,yy-16,-yy));
        
        ds_list_add(packedTiles,scr_ExtractTile(texture,0,3,xx,yy,-yy));
    }
    
}
else if(blockedNorth && blockedSouth)
{
    // mid row
    if(!BlockWest && BlockEast)
    {
        // left side
        if(!blockedNorthEast && blockedSouthEast)
        {
            // topright empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,5,0,xx,yy-16,-yy));
        }
        else if(blockedNorthEast && !blockedSouthEast)
        {
            // bottomright empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,5,1,xx,yy-16,-yy));
        }
        else if(!blockedNorthEast && !blockedSouthEast)
        {
            // both right corners special case
            ds_list_add(packedTiles,scr_ExtractTile(texture,7,0,xx,yy-16,-yy));
        }
        else
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,1,1,xx,yy-16,-yy));
        }
    }
    else if(BlockWest && !BlockEast)
    {
        // right side
        if(!blockedNorthWest && blockedSouthWest)
        {
            // topleft empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,4,0,xx,yy-16,-yy));
        }
        else if(blockedNorthWest && !blockedSouthWest)
        {
            // bottomleft empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,4,1,xx,yy-16,-yy));
        }
        else if(!blockedNorthWest && !blockedSouthWest)
        {
            // both left corners empty special case corner
            ds_list_add(packedTiles,scr_ExtractTile(texture,6,0,xx,yy-16,-yy));
        }
        else
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,3,1,xx,yy-16,-yy));
        }
    }
    else if(BlockWest && BlockEast)
    {
        // middle
        
        //check all corners case, then single corner cases first, then two corner cases, then finally single corner cases
        if(blockedNorthWest && blockedNorthEast && blockedSouthWest && blockedSouthEast)
        {
            // all corners blocked
            ds_list_add(packedTiles,scr_ExtractTile(texture,2,1,xx,yy-16,-yy));
        }
        else if(!blockedNorthWest && !blockedNorthEast && !blockedSouthWest && !blockedSouthEast)
        {
            // no corners blocked
            ds_list_add(packedTiles,scr_ExtractTile(texture,7,2,xx,yy-16,-yy));
        }
        else if(blockedNorthWest && !blockedNorthEast && !blockedSouthWest && !blockedSouthEast) // begin single corners missing
        {
            // top left solid
            ds_list_add(packedTiles,scr_ExtractTile(texture,0,2,xx,yy-16,-yy));
        }
        else if(!blockedNorthWest && blockedNorthEast && !blockedSouthWest && !blockedSouthEast)
        {
            // top right solid
            ds_list_add(packedTiles,scr_ExtractTile(texture,8,1,xx,yy-16,-yy));
        }
        else if(!blockedNorthWest && !blockedNorthEast && blockedSouthWest && !blockedSouthEast)
        {
            // bottom left solid
            ds_list_add(packedTiles,scr_ExtractTile(texture,0,1,xx,yy-16,-yy));
        }
        else if(!blockedNorthWest && !blockedNorthEast && !blockedSouthWest && blockedSouthEast)
        {
            // bottom right solid
            ds_list_add(packedTiles,scr_ExtractTile(texture,8,0,xx,yy-16,-yy));
        }
        else if(blockedNorthWest && blockedNorthEast && !blockedSouthWest && !blockedSouthEast) // begin two corners missing
        {
            // top corners solid
            ds_list_add(packedTiles,scr_ExtractTile(texture,4,5,xx,yy-16,-yy));
        }
        else if(!blockedNorthWest && !blockedNorthEast && blockedSouthWest && blockedSouthEast)
        {
            // bottom corners solid
            ds_list_add(packedTiles,scr_ExtractTile(texture,3,5,xx,yy-16,-yy));
        }
        else if(blockedNorthWest && !blockedNorthEast && blockedSouthWest && !blockedSouthEast)
        {
            // left corners solid
            ds_list_add(packedTiles,scr_ExtractTile(texture,2,5,xx,yy-16,-yy));
        }
        else if(!blockedNorthWest && blockedNorthEast && !blockedSouthWest && blockedSouthEast)
        {
            // right corners solid
            ds_list_add(packedTiles,scr_ExtractTile(texture,1,5,xx,yy-16,-yy));
        }
        else if(!blockedNorthWest && blockedNorthEast && blockedSouthWest && !blockedSouthEast)
        {
            // BL and TR corners solid
            ds_list_add(packedTiles,scr_ExtractTile(texture,7,3,xx,yy-16,-yy));
        }
        else if(blockedNorthWest && !blockedNorthEast && !blockedSouthWest && blockedSouthEast)
        {
            // BR and TL corners solid
            ds_list_add(packedTiles,scr_ExtractTile(texture,6,3,xx,yy-16,-yy));
        }
        else if(!blockedNorthWest) // begin single corner cases
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,8,5,xx,yy-16,-yy));
        }
        else if(!blockedNorthEast) 
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,7,5,xx,yy-16,-yy));
        }
        else if(!blockedSouthWest) 
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,5,5,xx,yy-16,-yy));
        }
        else if(!blockedSouthEast)
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,6,5,xx,yy-16,-yy));
        }
        else
        {
            ds_list_add(packedTiles,scr_ExtractTile(texture,2,1,xx,yy-16,-yy));
        }
    }
    else
    {
        // middle strip
        ds_list_add(packedTiles,scr_ExtractTile(texture,8,3,xx,yy-16,-yy));
    }
    
    
    
}
else if(!blockedNorth && !blockedSouth)
{
    // mid strip
    if(!BlockWest && BlockEast)
    {
        // left unblocked
        ds_list_add(packedTiles,scr_ExtractTile(texture,1,4,xx,yy-16,-yy));
        
        ds_list_add(packedTiles,scr_ExtractTile(texture,1,3,xx,yy,-yy));
    }
    else if(BlockWest && !BlockEast)
    {
        // right unblocked
        ds_list_add(packedTiles,scr_ExtractTile(texture,3,4,xx,yy-16,-yy));
        
        ds_list_add(packedTiles,scr_ExtractTile(texture,3,3,xx,yy,-yy));
    }
    else if(BlockWest && BlockEast)
    {
        // both blocked
        ds_list_add(packedTiles,scr_ExtractTile(texture,2,4,xx,yy-16,-yy));
        
        ds_list_add(packedTiles,scr_ExtractTile(texture,2,3,xx,yy,-yy));
    }
    else
    {
        ds_list_add(packedTiles,scr_ExtractTile(texture,7,2,xx,yy-16,-yy));
        
        ds_list_add(packedTiles,scr_ExtractTile(texture,0,3,xx,yy,-yy));
    }
}














return packedTiles;
