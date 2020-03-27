global.currentGame = noone;
global.gamePaused = false;

global.currentCameraEntity = noone; // entity the camera is following
global.currentCameraZLevel = 0;

// framerate
global._game_time = 0; // deltatime stacker
global._chunk_time = 0; // chunk random update counter
global._game_max_time = 1000000 / 60; // 60 ticks target for entities
global.gameMaxFrames = 9999; // room lock fps

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
