global.currentGame = noone;
global.gamePaused = false;

global.currentCameraEntity = noone; // entity the camera is following

// framerate
global._targetDelta = 1/60;
global._GameSpeed = 1;
scr_UpdateDelta();

global.gameMaxFrames = 120; // room lock fps

global.animationStep = 0;
global.worldTick = 0;
global.ZDrawOffset = 16; //Z pixel scale for jumping

// Entities
global._gravity = 0.4;

// 4:3  1.3333
// 16:9  1.7777
// 16:10 1.6 
// consistant resolutions
global.outputResolutionHeight = 208;
global.resArray = array_create(3);
global.resArray[0] = round(global.outputResolutionHeight * (4/3)); // 4:3
global.resArray[1] = round(global.outputResolutionHeight * (16/9)); // 16:9
global.resArray[2] = round(global.outputResolutionHeight * (16/10)); // 16:10
global.resMode = 1;

// camera
global.chunkWidth = 5;
global.chunkHeight = 5;
global.metaChunkWidth = 36;
global.metaChunkHeight = 36;
global.tilePixelSize = 16;

global.debug_DisableWorldGen = false;
global.debug_ChunkLoadingInfo = true;
global.debug_EntityLoadingInfo = false;
global.debug_DisableWorldGenEntities = false;

// player management
global.PlayerProfileName = "Default";
global.PlayerProfile = -1;

// World gen
global.worldInitialName = -1;
global.worldInitialSeed = -1;
global.worldData = -1;
global.structureMap = -1;

global.unloadingTimer = 400; // if this is under 0 allow unload
global.loadingTimer = 10; // if this is under 0 allow loading
global.chunkUpdateBudget = 0; // counts chunks updated, doesn't allow an update if this is exceeded

global.layerLoadedBiomes = -1; // ds_list of loaded biomes

global.EmptyBlockID = "None:Air";

// keyboard control
global.keyLeft = ord('A');
global.keyRight = ord('D');
global.keyUp = ord('W');
global.keyDown = ord('S');

global.keyJump = vk_space;
global.keySprint = vk_lshift;
global.keyCrouch = vk_lcontrol;

global.keyItemRotateLeft = ord('Q');
global.keyItemRotateRight = ord('E');

global.keyExit = vk_escape;
global.keyPause = vk_enter;

// create block database from external files
global.BlockLibrary = scr_LoadBlockLibrary();       // ds_map filled with ds_maps                 
global.EntityLibrary = scr_LoadEntityLibrary();
global.BiomeLibrary = scr_LoadBiomeLibrary();             // ds_priority filled with maps
global.TextureLibrary = scr_LoadTextureLibrary();   // ds_map filled with bgs

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
global.fontTinyNums = font_add_sprite_ext(spr_TextTiny, "0123456789", false, 0);
global.font = font_add_sprite_ext(spr_temp_text, " |'      + ,-.!0123456789  (=)? ABCDEFGHIJKLMNOPQRSTUVWXYZ#$%^&   ", false, 0);
draw_set_font(global.font);
