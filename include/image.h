#include <GLFW/glfw3.h>
#include <string.h>

void vglfwCreateImage(GLFWimage *img, int width, int height, unsigned char *pixels)
{
    img->width = width;
    img->height = height;
    memcpy((void *)img->pixels, (void *)pixels, width * height);
}