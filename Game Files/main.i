# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 22 "main.c"
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
# 23 "main.c" 2
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
# 24 "main.c" 2
# 1 "game.h" 1



void updateCats1(CAT* leftCat, CAT* rightCat);
void updateCats2(CAT* leftCat, CAT* rightCat);
void updateBird(BIRD* b);
void drawCat(CAT* c);
void drawBird(BIRD* b);
void checkBirdCollision(CAT* c, BIRD* b);
# 25 "main.c" 2
# 1 "text.h" 1

void drawChar(int row, int col, char ch, unsigned short color);
void drawString(int row, int col, char *str, unsigned short color);

extern const unsigned char fontdata_6x8[];
# 26 "main.c" 2


# 1 "sprite.h" 1
# 21 "sprite.h"
extern const unsigned short spriteTiles[16384];


extern const unsigned short spritePal[256];
# 29 "main.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[224];


extern const unsigned short bgMap[1024];


extern const unsigned short bgPal[16];
# 30 "main.c" 2
# 1 "trees.h" 1
# 22 "trees.h"
extern const unsigned short treesTiles[2352];


extern const unsigned short treesMap[1024];


extern const unsigned short treesPal[16];
# 31 "main.c" 2


# 1 "splashStart.h" 1
# 20 "splashStart.h"
extern const unsigned short splashStartBitmap[38400];
# 34 "main.c" 2
# 1 "splashInst.h" 1
# 20 "splashInst.h"
extern const unsigned short splashInstBitmap[38400];
# 35 "main.c" 2
# 1 "instScreen.h" 1
# 20 "instScreen.h"
extern const unsigned short instScreenBitmap[38400];
# 36 "main.c" 2
# 1 "endScreen.h" 1
# 20 "endScreen.h"
extern const unsigned short endScreenBitmap[38400];
# 37 "main.c" 2


# 1 "CatMeowSFX.h" 1
# 20 "CatMeowSFX.h"
extern const unsigned char CatMeowSFX[15109];
# 40 "main.c" 2
# 1 "BirdSFX.h" 1
# 20 "BirdSFX.h"
extern const unsigned char BirdSFX[5227];
# 41 "main.c" 2
# 1 "CursorSFX.h" 1
# 20 "CursorSFX.h"
extern const unsigned char CursorSFX[692];
# 42 "main.c" 2
# 1 "TimeSFX.h" 1
# 20 "TimeSFX.h"
extern const unsigned char TimeSFX[4667];
# 43 "main.c" 2


# 1 "MysterySong.h" 1
# 20 "MysterySong.h"
extern const unsigned char MysterySong[602208];
# 46 "main.c" 2
# 1 "GameSong.h" 1
# 20 "GameSong.h"
extern const unsigned char GameSong[377651];
# 47 "main.c" 2
# 1 "ParkSong.h" 1
# 20 "ParkSong.h"
extern const unsigned char ParkSong[688320];
# 48 "main.c" 2

# 1 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 1 3
# 10 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 11 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 1 3
# 15 "c:\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\newlib.h" 1 3
# 14 "c:\\devkitarm\\arm-none-eabi\\include\\newlib.h" 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\_newlib_version.h" 1 3
# 15 "c:\\devkitarm\\arm-none-eabi\\include\\newlib.h" 2 3
# 16 "c:\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 2 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 1 3



# 1 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 5 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 2 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\features.h" 1 3
# 6 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 2 3
# 17 "c:\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 2 3
# 12 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3




# 1 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 1 3 4
# 216 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 3 4

# 216 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 3 4
typedef unsigned int size_t;
# 328 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3

# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 1 3
# 13 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 1 3
# 14 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3
# 1 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 1 3 4
# 149 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 1 3
# 24 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_types.h" 1 3



# 1 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 1 3
# 41 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 5 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\_types.h" 2 3


typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\lock.h" 1 3




