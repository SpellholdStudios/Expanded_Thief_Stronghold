// creator  : WeiDU (version 195)
// argument : SHTH06.DLG
// game     : .
// source   : ./override/SHTH06.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSGT06~

IF ~!AreaCheck("AR1005")
!InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 0 // from:
  SAY #32966 /* ~Get lost. <CHARNAME> gets my ear and no other.~ */
  IF ~~ THEN EXIT
END

IF ~!AreaCheck("AR1005")
Global("TalkedToVaria","AR0322",0)
InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 1 // from:
  SAY #32967 /* ~So you're the new head of the guild? I'll tell you right now, I preferred Mae'Var's style. He kept his friends close. You... you I don't know. Don't seem all that on the ball to me.~ */
  IF ~~ THEN DO ~SetGlobal("TalkedToVaria","AR0322",1)
~ GOTO 2
END

IF ~~ THEN BEGIN 2 // from: 9.0 1.0
  SAY #32968 /* ~I'll tell you a few things, and if you don't like what I'm saying, I'd say that's tough. I speak my mind about what I like and what I don't.~ */
  IF ~Global("VariaThief","GLOBAL",1)
Global("VariaRescue","GLOBAL",0)
~ THEN GOTO 3
  IF ~Global("VariaThief","GLOBAL",2)
Global("VariaRescue","GLOBAL",0)
~ THEN GOTO 4
  IF ~Global("VariaThief","GLOBAL",3)
Global("VariaRescue","GLOBAL",0)
~ THEN GOTO 5
  IF ~Global("VariaThief","GLOBAL",4)
Global("VariaRescue","GLOBAL",0)
~ THEN GOTO 6
  IF ~Global("VariaThief","GLOBAL",0)
Global("VariaRescue","GLOBAL",0)
~ THEN GOTO 7
  IF ~Global("VariaRescue","GLOBAL",1)
~ THEN GOTO 8
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #32969 /* ~I think my talents are currently wasted here. Palying it safe all around is pointless. The profits are small, and the thrills are nonexisted. Get things moving around here.~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 4 // from: 2.1
  SAY #32970 /* ~It's still a bit pointless to even go out on jobs with your current instructions. I cannot cut loose and bring in the big coin. I'm wasting away.~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 5 // from: 2.2
  SAY #32971 /* ~Now we're up to some fun, though there's more coin out there, I can smell it. We should be risking it all, instead of holding back like some common gutter trash. ~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 6 // from: 2.3
  SAY #32972 /* ~This is where I like to be. I'm targeting the biggest fish I can find, and demanding the most coin I can carry. That's living. Dangerous as hell, but we'll all end up there eventually anyway.~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 7 // from: 2.4
  SAY #32973 /* ~Why did I bother to wake up this week? I can sit at home, why come here to do nothing? If we aren't daring the very edge of risk, what's the point?~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 8 // from: 2.5
  SAY #32974 /* ~I suppose I should thank you for getting me out of the lockup. I should, but I'll wait until I see if the guild prospers. That's all that matters.~ */
  IF ~~ THEN DO ~SetGlobal("VariaRescue","GLOBAL",0)
~ GOTO 12
END

IF ~!AreaCheck("AR1005")
InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 9 // from:
  SAY #32975 /* ~What do you want now? I'm sure there is something more important for you to be doing. I certainly hope so, anyway.~ */
  IF ~~ THEN REPLY #32976 /* ~Just give me a report on how things are going. ~ */ GOTO 2
  IF ~~ THEN REPLY #32977 /* ~You don't like me, do you. Why not?~ */ GOTO 10
  IF ~~ THEN REPLY #32978 /* ~And how did you come to the Shadow Thieves?~ */ GOTO 11
END

IF ~~ THEN BEGIN 10 // from: 9.1
  SAY #32979 /* ~I don't like your face. Isn't that enough? Talk to me when you've something useful to say.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 11 // from: 9.2
  SAY #32980 /* ~That's my business. I'll do your jobs as you give them, but stay out of my personal business.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12 // from: 8.0 7.0 6.0 5.0 4.0 3.0
  SAY #32981 /* ~That's the world as I see it today. Now leave me be. I'm done with you.~ */
  IF ~~ THEN EXIT
END

IF ~!AreaCheck("AR1005")
Global("PGFailed","GLOBAL",1)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 13 // from:
  SAY #32990 /* ~Hmmm, heh, you're nothing now. Get away from me.~ */
  IF ~~ THEN DO ~EraseJournalEntry(55542)
~ EXIT
END

IF ~!AreaCheck("AR1005")
Global("PGFailed","GLOBAL",1)
!InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 14 // from:
  SAY #32991 /* ~Aww, no more coattails for you to ride. Get out.~ */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR1005")
~ THEN BEGIN 15 // from:
  SAY @19 /* ~Hmmph!  I was wonderin' when you'd show up.  Took your sweet time, didn't you?  Well, don't expect much, I'll be lucky to make the quota this week.  Probably end up here again, soon, what with you runnin' a girl ragged...~ */
  IF ~~ THEN DO ~SetGlobal("TSVariaJail","GLOBAL",0)
SetGlobal("VariaThief","GLOBAL",0)
SetGlobal("VariaRescue","GLOBAL",1)
EscapeArea()
~ EXIT
END
