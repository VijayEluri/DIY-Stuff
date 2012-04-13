const int ledCount = 7;    // the number of LEDs in the bar graph
const int digitCount = 10;    // the number of LEDs in the bar graph

const int partA = 10;
const int partB = 9;
const int partC = 8;
const int partD = 7;
const int partE = 6;
const int partF = 5;
const int partG = 4;

int ledPins[] = { 
   partA, partB, partC, partD, partE, partF, partG
};

int digits[digitCount][ledCount] = {
  {0, 1, 1, 0, 0, 0, 0},  // 1
  {1, 1, 0, 1, 1, 0, 1},  // 2
  {1, 1, 1, 1, 0, 0, 1},  // 3
  {0, 1, 1, 0, 0, 1, 1},  // 4
  {1, 0, 1, 1, 0, 1, 1},  // 5
  {1, 0, 1, 1, 1, 1, 1},  // 6
  {1, 1, 1, 0, 0, 0, 0},  // 7 
  {1, 1, 1, 1, 1, 1, 1},  // 8
  {1, 1, 1, 1, 0, 1, 1},  // 9
  {1, 1, 1, 1, 1, 1, 0}   // 0
};

void setup() {
  for (int thisLed = 0; thisLed < ledCount; thisLed++) {
    pinMode(ledPins[thisLed], OUTPUT); 
  }  
}

void clearLCD(){
  for (int thisLed = 0; thisLed < ledCount; thisLed++) {
    digitalWrite(ledPins[thisLed], LOW); 
  }
}

void loop() 
{
  for (int thisDigit = 0; thisDigit < digitCount; thisDigit++) {
    for (int thisLed = 0; thisLed < ledCount; thisLed++) {
      digitalWrite(ledPins[thisLed], digits[thisDigit][thisLed]); 
    }
    delay(1000);
//    clearLCD();
  }  

//  int digit[7] = digits[0];
//  for (int i = 0; i < digit.length; i++)
//  {
//    digitalWrite(ledPins[i], HIGH);
//  }
//  digit_0();  
//  delay(1000);
//  clearLCD();
  
}
