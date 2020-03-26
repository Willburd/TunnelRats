// Convert integer data into greyscale color

var val = argument0;
var r = (val + 1) * 127.5;
r = round(r);

ret = make_color_rgb(r, r, r);
return ret;
