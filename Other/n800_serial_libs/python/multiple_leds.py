import pygame, sys, os
import serial

from pygame.locals import *

# set up the screen
SCREEN_WIDTH = 800
SCREEN_HEIGHT = 480

# set up the buttons
LEDS = []
LEDS_COUNT = 5
BUTTON_X = 20
BUTTON_WIDTH = 100
BUTTON_HEIGHT = 100
BUTTON_SHIFT = BUTTON_WIDTH + ((SCREEN_WIDTH - (BUTTON_WIDTH * LEDS_COUNT) - (BUTTON_X * 2)) / (LEDS_COUNT - 1))

# set up the colors
GREY = (64, 64, 64)
WHITE = (255, 255, 255)

pygame.init
window = pygame.display.set_mode( (SCREEN_WIDTH, SCREEN_HEIGHT))#, pygame.FULLSCREEN )
pygame.display.set_caption('Multiple LEDs')
screen = pygame.display.get_surface()
#pygame.mouse.set_visible(False)

# create an array of buttons
for i in range(LEDS_COUNT):
	LEDS.append({'rect':pygame.Rect(BUTTON_X, SCREEN_HEIGHT/2 - BUTTON_HEIGHT/2, BUTTON_WIDTH, BUTTON_HEIGHT), 'state':'LOW'})
	BUTTON_X += BUTTON_SHIFT

# Exit button
buttonExit = pygame.Rect( SCREEN_WIDTH - 50, 0, 50, 50 )
pygame.draw.rect( screen, (255,255,255), buttonExit )
pygame.draw.line( screen, (0, 0, 0), (SCREEN_WIDTH - 45, 5), (SCREEN_WIDTH - 5, 45), 8)
pygame.draw.line( screen, (0, 0, 0), (SCREEN_WIDTH - 45, 45), (SCREEN_WIDTH - 5, 5), 8)

#ser = serial.Serial( '/dev/ttyUSB0', 9600 )
ser = serial.Serial( 'COM4', 9600 )

def setLED(index):
	print index+1
	led = LEDS[index]['rect']
	state = LEDS[index]['state']
	if state == 'LOW':
		LEDS[index]['state'] = 'HIGH'
		pygame.draw.rect( screen, WHITE, led )
	if state == 'HIGH':
		LEDS[index]['state'] = 'LOW'
		pygame.draw.rect( screen, GREY, led )
	ser.write(index+1)
	pygame.display.flip()

def input(events):
	for event in events:
		if event.type == QUIT:
			sys.exit(0)
		if event.type == MOUSEBUTTONDOWN:
			for i in range(len(LEDS)):
				if LEDS[i]['rect'].collidepoint(event.pos):
					setLED(i)
			if buttonExit.collidepoint(event.pos):
				sys.exit(0)

def showLEDS():
	for i in range(len(LEDS)):
		pygame.draw.rect(screen, GREY, LEDS[i]['rect'])
	pygame.display.update()
	
showLEDS()

while True:
	input( pygame.event.get() )
