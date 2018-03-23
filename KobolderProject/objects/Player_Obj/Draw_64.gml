/// @description Insert description here
// You can write your code in this editor
/// @description Debug

draw_set_font(fDebug);
draw_set_color(c_black);

//You typically should avoid using "magic" numbers for this stuff, but this is just an example.
//For example, instead of "256" below you should work out 25% of the camera width.
//Just fyi.
draw_rectangle(0,0,512,174,0);
draw_set_color(c_white);
draw_text(12,12,"X: " + string(x) + " Y: " + string(y));
draw_text(12,30,"hsp: " + string(horiz_speed_ref) + " vsp: " + string(vert_speed));
draw_text(12,46, "OnGround: " + string(onGround));
draw_text(12,60, "key Right: " + string(key_right));
draw_text(12,70, "key Left: " + string(key_left));
draw_text(115, 12, "Grav: " + string(grav));
draw_text(115, 30, "Key_Shift: " + string(key_shift));
draw_text(115, 46, "Time Index: " + string(timeIndex));
draw_text(115, 60, "Time Marked: " + string(timeMarked));
draw_text(115, 74, "Last Stopped: " + string(lastStopped));
draw_text(256, 12, "Current Move: " + string(currentMove));
draw_text(256, 30, "Last Move: " + string(lastMoved));
draw_text(256, 46, "Is Dashing: " + string(isDashing));
draw_text(256, 60, "Time Dashed: " + string(timeDashed));



draw_text(0, 0, ": " + string(x));
