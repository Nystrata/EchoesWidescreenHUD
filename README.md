# Widescreen HUD Mod for Metroid Prime 2: Echoes (GameCube)

## Overview

This a simple mod for Metroid Prime 2: Echoes (NTSC-U) (G2ME01) for the Nintendo GameCube that adjusts the HUD to better match forced 16:9 widescreen hacks.

<img src="extras/images/Sample.png">

## Patching the Game
* **For Windows**
  1. Download from [Releases](https://github.com/Nystrata/echoeswidescreenhud/releases) and extract this mod's folder.
  2. Make a copy of the game and rename it to `echoes.iso`. Place it in the mod's folder.
  3. Run the included patch.bat
  4. This will create a new ISO file called echoes_widescreenhud.iso with the mod installed
* **For Not Windows**
  * Extract the game files (You can use [NODTool](https://github.com/AxioDL/nod), Dolphin,  or any app that can extract the full game filesystem and rebuild it.)
  * Use a vcdiff xdelta3 patcher to patch files/GGuiSys.pak in the game files with this mod's vcdiff/GGuiSys.pak_widescreen.vcdiff file
  * Replace the original game's GGuiSys.pak with the newly patched GGuiSys.pak (make sure the name is exactly GGuiSys.pak)
  * Rebuild the ISO (Or start the game directly from extracted files if using Dolphin (File -> Open, browse for sys/main.dol))

## Widescreen for Dolphin
* **Method 1: Gecko Codes**  
  In Dolphin, choose Force 16:9 for the Aspect Ratio (Options -> Graphics Settings -> General -> Aspect Ratio)   
  Right-click the Metroid Prime 2: Echoes in the game list, click Properties, and apply the code to the Gecko Codes tab.  
  
  This widescreen code is for the NTSC-U copy of the game:  
  [(Source)](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_2:_Echoes_(GC)#16:9_Aspect_Ratio_Fix)  
  ```
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
  **Make sure Widescreen Hack is *disabled* in Dolphin when using this code!**  
  To disable Widescreen Hack, go to Options -> Graphics Settings -> Enhancements -> Uncheck Widescreen Hack
* **Method 2: Widescreen Hack**    
  (Requires 5.0-20347 Beta or later for [this feature](https://dolphin-emu.org/blog/2023/11/25/dolphin-progress-report-august-september-and-october-2023/#50-20097-and-50-20109-allow-widescreen-heuristic-to-be-modified-per-game-by-oatmealdome-and-billiard))  
  In Dolphin, choose Force 16:9 or Stretch for the Aspect Ratio (Options -> Graphics Settings -> General -> Aspect Ratio)   
  Enable Widescreen Hack (Options -> Graphics Settings -> Enhancements -> Check Widescreen Hack)
  
  To fix frustum culling problems (seeing stuff pop in and out near the left/right edges of the screen), use this Gecko code:  
  [(Source)](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_2:_Echoes_(GC)#NA)
  ```
  $VR Culling Fix
  04302498 38600001
  0430249C 4E800020
  04302298 38600001
  0430229C 4E800020
  043022F8 38600001
  043022FC 4E800020
  04302450 38600001
  04302454 4E800020
  04302364 38600001
  04302368 4E800020
  ```
  
  To fix the game flickering between normal and stretched view, edit the game INI to add  
  ```
  [Video_Settings]
  SuggestedAspectRatio = 2
  ```
  (To edit game INI settings, right click Metroid Prime 2: Echoes in the game list -> Properties -> Game Config tab -> Editor  
  There, you can add the setting to the User Config section)

## Widescreen for Nintendont
For Nintendont, in the [extras folder](https://github.com/Nystrata/EchoesWidescreenHUD/tree/main/extras), you can use the following widescreen cheat codes:  
- G2ME01.gct  
  for Metroid Prime 2: Echoes
- G2ME1R.gct  
  for Randovania Echoes Randomizer games
 
You may also try Nintedont's "Force Widescreen" option, but this has not been tested.


***
### Randovania Compatibility
> [!NOTE]  
> While mod does work with Randovania, it is *not* supported by Randovania developers.  
> Do not report bugs to the Randovania developers while using this mod.

To use this with [Randovania randomizer](https://github.com/randovania/randovania),  
create a vanilla game with the Widescreen HUD mod first, then select it as the Input ISO when exporting the game from Randovania.  

After exporting,  
in Dolphin, right-click the Metroid Prime 2: Randomizer in the game list, click Properties, and apply the codes to the Gecko Codes tab.  
(In Dolphin, Metroid Prime 2: Randomizer's settings are stored seperately from the vanilla game's settings.)

### If you're looking for a version for Metroid Prime 1
See Aruki's [Widescreen Hud Mod for Metroid Prime](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod)    
(Instructions are a bit complicated, I wrote a small helper batch script makes the process easier: [PrimeWidescreenHUDHelper](https://github.com/Nystrata/PrimeWidescreenHUDHelper))

### Files changed
- GGuiSys.pak
  - eef43aa1.FRME 
    - Combat Visor, Dark Visor, Echo Visor
  - e6f37215.FRME
    - Helmet overlay
  - f7ec0850.FRME 
    - Scan Visor
  - 88738d60.FRME
    - Morph Ball HUD

### To-Do
- Rescale Beam/Visor icons
- Adjust map screen
- Adjust pause menu
- Adjust Morph Ball Hud
- Remove cimematic black bars from Morph Ball view

(There are no plans for Multiplayer modes.)

### Special Thanks  
- Yonder, for use of their [editor](https://github.com/xchellx/three.js)
- Aruki, for the original [Widescreen Hud Mod for Metroid Prime](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod)
- The [Metroid Prime Modding Discord Server](https://discord.gg/pTQZcFS) and [Retro Modding Wiki](https://wiki.axiodl.com/w/Main_Page)
- This mod includes [NODTool](https://github.com/AxioDL/nod) for extracting and building the game ISO  
  and xdelta3 for patching.

### Screenshots
<img src="extras/images/CombatVisor.png">
<img src="extras/images/ScanVisor.png">  
  
(This screenshot uses parts of [Metroid Prime Trilogy - HD Interface Textures](https://forums.dolphin-emu.org/Thread-metroid-prime-trilogy-hd-interface-textures-v-1-7-may-01-2021).)

More screenshots can be found in [extras/images/](https://github.com/Nystrata/echoeswidescreenhud/tree/main/extras/images/)

***

nys