# 1 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stdint.h" 1 3 4
# 9 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stdint.h" 3 4
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\stdint.h" 1 3 4
# 13 "c:\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 1 3 4
# 35 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "c:\\devkitarm\\arm-none-eabi\\include\\stdint.h" 2 3 4
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_stdint.h" 1 3 4
# 20 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "c:\\devkitarm\\arm-none-eabi\\include\\stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "c:\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "c:\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "c:\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "c:\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stdint.h" 2 3 4
# 6 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef unsigned int __size_t;
# 145 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef signed int _ssize_t;
# 156 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 1 3 4
# 357 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;



typedef unsigned long __clock_t;


typedef long __time_t;


typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3






typedef unsigned long __ULong;
# 38 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                                          ;
  int (* _write) (struct _reent *, void *, const char *, int)

                                   ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 571 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
  void *deviceData;
};
# 769 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 1 3
# 45 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 3
# 1 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 1 3 4
# 46 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 2 3
# 20 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\stdlib.h" 1 3
# 21 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 33 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar)



                                ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 133 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void * realloc (void * __r, size_t __size) ;
# 154 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 186 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
int system (const char *__string);
# 197 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 219 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 258 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 279 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);






char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 316 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 333 "c:\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3

# 50 "main.c" 2
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 1 3
# 36 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
# 1 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 1 3 4
# 37 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3



# 1 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stdarg.h" 1 3 4
# 40 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 41 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3
# 61 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 1 3
# 28 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 3
typedef __uint8_t u_int8_t;


typedef __uint16_t u_int16_t;


typedef __uint32_t u_int32_t;


typedef __uint64_t u_int64_t;

typedef int register_t;
# 62 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 3
# 1 "c:\\devkitarm\\lib\\gcc\\arm-none-eabi\\7.1.0\\include\\stddef.h" 1 3 4
# 63 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 2 3
# 113 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 3
typedef __blkcnt_t blkcnt_t;




typedef __blksize_t blksize_t;




typedef unsigned long clock_t;





typedef long time_t;





typedef long daddr_t;



typedef char * caddr_t;




typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;




typedef __id_t id_t;




typedef __ino_t ino_t;
# 173 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 3
typedef __off_t off_t;



typedef __dev_t dev_t;



typedef __uid_t uid_t;



typedef __gid_t gid_t;




typedef __pid_t pid_t;




typedef __key_t key_t;




typedef _ssize_t ssize_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __clockid_t clockid_t;





typedef __timer_t timer_t;





typedef __useconds_t useconds_t;




typedef __suseconds_t suseconds_t;



typedef __int64_t sbintime_t;


# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\_pthreadtypes.h" 1 3
# 240 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 2 3
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\types.h" 1 3
# 241 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\types.h" 2 3
# 62 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3




typedef __FILE FILE;






typedef _fpos_t fpos_t;





# 1 "c:\\devkitarm\\arm-none-eabi\\include\\sys\\stdio.h" 1 3
# 80 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 2 3
# 186 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);



int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int fscanf (FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int printf (const char *restrict, ...) __attribute__ ((__format__ (__printf__, 1, 2)))
                                                            ;
int scanf (const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 1, 2)))
                                                           ;
int sscanf (const char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)))
                                                            ;
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void * restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, off_t, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int remove (const char *);
int rename (const char *, const char *);
# 266 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
int snprintf (char *restrict, size_t, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int vscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)))
                                                           ;
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
# 393 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _diprintf_r (struct _reent *, int, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _dprintf_r (struct _reent *, int, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fiscanf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void * restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _fseek_r (struct _reent *, FILE *, off_t, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void * restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _iscanf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *, const char *_old, const char *_new)
                                          ;
