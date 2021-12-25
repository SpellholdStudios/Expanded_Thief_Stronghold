// creator  : D:\BG2\WEIDU.EXE (version 38)
// argument : TSPICK01.DLG
// game     : .
// source   : .\override\TSPICK01.DLG
// dialog   : .\dialog.tlk
// dialogF  : (none)

BEGIN ~TSPICK01~

IF ~NumTimesTalkedTo(0)
ReactionGT([PC],16)~ THEN BEGIN 0 // from:
  SAY @1 /* ~You're an adventurer, aren't you?  I can tell!  When I was young, I always wanted to be an adventurer.  Sigh...~ #74133 */
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)
ReactionLT([PC],8)~ THEN BEGIN 1 // from:
  SAY @2 /* ~Oh, go away!  I've never cared much for adventurers.  Your kind do nothing but cause trouble... grumble... grumble... mutter...~ #74134 */
  IF ~~ THEN EXIT
END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 2 // from:
  SAY @3 /* ~Terribly sorry, but I must be on my way...~ #74135 */
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,1)
Class(LastTalkedToBy(Myself),THIEF_ALL)~ THEN BEGIN 3 // from:
  SAY @4 /* ~You... you aren't a thief are you?  Sorry to be so rude, but with all the thievery in this city, one can never be too trusting.  I'll just... I'll just be about my business.~ #74136 */
  IF ~~ THEN DO ~RunAwayFrom(LastTalkedToBy(Myself),30)~ EXIT
END

IF ~RandomNum(4,1)
!Class(LastTalkedToBy(Myself),THIEF_ALL)~ THEN BEGIN 4 // from:
  SAY @5 /* ~Keep a sharp eye on your coin-pouch, friend.  I sometimes think the thieves have taken over this city.  Why, just the other day I was robbed and I didn't even notice until I was home!~ #74137 */
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,2)~ THEN BEGIN 5 // from:
  SAY @6 /* ~As soon as I'm finished here, I'm off to go shopping.  Tomorrow is my wedding anniversary and I know just what to get...~ #74138 */
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,3)~ THEN BEGIN 6 // from:
  SAY @7 /* ~I've declared this day a holiday for myself.  Nothing beats a nice, relaxing stroll...  Tonight, I think, I'll hit the pubs.  Meet you there?~ #74139 */
  IF ~~ THEN EXIT
END

IF ~RandomNum(4,4)~ THEN BEGIN 7 // from:
  SAY @8 /* ~Did you hear about that army of ogres to the south?  Rumor has it, they're on the march and headed here, to Athkatla!  Of course, our boys and girls will show them what for!  Tsk.. tsk.  What a topsy-turvy world we live in.  Why back in my day...~ #74140 */
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 8 // from:
  SAY @9 /* ~Terribly sorry, but I must be on my way...~ #74135 */
  IF ~~ THEN EXIT
END
