const int ledCount = 7;    // the number of LEDs in the bar graph

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

int digits[2][7] = {
  {0, 1, 1, 0, 0, 0, 0},
  {1, 1, 0, 1, 1, 0, 1}
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


void digit_3(){
    digitalWrite(partA, HIGH); 
    digitalWrite(partB, HIGH); 
    digitalWrite(partG, HIGH); 
    digitalWrite(partC, HIGH); 
    digitalWrite(partD, HIGH); 
}

void digit_4(){
    digitalWrite(partF, HIGH); 
    digitalWrite(partG, HIGH); 
    digitalWrite(partB, HIGH); 
    digitalWrite(partC, HIGH); 
}

void digit_5(){
    digitalWrite(partA, HIGH); 
    digitalWrite(partF, HIGH); 
    digitalWrite(partG, HIGH); 
    digitalWrite(partC, HIGH); 
    digitalWrite(partD, HIGH); 
}

void digit_6(){
    digitalWrite(partA, HIGH); 
    digitalWrite(partF, HIGH); 
    digitalWrite(partE, HIGH); 
    digitalWrite(partD, HIGH); 
    digitalWrite(partC, HIGH); 
    digitalWrite(partG, HIGH); 
}

void digit_7(){
    digitalWrite(partA, HIGH); 
    digitalWrite(partB, HIGH); 
    digitalWrite(partC, HIGH); 
}

void digit_8(){
    digitalWrite(partA, HIGH); 
    digitalWrite(partB, HIGH); 
    digitalWrite(partC, HIGH); 
    digitalWrite(partD, HIGH); 
    digitalWrite(partE, HIGH); 
    digitalWrite(partF, HIGH); 
    digitalWrite(partG, HIGH); 
}

void digit_9(){
    digitalWrite(partG, HIGH); 
    digitalWrite(partF, HIGH); 
    digitalWrite(partA, HIGH); 
    digitalWrite(partB, HIGH); 
    digitalWrite(partC, HIGH); 
    digitalWrite(partD, HIGH); 
}

void digit_0(){
    digitalWrite(partA, HIGH); 
    digitalWrite(partB, HIGH); 
    digitalWrite(partC, HIGH); 
    digitalWrite(partD, HIGH); 
    digitalWrite(partE, HIGH); 
    digitalWrite(partF, HIGH); 
}

void loop() {
//  for (int thisLed = 0; thisLed < ledCount -1; thisLed++) {
//    digitalWrite(ledPins[thisLed], HIGH); 
//    delay(200);
//    digitalWrite(ledPins[thisLed], LOW); 
//  }  

  int digit[7] = digits[0];
  for (int i = 0; i < digit.length; i++)
  {
    digitalWrite(ledPins[i], HIGH);
  }
//  digit_0();  
//  delay(1000);
//  clearLCD();
  
}
