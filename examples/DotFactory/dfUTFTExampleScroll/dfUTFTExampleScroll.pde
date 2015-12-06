/* 
   The UTFT Dot Factory Fork
   This Sketch show allows you to use Fonts created by The Dot Faactory with the UTFT Forked Library
   The example shows you how to use the standard charMap, which is based off of the
   ASCII printable characters (character code 32-127). You can also define your own map. For example
   we use sevenSegcharMap, which is used to display 7 segement characters 0-9, : º.

   created 2015
   by Philip Vallone
   11 Nov 2015
   The UTFT Library (C)2012 Henning Karlsen
   http://www.henningkarlsen.com/electronics

  This example shows you how to implement the school for an ili9325
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

#include "character_map.h"
#include "arial_8pt.h"

// Scrolling
int ln = 10; // with this font 320/10 =32
int page = 1;

String str = "";
byte full = 0;

String inputString = "";         // a string to hold incoming data
boolean stringComplete = false;  // whether the string is complete

// Arduino Mega
UTFT tft(ILI9325D_16, RS, WR, CS, RST);

void setup() {

  tft.InitLCD(PORTRAIT);
  tft.clrScr();

  tft.setFont(arial_8ptBitmaps, arial_8ptDescriptors, 95);
  tft.setCharMap(charMap); // standard 95 ascii characters
  tft.prnt("LCD Scrolling Demo      ", 0 , 0);

  inputString.reserve(200);// reserve for input

}

void loop() {
  while (full == 0) {

    str = ">Line ";
    str += ln / 10;

    char charBuf[50];
    str.toCharArray(charBuf, 50);
    tft.prnt(charBuf, 0 , ln);

    delay(250);

    ln = ln + 10;
    if (ln > 310) {
      full = 1;
      ln = 10;
      page++;
      tft.scroll(ln);
      //delay(1);
    }
  } // fill the initial screen first

  for (int x = 0; x < 11; x+=5) {
    int temoLn = ln - 10;
    tft.scroll(temoLn + x);
    delay(50);

  }
  ln = ln + 10;
  if (ln > 320) {
    ln = 0;
    String strp = "";
    strp += "Page ";
    strp += page;
    strp += "            ";
    char charBuf[30];
    strp.toCharArray(charBuf, 30);
    tft.prnt(charBuf, 0 , 0);
    page++;

  }


}
