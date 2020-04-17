/// scr_PlayerUseItem( controllerID, chunk, x, y, inventoryEntity, BlockGridType);
var controllerID = argument0;
var chunk = argument1;
var xx = argument2;
var yy = argument3;
var inventoryEntity = scr_EntityGetLibraryDef(argument4);
var selector = argument5; // wall/ground/floor selector

var toolGlow = 0.3 * (0.5 + (sin(global.animationStep/20)/4));
var modeType = -1; // only for the switch!
var useMode = -1;
if(inventoryEntity != -1)
{
    // pass out a proper action
    useMode = inventoryEntity[? "UseAction"];
    var modeType = useMode[| 0];
}

switch modeType
{
    case "PlaceEntity":
        // place an entity
        controllerID.toolUseCounter += scr_DTscale(0.15);
        if(scr_ChunkGetBlock(chunk,xx ,yy,BlockGridType.walls) == -1 && scr_EntityAllowedOnGround(inventoryEntity,chunk,xx,yy))
        {
            controllerID.myHighlight.image_alpha = lerp( controllerID.toolGlow, 1, inverse_lerp(-1,0,controllerID.toolUseCounter));
            if(controllerID.toolUseCounter >= 0)
            {
                if(collision_rectangle(xx,yy,xx+global.tilePixelSize,yy+global.tilePixelSize,obj_WorldEntityDeployedParent,false,true) == noone)
                {
                    controllerID.toolUseCounter = -1
                    var entityDat = scr_EntityInitData( argument4, xx + random_range(global.tilePixelSize*0.20,global.tilePixelSize*0.80), yy + random_range(global.tilePixelSize*0.20,global.tilePixelSize*0.80),0);
                    scr_EntityRealizeInstance( entityDat, noone, chunk.worldController, false);
                    scr_ChunkUpdate( chunk, true);
                    
                    return true; // tick inventory down!
                }
                else
                {
                    controllerID.toolUseCounter = -1
                }
            }
        }
        else
        {
            controllerID.toolUseCounter = -1
        }
    break;

    case "PlaceBlock":
        // place a block
        controllerID.toolUseCounter += scr_DTscale(0.15);
        var canReplaceBlock = scr_BlockCanReplace(chunk,xx ,yy, selector);
        if(canReplaceBlock)
        {
            controllerID.myHighlight.image_alpha = lerp( controllerID.toolGlow, 1, inverse_lerp(-1,0,controllerID.toolUseCounter));
            if(controllerID.toolUseCounter >= 0)
            {
                var canBuild = false;
                // break floors if placing a wall, and break walls if placing a floor
                if(selector == BlockGridType.walls || selector == BlockGridType.floors)
                {
                    // constructed entity check
                    var findEnt = collision_rectangle(xx,yy,xx+global.tilePixelSize,yy+global.tilePixelSize,obj_WorldEntityDeployedParent,false,true);
                    if(findEnt == noone)
                    {
                        // player check
                        var findEnt = noone;
                        if(selector == BlockGridType.walls)
                        {
                            // don't care about where player is standing
                            findEnt = collision_rectangle(xx,yy,xx+global.tilePixelSize,yy+global.tilePixelSize,obj_Player,false,true);
                        }
                        if(findEnt == noone)
                        {    
                            if(selector == BlockGridType.floors && scr_ChunkGetBlock(chunk,xx ,yy, BlockGridType.walls) != -1)
                            {
                                // cancel prior check if we fail floor's NO WALLS conditions
                                canBuild = false;
                            }
                            else if(scr_BlockCanReplace(chunk,xx ,yy, BlockGridType.floors))
                            {
                                // break floor already there if it is replacable
                                scr_BlockBreak(chunk, xx ,yy,0, BlockGridType.floors);
                                
                                part_particles_create(global.partSys,xx ,yy, global.partLibrary[? "DustPuff"],10);
                                canBuild = true;
                            }
                        }
                        else
                        {
                            // entity is in the way!
                            canBuild = false;
                        }
                    }
                    else
                    {
                        // entity is in the way!
                        canBuild = false;
                    }
                }
                
                if(canBuild)
                {
                    controllerID.toolUseCounter = -1
                    // When placing blocks, do it instantly and than do cooldown
                    if(scr_ChunkGetBlock(chunk,xx ,yy, selector) == -1)
                    {
                        var newBlock = scr_BlockInitData(useMode[| 1]);
                        newBlock[? "FirstSpawn"] = false;
                        scr_ChunkSetBlock(chunk,xx ,yy, newBlock, selector);
                        scr_BlockTriggerUpdate(chunk,xx ,yy, BlockGridType.floors,true);
                        scr_BlockTriggerUpdate(chunk,xx ,yy, BlockGridType.walls,true);
                        scr_ChunkUpdate(chunk,true);
                        
                        return true; // tick inventory down!
                    }
                }
                else
                {
                    controllerID.toolUseCounter = -1
                }
            }
        }
        else
        {
            controllerID.toolUseCounter = -1
        }
    break;
    
    default:
        // break blocks
        var toolMod = 0;
        var breakingGoalBlock = scr_ChunkGetBlock(chunk,xx ,yy, selector);
        
        if(breakingGoalBlock != -1)
        {
            if(controllerID.toolUseCounter >= 1)
            {
                controllerID.toolUseCounter = -1;
                // break a block if one exists
                scr_BlockBreak(chunk,xx ,yy,0, selector);
                scr_BlockTriggerUpdate(chunk,xx ,yy, BlockGridType.floors,true);
                scr_BlockTriggerUpdate(chunk,xx ,yy, BlockGridType.walls,true);
                scr_ChunkUpdate(chunk,true);
                
                part_particles_create(global.partSys,xx ,yy, global.partLibrary[? "DustPuff"],10);
                
                return true; // tick inventory down!
            }
            else
            {
                var blockResistance = scr_BlockCheckRule(breakingGoalBlock, "BreakingResistance");
                if(blockResistance == -1) 
                {
                    controllerID.toolUseCounter = -1;
                }
                else
                {
                    controllerID.toolUseCounter += scr_DTscale( (power(blockResistance,-0.5)/100) * (4.35 + toolMod) );
                }
            }
            
        }
        else
        {
            var findEnt = collision_rectangle(xx,yy,xx+global.tilePixelSize,yy+global.tilePixelSize,obj_WorldEntityDeployedParent,false,true);
            if(findEnt != noone)
            {
                if(controllerID.toolUseCounter >= 1)
                {
                    controllerID.toolUseCounter = -1;
                    // break an entity if one exists
                    if(findEnt.EntityData != -1)
                    {
                        scr_EntityBreak(findEnt,findEnt.ActiveChunk,findEnt.x,findEnt.y,findEnt.z,true);
                    }
                }
                else
                {
                    if(findEnt.EntityData != -1)
                    {
                        var entityResistance = findEnt.EntityData[? "BreakingResistance"];  
                        if(entityResistance == -1) 
                        {
                            controllerID.toolUseCounter = -1;
                        }
                        else
                        {
                            controllerID.toolUseCounter += scr_DTscale( (power(entityResistance,-0.5)/100) * (4.35 + toolMod) );
                        }
                    }
                }
            }
            else
            {
                controllerID.toolUseCounter  = -1;
            }
        }
        
        controllerID.myHighlight.image_alpha = lerp( controllerID.toolGlow, 1, inverse_lerp(-1,1,controllerID.toolUseCounter));
        
    break;
}

