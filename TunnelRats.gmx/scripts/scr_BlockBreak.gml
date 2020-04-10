/// scr_BlockBreak(chunk, x, y, z, BlockGridType);
// test delete block!
var chunk = argument0;
var xx = argument1;
var yy = argument2;
var zz = argument3;
var selector = argument4;

// drop loot!
var breaking = scr_ChunkGetBlock(  chunk, xx, yy, selector);

// check if not air than do look checks
if(breaking != -1)
{
    // create a queue of entities to spawn!
    var spawnQueue = ds_queue_create();
    
    // standard breaking
    var dropTable = scr_BlockRules(breaking, "DropsOnBreak");
    if(dropTable != -1)
    {
        for (var i=0; i<ds_list_size(dropTable); i+=1)
        {
            var dropEntry = dropTable[| i];
            
            if(random(1) < dropEntry[| 1])
            {
                ds_queue_enqueue(spawnQueue,dropEntry[| 0]);
            }
        }
    }
    
    // first time breaking has some unique drops!
    if(breaking[? "FirstSpawn"])
    {
        var dropTable = scr_BlockRules(breaking, "ExtraDropOnFirstBreak");
        if(dropTable != -1)
        {
            for (var i=0; i<ds_list_size(dropTable); i+=1)
            {
                var dropEntry = dropTable[| i];
                
                if(random(1) < dropEntry[| 1])
                {
                    ds_queue_enqueue(spawnQueue,dropEntry[| 0]);
                }
            }
        }
    }


    while (ds_queue_size(spawnQueue) > 0)
    {
        // extract data
        var newEntName = ds_queue_dequeue(spawnQueue);
        var entityDat = scr_EntityInitData(newEntName,xx,yy,zz);
        
        // spawn breaking entities
        scr_EntityRealizeInstance( entityDat,chunk,-1);
    }
}

// convert block
scr_ChunkSetBlock(chunk,xx ,yy,-1,selector);

