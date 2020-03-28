/// scr_SaveChunk(chunk);
var chunkObj = argument0;
var chunkLayers = chunkObj.blockLayers;


var saveDir = working_directory + "/Worlds/" + string(global.worldData[? "name"]) + "/Chunks/";
var saveFile = file_text_open_write(saveDir + string(chunkObj.x/16) + "o" + string(chunkObj.y/16) + ".dat");
    
    for (var i=0; i<ds_list_size(chunkLayers); i+=1)
    {
        var gridData = chunkLayers[| i];
        
        if(is_undefined(gridData) || gridData == -1)
        {
            file_text_write_string(saveFile,"**nullGrid**");  file_text_writeln(saveFile); // no grid
        }
        else
        {
            for (var q=0; q<global.chunkWidth; q+=1)
            {
                for (var c=0; c<global.chunkHeight; c+=1)
                {
                    // get a ds_map of the block at the location
                    var blockData = gridData[# q,c];
                    
                    if(is_undefined(blockData) || blockData == -1)
                    {
                        file_text_write_string(saveFile,"**nullBlock**");  file_text_writeln(saveFile); // no block
                    }
                    else
                    {
                        file_text_write_string(saveFile,ds_map_write(blockData));  file_text_writeln(saveFile);
                    }
                }
            }
        }
    }

file_text_close(saveFile);

