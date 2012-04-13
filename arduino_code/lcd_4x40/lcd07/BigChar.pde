void loadchars() 
{
  lcd.command(64);
  
  for (int i = 0; i < 8; i++)
  {
    for (int j = 0; j < 8; j++)
    {
      lcd.write(custchar[i][j]);
    }
  }
  
  lcd.home();
}

void printbigchar(byte digit, byte col, byte row, byte symbol = 0)
{
  if (digit > 9) return;
  for (int i = 0; i < 4; i++) 
  {
    lcd.setCursor(col, row + i);
    
    for (int j = 0; j < 4; j++)
    {
      lcd.write(bignums[digit][i][j]);
    }
    
    lcd.write(254);
  }
 
/* 
  if (symbol == 1)
  {
    lcd.setCursor(col + 3, row + 1);
    lcd.write(3);
  } 
  else if (symbol == 2) 
  {
    lcd.setCursor(col + 3, row);
    lcd.write(4);
    lcd.setCursor(col + 3, row + 1);
    lcd.write(4);
  }
*/

  lcd.setCursor(col + 4, row);
}
