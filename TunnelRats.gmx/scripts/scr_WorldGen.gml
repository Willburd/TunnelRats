/// scr_WorldGen(seed);
random_set_seed(argument0);

global.seaLevel = 240;

global.continentMap = -1;
global.continentMap_Scale = 10;
global.mountainMap = -1;
global.mountainMap_Scale = 4;
global.hillMap = -1;
global.hillMap_Scale = 3;



// Create continent map that will be stretched out extremely wide and deep
global.continentMap = scr_GenSimplexNoise(50,50,2,6);
show_debug_message("finished continent map");

// Create mountain map, still stretched out, but goes much higher
global.mountainMap = scr_GenSimplexNoise(40,40,2,3);
show_debug_message("finished mountain map");

// Create hill map, scale is smaller and used for rough terrain
global.hillMap = scr_GenSimplexNoise(60,60,3,4);
show_debug_message("finished hill map");







// post randomization
randomize();
