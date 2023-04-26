#ifndef _ASSET_H_
#define _ASSET_H_

#include<stdint.h>

static const uint16_t black[]={0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
					           0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                               0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000};

static const uint16_t box[]={0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                             0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
					         0x4146, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 
                             0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0x4146, 
					         0x4146, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 
                             0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0x4146, 
					         0x4146, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 
                             0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0x4146, 
					         0x4146, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 
                             0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x4146, 
					         0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                             0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
					         0x4146, 0xe52e, 0xeeb5, 0x4146, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 
                             0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x4146, 0xeeb5, 0xe52e, 0x4146, 
					         0x4146, 0xe52e, 0xeeb5, 0x4146, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 
                             0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0x4146, 0xeeb5, 0xe52e, 0x4146, 
					         0x4146, 0xe52e, 0xeeb5, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                             0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0xeeb5, 0xe52e, 0x4146, 
					         0x4146, 0xe52e, 0xeeb5, 0x4146, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 
                             0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0x4146, 0xeeb5, 0xe52e, 0x4146, 
					         0x4146, 0xe52e, 0xeeb5, 0x4146, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 
                             0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0x4146, 0xeeb5, 0xe52e, 0x4146, 
					         0x4146, 0xe52e, 0xeeb5, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                             0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0xeeb5, 0xe52e, 0x4146, 
					         0x4146, 0xe52e, 0xeeb5, 0x4146, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 
                             0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x4146, 0xeeb5, 0xe52e, 0x4146, 
					         0x4146, 0xe52e, 0xeeb5, 0x4146, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 
                             0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0x4146, 0xeeb5, 0xe52e, 0x4146, 
					         0x4146, 0xe52e, 0xeeb5, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                             0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0xeeb5, 0xe52e, 0x4146, 
					         0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                             0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
					         0x4146, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 
                             0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0xeeb5, 0x4146, 
					         0x4146, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 
                             0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0xe52e, 0x4146, 
					         0x4146, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 
                             0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x71e7, 0x4146, 
					         0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                             0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146};

static const uint16_t wall[]={0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                              0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                              0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                              0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                              0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 
                              0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 
                              0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 
                              0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 
                              0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 
                              0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                              0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 
                              0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                              0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 0x4146, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 
                              0xa126, 0xa126, 0xa126, 0x4146, 0xa126, 0xa126, 0xa126, 0xa126, 0x4146, 0xa126};

static const uint16_t tank01[]={0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x4449, 
                                0x4449, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x4449, 
                                0x4449, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x2ae8, 0x2ae8, 0x2ae8, 0x0000, 0x4449, 
                                0x4449, 0x0000, 0x2ae8, 0x2ae8, 0x2ae8, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x4449, 0x4449, 0x2ae8, 0x4449, 
                                0x4449, 0x2ae8, 0x4449, 0x4449, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x664a, 0x2ae8, 0x2ae8, 0x4449, 
                                0x4449, 0x2ae8, 0x2ae8, 0x664a, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x664a, 0x2ae8, 0x19e8, 0x4449, 
                                0x4449, 0x19e8, 0x2ae8, 0x664a, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x664a, 0x2ae8, 0x19e8, 0x4449, 
                                0x4449, 0x19e8, 0x2ae8, 0x664a, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x664a, 0x2ae8, 0x19e8, 0x4449, 
                                0x4449, 0x19e8, 0x2ae8, 0x664a, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x664a, 0x2ae8, 0x19e8, 0x19e8, 
                                0x19e8, 0x19e8, 0x2ae8, 0x664a, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x664a, 0x2ae8, 0x19e8, 0x19e8, 
                                0x19e8, 0x19e8, 0x2ae8, 0x664a, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x664a, 0x2ae8, 0x19e8, 0x2ae8, 
                                0x2ae8, 0x19e8, 0x2ae8, 0x664a, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x664a, 0x2ae8, 0x2ae8, 0x2ae8, 
                                0x2ae8, 0x2ae8, 0x2ae8, 0x664a, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x664a, 0x4449, 0x4449, 0x4449, 
                                0x4449, 0x4449, 0x4449, 0x664a, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x4449, 0x4449, 0x4449, 0x2ae8, 0x2ae8, 
                                0x2ae8, 0x2ae8, 0x4449, 0x4449, 0x4449, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x2ae8, 0x2ae8, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2ae8, 0x2ae8, 0x2ae8, 0x2ae8, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000};

