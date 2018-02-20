#include "main.h"
#include "myLib.h"
#include "game.h"

#include "sprite.h"

OBJ_ATTR shadowOAM[128];
int catState;
int catToggle;
int score;
int birdsInJump;
int timeLeft;
int time; 
// leftCat moves down, rightCat moves up
void updateCats1(CAT* leftCat, CAT* rightCat) {

	// no cat jumped yet
	if (leftCat->onTree) {

		birdsInJump = 0;

		leftCat->aniState = CATSIT;

		// HOLD LEFT
		if (BUTTON_HELD(BUTTON_LEFT)) {
			leftCat->aniState = CATWALK;
			leftCat->aniCounter++;
			leftCat->dir = -1;

			if (leftCat->aniCounter % 10 == 0) {
				//leftCat->aniState = CATDOWN;
				if (leftCat->currFrame < 3) {
					leftCat->currFrame++;
				} else {
					leftCat->currFrame = 0;
				}
			}

			if (leftCat->col >= leftCat->leftBound) {
				leftCat->col--;
			}
		}

		// HOLD RIGHT
		if (BUTTON_HELD(BUTTON_RIGHT)) {
			leftCat->aniState = CATWALK;
			leftCat->aniCounter++;
			leftCat->dir = 1;

			if (leftCat->aniCounter % 10 == 0) {
				if (leftCat->currFrame < 3) {
					leftCat->currFrame++;
				} else {
					leftCat->currFrame = 0;
				}
			}

			if (leftCat->col <= leftCat->rightBound) {
				leftCat->col++;
			}
		}

		// PRESS A
		if (BUTTON_PRESSED(BUTTON_A)) { 
			// catState = 1

			leftCat->onTree = 0;
    		leftCat->fallingDown = 1;
    		leftCat->rdel = leftCat->maxVSpeed / 6;
    		leftCat->aniState = CATDOWN;
		}
	}

    // LEFT CAT - DOWN
    if (leftCat->fallingDown == 1) {

    	int shiftRow = SHIFTUP(leftCat->row);

    	leftCat->rdel += leftCat->racc;
    	shiftRow += leftCat->rdel;

    	if (SHIFTDOWN(shiftRow) >= SCREENHEIGHT - leftCat->height) {
    		leftCat->fallingDown = 0;
    		leftCat->aniState = CATSIT;
    		leftCat->onGround = 1;
    		leftCat->row = SCREENHEIGHT - leftCat->height;
    		leftCat->rdel = 0;

    		rightCat->onGround = 0;
    		rightCat->fallingUp = 1;
    		rightCat->aniState = CATUP;
    		rightCat->rdel = -rightCat->maxVSpeed; 
    	}

    	leftCat->row = SHIFTDOWN(shiftRow);
    }

    // RIGHT CAT - UP
    if (rightCat->fallingUp == 1) {

    	int shiftRow = SHIFTUP(rightCat->row);

    	rightCat->rdel += rightCat->racc;
    	shiftRow += rightCat->rdel;

    	if (SHIFTDOWN(shiftRow) <= 10) {
    		rightCat->fallingUp = 0;
    		rightCat->aniState = CATSIT;
    		rightCat->onTree = 1;
    		rightCat->row = 10;
    		rightCat->rdel = 0;

    		catToggle = 2;

    		leftCat->rdel = 0;
			//leftCat->racc = 20;
			//leftCat->maxVSpeed = SHIFTUP(5);

			rightCat->rdel = 0;
			//rightCat->racc = 20;
			//rightCat->maxVSpeed = SHIFTUP(5);
    	}

    	rightCat->row = SHIFTDOWN(shiftRow);
    }

}


