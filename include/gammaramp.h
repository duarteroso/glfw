#include <stdlib.h>
#include <GLFW/glfw3.h>
#include <string.h>

void glfwGetGammaRampRGBBitsHelper(GLFWgammaramp *gr, unsigned short **r, unsigned short **g, unsigned short **b)
{
    unsigned int size = (*gr).size;
    //
    memcpy((void *)(*r), (void *)(gr->red), size * sizeof(unsigned short));
    memcpy((void *)(*g), (void *)(gr->green), size * sizeof(unsigned short));
    memcpy((void *)(*b), (void *)(gr->blue), size * sizeof(unsigned short));
}

void glfwGetGammaRampRGBBitHelper(GLFWgammaramp *gr, int index, unsigned short *r, unsigned short *g, unsigned short *b)
{
    *r = (*gr).red[index];
    *g = (*gr).green[index];
    *b = (*gr).blue[index];
}
