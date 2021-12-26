BEGIN ~TSSMUGM~

IF ~True()~ THEN BEGIN 0
  SAY @1 /* ~Hi, friend.~ [GENMG06] */
  IF ~~ THEN DO ~NoAction()~ EXIT
END
