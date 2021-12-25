// creator  : WeiDU (version 195)
// argument : SHTHSTOR.DLG
// game     : .
// source   : ./override/SHTHSTOR.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSGS1~

IF ~NumberOfTimesTalkedTo(0)
~ THEN BEGIN 0 // from:
  SAY #31967 /* ~Hello and well met. It is good to see new souls sympathetic to the Shadow Thieves. I'm Rattell, and I'll be fencing anything you need exchanged.~ */
  IF ~~ THEN REPLY #32038 /* ~I'll keep that in mind. ~ */ GOTO 1
  IF ~Global("PGFailed","GLOBAL",0)
~ THEN REPLY #32039 /* ~Thanks, Rattell, let's see what you have currently.~ */ DO ~StartStore("shthstor",LastTalkedToBy(Myself))
~ EXIT
END

IF ~~ THEN BEGIN 1 // from: 2.1 0.0
  SAY #32037 /* ~You do that. I'll be here when e'er you need.~ */
  IF ~~ THEN EXIT
END

IF ~Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 2 // from:
  SAY #32040 /* ~Anything you need? Anything at all, you just ask. ~ */
  IF ~~ THEN REPLY #32041 /* ~Let me see what you have in stock.~ */ DO ~StartStore("TSStore1",LastTalkedToBy(Myself))
~ EXIT
  IF ~~ THEN REPLY #32042 /* ~I'll check back later.~ */ GOTO 1
END

IF ~~ THEN BEGIN 3 // from:
  SAY #32043 /* ~Sure enough. I'll be here.~ */
  IF ~~ THEN EXIT
END

IF ~Global("PGFailed","GLOBAL",1)
~ THEN BEGIN 4 // from:
  SAY #32044 /* ~Sorry, but I can't afford to buy anything, and all my stock is being shipped to the main guild office. Can't fund a fence if the guild branch has collapsed. ~ */
  IF ~~ THEN DO ~EraseJournalEntry(55542)
~ EXIT
END
