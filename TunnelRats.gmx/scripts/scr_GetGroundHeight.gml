/// scr_GetGroundHeight(x,y,biomeData)
// gets the worldgen ground level at block X,Y
var xx = argument0;
var yy = argument1;
var bdata = argument2;

// pull data from world gen grids
var groundHeight = 0;
if(global.debug_DisableWorldGen == false && bdata != -1)
{
    groundHeight = 0;
    var biome = global.layerLoadedBiomes[| bdata];
    var genData = biome[? "BlockGenData"];

    var contHeight = scr_SafeData(global.worldData[? "continentMap"]   ,xx,yy,global.continentMap_Scale);
    var montHeight = scr_SafeData(global.worldData[? "mountainMap"]    ,xx,yy,global.mountainMap_Scale);
    var hillHeight = scr_SafeData(global.worldData[? "hillMap"]        ,xx,yy,global.hillMap_Scale);
    
    groundHeight += floor(contHeight * genData[? "ContinentMultiplier"]);
    groundHeight += genData[? "ContinentOffset"];
    
    groundHeight += floor(montHeight * genData[? "MountainMultiplier"]);
    groundHeight += genData[? "MountainOffset"];
    
    groundHeight += floor(hillHeight * genData[? "HillMultiplier"]);
    groundHeight += genData[? "HillOffset"];
}

return groundHeight;
