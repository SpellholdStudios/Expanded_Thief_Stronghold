// creator  : D:\BG2\WEIDU.EXE (version 38)
// argument : TSSMUGB.DLG
// game     : .
// source   : .\override\TSSMUGB.DLG
// dialog   : .\dialog.tlk
// dialogF  : (none)

BEGIN ~TSSMUGB~

IF ~True()~ THEN BEGIN 0 // from:
  SAY @1 /* ~ So I kicked 'em in the head till he was dead.  Har har.~ [BANDT01] #4953 */
  IF ~~ THEN DO ~NoAction()~ EXIT
END
