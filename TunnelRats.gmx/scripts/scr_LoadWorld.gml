/// scr_LoadWorld(name);
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
var saveDir = working_directory + "/Worlds/" + string(argument0) + "/Universe0/";
var saveFile = file_text_open_read(saveDir + "RawMap.dat");

    global.worldData[? "continentMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "continentMap"],    file_text_readln(saveFile));
    global.worldData[? "mountainMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "mountainMap"],     file_text_readln(saveFile));
    global.worldData[? "hillMap"] = ds_grid_create(0,0);
    ds_grid_read(global.worldData[? "hillMap"],         file_text_readln(saveFile));
file_text_close(saveFile);





