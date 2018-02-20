
//{{BLOCK(blankbg)

//======================================================================
//
//	blankbg, 256x256@4, 
//	+ palette 16 entries, not compressed
//	+ 11 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 32 + 352 + 2048 = 2432
//
//	Time-stamp: 2017-04-12, 18:35:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BLANKBG_H
#define GRIT_BLANKBG_H

#define blankbgTilesLen 352
extern const unsigned short blankbgTiles[176];

#define blankbgMapLen 2048
extern const unsigned short blankbgMap[1024];

#define blankbgPalLen 32
extern const unsigned short blankbgPal[16];

#endif // GRIT_BLANKBG_H

//}}BLOCK(blankbg)
