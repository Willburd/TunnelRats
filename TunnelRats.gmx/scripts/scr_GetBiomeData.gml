/// scr_GetBiomeData(x,y,layer)
// gets the worldgen biome at block X,Y
// SHOULD BE RUN IN A RANDOM SEEDED ENVIRONMENT
var xx = argument0;
var yy = argument1;
var layer = argument2;

// pull data from world gen grids
var foundBiome = -1;
if(global.debug_DisableWorldGen == false && ds_list_size(global.layerLoadedBiomes) > 0)
{
    // Get world data maps!
    var temperatureHeight = scr_SafeData(global.worldData[? "TemperatureMap"]   ,xx,yy,layer,8,global.temperatureMap_Scale);
    var humidityHeight =    scr_SafeData(global.worldData[? "HumidityMap"]      ,xx,yy,layer,7,global.humidityMap_Scale);
    var windHeight =        scr_SafeData(global.worldData[? "WindMap"]          ,xx,yy,layer,6,global.windMap_Scale);
    var magicHeight =       scr_SafeData(global.worldData[? "MagicMap"]         ,xx,yy,layer,5,global.magicMap_Scale);
    var evilHeight =        scr_SafeData(global.worldData[? "EvilMap"]          ,xx,yy,layer,4,global.evilMap_Scale);
    var densityHeight =     scr_SafeData(global.worldData[? "DensityMap"]       ,xx,yy,layer,3,global.densityMap_Scale);
    var contHeight =        scr_SafeData(global.worldData[? "ContinentMap"]     ,xx,yy,layer,2,global.continentMap_Scale);
    var montHeight =        scr_SafeData(global.worldData[? "MountainMap"]      ,xx,yy,layer,1,global.mountainMap_Scale);
    var hillHeight =        scr_SafeData(global.worldData[? "HillMap"]          ,xx,yy,layer,0,global.hillMap_Scale);
    
    var lastBiomePriority = -1;
    
    // Use above data to find a biome!
    for (var i=0; i<ds_list_size(global.layerLoadedBiomes); i+=1)
    {
        var biome = global.layerLoadedBiomes[| i];
        
        // biome spawn chance!
        var biomeValid = true;
        
        // check if biome is in threshold!
        var layerBounds = biome[? "Temperature"];
        if(temperatureHeight < layerBounds[| 0] || temperatureHeight > layerBounds[| 1])
        {
            biomeValid = false;
        }
        
        var layerBounds = biome[? "Humidity"];
        if(humidityHeight < layerBounds[| 0] || humidityHeight > layerBounds[| 1])
        {
            biomeValid = false;
        }
        
        var layerBounds = biome[? "Wind"];
        if(windHeight < layerBounds[| 0] || windHeight > layerBounds[| 1])
        {
            biomeValid = false;
        }
        
        var layerBounds = biome[? "Magic"];
        if(magicHeight < layerBounds[| 0] || magicHeight > layerBounds[| 1])
        {
            biomeValid = false;
        }
        
        var layerBounds = biome[? "Evil"];
        if(evilHeight < layerBounds[| 0] || evilHeight > layerBounds[| 1])
        {
            biomeValid = false;
        }
        
        var layerBounds = biome[? "Density"];
        if(densityHeight < layerBounds[| 0] || densityHeight > layerBounds[| 1])
        {
            biomeValid = false;
        }
        
        var layerBounds = biome[? "ContinentHeight"];
        if(contHeight < layerBounds[| 0] || contHeight > layerBounds[| 1])
        {
            biomeValid = false;
        }
        
        var layerBounds = biome[? "MountainHeight"];
        if(montHeight < layerBounds[| 0] || montHeight > layerBounds[| 1])
        {
            biomeValid = false;
        }
        
        var layerBounds = biome[? "HillHeight"];
        if(hillHeight < layerBounds[| 0] || hillHeight > layerBounds[| 1])
        {
            biomeValid = false;
        }
        
        if(biomeValid)
        {
            // check if we beat the last biome's priority!
            if(biome[? "BiomePriority"] > lastBiomePriority)
            {
                // new biome!
                foundBiome = i;
                lastBiomePriority = biome[? "BiomePriority"];
                
                if(lastBiomePriority >= 1)
                {
                    // maximum chance anyway!
                    return foundBiome;
                }
            }
        }
    }
}


return foundBiome;
