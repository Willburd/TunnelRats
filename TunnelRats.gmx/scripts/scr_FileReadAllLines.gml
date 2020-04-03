/// scr_FileReadAllLines(fileName)
var stringDat = "";
var loadFile = file_text_open_read(argument0);
    while (!file_text_eof(loadFile)) {
        stringDat += file_text_read_string(loadFile); file_text_readln(loadFile);
    }
file_text_close(loadFile);
return stringDat;
