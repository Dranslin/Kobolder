/// @description Insert description here
// You can write your code in this editor

if (hasHit == 0) 
{
	show_debug_message("Hit Detected");
	other.blockHealth--;
	if (other.blockHealth > 0) other.image_index++; else instance_destroy(other.Block_Obj);
	hasHit = 1;
}

