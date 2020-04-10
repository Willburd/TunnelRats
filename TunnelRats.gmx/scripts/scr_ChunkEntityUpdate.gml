/// scr_ChunkEntityUpdate()
var chunk = argument0;
for (var i=0; i<ds_list_size(chunk.entitys); i+=1)
{
    with chunk.entitys[| i]
    {
        // entity countdown! be sure to set the update flag is the entity itself!
        if(EntityData[? "NeedUpdate"] == true)
        {
            // detect loaded chunk!
            if(scr_EntityDetectCurrentChunk(id))
            {
                // camera assignment check
                if(EntityData[? "CameraIsFollowing"])
                {
                    with obj_HudController
                    {
                        followObject = other.id;
                    }
                }
                
                
                // first time spawn called
                if(EntityData[? "FirstSpawn"])
                {
                    EntityData[? "FirstSpawn"] = false;
                    event_user(1);
                }
            
            
                // run code ahead in child object's event!
                event_user(0);
                
                
                // done with update!
                EntityData[? "NeedUpdate"] = false;
            }
        }
    }
}

