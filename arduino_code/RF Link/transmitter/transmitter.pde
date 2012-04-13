#include <VirtualWire.h>

int ledPin = 2;

void setup()
{
  vw_setup(2000); // Bits per sec
  pinMode(ledPin, OUTPUT);
}

void loop()
{
  const char *msg = "hello";
  vw_send((uint8_t *)msg, strlen(msg));

  digitalWrite(ledPin, HIGH);
  delay(1000);               
  digitalWrite(ledPin, LOW); 
  delay(1000); 
}
