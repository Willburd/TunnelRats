/// scr_EntityRealizePlayer(playerIdentity,cameraFollow);
// spawn a new player! from the player identity profile provided!
var getLib = global.EntityLibrary[? "None"];
var player = ds_map_create();
ds_map_copy(player,getLib[? "Player"]); // get a clone od a default player entity from the library!
player[? "Identity"] = argument0[? "ProfileName"];
player[? "SaveX"] = argument0[? "EntityX"];
player[? "SaveY"] = argument0[? "EntityY"];
player[? "SaveZ"] = argument0[? "EntityZ"];
player[? "CameraIsFollowing"] = argument1;
var playerInstance = scr_EntityRealizeInstance(player,noone,id);

