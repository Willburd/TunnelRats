/// scr_BlockUpdateScripts( chunk, x, y, blockData)
var chunk = argument0;
var xx = argument1;
var yy = argument2;
var blockData = argument3;
var blockDefinition = scr_BlockGetLibraryDef(blockData[? "DataName"] + ":" + blockData[? "Name"]);

var updateData = blockDefinition[? "UpdateType"];
if(is_undefined(updateData)) return false;

switch updateData[| 0]
{
    case "GrassSpread":
        var firstTime = is_undefined(blockData[? "__GrassGrowCountdown__"]);
    
        if(firstTime || blockData[? "__GrassGrowCountdown__"] <= 0)
        {
            // pick a tile nearby and grow to it
            var xmod = choose(-1,0,1);
            var ymod = 0;
            if(xmod == 0) ymod = choose(-1,1);
            
            // check for grass growing block
            if(!firstTime)
            {
                if(scr_ChunkGetBlock(chunk,xx + (xmod * 16),yy + (ymod * 16),BlockGridType.walls) == -1 && scr_ChunkGetBlock(chunk,xx + (xmod * 16),yy + (ymod * 16),BlockGridType.floors) == -1)
                {
                    var groundData = scr_ChunkGetBlock(chunk,xx + (xmod * 16),yy + (ymod * 16),BlockGridType.ground);
                    if(scr_BlockCheckRule(groundData,"CanGrowGrass"))
                    {
                        var newGrass = scr_BlockInitData( blockData[? "DataName"] + ":" + blockData[? "Name"]);
                        scr_ChunkSetBlock(chunk,xx + (xmod * 16),yy + (ymod * 16),newGrass,BlockGridType.floors)
                        scr_BlockTriggerUpdate(chunk,xx + (xmod * 16),yy + (ymod * 16), BlockGridType.floors,true);
                    }
                }
            }
            
            // timer set!
            blockData[? "__GrassGrowCountdown__"] = floor(random_range(updateData[| 1],updateData[| 2]));
        }
        blockData[? "__GrassGrowCountdown__"] -= 1;
    break;
    
    
    default:
        return false; // rerender output
}
