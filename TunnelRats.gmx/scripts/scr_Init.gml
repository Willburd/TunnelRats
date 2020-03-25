global.currentGame = noone;
global.gamePaused = false;


// framerate
global._game_time = 0; // deltatime stacker
global._game_max_time = 1000000 / 60; // 60fps target
global.gameMaxFrames = 500; // room lock fps

// 4:3  1.3333
// 16:9  1.7777
// 16:10 1.6 
// consistant resolutions
global.resArray = array_create(1);
global.resArray[0] = 400;

// camera
global.outputResolutionHeight = 240;
global.aspectRatio = 1.3333;