int _scanf_r (struct _reent *, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int _siprintf_r (struct _reent *, char *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _siscanf_r (struct _reent *, const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);
# 574 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 684 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3
static __inline__ int __sputc_r(struct _reent *_ptr, int _c, FILE *_p) {




 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf_r(_ptr, _c, _p));
}
# 767 "c:\\devkitarm\\arm-none-eabi\\include\\stdio.h" 3

# 51 "main.c" 2
# 1 "c:\\devkitarm\\arm-none-eabi\\include\\math.h" 1 3






# 1 "c:\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 8 "c:\\devkitarm\\arm-none-eabi\\include\\math.h" 2 3







union __dmath
{
  double d;
  __ULong i[2];
};

union __fmath
{
  float f;
  __ULong i[1];
};


union __ldmath
{
  long double ld;
  __ULong i[4];
};
# 109 "c:\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern double atan (double);
extern double cos (double);
extern double sin (double);
extern double tan (double);
extern double tanh (double);
extern double frexp (double, int *);
extern double modf (double, double *);
extern double ceil (double);
extern double fabs (double);
extern double floor (double);






extern double acos (double);
extern double asin (double);
extern double atan2 (double, double);
extern double cosh (double);
extern double sinh (double);
extern double exp (double);
extern double ldexp (double, int);
extern double log (double);
extern double log10 (double);
extern double pow (double, double);
extern double sqrt (double);
extern double fmod (double, double);
# 173 "c:\\devkitarm\\arm-none-eabi\\include\\math.h" 3
    typedef float float_t;
    typedef double double_t;
# 217 "c:\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern int __isinff (float x);
extern int __isinfd (double x);
extern int __isnanf (float x);
extern int __isnand (double x);
extern int __fpclassifyf (float x);
extern int __fpclassifyd (double x);
extern int __signbitf (float x);
extern int __signbitd (double x);
# 313 "c:\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern double infinity (void);
extern double nan (const char *);
extern double copysign (double, double);
extern double logb (double);
extern int ilogb (double);

extern double asinh (double);
extern double cbrt (double);
extern double nextafter (double, double);
extern double rint (double);
extern double scalbn (double, int);

extern double exp2 (double);
extern double scalbln (double, long int);
extern double tgamma (double);
extern double nearbyint (double);
extern long int lrint (double);
extern long long int llrint (double);
extern double round (double);
extern long int lround (double);
extern long long int llround (double);
extern double trunc (double);
extern double remquo (double, double, int *);
extern double fdim (double, double);
extern double fmax (double, double);
extern double fmin (double, double);
extern double fma (double, double, double);


extern double log1p (double);
extern double expm1 (double);



extern double acosh (double);
extern double atanh (double);
extern double remainder (double, double);
extern double gamma (double);
extern double lgamma (double);
extern double erf (double);
extern double erfc (double);
extern double log2 (double);





extern double hypot (double, double);






extern float atanf (float);
extern float cosf (float);
extern float sinf (float);
extern float tanf (float);
extern float tanhf (float);
extern float frexpf (float, int *);
extern float modff (float, float *);
extern float ceilf (float);
extern float fabsf (float);
extern float floorf (float);


extern float acosf (float);
extern float asinf (float);
extern float atan2f (float, float);
extern float coshf (float);
extern float sinhf (float);
extern float expf (float);
extern float ldexpf (float, int);
extern float logf (float);
extern float log10f (float);
extern float powf (float, float);
extern float sqrtf (float);
extern float fmodf (float, float);




extern float exp2f (float);
extern float scalblnf (float, long int);
extern float tgammaf (float);
extern float nearbyintf (float);
extern long int lrintf (float);
extern long long int llrintf (float);
extern float roundf (float);
extern long int lroundf (float);
extern long long int llroundf (float);
extern float truncf (float);
extern float remquof (float, float, int *);
extern float fdimf (float, float);
extern float fmaxf (float, float);
extern float fminf (float, float);
extern float fmaf (float, float, float);

extern float infinityf (void);
extern float nanf (const char *);
extern float copysignf (float, float);
extern float logbf (float);
extern int ilogbf (float);

extern float asinhf (float);
extern float cbrtf (float);
extern float nextafterf (float, float);
extern float rintf (float);
extern float scalbnf (float, int);
extern float log1pf (float);
extern float expm1f (float);


extern float acoshf (float);
extern float atanhf (float);
extern float remainderf (float, float);
extern float gammaf (float);
extern float lgammaf (float);
extern float erff (float);
extern float erfcf (float);
extern float log2f (float);
extern float hypotf (float, float);
# 445 "c:\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern long double atanl (long double);
extern long double cosl (long double);
extern long double sinl (long double);
extern long double tanl (long double);
extern long double tanhl (long double);
extern long double frexpl (long double, int *);
extern long double modfl (long double, long double *);
extern long double ceill (long double);
extern long double fabsl (long double);
extern long double floorl (long double);
extern long double log1pl (long double);
extern long double expm1l (long double);




extern long double acosl (long double);
extern long double asinl (long double);
extern long double atan2l (long double, long double);
extern long double coshl (long double);
extern long double sinhl (long double);
extern long double expl (long double);
extern long double ldexpl (long double, int);
extern long double logl (long double);
extern long double log10l (long double);
extern long double powl (long double, long double);
extern long double sqrtl (long double);
extern long double fmodl (long double, long double);
extern long double hypotl (long double, long double);


extern long double copysignl (long double, long double);
extern long double nanl (const char *);
extern int ilogbl (long double);
extern long double asinhl (long double);
extern long double cbrtl (long double);
extern long double nextafterl (long double, long double);
extern float nexttowardf (float, long double);
extern double nexttoward (double, long double);
extern long double nexttowardl (long double, long double);
extern long double logbl (long double);
extern long double log2l (long double);
extern long double rintl (long double);
extern long double scalbnl (long double, int);
extern long double exp2l (long double);
extern long double scalblnl (long double, long);
extern long double tgammal (long double);
extern long double nearbyintl (long double);
extern long int lrintl (long double);
extern long long int llrintl (long double);
extern long double roundl (long double);
extern long lroundl (long double);
extern long long int llroundl (long double);
extern long double truncl (long double);
extern long double remquol (long double, long double, int *);
extern long double fdiml (long double, long double);
extern long double fmaxl (long double, long double);
extern long double fminl (long double, long double);
extern long double fmal (long double, long double, long double);

extern long double acoshl (long double);
extern long double atanhl (long double);
extern long double remainderl (long double, long double);
extern long double lgammal (long double);
extern long double erfl (long double);
extern long double erfcl (long double);
# 685 "c:\\devkitarm\\arm-none-eabi\\include\\math.h" 3

# 52 "main.c" 2






# 57 "main.c"
extern OBJ_ATTR shadowOAM[128];
extern enum { LEFTCATOAM = 0, RIGHTCATOAM = 1, TIMEROAM = 2, SCOREOAM = 4, PAUSEOAM = 8, BIRDOAM = 9 };

extern int catState;
extern int catToggle;
extern int birdsInJump;
int splashState;

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
  buttons = *(volatile unsigned int *)0x04000130;

  state();
# 112 "main.c"
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
 leftCat.maxVSpeed = ((7) << 8);
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

 rightCat.row = 160 - 32;
 rightCat.col = 240 - 32 - 30;
 rightCat.rdel = 0;
 rightCat.dir = -1;
 rightCat.racc = 45;
 rightCat.maxVSpeed = ((7) << 8);
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

 birds[b].row = rand() % 50 + 55;
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
  birds[b].col = 240 + 16;
 }
}

