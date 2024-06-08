/// @description Insert description here
// You can write your code in this editor

var _button_text = text;


if(active)
{

	draw_self();

	draw_set_font(f_Fancy_1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_color(x, y, _button_text, c_white, c_white, c_white, c_white, 1);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
