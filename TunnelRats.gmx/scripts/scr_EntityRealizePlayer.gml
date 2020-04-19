/// scr_EntityRealizePlayer(playerIdentity,WorldController,cameraFollow);
// spawn a new player! from the player identity profile provided!
var player = scr_EntityInitData("None:Player",argument0[? "EntityX"],argument0[? "EntityY"],argument0[? "EntityZ"]);
player[? "Identity"] = argument0[? "ProfileName"];
player[? "CameraIsFollowing"] = argument2;
var playerInstance = scr_EntityRealizeInstance(player,noone,argument1,false);
return playerInstance;
