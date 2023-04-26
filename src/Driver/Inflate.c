#include"Inflate.h"

void Decompress(const char* addr)
{
    Inflate->RDADDR = (uint32_t)addr;
    Inflate->DMA_Start = 1;
}
