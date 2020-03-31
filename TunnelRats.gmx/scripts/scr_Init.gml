global.currentGame = noone;
global.gamePaused = false;

global.currentCameraEntity = noone; // entity the camera is following
global.currentCameraZLevel = 0;

// framerate
global._game_time = 0; // deltatime stacker
global._frame_time = 0; // deltatime stacker
global._game_max_time = 1000000 / 30; // 30 ticks target for entities
global._frame_max_time = 1000000 / 60; // 60 ticks target for framerate
global.gameMaxFrames = 9999; // room lock fps

global.animationStep = 0;

// Entities
global.AllowUpdateCounter = 0;
global._gravity = 64;

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
global.chunkWidth = 4;
global.chunkHeight = 4;
global.drawLayerDepth = 9;

global.debug_DisableWorldGen = false;
global.debug_ChunkLoadingInfo = true;
global.debug_EntityLoadingInfo = false;

// World gen
global.worldData = -1;
global.continentMap_Scale = 5; // these scales are how many blocks each pixel represents in the world, not the scaling of the grid!
global.mountainMap_Scale = 2;
global.hillMap_Scale = 1;
global.unloadingTimer = 400; // if this is under 0 allow unload
global.loadingTimer = 100; // if this is under 0 allow loading

global.selectedObject = noone;
global.unselectCoolDown = 0;

// keyboard control
global.keyLeft = ord('A');
global.keyRight = ord('D');
global.keyUp = ord('W');
global.keyDown = ord('S');
global.keyJump = vk_space;
