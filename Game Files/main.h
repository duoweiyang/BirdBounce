unsigned int buttons;
unsigned int oldButtons;

// enum { SPLASHSCREEN, INSTRUCTIONSCREEN, GAMESCREEN, PAUSESCREEN, ENDSCREEN };
enum { CATSIT, CATDOWN, CATUP, CATWALK };
enum { BIRDALIVE, BIRDDEAD };
//#define NUMALIENS 40



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


// int state;

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