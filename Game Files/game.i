# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "main.h" 1
unsigned int buttons;
unsigned int oldButtons;


enum { CATSIT, CATDOWN, CATUP, CATWALK };
enum { BIRDALIVE, BIRDDEAD };




typedef struct {

 int row;
 int col;
 int rdel;
    int dir;
 int racc;
 int maxVSpeed;
 int width;
    int height;

    int aniState;
    int currFrame;
    int aniCounter;

    int leftBound;
    int rightBound;

    int onTree;
    int onGround;
    int fallingDown;
    int fallingUp;

    int oamLoc;

} CAT;


typedef struct {

 int row;
 int col;
 int cdel;
 int width;
 int height;

    int aniState;
 int aniCounter;
 int currFrame;

    int type;
    int worth;
 int active;

 int oamLoc;

} BIRD;

typedef struct{

    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;

} SOUND;


CAT rightCat;
CAT leftCat;
BIRD birds[10];
SOUND soundA;
SOUND soundB;




void (*state)();

void init();
void initBird(int b);
void hideSprites();
void draw();
void update();

void updateTime();
void drawTimer();
void drawScore();
int getDigit(int num, int digit);

void startSplash();
void updateSplash();
void startInstructions();
void updateInstructions();
void startGame();
void updateGame();
void startPause();
void updatePause();
void startEnd();
void updateEnd();

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();
# 2 "game.c" 2
# 1 "myLib.h" 1



typedef unsigned short u16;
# 45 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;



void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();

void fillScreen(unsigned short color);
void setPixel(int, int, unsigned short);


void drawBackgroundImage3(const unsigned short * image);
# 83 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 93 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 222 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 279 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 3 "game.c" 2
# 1 "game.h" 1



void updateCats1(CAT* leftCat, CAT* rightCat);
void updateCats2(CAT* leftCat, CAT* rightCat);
void updateBird(BIRD* b);
void drawCat(CAT* c);
void drawBird(BIRD* b);
void checkBirdCollision(CAT* c, BIRD* b);
# 4 "game.c" 2

# 1 "sprite.h" 1
# 21 "sprite.h"
extern const unsigned short spriteTiles[16384];


extern const unsigned short spritePal[256];
# 6 "game.c" 2

OBJ_ATTR shadowOAM[128];
int catState;
int catToggle;
int score;
int birdsInJump;
int timeLeft;
int time;