void updateCats2(CAT* leftCat, CAT* rightCat) {

	// no cat jumped yet
	if (rightCat->onTree) {

		birdsInJump = 0;

		rightCat->aniState = CATSIT;

		// HOLD LEFT
		if (BUTTON_HELD(BUTTON_LEFT)) {
			rightCat->aniState = CATWALK;
			rightCat->aniCounter++;
			rightCat->dir = -1;

			if (rightCat->aniCounter % 10 == 0) {
				if (rightCat->currFrame < 3) {
					rightCat->currFrame++;
				} else {
					rightCat->currFrame = 0;
				}
			}

			if (rightCat->col >= rightCat->leftBound) {
				rightCat->col--;
			}
		}

		// HOLD RIGHT
		if (BUTTON_HELD(BUTTON_RIGHT)) {
			rightCat->aniState = CATWALK;
			rightCat->aniCounter++;
			rightCat->dir = 1;

			if (rightCat->aniCounter % 10 == 0) {
				if (rightCat->currFrame < 3) {
					rightCat->currFrame++;
				} else {
					rightCat->currFrame = 0;
				}
			}

			if (rightCat->col <= rightCat->rightBound) {
				rightCat->col++;
			}
		}

		// PRESS A
		if (BUTTON_PRESSED(BUTTON_A)) { 
			rightCat->onTree = 0;
    		rightCat->fallingDown = 1;
    		rightCat->aniState = CATDOWN;
    		rightCat->rdel = rightCat->maxVSpeed / 6;
		}
	}

    // LEFT CAT - DOWN
    if (rightCat->fallingDown == 1) {

    	int shiftRow = SHIFTUP(rightCat->row);

    	rightCat->rdel += rightCat->racc;
    	shiftRow += rightCat->rdel;

    	if (SHIFTDOWN(shiftRow) >= SCREENHEIGHT - rightCat->height) {
    		rightCat->fallingDown = 0;
    		rightCat->onGround = 1;
    		rightCat->aniState = CATSIT;
    		rightCat->row = SCREENHEIGHT - rightCat->height;
    		rightCat->rdel = 0;

    		leftCat->onGround = 0;
    		leftCat->fallingUp = 1;
    		leftCat->aniState = CATUP;
    		leftCat->rdel = -leftCat->maxVSpeed; 
    	}

    	rightCat->row = SHIFTDOWN(shiftRow);
    }

    // RIGHT CAT - UP
    if (leftCat->fallingUp == 1) {

    	int shiftRow = SHIFTUP(leftCat->row);

    	leftCat->rdel += leftCat->racc;
    	shiftRow += leftCat->rdel;

    	if (SHIFTDOWN(shiftRow) <= 10) {
    		leftCat->fallingUp = 0;
    		leftCat->onTree = 1;
    		leftCat->aniState = CATSIT;
    		leftCat->row = 10;
    		leftCat->rdel = 0;

    		catToggle = 1;

    		leftCat->rdel = 0;
			rightCat->rdel = 0;

    	}

    	leftCat->row = SHIFTDOWN(shiftRow);
    }
}


void updateBird(BIRD* b) {

	if (b->active == 1 && b->aniState == BIRDALIVE) {

		// if moving left, cdel = -1
		if (b->cdel == -1) {

			if (b->col < -16) {
				b->active = 0;
			} else {
				if (b->type == 3) {
					if (time % 2 == 0) {
						b->col += 3 *b->cdel;
					}
				}  else {
					b->col += b->cdel;
				}
			}

		// if moving right, cdel = 1
		} else {
			if (b->col > SCREENWIDTH) {
				b->active= 0;
			} else {
				if (b->type == 3) {
					if (time % 2 == 0) {
						b->col += 3 *b->cdel;
					}
				} else {
					b->col += b->cdel;
				}
			}
		}
	} 

}


void drawCat(CAT* c) {

	shadowOAM[c->oamLoc].attr0 = c->row;

	if (c->dir == -1) {
		shadowOAM[c->oamLoc].attr1 = ATTR1_SIZE32 | c->col;
	} else {
		shadowOAM[c->oamLoc].attr1 = ATTR1_SIZE32 | c->col | ATTR1_HFLIP;
	}

	// LEFT CAT
	if (c->oamLoc == 0) {

		if (c->aniState == CATSIT) {
			shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(0, 0);	
		} else if (c->aniState == CATDOWN) {
			shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(4, 0);	
		} else if (c->aniState == CATUP) {
			shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(8, 0);	
		} else if (c->aniState == CATWALK) {
			if (c->currFrame == 0) {
				shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(12, 0);	
			} else if (c->currFrame == 2) {
				shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(12, 4);	
			} else {
				shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(12, 8);	
			}
		}

	// RIGHT CAT
	} else {

		if (c->aniState == CATSIT) {
			shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(0, 4);	
		} else if (c->aniState == CATDOWN) {
			shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(4, 4);	
		} else if (c->aniState == CATUP) {
			shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(8, 4);	
		} else if (c->aniState == CATWALK) {
			if (c->currFrame == 0) {
				shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(16, 0);	
			} else if (c->currFrame == 2) {
				shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(16, 4);	
			} else {
				shadowOAM[c->oamLoc].attr2 = SPRITEOFFSET16(16, 8);	
			}
		} 

	}


}

