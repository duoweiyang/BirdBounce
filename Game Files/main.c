    /*****************************************
	In this game, the player controls two cats 
	who are working together to catch birds. One
	cat is in the tree, the other on a trampoline
	on the ground. The player can move the cat 
	in the tree with LEFT and RIGHT, and can
	make the cat jump with A. When that cat hits
	the trampoline, the other cat will launch
	into the air and land in the tree and so 
	forth. "Cheat" can be used by pressing L
	which will increase the bird spawn rate.

	No known bugs.

	Extra Credit:
	- All custom art
	- Cats use gravity (albiet with very low acceleration)
	- Function pointers for states

    ******************************************/

#include "main.h"
#include "myLib.h"
#include "game.h"
#include "text.h"

// images - mode 0
#include "sprite.h"
#include "bg.h"
#include "trees.h"

// images - mode 3
#include "splashStart.h"
#include "splashInst.h"
#include "instScreen.h"
#include "endScreen.h"

// sound effects
#include "CatMeowSFX.h"
#include "BirdSFX.h"
#include "CursorSFX.h"
#include "TimeSFX.h"

// songs
#include "MysterySong.h"
#include "GameSong.h"
#include "ParkSong.h"

#include <stdlib.h>
#include <stdio.h>
#include <math.h>


#define TIMEINC 40
#define BIRDSPAWNRATE 60

extern OBJ_ATTR shadowOAM[128];
extern enum { LEFTCATOAM = 0, RIGHTCATOAM = 1, TIMEROAM = 2, SCOREOAM = 4, PAUSEOAM = 8, BIRDOAM = 9 };

extern int catState; // 0 = no cats falling 1 = cat falling
extern int catToggle; // 1 = left cat moves first, 2 = right cat moves first
extern int birdsInJump; // counts how many birds eaten in one button push
int splashState; // 0 = start, 1 = instructions (used for sound)

int time;
extern int timeLeft;
extern int score;
int highScore;
int currentBird;
int birdSpawnRate;
int cheat;
int fromInst;
int hOff;



int main() {

	init();
	startSplash();

	while(1) {

		oldButtons = buttons;
		buttons = BUTTONS;

		state();

		// switch (state) {
		// 	case SPLASHSCREEN:
		// 		updateSplash();
		// 		break;

		// 	case INSTRUCTIONSCREEN:
		// 		updateInstructions();
		// 		break;

		// 	case GAMESCREEN:
		// 		updateGame();
		// 		break;

		// 	case PAUSESCREEN:
		// 		updatePause();
		// 		break;

		// 	case ENDSCREEN:
		// 		updateEnd();
		// 		break;

		// } 

	}
}

void init() {

	setupSounds();
	setupInterrupts();
	

	catState = 0;
	catToggle = 1;
	hOff = 0;

	time = 0;
	timeLeft = 60;
	score = 0;
	currentBird = 0;
	birdSpawnRate = 80;

	leftCat.row = 10;
	leftCat.col = 30;
	leftCat.rdel = 0;
	leftCat.dir = 1;
	leftCat.racc = 45;
	leftCat.maxVSpeed = SHIFTUP(7);
	leftCat.width = 32;
	leftCat.height = 32;
	leftCat.aniState = 0;
	leftCat.aniCounter = 0;
	leftCat.currFrame = 0;
	leftCat.leftBound = leftCat.col - 15;
	leftCat.rightBound = leftCat.col + 15;
	leftCat.onTree = 1;
	leftCat.onGround = 0;
	leftCat.fallingDown = 0;
	leftCat.fallingUp = 0;
	leftCat.oamLoc = LEFTCATOAM;

	rightCat.row = SCREENHEIGHT - 32;
	rightCat.col = SCREENWIDTH - 32 - 30;
	rightCat.rdel = 0;
	rightCat.dir = -1;
	rightCat.racc = 45;
	rightCat.maxVSpeed = SHIFTUP(7);
	rightCat.width = 32;
	rightCat.height = 32;
	rightCat.aniState = 0;
	rightCat.aniCounter = 0;
	rightCat.currFrame = 0;
	rightCat.leftBound = rightCat.col - 15;
	rightCat.rightBound = rightCat.col + 15;
	rightCat.onTree = 0;
	rightCat.onGround = 1;
	rightCat.fallingDown = 0;
	rightCat.fallingUp = 0;
	rightCat.oamLoc = RIGHTCATOAM;

	for (int i = 0; i < 10; i++) {

		birds[i].active = 0;
	}

}

