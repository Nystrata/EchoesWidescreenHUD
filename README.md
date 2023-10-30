# Widescreen HUD Mod for Metroid Prime 2: Echoes (GameCube)

## Overview

This a quick and dirty mod that changes the HUD size for Echoes GC to better fit 16:9 widescreen hack.  
Tested only with the NTSC-U GameCube (G2ME01) version of the game  

## Mod Installation

### Patching the game
1. Extract this mod's folder (or clone this repository)
2. Make a copy of the game and rename it to `echoes.iso`. Place it in the mod's folder.
3. Run the included widescreen_patcher.bat
4. This will create a new ISO file called echoes_widescreenhud.iso with the mod installed

### Applying Widescreen Gecko Codes
In Dolphin, choose Force 16:9 for the Aspect Ratio (Options -> Graphics Settings -> General -> Aspect Ratio)  

Then, use these Gecko codes to run the game in widescreen:  
Right-click the Metroid Prime 2: Echoes in the game list, click Properties, and apply the codes to the Gecko Codes tab.  

These codes are for the NTSC-U copy of the game:  
```
$This Code Must Be On! [Codejunkies]
043BC410 906D0000
043BC414 88030004
043BC418 4BC5C1F4
04018608 483A3E08

$16:9 Widescreen [gamemasterplc]
C230256C 00000002
3DC04000 91C20000
C3420000 00000000
C236D684 00000004
3DC03FAA 61CEAAAB
91C20000 C2620000
ED330272 ED6A4824
60000000 00000000
```
[(Source)](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_2:_Echoes_(GC)#16:9_Aspect_Ratio_Fix)

**Avoid using Dolphin's Widescreen Hack option!**  
At the moment, Dolphin's current widescreen detection will cause the game to flicker between normal view and stretched view when Widescreen Hack is enabled!

## If using with a Randovania randomized game ##
This mod is *not* supported by Randovania - do not report bugs to the Randovania developers while using this mod.

To use this with Randovania randomizer,  
create a vanilla game with the Widescreen HUD mod first, then select it as the Input ISO when Exporting the game from Randovania.

Also apply the Gecko codes to G2ME1R (Dolphin considers Echoes Randomizer as a seperate game to vanilla Echoes.):  
In Dolphin, right-click the Metroid Prime 2: Randomizer in the game list, click Properties, and apply the codes to the Gecko Codes tab.  

## Other Details

Files changed:  
- GGuiSys.pak
  - eef43aa1.FRME 
    - Combat Visor, Dark Visor, Echo Visor
  - e6f37215.FRME
    - Helmet overlay
  - f7ec0850.FRME 
    - Scan Visor
  - 88738d60.FRME
    - Morph Ball HUD

To-Do:  
  - Rescale Beam/Visor icons
  - Adjust map screen
  - Adjust pause menu


### Special Thanks  
- Yonder, for use of their [editor](https://github.com/xchellx/three.js)
- Aruki, for the original [Metroid Prime Widescreen Hud](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod)
- The [Metroid Prime Modding Discord Server](https://discord.gg/pTQZcFS) and [Retro Modding Wiki](https://wiki.axiodl.com/w/Main_Page)

This mod includes [NODTool](https://github.com/AxioDL/nod) to build the new ISO and xdelta3 for patching.

***

nys
