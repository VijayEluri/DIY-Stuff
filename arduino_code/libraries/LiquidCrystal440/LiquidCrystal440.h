#ifndef LiquidCrystal_h
#define LiquidCrystal_h

#include <inttypes.h>
#include "Print.h"

// commands
#define LCD_CLEARDISPLAY 0x01
#define LCD_RETURNHOME 0x02
#define LCD_ENTRYMODESET 0x04
#define LCD_DISPLAYCONTROL 0x08
#define LCD_CURSORSHIFT 0x10
#define LCD_FUNCTIONSET 0x20
#define LCD_SETCGRAMADDR 0x40
#define LCD_SETDDRAMADDR 0x80

// flags for display entry mode
#define LCD_ENTRYRIGHT 0x00
#define LCD_ENTRYLEFT 0x02
#define LCD_ENTRYSHIFTINCREMENT 0x01
#define LCD_ENTRYSHIFTDECREMENT 0x00

// flags for display on/off control
#define LCD_DISPLAYON 0x04
#define LCD_DISPLAYOFF 0x00
#define LCD_CURSORON 0x02
#define LCD_CURSOROFF 0x00
#define LCD_BLINKON 0x01
#define LCD_BLINKOFF 0x00

// flags for display/cursor shift
#define LCD_DISPLAYMOVE 0x08
#define LCD_CURSORMOVE 0x00
#define LCD_MOVERIGHT 0x04
#define LCD_MOVELEFT 0x00

// flags for function set
#define LCD_8BITMODE 0x10
#define LCD_4BITMODE 0x00
#define LCD_2LINE 0x08
#define LCD_1LINE 0x00
#define LCD_5x10DOTS 0x04
#define LCD_5x8DOTS 0x00
#define LCD_Right 0
#define LCD_Left 1

class LiquidCrystal : public Print {
public:
  LiquidCrystal(uint8_t rs, uint8_t enable,
		uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3,
		uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7);
  LiquidCrystal(uint8_t rs, uint8_t rw, uint8_t enable,
		uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3,
		uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7);
	
/*  LiquidCrystal(uint8_t rs, uint8_t rw, uint8_t enable,  uint8_t en2,
				  uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3,
				  uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7);      4x40 LCD 8 data pins, 2 enable lines not working now
*/
	
  LiquidCrystal(uint8_t rs, uint8_t rw, uint8_t enable,
				uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3);
	LiquidCrystal(uint8_t rs, uint8_t rw, uint8_t enable, uint8_t en2,
				  uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3);  //4x40 LCD w 2x HD44780 controller chips, 2 enable lines to select between them   4 data pins 
  LiquidCrystal(uint8_t rs, uint8_t enable,
		uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3);

  void init(uint8_t fourbitmode, uint8_t rs, uint8_t rw, uint8_t enable, uint8_t en2,
	    uint8_t d0, uint8_t d1, uint8_t d2, uint8_t d3,
	    uint8_t d4, uint8_t d5, uint8_t d6, uint8_t d7);
    
  void begin(uint8_t cols, uint8_t rows, uint8_t charsize = LCD_5x8DOTS);

  void clear();
  void home();

  void noDisplay();
  void display();
  void noBlink();
  void blink();
  void noCursor();
  void cursor();
  void scrollDisplayLeft();
  void scrollDisplayRight();
  void leftToRight();
  void rightToLeft();
  void autoscroll();
  void noAutoscroll();

  void createChar(uint8_t, uint8_t[]);
  void setCursor(uint8_t, uint8_t); 
  virtual void write(uint8_t);
  void command(uint8_t);
  void commandBoth(uint8_t);
private:
  void send(uint8_t, uint8_t);
  void write4bits(uint8_t, uint8_t);
  void write8bits(uint8_t, uint8_t);
  void pulseEnable();
  void checkLcdBusyFlag(void);
  void begin2(uint8_t cols, uint8_t rows, uint8_t charsize, uint8_t chip);
  uint8_t _rs_pin; // LOW: command.  HIGH: character.
  uint8_t _rw_pin; // LOW: write to LCD.  HIGH: read from LCD.
  uint8_t _enable_pin; // activated by a HIGH pulse.
  uint8_t _en2;   //4x40 LCD
  uint8_t _chip;  //4x40
  int8_t _scroll_count;
  int8_t _x, _y,_setCursFlag;
  uint8_t _direction;
  uint8_t _numcols;
  uint8_t _busyPin; // for reading the busy flag on the LCD synonmymous w _data_pins[0]
  uint8_t _data_pins[8];
  uint8_t row_offsets[4];

  uint8_t _displayfunction;  // 4/8 bit mode, 1/2'lines', dotsize
  uint8_t _displaycontrol;   //display on/off, cursor on/off, blink on/off
  uint8_t _displaymode;      //text direction

//  uint8_t _initialized;

  uint8_t _numlines;
};

#endif
