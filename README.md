## vGLFW

### Description
GLFW bindings for the V language.

### Documentation
Please follow the official [GLFW documentation](https://www.glfw.org/documentation.html)

**Notice**: The `GLFW_init()` function is called `initialize()` in V since `init` is reserved.
Also some of the functions are struct-oriented so you do `window.<function>` which is different from C.

### Install
`v install duarteroso.vglfw`

### Basic Usage
#### Simple example:
```v
module main

import duarteroso.vglfw as glfw

fn main() {
	//initialize the GLFW (name conversion causing init() isn't available at V)
	glfw.initialize()!

	//create the Window
	mut window := glfw.create_window_desc(glfw.WindowDesc{
		size: glfw.Size{
			width: 960
			height: 480
		}
		title: 'MyWindow'
	}, unsafe {nil}, unsafe { nil })!

	//make context current
	window.make_context_current()!

	//run the window loop
	for !(window.should_close()!) {
		/*
			<-- Here you can do the rendering stuff and so on.. -->
		 */
		glfw.poll_events()!
	}

	//terminate window after close/ending it
	glfw.terminate()!

	//exit the V program
	exit(0)
}

```

#### With Callbacks and App{} struct (get data from Callback to the Main/Struct):
```v
module main

import duarteroso.vglfw as glfw
import time

//create a App struct
struct App {
pub mut:
	main_window &glfw.GLFWwindow
	share_data []string //some data to share between callback and main()
}

fn main() {
	//initialize the GLFW (name conversion causing init() isn't available at V)
	glfw.initialize()!

	//create the Window
	mut window := glfw.create_window_desc(glfw.WindowDesc{
		size: glfw.Size{
			width: 960
			height: 480
		}
		title: 'MyWindow'
	}, unsafe {nil}, unsafe { nil })!

	//create App
	mut app := App{
		main_window: glfw.get_window_context_helper(window)
		share_data: []
	}

	//set user pointer to the app
	window.set_user_pointer(&app)!

	//set callback function for keyboard input
	window.set_key_callback(key_callback_function)!

	//make context current
	window.make_context_current()!

	//run the window loop
	for !(window.should_close()!) {
		/*
			<-- Here you can do the rendering stuff and so on.. -->
		 */

		//now print the data (which could come from callback) from the app struct and remove it afterwards
		for i, s in app.share_data {
			println(s)
			app.share_data.delete(i)
		}

		//poll for events like mouse clicks, key, etc
		glfw.poll_events()!
	}

	//terminate window after close/ending it
	glfw.terminate()!

	//exit the V program
	exit(0)
}

//callback function
fn key_callback_function(window &glfw.GLFWwindow, key int, scancode int, action int, mods int) {
	if key == glfw.glfw_key_enter && action == glfw.glfw_press {
		//if enter key pressed
		mut app := unsafe { &App(glfw.Window{window}.get_user_pointer() or {}) }
		//transfer the data to the app struct
		app.share_data << "Enter-key Pressed at ${time.now().str()}"
	}
}
```

### Authors
@duarteroso
(@noxomix made some small changes)

### License
[2-clause BSD License](https://opensource.org/licenses/BSD-2-Clause)
