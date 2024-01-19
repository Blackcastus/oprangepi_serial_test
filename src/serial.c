/*
* | File        :   serial.c
* | Author      :   Duc Hien
* | Function    :   Write to ttyS*
* | Info        :
*----------------
* | Date        :   Jan/19/2024
* | Info        :   Basic version
 */

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <wiringPi.h>
#include <wiringSerial.h>

int main ()
{
  int fd ;
  unsigned int nextTime ;

  // Init serial ttyS5, baud rate 9600
  if ((fd = serialOpen ("/dev/ttyS5", 9600)) < 0)
  {
    fprintf (stderr, "Unable to open serial device: %s\n", strerror (errno)) ;
    return 1 ;
  }

  if (wiringPiSetup () == -1)
  {
    fprintf (stdout, "Unable to start wiringPi: %s\n", strerror (errno)) ;
    return 1 ;
  }

  nextTime = millis ();

  while(1)
  {
    if (millis () > nextTime)
    {
      // serialPuts(fd, "Hello\n");
      serialPrintf(fd, "Hello Word!!\n");
      nextTime += 1000;
    }

  }
  return 0 ;
}
