/// scr_ChunkSave(universe,chunk);
var universe = argument0;
var chunkObj = argument1;
// chunkObj.walls;
// chunkObj.ground;
// chunkObj.floors;

var saveDir = working_directory + "/Worlds/" + string(global.worldData[? "name"]) + "/Universe" + string(universe) + "/Chunks/Layer" + string(chunkObj.worldController.CurrentWorldLayer) + "/" + scr_ChunkName(chunkObj) + ".dat";
var saveFile = file_text_open_write(saveDir);

    for (var q=0; q<global.chunkWidth; q+=1)
    {
        for (var c=0; c<global.chunkHeight; c+=1)
        {
            // get a ds_map of the block at the location
            var blockData = chunkObj.walls[# q,c];
            if(is_undefined(blockData) || blockData == -1)
            {
                file_text_write_string(saveFile, "AIR");  file_text_writeln(saveFile); // no block
            }
            else
            {
                file_text_write_string(saveFile,json_encode(blockData));  file_text_writeln(saveFile);
            }
        }
    }
    
    for (var q=0; q<global.chunkWidth; q+=1)
    {
        for (var c=0; c<global.chunkHeight; c+=1)
        {
            var blockData = chunkObj.ground[# q,c];
            if(is_undefined(blockData) || blockData == -1)
            {
                file_text_write_string(saveFile, "AIR");  file_text_writeln(saveFile); // no block
            }
            else
            {
                file_text_write_string(saveFile,json_encode(blockData));  file_text_writeln(saveFile);
            }
       }
    }         
            
    for (var q=0; q<global.chunkWidth; q+=1)
    {
        for (var c=0; c<global.chunkHeight; c+=1)
        {     
            var blockData = chunkObj.floors[# q,c];
            if(is_undefined(blockData) || blockData == -1)
            {
                file_text_write_string(saveFile, "AIR");  file_text_writeln(saveFile); // no block
            }
            else
            {
                file_text_write_string(saveFile,json_encode(blockData));  file_text_writeln(saveFile);
            }
        }
    }

file_text_close(saveFile);

