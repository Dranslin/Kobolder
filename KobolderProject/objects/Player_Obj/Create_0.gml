/// @description Insert description here
// You can write your code in this editor

// Global
tileSize = 64;


// Sprite Reference
sprite_index = PlayerAnim_Spr;
image_speed = 0;


// Gravity setup
horiz_speed = 0;
vert_speed = 0;
grav = 0.4;
walk_speed = 2;
run_speed = 5;
jump_speed = 10;


// Fractional Correction
horiz_speed_final = 0;
horiz_speed_fractional = 0;

vert_speed_final = 0;
vert_speed_fractional = 0;


// Double-Jump
onGround = false;
maxJumps = 2;
currentJump = 0;

// Tilemap reference
collisionTileMap = layer_tilemap_get_id("Collision_Lyr");