global.currentGame = noone;
global.gamePaused = false;

global.currentCameraEntity = noone; // entity the camera is following

// framerate
global._targetDelta = 1/60;
global._GameSpeed = 1;
scr_UpdateDelta();

global.gameMaxFrames = 60; // room lock fps

global.animationStep = 0;
global.ZDrawOffset = 16; //Z pixel scale for jumping

// Entities
global._gravity = 0.4;

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
global.chunkWidth = 6;
global.chunkHeight = 6;

global.debug_DisableWorldGen = false;
global.debug_ChunkLoadingInfo = false;
global.debug_EntityLoadingInfo = true;

// player management
global.PlayerProfileName = "Default";
global.PlayerProfile = -1;

// World gen
global.worldInitialName = -1;
global.worldInitialSeed = -1;
global.worldData = -1;

global.temperatureMap_Scale = 5;
global.humidityMap_Scale = 6;
global.windMap_Scale = 7;
global.magicMap_Scale = 8;
global.evilMap_Scale = 5;
global.densityMap_Scale = 4;
global.continentMap_Scale = 5; // these scales are how many blocks each pixel represents in the world, not the scaling of the grid!
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

global.keyItemRotateRight = ord('E');
global.keyItemRotateLeft = ord('Q');

global.keyExit = vk_escape;
global.keyPause = vk_enter;

// create block database from external files
global.BlockLibrary = scr_LoadBlockLibrary();       // ds_map filled with ds_maps
global.BlockRulesDefault = -1;                      
global.BlockRules = scr_LoadRuleLibrary();          // ds_map filled with ds_maps
global.TextureLibrary = scr_LoadTextureLibrary();   // ds_map filled with bgs
global.BiomeLibrary = scr_LoadBiomeLibrary();             // ds_priority filled with maps
global.EntityLibrary = scr_LoadEntityLibrary();

// particle system
global.partSys = part_system_create();
part_system_automatic_update(global.partSys, false);
global.partLibrary = scr_LoadParticleLibrary();


// draw configs
texture_set_interpolation(true);
draw_set_alpha_test_ref_value(254);

// RANDOMIZE!
randomize();

// setup view!
scr_SetupViewRes();
window_set_rectangle(window_get_x(),window_get_y(), view_wport[0],view_hport[0]);

// font
global.font = font_add_sprite_ext(spr_temp_text, " |'      + ,-.!0123456789  (=)? ABCDEFGHIJKLMNOPQRSTUVWXYZ#$%^&   ", false, 0);
draw_set_font(global.font);

