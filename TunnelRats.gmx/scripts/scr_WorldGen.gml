/// scr_WorldGen(seed,name);
random_set_seed(argument0);
global.worldData = ds_map_create();
global.worldData[? "seed"] = argument0;
global.worldData[? "name"] = argument1;

global.worldData[? "continentMap"] = -1;
global.worldData[? "mountainMap"] = -1;
global.worldData[? "hillMap"] = -1;

global.structureMap = ds_map_create();


if(global.debug_DisableWorldGen == false)
{
    show_debug_message("Begin worldgen simplex creation");

    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "TemperatureMap"] = scr_GenSimplexNoise(32,32,18,2);
    show_debug_message("finished temperature map");
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "HumidityMap"] = scr_GenSimplexNoise(29,29,10,4);
    show_debug_message("finished humidity map");
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "WindMap"] = scr_GenSimplexNoise(22,22,22,2);
    show_debug_message("finished wind map");
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "MagicMap"] = scr_GenSimplexNoise(36,36,11,4);
    show_debug_message("finished magic map");
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "EvilMap"] = scr_GenSimplexNoise(42,42,8,2);
    show_debug_message("finished evil map");

    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "DensityMap"] = scr_GenSimplexNoise(34,34,11,4);
    show_debug_message("finished density map");
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "ContinentMap"] = scr_GenSimplexNoise(30,30,15,2);
    show_debug_message("finished continent map");
    
    // Create mountain map, still stretched out, but goes much higher
    global.worldData[? "MountainMap"] = scr_GenSimplexNoise(20,20,8,4);
    show_debug_message("finished mountain map");
    
    // Create hill map, scale is smaller and used for rough terrain
    global.worldData[? "HillMap"] = scr_GenSimplexNoise(30,30,6,6);
    show_debug_message("finished hill map");
    
}




// post randomization
randomize();
