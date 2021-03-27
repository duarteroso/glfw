module vglfw

// Position
pub struct Position {
pub mut:
	x int
	y int
}

// Scale
pub struct Scale {
pub mut:
	x f32
	y f32
}

// Size
pub struct Size {
pub mut:
	width  int
	height int
}

// Rect represents the dimensions of a Window
pub struct Rect {
pub mut:
	left   int
	top    int
	right  int
	bottom int
}