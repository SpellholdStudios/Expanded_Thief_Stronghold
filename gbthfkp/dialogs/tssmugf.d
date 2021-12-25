// creator  : D:\BG2\WEIDU.EXE (version 38)
// argument : TSSMUGF.DLG
// game     : .
// source   : .\override\TSSMUGF.DLG
// dialog   : .\dialog.tlk
// dialogF  : (none)

BEGIN ~TSSMUGF~

IF ~True()~ THEN BEGIN 0 // from:
  SAY @1 /* ~ Just watch yourself, I've a quick eye.~ [STHFE04] #61894 */
  IF ~~ THEN DO ~NoAction()~ EXIT
END
