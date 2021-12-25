// creator  : WeiDU (version 195)
// argument : SHTHDR01.DLG
// game     : .
// source   : ./override/SHTHDR01.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSGG01~

IF ~NumberOfTimesTalkedTo(0)
!InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 0 // from:
  SAY #31970 /* ~'Ere then, move along now. This place ain't open to simple gawking. Don't make me says it more than once. ~ */
  IF ~~ THEN REPLY #32010 /* ~I am with <CHARNAME>, and your new guildmaster will not like this greeting!~ */ GOTO 1
  IF ~~ THEN REPLY #32011 /* ~I am sorry. We were told by Renal to come here. Is there a problem?~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.1 0.0
  SAY #32012 /* ~You're with <CHARNAME>? Well send the danged fool over then. I needs to see <PRO_HIMHER> before I lets you in.~ */
  IF ~~ THEN DO ~SetNumTimesTalkedTo(0)
~ EXIT
END

IF ~NumberOfTimesTalkedTo(0)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 2 // from:
  SAY #32013 /* ~Get going. I ain't letting any common gutterskunks in here. This place ain't for you.~ */
  IF ~~ THEN REPLY #32014 /* ~I think you should stand aside! I am your new guildmaster!~ */ GOTO 3
  IF ~~ THEN REPLY #32015 /* ~Renal told me to come here as the new guildmaster. Is there a problem?~ */ GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 2.1 2.0
  SAY #32016 /* ~Begging your pardon, <PRO_SIRMAAM>, I meant nothing. I am simply told to guard the doors. Please, pay me no mind and enter as you wish.~ */
  IF ~~ THEN REPLY #32017 /* ~Do not let it happen again!~ */ GOTO 4
  IF ~~ THEN REPLY #32018 /* ~You are just doing your job. Keep up the good work.~ */ GOTO 5
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY #32020 /* ~Yes, <PRO_SIRMAAM>, I will be more careful in future.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5 // from: 3.1
  SAY #32021 /* ~Aw, I tries me best, <PRO_SIRMAAM>. I tries me best.~ */
  IF ~~ THEN EXIT
END

IF ~Global("PGFailed","GLOBAL",1)
~ THEN BEGIN 8 // from:
  SAY #32033 /* ~Shame about the guild, it is. Never got a chance to grow none. Shame it is.~ */
  IF ~~ THEN DO ~EraseJournalEntry(55542)
~ EXIT
END

IF ~Global("LathanPlot","GLOBAL",1)
Global("TalkedToBrannel1","LOCALS",0)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 9 // from:
  SAY #33028 /* ~Sorry about letting in that Ama lady, boss. She just barged right past and I didn't want to bounce her because of that signet she was carrying.~ */
  IF ~~ THEN DO ~SetGlobal("TalkedToBrannel1","LOCALS",1)
~ GOTO 10
END

IF ~~ THEN BEGIN 10 // from: 9.0
  SAY #33029 /* ~Funny thing is, I got a brother out in Esmeltaran that smuggles the odd turnip, and he never mentioned any Shadowmaster named Ama. Ain't the thing you talk about in public, I guess.~ */
  IF ~~ THEN EXIT
  IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ Jan10a
END

IF ~~ THEN BEGIN 10b
  SAY @5 /* ~Why, that's impossible!~ */
  IF ~~ THEN EXTERN ~JANJ~ Jan10b
END

IF ~Global("LathanPlot","GLOBAL",2)
Global("TalkedToBrannel2","LOCALS",0)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 11 // from:
  SAY #33040 /* ~Hey there, <CHARNAME>, I heard about your dust-up in the promenade. Nice work. I knew something was up.~ */
  IF ~~ THEN DO ~SetGlobal("TalkedToBrannel2","LOCALS",1)
~ EXIT
END

IF ~Global("TSGTalk1","LOCALS",1)
~ THEN BEGIN 12 // from:
  SAY @1 /* ~Hey Boss!  Something big is going down.  You should talk to Lathan when you get the chance.~ */
  IF ~~ THEN DO ~SetGlobal("TSGTalk1","LOCALS",2)
~ EXIT
END

IF ~InPartySlot(LastTalkedToBy,0)
Global("TSPlot","GLOBAL",6)
!Dead("TS5Bad")
~ THEN BEGIN 13 // from:
  SAY @2 /* ~Give 'em hell <CHARNAME>!  Them lousy guards have it coming.~ */
  IF ~~ THEN EXIT
END

IF ~InPartySlot(LastTalkedToBy,0)
Dead("TS5Bad")
Global("TSGTalk2","LOCALS",0)
~ THEN BEGIN 14 // from:
  SAY @3 /* ~Heard about you taking care of those guards what have been giving us problems.  Right proud I am to work for ye boss, and that's the truth.~ */
  IF ~~ THEN DO ~SetGlobal("TSGTalk2","LOCALS",1)
~ EXIT
END

IF ~InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 6 // from:
  SAY #32026 /* ~Good to be seeing you again, <CHARNAME>. Go as you please, of course.~ */
  IF ~~ THEN EXIT
END

IF ~!InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 7 // from:
  SAY #32030 /* ~I's been keeping up of <CHARNAME>'s friends, so's I knows you are ok. In you go, if you like.~ */
  IF ~~ THEN EXIT
END

APPEND ~JANJ~
IF ~~ THEN BEGIN Jan10a
  SAY @4 /* ~Ah yes!  Turnip smuggling!  A very lucrative trade, that is.  My Uncle Scratchy was one of the fastest Turnip Runners (as we called them) from here to Thundertree.  He once made the Tuber Run in less than twelve leagues!~ */
  IF ~~ THEN EXTERN ~TSGG01~ 10b
END
IF ~~ THEN BEGIN Jan10b
  SAY @6 /* ~Not for my Uncle Scratchy, my good man.~ */
  IF ~~ THEN EXIT
END
END

