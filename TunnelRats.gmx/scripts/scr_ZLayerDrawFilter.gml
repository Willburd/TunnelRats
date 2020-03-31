///scr_ZLayerDrawFilter(zlayer);
// don't draw if not on the correct Z layer!
if(argument0 < global.currentCameraZLevel-1)
{
    // above draw limit
    return false;
}
else if(argument0 == floor(global.currentCameraZLevel-1) || argument0 == floor(global.currentCameraZLevel) || global.currentCameraZLevel - argument0 > -global.drawLayerDepth)
{
    // in limits
    return true;
}
else
{
    // too far
    return false;
}
