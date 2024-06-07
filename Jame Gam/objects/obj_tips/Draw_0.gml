/// @description Insert description here
// You can write your code in this editor

var _text = "Tips:\n" + tips;

draw_self();

draw_set_font(f_Menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_color(x, y, _text, c_orange, c_orange, c_orange, c_orange, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);