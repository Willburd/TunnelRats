/// scr_MetaChunkGetStructure(x,y,layer,structureAbove,worldController)
// Get structure data, or generate it
var xx = argument0;
var yy = argument1;
var lay = argument2;
var aboveStruct = argument3;
var controller = argument4;

var metaChunkIdentity = scr_MetaChunkGetIdentity(xx,yy,lay);
if(is_undefined(global.structureMap[? metaChunkIdentity]))
{
    var xReg = floor((xx/(global.chunkWidth*global.metaChunkWidth))/global.tilePixelSize);
    var yReg = floor((yy/(global.chunkHeight*global.metaChunkHeight))/global.tilePixelSize);

    //Prepare to create a new structure!
    var rootX = xReg * (global.chunkWidth*global.metaChunkWidth*global.tilePixelSize);
    var rootY = yReg * (global.chunkHeight*global.metaChunkHeight*global.tilePixelSize);
    var seed = global.worldData[? "seed"] + (floor(rootX/24)) + ((floor(rootY/global.tilePixelSize))*24) + (320*LoadedLayer);
    random_set_seed(seed);
    
    
    // control if we make a basement, or wait and make the top floor!
    var allowANewStructure = false;
    if(aboveStruct != -1 && aboveStruct[? "IsBasement"] == false)
    {
        // gen the basement of the above structure!
        
        //Gen structure data
        var newStruct = ds_map_create();
        newStruct[? "IsBasement"] = true;
        newStruct[? "StructureCoreX"] = aboveStruct[? "StructureCoreX"]; // stores the actual 16x entity x/y position! not a chunkx/y!
        newStruct[? "StructureCoreY"] = aboveStruct[? "StructureCoreY"];
        
        // Gen structure!
        var stairWay = scr_EntityInitData("None:Stairs",newStruct[? "StructureCoreX"]+(global.tilePixelSize/2),newStruct[? "StructureCoreY"]+(global.tilePixelSize/2),0);
        stairWay[? "StairUp"] = true;
        scr_EntityRealizeInstance(stairWay,noone,controller,false);
        
        // end structure data
        randomize();
        ds_map_add_map( global.structureMap, metaChunkIdentity, newStruct);
        return newStruct; // return structure data!
    }
    else if(aboveStruct == -1 || aboveStruct[? "IsBasement"] == true)
    {
        // if no structure above, or the thing above me is a basement, gen the first floor of a structure!
        
        // random gen conditions!
        if(random(1) < 0.50)
        {
            // sometimes there just isn't a structure!
            randomize();
            newStruct = -1;
            global.structureMap[? metaChunkIdentity] = newStruct;
            return newStruct; // return structure data!
        }
        
        //Gen structure data
        var newStruct = ds_map_create();
        newStruct[? "IsBasement"] = false;
        newStruct[? "StructureCoreX"] = rootX + (floor(random(global.chunkWidth*global.metaChunkWidth))*global.tilePixelSize); // stores the actual 16x entity x/y position! not a chunkx/y!
        newStruct[? "StructureCoreY"] = rootY + (floor(random(global.chunkHeight*global.metaChunkHeight))*global.tilePixelSize);
        
        // Gen structure!
        var stairWay = scr_EntityInitData("None:Stairs",newStruct[? "StructureCoreX"]+(global.tilePixelSize/2),newStruct[? "StructureCoreY"]+(global.tilePixelSize/2),0);
        stairWay[? "StairUp"] = false;
        scr_EntityRealizeInstance(stairWay,noone,controller,false);
        
        // end structure data
        randomize();
        ds_map_add_map( global.structureMap, metaChunkIdentity, newStruct);
        return newStruct; // return structure data!
    }
    else
    {
        // nothing here possible!
        randomize();
        newStruct = -1;
        global.structureMap[? metaChunkIdentity] = newStruct;
        return newStruct; // return structure data!
    }
}
else
{
    return global.structureMap[? metaChunkIdentity];
}
