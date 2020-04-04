/// scr_Chunk(universe,loadingChunkObjec);
var universe = argument0;
var newChunk = argument1;

// create the data grids
newChunk.walls = ds_grid_create( global.chunkWidth, global.chunkHeight);
newChunk.ground = ds_grid_create( global.chunkWidth, global.chunkHeight);
newChunk.floors = ds_grid_create( global.chunkWidth, global.chunkHeight);

var saveDir = working_directory + "/Worlds/" + string(global.worldData[? "name"]) + "/Universe" + string(universe) + "/Chunks/Layer" + string(global.currentLayer) + "/" + scr_ChunkName(newChunk) + ".dat";
var loadFile = file_text_open_read(saveDir);

    newChunk.zdata = ds_grid_create(global.chunkWidth,global.chunkHeight); // world gen ground Z height
    ds_grid_read(newChunk.zdata,file_text_readln(loadFile));

    while (!file_text_eof(loadFile)) {
        
        for (var q=0; q<global.chunkWidth; q+=1)
        {
            for (var c=0; c<global.chunkHeight; c+=1)
            {
                // get a ds_map of the block at the location
                var loadString = file_text_readln(loadFile);
                
                var testVal = string_copy(loadString, 0, 3);
                if(testVal == "AIR") // all air grid
                {
                    // nullBlock
                    newChunk.walls[# q,c] = -1;
                }
                else
                {
                    var newBlock = json_decode(loadString);
                    newChunk.walls[# q,c] = newBlock;
                }
            }
        }
          
        for (var q=0; q<global.chunkWidth; q+=1)
        {
            for (var c=0; c<global.chunkHeight; c+=1)
            {
                // get a ds_map of the block at the location
                var loadString = file_text_readln(loadFile);
                      
                var testVal = string_copy(loadString, 0, 3);
                if(testVal == "AIR") // all air grid
                {
                    // nullBlock
                    newChunk.ground[# q,c] = -1;
                }
                else
                {
                    var newBlock = json_decode(loadString);
                    newChunk.ground[# q,c] = newBlock;
                }
            }
        }
        
        for (var q=0; q<global.chunkWidth; q+=1)
        {
            for (var c=0; c<global.chunkHeight; c+=1)
            {
                // get a ds_map of the block at the location
                var loadString = file_text_readln(loadFile);
                
                var testVal = string_copy(loadString, 0, 3);
                if(testVal == "AIR") // all air grid
                {
                    // nullBlock
                    newChunk.floors[# q,c] = -1;
                }
                else
                {
                    var newBlock = json_decode(loadString);
                    newChunk.floors[# q,c] = newBlock;
                }
            }
        }
    }
    
file_text_close(loadFile);



