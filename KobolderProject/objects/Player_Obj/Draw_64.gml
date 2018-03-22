/// @description Insert description here
// You can write your code in this editor
/// @description Debug

draw_set_font(fDebug);
draw_set_color(c_black);

//You typically should avoid using "magic" numbers for this stuff, but this is just an example.
//For example, instead of "256" below you should work out 25% of the camera width.
//Just fyi.
draw_rectangle(0,0,256,128,0);
draw_set_color(c_white);
draw_text(12,12,"X: " + string(x) + " Y: " + string(y));
draw_text(12,30,"hsp: " + string(horiz_speed) + " vsp: " + string(vert_speed));
draw_text(12,46, "OnGround: " + string(onGround));
draw_text(128, 12, "Grav: " + string(grav));
draw_text(128, 30, "Key_Shift: " + string(key_shift));
