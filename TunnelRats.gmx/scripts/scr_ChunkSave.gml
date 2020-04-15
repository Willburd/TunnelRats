/// scr_ChunkSave(universe,chunk,currentLayer);
var universe = argument0;
var chunkObj = argument1;
var curLayer = argument2;
// chunkObj.walls;
// chunkObj.ground;
// chunkObj.floors;

var saveDir = working_directory + "/Worlds/" + string(global.worldData[? "name"]) + "/Universe" + string(universe) + "/Chunks/Layer" + string(curLayer) + "/" + scr_ChunkName(chunkObj) + ".dat";
var saveFile = file_text_open_write(saveDir);

    // save the entity list as we unload!
    file_text_write_real(saveFile,ds_list_size(entitys));  file_text_writeln(saveFile); // store entity count
    for (var i=0; i<ds_list_size(entitys); i+=1)
    {
        var ent = entitys[| i];
    
        if(ent != noone)
        {
            // save(if needed) and destroy entity)
            if(ent.EntityData != -1 && ent.EntityData[? "SavedByChunk"] && !ent.EntityData[? "DestroyedOnUnload"]) {
                // write save data
                with ent event_user(2);
                
                // write entity data to chunk!
                file_text_write_string(saveFile,scr_EntitySave(ent));  file_text_writeln(saveFile);
                
                if(global.debug_EntityLoadingInfo) show_debug_message("Entity " + string(ent) + " saved to chunk " + scr_ChunkName(chunkObj) );
            }
            else
            {
                file_text_write_string(saveFile,"-1");  file_text_writeln(saveFile);
            }
        }
        else
        {
            file_text_write_string(saveFile,"-1");  file_text_writeln(saveFile);
        }
    }
    
    // write Z and biome data
    file_text_write_string(saveFile,ds_grid_write(chunkObj.zdata));  file_text_writeln(saveFile);
    file_text_write_string(saveFile,ds_grid_write(chunkObj.bdata));  file_text_writeln(saveFile);
    

    // write block data!
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

