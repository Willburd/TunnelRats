/// scr_EntitySave(instanceID);
// does not remove from chunk!
// Everything in an entity should be json encodable, and NOT linked to other maps
// for example, the player inventory should just store entity spawn names, and not links to ds_maps for other entities!
// returns a json string
return json_encode(argument0.EntityData);
