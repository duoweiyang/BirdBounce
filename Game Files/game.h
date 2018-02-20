#define SHIFTUP(i) ((i) << 8)
#define SHIFTDOWN(i) ((i) >> 8)

void updateCats1(CAT* leftCat, CAT* rightCat); 
void updateCats2(CAT* leftCat, CAT* rightCat); 
void updateBird(BIRD* b);
void drawCat(CAT* c);
void drawBird(BIRD* b);
void checkBirdCollision(CAT* c, BIRD* b);