void hideSprites() {
    for (int i = 0; i < 128; i++) {
     shadowOAM[i].attr0 = (2 << 8);
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


   if (birds[i].aniState == BIRDALIVE && birds[i].aniCounter % 20 == 0) {

    if (birds[i].currFrame == 1) {
     birds[i].currFrame = 0;
    } else {
     birds[i].currFrame = 1;
    }


   } else if (birds[i].aniState == BIRDDEAD && birds[i].aniCounter % 10 == 0) {
    if (birds[i].currFrame == 0) {

     playSoundB(BirdSFX, 5227, 11025, 0);
     birds[i].currFrame = 1;

    } else if (birds[i].currFrame == 1) {

     birds[i].currFrame = 2;

    } else if (birds[i].currFrame == 2) {

     birds[i].currFrame = 3;

     if (birds[i].type == 3) {
      playSoundB(TimeSFX, 4667, 11025, 0);
     }

    } else {

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
 *(volatile unsigned short *)0x04000014 = hOff / 8;


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

 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void updateTime() {

 time++;

 if (time % 40 == 0) {
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
  shadowOAM[TIMEROAM + i].attr1 = (0 << 14) | (240/2 - (8*i));
  shadowOAM[TIMEROAM + i].attr2 = (0)*32+(8 + getDigit(timeLeft, i));
 }
}

void drawScore() {

 for (int i = 0; i < 4; i++) {
  shadowOAM[SCOREOAM + i].attr0 = 10;
  shadowOAM[SCOREOAM + i].attr1 = (0 << 14) | (240/2 + 8 - (8*i));
  shadowOAM[SCOREOAM + i].attr2 = (0)*32+(8 + getDigit(score, i));
 }
}

int getDigit(int num, int digit) {
    num /= pow( 10, digit );
    return num % 10;
}




void startSplash() {

 init();
 if (!fromInst) {
  playSoundA(GameSong, 377651, 11025, 1);
  fromInst = 0;
 }

 state = updateSplash;
 splashState = 0;

 *(unsigned short *)0x4000000 = 0;
 *(unsigned short *)0x4000000 = 3 | (1<<10);

 drawBackgroundImage3(splashStartBitmap);

}

void updateSplash() {

 if ( (!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7)))) ) {
  playSoundB(CursorSFX, 692, 11025, 0);
  if (splashState != 1) {
   splashState = 1;
   drawBackgroundImage3(splashInstBitmap);
  }
 }

 if ( (!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) ) {
  playSoundB(CursorSFX, 692, 11025, 0);
  if (splashState != 0) {
   splashState = 0;
   drawBackgroundImage3(splashStartBitmap);
  }
 }


 if ( (!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) ) {
  if (splashState == 0) {
   startGame();
  } else {
   playSoundB(CursorSFX, 692, 11025, 0);
   startInstructions();
  }
 }

}

void startInstructions() {

 state = updateInstructions;

 drawBackgroundImage3(instScreenBitmap);
# 426 "main.c"
}

void updateInstructions() {


 if ( (!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
  fromInst = 1;
  playSoundB(CursorSFX, 692, 11025, 0);
  startSplash();
 }
}



void startGame() {
 state = updateGame;
 fromInst = 0;
 init();

 playSoundA(ParkSong, 688320, 11025, 1);
 playSoundB(CatMeowSFX, 15109, 11025, 0);

 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);


 *(volatile unsigned short*)0x4000008 = 0<<14 | 0 << 2 | 29 << 8;
 *(volatile unsigned short*)0x400000A = 0<<14 | 1 << 2 | 30 << 8;


    DMANow(3, spritePal, ((unsigned short*)(0x5000200)), 256);
 DMANow(3, spriteTiles, &((charblock *)0x6000000)[4], 32768/2);


 loadPalette(treesPal);
 DMANow(3, bgTiles, &((charblock *)0x6000000)[1], 448/2);
 DMANow(3, bgMap, &((screenblock *)0x6000000)[30], 2048/2);


 DMANow(3, treesTiles, &((charblock *)0x6000000)[0], 4704/2);
 DMANow(3, treesMap, &((screenblock *)0x6000000)[29], 2048/2);

}

void updateGame() {

 update();
 draw();
 waitForVblank();


 if ( (!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))) ) {
  startPause();
 }


 if ( (!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9)))) ) {
  if (cheat == 0) {
   cheat = 1;
   birdSpawnRate = 15;
  } else {
   cheat = 0;
   birdSpawnRate = 60;
  }
 }

}

