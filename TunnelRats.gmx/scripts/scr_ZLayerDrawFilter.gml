///scr_ZLayerDrawFilter(zlayer);
// don't draw if not on the correct Z layer!
if(argument0 == global.currentCameraZLevel)
{
    if( view_current != 0) return false;
}

if(argument0 == global.currentCameraZLevel+1)
{
    if( view_current != 1) return false;
}

for (var i=0; i<global.cameraDepths; i+=1)
{
    if(argument0 == global.currentCameraZLevel - (1 + i))
    {
        if( view_current != 2 + i) return false;
    }
};
return true;
