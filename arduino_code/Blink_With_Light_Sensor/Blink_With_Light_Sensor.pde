const int sensorPin = 0;

const int calibrationTime = 5000;

int myPins[] = {3, 5, 6, 10, 11};

const int ledsCount = 5;

const int range = 51;

int indexValue;

int sensorValue = 0;		// the sensor value
int ledValue = 0;		// the sensor value
int sensorMin = 1023;		// minimum sensor value
int sensorMax = 0;			// maximum sensor value

void setup()
{
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);

  // calibrate during the first five seconds 
  while (millis() < calibrationTime)
  {
    sensorValue = analogRead(sensorPin);

    // record the maximum sensor value
    if (sensorValue > sensorMax)
    {
      sensorMax = sensorValue;
    }

    // record the minimum sensor value
    if (sensorValue < sensorMin)
    {
      sensorMin = sensorValue;
    }
  }

  for (int thisPin = 0; thisPin < ledsCount; thisPin++)
  {
    pinMode(myPins[thisPin], OUTPUT);      
  }

  digitalWrite(13, LOW);
  Serial.begin(9600);
}

void loop() {
  sensorValue = analogRead(sensorPin);

  sensorValue = map(sensorValue, sensorMin, sensorMax, 0, 254);
  sensorValue = constrain(sensorValue, 0, 254);

  indexValue = sensorValue / range;
  
  for (int onPin = 0; onPin < indexValue; onPin++) {
    digitalWrite(myPins[onPin], HIGH);
  }
  
  ledValue = map(sensorValue, range * indexValue, range * (indexValue + 1), 0, 254);
  analogWrite(myPins[indexValue], ledValue);
  
  for (int offPin = indexValue + 1; offPin < ledsCount; offPin++) {
    digitalWrite(myPins[offPin], LOW);
  }

  Serial.print("Sensor: ");
  Serial.print(sensorValue);
  Serial.print(", Index: ");
  Serial.print(indexValue);
  Serial.print(", LED: ");
  Serial.print(ledValue);
  Serial.println();
}


