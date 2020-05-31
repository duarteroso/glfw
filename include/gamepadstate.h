#include <GLFW/glfw3.h>
#include <string.h>

int vglfwGetGamepadState(int id, unsigned char *buttons, float *axes)
{
    GLFWgamepadstate state;
    if (glfwGetGamepadState(id, &state) == GLFW_FALSE)
    {
        return GLFW_FALSE;
    }
    //
    memcpy((void *)buttons, (void *)(state.buttons), sizeof(state.buttons));
    memcpy((void *)axes, (void *)(state.axes), sizeof(state.axes));
    return GLFW_TRUE;
}