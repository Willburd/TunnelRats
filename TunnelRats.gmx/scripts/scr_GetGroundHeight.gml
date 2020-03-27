/// scr_GetGroundHeight(x,y)
// gets the worldgen ground level at block X,Y
var xx = argument0;
var yy = argument1;

// pull data from world gen grids
var contHeight = scr_SafeData(global.continentMap   ,xx,yy,global.continentMap_Scale);
var montHeight = scr_SafeData(global.mountainMap    ,xx,yy,global.mountainMap_Scale);
var hillHeight = scr_SafeData(global.hillMap        ,xx,yy,global.hillMap_Scale);

var groundHeight = global.seaLevel;

//groundHeight += contHeight;
//groundHeight += (montHeight + 128) / 2;
groundHeight += floor(hillHeight/30);

return groundHeight;
