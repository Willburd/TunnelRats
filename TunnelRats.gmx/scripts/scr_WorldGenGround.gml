/// scr_WorldGenGround( chunk,zdata,bdata,x,y,q,c);
// prepare the data for checking!
// SHOULD BE RUN IN A RANDOM SEEDED ENVIRONMENT
var gridData = argument0.ground;
var zData    = argument1; // NOTE TO SELF, remember the world grows from the sky!
var bData    = argument2;
var xx = argument3;
var yy = argument4;
var QQ = argument5;
var CC = argument6;

if(bData == -1)
{
    return scr_BlockInitData( global.EmptyBlockID);
}

var biome = global.layerLoadedBiomes[| bData];
var genData = biome[? "BlockGenData"];

// spawn worldGen entities
var wallsData = argument0.walls[# QQ,CC];
var BlockSpawnDataName = scr_BiomeGetBlockSpawn(zData,0,genData,xx+QQ,yy+CC);
if(global.debug_DisableWorldGenEntities == false && wallsData == -1)
{
    var entityGenList = genData[? "EntityGen"];
    if(!is_undefined(entityGenList))
    {
        for (var i=0; i<ds_list_size(entityGenList); i+=1)
        {
            var genEntry = entityGenList[| i];
            
            if(genEntry[| 1] == BlockSpawnDataName)
            {
                if(random(1) < genEntry[| 2])
                {
                    var entityDat = scr_EntityInitData(genEntry[| 0],((xx+QQ)*16) + random_range(3,13),((yy+CC)*16) + random_range(3,13),0);
                    scr_EntityRealizeInstance( entityDat,argument0,-1, false);
                }
            }
        }
    }
}

// spawn ground
return scr_BlockInitData( BlockSpawnDataName);
