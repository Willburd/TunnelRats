/// scr_SafeData(map,x,y,scale)
var xx = argument1;
var yy = argument2;
var scale = argument3;

var currentMap = argument0;
var xxx = scr_euclidMod( floor(xx / scale), ds_grid_width(currentMap));
var yyy = scr_euclidMod( floor(yy / scale), ds_grid_height(currentMap));

var val = ds_grid_get(currentMap, xxx, yyy);
var r = (val + 1) * 127.5
r = round(r);

return r;
