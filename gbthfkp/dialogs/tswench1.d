BEGIN ~TSWENCH1~

IF ~RandomNum(6,1)~ THEN BEGIN 0
  SAY #15352 /* ~Well, I'll not be guidin' ye to a table, now, will I?~ */
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,2)~ THEN BEGIN 1
  SAY @1 /* ~Don't be bloody impatient, my <LADYLORD>.  Talk t' Rattel if ye be wantin' something right anon.~ */
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,3)~ THEN BEGIN 2
  SAY @2 /* ~(sigh)  If ye're here fer somethin' other than drink, ye best be talkin' to Brannel.  He'll be deciding if ye're to speak to one of the bosses.  I'm just a working girl.~ */
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,4)~ THEN BEGIN 3
  SAY #15359 /* ~Good business to ye, <SIRMAAM>.  I'll be with ye in a moment.~ */
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,5)~ THEN BEGIN 4
  SAY #15360 /* ~The weather outside ha' been a mite terrible, aye?  I hear it's from them bleedin' wizards, that's what.~ */
  IF ~~ THEN EXIT
END

IF ~RandomNum(6,6)
!See("TSDrunk1")
!See("TSDrunk2")
!See("TSDrunk3")~ THEN BEGIN 5
  SAY @3 /* ~I haven't time to be chattin' with ye.  If ye're lookin' fer a loose tongue, talk to one of these drunkards, aye?~ */
  IF ~~ THEN EXIT
END

CHAIN
IF ~RandomNum(6,6)
    See("TSDrunk1")
    See("TSDrunk2")
    See("TSDrunk3")~ THEN ~TSWench1~ 6
@3 /* ~I haven't time to be chattin' with ye.  If ye're lookin' fer a loose tongue, talk to one of these drunkards, aye?~ */
== ~TSDrunk1~ @6 /* @6 = "'ere now Jancie!  Who're ye callin' 'drunkards', eh? (hic)" */
== ~TSDrunk1~ @7 /* @7 = "She's be calling ye a drunkard William.  And a dirty stinking drunk ye are!" */
== ~TSDrunk1~ @8 /* @8 = "Ye mind yer own business, Tom!  I'm sober as a preacher!  And that's a fact! (hic)" */
== ~TSDrunk1~ @9 /* @9 = "Ye're a liar Bill Huggins, and I ain't afraids to say it." */
== ~TSDrunk1~ @10 /* @11 = "Take that back Bert, or ye'll be sorry!" */
== ~TSDrunk1~ @11 /* @11 = "Oh yeah! (hic) Says who?  That's what I'd like to know!" */
== ~TSDrunk1~ @12 /* @12 = "Says me, that's who!" */
== ~TSDrunk1~ @13 /* @13 = "Ye're a boobie Bill Huggins! (hic)" */
== ~TSDrunk1~ @14 /* @14 = "And ye're a lout!" */
== ~TSWench1~ @15 /* @15 = "Ye're all three louts, and ye'd best start actin' proper right quick, and stop disturbin' me guests 'ere, or I'll throw the lot of ye out on the street!" */
= @16 /* @16 = "Ye gots that?" */
= @17 /* @17 = "Good!" */
EXIT

APPEND ~TSWench1~
IF ~Gender(LastTalkedToBy,MALE)~ THEN BEGIN 7
  SAY @4 /* ~Ooooh.  Aye, ye are a strong one ye are!  Mmmmm.~ */
  IF ~~ THEN EXIT
END

IF ~Gender(LastTalkedToBy,FEMALE)~ THEN BEGIN 8
  SAY @5 /* ~Humph!  Looks like I've gots me some competition!~ */
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 9
  SAY #15352 /* ~Well, I'll not be guidin' ye to a table, now, will I?~ */
  IF ~~ THEN EXIT
END
END

