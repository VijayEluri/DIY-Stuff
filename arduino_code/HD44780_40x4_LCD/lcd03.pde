/*==============================================================================
 * SIMPLE DOWN COUNTER
 *============================================================================*/

#include <LiquidCrystal440.h>
uint8_t nRows = 4;
uint8_t nColumns = 0;
uint8_t rw = 47;

int customCharCount = 7;

//                rs, rw, en1,en2, d4, d5, d6, d7
LiquidCrystal lcd(12, 255, 11, 10,  5, 4, 3, 2);

byte customCharArray[7][8] = {
  {
    B00000,
    B00000,
    B00000,
    B00000,
    B00011,
    B01111,
    B01111,
    B11111
  }, {
    B00000,
    B00000,
    B00000,
    B00000,
    B11111,
    B11111,
    B11111,
    B11111
  }, {
    B00000,
    B00000,
    B00000,
    B00000,
    B11000,
    B11110,
    B11110,
    B11111
  }, {
    B11111,
    B01111,
    B01111,
    B00011,
    B00000,
    B00000,
    B00000,
    B00000
  }, {
    B11111,
    B11110,
    B11110,
    B11000,
    B00000,
    B00000,
    B00000,
    B00000
  }, {
    B11111,
    B11111,
    B11111,
    B11111,
    B00000,
    B00000,
    B00000,
    B00000
  }, {
    B01110,
    B01110,
    B01110,
    B01110,
    B01100,
    B01000,
    B00000,
    B00000
  }
};

byte bigNumbersArray[10][4][3] = {
  {
    // custom 0
    {1, 2, 3},
    {255, 254, 255},
    {255, 254, 255},
    {4, 6, 5}
  },{
    // custom 1
    {2, 3, 254},
    {254, 255, 254},
    {254, 255, 254},
    {6, 6, 6}
  },{
    // custom 2
    {1, 2, 3},
    {1, 2, 255},
    {255, 254, 254},
    {4, 6, 6}
  },{
    // custom 3
    {1, 2, 3},
    {254, 2, 255},
    {254, 254, 255},
    {4, 6, 5}
  },{
    // custom 4
    {2, 254, 254},
    {255, 2, 2},
    {254, 255, 254},
    {254, 6, 254}
  },{
    // custom 5
    {2, 2, 2},
    {255, 2, 2},
    {254, 254, 255},
    {6, 6, 5}
  },{
    // custom 6
    {1, 2, 3},
    {255, 2, 3},
    {255, 254, 255},
    {4, 6, 5}
  },{
    // custom 7
    {2, 2, 2},
    {254, 2, 255},
    {254, 255, 254},
    {254, 6, 254}
  },{
    // custom 8
    {1, 2, 3},
    {255, 2, 255},
    {255, 254, 255},
    {4, 6, 5}
  },{
    // custom 9
    {1, 2, 3},
    {255, 254, 255},
    {4, 6, 255},
    {254, 254, 6}
  }
};

byte bigPunctuationArray[2][4][3] = {
  {
    // custom colon
    {254, 254, 254},
    {254, 2, 254},
    {254, 6, 254},
    {254, 254, 254}
  },{
    // custom comma
    {254, 254, 254},
    {254, 254, 254},
    {254, 254, 254},
    {254, 7, 254}
  }
};

void loadCustomChars()
{
  for (int i = 0; i < customCharCount; i++)
  {
      lcd.createChar(i+1, customCharArray[i]);
  }
}

void genericPrint(byte digit, byte column)
{
  // print rows
  for (int y = 0; y < 4; y++)
  {
    // print chars in columns
    for (int x = 0; x < 3; x++)
    {
      // 3 custom chars
      lcd.setCursor(column + x, y);
      lcd.write(bigNumbersArray[digit][y][x]);
    }
  }
}

void genericPunctuationPrint(byte punctuation, byte column)
{
  // print rows
  for (int y = 0; y < 4; y++)
  {
    // print chars in columns
    for (int x = 0; x < 3; x++)
    {
      // 3 custom chars
      lcd.setCursor(column + x, y);
      lcd.write(bigPunctuationArray[punctuation][y][x]);
    }
  }
}

void printBigChar(byte digit, byte col)
{
  if (digit > 9) return;
  genericPrint(digit, col);
}

void printBigCharOnPosition(byte digit, byte position)
{
  if (digit > 9) return;
  if (position > 9) return;

  genericPrint(digit, position * 4);
}

void printColon(byte position)
{
  genericPunctuationPrint(0, position * 4);
}


void setup()
{
  lcd.begin(nColumns, nRows);
  lcd.clear();
  lcd.home();

  loadCustomChars();
}

byte minutes = 1;
byte seconds = 0;

void loop() {

  if (minutes < 10)
  {
    printBigCharOnPosition(0, 5);
    printBigCharOnPosition(minutes, 6);
  }
  else
  {
    printBigCharOnPosition(minutes/10, 5);
    printBigCharOnPosition(minutes % 10, 6);
  }

  printColon(7);

  if (seconds < 10)
  {
    printBigCharOnPosition(0, 8);
    printBigCharOnPosition(seconds, 9);
  }
  else
  {
    printBigCharOnPosition(seconds/10, 8);
    printBigCharOnPosition(seconds % 10, 9);
  }

  if (seconds == 0)
  {
    if (minutes > 0)
    {
      minutes--;
      seconds = 59;
    }
    else
    {
      minutes = 3;
      seconds = 0;
    }
  }
  else
  {
    seconds--;
  }

  delay(1000);
}
