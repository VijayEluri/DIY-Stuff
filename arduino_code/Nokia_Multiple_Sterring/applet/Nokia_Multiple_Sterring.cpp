#include "WProgram.h"
void setup();
void loop();
int myPins[] = {2, 4, 6, 8, 10};
const int ledsCount = 5;

int incomingIndex;
int val = 0;

void setup() {
  Serial.begin(9600);

  for (int thisPin = 0; thisPin < ledsCount; thisPin++)
  {
    pinMode(myPins[thisPin], OUTPUT);      
  }
}

void loop() {
  if (Serial.available() > 0) {
    incomingIndex = Serial.read()-'0' - 1;

    val = digitalRead(myPins[incomingIndex]);
    
    if (val == HIGH) 
    {
      digitalWrite(myPins[incomingIndex], LOW);
    }
    else if (val == LOW)
    {
      digitalWrite(myPins[incomingIndex], HIGH);
    } 
  }
}


int main(void)
{
	init();

	setup();
    
	for (;;)
		loop();
        
	return 0;
}

