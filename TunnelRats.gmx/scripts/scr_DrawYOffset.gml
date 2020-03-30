/// scr_DrawYOffset(x,y,z)
// entity drawing y compensation
// 
var xx = argument0;
var yy = argument1;
var zz = argument2;
return (8 * ((zz/16) - global.currentCameraZLevel));
