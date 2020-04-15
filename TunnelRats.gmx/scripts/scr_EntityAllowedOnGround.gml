/// scr_EntityAllowedOnGround( placingEntitydefinitionData, chunk, xx ,yy)
var entDefData = argument0;
var chunk = argument1;
var xx = argument2;
var yy = argument3;

var groundBlock = scr_ChunkGetBlock(chunk,xx ,yy,BlockGridType.ground)

if(groundBlock == -1) return false;
if(entDefData == -1) return false;
if(is_undefined(entDefData[? "AllowedGround"])) return false;

var groundList = entDefData[? "AllowedGround"];

for (var i=0; i<ds_list_size(groundList); i+=1)
{
    if(groundList[| i] == groundBlock[? "DataName"] + ":" + groundBlock[? "Name"])
    {
        return true;
    }
}
return false;
