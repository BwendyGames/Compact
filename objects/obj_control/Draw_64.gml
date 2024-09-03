draw_set_font(fnt_gui)
var sprite = panel_6
draw_sprite(sprite,1,0,0)
draw_text(110, 25,"$" + string(global.money))
draw_text(50, 60, " Moves: " + string(global.moves))
draw_set_font(fnt_main)