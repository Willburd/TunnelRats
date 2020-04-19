/// scr_WorldGen(seed,name);
random_set_seed(argument0);
global.worldData = ds_map_create();
global.worldData[? "seed"] = argument0;
global.worldData[? "name"] = argument1;

global.worldData[? "TemperatureMap"] = -1;
global.worldData[? "HumidityMap"] = -1;
global.worldData[? "WindMap"] = -1;
global.worldData[? "MagicMap"] = -1;
global.worldData[? "EvilMap"] = -1;
global.worldData[? "DensityMap"] = -1;
global.worldData[? "continentMap"] = -1;
global.worldData[? "mountainMap"] = -1;
global.worldData[? "hillMap"] = -1;

global.structureMap = ds_map_create();


if(global.debug_DisableWorldGen == false)
{
    show_debug_message("Begin worldgen simplex creation");

    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "TemperatureMap"] = scr_GenSimplexNoise(36,41,12,2);
    show_debug_message("finished temperature map");
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "HumidityMap"] = scr_GenSimplexNoise(25,29,10,4);
    show_debug_message("finished humidity map");
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "WindMap"] = scr_GenSimplexNoise(23,28,22,2);
    show_debug_message("finished wind map");
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "MagicMap"] = scr_GenSimplexNoise(32,38,11,4);
    show_debug_message("finished magic map");
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "EvilMap"] = scr_GenSimplexNoise(41,49,8,2);
    show_debug_message("finished evil map");

    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "DensityMap"] = scr_GenSimplexNoise(62,65,5,3);
    show_debug_message("finished density map");
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "ContinentMap"] = scr_GenSimplexNoise(54,49,12,4);
    show_debug_message("finished continent map");
    
    // Create mountain map, still stretched out, but goes much higher
    global.worldData[? "MountainMap"] = scr_GenSimplexNoise(46,42,8,2);
    show_debug_message("finished mountain map");
    
    // Create hill map, scale is smaller and used for rough terrain
    global.worldData[? "HillMap"] = scr_GenSimplexNoise(52,66,3,3);
    show_debug_message("finished hill map");
    
}




// post randomization
randomize();
