/// scr_BiomeGetBlockSpawn(zdata,zCheck,biomeGenData,layer)
// SHOULD BE RUN IN A RANDOM SEEDED ENVIRONMENT
var zheight = argument0;
var zCheckLevel = argument1; // 0 is player level, 1 is ground level!
var generationList = argument2[? "BlockGen"];
var XQ = argument3;
var YC = argument4;
var layer = argument5;


for (var i=0; i<ds_list_size(generationList); i+=1)
{
    // get block data, and return the first possible block!
    var blockDatList = generationList[| i];
    
    //run througn gen conditions!
    var conditionsPassed = true;
    for (var t=0; t<ds_list_size(blockDatList)-1; t+=1)
    {
        var conditionList = blockDatList[| 1 + t];
        
        if(conditionList[| 0] == "Chance")
        {
            if(conditionList[| 1] <= random(1))
            {
                conditionsPassed = false;
            }
        }
        else if(conditionList[| 0] == "MixedHeight")
        {
            // remember that the world grows from the sky! 
            var minimumHeight = conditionList[| 1];
            var maximumHeight = conditionList[| 2];
            
            if(zheight < minimumHeight || zheight > maximumHeight)
            {
                conditionsPassed = false;
            }
        }
        else if(conditionList[| 0] == "Density")
        {
            // remember that the world grows from the sky! 
            var contHeight = scr_SafeData(global.worldData[? "DensityMap"]   ,XQ,YC,layer,3,global.densityMap_Scale);
            var minimumHeight = conditionList[| 1];
            var maximumHeight = conditionList[| 2];
        
            if(contHeight < minimumHeight || contHeight > maximumHeight)
            {
                conditionsPassed = false;
            }
        }
        else if(conditionList[| 0] == "ContinentHeight")
        {
            // remember that the world grows from the sky! 
            var contHeight = scr_SafeData(global.worldData[? "ContinentMap"]   ,XQ,YC,layer,2,global.continentMap_Scale);
            var minimumHeight = conditionList[| 1];
            var maximumHeight = conditionList[| 2];
        
            if(contHeight < minimumHeight || contHeight > maximumHeight)
            {
                conditionsPassed = false;
            }
        }
        else if(conditionList[| 0] == "MountainHeight")
        {
            // remember that the world grows from the sky! 
            var mountHeight = scr_SafeData(global.worldData[? "MountainMap"]   ,XQ,YC,layer,1,global.mountainMap_Scale);
            var minimumHeight = conditionList[| 1];
            var maximumHeight = conditionList[| 2];
            
            if(mountHeight < minimumHeight || mountHeight > maximumHeight)
            {
                conditionsPassed = false;
            }
        }
        else if(conditionList[| 0] == "HillHeight")
        {
            // remember that the world grows from the sky! 
            var hillHeight = scr_SafeData(global.worldData[? "HillMap"]   ,XQ,YC,layer,0,global.hillMap_Scale);
            var minimumHeight = conditionList[| 1];
            var maximumHeight = conditionList[| 2];
            
            if(hillHeight < minimumHeight || hillHeight > maximumHeight)
            {
                conditionsPassed = false;
            }
        }
        else if(conditionList[| 0] == "Temperature")
        {
            // remember that the world grows from the sky! 
            var contHeight = scr_SafeData(global.worldData[? "TemperatureMap"]   ,XQ,YC,layer,8,global.temperatureMap_Scale);
            var minimumHeight = conditionList[| 1];
            var maximumHeight = conditionList[| 2];
        
            if(contHeight < minimumHeight || contHeight > maximumHeight)
            {
                conditionsPassed = false;
            }
        }
        else if(conditionList[| 0] == "Humidity")
        {
            // remember that the world grows from the sky! 
            var contHeight = scr_SafeData(global.worldData[? "HumidityMap"]   ,XQ,YC,layer,7,global.humidityMap_Scale);
            var minimumHeight = conditionList[| 1];
            var maximumHeight = conditionList[| 2];
        
            if(contHeight < minimumHeight || contHeight > maximumHeight)
            {
                conditionsPassed = false;
            }
        }
        else if(conditionList[| 0] == "Wind")
        {
            // remember that the world grows from the sky! 
            var contHeight = scr_SafeData(global.worldData[? "WindMap"]   ,XQ,YC,layer,6,global.windMap_Scale);
            var minimumHeight = conditionList[| 1];
            var maximumHeight = conditionList[| 2];
        
            if(contHeight < minimumHeight || contHeight > maximumHeight)
            {
                conditionsPassed = false;
            }
        }
        else if(conditionList[| 0] == "Magic")
        {
            // remember that the world grows from the sky! 
            var contHeight = scr_SafeData(global.worldData[? "MagicMap"]   ,XQ,YC,layer,5,global.magicMap_Scale);
            var minimumHeight = conditionList[| 1];
            var maximumHeight = conditionList[| 2];
        
            if(contHeight < minimumHeight || contHeight > maximumHeight)
            {
                conditionsPassed = false;
            }
        }
        else if(conditionList[| 0] == "Evil")
        {
            // remember that the world grows from the sky! 
            var contHeight = scr_SafeData(global.worldData[? "EvilMap"]   ,XQ,YC,layer,4,global.evilMap_Scale);
            var minimumHeight = conditionList[| 1];
            var maximumHeight = conditionList[| 2];
        
            if(contHeight < minimumHeight || contHeight > maximumHeight)
            {
                conditionsPassed = false;
            }
        }
    }
    
    if(conditionsPassed)
    {
        //show_debug_message(blockDatList[| 0]);
        return blockDatList[| 0];
    }
}

return "None:Air";
