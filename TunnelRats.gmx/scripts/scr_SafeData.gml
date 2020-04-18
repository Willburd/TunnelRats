/// scr_SafeData(map,x,y,layer,dataMapOffsetIndex,scale)
var xx = argument1;
var yy = argument2;
var scale = argument5;

// layer offset handling
var layer = argument3;
var offsetMapNumber = argument4; // keep consistant between the map being read!
var modx = (sin(layer + offsetMapNumber)*24) + layer;
var mody = (cos(layer + offsetMapNumber)*32) - layer;


var currentMap = argument0;
var xxx = scr_euclidMod( floor((xx+modx) / scale), ds_grid_width(currentMap));
var yyy = scr_euclidMod( floor((yy+mody) / scale), ds_grid_height(currentMap));

var val = ds_grid_get(currentMap, xxx, yyy);
var r = (val + 1) * 127.5
r = round(r);

return r;
