/// scr_LoadWorld(name, universeNumber);
if(!ds_exists(global.worldData,ds_type_map))
{
    global.worldData = ds_map_create();
}
else
{
    ds_map_clear(global.worldData);
}


// load primary world data
var saveDir = working_directory + "/Worlds/" + string(argument0) + "/";
var saveFile = file_text_open_read(saveDir + "World.dat");

    ds_map_read( global.worldData, file_text_readln(saveFile));
file_text_close(saveFile);

// load packed data and clear it
if(!is_undefined(global.worldData[? "chunkWidth"]))
{
    global.chunkWidth = global.worldData[? "chunkWidth"];
    ds_map_delete(global.worldData, "chunkWidth");
}
if(!is_undefined(global.worldData[? "chunkHeight"]))
{
    global.chunkHeight = global.worldData[? "chunkHeight"];
    ds_map_delete(global.worldData, "chunkHeight");
}




// load universe data
var saveDir = working_directory + "/Worlds/" + string(argument0) + "/Universe" + string(argument1) + "/";
var saveFile = file_text_open_read(saveDir + "RawMap.dat");
    global.worldData[? "TemperatureMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "TemperatureMap"],    file_text_readln(saveFile));
    global.worldData[? "HumidityMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "HumidityMap"],    file_text_readln(saveFile));
    global.worldData[? "WindMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "WindMap"],    file_text_readln(saveFile));
    global.worldData[? "MagicMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "MagicMap"],    file_text_readln(saveFile));
    global.worldData[? "EvilMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "EvilMap"],    file_text_readln(saveFile));
    global.worldData[? "DensityMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "DensityMap"],    file_text_readln(saveFile));
    global.worldData[? "ContinentMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "ContinentMap"],    file_text_readln(saveFile));
    global.worldData[? "MountainMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "MountainMap"],     file_text_readln(saveFile));
    global.worldData[? "HillMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "HillMap"],         file_text_readln(saveFile));
file_text_close(saveFile);