void initBird(int b) {

	birds[b].row = rand() % 50 + 55; // min 55, max 105
	birds[b].width = 16;
	birds[b].height = 16;
	birds[b].aniState = BIRDALIVE;
	birds[b].aniCounter = 0;
	birds[b].currFrame = 0;

	int tempType = (rand() % 25) + 1;

	if (tempType > 0 && tempType <= 10) {
		birds[b].type = 1;
	} else if (tempType > 10 && tempType <= 20) {
		birds[b].type = 2;
	} else if (tempType > 20 && tempType <= 25) {
		birds[b].type = 3;
	}
	//birds[i].type = (rand() % 2) + 1;

	if (birds[b].type == 1) {
		birds[b].worth = 1;
	} else if (birds[b].type == 2) {
		birds[b].worth = 2;
	} else if (birds[b].type == 3) {
		birds[b].worth = 0;
	}

	birds[b].active = 0;
	birds[b].oamLoc = BIRDOAM + b;

	int temp = rand() % 2;
		if (temp == 0) {
		birds[b].cdel = 1;
		birds[b].col = -16;
	} else {
		birds[b].cdel = -1;
		birds[b].col = SCREENWIDTH + 16;
	}
}

void hideSprites() {
    for (int i = 0; i < 128; i++) {
    	shadowOAM[i].attr0 = ATTR0_HIDE;
    }

}

void update() {

	updateTime();

	if (catToggle == 1) {
		updateCats1(&leftCat, &rightCat);
	
	} else if (catToggle == 2) {
		updateCats2(&leftCat, &rightCat);
	}

    for (int i = 0; i < 10; i++) {	
		birds[i].aniCounter++;

		if (birds[i].active) {

			// IF BIRD IS ALIVE -- flappy
			if (birds[i].aniState == BIRDALIVE && birds[i].aniCounter % 20 == 0) {

				if (birds[i].currFrame == 1) {
					birds[i].currFrame = 0;
				} else {
					birds[i].currFrame = 1;
				}

			// IF BIRD IS DEAD -- dying sequence and show score
			} else if (birds[i].aniState == BIRDDEAD && birds[i].aniCounter % 10 == 0) {
				if (birds[i].currFrame == 0) {

					playSoundB(BirdSFX, BIRDSFXLEN, BIRDSFXFREQ, 0);
					birds[i].currFrame = 1;

				} else if (birds[i].currFrame == 1) {

					birds[i].currFrame = 2;

				} else if (birds[i].currFrame == 2) {

					birds[i].currFrame = 3;

					if (birds[i].type == 3) {
						playSoundB(TimeSFX, TIMESFXLEN, TIMESFXFREQ, 0);
					}

				} else {
					// set inactive once dying loop plays
					if (birds[i].aniCounter % 50) {
						birds[i].active = 0;
					}
				}
			}
		}
    }

    for (int i = 0; i < 10; i++) {	
		updateBird(&birds[i]);
		checkBirdCollision(&leftCat, &birds[i]);
		checkBirdCollision(&rightCat, &birds[i]);
	}

	hOff++;
	REG_BG1HOFS = hOff / 8;


}

void draw() {

	hideSprites();

	drawTimer();
	drawScore();

	drawCat(&leftCat);
	drawCat(&rightCat);

	for (int i = 0; i < 10; i++) {	
		drawBird(&birds[i]);
	}

	DMANow(3, shadowOAM, OAM, 128 * 4);
}

void updateTime() {

	time++;

	if (time % TIMEINC == 0) {
		timeLeft--;
	}

	if (timeLeft == 0) {
		startEnd();
	}


	if (time % rand() % birdSpawnRate == 0) {
		if (birds[currentBird].active == 0) {

			initBird(currentBird);
			birds[currentBird].active = 1;
		}

		currentBird++;

		if (currentBird == 10) {
			currentBird = 0;
		}
	}
}

