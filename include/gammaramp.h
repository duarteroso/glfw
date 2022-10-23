#include <stdlib.h>
#include <GLFW/glfw3.h>
#include <string.h>

void glfwGetGammaRampSize(GLFWgammaramp *gr, unsigned int *size)
{
    *size = (*gr).size;
}

void glfwGetGammaRampRGBBits(GLFWgammaramp *gr, unsigned short **r, unsigned short **g, unsigned short **b)
{
    unsigned int size = 0;
    glfwGetGammaRampSize(gr, &size);
    //
    memcpy((void *)(*r), (void *)(gr->red), size * sizeof(unsigned short));
    memcpy((void *)(*g), (void *)(gr->green), size * sizeof(unsigned short));
    memcpy((void *)(*b), (void *)(gr->blue), size * sizeof(unsigned short));
}

void glfwGetGammaRampRGBBit(GLFWgammaramp *gr, int index, unsigned short *r, unsigned short *g, unsigned short *b)
{
    *r = (*gr).red[index];
    *g = (*gr).green[index];
    *b = (*gr).blue[index];
}

void glfwCreateGammaRamp(GLFWgammaramp *gr, unsigned int size, unsigned short *r, unsigned short *g, unsigned short *b)
{
    gr->size = size;
    gr->red = r;
    gr->green = g;
    gr->blue = b;
}