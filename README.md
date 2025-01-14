# Widescreen HUD Mod for Metroid Prime 2: Echoes (GameCube)

## Overview

This a mod for *Metroid Prime 2: Echoes* for the Nintendo GameCube that adjusts the HUD to better match forced 16:9 widescreen hacks.  

![324662639-7e57fb19-1ead-4475-9fae-c6439fa0877c-1](https://github.com/Nystrata/EchoesWidescreenHUD/assets/15365192/41aa7660-7b33-4611-9aec-13ecd7487cfe)  
More screenshots can be found on the [Screenshots page](https://github.com/Nystrata/EchoesWidescreenHUD/wiki/Screenshots).  

## Supported Versions
|Game Version | Game ID | Supported              |
|-------------|---------|------------------------|
| NTSC-U      | G2ME01  | **Yes**                |
| PAL         | G2MP01  | **Yes** (experimental) |
| NTSC-J      | G2MJ01  | No                     |
| NTSC-K      | G2MK01  | No                     |

*Metroid Prime 2: Dark Echoes New Play Control!* and *Metroid Prime Trilogy* for the Wii do not need this mod - these versions of the game already have widescreen support. 

If you run into any issues or problems with this, large or small, please let me know in the [Issues tracker](https://github.com/Nystrata/EchoesWidescreenHUD/issues).

## Patching the Game
**For Windows**
1. Download from [Releases](https://github.com/Nystrata/echoeswidescreenhud/releases) and extract this mod's folder.
2. Make a copy of the game and rename it to `echoes.iso`. Place it in the mod's folder.
3. Run the included **patch.bat** - it should automatically detect whether your game is NTSC or PAL and patch accordingly. 
4. This will create a new ISO file called echoes_*version*_widescreenhud.iso with the mod installed

>[!NOTE]
> If you named your file echoes.iso, but the patch script still reports echoes.iso not found,  
> You may have the "Hide extensions for known file types" option enabled in File Explorer.   
> **Try naming your file just as `echoes` and then run script again.**

For not Windows, see [Extra Instructions - Wiki](https://github.com/Nystrata/EchoesWidescreenHUD/wiki/Extra-Instructions#patching-the-game-for-not-windows)

## Widescreen for Dolphin

#### Gecko Code Method    
  In Dolphin, choose Force 16:9 for the Aspect Ratio (Options -> Graphics Settings -> General -> Aspect Ratio)   
  Right-click the Metroid Prime 2: Echoes in the game list, click Properties, and apply the code to the Gecko Codes tab.  
  
  * NTSC-U 16:9 Aspect Ratio:  
    (Taken from [Dolphin Emulator Wiki](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_2:_Echoes_(GC)#16:9_Aspect_Ratio_Fix))  
     ```
     $16:9 Widescreen [gamemasterplc] (NTSC-U Only)
     C230256C 00000002
     3DC04000 91C20000
     C3420000 00000000
     C236D684 00000004
     3DC03FAA 61CEAAAB
     91C20000 C2620000
     ED330272 ED6A4824
     60000000 00000000
     ```
  * PAL 16:9 Aspect Ratio:  
    (This is experimental. I ported this from the above code)  
    ```
    $16:9 Widescreen [gamemasterplc, Nystrata] (PAL Only) 
    C23029E0 00000002
    3DC04000 91C20000
    C3420000 00000000
    C236DAA0 00000004
    3DC03FAA 61CEAAAB
    91C20000 C2620000
    ED330272 ED6A4824
    60000000 00000000
    ```  
  **Make sure Widescreen Hack is *disabled* in Dolphin when using this code!**  
  To disable Widescreen Hack, go to Options -> Graphics Settings -> Enhancements -> Uncheck Widescreen Hack

#### Widescreen Hack Method 
See [Wiki: Widescreen for Dolphin: Widescreen Hack Method](https://github.com/Nystrata/EchoesWidescreenHUD/wiki/Extra-Instructions#widescreen-for-dolphin-widescreen-hack-method)

## Widescreen for Nintendont
**Widescreen Hack Method (NTSC-U and PAL)**  
You may try Nintedont's "Force Widescreen" option, but this has not been extensively tested. (It's worked quite well in my experience.)  
  
**Gecko Code Method (NTSC-U Only)**  
For Nintendont, in the [extras folder](https://github.com/Nystrata/EchoesWidescreenHUD/tree/main/extras), you can use G2ME01.gct for the Widescreen codes.   

***
## Mod Compatibility
### PrimeHack
This mod should work with the [PrimeHack](https://forums.dolphin-emu.org/Thread-fork-primehack-fps-controls-and-more-for-metroid-prime) Dolphin fork.  
Follow the same instructions for [Widescreen for Dolphin](#widescreen-for-dolphin).    

### Echoes Menu
To use this with [Claris's Echoes Menu](https://www.dropbox.com/s/yhqqafaxfo3l4vn/Echoes%20Menu.7z) practice mod,  
patch the game ISO with EchoesWidescreenHUD first before using the EchoesMenu patcher.  
(You can also use [Echoes Menu Mod GUI](https://github.com/henriquegemignani/echoes-menu-mod-gui) to simplify the process - skipping the need to extract files or use the command-line tool.)

### Randovania
To use this with the [Randovania randomizer](https://randovania.org/games/prime2/),  
patch the vanilla game ISO with EchoesWidescreenHUD first, then select it as the Input ISO when exporting the game from Randovania.  

Because Randovania changes the game ID for Echoes Randomizer, make sure you apply the widescreen codes, settings, and Game INI changes to Echoes Randomizer in Dolphin or Nintendont too!

> [!NOTE]  
> While mod does work with Randovania, it is currently *not* supported by Randovania developers.  
> Do not report bugs to the Randovania developers while using this mod.

***
## Other Details

### For tips on improving Dolphin performance with the Metroid Prime games
See the [Dolphin Setup Guide by erinexplosives](https://docs.google.com/document/d/16Knvj8sfz1Tw7blEqfHbjn59jNlKY1cmtWmHLL5_cSU/edit)

### If you're looking for a version for Metroid Prime 1
See Aruki's [Widescreen Hud Mod for Metroid Prime](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod)    

### Files changed
- GGuiSys.pak
  - FRME_SamusHud1Combat.FRME, FRME_SamusHud1Combat_0.FRME  (Combat Visor, Dark Visor, Echo Visor)
  - FRME_Helmet.FRME
  - FRME_ScanHudFlat_0.FRME, FRME_ScanHudFlat_1.FRME
  - FRME_SamusHud1Ball.FRME (Morph Ball HUD)
- Standard.ntwk
  - TweakGui > Unknown (BallViewportYReduction) (Remove cimematic black bars from Morph Ball view)  

Additional details about these files can be found on [Notes: Known Files - Wiki](https://github.com/Nystrata/EchoesWidescreenHUD/wiki/Notes#known-files).

### To-Do
- [X] [Remove cimematic black bars from Morph Ball view](https://github.com/Nystrata/EchoesWidescreenHUD/issues/1)
- [ ] [Remove cimematic black bars from Cutscenes](https://github.com/Nystrata/EchoesWidescreenHUD/issues/2)
- [X] [Adjust Morph Ball Hud](https://github.com/Nystrata/EchoesWidescreenHUD/issues/3)
- [ ] [Rescale Beam/Visor icons](https://github.com/Nystrata/EchoesWidescreenHUD/issues/5)
- [ ] [Adjust map screen](https://github.com/Nystrata/EchoesWidescreenHUD/issues/4)
- [ ] [Adjust pause menu](https://github.com/Nystrata/EchoesWidescreenHUD/issues/4)

There are no plans to support Multiplayer modes.

### Special Thanks  
- Yonder, for use of their [editor](https://github.com/xchellx/three.js)
- Aruki, for the original [Widescreen Hud Mod for Metroid Prime](https://wiki.dolphin-emu.org/index.php?title=Metroid_Prime_(GC)#16:9_HUD_Mod)
- The [Metroid Prime Modding Discord Server](https://discord.gg/pTQZcFS) and [Retro Modding Wiki](https://wiki.axiodl.com/w/Main_Page)
- This mod includes [NODTool](https://github.com/AxioDL/nod) for extracting and building the game ISO  
  and xdelta3 for patching.

### Screenshots
![Combat Visor](https://github.com/Nystrata/EchoesWidescreenHUD/assets/15365192/307816f2-c4e0-48b1-a4e6-d789552dec9f)  
![Morph Ball](https://github.com/Nystrata/EchoesWidescreenHUD/assets/15365192/f4b94587-a3c3-4532-a1a0-56eda6abf99e)
(These screenshots uses parts of [Metroid Prime Trilogy - HD Interface Textures](https://forums.dolphin-emu.org/Thread-metroid-prime-trilogy-hd-interface-textures-v-1-7-may-01-2021).)  
More screenshots can be found on the [Screenshots page](https://github.com/Nystrata/EchoesWidescreenHUD/wiki/Screenshots).  

***

nys
