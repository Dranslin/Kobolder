/// @description Insert description here
// You can write your code in this editor

smoothMod = 5;

x += (xTarget - x) / smoothMod;
y += (yTarget - y) / smoothMod;


if (follow != noone)
{
	xTarget = follow.x;
	yTarget = follow.y;
}


var view_matrix = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera,view_matrix);