/// scr_LoadChunk(universe,loadingChunkObjec);
var universe = argument0;
var newChunk = argument1;
var loadList = ds_list_create();

var saveDir = working_directory + "/Worlds/" + string(global.worldData[? "name"]) + "/Universe" + string(universe) + "/Chunks/" + string(newChunk.x/16) + "o" + string(newChunk.y/16) + ".dat";
var loadFile = file_text_open_read(saveDir);
var num = 0;
while (!file_text_eof(loadFile)) {
    loadList[| num++] = file_text_readln(loadFile);
}
file_text_close(loadFile);

var maxLayers = real(loadList[| 0]);

var num = 1;
var layerNum = 0;
while (layerNum < maxLayers)
{
    var loadString = loadList[| num];
    
    // find layer to start extracting
    var testVal = string_copy(loadString, 0, 3);
    if(testVal == "CNK")
    {
        // Chunk end border (debug stuff)
        num++; // next line
    }
    else if(testVal == "NLD") // no loaded
    {
        // next loop, nothing here
        newChunk.blockLayers[| layerNum] = -1;
        num++; // next line
        layerNum++; // move onto the next layer
    }
    else if(testVal == "EMP") // empty grid
    {
        // empty layer
        var layerGrid = ds_grid_create( global.chunkWidth, global.chunkHeight);
        ds_grid_clear(layerGrid,-1);
        newChunk.blockLayers[| layerNum] = layerGrid;
        num++; // next line
        layerNum++; // move onto the next layer
    }
    else
    {
        var layerGrid = ds_grid_create( global.chunkWidth, global.chunkHeight);
        newChunk.blockLayers[| layerNum] = layerGrid;
        
        var loopCount = 0;
        for (var q=0; q<global.chunkWidth; q+=1)
        {
            for (var c=0; c<global.chunkHeight; c+=1)
            {
                // get a ds_map of the block at the location
                loadString = loadList[| num];
                
                var testVal = string_copy(loadString, 0, 3);
                if(testVal == "CNK") // all air grid
                {
                    // chunk border detected!
                    show_debug_message("READ CHUNK BORDER IN GRID LOOPS!? " + string(loopCount++));
                }
                else if(testVal == "AIR") // all air grid
                {
                    // nullBlock
                    layerGrid[# q,c] = -1;
                    num++; // move onto the next block
                }
                else
                {
                    var newBlock = json_decode(loadString);
                    newBlock[? "Exposed"] = -1;
                    layerGrid[# q,c] = newBlock;
                    num++; // move onto the next block
                }
                loopCount++;
            }
        }
        
        layerNum++; // move onto the next layer
    }
}

ds_list_destroy(loadList);


