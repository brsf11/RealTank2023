#ifndef _INFLATE_H_
#define _INFLATE_H_
#include<stdint.h>


typedef struct
{
    volatile uint32_t RDADDR;
    volatile uint32_t DMA_Start;
    volatile uint32_t FIFO_Flush;
    volatile uint32_t FIFO_cnt;
    volatile uint32_t FIFO_data;
}InflateStr;

#define Inflate_BASE 0x40004000
#define Inflate ((InflateStr *)Inflate_BASE)

void Decompress(const char* addr);

#endif