void updateCats1(CAT* leftCat, CAT* rightCat) {


 if (leftCat->onTree) {

  birdsInJump = 0;

  leftCat->aniState = CATSIT;


  if ((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
   leftCat->aniState = CATWALK;
   leftCat->aniCounter++;
   leftCat->dir = -1;

   if (leftCat->aniCounter % 10 == 0) {

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


  if ((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
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


  if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {


   leftCat->onTree = 0;
      leftCat->fallingDown = 1;
      leftCat->rdel = leftCat->maxVSpeed / 6;
      leftCat->aniState = CATDOWN;
  }
 }


    if (leftCat->fallingDown == 1) {

     int shiftRow = ((leftCat->row) << 8);

     leftCat->rdel += leftCat->racc;
     shiftRow += leftCat->rdel;

     if (((shiftRow) >> 8) >= 160 - leftCat->height) {
      leftCat->fallingDown = 0;
      leftCat->aniState = CATSIT;
      leftCat->onGround = 1;
      leftCat->row = 160 - leftCat->height;
      leftCat->rdel = 0;

      rightCat->onGround = 0;
      rightCat->fallingUp = 1;
      rightCat->aniState = CATUP;
      rightCat->rdel = -rightCat->maxVSpeed;
     }

     leftCat->row = ((shiftRow) >> 8);
    }


    if (rightCat->fallingUp == 1) {

     int shiftRow = ((rightCat->row) << 8);

     rightCat->rdel += rightCat->racc;
     shiftRow += rightCat->rdel;

     if (((shiftRow) >> 8) <= 10) {
      rightCat->fallingUp = 0;
      rightCat->aniState = CATSIT;
      rightCat->onTree = 1;
      rightCat->row = 10;
      rightCat->rdel = 0;

      catToggle = 2;

      leftCat->rdel = 0;



   rightCat->rdel = 0;


     }

     rightCat->row = ((shiftRow) >> 8);
    }

}


void updateCats2(CAT* leftCat, CAT* rightCat) {


 if (rightCat->onTree) {

  birdsInJump = 0;

  rightCat->aniState = CATSIT;


  if ((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
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


  if ((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
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


  if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
   rightCat->onTree = 0;
      rightCat->fallingDown = 1;
      rightCat->aniState = CATDOWN;
      rightCat->rdel = rightCat->maxVSpeed / 6;
  }
 }


    if (rightCat->fallingDown == 1) {

     int shiftRow = ((rightCat->row) << 8);

     rightCat->rdel += rightCat->racc;
     shiftRow += rightCat->rdel;

     if (((shiftRow) >> 8) >= 160 - rightCat->height) {
      rightCat->fallingDown = 0;
      rightCat->onGround = 1;
      rightCat->aniState = CATSIT;
      rightCat->row = 160 - rightCat->height;
      rightCat->rdel = 0;

      leftCat->onGround = 0;
      leftCat->fallingUp = 1;
      leftCat->aniState = CATUP;
      leftCat->rdel = -leftCat->maxVSpeed;
     }

     rightCat->row = ((shiftRow) >> 8);
    }


    if (leftCat->fallingUp == 1) {

     int shiftRow = ((leftCat->row) << 8);

     leftCat->rdel += leftCat->racc;
     shiftRow += leftCat->rdel;

     if (((shiftRow) >> 8) <= 10) {
      leftCat->fallingUp = 0;
      leftCat->onTree = 1;
      leftCat->aniState = CATSIT;
      leftCat->row = 10;
      leftCat->rdel = 0;

      catToggle = 1;

      leftCat->rdel = 0;
   rightCat->rdel = 0;

     }

     leftCat->row = ((shiftRow) >> 8);
    }
}


void updateBird(BIRD* b) {

 if (b->active == 1 && b->aniState == BIRDALIVE) {


  if (b->cdel == -1) {

   if (b->col < -16) {
    b->active = 0;
   } else {
    if (b->type == 3) {
     if (time % 2 == 0) {
      b->col += 3 *b->cdel;
     }
    } else {
     b->col += b->cdel;
    }
   }


  } else {
   if (b->col > 240) {
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
  shadowOAM[c->oamLoc].attr1 = (2 << 14) | c->col;
 } else {
  shadowOAM[c->oamLoc].attr1 = (2 << 14) | c->col | (1 << 12);
 }


 if (c->oamLoc == 0) {

  if (c->aniState == CATSIT) {
   shadowOAM[c->oamLoc].attr2 = (0)*32+(0);
  } else if (c->aniState == CATDOWN) {
   shadowOAM[c->oamLoc].attr2 = (4)*32+(0);
  } else if (c->aniState == CATUP) {
   shadowOAM[c->oamLoc].attr2 = (8)*32+(0);
  } else if (c->aniState == CATWALK) {
   if (c->currFrame == 0) {
    shadowOAM[c->oamLoc].attr2 = (12)*32+(0);
   } else if (c->currFrame == 2) {
    shadowOAM[c->oamLoc].attr2 = (12)*32+(4);
   } else {
    shadowOAM[c->oamLoc].attr2 = (12)*32+(8);
   }
  }


 } else {

  if (c->aniState == CATSIT) {
   shadowOAM[c->oamLoc].attr2 = (0)*32+(4);
  } else if (c->aniState == CATDOWN) {
   shadowOAM[c->oamLoc].attr2 = (4)*32+(4);
  } else if (c->aniState == CATUP) {
   shadowOAM[c->oamLoc].attr2 = (8)*32+(4);
  } else if (c->aniState == CATWALK) {
   if (c->currFrame == 0) {
    shadowOAM[c->oamLoc].attr2 = (16)*32+(0);
   } else if (c->currFrame == 2) {
    shadowOAM[c->oamLoc].attr2 = (16)*32+(4);
   } else {
    shadowOAM[c->oamLoc].attr2 = (16)*32+(8);
   }
  }

 }


}

void drawBird(BIRD* b) {

 if (b->active == 1) {

  shadowOAM[b->oamLoc].attr0 = ((0xFF) & b->row);

  if (b->cdel == 1) {
   shadowOAM[b->oamLoc].attr1 = (1 << 14) | ((0x1FF) & b->col);
  } else {
   shadowOAM[b->oamLoc].attr1 = (1 << 14) | (1 << 12) | ((0x1FF) & b->col);
  }


  if (b->aniState == BIRDALIVE) {


   if (b->type == 1) {
    if (b->currFrame == 0) {
     shadowOAM[b->oamLoc].attr2 = (1)*32+(8);
    } else {
     shadowOAM[b->oamLoc].attr2 = (1)*32+(10);
    }

   } else if (b->type == 2) {
    if (b->currFrame == 0) {
     shadowOAM[b->oamLoc].attr2 = (3)*32+(8);
    } else {
     shadowOAM[b->oamLoc].attr2 = (3)*32+(10);
    }

   } else if (b->type == 3) {
    if (b->currFrame == 0) {
     shadowOAM[b->oamLoc].attr2 = (5)*32+(8);
    } else {
     shadowOAM[b->oamLoc].attr2 = (5)*32+(10);
    }
   }


  } else if (b->aniState == BIRDDEAD) {


   if (b->type == 1) {
    if (b->currFrame == 0) {
     shadowOAM[b->oamLoc].attr2 = (1)*32+(12);
    } else if (b->currFrame == 1) {
     shadowOAM[b->oamLoc].attr2 = (1)*32+(14);
    } else if (b->currFrame == 2) {
     shadowOAM[b->oamLoc].attr2 = (1)*32+(16);
    } else {
     shadowOAM[b->oamLoc].attr0 = (((0xFF) & b->row) + 8);
     shadowOAM[b->oamLoc].attr1 = (0 << 14) | (((0x1FF) & b->col) + 4);
     shadowOAM[b->oamLoc].attr2 = (0)*32+(8 + b->worth);
    }


   } else if (b->type == 2) {
    if (b->currFrame == 0) {
     shadowOAM[b->oamLoc].attr2 = (3)*32+(12);
    } else if (b->currFrame == 1) {
     shadowOAM[b->oamLoc].attr2 = (3)*32+(14);
    } else if (b->currFrame == 2) {
     shadowOAM[b->oamLoc].attr2 = (3)*32+(16);
    } else {
     shadowOAM[b->oamLoc].attr0 = (((0xFF) & b->row) + 8);
     shadowOAM[b->oamLoc].attr1 = (0 << 14) | (((0x1FF) & b->col) + 4);
     shadowOAM[b->oamLoc].attr2 = (0)*32+(8 + b->worth);
    }


   } else if (b->type == 3) {
    if (b->currFrame == 0) {
     shadowOAM[b->oamLoc].attr2 = (5)*32+(12);
    } else if (b->currFrame == 1) {
     shadowOAM[b->oamLoc].attr2 = (5)*32+(14);
    } else if (b->currFrame == 2) {
     shadowOAM[b->oamLoc].attr2 = (5)*32+(16);
    } else {
     shadowOAM[b->oamLoc].attr1 = (1 << 14) | (((0x1FF) & b->col) + 4);
     shadowOAM[b->oamLoc].attr2 = (0)*32+(18);
    }
   }



  }

 }

}

void checkBirdCollision(CAT* c, BIRD* b) {




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
