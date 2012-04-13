#include <VirtualWire.h>

int ledPin = 13;
 
void setup()
{
  Serial.begin(9600);
  Serial.println("setup");
  
  vw_setup(2000); // Bits per sec
  vw_rx_start(); // Start the receiver PLL running
  
  pinMode(ledPin, OUTPUT); 
  
  digitalWrite(ledPin, HIGH);
  delay(1000);               
  digitalWrite(ledPin, LOW); 
}

void loop()
{
  uint8_t buf[VW_MAX_MESSAGE_LEN];
  uint8_t buflen = VW_MAX_MESSAGE_LEN;
  
  if (vw_get_message(buf, &buflen)) // Non-blocking
  {
    digitalWrite(ledPin, HIGH);

    int i;
    
    // Message with a good checksum received, dump HEX
    Serial.print("Got: ");
    for (i = 0; i < buflen; i++)
    {
      Serial.print(buf[i], HEX);
      Serial.print(" ");
    }
    
    Serial.println("");

    delay(100);               
    digitalWrite(ledPin, LOW); 
  }
}
