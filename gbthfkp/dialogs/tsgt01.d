// creator  : WeiDU (version 195)
// argument : SHTH01.DLG
// game     : .
// source   : ./override/SHTH01.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSGT01~

IF ~!AreaCheck("AR1005")
!InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 0 // from:
  SAY #32891 /* ~Get off with ye. I don't like the look of ye. <CHARNAME>'s me boss, and <PRO_HESHE>'s the one I talk to.~ */
  IF ~~ THEN EXIT
END

IF ~!AreaCheck("AR1005")
Global("TalkedToHanz","AR0322",0)
InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 1 // from:
  SAY #32892 /* ~So, you be men new boss then? Fair enough. We ain't had time to talk yet, so let me tells ya something. You be square with me and I'll be square with you. ~ */
  IF ~Global("HanzThief","GLOBAL",1)
Global("HanzRescue","GLOBAL",0)
~ THEN DO ~SetGlobal("TalkedToHanz","AR0322",1)
~ GOTO 2
  IF ~Global("HanzThief","GLOBAL",2)
Global("HanzRescue","GLOBAL",0)
~ THEN DO ~SetGlobal("TalkedToHanz","AR0322",1)
~ GOTO 3
  IF ~Global("HanzThief","GLOBAL",3)
Global("HanzRescue","GLOBAL",0)
~ THEN DO ~SetGlobal("TalkedToHanz","AR0322",1)
~ GOTO 4
  IF ~Global("HanzThief","GLOBAL",4)
Global("HanzRescue","GLOBAL",0)
~ THEN DO ~SetGlobal("TalkedToHanz","AR0322",1)
~ GOTO 5
  IF ~Global("HanzThief","GLOBAL",0)
Global("HanzRescue","GLOBAL",0)
~ THEN DO ~SetGlobal("TalkedToHanz","AR0322",1)
~ GOTO 6
  IF ~Global("HanzRescue","GLOBAL",1)
~ THEN DO ~SetGlobal("TalkedToHanz","AR0322",1)
~ GOTO 7
END

IF ~~ THEN BEGIN 2 // from: 9.0 1.0
  SAY #32893 /* ~I'm not stressing one bit with the current way things are handled. I think it's a bit of a waste of me talents, but who am I to say. ~ */
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 3 // from: 9.1 1.1
  SAY #32894 /* ~It's pretty much easy street with what you've directed me to do. No need for undue risk, though a bit more excitement is always welcome.~ */
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 4 // from: 9.2 1.2
  SAY #32895 /* ~You've got me going near the end of me rope, and that's just the way I likes it. As long as I'm able, I'll keep the coin draggin' in.~ */
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 5 // from: 9.3 1.3
  SAY #32896 /* ~I don't mind a bit of danger now and then, but I'm run ragged with the changes you've made. If'n you want me here and not in a body bag, I'd ask ye to ease up on the risks a bit.~ */
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 6 // from: 9.4 1.4
  SAY #32897 /* ~I hate this sitting around doing nothing. C'mon, get Jariel on my back about quotas or something. Gotta get to work, work, work!~ */
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 7 // from: 9.5 1.5
  SAY #32898 /* ~I gotta say, <CHARNAME>, I really appreciates you gettin' me back onna street. Don't like them closed in places one bit. You're ok in my books, you are. Keep the good work up.~ */
  IF ~~ THEN DO ~SetGlobal("HanzRescue","GLOBAL",0)
~ GOTO 15
END

IF ~!AreaCheck("AR1005")
InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 8 // from:
  SAY #32899 /* ~Good to be talking to you again, boss. Keep it shipshape around here and we'll all have the coin to rub together.~ */
  IF ~~ THEN REPLY #32900 /* ~Give me a status report, Hanz. How do you like your current assignment?~ */ GOTO 9
  IF ~~ THEN REPLY #32901 /* ~How did you get into this business of your's, Hanz?~ */ GOTO 10
  IF ~~ THEN REPLY #32902 /* ~Been a member of the Shadow Thieves long?~ */ GOTO 12
END

IF ~~ THEN BEGIN 9 // from: 8.0
  SAY #32903 /* ~I'll tell you straight how I'm feeling, 'cuz you look out for us all and deserve no less.~ */
  IF ~Global("HanzThief","GLOBAL",1)
Global("HanzRescue","GLOBAL",0)
~ THEN GOTO 2
  IF ~Global("HanzThief","GLOBAL",2)
Global("HanzRescue","GLOBAL",0)
~ THEN GOTO 3
  IF ~Global("HanzThief","GLOBAL",3)
Global("HanzRescue","GLOBAL",0)
~ THEN GOTO 4
  IF ~Global("HanzThief","GLOBAL",4)
Global("HanzRescue","GLOBAL",0)
~ THEN GOTO 5
  IF ~Global("HanzThief","GLOBAL",0)
Global("HanzRescue","GLOBAL",0)
~ THEN GOTO 6
  IF ~Global("HanzRescue","GLOBAL",1)
~ THEN GOTO 7
END

IF ~~ THEN BEGIN 10 // from: 8.1
  SAY #32904 /* ~Aw, no big sob story from me. I like the crawling and the stealthing and the borrowing of items that shouldn't be hidden away in safes and houses.~ */
  IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 11 // from: 10.0
  SAY #32905 /* ~I especially like taking a coin or two from a rich man's home. They don't need it anyway. Been doing this so long I can't hardly remember a time before. It's just what I'm good at.~ */
  IF ~~ THEN REPLY #32906 /* ~Well, it's good to have you in the guild.~ */ GOTO 14
  IF ~~ THEN REPLY #32907 /* ~We'll see. I'll put you through your paces.~ */ GOTO 13
END

IF ~~ THEN BEGIN 12 // from: 8.2
  SAY #32908 /* ~Long enough to know my place. You got an order, I'll follow it to the letter. Just tell Jariel and I'll be ready and raring to go.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 13 // from: 11.1
  SAY #32909 /* ~Whatever you say, boss<PRO_MANWOMAN>.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 14 // from: 11.0
  SAY #32910 /* ~We'll be the pride o' the council, we will.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 15 // from: 7.0 6.0 5.0 4.0 3.0 2.0
  SAY #32911 /* ~That's just my opinion though. You're the final word on the matter.~ */
  IF ~~ THEN EXIT
END

IF ~!AreaCheck("AR1005")
Global("PGFailed","GLOBAL",1)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 16 // from:
  SAY #32982 /* ~Sorry, but I cain't talk to you no more. You ain't the guildboss now.~ */
  IF ~~ THEN DO ~EraseJournalEntry(55542)
~ EXIT
END

IF ~!AreaCheck("AR1005")
Global("PGFailed","GLOBAL",1)
!InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 17 // from:
  SAY #32983 /* ~Sorry, but you've even less right to be here now that <CHARNAME> is no longer guildboss.~ */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR1005")
~ THEN BEGIN 18 // from:
  SAY @24 /* ~I was just about to break free myself, but now I don't have to thanks to you.  Thanks boss!  I'll try to get back to work right away, but I'll probably just meet the quota this week.  See ya back at the guildhouse!  I'm outta here!~ */
  IF ~~ THEN DO ~SetGlobal("TSHanzJail","GLOBAL",0)
SetGlobal("HanzThief","GLOBAL",0)
SetGlobal("HanzRescue","GLOBAL",1)
EscapeArea()
~ EXIT
END
