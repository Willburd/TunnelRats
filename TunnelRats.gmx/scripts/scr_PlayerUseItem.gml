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
                    if(scr_BlockCanReplace(chunk,xx ,yy, BlockGridType.floors))
                    {
                        scr_BlockBreak(chunk, xx ,yy,0, BlockGridType.floors);
                        
                        part_particles_create(global.partSys,xx ,yy, global.partLibrary[? "DustPuff"],10);
                        canBuild = true;
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
            }
        }
        else
        {
            controllerID.toolUseCounter = -1
        }
    break;
    
    default:
        // break blocks
        controllerID.toolUseCounter += scr_DTscale(0.03);
        controllerID.myHighlight.image_alpha = lerp( controllerID.toolGlow, 1, inverse_lerp(-1,1,controllerID.toolUseCounter));
        if(controllerID.toolUseCounter >= 1)
        {
            controllerID.toolUseCounter = -1
            if(scr_ChunkGetBlock(chunk,xx ,yy, selector) != -1)
            {
                scr_BlockBreak(chunk,xx ,yy,0, selector);
                scr_BlockTriggerUpdate(chunk,xx ,yy, BlockGridType.floors,true);
                scr_BlockTriggerUpdate(chunk,xx ,yy, BlockGridType.walls,true);
                scr_ChunkUpdate(chunk,true);
                
                part_particles_create(global.partSys,xx ,yy, global.partLibrary[? "DustPuff"],10);
            }
            
            return true; // tick inventory down!
        }
    break;
}

