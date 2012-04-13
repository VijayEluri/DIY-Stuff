#include "LedControl.h"
#include <OneWire.h>
#include <DallasTemperature.h>
#include <VirtualWire.h>

#define ONE_WIRE_BUS 3

OneWire oneWire(ONE_WIRE_BUS);
LedControl lc=LedControl(12,11,10,1);
DallasTemperature sensors(&oneWire);

DeviceAddress termometr;
// = { 0x28, 0x06, 0xFA, 0xA6, 0x02, 0x00, 0x00, 0x58 }; // kuchnia
// = { 0x28, 0x73, 0xCA, 0x14, 0x03, 0x00, 0x00, 0x92 }; // pokoj

void setup() 
{
  Serial.begin(9600);
  randomSeed(analogRead(0));
  
  vw_setup(2000);
  
//  sensors.begin();
//  if (!sensors.getAddress(termometr, 0))
//  {
//    while(1) { }
//  }
//  sensors.setResolution(termometr, 12);

  lc.shutdown(0, false);
  lc.setIntensity(0, 8);
  lc.clearDisplay(0);
}

void loop(void)
{ 
//  delay(20000);
  delay(2000);

//  sensors.requestTemperatures();

//  float temp = sensors.getTempC(termometr);
  float temp = random(50);
  Serial.println("Random: ");
  Serial.println(temp);
//  char charTemp[];
  printNumber(temp);
  
//  Serial.println(charTemp);
  
//  vw_send((byte *)temp, intlen(temp));
}

int intlen(float start) 
{
  int end = 0;
  while(start >= 1) 
  {
    start = start/10;
    end++;
  } 
  return end; 
}

char* printNumber(float v)
{
  boolean negative = false;

  // check against negative value
  if (v < 0)
  {
    negative = true;
  }

  // we accept only positive values
  v = abs(v);

  // round magic
  v = v + 0.05;

  // multiplication by 10 to keep precision, then cast to integer
  int temp = (int) (v * 10);  

  // DEBUG
  Serial.println("Temp int: ");
  Serial.println(temp);
  // DEBUG
    
  int tens = (int)(temp / 100);
  int ones = (temp / 10) - (tens*10);
  int fraction = temp - tens*100 - ones*10;

  // DEBUG
  Serial.println("Tens: "); Serial.println(tens);
  Serial.println("Ones: "); Serial.println(ones);
  Serial.println("Fraction: "); Serial.println(fraction);
  
  char out[3];
  strcpy(out, convertToChar(tens));
  strcat(out, convertToChar(ones));
  strcat(out, convertToChar(fraction));
  Serial.println("All: "); Serial.println(out);
  // DEBUG

//  if (negative == false)
//  {
//    if (temp >= 100)
//    {
//      lc.setDigit(0, 0, tens, false);
//    }
//    else
//    {
//      strcat(output, " ");
//      lc.setChar(0, 0, ' ' , false);
//    }
//    
//    lc.setDigit(0, 1, ones, true);
//    lc.setDigit(0, 2, fraction, false);
//    
//    Serial.println("Output: ");
//    Serial.println(output);
//  }
//  else
//  {
//    if (temp < 100)
//    {
//      lc.setChar(0, 0, '-' , false);
//      lc.setDigit(0, 1, ones, true);
//      lc.setDigit(0, 2, fraction, false);
//    }
//    else
//    {
//      lc.setChar(0, 0, '-' , false);
//      lc.setDigit(0, 1, tens, false);
//      lc.setDigit(0, 2, ones, false);
//    }
//  }
//  
  return output;
}

const char* convertToChar(int value)
{
  switch (value) {
    case 0:
      return "0";
      break;
    case 1:
      return "1";
      break;
    case 2:
      return "2";
      break;
    case 3:
      return "3";
      break;
    case 4:
      return "4";
      break;
    case 5:
      return "5";
      break;
    case 6:
      return "6";
      break;
    case 7:
      return "7";
      break;
    case 8:
      return "8";
      break;
    case 9:
      return "9";
      break;
  }
  
  return "";
}
