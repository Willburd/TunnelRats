/// scr_GenSimplexNoise(width,height,scale,octaves);
global.SIPX_width = argument0;
global.SIPX_height = argument1;
global.SIPX_scale = argument2;
global.SIPX_octaves = argument3;

octvectors = scrOctaveGen(global.SIPX_octaves);
var returnMap = ds_grid_create(global.SIPX_width * global.SIPX_scale, global.SIPX_height * global.SIPX_scale);
scrGenerateOctaveNoise(returnMap, octvectors);
scrOctaveClean(octvectors);

return returnMap;
