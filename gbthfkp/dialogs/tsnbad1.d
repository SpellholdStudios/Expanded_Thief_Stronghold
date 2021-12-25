// creator  : D:\BG2\WEIDU.EXE (version 38)
// argument : TSNBAD1.DLG
// game     : .
// source   : .\override\TSNBAD1.DLG
// dialog   : .\dialog.tlk
// dialogF  : (none)

BEGIN ~TSNBAD1~

IF ~True()~ THEN BEGIN 0 // from:
  SAY @1 /* ~ You die!  We eats good!!~ [TOGAL04] #60799 */
  IF ~~ THEN DO ~Enemy()~ EXIT
END
