#if defined(__AVR__)
#include <avr/pgmspace.h>
#define fontdatatype const uint8_t
#elif defined(__PIC32MX__)
#define PROGMEM
#define fontdatatype const unsigned char
#elif defined(__arm__)
#define PROGMEM
#define fontdatatype const unsigned char
#endif
// Font data for DSEG7 Classic 48pt
extern const unsigned char PROGMEM dSEG7Classic_48ptBitmaps[];
extern const unsigned int PROGMEM dSEG7Classic_48ptDescriptors[][3];

