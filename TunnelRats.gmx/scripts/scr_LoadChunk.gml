/// scr_LoadChunk(loadingChunkObjec);
var newChunk = argument0;

var saveDir = working_directory + "/Worlds/" + string(global.worldData[? "name"]) + "/Chunks/";
var loadFile = file_text_open_read(saveDir + string(newChunk.x/16) + "o" + string(newChunk.y/16) + ".dat");
    
    var chunkLayers = newChunk.blockLayers;

    var layerNum = 0;
    while (!file_text_eof(loadFile))
    {
        var loadString = file_text_read_string(loadFile);
        
        // find layer to start extracting
        if(loadString == "**nullGrid**")
        {
            // next loop, nothing here
            chunkLayers[| layerNum] = -1;
        }
        else
        {
            var layerGrid = ds_grid_create( global.chunkWidth, global.chunkHeight);
            chunkLayers[| layerNum] = layerGrid;
            
            for (var q=0; q<global.chunkWidth; q+=1)
            {
                for (var c=0; c<global.chunkHeight; c+=1)
                {
                    // get a ds_map of the block at the location
                    layerGrid[# q,c] = -1;
                    if(loadString == "**nullBlock**")
                    {
                        // nullBlock
                    }
                    else
                    {
                        layerGrid[# q,c] = ds_map_create();
                        ds_map_read(layerGrid[# q,c], loadString);
                    }
                }
            }
        }
        
        file_text_readln(loadFile);
        layerNum++;
    }
    
file_text_close(loadFile);