void drawTimer() {

	for (int i = 0; i < 2; i++) {
		shadowOAM[TIMEROAM + i].attr0 = 20;
		shadowOAM[TIMEROAM + i].attr1 = ATTR1_SIZE8 | (SCREENWIDTH/2 - (8*i));
		shadowOAM[TIMEROAM + i].attr2 = SPRITEOFFSET16(0, 8 + getDigit(timeLeft, i));	
	}
}

void drawScore() {

	for (int i = 0; i < 4; i++) {
		shadowOAM[SCOREOAM + i].attr0 = 10;
		shadowOAM[SCOREOAM + i].attr1 = ATTR1_SIZE8 | (SCREENWIDTH/2 + 8 - (8*i));
		shadowOAM[SCOREOAM + i].attr2 = SPRITEOFFSET16(0, 8 + getDigit(score, i));	
	}
}

int getDigit(int num, int digit) {
    num /= pow( 10, digit );
    return num % 10;
}


// ------------------------------------------------------------

void startSplash() {

	init();
	if (!fromInst) {
		playSoundA(GameSong, GAMESONGLEN, GAMESONGFREQ, 1);
		fromInst = 0;
	}

	state = updateSplash;
	splashState = 0;

	REG_DISPCTL = 0;
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	drawBackgroundImage3(splashStartBitmap);

}

void updateSplash() {

	if ( BUTTON_PRESSED(BUTTON_DOWN) ) {
		playSoundB(CursorSFX, CURSORSFXLEN, CURSORSFXFREQ, 0);
		if (splashState != 1) {
			splashState = 1;
			drawBackgroundImage3(splashInstBitmap);
		}
	}

	if ( BUTTON_PRESSED(BUTTON_UP) ) {
		playSoundB(CursorSFX, CURSORSFXLEN, CURSORSFXFREQ, 0);
		if (splashState != 0) {
			splashState = 0;
			drawBackgroundImage3(splashStartBitmap);
		}
	}

	// press A, start what cursor is on
	if ( BUTTON_PRESSED(BUTTON_A) ) {
		if (splashState == 0) {
			startGame();
		} else {
			playSoundB(CursorSFX, CURSORSFXLEN, CURSORSFXFREQ, 0);
			startInstructions();
		}
	}

}

void startInstructions() {

	state = updateInstructions;

	drawBackgroundImage3(instScreenBitmap);

	// drawString(10, 10, "INSTRUCTIONS: ", BLACK);
	// drawString(30, 15, "Help the cats catch as many birds as", BLACK);
	// drawString(40, 15, "they can in the time limit!", BLACK);

	// drawString(60, 15, "LEFT & RIGHT: move cat in tree", BLACK);
	// drawString(70, 15, "A: make cat in tree jump", BLACK);

	// drawString(90, 15, "Combo birds to get a higher score!", BLACK);

	// drawString(140, 10, "START <-- return to title screen", BLACK);

}

void updateInstructions() {

	// press start, go back to splash
	if ( BUTTON_PRESSED(BUTTON_A)) {
		fromInst = 1;
		playSoundB(CursorSFX, CURSORSFXLEN, CURSORSFXFREQ, 0);
		startSplash();
	}
}



void startGame() {
	state = updateGame;
	fromInst = 0;
	init();

	playSoundA(ParkSong, PARKSONGLEN, PARKSONGFREQ, 1);
	playSoundB(CatMeowSFX, CATMEOWSFXLEN, CATMEOWSFXFREQ, 0);

	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE; 
	//REG_DISPCTL = MODE3 |  BG2_ENABLE;

	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(29); // trees
	REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(30); // bg sky


    DMANow(3, spritePal, SPRITE_PALETTE, 256);
	DMANow(3, spriteTiles, &CHARBLOCKBASE[4], spriteTilesLen/2);

	// bg
	loadPalette(treesPal);
	DMANow(3, bgTiles, &CHARBLOCKBASE[1], bgTilesLen/2);	
	DMANow(3, bgMap, &SCREENBLOCKBASE[30], bgMapLen/2);

	// trees
	DMANow(3, treesTiles, &CHARBLOCKBASE[0], treesTilesLen/2);	
	DMANow(3, treesMap, &SCREENBLOCKBASE[29], treesMapLen/2);

}

