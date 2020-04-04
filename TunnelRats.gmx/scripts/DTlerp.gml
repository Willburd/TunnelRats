/// DTlerp( value,target,lerpamount, deltaTime)
// credit to http://fauxoperativegames.com/a-comprehensive-guide-to-time-dilation/
var originalValue = argument0;
var targetValue = argument1; 
var lerpAmount = argument2;
var timeFactor = argument3; 

return lerp( originalValue, targetValue, 1 - power( 1-lerpAmount, timeFactor));
