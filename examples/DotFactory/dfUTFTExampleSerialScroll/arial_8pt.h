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
// Font data for Arial 8pt
extern const unsigned char PROGMEM arial_8ptBitmaps[];
extern const unsigned int PROGMEM arial_8ptDescriptors[][3];

