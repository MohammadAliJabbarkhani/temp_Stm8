#include "stm8s.h"
#include "stm8s_conf.h"

void delay_ms(uint32_t ms) {
	u32 i;
  for (i = 0; i < ms * 16000; i++) {
    _asm("nop");
  }
}

void main(void) {
  // Initialize the clock (???????? ???? ?? ??????????)
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);

  // Set PD0 as output
  GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);

  while (1) {
    GPIO_WriteReverse(GPIOD, GPIO_PIN_4); // Toggle LED
    delay_ms(500);
  }
}
