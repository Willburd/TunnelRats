global.currentGame = noone;
global.gamePaused = false;

global.currentCameraEntity = noone; // entity the camera is following

// framerate
global._game_time = 0; // deltatime stacker
global._frame_time = 0; // deltatime stacker
global._game_max_time = 30; // 30 ticks target for entities
global._frame_max_time = 60; // 60 ticks target for framerate
global.gameMaxFrames = 9999; // room lock fps

global.animationStep = 0;
global.ZDrawOffset = 16; //Z pixel scale for jumping

// Entities
global.AllowUpdateCounter = 0;
global._gravity = 0.005;

// 4:3  1.3333
// 16:9  1.7777
// 16:10 1.6 
// consistant resolutions
global.resArray = array_create(3);
global.resArray[0] = 192; // 4:3
global.resArray[1] = 256; // 16:9
global.resArray[2] = 230; // 16:10
global.resMode = 1;

// camera
global.outputResolutionHeight = 144;
global.chunkWidth = 5;
global.chunkHeight = 5;

global.debug_DisableWorldGen = false;
global.debug_ChunkLoadingInfo = false;
global.debug_EntityLoadingInfo = false;

// World gen
global.worldData = -1;
global.continentMap_Scale = 6; // these scales are how many blocks each pixel represents in the world, not the scaling of the grid!
global.mountainMap_Scale = 3;
global.hillMap_Scale = 1;
global.unloadingTimer = 400; // if this is under 0 allow unload
global.loadingTimer = 10; // if this is under 0 allow loading

global.currentLayer = 0;
global.layerLoadedBiomes = -1; // ds_list of loaded biomes

// keyboard control
global.keyLeft = vk_left;
global.keyRight = vk_right;
global.keyUp = vk_up;
global.keyDown = vk_down;

global.keyJump = vk_space;
global.keySprint = vk_lshift;

global.keyUseLeft = ord('A');
global.keyUseRight = ord('D');
global.keyUseUp = ord('W');
global.keyUseDown = ord('S');



// create block database from external files
global.BlockLibrary = scr_LoadBlockLibrary();       // ds_map filled with ds_maps
global.BlockRulesDefault = -1;                      
global.BlockRules = scr_LoadRuleLibrary();          // ds_map filled with ds_maps
global.TextureLibrary = scr_LoadTextureLibrary();   // ds_map filled with bgs
global.BiomeLibrary = scr_LoadBiomes();             // ds_priority filled with maps



// RANDOMIZE!
randomize();
