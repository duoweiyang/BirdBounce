# BirdBounce
In this game, the player controls two cats who are working together to catch birds. One cat is in the tree, the other on a trampoline on the ground. The player can move the cat in the tree with LEFT and RIGHT, and can make the cat jump with A. When that cat hits the trampoline, the other cat will launch into the air and land in the tree and so  forth. "Cheat" can be used by pressing L which will increase the bird spawn rate.

## How to Play
Open the BirdBounce.GBA file with a Gameboy Advance Emulator. VisualBoyAdvance is recommended. 

## How to Build
Requirements:
- devkitARM - https://sourceforge.net/projects/devkitpro/files/devkitARM/devkitARM_r47/ 
- a C compiler
- GBA emulator

Download and open project in a text editor - Sublime Text is recommended. 
In the makefile, the CCPATH, DKPATH, and VBASIM must be updated with the paths to your C compiler bin, devkitARM bin, and GBA emulator .exe respectively. 
