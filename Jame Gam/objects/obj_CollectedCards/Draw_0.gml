/// @description Insert description here
// You can write your code in this editor

var _text = string("{0}", collectedCards);

if(collectedCards > 0)
{
	draw_self();
}

draw_set_font(f_Fancy_1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_color(x, y + sprite_height/1.3, _text, c_white, c_white, c_white, c_white, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);