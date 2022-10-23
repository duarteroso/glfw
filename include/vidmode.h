#include <GLFW/glfw3.h>

void glfwGetVidModeSize(GLFWvidmode *vidmode, int *width, int *height)
{
    *width = (*vidmode).width;
    *height = (*vidmode).height;
}

void glfwGetVidModeRGBBits(GLFWvidmode *vidmode, int *r, int *g, int *b)
{
    *r = (*vidmode).redBits;
    *g = (*vidmode).greenBits;
    *b = (*vidmode).blueBits;
}

void glfwGetVidModeRefreshRate(GLFWvidmode *vidmode, int *rate)
{
    *rate = (*vidmode).refreshRate;
}