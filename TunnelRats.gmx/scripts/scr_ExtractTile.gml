/// scr_ExtractTile(tex,tilex,tiley,worldx,worldy)
var tex = argument0;
var tx = argument1;
var ty = argument2;
var xx = argument3;
var yy = argument4;
var dp = argument5;

return tile_add(tex,tx * global.tilePixelSize, ty * global.tilePixelSize,global.tilePixelSize,global.tilePixelSize,xx,yy,dp);
