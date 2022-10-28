#include <GLFW/glfw3.h>

void glfwGetVidModeSizeHelper(GLFWvidmode *vidmode, int *width, int *height)
{
    *width = (*vidmode).width;
    *height = (*vidmode).height;
}

void glfwGetVidModeRGBBitsHelper(GLFWvidmode *vidmode, int *r, int *g, int *b)
{
    *r = (*vidmode).redBits;
    *g = (*vidmode).greenBits;
    *b = (*vidmode).blueBits;
}

void glfwGetVidModeRefreshRateHelper(GLFWvidmode *vidmode, int *rate)
{
    *rate = (*vidmode).refreshRate;
}