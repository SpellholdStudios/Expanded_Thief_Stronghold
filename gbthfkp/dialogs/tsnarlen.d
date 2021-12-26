BEGIN ~TSNARLEN~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
  SAY @1 /* ~'Ere there! Good fortune I spy ye! 'Twas the lads and I and Lily, not a long trot from the city 'fore we were knackered by a gang of land pirates just off the rum pad.~ */
  = @2 /* ~Orcs I reckon wit a hanged gallows look. Half the lads are havin' a chat wit' the devil an' Lily an' the rest trussed up all in king's plate. Meself, I took the burning keen with a posse mobilatis on me heels.~ */
  = @3 /* ~Now I reckon wit' yer help we should pay a visit to swaddlers' flash ken and spring our birds afore the lot are all used up. What say ye? Up fer the wet work?~ */
  IF ~~ THEN REPLY @4 /* ~Aye! We'll let fly our birds of a feather and hush the fobbers 'fore they wake to the morn.~ */ GOTO 3
  IF ~~ THEN REPLY @5 /* ~Yer a blasted fellow, Narlen and I'll sink my knife in your soft side and send you screamin' yer flash lingo all the way to the hells. Draw steel fool!~ */ GOTO 4
END

IF ~~ THEN BEGIN 3
  SAY @6 /* ~Bene rum then! We'll meet astride the City Gate when ye 'ave got yer boots on!~ */
  IF ~~ THEN DO ~SetGlobal("TSNarlenMove","GLOBAL",1)
  EscapeAreaMove("AR0020",886,485,3)~ JOURNAL @7 /* ~Rescue Black Lily and the Baldur's Gate rogues

The rogues from Baldur's Gate have been ambushed by orcish bandits! Narlen Darkwalk barely managed to escape alive and Black Lily and the rest are held prisoner in the bandit's hideout. I am to meet Narlen this evening, before midnight, in the City Gates district near the gate. Many of the rogues are already dead and if we don't act soon it will be too late to save Black Lily and the gang from ending up in an orcish cookpot!~ */ EXIT
END

IF ~~ THEN BEGIN 4
  SAY @8 /* ~What? An' that's the way it is 'eh? I'll not go to me wry neck day meek as a nap!~ */
  IF ~~ THEN DO ~DestroyItem("ImoenHP1")
  Enemy()~ JOURNAL @9 /* ~Narlan Darkwalk - A Blasted Fellow!

The fool, Narlen Darkwalk, had the nerve to ask me for help. I refused of course and killed him. Serves him right after his antics in Baldur's Gate.~ */ EXIT
END

IF ~AreaCheck("AR0020")
Global("TSNarlenMove","GLOBAL",1)~ THEN BEGIN 5
  SAY @10 /* ~Aye then. Are ye ready? I'll take you to the dive 'fore the morn.~ */
  IF ~~ THEN REPLY @11 /* ~Yes. Let's go.~ */ GOTO 6
  IF ~~ THEN REPLY @12 /* ~Not yet. I need some time to prepare.~ */ GOTO 7
END

IF ~~ THEN BEGIN 6
  SAY @13 /* ~This way, <CHARNAME>.~ #74244 */
  IF ~~ THEN DO ~SetGlobal("TSNarlenMove","GLOBAL",2)
  ClearAllActions()
  StartCutSceneMode()
  StartCutScene("tsncut1")~ EXIT
END

IF ~~ THEN BEGIN 7
  SAY @14 /* ~Tarry not long, else Lily and the natty lads'll be riding the horse foaled by an acorn come mornin' wise.~ */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("TS0010")
CombatCounter(0)
Global("TSNarlenMove","GLOBAL",2)
!Dead("TSNDoor")~ THEN BEGIN 8
  SAY @15 /* ~Here we be. Wander not. The grunters are just to the north.~ */
  IF ~~ THEN DO ~SetGlobal("TSNarlenTalk","LOCALS",1)~ EXIT
END

IF ~Global("TSNarlenCave","LOCALS",1)~ THEN BEGIN 9
  SAY @16 /* ~This way <CHARNAME>. The rankers' lair is in yonder cave.~ */
  IF ~~ THEN DO ~SetGlobal("TSNarlenCave","LOCALS",2) EscapeAreaMove("TS0011",452,1232,3)~ EXIT
END

IF ~OR(2)
  AreaCheck("TS0010")
  AreaCheck("TS0011")
CombatCounter(0)
Global("TSNarlenMove","GLOBAL",2)
Dead("TSNBad1")
!Dead("TSBlackL")~ THEN BEGIN 10
  SAY @17 /* ~Done 'n done, 'n not too badly! We'll mourn the hushed when rug at the stop hole abbey. See ye on the second floor 'o the guild, <CHARNAME>.~ */
  IF ~~ THEN DO ~SetGlobal("TSNarlenTalk","LOCALS",1)
  SetGlobal("TSNarlenMove","GLOBAL",3)
  EscapeAreaMove("AR0323",793,654,4)~ EXIT
