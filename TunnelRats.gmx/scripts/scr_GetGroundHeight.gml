/// scr_GetGroundHeight(x,y)
// gets the worldgen ground level at block X,Y
var xx = argument0;
var yy = argument1;

// pull data from world gen grids
var groundHeight = global.worldData[? "seaLevel"];
if(global.debug_DisableWorldGen == false)
{
    var contHeight = scr_SafeData(global.worldData[? "continentMap"]   ,xx,yy,global.continentMap_Scale);
    var montHeight = scr_SafeData(global.worldData[? "mountainMap"]    ,xx,yy,global.mountainMap_Scale);
    var hillHeight = scr_SafeData(global.worldData[? "hillMap"]        ,xx,yy,global.hillMap_Scale);
    
    groundHeight -= floor(contHeight / 5);
    groundHeight += 32; //offset continents down!
    groundHeight -= floor(montHeight / 22);
    groundHeight -= floor(hillHeight / 20);
}

return groundHeight;
