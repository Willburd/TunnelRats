/// scr_SaveChunk(universe,chunk);
var universe = argument0;
var chunkObj = argument1;
var chunkLayers = chunkObj.blockLayers;


var saveDir = working_directory + "/Worlds/" + string(global.worldData[? "name"]) + "/Universe" + string(universe) + "/Chunks/" + string(chunkObj.x/16) + "o" + string(chunkObj.y/16) + ".dat";
var saveFile = file_text_open_write(saveDir);
    
    file_text_write_real(saveFile,ds_list_size(chunkLayers));  file_text_writeln(saveFile); // store array length
    
    for (var i=0; i<ds_list_size(chunkLayers); i+=1)
    {
        var gridData = chunkLayers[| i];
        
        if(is_undefined(gridData) || gridData == -1)
        {
            file_text_write_string(saveFile, "NLD");  file_text_writeln(saveFile); // not loaded
        }
        else
        {
            var AllEmpty = true;
            for (var q=0; q<global.chunkWidth; q+=1)
            {
                for (var c=0; c<global.chunkHeight; c+=1)
                {
                    var blockData = gridData[# q,c];
                    
                    if(is_undefined(blockData) || blockData == -1)
                    {
                    }
                    else
                    {
                        AllEmpty = false;
                        break;
                    }
                }
            }
            
            if(AllEmpty)
            {
                file_text_write_string(saveFile, "EMP");  file_text_writeln(saveFile); // purely empty grid
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
                            file_text_write_string(saveFile, "AIR");  file_text_writeln(saveFile); // no block
                        }
                        else
                        {
                            file_text_write_string(saveFile,json_encode(blockData));  file_text_writeln(saveFile);
                        }
                    }
                }
                
                file_text_write_string(saveFile, "CNK");  file_text_writeln(saveFile); // no block
            }
        }
    }

file_text_close(saveFile);

