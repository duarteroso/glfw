#include <GLFW/glfw3.h>
#include <string.h>

void vglfwGetGammaRampSize(GLFWgammaramp *gr, unsigned int *size)
{
    *size = (*gr).size;
}

void vglfwGetGammaRampRGBBits(GLFWgammaramp *gr, unsigned short **r, unsigned short **g, unsigned short **b)
{
    unsigned int size = 0;
    vglfwGetGammaRampSize(gr, &size);
    //
    memcpy((void *)(*r), (void *)(gr->red), size * sizeof(unsigned short));
    memcpy((void *)(*g), (void *)(gr->green), size * sizeof(unsigned short));
    memcpy((void *)(*b), (void *)(gr->blue), size * sizeof(unsigned short));
}

void vglfwGetGammaRampRGBBit(GLFWgammaramp *gr, int index, unsigned short *r, unsigned short *g, unsigned short *b)
{
    *r = (*gr).red[index];
    *g = (*gr).green[index];
    *b = (*gr).blue[index];
}

GLFWgammaramp *vglfwCreateGammaRamp(unsigned int size, unsigned short *r, unsigned short *g, unsigned short *b)
{
    GLFWgammaramp gr;
    gr.size = size;
    gr.red = r;
    gr.green = g;
    gr.blue = b;
    return &gr;
}