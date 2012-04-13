#include "LedControl.h"
#include <OneWire.h>
#include <DallasTemperature.h>

#define ONE_WIRE_BUS 3

OneWire oneWire(ONE_WIRE_BUS);
LedControl lc=LedControl(12,11,10,1);
DallasTemperature sensors(&oneWire);

DeviceAddress termometr;
// = { 0x28, 0x06, 0xFA, 0xA6, 0x02, 0x00, 0x00, 0x58 }; // kuchnia
// = { 0x28, 0x73, 0xCA, 0x14, 0x03, 0x00, 0x00, 0x92 }; // pokoj

void setup() 
{
  sensors.begin();
  if (!sensors.getAddress(termometr, 0))
  {
    while(1) { }
  }
  sensors.setResolution(termometr, 12);

  lc.shutdown(0, false);
  lc.setIntensity(0, 8);
  lc.clearDisplay(0);
}

void loop(void)
{ 
  delay(2000);

  sensors.requestTemperatures();

  float temp = sensors.getTempC(termometr);
  printNumber(temp);
}

void printNumber(float v)
{
  boolean negative = false;

  if (v < 0)
  {
    negative = true;
  }

  v = abs(v);

  // round magic
  v = v + 0.05;

  int temp = (int) (v * 10);  

  int tens = temp / 100;
  int ones = (temp / 10) - (tens*10);
  int fraction = temp - tens*100 - ones*10;

  if (negative == false)
  {
    if (temp >= 100)
    {
      lc.setDigit(0, 0, (byte)tens, false);
    }
    else
    {
      lc.setChar(0, 0, ' ' , false);
    }
    
    lc.setDigit(0, 1, (byte)ones, true);
    lc.setDigit(0, 2, (byte)fraction, false);
  }
  else
  {
    if (temp < 100)
    {
      lc.setChar(0, 0, '-' , false);
      lc.setDigit(0, 1, (byte)ones, true);
      lc.setDigit(0, 2, (byte)fraction, false);
    }
    else
    {
      lc.setChar(0, 0, '-' , false);
      lc.setDigit(0, 1, (byte)tens, false);
      lc.setDigit(0, 2, (byte)ones, false);
    }
  }
}

