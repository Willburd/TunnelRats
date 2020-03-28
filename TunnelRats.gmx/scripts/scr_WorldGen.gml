/// scr_WorldGen(seed,name);
random_set_seed(argument0);
global.worldData = ds_map_create();
global.worldData[? "seed"] = argument0;
global.worldData[? "name"] = argument1;

global.worldData[? "seaLevel"] = 240;

global.worldData[? "continentMap"] = -1;
global.worldData[? "mountainMap"] = -1;
global.worldData[? "hillMap"] = -1;



if(global.debug_DisableWorldGen == false)
{
    
    // Create continent map that will be stretched out extremely wide and deep
    global.worldData[? "continentMap"] = scr_GenSimplexNoise(30,30,15,2);
    show_debug_message("finished continent map");
    
    // Create mountain map, still stretched out, but goes much higher
    global.worldData[? "mountainMap"] = scr_GenSimplexNoise(20,20,8,4);
    show_debug_message("finished mountain map");
    
    // Create hill map, scale is smaller and used for rough terrain
    global.worldData[? "hillMap"] = scr_GenSimplexNoise(30,30,6,6);
    show_debug_message("finished hill map");
    
}




// post randomization
randomize();