static const uint16_t tank02[]={0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x7bc6, 
                                0x7bc6, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x7bc6, 
                                0x7bc6, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0x2d3a, 0x2d3a, 0x2d3a, 0x0000, 0x7bc6, 
                                0x7bc6, 0x0000, 0x2d3a, 0x2d3a, 0x2d3a, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0xf68c, 0xf68c, 0x515b, 0x7bc6, 
                                0x7bc6, 0x515b, 0xf68c, 0xf68c, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0x7bc6, 0x515b, 0x515b, 0x7bc6, 
                                0x7bc6, 0x515b, 0x515b, 0x7bc6, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0x7bc6, 0x515b, 0x2d3a, 0x7bc6, 
                                0x7bc6, 0x2d3a, 0x515b, 0x7bc6, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0x7bc6, 0x515b, 0x2d3a, 0x7bc6, 
                                0x7bc6, 0x2d3a, 0x515b, 0x7bc6, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0x7bc6, 0x515b, 0x2d3a, 0x7bc6, 
                                0x7bc6, 0x2d3a, 0x515b, 0x7bc6, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0x7bc6, 0x515b, 0x2d3a, 0x2d3a, 
                                0x2d3a, 0x2d3a, 0x515b, 0x7bc6, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0x7bc6, 0x515b, 0x2d3a, 0x2d3a, 
                                0x2d3a, 0x2d3a, 0x515b, 0x7bc6, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0x7bc6, 0x515b, 0x2d3a, 0x515b, 
                                0x515b, 0x2d3a, 0x515b, 0x7bc6, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0x7bc6, 0x515b, 0x515b, 0x515b, 
                                0x515b, 0x515b, 0x515b, 0x7bc6, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0x7bc6, 0xf68c, 0xf68c, 0xf68c, 
                                0xf68c, 0xf68c, 0xf68c, 0x7bc6, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0xf68c, 0xf68c, 0xf68c, 0x2d3a, 0x2d3a, 
                                0x2d3a, 0x2d3a, 0xf68c, 0xf68c, 0xf68c, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0x2d3a, 0x2d3a, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x2d3a, 0x2d3a, 0x2d3a, 0x2d3a, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 
                                0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000};

static const char Music_1[]   ={ 0x16,0x03,0x21,0x03,0x23,0x03,0x26,0x03,
                    0x31,0x03,0x33,0x03,0x17,0x03,0x22,0x03,
                    0x25,0x03,0x27,0x03,0x12,0x03,0x15,0x03,
                    0x21,0x03,0x23,0x03,0x26,0x03,0x31,0x03,
                    0x33,0x03,0x36,0x03,0x32,0x03,0x33,0x03,
                    0x35,0x04,0x33,0x04,0x32,0x03,0x27,0x03,
                    0x25,0x03,0x16,0x03,0x21,0x03,0x23,0x03,
                    0x26,0x03,0x31,0x03,0x33,0x03,0x17,0x03,
                    0x22,0x03,0x25,0x03,0x27,0x03,0x32,0x03,
                    0x35,0x03,0x21,0x03,0x23,0x03,0x26,0x03,
                    0x31,0x03,0x33,0x03,0x36,0x03,0x32,0x03,
                    0x33,0x03,0x35,0x04,0x33,0x04,0x32,0x03,
                    0x27,0x03,0x25,0x03,0x26,0x02,0x33,0x02,
                    0x33,0x02,0x27,0x02,0x33,0x02,0x33,0x02,
                    0x31,0x02,0x33,0x02,0x33,0x02,0x32,0x03,
                    0x33,0x03,0x35,0x04,0x33,0x04,0x27,0x03,
                    0x25,0x03,0x26,0x02,0x33,0x02,0x33,0x02,
                    0x27,0x02,0x33,0x02,0x33,0x02,0x24,0x03,
                    0x26,0x03,0x32,0x03,0x34,0x03,0x35,0x03,
                    0x34,0x03,0x37,0x02,0x36,0x01,0x33,0x02,
                    0x26,0x03,0x27,0x03,0x31,0x03,0x33,0x03,
                    0x32,0x02,0x25,0x02,0x32,0x02,0x31,0x02,
                    0x27,0x03,0x31,0x03,0x27,0x03,0x25,0x03,
                    0x23,0x02,0x26,0x02,0x26,0x02,0x33,0x02,
                    0x26,0x03,0x27,0x03,0x31,0x03,0x35,0x03,
                    0x34,0x02,0x32,0x02,0x32,0x03,0x33,0x03,
                    0x31,0x03,0x27,0x03,0x25,0x03,0x27,0x02,
                    0x26,0x00,0x33,0x02,0x26,0x03,0x27,0x03,
                    0x31,0x03,0x33,0x03,0x32,0x02,0x25,0x02,
                    0x32,0x02,0x31,0x02,0x27,0x03,0x31,0x03,
                    0x27,0x03,0x25,0x03,0x23,0x02,0x26,0x02,
                    0x26,0x02,0x33,0x02,0x26,0x03,0x27,0x03,
                    0x31,0x03,0x35,0x03,0x34,0x02,0x32,0x02,
                    0x32,0x03,0x33,0x03,0x31,0x03,0x27,0x03,
                    0x25,0x02,0x27,0x02,0x26,0x00,0x00,0x00 };

