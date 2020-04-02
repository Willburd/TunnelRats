/// scr_BlockGetTileset(blockData)
// returns the background texture that will be cutup and used as tiles
// will probably only be called by scr_BlockDataToTile()

if(argument0[? "DataName"] == "Base")
{
    // set unique data
    switch(argument0[? "Name"])
    {
        default :
            return bg_testBlock;
            
        case "Air": 
            return -1;
            
        case "Water": 
            return bg_block_water;
     
        case "Sand":
            return bg_block_sand;   
            
        case "Dirt":
            return bg_testBlock; 
    }
}
