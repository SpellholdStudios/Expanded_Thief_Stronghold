// creator  : D:\BG2\WEIDU.EXE (version 38)
// argument : TSSMUGM.DLG
// game     : .
// source   : .\override\TSSMUGM.DLG
// dialog   : .\dialog.tlk
// dialogF  : (none)

BEGIN ~TSSMUGM~

IF ~True()~ THEN BEGIN 0 // from:
  SAY @1 /* ~  Hi, friend.~ [GENMG06] #11083 */
  IF ~~ THEN DO ~NoAction()~ EXIT
END
