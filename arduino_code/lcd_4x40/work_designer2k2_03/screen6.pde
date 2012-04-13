//2 Row Big Font Screen
//Mod for Metz

void Screen6Init()
{
  
  lcd.init();
  
  lcd.commandWrite(0x80);                  //Line1
  lcd.printIn("AGT:");

  lcd.commandWrite(0x94);                  //Line3
  lcd.printIn("OEL");
  lcd.commandWrite(0xD4);                  //Line=4
  lcd.printIn("druck:");
 
  //Load the specific data:
  CGRAM_BigFont2();
  
  //Lets to the Conversion:
  DoCal = 1;
  
  //Fetch Typ K
  DoTypK = 1;

  //Select Serial Out Mode "Converted":
  if(SerOut!=2)
  {
    SerOut = 2;
    //print the Serial Header:
    HeaderPrint();
  }
  
  RefResh = 5;
  val = 0;    
  
}

void Screen6Work()
{
   
   //and only after every X refreshes, so its faster on the serial & its easier to read
 
   if(val>=RefResh)
  {
     val = 0;
   
     
         //Show the Exhaust Temp (Probe 1)
	 bigNum24(CalAGT[0],0+5);
	   
        //And the Oil Pressure:
	 
	 bigNum(VDOPres1*100,20,9,1);  //VDOPres is already x10, so only x100 is left for bigNum

  }
  else
  {
    val++;
  }
  
  
  
}


