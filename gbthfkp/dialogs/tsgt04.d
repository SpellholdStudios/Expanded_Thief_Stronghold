// creator  : WeiDU (version 195)
// argument : SHTH04.DLG
// game     : .
// source   : ./override/SHTH04.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSGT04~

IF ~!AreaCheck("AR1005")
!InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 0 // from:
  SAY #32950 /* ~I'm dreadfully sorry, but I should only talk to <CHARNAME>. I wouldn't want to discuss the guild with anyone else.~ */
  IF ~~ THEN EXIT
END

IF ~!AreaCheck("AR1005")
Global("TalkedToMorsa","AR0322",0)
InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 1 // from:
  SAY #32951 /* ~Hi there! We should really get to know one another. I'm Morsa, and let me just say that it's going to be great building a guild with you.~ */
  IF ~~ THEN DO ~SetGlobal("TalkedToMorsa","AR0322",1)
~ EXIT
END

IF ~~ THEN BEGIN 2 // from: 9.0
  SAY #32952 /* ~I'll tell you what I think about things right now if you like, but don't let me overstep my bounds, alright? I don't want to anger the guildmaster, no <PRO_SIRMAAM>.~ */
  IF ~Global("MorsaThief","GLOBAL",1)
Global("MorsaRescue","GLOBAL",0)
~ THEN GOTO 3
  IF ~Global("MorsaThief","GLOBAL",2)
Global("MorsaRescue","GLOBAL",0)
~ THEN GOTO 4
  IF ~Global("MorsaThief","GLOBAL",3)
Global("MorsaRescue","GLOBAL",0)
~ THEN GOTO 5
  IF ~Global("MorsaThief","GLOBAL",4)
Global("MorsaRescue","GLOBAL",0)
~ THEN GOTO 6
  IF ~Global("MorsaThief","GLOBAL",0)
Global("MorsaRescue","GLOBAL",0)
~ THEN GOTO 7
  IF ~Global("MorsaRescue","GLOBAL",1)
~ THEN GOTO 8
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #32953 /* ~Things are a little slow tight now, but if you think it's best for us to conserve our skill, that's ok by me. It's all up to you.~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 4 // from: 2.1
  SAY #32954 /* ~I don't mind things when they are this slow. That ain't to say there's no risk to working like we are, but it's a nice comfortable pace. You're doing great.~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 5 // from: 2.2
  SAY #32955 /* ~Things are tough right now. Kinda hard to keep a head on your shoulders while out in the thick of it. I guess you know best though.~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 6 // from: 2.3
  SAY #32956 /* ~I don't like this job right now. We're running so hard I have to do things I'm not proud of. I don't like the way we're going, whether successful or not. That's just me though. You know best, I'm sure.~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 7 // from: 2.4
  SAY #32957 /* ~It's pretty boring just sitting around, but if you don't want me out and about, that's ok too. I've been catching up on my reading. Did you know that bats see with sound? Neat. ~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 8 // from: 2.5
  SAY #32958 /* ~I can't thank you enough. Getting caught was terrible, but staying in prison would have been even worse. It was dirty in there. You got a friend in me, by gum! Keep up the good work and stuff.~ */
  IF ~~ THEN DO ~SetGlobal("MorsaRescue","GLOBAL",0)
~ GOTO 12
END

IF ~!AreaCheck("AR1005")
InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 9 // from:
  SAY #32959 /* ~Hey there hi there. Good to see you talking to us rogues beneath you. Some guildmasters don't even bother to stay in the guild.~ */
  IF ~~ THEN REPLY #32960 /* ~Give me a report on how you think things are shaping up around here.~ */ GOTO 2
  IF ~~ THEN REPLY #32961 /* ~How come you decided to get into smuggling?~ */ GOTO 10
  IF ~~ THEN REPLY #32962 /* ~Why are you in the Shadow Thieves? You aren't as dour as other members.~ */ GOTO 11
END

IF ~~ THEN BEGIN 10 // from: 9.1
  SAY #32963 /* ~Just a big ol' excuse to travel. Best way to have others pay for my way. Most times it isn't so bad, and most people seem nice, like you. Aw, go on. You don't need me yappin' in your ear.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 11 // from: 9.2
  SAY #32964 /* ~Oh, just because yer up to no good, doesn't mean you have to be a sourpuss. Besides, guards are expecting the hooded gloomyguss to be doing wrong. I just smile and walk by. It works.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12 // from: 8.0 7.0 6.0 5.0 4.0 3.0
  SAY #32965 /* ~Now, I'm just talking here, and like I said, I don't want to overstep my bounds. Aw, I'd better just get back to work.~ */
  IF ~~ THEN EXIT
END

IF ~!AreaCheck("AR1005")
Global("PGFailed","GLOBAL",1)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 13 // from:
  SAY #32988 /* ~Double shame it is. Pity this and pity that, I'm sorry you're not guildboss no more. It's just bad and stuff.~ */
  IF ~~ THEN DO ~EraseJournalEntry(55542)
~ EXIT
END

IF ~!AreaCheck("AR1005")
Global("PGFailed","GLOBAL",1)
!InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 14 // from:
  SAY #32989 /* ~Sorry about your friend not being guildboss no more. It means I really can't talk to you now.~ */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR1005")
~ THEN BEGIN 15 // from:
  SAY @19 /* ~Gee!  I'm ever so glad to see you!  Those mean old guards are so... mean!  I'll be glad to get out of this creepy place!  I'll work double-hard to make the quota this week, I promise!  See ya back at the guildhouse okay?~ */
  IF ~~ THEN DO ~SetGlobal("TSMorsaJail","GLOBAL",0)
SetGlobal("MorsaThief","GLOBAL",0)
SetGlobal("MorsaRescue","GLOBAL",1)
EscapeArea()
~ EXIT
END
