///scr_ZLayerDrawFilter(zlayer);
// don't draw if not on the correct Z layer!
if(argument0 == global.currentCameraZLevel  ||  argument0 == global.currentCameraZLevel+1  || argument0 == global.currentCameraZLevel+2  ||  argument0 == global.currentCameraZLevel+3  ||  argument0 == global.currentCameraZLevel+4  ||  argument0 == global.currentCameraZLevel+5)
{
    return true;
}
else
{
    return false;
}
