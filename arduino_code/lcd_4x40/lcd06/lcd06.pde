#include <LiquidCrystal440.h>
uint8_t nRows = 4;      //number of rows on LCD
uint8_t nColumns =40;   //number of columns
uint8_t rw = 47;         //255 if rw is connected vs 47 (or 49 for the 24x2) in the examples below; it should be pulled to GND if not controlled by the interface.
LiquidCrystal lcd(12, 255, 11, 10,  5,4,3,2);

	byte char0[8] = {
	  B00001,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	};


	byte char1[8] = {
	  B01000,
	  B11000,
	  B10100,
	  B01100,
	  B01010,
	  B00110,
	  B00100,
	  B00000,
	};


	byte char2[8] = {
	  B00111,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00010,
	  B00000,
	  B00000,
	};


	byte char3[8] = {
	  B10111,
	  B00111,
	  B00111,
	  B00111,
	  B01110,
	  B01110,
	  B11110,
	  B11100,
	};


	byte char4[8] = {
	  B00001,
	  B00001,
	  B00001,
	  B00001,
	  B10000,
	  B11111,
	  B11111,
	  B01111,
	};


	byte char5[8] = {
	  B00000,
	  B00001,
	  B00000,
	  B00000,
	  B00011,
	  B11111,
	  B11111,
	  B11100,
	};


	byte char6[8] = {
	  B00001,
	  B00011,
	  B00111,
	  B11111,
	  B11110,
	  B11100,
	  B10000,
	  B00000,
	};


	byte char7[8] = {
	  B11100,
	  B11000,
	  B10000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	};


void setup(void) {
	lcd.begin(nColumns, nRows);
        lcd.clear();
        lcd.home();

	lcd.createChar(0, char0);
	lcd.createChar(1, char1);
	lcd.createChar(2, char2);
	lcd.createChar(3, char3);

	lcd.createChar(4, char4);
	lcd.createChar(5, char5);
	lcd.createChar(6, char6);
	lcd.createChar(7, char7);

        int i = 0;
        for (int y=0; y<2; y++) {
          for (int x=0; x<4; x++) {
            lcd.setCursor(x, y);
            lcd.write(i);
            
            i++;
          }
        }
}

void loop(void) {
}

