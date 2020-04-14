/// scr_EntityBreak(entityInstance, chunk,x, y, z);
// test delete block!
var breaking = argument0.EntityData;
var chunk = argument1;
var xx = argument2;
var yy = argument3;
var zz = argument4;

// check if not air than do look checks
if(breaking != -1)
{
    // create a queue of entities to spawn!
    var spawnQueue = ds_queue_create();
    
    var blockDefinition = scr_EntityGetLibraryDef( breaking[? "DataName"] + ":" + breaking[? "Name"]);
    
    // standard breaking
    var dropTable = ds_map_find_value(blockDefinition, "DropsOnBreak");
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
        var dropTable = ds_map_find_value(blockDefinition, "ExtraDropOnFirstBreak");
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
        entityDat[? "InternalCount"] = 1; // number in each stack!
        
        // spawn breaking entities
        scr_EntityRealizeInstance( entityDat,chunk,-1, true);
    }
    
    ds_queue_destroy(spawnQueue);
}

// spawn post destruction entity!
var entityDat = scr_EntityInitData(breaking[? "BecomesOnBreak"], xx, yy, zz);
var newEntityInstance = scr_EntityRealizeInstance( entityDat,chunk,-1, false);

// remove the original entity!
with argument0 instance_destroy();

return newEntityInstance;


