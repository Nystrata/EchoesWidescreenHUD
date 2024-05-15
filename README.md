# Widescreen HUD Mod for Metroid Prime 2: Echoes (GameCube)

## Overview

This a for Metroid Prime 2: Echoes for the Nintendo GameCube that adjusts the HUD to better match forced 16:9 widescreen hacks.  
This will only work for NTSC-U G2ME01 and PAL G2MP01 versions of the game. (NTSC-J is not supported.)

![324662639-7e57fb19-1ead-4475-9fae-c6439fa0877c-1](https://github.com/Nystrata/EchoesWidescreenHUD/assets/15365192/41aa7660-7b33-4611-9aec-13ecd7487cfe)  
More screenshots can be found on the [Screenshots page](https://github.com/Nystrata/EchoesWidescreenHUD/wiki/Screenshots).  


## Patching the Game
**For Windows**
1. Download from [Releases](https://github.com/Nystrata/echoeswidescreenhud/releases) and extract this mod's folder.
2. Make a copy of the game and rename it to `echoes.iso`. Place it in the mod's folder.
3. Run the included **patch.bat** - it should automatically detect whether your game is NTSC or PAL and patch accordingly. 
4. This will create a new ISO file called echoes_*version*_widescreenhud.iso with the mod installed

For not Windows, see [Extra Instructions - Wiki](https://github.com/Nystrata/EchoesWidescreenHUD/wiki/Extra-Instructions#patching-the-game-for-not-windows)

## Widescreen for Dolphin
#### Widescreen Hack Method (NTSC-U and PAL)    
(Requires 5.0-20347 Beta or later for [this feature](https://dolphin-emu.org/blog/2023/11/25/dolphin-progress-report-august-september-and-october-2023/#50-20097-and-50-20109-allow-widescreen-heuristic-to-be-modified-per-game-by-oatmealdome-and-billiard))  

In Dolphin, 
1. Choose Force 16:9 or Stretch for the Aspect Ratio  
   (Options -> Graphics Settings -> General -> Aspect Ratio)   
2. Enable Widescreen Hack  
   (Options -> Graphics Settings -> Enhancements -> Check Widescreen Hack)  

To fix frustum culling problems (seeing stuff pop in and out near the left/right edges of the screen), use this Gecko code:  
(Taken from [Dolphin Emulator Wiki](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_2:_Echoes_(GC)#VR_Culling_Fix))
```
$VR Culling Fix (for NTSC-U)
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
```
$VR Culling Fix (for PAL)
0430290C 38600001
04302910 4E800020
0430270C 38600001
04302710 4E800020
0430276C 38600001
04302770 4E800020
043027D8 38600001
043027DC 4E800020
043028C4 38600001
043028C8 4E800020
0430290C 38600001
04302910 4E800020
```

To fix the game flickering between normal and stretched view, edit the game INI to add  
```
[Video_Settings]
SuggestedAspectRatio = 2
```
(To edit game INI settings, right click Metroid Prime 2: Echoes in the game list -> Properties -> Game Config tab -> Editor  
There, you can add the setting to the User Config section)  

#### Gecko Code Method (NTSC-U Only)      
See [Wiki: Widescreen for Dolphin: Gecko Code Method](https://github.com/Nystrata/EchoesWidescreenHUD/wiki/Extra-Instructions#widescreen-for-dolphin-gecko-code-method)  

## Widescreen for Nintendont
**Widescreen Hack Method (NTSC-U and PAL)**  
You may try Nintedont's "Force Widescreen" option, but this has not been tested.  
  
**Gecko Code Method (NTSC-U Only)**  
For Nintendont, in the [extras folder](https://github.com/Nystrata/EchoesWidescreenHUD/tree/main/extras), you can use G2ME01.gct for the Widescreen codes.   

***
## Randovania Compatibility
> [!NOTE]  
> While mod does work with Randovania, it is *not* supported by Randovania developers.  
> Do not report bugs to the Randovania developers while using this mod.

To use this with [Randovania randomizer](https://github.com/randovania/randovania),  
create a vanilla game with the Widescreen HUD mod first, then select it as the Input ISO when exporting the game from Randovania.  

> [!IMPORTANT]  
> Because Randovania changes the game ID for Echoes Randomizer, make sure you apply the widescreen codes, settings, and Game INI changes to Echoes Randomizer in Dolphin or Nintendont too!

## If you're looking for a version for Metroid Prime 1
See Aruki's [Widescreen Hud Mod for Metroid Prime](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod)    
(Instructions are a bit complicated, I wrote a small helper batch script makes the process easier: [PrimeWidescreenHUDHelper](https://github.com/Nystrata/PrimeWidescreenHUDHelper))

## Files changed
- GGuiSys.pak
  - FRME_SamusHud1Combat.FRME, FRME_SamusHud1Combat_0.FRME  (Combat Visor, Dark Visor, Echo Visor)
  - FRME_Helmet.FRME
  - FRME_ScanHudFlat_0.FRME, FRME_ScanHudFlat_1.FRME
  - FRME_SamusHud1Ball.FRME (Morph Ball HUD)
- Standard.ntwk
  - TweakGui > Unknown (BallViewportYReduction) (Remove cimematic black bars from Morph Ball view)  

Additional details about these files can be found on [Notes: Known Files - Wiki](https://github.com/Nystrata/EchoesWidescreenHUD/wiki/Notes#known-files).

## To-Do
- [X] [Remove cimematic black bars from Morph Ball view](https://github.com/Nystrata/EchoesWidescreenHUD/issues/1)
- [ ] [Remove cimematic black bars from Cutscenes](https://github.com/Nystrata/EchoesWidescreenHUD/issues/2)
- [X] [Adjust Morph Ball Hud](https://github.com/Nystrata/EchoesWidescreenHUD/issues/3)
- [ ] [Rescale Beam/Visor icons](https://github.com/Nystrata/EchoesWidescreenHUD/issues/5)
- [ ] [Adjust map screen](https://github.com/Nystrata/EchoesWidescreenHUD/issues/4)
- [ ] [Adjust pause menu](https://github.com/Nystrata/EchoesWidescreenHUD/issues/4)

There are no plans to support Multiplayer modes.

## Special Thanks  
- Yonder, for use of their [editor](https://github.com/xchellx/three.js)
- Aruki, for the original [Widescreen Hud Mod for Metroid Prime](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod)
- The [Metroid Prime Modding Discord Server](https://discord.gg/pTQZcFS) and [Retro Modding Wiki](https://wiki.axiodl.com/w/Main_Page)
- This mod includes [NODTool](https://github.com/AxioDL/nod) for extracting and building the game ISO  
  and xdelta3 for patching.

## Screenshots
![Combat Visor](https://github.com/Nystrata/EchoesWidescreenHUD/assets/15365192/307816f2-c4e0-48b1-a4e6-d789552dec9f)  
![Morph Ball](https://github.com/Nystrata/EchoesWidescreenHUD/assets/15365192/f4b94587-a3c3-4532-a1a0-56eda6abf99e)
(These screenshots uses parts of [Metroid Prime Trilogy - HD Interface Textures](https://forums.dolphin-emu.org/Thread-metroid-prime-trilogy-hd-interface-textures-v-1-7-may-01-2021).)  
More screenshots can be found on the [Screenshots page](https://github.com/Nystrata/EchoesWidescreenHUD/wiki/Screenshots).  

***

nys
