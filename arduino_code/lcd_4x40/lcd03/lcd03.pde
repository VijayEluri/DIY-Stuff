#include <LiquidCrystal440.h>
uint8_t nRows = 4;      //number of rows on LCD
uint8_t nColumns =40;   //number of columns
uint8_t rw = 47;         //255 if rw is connected vs 47 (or 49 for the 24x2) in the examples below; it should be pulled to GND if not controlled by the interface.
LiquidCrystal lcd(12, 255, 11, 10,  5,4,3,2);

void setup(void) {
	lcd.begin(nColumns,nRows);     //this is absolutely needed with this arrangement on the Mega--power was not
                                       // applied to the LCD when it was initialized as lcd was instantiated above!!
	lcd.clear();                  // start with a blank screen
	lcd.setCursor(0,0);           // set cursor to column 0, row 0

	//======define charset
	uint8_t bell[8] = {0x4,0xe,0xe,0xe,0x1f,0x0,0x4};
	uint8_t note[8] = {0x2,0x3,0x2,0xe,0x1e,0xc,0x0};
	uint8_t clock[8] = {0x0,0xe,0x15,0x17,0x11,0xe,0x0};
	uint8_t heart[8] = {0x0,0xa,0x1f,0x1f,0xe,0x4,0x0};
	uint8_t duck[8] = {0x0,0xc,0x1d,0xf,0xf,0x6,0x0};
	uint8_t check[8] = {0x0,0x1,0x3,0x16,0x1c,0x8,0x0};
	uint8_t cross[8] = {0x0,0x1b,0xe,0x4,0xe,0x1b,0x0};
	uint8_t retarrow[8] = { 0x1,0x1,0x5,0x9,0x1f,0x8,0x4};
	
	
	lcd.createChar(0, bell);
	lcd.createChar(1, note);
	lcd.createChar(2, clock);
	lcd.createChar(3, heart);
	lcd.createChar(4, duck);
	lcd.createChar(5, check);
	lcd.createChar(6, cross);
	lcd.createChar(7, retarrow);
	lcd.home();
	
	int i = 0;
	lcd.clear();
	while (i<nRows) {
		lcd.setCursor(0,i);
		lcd.print("user:");
		for (int j=0; j<7; j++) {
			lcd.print(j, BYTE);
		}
		
		i++;
	}
}

void loop(void) {
}

