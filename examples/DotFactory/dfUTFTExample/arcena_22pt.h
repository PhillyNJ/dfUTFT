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

// Font data for AR CENA 22pt
extern const unsigned char PROGMEM arcena_22ptBitmaps[];
extern const unsigned int PROGMEM arcena_22ptDescriptors[][3];

