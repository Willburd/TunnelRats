/// scr_EntityPlayerProfileCreate(identityName,x,y,z,Universe,Layer);
// new player profile
var newPlayerProfile = ds_map_create();
    newPlayerProfile[? "ProfileName"] = argument0;
    newPlayerProfile[? "EntityX"] = argument1;
    newPlayerProfile[? "EntityY"] = argument2;
    newPlayerProfile[? "EntityZ"] = argument3;
    newPlayerProfile[? "EntityUniverse"] = argument4;
    newPlayerProfile[? "EntityLayer"] = argument5;
return newPlayerProfile;

