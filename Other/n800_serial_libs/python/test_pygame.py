import pygame, sys, os
import serial

from pygame.locals import *

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 480

pygame.init
window = pygame.display.set_mode( (SCREEN_WIDTH, SCREEN_HEIGHT))#, pygame.FULLSCREEN )
screen = pygame.display.get_surface()

#pygame.mouse.set_visible(False)

buttonrect = pygame.Rect( SCREEN_WIDTH/2 - 50, SCREEN_HEIGHT/2 - 50, 100, 100 )
buttonExit = pygame.Rect( SCREEN_WIDTH - 50, 0, 50, 50 )
pygame.draw.rect( screen, (255,255,255), buttonExit )
pygame.draw.line( screen, (0, 0, 0), (SCREEN_WIDTH - 45, 5), (SCREEN_WIDTH - 5, 45), 8)
pygame.draw.line( screen, (0, 0, 0), (SCREEN_WIDTH - 45, 45), (SCREEN_WIDTH - 5, 5), 8)
#ser = serial.Serial( '/dev/ttyUSB0', 9600 )

def setLED(state):
	if state == 'L':
		print 'Setting L'
		setLED.currentState = 'L'
		pygame.draw.rect( screen, (64,64,64), buttonrect )
		#ser.write('L')
	if state == 'H':
		print 'Setting H'
		setLED.currentState = 'H'
		pygame.draw.rect( screen, (255,255,255), buttonrect )
		#ser.write('H')
	if state == 'C':
		print 'Toggle!'
		if setLED.currentState == 'L':
			setLED('H')
		else:
			setLED('L')
	pygame.display.flip()

def input(events):
	for event in events:
		print event
		if event.type == QUIT:
			sys.exit(0)
		if event.type == MOUSEBUTTONDOWN:
			if buttonrect.collidepoint(event.pos):
				print 'Click'
				setLED('C')
			if buttonExit.collidepoint(event.pos):
				print 'Exit'
				sys.exit(0)

setLED('L')

while True:
	input( pygame.event.get() )
