#include <Charlieplex.h>

#define NUMBER_OF_PINS 8
#define NUMBER_OF_LEDS 7
#define NUMBER_OF_DIGITS 10

long previousMillis = 0;
long interval = 1000;

byte pins[] = {2, 3, 4, 5, 6, 7, 8, 9};
Charlieplex charlieplex = Charlieplex(pins, NUMBER_OF_PINS);

charliePin led0 = {0 , 7};
charliePin led1 = {1 , 7};
charliePin led2 = {2 , 7};
charliePin led3 = {3 , 7};
charliePin led4 = {4 , 7};
charliePin led5 = {5 , 7};
charliePin led6 = {6 , 7};

charliePin ledPins[] = { 
    led0, led1, led2, led3, led4, led5, led6
};

byte digits[NUMBER_OF_DIGITS][NUMBER_OF_LEDS] = {
    {1, 1, 1, 1, 1, 1, 0},  // 0
    {0, 1, 1, 0, 0, 0, 0},  // 1
    {1, 1, 0, 1, 1, 0, 1},  // 2
    {1, 1, 1, 1, 0, 0, 1},  // 3
    {0, 1, 1, 0, 0, 1, 1},  // 4
    {1, 0, 1, 1, 0, 1, 1},  // 5
    {1, 0, 1, 1, 1, 1, 1},  // 6
    {1, 1, 1, 0, 0, 0, 0},  // 7 
    {1, 1, 1, 1, 1, 1, 1},  // 8
    {1, 1, 1, 1, 0, 1, 1}   // 9
};

void setup() {
    charlieplex.clear();
}

void displayDigit(int digit)
{
    for (int thisLed = 0; thisLed < NUMBER_OF_LEDS; thisLed++)
    {
        if (digits[digit][thisLed] == 1)
        {
            charlieplex.charlieWrite(ledPins[thisLed], HIGH);
            delay(1);
            charlieplex.clear();
        }
    }
}

void loop()
{
/*
    for (int thisDigit = 0; thisDigit < NUMBER_OF_DIGITS; thisDigit++)
    {
        for (int thisLed = 0; thisLed < NUMBER_OF_LEDS; thisLed++)
        {
            
        }
        
        delay(1000);
    }
*/    
    displayDigit(2);
}
