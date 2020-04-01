/// scr_BlockDataToTile( blockData, layerGrid, layerNumber, chunk)
// returns a tileID, sized, and placed automatically 

var newBlock = argument0;
var gridLayerData = argument1;
var currentLayer = argument2;
var chunk = argument3;

var exposure = newBlock[? "Exposed"];  //set by scr_BlockExposureCheck();
var xx = newBlock[? "x"];
var yy = newBlock[? "y"];
var zz = newBlock[? "z"];
var drawDepth = newBlock[? "DrawDepth"]; // set by scr_ChunkInternalSetBlock();

var texture = scr_BlockGetTileset(newBlock); // get texture to cut up for tile data!

var tileData = tile_add(texture,8,0,16,32,xx,yy,drawDepth);

return tileData;

/*
if(rectangle_in_rectangle(x,y-16,x+16,y+32,view_xview[0]-8,view_yview[0]-8,view_xview[0]+view_wview[0]+8,view_yview[0]+view_hview[0]+8) > 0)
{
    var yOffset = scr_DrawYOffset(x,y,z);
    var solveAlpha = clamp( inverse_lerp(global.currentCameraZLevel-3,global.currentCameraZLevel+global.drawLayerDepth,(z/16)) , 0, 1);
    var drawAlpha = 1;
    
    if(exposure == exposureType.none)
    {
        draw_sprite_ext(spr_blockDarken,0   , x, y + yOffset, 1, 1, 0, image_blend, drawAlpha);
    }
    else if(floor(z/16) >= floor(global.currentCameraZLevel))
    {
        if(exposure == exposureType.backWall)
        {
            drawAlpha = 0.25;
            draw_sprite_part_ext(sprite_index   ,0,8,16,16,16, x, y + yOffset - 8, 1, 1, image_blend, drawAlpha);
            draw_sprite_part_ext(spr_blockDarken,0,8,16,16,16, x, y + yOffset - 8, 1, 1, image_blend, solveAlpha*drawAlpha);
        }
        else if(exposure == exposureType.frontWall)
        {
            draw_sprite_part_ext(sprite_index   ,0,8,16,16,16, x, y + yOffset + 8, 1, 1, image_blend, drawAlpha);
            draw_sprite_part_ext(spr_blockDarken,0,8,16,16,16, x, y + yOffset + 8, 1, 1, image_blend, solveAlpha*drawAlpha);
        }
        else if(exposure == exposureType.leftWall)
        {
            draw_sprite_part_ext(sprite_index   ,0,0,0,8,32, x, y + yOffset + 8, 1, 1, image_blend, drawAlpha);
            draw_sprite_part_ext(spr_blockDarken,0,8,0,8,32, x, y + yOffset + 8, 1, 1, image_blend, solveAlpha*drawAlpha);
        }
        else if(exposure == exposureType.rightWall)
        {
            draw_sprite_part_ext(sprite_index   ,0,24,0,8,32, x+8, y + yOffset + 8, 1, 1, image_blend, drawAlpha);
            draw_sprite_part_ext(spr_blockDarken,0,8,0,8,32,  x+8, y + yOffset + 8, 1, 1, image_blend, solveAlpha*drawAlpha);
        }
        else if(exposure == exposureType.bothWalls)
        {
            draw_sprite_part_ext(sprite_index   ,0,0,0,8,32, x, y + yOffset + 8, 1, 1, image_blend, drawAlpha);
            draw_sprite_part_ext(sprite_index   ,0,24,0,8,32, x+8, y + yOffset + 8, 1, 1, image_blend, drawAlpha);
            draw_sprite_part_ext(spr_blockDarken,0,8,0,8,32, x, y + yOffset + 8, 1, 1, image_blend, solveAlpha*drawAlpha);
            draw_sprite_part_ext(spr_blockDarken,0,8,0,8,32,  x+8, y + yOffset + 8, 1, 1, image_blend, solveAlpha*drawAlpha);
        }
        else if(frontFloorMode)
        {
            draw_sprite_part_ext(sprite_index   ,0,0,0,16,16, x, y + yOffset - 8, 1, 1, image_blend, drawAlpha);
            draw_sprite_part_ext(spr_blockDarken,0,0,0,16,16, x, y + yOffset - 8, 1, 1, image_blend, solveAlpha*drawAlpha);
        }
        else
        {
            draw_sprite_part_ext(sprite_index   ,0,8,0,16,32, x, y + yOffset - 8, 1, 1, image_blend, drawAlpha);
            draw_sprite_part_ext(spr_blockDarken,0,8,0,16,32, x, y + yOffset - 8, 1, 1, image_blend, solveAlpha*drawAlpha);
        }
    }
    else
    {
        draw_sprite_ext(sprite_index,0, x, y + yOffset, 1, 1, 0, image_blend, global.aboveLayerDrawPercent);
    }
}

*/
