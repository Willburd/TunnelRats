var saveMap = ds_map_create();

saveMap[? "seed"] = global.worldData[? "seed"];
saveMap[? "name"] = global.worldData[? "name"];
saveMap[? "seaLevel"] = global.worldData[? "seaLevel"];
saveMap[? "chunkWidth"] = global.chunkWidth;
saveMap[? "chunkHeight"] = global.chunkHeight;


    var saveDir = working_directory + "/Worlds/" + string(saveMap[? "name"]) + "/";
    var saveFile = file_text_open_write(saveDir + "RawMap.dat");
        
        file_text_write_string(saveFile,ds_map_write(saveMap));                              file_text_writeln(saveFile);
        file_text_write_string(saveFile,ds_grid_write(global.worldData[? "continentMap"]));  file_text_writeln(saveFile);
        file_text_write_string(saveFile,ds_grid_write(global.worldData[? "mountainMap"]));   file_text_writeln(saveFile);
        file_text_write_string(saveFile,ds_grid_write(global.worldData[? "hillMap"]));       file_text_writeln(saveFile);
    
    file_text_close(saveFile);

ds_map_destroy(saveMap);
