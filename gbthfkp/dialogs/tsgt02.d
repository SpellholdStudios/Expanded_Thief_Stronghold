// creator  : WeiDU (version 195)
// argument : SHTH02.DLG
// game     : .
// source   : ./override/SHTH02.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSGT02~

IF ~!AreaCheck("AR1005")
!InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 0 // from:
  SAY #32912 /* ~Sorry, but I don't know you from a hole in the wood. I'll speak to guildmaster <CHARNAME>, and none other.~ */
  IF ~~ THEN EXIT
END

IF ~!AreaCheck("AR1005")
Global("TalkedToGoshan","AR0322",0)
InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 1 // from:
  SAY #32913 /* ~I am Goshan, and I am at your service. I will serve as best I can, and I will tell you when I have a problem with a task. Difficulties are best resolved out in the open.~ */
  IF ~Global("MilphThief","GLOBAL",1)
Global("MilphRescue","GLOBAL",0)
~ THEN DO ~SetGlobal("TalkedToGoshan","AR0322",1)
~ GOTO 2
  IF ~Global("MilphThief","GLOBAL",2)
Global("MilphRescue","GLOBAL",0)
~ THEN DO ~SetGlobal("TalkedToGoshan","AR0322",1)
~ GOTO 3
  IF ~Global("MilphThief","GLOBAL",3)
Global("MilphRescue","GLOBAL",0)
~ THEN DO ~SetGlobal("TalkedToGoshan","AR0322",1)
~ GOTO 4
  IF ~Global("MilphThief","GLOBAL",4)
Global("MilphRescue","GLOBAL",0)
~ THEN DO ~SetGlobal("TalkedToGoshan","AR0322",1)
~ GOTO 5
  IF ~Global("MilphThief","GLOBAL",0)
Global("MilphRescue","GLOBAL",0)
~ THEN DO ~SetGlobal("TalkedToGoshan","AR0322",1)
~ GOTO 6
  IF ~Global("MilphRescue","GLOBAL",1)
~ THEN DO ~SetGlobal("TalkedToGoshan","AR0322",1)
~ GOTO 7
END

IF ~~ THEN BEGIN 2 // from: 9.0 1.0
  SAY #32914 /* ~Things are currenlty very easy for me, and I would not mind a quickening of the pace. Of course I would be worried about risk, but I think I can bring success to any mission.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 3 // from: 9.1 1.1
  SAY #32915 /* ~This is a nice pace that we've set. Not too much risk for a fine profit. Steady pacing will make us a leader among the guilds.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 4 // from: 9.2 1.2
  SAY #32916 /* ~I'm cautiously worried about the current level of risk you are making me perform at. I find that I am more effective at a more relaxed pace.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 5 // from: 9.3 1.3
  SAY #32917 /* ~Frankly, the pace you've set is blistering and I'm the one that will pay the price in the end. I will do the guild no good if I am in prison or worse.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 6 // from: 9.4 1.4
  SAY #32918 /* ~I do not mind the occasional restful period, but this tedium of doing nothing is unbearable. I would rather we took some risks than just sat about.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 7 // from: 9.5 1.5
  SAY #32919 /* ~Your assistance in freeing me was most appreciated. Be assured that I will work all the harder for the guild. I will serve loyally and without fail. There is not other guild that compares.~ */
  IF ~~ THEN DO ~SetGlobal("MilphRescue","GLOBAL",0)
~ GOTO 13
END

IF ~!AreaCheck("AR1005")
InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 8 // from:
  SAY #32925 /* ~A pleasure as always, <CHARNAME>. Is there eanything I can do to service the guild in any way?~ */
  IF ~~ THEN REPLY #32926 /* ~I wish a status report on how you are dealing with my decisions.~ */ GOTO 9
  IF ~~ THEN REPLY #32927 /* ~Assassination is a bloody business, and you seem quite calm. Does it suit you?~ */ GOTO 10
  IF ~~ THEN REPLY #32928 /* ~And how did you come by the Shadow Thieves? ~ */ GOTO 12
END

IF ~~ THEN BEGIN 9 // from: 8.0
  SAY #32929 /* ~As you wish. It is best that any problems are aired in the open like this.~ */
  IF ~Global("MilphThief","GLOBAL",1)
Global("MilphRescue","GLOBAL",0)
~ THEN GOTO 2
  IF ~Global("MilphThief","GLOBAL",2)
Global("MilphRescue","GLOBAL",0)
~ THEN GOTO 3
  IF ~Global("MilphThief","GLOBAL",3)
Global("MilphRescue","GLOBAL",0)
~ THEN GOTO 4
  IF ~Global("MilphThief","GLOBAL",4)
Global("MilphRescue","GLOBAL",0)
~ THEN GOTO 5
  IF ~Global("MilphThief","GLOBAL",0)
Global("MilphRescue","GLOBAL",0)
~ THEN GOTO 6
  IF ~Global("MilphRescue","GLOBAL",1)
~ THEN GOTO 7
END

IF ~~ THEN BEGIN 10 // from: 8.1
  SAY #32930 /* ~It is only as bloody as you let it get. If I must wash my hands after a kill, I have been less effective than I could have. ~ */
  IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 11 // from: 10.0
  SAY #32931 /* ~Besides, I much prefer information services. Killing is a last resort once diplomacy has failed. Do not worry though. I will not hesitate in my service to the guild.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12 // from: 8.2
  SAY #32934 /* ~A quick mind and an excellent shot have served me well. I also stay out of the public eye, unlike some of the showboats here. I am an unknown variable, and it makes me harder to corner. It will serve you well. Trust me.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 13 // from: 7.0 6.0 5.0 4.0 3.0 2.0
  SAY #32932 /* ~These are merely my observations. Guild management is, of course, your focus. I am here but to serve.~ */
  IF ~~ THEN EXIT
END

IF ~!AreaCheck("AR1005")
Global("PGFailed","GLOBAL",1)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 14 // from:
  SAY #32986 /* ~Dreadfully sorry, but you are not my superior any more. Leave me to my thoughts.~ */
  IF ~~ THEN DO ~EraseJournalEntry(55542)
~ EXIT
END

IF ~!AreaCheck("AR1005")
Global("PGFailed","GLOBAL",1)
!InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 15 // from:
  SAY #32987 /* ~I barely suffered your interruptions when your friend was guildmaster. Kindly leave.~ */
  IF ~~ THEN EXIT
END

IF ~AreaCheck("AR1005")
~ THEN BEGIN 16 // from:
  SAY @20 /* ~The pleasure, truly, is mine <CHARNAME>.  The food here is just dreadful.  I'll get back to work right away, though I doubt I'll bring in much coin this week.  I'd best make my escape, now, if you'll excuse me.~ */
  IF ~~ THEN DO ~SetGlobal("TSMilphJail","GLOBAL",0)
SetGlobal("MilphThief","GLOBAL",0)
SetGlobal("MilphRescue","GLOBAL",1)
EscapeArea()
~ EXIT
END
