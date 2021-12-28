![Latest Release](https://img.shields.io/github/v/release/GwendolyneFreddy/Expanded_Thief_Stronghold?include_prereleases&color=darkred)<a name="top" id="top"> </a>
![GitHub (Pre-)Release Date](https://img.shields.io/github/release-date-pre/GwendolyneFreddy/Expanded_Thief_Stronghold?color=gold)
![Platform](https://img.shields.io/static/v1?label=platform&message=windows%20%7C%20macOS%20%7C%20linux%20%7C%20Project%20Infinity&color=informational)
![Language](https://img.shields.io/static/v1?label=language&message=English%20%7C%20French%20%7C%20German%20%7C%20Russian%20%7C%20Spanish&color=limegreen)

![Supported games](https://img.shields.io/static/v1?label=supported%20games&message=BGII:ToB%20%7C%20BGT&color=dodgerblue)

<div align="center"><h1></a>Expanded Thief Stronghold (WIP)</h1>

<h3>A mod hosted at Spellhold Studios for Baldur's Gate II: ToB<h3>

</div><br>


**Author:** Gerard Blucher  
**Mod Forum:** <a href="">TODO</a><br><br>

## 

[![Created Badge](https://badges.pufler.dev/created/GwendolyneFreddy/Expanded_Thief_Stronghold?style=plastic)](https://badges.pufler.dev)
![GitHub repo size](https://img.shields.io/github/repo-size/GwendolyneFreddy/Expanded_Thief_Stronghold?style=plastic)
[![Visits Badge](https://badges.pufler.dev/visits/GwendolyneFreddy/Expanded_Thief_Stronghold?color=cyan&style=plastic)](https://badges.pufler.dev) 
![Maintenance](https://img.shields.io/static/v1?label=maintained%3F&message=yes&color=greenlight&style=plastic)
![GitHub contributors](https://img.shields.io/github/contributors/GwendolyneFreddy/Expanded_Thief_Stronghold?color=blueviolet&style=plastic) [![Contributors Display](https://badges.pufler.dev/contributors/GwendolyneFreddy/Expanded_Thief_Stronghold?size=30&padding=5&bots=true)](https://badges.pufler.dev)


<hr>




<hr>


## <a name="versions" id="versions"></a>Versions History

##### Version 3.0.0 &nbsp;(, 2021)

- Added *gbthfkp.ini* metadata file (including dynamic installation order syntax and global `LABELS`) to support AL|EN's "Project Infinity"
- Replaced `AUTHOR` keyword with `SUPPORT`
- Added Immutability concept.
- 
- 
- Externalized tp2 code into *main_component.tpa* library for more comfortable readability and maintenance.
- Commented code as much as possible.
- Added `REQUIRE_PREDICATE` conditions to avoid installing the mod in inaccurate games.
- Added native BG2:EE and EET compatibility
    - Added WeiDU's built-in `HANDLE_CHARSETS` function to convert string entries for EE games.
    - Added `ADD_JOURNAL` entries.
    - Removed items usability restriction flags in items descriptions for EE games with `GW_UPDATE_ITM_DESCRIPTION_TO_EE` WeiDU function.
    - Provided accurate sized NPC portraits for EE games.
- Replaced old portraits with PPE ones to insure compatibility with EE games (it was impossible to resize the original ones).
- Replaced .wav sound clips with .ogg files, rewrote their installation procedure with WeiDU's built-in `HANDLE_AUDIO` function, and provided localized missing sound clips only when needed.
- Script files: removed *OnCreation()* action from blocks that have a `LOCALS/GLOBAL` associated with them.
- Spells installation: removed useless `SAY NAME2` patches
- Included BWP Fixpack fixes: Vlad's Timer problem fix <a href="http://www.shsforums.net/topic/47635-notes-oddities-and-possible-bugs-in-my-bwp-game-spoilers/?p=581787">here</a> and <a href="http://www.shsforums.net/topic/47635-notes-oddities-and-possible-bugs-in-my-bwp-game-spoilers/?p=581804">here</a>.
- Modernized area patching with homemade `GW_ALTER_AREA_ENTRANCE` and `GW_ALTER_AREA_REGION` WeiDU function. 
- <ins>Sword of Olidammara +4</ins> (ts5loot1.itm):
    - Fixes wrong effects probability (15 %, was 5%).
    - Fixed wrong portrait icon (Confused, was Charmed).
- Hard-coded general items names and descriptions whenever relevant.
- Moved installation messages from *gwthfkp.tra* file *setup.tra* file for more comfortable readability.
- Added foreign languages WeiDU prompts when available.
- Proofread English strrefs (Gwendolyne).
- Added French translation (by ).
- Moved useless files into new :file_folder: "*legacy*" folder.
- Lower cased files.
- Included Linux and mac OS versions in the same package (thanks AL|EN's Infinity Auto Packager tool!).
- Added OggDec to v1.9.7 and added sox v14.4.1 for mac.
- Added archive libiconv-1.9.2-1-src.7z with iconv license info
- Updated WeiDU installer to v249.
- Uploaded mod to official Spellhold Studios GitHub mirror account

## 
 
##### Version 2.20 &nbsp;(April 1, 2010)

- Wisp’s Unfinished Business compatibility fix.
- Updated WeiDU installer to v215.

## 

##### Version 2.19 &nbsp;(November 08, 2009) - by Leomar

- Added Russian translation by Aerie.ru + prowler.
- Updated WeiDU installer to v211.

## 

##### Version 2.18 &nbsp;(November 08, 2009) - by Leomar

- Updated Spanish translation.

## 

##### Version 2.17 &nbsp;(May 25, 2009) - by Leomar

- Completed and revised German translation by Roter Berserker.

## 

##### Version 2.16 &nbsp;(April 01, 2009) - by Leomar

- White Agnus’ added a BGT and language check, so no English wav-files.
- Removed GBTfkp.bat.
- Updated Read Me.
- Updated WeiDU installer to v210.

## 

##### Version 2.15 &nbsp;(November 23, 2008) - by Leomar

- GBThfKp.tp2: <a href="http://kerzenburg.nightisforum.de/showpost.php?p=894401&postcount=206">Taimon's area crash fix</a>.
- Zeroed effects offset in TSPick1.cre, TSPick2.cre, TSPick3.cre, TSPick4.cre, TSPick5.cre, TSPick6.cre, TSPick7.cre and TSPick8.cre.
- Added `VERSION` flag.
- Updated WeiDU installer to v208.

## 

##### Version 2.14 &nbsp;(July 28, 2006)

- If you want the old Improved Mae'Var, it can be found in the /_debug/impmaevar.rar archive; just extract the files into the override.
- Also, added a few banters, and tweaked (reduced) the environnemental chat in the tavern front of the guild. Some other minor changes.

## 

##### Version 2.13 &nbsp;(July 26, 2006) - Some significant changes.

- After much deliberation and some discussion, I've decided to remove the "Improved Mae'Var" component of the mod completely. If you want him, it is still out there in Westly Weimer's Tactics mod (in pretty much the same form as when I sent him off to Wes). Increasing the difficulty of the game is not part of this mod.
- Another change is that you may now enter the Dock Barracks before the assault on the guild house. I had originally cut that area off until the assault to prevent some possible exploits, but I've decided that it doesn't matter. Besides, as SixOfSpades told me, it's nice to go in there and talk to the guards when you aren't on the quest. This mod is about expanding the content of the game, not removing access to content (no matter how thin that content may be).
- The storefront is now a proper tavern, a real "front" for the illegal activities within. Rattell now has drinks for sale (I highly recommend tasting the Old Winyards wine, myself), and there are a few patrons inside getting drunk, as well as saucy tavern wench! Brannel (the guard who used to be outside the guild) is now located inside. He serves as a bouncer keeping people out of the back rooms.
- Every half a tenday the chance that your thieves will be arrested is recalculated, based on the difficulty of the tasks assigned to them. Previously I had carried over a scripting (quirk? error? inconsistency?) made by Bioware that allowed thieves to operate with impunity, no matter how outrageous your demands, as long as you didn't change their activities. Now there is always a chance each week that your thieves will be caught by the law, unless you assign them to be inactive (in which case they are doing nothing but cooling their heels, and so risk no chance of getting arrested).
- On a more technical note, I've made further changes to the .tp2 and other files in the mod package. Most changes were made with an eye to improving "friendliness" with other mods. (Though *some* small amount of destructive patching remains in place in regards to the few NPCs and areas comprising the stronghold experience. This is a conscious decision on my part, as obviously changes within the guild are quite extensive and many are vital to the proper functioning of this mod.) However, unless you install another mod making changes to the actual guild and its NPCs, there should be no problems. (Note that this only makes sense as two mods trying to do similar things logically won't work together despite the virtues of WeiDU without some coordination between the mod makers.)
- Also I've cleaned up quite a few of the .tra and .d files to make them easier to read, and the changes to them more apparent. Lastly this version has the usual tweaks and buglet fixes, etc., etc.

## 

##### Version 2.12

- Fixed a dumb .tp2 file mistake. Doh!

## 

##### Version 2.11 &nbsp;(July 23, 2006)

- Tweaked the stores, added some new dialogue.
- Extensive mod and .tp2 file optimization.
- In this version you must be a thief to get the guild. I didn't like the way I patched Renal's dialogue previously. So if you still want the guild and your character isn't a thief, you will have to use the NotThief custom PC script in the GBThfKp/_debug directory (at least for now).
- Mae'var and his goons will not attempt to move toward invisible characters if they can no longer see anyone. Feel free to cheese them for an easy win, if you are into that sort of thing.

##### Version 2.10 &nbsp;(July 21, 2006)

- Fixed a compatibility issue with the Amber mod (tested).
- Also this may clear up any issues the mod may have had with later versions of TTD (untested).
- Some associated tweaks that I doubt anyone but myself would notice.

## 

##### Version 2.9 &nbsp;(July 20, 2006)

- Disabled the "Random Encounters" and the "Remove Improved Mae'Var" components. The random encounters may return, but right now I find them to be too annoyingly frequent. As for Mae'var, I like his "improveness" and feel the component to remove him is unneeded.
- Also some minor tweakage and buglet fixes:
  - fixed a problem with the area outside of the orc being flagged as a random encounter (no save) area.
  - tweaked a few lines of dialogue.
  - removed some extra gem, etc. bags from the stronghold.
  - fixed the infamous "noblewoman 4" buglet.
  - a few other, very minor, changes.

## 

##### Version 2.8

- Fixed a minor translation error (missing string with the new 'remove improved Mae'Var' component. Thanks again Dyara! (I translated the Spanish entry myself, and it probably shows. :-)

## 

##### Version 2.7

- New install-time option to disable the Improved Mae'Var component of this mod.

## 

##### Version 2.6

- Fixed minor compatibility issue with the Kelsey mod.
- Made note that Renal will offer the guild to any class, not just thieves.
- Very minor and long over-due fixes to this file. It's still ugly though.

## 

##### Version 2.5

- Bug fixes (thanks Dyara and Sherman Wang).
- Added Spanish translation (thanks Dufroise and Immortality of Clan DLAN).

## 

##### Version 2.4 &nbsp;(July 1, 2002)

- Minor changes, removed scripts (they're on my site if you want them).

## 

##### Version 2.3

- German translation. Wow! Thanks a lot Dyara!
- Fixed the readme.
- Included the 'notthief' script.

## 

##### Version 2.2

- Some minor tweaks, a few additions (don't want to spoil you).

## 

##### Version 2.1

- Minor additions, scripting tweaks, NPC portraits, etc.

## 

##### Version 2.0

- First WeiDU format release, minor additions.

## 

##### Version 1.1

- Minor Bug fixes and additions.

## 

##### Version 1.0

- Initial release (in TBG format).