END

IF ~OR(2)
  AreaCheck("TS0010")
  AreaCheck("TS0011")
CombatCounter(0)
Global("TSNarlenMove","GLOBAL",2)
Dead("TSNBad1")
Dead("TSBlackL")~ THEN BEGIN 11
  SAY @18 /* ~Done 'n done, though 'tis a shame 'bout the Lily. I'll miss her dear. We'll mourn the hushed when rug at the stop hole abbey. See ye on the second floor 'o the guild, <CHARNAME>.~ */
  IF ~~ THEN DO ~SetGlobal("TSNarlenTalk","LOCALS",2)
  SetGlobal("TSNarlenMove","GLOBAL",3)
  EscapeAreaMove("AR0323",793,654,4)~ EXIT
END

IF ~AreaCheck("AR0323")
Global("TSNarlenDufus","GLOBAL",0)
Global("TSNarlenWork","GLOBAL",0)~ THEN BEGIN 12
  SAY @19 /* ~Aye now <CHARNAME>, the lads and I will keep the swag flowin'. Just check yer strong box ever' five days or so.~ */
  IF ~~ THEN DO ~SetGlobal("TSNarlenWork","GLOBAL",1)
  SetGlobal("TSNarlenDufus","GLOBAL",1)
  SetGlobalTimer("TSSmugglerTimer","GLOBAL",FIVE_DAYS)~ JOURNAL @20 /* ~The Baldur's Gate rogues

Narlen and the Baldur's Gate rogues will bring in the loot hand over fist, I'm sure. I've been told to check the strongbox in my bedroom on the second floor of the guild every five days or so for my share of the spoils. It's as good as gold in the bank, as they say. I'm sure Narlen and his gang will make a fine addition to my team.~ */ EXIT
END

IF ~AreaCheck("AR0323")
Global("TSNarlenWork","GLOBAL",1)
Global("TSNarlenDufus","GLOBAL",1)
Global("TSNarlenReminds","LOCALS",0)~ THEN BEGIN 13
  SAY @21 /* ~Anythin' to please, <CHARNAME>. Do you need anything?~ */
  IF ~~ THEN REPLY @22 /* ~Where did you say you would store the loot?~ */ GOTO 14
END

IF ~~ THEN BEGIN 14
  SAY @23 /* ~All the swag me fellows take, we'll stash in the strongbox. 'Tis in your office, as you well know, on this very floor.~ */
  IF ~~ THEN DO ~SetGlobal("TSNarlenReminds","LOCALS",1)~ EXIT
END

IF ~AreaCheck("AR0323")
Global("TSNarlenWork","GLOBAL",1)
Global("TSNarlenDufus","GLOBAL",1)
Global("PGFailed","GLOBAL",0)
!PartyHasItem("TSKey")~ THEN BEGIN 15
  SAY @24 /* ~Anythin' to please, <CHARNAME>. Do you need anything?~ */
  IF ~~ THEN REPLY @25 /* ~I seem to have misplaced the key to my strongbox. Do you have a copy?~ */ GOTO 16
END

IF ~~ THEN BEGIN 16
  SAY @26 /* ~Nay. We can put things in, but only you can open the box. The best crack box we have canna open it.~ */
  = @27 /* ~We can but destroy the box and 'ave another made. 'Tis an expensive process, however.~ */
  IF ~~ THEN REPLY @28 /* ~How much?~ #71262 */ GOTO 18
END

IF ~~ THEN BEGIN 18
  SAY @29 /* ~Five thousand gold, or thereabouts. A kings ransom sure. Do ye wish it done?~ */
  IF ~PartyGoldGT(4999)~ THEN REPLY @30 /* ~Yes, do it.~ */ GOTO 19
  IF ~~ THEN REPLY @31 /* ~No perhaps I'll find it somewhere...~ */ EXIT
END

IF ~~ THEN BEGIN 19
  SAY @32 /* ~Here ye go an' take care the bung nipper doesn't nab it.~ */
  IF ~~ THEN DO ~GiveItemCreate("TSKey",Player1,0,0,0)   TakePartyGold(5000)~ EXIT
END

IF ~AreaCheck("AR0323")
Global("PGFailed","GLOBAL",1)~ THEN BEGIN 20
  SAY @33 /* ~'Tis a shame truly, the Bloodscalp puttin' the outfit in an ironmonger's works.~ */
  IF ~~ THEN EXIT
END

IF ~Global("TSNarlenWork","GLOBAL",1)
Global("TSNarlenReminds","LOCALS",1)
Global("TSNarlenDufus","GLOBAL",1)~ THEN BEGIN 21
  SAY @34 /* ~Ye're a rum Dimber Damber <CHARNAME>, 'n I'll tells it to all I meet.~ */
  IF ~~ THEN EXIT
END
