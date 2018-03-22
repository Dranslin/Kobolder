/// @description Insert description here
// You can write your code in this editor

// Tilemap Collision Variables

var boundingBoxSide;
var getPixelBottomLeft, getPixelBottomRight, slope;

// Movement variables
// - up / + down
// - left / + right
	//key_up = -keyboard_check(ord("W"));
	//key_down = keyboard_check(ord("S")); 
	//key_jump_hold = keyboard_check(vk_space);
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_shift = keyboard_check(vk_shift);
key_jump = keyboard_check_pressed(vk_space);
key_attack = keyboard_check_pressed(ord("F"));


// Movement Calculations

	//var y_move = key_up + key_down + grav;
if (key_shift == 0) { x_move = (key_right - key_left) * walk_speed; }
	else { x_move = (key_right - key_left) * run_speed; }

getPixelBottomLeft = tilemap_get_at_pixel(collisionTileMap, bbox_left, bbox_bottom+1);
getPixelBottomRight = tilemap_get_at_pixel(collisionTileMap, bbox_right, bbox_bottom+1);

if (getPixelBottomLeft == 1) || (getPixelBottomRight == 1) { onGround = true; currentJump = 0; } 
	else { onGround = false; }
	
if (key_jump)
{
	if (onGround == true)
	{
		vert_speed = -jump_speed;
		currentJump++;
	}
	else if (currentJump < maxJumps)
	{
		vert_speed = -jump_speed;
		currentJump++;
	}
}

horiz_speed += x_move;
vert_speed += grav;

// Fractional Correction

// - Re-adding Fractionals
horiz_speed += horiz_speed_fractional;
vert_speed += vert_speed_fractional;

// - Storing Fractionals and Subtracting
horiz_speed_fractional = horiz_speed - floor(abs(horiz_speed)) * sign(horiz_speed);
vert_speed_fractional = vert_speed - floor(abs(vert_speed)) * sign(vert_speed);

horiz_speed -= horiz_speed_fractional;
vert_speed -= vert_speed_fractional;


// Collision Controls

// - Horizontal Collision
if (horiz_speed > 0) { boundingBoxSide = bbox_right; } 
	else { boundingBoxSide = bbox_left; }

if ((tilemap_get_at_pixel(collisionTileMap, boundingBoxSide + horiz_speed, bbox_top) != 0)  ||
	(tilemap_get_at_pixel(collisionTileMap, boundingBoxSide + horiz_speed, bbox_bottom) != 0) ) 
{
	 	if (horiz_speed < 0) { x = x - (x % tileSize) + (tileSize - 1) - (bbox_right - x); }
			else  { x = x - (x % tileSize) - (bbox_left - x); }
		horiz_speed = 0;
}

// - Vertical Collision

if (vert_speed > 0) { boundingBoxSide = bbox_bottom; } 
	else { boundingBoxSide = bbox_top ; }

if ((tilemap_get_at_pixel(collisionTileMap, bbox_left, boundingBoxSide + vert_speed) != 0)  ||
	(tilemap_get_at_pixel(collisionTileMap, bbox_right, boundingBoxSide + vert_speed) != 0) ) 
{
	 	if (vert_speed < 0) y = y - (y % tileSize) + (tileSize - 1) - (bbox_bottom - y);
					   else  y = y - (y % tileSize) - (bbox_top - y);
		vert_speed = 0;
}

x += horiz_speed;
y += vert_speed;

/* Old Code

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

*/

// Swipe attack

//if (key_attack) instance_create_layer(x, y, "Attack_Lyr", Swipe_Obj);



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

horiz_speed = 0;

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

