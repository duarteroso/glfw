#include <GLFW/glfw3.h>
#include <string.h>

void glfwCreateImageHelper(GLFWimage *img, int width, int height, uint8_t *pixels)
{
    img->width = width;
    img->height = height;
    memcpy((void *)img->pixels, (void *)pixels, width * height);
}