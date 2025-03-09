var stickInput = input_xy("left", "right", "up", "down"),
	dir = point_direction(0, 0, stickInput.x, -stickInput.y);

spiralIndex = ceil(string_length(characters)*dir/360)