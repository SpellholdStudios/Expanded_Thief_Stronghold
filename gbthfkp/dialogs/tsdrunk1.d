BEGIN ~TSDrunk1~

IF ~Gender(LastTalkedToBy,MALE)
RandomNum(5,1)~ THEN BEGIN 0
  SAY #44381 /* ~(hic)  Yeah, I used t' be an adventurer... like yerself, o' course.  'Cept that I had the ladies flockin' to me allll the time... yeah... (hic)~ */
  IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,MALE)
RandomNum(5,2)~ THEN BEGIN 1
  SAY #44382 /* ~There was this one time... (hic) ...my party and I were travelin' through the elven woods down in, uh, Tethyr.  (hic)  We got drunk with a whole group o' elves... (hic)~ */
  IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,MALE)
RandomNum(5,3)~ THEN BEGIN 2
  SAY #44383 /* ~And... and... my party once fought a powerful lich!  (hic)  Yup... boy, he was tough.  (hic)  We ran like a flock o' frightened chickens, we did... (hic)  ...no, wait, uh, we fought 'im!  Yeah, we fought 'im!~ */
  IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,MALE)
RandomNum(5,4)~ THEN BEGIN 3
  SAY #44384 /* ~I betcha I was a better fighter 'an you when I was an adventurer.  (hic)~ */
  IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,MALE)
RandomNum(5,5)~ THEN BEGIN 4
  SAY #44385 /* ~If I was younger... (hic)  ...an' sober... (hic) ...I could kick yer butt...~ */
  IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,FEMALE)
RandomNum(5,1)~ THEN BEGIN 5
  SAY #44386 /* ~Heeeey, baby... (hic) ...y'know, I was a great adventurer once.  Betcha I could give you aaaallll kinds of advice, yup.  (hic)~ */
  IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,FEMALE)
RandomNum(5,2)~ THEN BEGIN 6
  SAY #44387 /* ~Why don't ye sit down next t' me, darlin'?  (hic)~ */
  IF ~~ THEN EXIT
  IF ~IsValidForPartyDialog("Anomen")
      OR(2)
      Global("AnomenRomanceActive","GLOBAL",1)
      Global("AnomenRomanceActive","GLOBAL",2)~ THEN EXTERN ~ANOMENJ~ Ano6
END

IF ~Gender(LastTalkedToBy,FEMALE)
RandomNum(5,3)~ THEN BEGIN 7
  SAY #44388 /* ~Lemme tell you about this time me an' my fellow adventurers... (hic) ...we decapitated an ogre, we did!  Yup!  We were mighty strong...  (hic)~ */
  IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,FEMALE)
RandomNum(5,4)~ THEN BEGIN 8
  SAY #44389 /* ~How about I buy ye an ale, darlin'?  (hic)~ */
  IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,FEMALE)
RandomNum(5,5)~ THEN BEGIN 8
  SAY @1 /* ~Yer a fine lookin strumpet!  (hic)~ */
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 9
  SAY #44390 /* ~Aaahhh... lemme alone... (hic)  ...can't a man drink in peace, aye?  (hic)~ */
  IF ~~ THEN EXIT
END

APPEND ~ANOMENJ~
IF ~~ THEN BEGIN Ano6
  SAY @2 /* ~Cast your filthy attentions elsewhere cur, lest I teach you manners at the end of my blade.~ */
  IF ~~ THEN EXIT
END
END
