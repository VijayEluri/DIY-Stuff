#include <LiquidCrystal440.h>
uint8_t nRows = 4;
uint8_t nColumns = 0;
uint8_t rw = 47;

//                rs, rw, en1,en2, d4, d5, d6, d7
LiquidCrystal lcd(12, 255, 11, 10,  5, 4, 3, 2);

void setup()
{
  lcd.begin(nColumns, nRows);
  lcd.clear();
  lcd.home();

  loadchars();

  printbigchar(0, 0, 0);
}

void loop() {}