static const char Music_2[]   ={ 0x00,0x04,0x16,0x04,0x16,0x04,0x26,0x03,
                    0x23,0x03,0x22,0x04,0x00,0x04,0x22,0x03,
                    0x21,0x04,0x21,0x04,0x16,0x04,0x21,0x04,
                    0x22,0x04,0x15,0x04,0x15,0x04,0x26,0x03,
                    0x23,0x03,0x22,0x04,0x00,0x04,0x22,0x03,
                    0x21,0x04,0x21,0x04,0x16,0x04,0x21,0x04,
                    0x22,0x04,0x14,0x04,0x14,0x04,0x26,0x03,
                    0x23,0x03,0x22,0x04,0x00,0x04,0x22,0x03,
                    0x21,0x04,0x21,0x04,0x16,0x04,0x21,0x04,
                    0x22,0x04,0x14,0x04,0x14,0x04,0x26,0x03,
                    0x23,0x03,0x22,0x04,0x00,0x04,0x22,0x03,
                    0x21,0x04,0x21,0x04,0x16,0x04,0x21,0x04,
                    0x22,0x04,0x31,0x03,0x31,0x04,0x31,0x04,
                    0x00,0x04,0x31,0x03,0x31,0x04,0x31,0x04,
                    0x26,0x03,0x26,0x04,0x26,0x02,0x31,0x03,
                    0x31,0x04,0x31,0x04,0x00,0x04,0x32,0x03,
                    0x32,0x04,0x32,0x04,0x32,0x05,0x33,0x05,
                    0x32,0x05,0x31,0x04,0x26,0x04,0x31,0x04,
                    0x32,0x04,0x00,0x03,0x31,0x03,0x31,0x04,
                    0x31,0x04,0x00,0x04,0x32,0x03,0x32,0x04,
                    0x00,0x04,0x33,0x03,0x35,0x04,0x35,0x04,
                    0x33,0x03,0x36,0x03,0x36,0x03,0x36,0x04,
                    0x33,0x04,0x36,0x04,0x35,0x04,0x35,0x02,
                    0x00,0x02,0x31,0x03,0x31,0x04,0x31,0x04,
                    0x00,0x04,0x31,0x03,0x31,0x04,0x31,0x04,
                    0x26,0x03,0x26,0x04,0x26,0x02,0x31,0x03,
                    0x31,0x04,0x31,0x04,0x00,0x04,0x31,0x03,
                    0x26,0x04,0x00,0x04,0x31,0x03,0x27,0x04,
                    0x00,0x04,0x26,0x04,0x25,0x03,0x36,0x03,
                    0x33,0x03,0x32,0x03,0x31,0x03,0x35,0x03,
                    0x32,0x03,0x31,0x03,0x27,0x03,0x24,0x03,
                    0x25,0x04,0x24,0x04,0x00,0x04,0x26,0x03,
                    0x27,0x04,0x27,0x02,0x00,0x02,0x00,0x02,
                    0x26,0x04,0x24,0x04,0x26,0x04,0x27,0x04,
                    0x31,0x04,0x27,0x04,0x26,0x04,0x32,0x05,
                    0x32,0x05,0x31,0x05,0x26,0x05,0x26,0x03,
                    0x27,0x02,0x27,0x02,0x27,0x04,0x33,0x03,
                    0x33,0x04,0x35,0x03,0x33,0x04,0x32,0x04,
                    0x32,0x04,0x31,0x04,0x26,0x04,0x27,0x04,
                    0x31,0x03,0x32,0x03,0x33,0x03,0x35,0x03,
                    0x35,0x03,0x32,0x03,0x32,0x04,0x32,0x04,
                    0x31,0x04,0x32,0x04,0x32,0x01,0x16,0x03,
                    0x17,0x03,0x21,0x03,0x26,0x03,0x25,0x02,
                    0x23,0x02,0x22,0x02,0x23,0x02,0x25,0x02,
                    0x23,0x02,0x26,0x01,0x33,0x04,0x32,0x04,
                    0x32,0x04,0x31,0x04,0x31,0x04,0x27,0x04,
                    0x26,0x04,0x26,0x04,0x22,0x01,0x24,0x01,
                    0x00,0x00};

static const char Sound[]     ={ 0x32,0x02,0x00,0x00};

static const char testpic[] = {0xc6,0x11,0x60,0x43,0x38,0x03,0x96,0x4b,0x9c,0x9f,0xfa,0xf9,0xf9,0xf9,0xf9,0xf9,0x7d,0x06};

#endif
