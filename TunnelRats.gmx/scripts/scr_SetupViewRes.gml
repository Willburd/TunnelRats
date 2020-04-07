var viewh = global.outputResolutionHeight;
var vieww = global.resArray[global.resMode];

// default view
view_visible[0] = true;
view_hview[0] = viewh;
view_wview[0] = vieww;
view_hport[0] = viewh;
view_wport[0] = vieww;

surface_resize(application_surface,vieww,viewh);
display_set_gui_size(vieww,viewh);
