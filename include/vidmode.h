#include <GLFW/glfw3.h>

void vglfwGetVidModeSize(GLFWvidmode *vidmode, int *width, int *height)
{
    *width = (*vidmode).width;
    *height = (*vidmode).height;
}

void vglfwGetVidModeRGBBits(GLFWvidmode *vidmode, int *r, int *g, int *b)
{
    *r = (*vidmode).redBits;
    *g = (*vidmode).greenBits;
    *b = (*vidmode).blueBits;
}

void vglfwGetVidModeRefreshRate(GLFWvidmode *vidmode, int *rate)
{
    *rate = (*vidmode).refreshRate;
}