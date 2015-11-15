/* Works :)
 * The UTFT Dot Factory Fork
 * This Sketch show allows you to use Fonts created by The Dot Faactory with the UTFT Forked Library
 * The example shows you how to use the standard charMap, which is based off of the 
 * ASCII printable characters (character code 32-127). You can also define your own map. For example
 * we use sevenSegcharMap, which is used to display 7 segement characters 0-9, : º. 
 *
 * created 2015
 * by Philip Vallone
 * 11 Nov 2015
 * The UTFT Library (C)2012 Henning Karlsen
 * http://www.henningkarlsen.com/electronics
 */

#include <UTFT.h>
#include <stdint.h>
#include <avr/pgmspace.h>

#if defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
#define RS 38
#define WR 39
#define CS 40
#define RST 41

#else
#define RS 19
#define WR 18
#define CS 17
#define RST 16

#endif

#include "Arcena_22pt.h"
#include "character_map.h"
#include "seven_seg_df.h"
#include "arial_8pt.h"

// Arduino Mega
UTFT myGLCD(ILI9325D_16, RS, WR, CS, RST);

void setup() {

  myGLCD.InitLCD();
  myGLCD.clrScr();

  // Example AR CENA 22pt font
  myGLCD.setFont(arcena_22ptBitmaps, arcena_22ptDescriptors, 95);
  myGLCD.setCharMap(charMap); // standard 95 ascii characters
  myGLCD.setColor(238, 250, 17);
  myGLCD.prnt("AR CENA 22pt!!!", 0 , 0);

  // Custom Char Example sevenSegcharMap, which is used to display 7 segement characters 0-9, : º
  myGLCD.setFont(dSEG7Classic_48ptBitmaps, dSEG7Classic_48ptDescriptors, 95);
  myGLCD.setCharMap(sevenSegcharMap); // custom mapping
  myGLCD.setColor(255, 255, 255);
  myGLCD.prnt("1 2:0 0", 0 , 100);

  // small 8pt font
  myGLCD.setFont(arial_8ptBitmaps, arial_8ptDescriptors, 95);
  myGLCD.setCharMap(charMap); // standard 95 ascii characters
  myGLCD.setColor(255, 255, 17);
  myGLCD.prnt("Small Font Arial 8pt", 0 , 200);
}

void loop() {
  // put your main code here, to run repeatedly:

}
