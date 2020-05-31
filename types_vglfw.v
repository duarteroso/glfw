module vglfw

//
pub struct Position {
pub mut:
	x int
	y int
}

//
pub struct Scale {
pub mut:
	x f32
	y f32
}

//
pub struct Size {
pub mut:
	width  int
	height int
}

//
pub struct Error {
pub mut:
	code int = 0
	msg  string = ''
}

//
pub struct Rect {
pub mut:
	left   int
	top    int
	right  int
	bottom int
}
