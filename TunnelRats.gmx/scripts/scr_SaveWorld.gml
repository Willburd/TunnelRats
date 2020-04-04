/// scr_SaveWorld(worldName, universeNumber)
var worldName = argument0;
var saveMap = ds_map_create();

// save primary world data
var saveDir = working_directory + "/Worlds/" + string(argument0) + "/";
var saveFile = file_text_open_write(saveDir + "World.dat");
    saveMap[? "seed"] = global.worldData[? "seed"];
    saveMap[? "name"] = global.worldData[? "name"];
    saveMap[? "chunkWidth"] = global.chunkWidth;
    saveMap[? "chunkHeight"] = global.chunkHeight;
    file_text_write_string(saveFile,ds_map_write(saveMap)); file_text_writeln(saveFile);
file_text_close(saveFile);
ds_map_destroy(saveMap);


// save universe generation maps
var saveDir = working_directory + "/Worlds/" + string(argument0) + "/Universe" + string(argument1) + "/";
var saveFile = file_text_open_write(saveDir + "RawMap.dat");
    file_text_write_string(saveFile,ds_grid_write(global.worldData[? "continentMap"]));  file_text_writeln(saveFile);
    file_text_write_string(saveFile,ds_grid_write(global.worldData[? "mountainMap"]));   file_text_writeln(saveFile);
    file_text_write_string(saveFile,ds_grid_write(global.worldData[? "hillMap"]));       file_text_writeln(saveFile);
file_text_close(saveFile);
