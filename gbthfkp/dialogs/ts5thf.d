// creator  : D:\BG2\WEIDU.EXE (version 38)
// argument : TS5THF.DLG
// game     : .
// source   : .\override\TS5THF.DLG
// dialog   : .\dialog.tlk
// dialogF  : (none)

BEGIN ~TS5THF~

IF ~Global("TS5Move","GLOBAL",0)
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 0 // from:
  SAY @1 /* ~Greetings <CHARNAME>!  Is it time?  Renal sent us to aid you in your assault on the barracks.  We are yours to command 'til this is over.~ #74291 */
  IF ~~ THEN REPLY @2 /* ~It is time.  Go to the barracks entrance.  I'll meet you there.~ #74292 */ DO ~SetGlobal("TS5Move","GLOBAL",1)~ GOTO 1
  IF ~~ THEN REPLY @3 /* ~I'll let you know when I'm ready.  Stay put until then.~ #74293 */ GOTO 10
END

IF ~~ THEN BEGIN 1 // from: 2.0 0.0
  SAY @4 /* ~You heard the <MANWOMAN>!  Move out!~ #74294 */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2 // from:
  SAY @5 /* ~<NO TEXT>~ #0 */
  IF ~~ THEN REPLY @6 /* ~It is time.  Go to the barracks entrance.  I'll meet you there.~ #74292 */ DO ~SetGlobal("TS5Move","GLOBAL",1)~ GOTO 1
END

IF ~Global("TS5Move","GLOBAL",1)
  InPartySlot(LastTalkedToBy(Myself),0)
  Dead("TS5Door")~ THEN BEGIN 3 // from:
  SAY @7 /* ~We await your command <CHARNAME>.~ #74295 */
  IF ~~ THEN REPLY @8 /* ~Begin the assault!  I'll meet you inside once I've secured this area.~ #74296 */ DO ~SetGlobal("TS5Move","GLOBAL",2)~ GOTO 4
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY @9 /* ~At once!  Move out rogues!  Go!  Go!~ #74297 */
  IF ~~ THEN EXIT
END

IF ~Global("TS5Move","GLOBAL",2)
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 5 // from:
  SAY @10 /* ~Looks like we'll have to clear this place out one room at a time, <SIRMAAM>.  It'll be tough going!~ #74298 */
  IF ~~ THEN REPLY @11 /* ~Indeed.  Now. get a move on!  Pick off any stragglers and flush the rest out of their holes.  We'll herd them like lambs to the slaughter.~ #74299 */ DO ~SetGlobal("TS5Move","GLOBAL",3)~ GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 5.0
  SAY @12 /* ~Yes <SIRMAAM>!~ #74300 */
  IF ~~ THEN EXIT
END

IF ~Global("TS5Move","GLOBAL",3)
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 7 // from:
  SAY @13 /* ~We've got 'em on the ropes, chief!~ #74301 */
  IF ~~ THEN REPLY @14 /* ~Don't get too cocky.  I want you and the rest of your gang to advance.  Clear out those hallways.  I don't want to get caught in an ambush.  Now get moving!~ #74302 */ DO ~SetGlobal("TS5Move","GLOBAL",4)~ GOTO 8
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY @15 /* ~Move it slugs!  You heard <LADYLORD> <CHARNAME>!~ #74303 */
  IF ~~ THEN EXIT
END

IF ~Global("TS5Move","GLOBAL",4)
  Dead("TS5Bad")~ THEN BEGIN 9 // from:
  SAY @16 /* ~Perfectly executed <CHARNAME>!  'Twas a pleasure serving under you.  Meet us at the Sea's Bounty, aye?  The first round is on me!~ #74304 */
  IF ~~ THEN REPLY @17 /* ~I just might take you up on that offer.   Well done rogues!  Fall out!~ #74305 */ DO ~SetGlobal("TS5Move","GLOBAL",5)~ EXIT
END

IF ~~ THEN BEGIN 10 // from: 0.1
  SAY @18 /* ~As you wish.  Just speak to any one of us when you are ready.~ #74306 */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR0313")
