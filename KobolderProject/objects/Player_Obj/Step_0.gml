/// @description Insert description here
// You can write your code in this editor


// Movement variables
// - up / + down
// - left / + right

//key_up = -keyboard_check(ord("W"));
//key_down = keyboard_check(ord("S")); 
key_left = -keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_shift = keyboard_check(vk_shift);
//key_jump_hold = keyboard_check(vk_space);
key_jump = keyboard_check_pressed(vk_space);
key_attack = keyboard_check_pressed(ord("F"));
                                                                                                                                                  
// Movement controls


var x_move = key_left + key_right;
//var y_move = key_up + key_down + grav;
vert_speed += grav;


if ( !key_shift )
{
	horiz_speed = walk_speed * x_move;
//	vert_speed = walk_speed * y_move;
}
else
{
	horiz_speed = run_speed * x_move;
//	vert_speed = run_speed * y_move;
}

if (place_meeting( x + horiz_speed, y, Floor_Obj)) 
{
	while ( !place_meeting( x + sign(horiz_speed), y, Floor_Obj))
	{
		x = x + sign(horiz_speed);	
	}
	horiz_speed = 0;
}

if (place_meeting( x, y + vert_speed, Floor_Obj)) 
{
	while (!place_meeting( x, y + sign(vert_speed), Floor_Obj))
	{
		y = y + sign(vert_speed);	
	}
	vert_speed = 0;
}

// Check for on ground

if ( place_meeting( x, y + 1, Floor_Obj))
{
	onGround = 1;
	currentJump = 0;
}
else
{
	onGround = 0;	
}

if ( key_jump )
{
	if ( onGround = 1 )
	{
		vert_speed = -jump_speed;
		currentJump++;
	}
	if ( onGround = 0 ) && (currentJump < maxJumps)
	{
		vert_speed = -jump_speed;
		currentJump++;
	}
}

x += horiz_speed;
y += vert_speed;


// Swipe attack

if (key_attack) instance_create_layer(x, y, "Attack_Lyr", Swipe_Obj);



// Animations
/*
	Sprint Index:
	0 - Ground Right
	1 - Ground Center
	2 - Ground Left
	3 - Up Right
	4 - Up Center
	5 - Up Left
	6 - Down Right
	7 - Down Center
	8 - Down Left
*/
if (onGround)				// on ground
{
	if ( horiz_speed == 0 ) image_index = 1; else image_index = 0;
}
else
{
	if ( vert_speed < 0)	// jumping
	{
		if ( horiz_speed == 0 ) image_index = 4; else image_index = 3;
	}
	else					// falling
	{
		if ( horiz_speed == 0 ) image_index = 7; else image_index = 6;
	}
}

if (horiz_speed != 0) image_xscale = sign(horiz_speed);

/*
if (onGround)
{
	// on ground
	if (x_move > 0) image_index = 0; else if (x_move == 0) image_index = 1; else image_index = 2;
}
else
{
	// in air
	if (x_move > 0) // right
	{
		if ( vert_speed < 0 ) image_index = 3; else image_index = 6;
	}
	else if (x_move < 0 ) // left
	{
		if ( vert_speed < 0 ) image_index = 5; else image_index = 8;
	}
	else // center
	{
		if ( vert_speed < 0 ) image_index = 4; else image_index = 7;
	}
}
*/

