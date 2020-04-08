/// scr_LoadParticleLibrary();
var partLib = ds_map_create();

var newPart = part_type_create();
part_type_alpha1(newPart,1);
part_type_sprite(newPart,spr_part_DustPuff,true,1,false);
part_type_blend(newPart,false);
part_type_size(newPart,0.5,1,0.04,0);
part_type_life(newPart,room_speed/10, room_speed/6);
part_type_orientation(newPart,0,360,0,0,0);
part_type_gravity(newPart, 0.10, 270);
part_type_speed(newPart, 2, 3, -0.04, 0);
part_type_direction(newPart, 60, 180-60, 0, 0);
partLib[? "DustPuff"] = newPart;


return partLib;
