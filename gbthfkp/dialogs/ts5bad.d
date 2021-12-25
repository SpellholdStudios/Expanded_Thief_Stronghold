// creator  : D:\BG2\WEIDU.EXE (version 38)
// argument : TS5BAD.DLG
// game     : .
// source   : .\override\TS5BAD.DLG
// dialog   : .\dialog.tlk
// dialogF  : (none)

BEGIN ~TS5BAD~

IF ~NumTimesTalkedTo(0)
Name("TS5Door",Myself)~ THEN BEGIN 0 // from:
  SAY @1 /* ~We're cleaning out the Docks, <CHARNAME>!  Starting with you!~ #74289 */
  IF ~~ THEN DO ~SetGlobal("TS5Hostile","GLOBAL",1)
ActionOverride("TS5Grd1",Enemy())
ActionOverride("TS5Grd2",Enemy())
Enemy()~ EXIT
END

IF ~NumTimesTalkedTo(0)
Name("TS5Bad",Myself)~ THEN BEGIN 1 // from:
  SAY @2 /* ~So!  The cowardly Shadow Thieves send their champion, the mighty <CHARNAME> to stop me, eh?  Very well!  You'll hang from the gallows, thief, dead or alive!!~ #74290 */
  IF ~~ THEN EXIT
END
