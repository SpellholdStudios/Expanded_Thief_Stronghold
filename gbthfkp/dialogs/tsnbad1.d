BEGIN ~TSNBAD1~

IF ~True()~ THEN BEGIN 0
  SAY @1 /* ~You die! We eats good!!~ [TOGAL04] */
  IF ~~ THEN DO ~Enemy()~ EXIT
END