void startPause() {
 state = updatePause;

 playSoundB(CursorSFX, 692, 11025, 0);

 shadowOAM[PAUSEOAM].attr0 = (160/2 - 16) | (1 << 14);
 shadowOAM[PAUSEOAM].attr1 = (2 << 14) | (240/2 - 16);
 shadowOAM[PAUSEOAM].attr2 = (7)*32+(8);

 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

}

void updatePause() {

 if ( (!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))) ) {
  playSoundB(CursorSFX, 692, 11025, 0);
  state = updateGame;
 }

}

void startEnd() {
 state = updateEnd;

 if (score > highScore) {
  highScore = score;
 }

 playSoundB(CatMeowSFX, 15109, 11025, 0);

 hideSprites();
 *(unsigned short *)0x4000000 = 0;
 *(unsigned short *)0x4000000 = 3 | (1<<10);

 drawBackgroundImage3(endScreenBitmap);

 char scoreStr[ 16 ];
 char highScoreStr[ 16 ];

 sprintf(scoreStr, "%s%d", "", score);
 sprintf(highScoreStr, "%s%d", "", highScore);
 drawString(68, 130, scoreStr, 0);
 drawString(88, 130, highScoreStr, 0);
}

void updateEnd() {
 if ( (!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) ) {
  playSoundB(CursorSFX, 692, 11025, 0);
  startSplash();
 }
}




