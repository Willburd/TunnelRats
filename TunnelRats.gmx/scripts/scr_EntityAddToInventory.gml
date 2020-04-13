/// scr_EntityAddToInventory(entityDataWithInventory, entityDataToStore)
var entityWithInv = argument0;
var entityToStore = argument1;

if(entityToStore == -1)
{
    show_debug_message("Tried to store a non existant entity inside another entity");
    return false;
}

if(entityWithInv == -1)
{
    show_debug_message("Tried to store entity inside a non existant entity");
    return false;
}

var Inventorylist = entityWithInv[? "Inventory"];
var InventoryMax = entityWithInv[? "InventorySize"];
if(is_undefined(Inventorylist ))
{
    show_debug_message("Tried to store entity inside an entity with no inventory!");
    return false;
}
if(is_undefined( InventoryMax))
{
    show_debug_message("Tried to store an entity inside an entity with an inventory, but it had no maximum inventory defined! Use -1 for endless inventory size!");
    return false;
}

if(InventoryMax == -1) InventoryMax = 9999;
var listMax = ds_list_size(Inventorylist);

var countToStore = 1;
for (var i=0; i<InventoryMax; i+=1)
{
    // check inventory for matches to fill!
    var InventoryEntry = Inventorylist[| i];
    
    // Check if it matches!
    if(i >= listMax || is_undefined(InventoryEntry) || InventoryEntry == -1)
    {
        // empty inventory entry, set it to me!
        InventoryEntry = ds_list_create();
        Inventorylist[| i] = InventoryEntry;
        ds_list_mark_as_list(Inventorylist,i);
        
        InventoryEntry[| 0] = string(entityToStore[? "DataName"] + ":" + entityToStore[? "Name"]);
        InventoryEntry[| 1] = countToStore;
        
        if(InventoryEntry[| 1] >= entityToStore[? "MaxStack"])
        {
            countToStore = InventoryEntry[| 1] - entityToStore[? "MaxStack"];
            InventoryEntry[| 1] = entityToStore[? "MaxStack"];
        }
        else
        {
            countToStore = 0;
        }
    }
    else if(InventoryEntry[| 0] == string(entityToStore[? "DataName"] + ":" + entityToStore[? "Name"]))
    {
    
        // matched entry!
        if(InventoryEntry[| 1] <= entityToStore[? "MaxStack"])
        {
            InventoryEntry[| 1] += countToStore;
            if(InventoryEntry[| 1] >= entityToStore[? "MaxStack"])
            {
                countToStore = InventoryEntry[| 1] - entityToStore[? "MaxStack"];
                InventoryEntry[| 1] = entityToStore[? "MaxStack"];
            }
            else
            {
                countToStore = 0;
            }
        }
        else
        {
            countToStore = 0;
        }
    }
    
    if(countToStore == 0)
    {
        // stored all!
        return true;
    }
}

// failed
return false;