void drawBird(BIRD* b) {

	if (b->active == 1) {

		shadowOAM[b->oamLoc].attr0 = (ROWMASK & b->row);

		if (b->cdel == 1) {
			shadowOAM[b->oamLoc].attr1 = ATTR1_SIZE16 | (COLMASK & b->col);
		} else {
			shadowOAM[b->oamLoc].attr1 = ATTR1_SIZE16 | ATTR1_HFLIP | (COLMASK & b->col);
		}

		// IF ALIVE
		if (b->aniState == BIRDALIVE) {

			// yellow
			if (b->type == 1) {
				if (b->currFrame == 0) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(1, 8);
				} else {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(1, 10);
				}
			// green
			} else if (b->type == 2) {
				if (b->currFrame == 0) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(3, 8);
				} else {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(3, 10);
				}	
			// white
			} else if (b->type == 3) {
				if (b->currFrame == 0) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(5, 8);
				} else {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(5, 10);
				}	
			}

		// IF DEAD
		} else if (b->aniState == BIRDDEAD) {

			// yellow
			if (b->type == 1) {
				if (b->currFrame == 0) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(1, 12);
				} else if (b->currFrame == 1) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(1, 14);
				} else if (b->currFrame == 2) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(1, 16);
				} else {
					shadowOAM[b->oamLoc].attr0 = ((ROWMASK & b->row) + 8);
					shadowOAM[b->oamLoc].attr1 = ATTR1_SIZE8 | ((COLMASK & b->col) + 4);
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(0, 8 + b->worth);
				}

			// green
			} else if (b->type == 2) {
				if (b->currFrame == 0) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(3, 12);
				} else if (b->currFrame == 1) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(3, 14);
				} else if (b->currFrame == 2) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(3, 16);
				} else {
					shadowOAM[b->oamLoc].attr0 = ((ROWMASK & b->row) + 8);
					shadowOAM[b->oamLoc].attr1 = ATTR1_SIZE8 | ((COLMASK & b->col) + 4);
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(0, 8 + b->worth);
				}

			// white
			} else if (b->type == 3) {
				if (b->currFrame == 0) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(5, 12);
				} else if (b->currFrame == 1) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(5, 14);
				} else if (b->currFrame == 2) {
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(5, 16);
				} else {
					shadowOAM[b->oamLoc].attr1 = ATTR1_SIZE16 | ((COLMASK & b->col) + 4);
					shadowOAM[b->oamLoc].attr2 = SPRITEOFFSET16(0, 18);
				}
			}

			// 

		}

	}

}

void checkBirdCollision(CAT* c, BIRD* b) {

	// cat sprites are 32 x 32
	// but when jumping, hitbox is 13px wide and 18px tall
	// starting at col + 10 and row + 12
	if (b->active && b->aniState == BIRDALIVE) {

		if ( (c->col + 10 <= b->col + b->width) && 
			(c->col + c->width - 10 >= b->col) && 
			(c->row + 12 <= b->row + b->height - 1) && 
			(c->row + c->height - 12 >= b->row + 5) ) {

			b->aniState = BIRDDEAD;
			b->currFrame = 0;
			birdsInJump++;

			if (b->type == 3) {

				b->aniState = BIRDDEAD;
				timeLeft += 5;

			} else {

				b->worth = b->type * birdsInJump;
				score += b->worth;	

			}

		}

	}

}