void setupSounds()
{
    *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     0 |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {

        dma[1].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(1, sound, 0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000102 = 0;

        *(volatile unsigned short*)0x4000100 = -ticks;
        *(volatile unsigned short*)0x4000102 = (1<<7);

        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.isPlaying = 1;
        soundA.loops = loops;
        soundA.duration = (((59.727)*length)/frequency);
        soundA.vbCount = 0;

}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = (16777216)/frequency;

        DMANow(2, sound, 0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -ticks;
        *(volatile unsigned short*)0x4000106 = (1<<7);

        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.isPlaying = 1;
        soundB.loops = loops;
        soundB.duration = (((59.727)*length)/frequency);
        soundB.vbCount = 0;

}

void pauseSound()
{

 soundA.isPlaying = 0;
 soundB.isPlaying = 0;
 *(volatile unsigned short*)0x4000102 = 0;
 *(volatile unsigned short*)0x4000106 = 0;

}

void unpauseSound()
{

 soundA.isPlaying = 1;
 soundB.isPlaying = 1;
 *(volatile unsigned short*)0x4000102 = (1<<7);
 *(volatile unsigned short*)0x4000106 = (1<<7);



}

void stopSound()
{
    dma[1].cnt = 0;
 soundA.isPlaying = 0;
 *(volatile unsigned short*)0x4000102 = 0;

 dma[2].cnt = 0;
 soundB.isPlaying = 0;
 *(volatile unsigned short*)0x4000106 = 0;

}

void setupInterrupts()
{
 *(unsigned short*)0x4000208 = 0;




 *(unsigned int*)0x3007FFC = (unsigned int) interruptHandler;

 *(unsigned short*)0x4000200 |= 1 << 0;
 *(unsigned short*)0x4000004 |= 1 << 3;
 *(unsigned short*)0x4000208 = 1;
}

void interruptHandler()
{
 *(unsigned short*)0x4000208 = 0;
 if(*(volatile unsigned short*)0x4000202 & 1 << 0)
 {



  if (soundA.isPlaying) {
   soundA.vbCount++;
   if (soundA.vbCount > soundA.duration) {
    if (soundA.loops) {
     playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
    } else {
     dma[1].cnt = 0;
     soundA.isPlaying = 0;
     *(volatile unsigned short*)0x4000102 = 0;
    }
   }
  }

  if (soundB.isPlaying) {
   soundB.vbCount++;
   if (soundB.vbCount > soundB.duration) {
    if (soundB.loops) {
     playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
    } else {
     dma[2].cnt = 0;
     soundB.isPlaying = 0;
     *(volatile unsigned short*)0x4000106 = 0;
    }
   }
  }


  *(volatile unsigned short*)0x4000202 = 1 << 0;
 }

 *(unsigned short*)0x4000208 = 1;
}
