module glfw

fn test_create_image() {
	width := 8
	height := 8
	pixels := []u8{len: width * height, init: 255}
	//
	img := create_image(width, height, pixels)
	assert img.width() == width
	assert img.height() == height
	assert img.pixels() == pixels
}
