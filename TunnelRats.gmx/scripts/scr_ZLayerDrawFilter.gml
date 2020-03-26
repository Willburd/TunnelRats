///scr_ZLayerDrawFilter(zlayer);
// don't draw if not on the correct Z layer!
if(argument0 < global.currentCameraZLevel)
{
    // above draw limit
    return false;
}
else if(argument0 == global.currentCameraZLevel || global.currentCameraZLevel - argument0 > -6)
{
    // in limits
    return true;
}
else
{
    // too far
    return false;
}
