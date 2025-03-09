draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var xCenter = room_width/2, yCenter = room_height/2,
	i, currString, xSpiral, ySpiral;
for(i = 1; i < spiralSize+1; i++) {
	// Getting values
	var degAngle = 360*i/spiralSize,
		radAngle = degtorad(degAngle),
		currIndex = spiralIndex;
	
	// Setting values
	xSpiral = cos(radAngle)*spiralDefaultRadius + xCenter
	ySpiral = sin(radAngle)*spiralDefaultRadius + yCenter
	
	// Checking if the current string should be expanded
	currString = string_char_at(characters, i);
	switch currString {
		case "$":
			currString = "Erase"
			break;
		case "&":
			currString = "Validate"
			break;
	}
	
	// Actually drawing it to the screen
	draw_text_transformed(xSpiral, ySpiral, currString, 1, 1, -degAngle);
	if spiralIndex == i {
		draw_circle(xSpiral, ySpiral, 10, true);
	}
}

#region // Debug
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var printThese = [24, 25, 0, 1, 2];
var _movement = input_xy("left", "right", "up", "down");

draw_text(30, 10,$"X: {_movement.x}, Y: {_movement.y}");
draw_text(30, 20,$"Index: {spiralIndex}")
for(i = 0; i < array_length(printThese); i++)
	draw_text(10, 10*(i+1), string_char_at(characters, printThese[i]));
#endregion