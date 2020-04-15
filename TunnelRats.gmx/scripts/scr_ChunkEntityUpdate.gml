/// scr_ChunkEntityUpdate()
var chunk = argument0;
for (var i=0; i<ds_list_size(chunk.entitys); i+=1)
{
    if(chunk.entitys[| i] != noone)
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
                            var followingBefore = followObject;
                            followObject = other.id;
                            
                            // Player UI control
                            if(followingBefore != followObject)
                            {
                                // clear and hide inventory
                                MenuIndex[0] = -1;
                                MenuIndex[1] = -1;
                                MenuExpand[0] = 0;
                                MenuExpand[1] = 0;
                                // reset control locks
                                currentToolLock = true;
                                MenuData[0] = -1;
                                MenuData[1] = -1;
                                PreviousMenuData[0] = MenuData[0];
                                PreviousMenuData[1] = MenuData[1];
                            }
                        }
                    }
                    
                    // first time spawn called
                    if(EntityData[? "FirstSpawn"])
                    {
                        EntityData[? "FirstSpawn"] = false;
                        event_user(1);
                    }
                    
                    // ready to draw this frame!
                    visible = true; // sets the first ready to draw frame!
                
                    // run code ahead in child object's event!
                    event_user(0);
                    
                    // check if we were not destroyed by our updater
                    if(EntityData != -1)
                    {
                        // done with update!
                        EntityData[? "NeedUpdate"] = false;
                    }
                }
            }
        }
    }
    else
    {
        // cleanup!
        chunk.entitys[| i] = -1;
        ds_list_delete(chunk.entitys,i);
        i -= 1;
    }
}

