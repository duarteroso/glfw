#include <GLFW/glfw3.h>
#include <string.h>

GLFWimage *vglfwCreateImage(int width, int height, unsigned char *pixels)
{
    GLFWimage img;
    img.width = width;
    img.height = height;
    /*
    for (int i = 0; i < height; ++i)
    {
        for (int j = 0; j < width; ++j)
        {
            img.pixels[i * height + j] = pixels[i * height + j];
        }
    }
    */
    memcpy((void *)img.pixels, (void *)pixels, width * height);
    return &img;
}