void updateGame() {

	update();
	draw();
	waitForVblank();   

	// press start, go to pause
	if ( BUTTON_PRESSED(BUTTON_START) ) {
		startPause();
	}

	// toggle cheat
	if ( BUTTON_PRESSED(BUTTON_L) ) {
		if (cheat == 0) {
			cheat = 1;
			birdSpawnRate = 15;
		} else {
			cheat = 0;
			birdSpawnRate = BIRDSPAWNRATE;
		}
	}

}

void startPause() {
	state = updatePause;

	playSoundB(CursorSFX, CURSORSFXLEN, CURSORSFXFREQ, 0);

	shadowOAM[PAUSEOAM].attr0 = (SCREENHEIGHT/2 - 16) | ATTR0_WIDE;
	shadowOAM[PAUSEOAM].attr1 = ATTR1_SIZE32 | (SCREENWIDTH/2 - 16);
	shadowOAM[PAUSEOAM].attr2 = SPRITEOFFSET16(7, 8);	

	DMANow(3, shadowOAM, OAM, 128 * 4);

}

void updatePause() {
	// press start, go to game
	if ( BUTTON_PRESSED(BUTTON_START) ) {
		playSoundB(CursorSFX, CURSORSFXLEN, CURSORSFXFREQ, 0);
		state = updateGame;
	}

}

void startEnd() {
	state = updateEnd;

	if (score > highScore) {
		highScore = score;
	}

	playSoundB(CatMeowSFX, CATMEOWSFXLEN, CATMEOWSFXFREQ, 0);

	hideSprites();
	REG_DISPCTL = 0;
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	drawBackgroundImage3(endScreenBitmap);

	char scoreStr[ 16 ];
	char highScoreStr[ 16 ];

	sprintf(scoreStr, "%s%d", "", score);
	sprintf(highScoreStr, "%s%d", "", highScore);
	drawString(68, 130, scoreStr, BLACK);
	drawString(88, 130, highScoreStr, BLACK);
}

void updateEnd() {
	if ( BUTTON_PRESSED(BUTTON_A) ) {
		playSoundB(CursorSFX, CURSORSFXLEN, CURSORSFXFREQ, 0);
		startSplash();
	}
}


// --------- sounds ---------------------------------------

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {

        dma[1].cnt = 0;
	
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;
        soundA.loops = loops;
        soundA.duration = ((VBLANK_FREQ*length)/frequency);
        soundA.vbCount = 0;
        
}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.isPlaying = 1;
        soundB.loops = loops;
        soundB.duration = ((VBLANK_FREQ*length)/frequency);
        soundB.vbCount = 0;
        
}

void pauseSound()
{
	// TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;
	REG_TM0CNT = 0; 
	REG_TM1CNT = 0;
	
}

void unpauseSound()
{
	// TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 1;
	soundB.isPlaying = 1;
	REG_TM0CNT = TIMER_ON;
	REG_TM1CNT = TIMER_ON;


	
}

void stopSound()
{
    dma[1].cnt = 0; 
	soundA.isPlaying = 0;
	REG_TM0CNT = 0; // *** turn timer off

	dma[2].cnt = 0; 
	soundB.isPlaying = 0;
	REG_TM1CNT = 0; 
	
}

void setupInterrupts()
{
	REG_IME = 0;
	// TODO: SET UP THE INTERRUPT HANDLER HERE
	// HINT: THERE IS A REGISTER THAT NEEDS TO POINT TO A INTERRUPT FUNCTION
	// HINT: THAT INTERRUPT FUNCTION HAS TO BE CAST TO SOMETHING...

	REG_INTERRUPT = (unsigned int) interruptHandler;
	
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		//TODO: FINISH THIS FUNCTION
		// This should be where you determine if a sound if finished or not

		if (soundA.isPlaying) {
			soundA.vbCount++;
			if (soundA.vbCount > soundA.duration) {
				if (soundA.loops) {
					playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
				} else {
					dma[1].cnt = 0; // *** turn off dma 1, soundA stop
					soundA.isPlaying = 0;
					REG_TM0CNT = 0; // *** turn timer off
				}
			}
		}

		if (soundB.isPlaying) {
			soundB.vbCount++;
			if (soundB.vbCount > soundB.duration) {
				if (soundB.loops) {
					playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
				} else {
					dma[2].cnt = 0; // *** turn off dma 1, soundb stop
					soundB.isPlaying = 0;
					REG_TM1CNT = 0; // *** turn timer off
				}
			}
		}
		

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}


