// creator  : D:\BG2\WEIDU.EXE (version 38)
// argument : TSBLACKL.DLG
// game     : .
// source   : .\override\TSBLACKL.DLG
// dialog   : .\dialog.tlk
// dialogF  : (none)

BEGIN ~TSBLACKL~

IF ~OR(2)
AreaCheck("TS0010")
AreaCheck("TS0011")
Dead("TSNBad1")
Dead("TSNarlen")
~ THEN BEGIN 0 // from:
  SAY @1 /* ~Thank you <CHARNAME>, for releasing us!  I do believe they were about to eat us!  Where's Narlen, I...?  Oh dear.  (sigh) ~ [BLACKL01] #74264 */
  IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY @2 /* ~I... there will be time for mourning later.  We will bury the fallen and meet you at your guildhouse, <CHARNAME>.~ #74265 */
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 2 // from: 1.0
  SAY @3 /* ~Come rogues.  Let us be off!~ #74266 */
  IF ~~ THEN DO ~SetGlobal("TSNarlenMove","GLOBAL",3)
EscapeAreaMove("AR0323",837,512,2)~ EXIT
END

IF ~OR(2)
AreaCheck("TS0010")
AreaCheck("TS0011")
!Dead("TSNBad1")
~ THEN BEGIN 3 // from:
  SAY @4 /* ~Off wit' you now.  I've got killin' to do! ~ [BLACKL02] #74267 */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR0323")
!Dead("TSNarlen")
Global("LilyTalk","LOCALS",0)
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 4 // from:
  SAY @5 /* ~Greetings <CHARNAME>!  'Tis a fine guild you have here.  Narlen and I will see this place run proper, with northern know-how and industry!~ #74268 */
  IF ~~ THEN DO ~SetGlobal("LilyTalk","LOCALS",1)~ GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 4.0
  SAY @6 /* ~Narlen and the lads will handle the sneaksmen's work and I will serve as your accountant and fence.  There'll be no skimming from the guild's coffers whilst I'm on the job, rest assured!~ #74269 */
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 17.0 5.0
  SAY @7 /* ~Oh, I won't be stepping on Rattel's toes!  He and I have had a talk.  As a fence, I deal exclusively in gems and jewelry, now.  I have buyers throughout the Sword Coast, from Calimsham to Waterdeep.~ #74270 */
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 7 // from: 6.0
  SAY @8 /* ~I'll get top gold for all such items you bring me.  Bear in mind, however, that once I've sold an item, it's gone for good!  My buyers demand secrecy and the utmost discretion.~ #74271 */
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY @9 /* ~Now then, is there anything else you need of me before I get started?~ #74272 */
  IF ~~ THEN REPLY @10 /* ~No Black Lily, and welcome to the guild.~ #74273 */ GOTO 9
  IF ~~ THEN REPLY @11 /* ~I have to know...  Why were you and Narlen sent here?  I'm surprised to see so many of Baldur's Gate's top thieves sent to Athkatla.~ #74274 */ GOTO 10
END

IF ~~ THEN BEGIN 9 // from: 8.0
  SAY @12 /* ~Thank you <CHARNAME>.  I can see that there are some things I need to attend to already!  If you'll excuse me...~ #74275 */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 10 // from: 8.1
  SAY @13 /* ~Well... you remember old Ravenscar, no?~ #74276 */
  IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 11 // from: 10.0
  SAY @14 /* ~Of course you do.  Let's just say that Ravenscar has never forgiven Narlan for standing up to him and defending you when he was to have you killed.~ #74277 */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 12 // from: 11.0
  SAY @15 /* ~Ravenscar has had it out for Narlen ever since and, just between you and me, I daresay he would've arranged for some sort of an 'accident' had he not this opportunity to get Narlen out of his hair.~ #74278 */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 13 // from: 12.0
  SAY @16 /* ~The rest of the rogues were either too loyal to Narlen to stay in Baldur's Gate or, in some cases, they just wanted to travel.  Athkatla is the heart of the Shadow Thieves and there are many opportunities, here, for a daring rogue.~ #74279 */
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 14 // from: 13.0
  SAY @17 /* ~As for myself, well, I have my own reasons.  Let's just say that I wanted a bit of a change.  I also know a good thing when I see it.  I imagine that working for you will prove quite rewarding.~ #74280 */
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 15 // from: 14.0
  SAY @18 /* ~Now if you'll excuse me, <CHARNAME>.  I need to get settled in.  I can see that there are some things I need to attend to already!~ #74281 */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR0323")
Dead("TSNarlen")
Global("LilyTalk","LOCALS",0)
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 16 // from:
  SAY @19 /* ~Greetings <CHARNAME>!  'Tis a fine guild you have here.  We'll see this place run proper, with northern know-how and industry!~ #74282 */
  IF ~~ THEN DO ~SetGlobal("LilyTalk","LOCALS",1)~ GOTO 17
END

IF ~~ THEN BEGIN 17 // from: 16.0
  SAY @20 /* ~'Tis a shame about Narlen, truly a shame.  'Tis also a shame that so many of our company were killed on the way here.  Were they alive, we might have been able to increase this guild's profits substantially.  Regardless, I'm sure they'll do just fine in the hierarchy already in place.  I, however, will serve as your accountant and fence.  There'll be no skimming from the guild's coffers whilst I'm on the job, rest assured!~ #74283 */
  IF ~~ THEN GOTO 6
END

IF ~AreaCheck("AR0323")
!InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 18 // from:
  SAY @21 /* ~Off wit ye now!  I've got counting to do. ~ [BLACKL02] #74117 */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR0323")
!Global("PGFailed","GLOBAL",0)
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 19 // from:
  SAY @22 /* ~We're losing gold, by the hour <CHARNAME>.  Pay Renal already, and get us back to work!~ #74284 */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR0323")
Global("LilyTalk","LOCALS",1)
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 20 // from:
  SAY @23 /* ~G'day to ye <CHARNAME>.  The book are all in order.  I'll make these thieves honest... in their dealing wit' ye, of course.  Have ye any baubles for me to fence, perchance?~ #74285 */
  IF ~~ THEN REPLY @24 /* ~Yes, I do.  I need you to get rid of these items quickly.  They're too hot to handle.~ #74286 */ GOTO 21
  IF ~~ THEN REPLY @25 /* ~No, not at this time.~ #23450 */ GOTO 22
END

IF ~~ THEN BEGIN 21 // from: 20.0
  SAY @26 /* ~Indeed?  Well then, let's see what ye have.  Fret not, <CHARNAME>, I'll get a good price for them, ye can be sure!~ #74287 */
  IF ~~ THEN DO ~StartStore("TSBlackL",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN 22 // from: 20.1
  SAY @27 /* ~I'll be here as ye like.~ #74288 */
  IF ~~ THEN EXIT
END