Global("BuyDrink","LOCALS",0)
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 11 // from:
  SAY @19 /* ~Ah, <CHARNAME>!  There you are!  We're just getting started.  Allow me to buy you a drink?~ #74307 */
  IF ~~ THEN REPLY @20 /* ~Yes, thank you.  Let's see... some Alurlyath Wine should do nicely.~ #74308 */ DO ~SetGlobal("BuyDrink","LOCALS",1)
    AddexperienceParty(2500)~ GOTO 12
  IF ~~ THEN REPLY @21 /* ~An excellent suggestion!  I'll take an Arabellan Wine please.~ #74309 */ DO ~SetGlobal("BuyDrink","LOCALS",1)
    AddexperienceParty(2500)~ GOTO 13
  IF ~~ THEN REPLY @22 /* ~I will indeed.  Bitter Black Ale with a head on it will hit the spot!~ #74310 */ DO ~SetGlobal("BuyDrink","LOCALS",1)
    AddexperienceParty(2500)~ GOTO 14
  IF ~~ THEN REPLY @23 /* ~I'll try an Elminster's Beer, thank you.  I wonder if it's really his recipe?~ #74311 */ DO ~SetGlobal("BuyDrink","LOCALS",1)
    AddexperienceParty(2500)~ GOTO 15
  IF ~~ THEN REPLY @24 /* ~The Evermead is ever good for me... and tell the Thumb I'll take it in a CLEAN mug this time!~ #74312 */ DO ~SetGlobal("BuyDrink","LOCALS",1)
    AddexperienceParty(2500)~ GOTO 16
  IF ~~ THEN REPLY @25 /* ~Aye, thank ye kindly.  A Shadowdark Ale if you please.~ #74313 */ DO ~SetGlobal("BuyDrink","LOCALS",1)
    AddexperienceParty(2500)~ GOTO 17
  IF ~~ THEN REPLY @26 /* ~Not at this time.  Thanks all the same.  Perhaps later?~ #74314 */ GOTO 18
END

IF ~~ THEN BEGIN 12 // from: 11.0
  SAY @27 /* ~Alurlyath Wine comin' up!~ #74315 */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 13 // from: 11.1
  SAY @28 /* ~My pleasure.  Thumb!  An Arabellan Wine for the <MANWOMAN> and make it quick!~ #74316 */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 14 // from: 11.2
  SAY @29 /* ~A good choice!  That's what I'm having!  Move your arse, Thumb.  We've got drinking to do!~ #74317 */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 15 // from: 11.3
  SAY @30 /* ~Probably not, knowing that scoundrel Thumb.  He's the biggest thief here  (and I do mean BIG).~ #74318 */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 16 // from: 11.4
  SAY @31 /* ~Well belly up to the bar me <LADYLORD> and we'll give the old Thumb hell this <DAYNIGHT>!~ #74319 */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 17 // from: 11.5
  SAY @32 /* ~Shadowdark for a Shadow Thief!  Step lively Thumb!  This is <LADYLORD> <CHARNAME> ye be serving!~ #74320 */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 18 // from: 11.6
  SAY @33 /* ~Of course.  I'll be here if you change your mind.~ #74321 */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR0313")
Global("BuyDrink","LOCALS",0)
!InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 19 // from:
  SAY @34 /* ~Always a pleasure <GABBER>.  Is <CHARNAME> about?~ #74322 */
  IF ~~ THEN EXIT
END

IF ~Global("TS5Move","GLOBAL",5)
!AreaCheck("AR0333")~ THEN BEGIN 20 // from:
  SAY @35 /* ~Ha ha ha!  Why hello there, <GABBER>!  Hic!  'Scuse me!  Now where's me drink...?  I puts it here somewhere...~ #74323 */
  IF ~~ THEN EXIT
END

IF ~GlobalLT("TS5Move","GLOBAL",5)
!InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 21 // from:
  SAY @36 /* ~Pardon me, but I can only take orders from <CHARNAME>.~ #74324 */
  IF ~~ THEN EXIT
END
