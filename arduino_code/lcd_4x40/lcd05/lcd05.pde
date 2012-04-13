#include <LiquidCrystal440.h>
uint8_t nRows = 4;      //number of rows on LCD
uint8_t nColumns =40;   //number of columns
uint8_t rw = 47;         //255 if rw is connected vs 47 (or 49 for the 24x2) in the examples below; it should be pulled to GND if not controlled by the interface.
LiquidCrystal lcd(12, 255, 11, 10,  5,4,3,2);

	byte char0[8] = {
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00001,
	  B00011,
	  B00111,
	};


	byte char1[8] = {
	  B00000,
	  B00001,
	  B00111,
	  B01111,
	  B11111,
	  B11100,
	  B11000,
	  B10000,
	};


	byte char2[8] = {
	  B00111,
	  B11111,
	  B11111,
	  B11000,
	  B00000,
	  B00000,
	  B10000,
	  B00000,
	};


	byte char3[8] = {
	  B11110,
	  B11111,
	  B11111,
	  B00001,
	  B10000,
	  B10000,
	  B10000,
	  B10000,
	};


	byte char4[8] = {
	  B00000,
	  B11000,
	  B11110,
	  B11111,
	  B01111,
	  B00011,
	  B10001,
	  B00000,
	};


	byte char5[8] = {
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B10000,
	  B11000,
	  B11100,
	  B11110,
	};


	byte char6[8] = {
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	};


	byte char7[8] = {
	  B00111,
	  B01111,
	  B01110,
	  B01110,
	  B11100,
	  B11100,
	  B11100,
	  B11101,
	};


	byte char8[8] = {
	  B00000,
	  B00001,
	  B01000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B11100,
	};


	byte char9[8] = {
	  B10000,
	  B01000,
	  B10100,
	  B01010,
	  B00101,
	  B00010,
	  B00001,
	  B00000,
	};


	byte char10[8] = {
	  B00000,
	  B00000,
	  B00000,
	  B00001,
	  B00010,
	  B10100,
	  B01000,
	  B10100,
	};


	byte char11[8] = {
	  B00100,
	  B01000,
	  B10001,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00011,
	};


	byte char12[8] = {
	  B01110,
	  B01111,
	  B00111,
	  B00111,
	  B00011,
	  B00011,
	  B00011,
	  B11011,
	};


	byte char13[8] = {
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B10000,
	  B10000,
	  B10000,
	  B10000,
	};


	byte char14[8] = {
	  B11100,
	  B11100,
	  B11100,
	  B01110,
	  B01110,
	  B01111,
	  B00111,
	  B00111,
	};


	byte char15[8] = {
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B01000,
	  B00000,
	  B00000,
	  B10000,
	};


	byte char16[8] = {
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	};


	byte char17[8] = {
	  B01100,
	  B01010,
	  B00110,
	  B00101,
	  B00011,
	  B00010,
	  B00000,
	  B10000,
	};


	byte char18[8] = {
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00001,
	  B00000,
	  B00000,
	  B00000,
	};


	byte char19[8] = {
	  B00011,
	  B00011,
	  B00011,
	  B00111,
	  B00111,
	  B01111,
	  B01110,
	  B11110,
	};


	byte char20[8] = {
	  B10000,
	  B10000,
	  B10000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	};


	byte char21[8] = {
	  B00011,
	  B00001,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	};


	byte char22[8] = {
	  B11000,
	  B11100,
	  B11111,
	  B01111,
	  B00111,
	  B00001,
	  B00000,
	  B00000,
	};


	byte char23[8] = {
	  B10000,
	  B00000,
	  B00000,
	  B11000,
	  B11111,
	  B11111,
	  B00111,
	  B00000,
	};


	byte char24[8] = {
	  B10000,
	  B10000,
	  B10000,
	  B00001,
	  B11111,
	  B11111,
	  B11110,
	  B00000,
	};


	byte char25[8] = {
	  B10001,
	  B00011,
	  B01111,
	  B11111,
	  B11110,
	  B11000,
	  B00000,
	  B00000,
	};


	byte char26[8] = {
	  B11100,
	  B11000,
	  B10000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	};


	byte char27[8] = {
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	  B00000,
	};


void setup(void) {
	lcd.begin(nColumns, nRows);
}

void loop(void) {
	lcd.home();

        int y = 0; 
        
	lcd.createChar(0, char0);
	lcd.createChar(1, char1);
	lcd.createChar(2, char2);
	lcd.createChar(3, char3);
	lcd.createChar(4, char4);
	lcd.createChar(5, char5);
	lcd.createChar(6, char6);

        for (int x=0; x<7; x++) {
          lcd.setCursor(x, y);
          lcd.write(x);
        }
        y++;

	lcd.createChar(0, char7);
	lcd.createChar(1, char8);
	lcd.createChar(2, char9);
	lcd.createChar(3, char10);
	lcd.createChar(4, char11);
	lcd.createChar(5, char12);
	lcd.createChar(6, char13);

        for (int x=0; x<7; x++) {
          lcd.setCursor(x, y);
          lcd.write(x);
        }
        y++;

	lcd.createChar(0, char14);
	lcd.createChar(1, char15);
	lcd.createChar(2, char16);
	lcd.createChar(3, char17);
	lcd.createChar(4, char18);
	lcd.createChar(5, char19);
	lcd.createChar(6, char20);

        for (int x=0; x<7; x++) {
          lcd.setCursor(x, y);
          lcd.write(x);
        }
        y++;

	lcd.createChar(0, char21);
	lcd.createChar(1, char22);
	lcd.createChar(2, char23);
	lcd.createChar(3, char24);
	lcd.createChar(4, char25);
	lcd.createChar(5, char26);
	lcd.createChar(6, char27);

        for (int x=0; x<7; x++) {
          lcd.setCursor(x, y);
          lcd.write(x);
        }
}

