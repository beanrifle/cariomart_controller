#ifndef XBEE_H
#define XBEE_H

#include "drivers/mss_uart/mss_uart.h"

int game_enabled;

// Initialize xbee for interrupt reception and transmit
void XBEE_init(void);

// Send a string over the xbee
void XBEE_send(char* data);

// Handling of packet reception
void XBEE_rx_handler( mss_uart_instance_t * this_uart );

#endif
