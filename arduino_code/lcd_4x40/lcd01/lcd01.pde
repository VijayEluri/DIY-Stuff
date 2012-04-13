#include <LiquidCrystal440.h>
uint8_t nRows = 4;      //number of rows on LCD
uint8_t nColumns =40;   //number of columns

LiquidCrystal lcd(12, 255, 11, 10,  5,4,3,2);

void setup(){
  lcd.begin(nColumns, nRows);
  lcd.clear();
  lcd.setCursor(0,0);
  
//  Serial.begin(9600);
}

void loop(){
  lcd.setCursor(0,0);
  lcd.print('1');
  lcd.setCursor(nColumns-1,nRows-1);
  lcd.print('4');
  lcd.setCursor(nColumns-1,0);
  lcd.print('2');
  lcd.setCursor(0,nRows-1);
  lcd.print('3');
  
  lcd.setCursor(17, 1);
  lcd.print("Hello");
  lcd.setCursor(16, 2);
  lcd.print("World!!");
}

