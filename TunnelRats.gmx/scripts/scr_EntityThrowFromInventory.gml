/// scr_EntityThrowFromInventory(entityDataWithInventory, slotToEmpty, chunk, atX, atY, atZ)
var entityWithInv = argument0;
var slotToEmpty = argument1;

if(entityWithInv == -1)
{
    show_debug_message("Tried to remove from slot inside a non existant entity");
    return -1;
}

var Inventorylist = entityWithInv[? "Inventory"];
if(is_undefined(Inventorylist ))
{
    show_debug_message("Tried to remove from slot inside an entity with no inventory!");
    return -1;
}

if(slotToEmpty >= ds_list_size(Inventorylist))
{
    return -1;
}

var InventoryEntry = Inventorylist[| slotToEmpty];
if(is_undefined(InventoryEntry) || InventoryEntry == -1)
{
    return -1;
}


var entityDat = scr_EntityInitData(InventoryEntry[| 0], argument3,argument4,argument5);

// variable sized removal from inventory
var removeCount = InventoryEntry[| 1];
if(keyboard_check(global.keySprint))
{
    removeCount = 1;
}
entityDat[? "InternalCount"] = removeCount; // number in each stack!

// if slot is empty from this action remove it
InventoryEntry[| 1] -= removeCount;
if(InventoryEntry[| 1] <= 0)
{
    ds_list_destroy(InventoryEntry); // remove entry
    Inventorylist[| slotToEmpty] = -1;
}

// spawn breaking entities
var thrower = scr_EntityRealizeInstance( entityDat,argument2,-1, true);
return thrower;
