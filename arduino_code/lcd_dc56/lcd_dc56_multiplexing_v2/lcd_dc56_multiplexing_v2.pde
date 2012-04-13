const int ledCount = 7;    // the number of LEDs in the bar graph
const int digitCount = 10;    // the number of LEDs in the bar graph

const int partA = 10;
const int partB = 9;
const int partC = 8;
const int partD = 7;
const int partE = 6;
const int partF = 5;
const int partG = 4;

const int transA = 11;
const int transB = 12;

long previousMillis = 0;
long interval = 100;

int dataBankA = 0;
int dataBankB = 0;

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
  pinMode(transA, OUTPUT); 
  pinMode(transB, OUTPUT); 
}

void displayDigit(int digit){
  if (digit == 0)
  {
    digit = 10;
  }
  for (int thisLed = 0; thisLed < ledCount; thisLed++) {
    digitalWrite(ledPins[thisLed], (digits[digit - 1][thisLed] == 0) ? LOW : HIGH); 
  }
}

void loop() 
{
  if (dataBankA > 0)
  {
    displayDigit(dataBankA);
    digitalWrite(transA, HIGH);
    delay(1);
    digitalWrite(transA, LOW);
  }

  displayDigit(dataBankB);
  digitalWrite(transB, HIGH);
  delay(1);
  digitalWrite(transB, LOW);

  unsigned long currentMillis = millis();  
  
  if(currentMillis - previousMillis > interval) {
    previousMillis = currentMillis;
    dataBankB++;
 
    if (dataBankB > 9)
    {
       dataBankB = 0;
       dataBankA++;
       
       interval -= 10;
       
       if (interval <= 0)
       {
         interval = 100;
       }
    
       if (dataBankA > 9)
       {
         dataBankA = 0;   
       }
    }
  }
}
