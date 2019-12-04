#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "xbee.h"
#include "utility.h"
#include "drivers/mss_ace/mss_ace.h"
#include "drivers/mss_gpio/mss_gpio.h"

ace_channel_handle_t adc_handler;

int main() {
	ACE_init();
	XBEE_init();
	MSS_GPIO_init();
	MSS_GPIO_config( MSS_GPIO_0 , MSS_GPIO_INPUT_MODE );

	// handler for ADC channel 2
	adc_handler = ACE_get_channel_handle((const uint8_t *)"ADCDirectInput_0");

	// Calibrate the accelerometer 659
	uint16_t center_position = 655;


	while(1){
		game_enabled = 1;
		if (game_enabled) {
			uint16_t adc_data = (ACE_get_ppe_sample(adc_handler) >> 2) - center_position + 335;
			uint32_t button_state = MSS_GPIO_get_inputs() & MSS_GPIO_0_MASK;
			char packet[20] = "2,";
			strcat(packet, (button_state) ? "1" : "0");
			strcat(packet, ",");
			char* adc_string = itoa(adc_data);
			strcat(packet, adc_string);
			free(adc_string);
			strcat(packet, "\r\n");
			XBEE_send(packet);
		}
	}

	return 0;
}
