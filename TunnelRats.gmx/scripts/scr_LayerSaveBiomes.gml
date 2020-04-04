/// scr_LayerSaveBiomes(worldName,UniverseNumber)
var worldName = argument0;
var universeNum = argument1;


var saveDir = working_directory + "/Worlds/" + string(worldName) + "/Universe" + string(universeNum ) + "/Chunks/LayerData_" + string(global.currentLayer) + ".dat";
var saveFile = file_text_open_write(saveDir);

for (var i=0; i<ds_list_size(global.layerLoadedBiomes); i+=1)
{
    var getBiome = global.layerLoadedBiomes[| i];
    file_text_write_string(saveFile,getBiome[? "_InternalSaveName"]);  file_text_writeln(saveFile);
}
file_text_close(saveFile);
