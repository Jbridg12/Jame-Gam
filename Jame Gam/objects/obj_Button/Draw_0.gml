/// @description Insert description here
// You can write your code in this editor

if(selected)
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_silver, 1);	
}
else
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}


draw_set_font(f_Menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_color(x, y, button_text, c_white, c_white, c_white, c_white, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
