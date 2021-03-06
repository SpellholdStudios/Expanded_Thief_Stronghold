BEGIN ~TSLATH01~

IF ~Global("TSPlot","GLOBAL",2)~ THEN BEGIN 0
  SAY @1 /* ~Good news Boss! Renal has just sent word... we're to receive reinforcements any day now! We'll still be a bit short on manpower, but the extra thieves should help out a lot.~ */
  IF ~~ THEN REPLY @2 /* ~Excellent! I can hear the gold pouring in already. Any word on who they are?~ */ GOTO 1
  IF ~~ THEN REPLY @3 /* ~As long as they know their business. I don't have time to break in raw recruits. Do you know who they are?~ */ GOTO 1
  IF ~~ THEN REPLY @4 /* ~Just what I need. More surly low-lifes, lounging around my guild. I don't suppose you know who these fools are?~ */ GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @5 /* ~A band of fellows from our Baldur's Gate chapter up north, lead by a man named Narlen Darkwalk and a woman, Black Lily. About ten or twelve all told, possibly more, mostly...~ */
  IF ~~ THEN REPLY @6 /* ~Narlen Darkwalk? Black Lily...?~ #74199 */ GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @7 /* ~Sure. Do you know them?~ */
  IF ~~ THEN REPLY @8 /* ~I do indeed! Narlen and I go way back. Good thieves, both he and Lily. I'm sure the rest are top notch. I wonder why they left the Gate?~ */ GOTO 3
  IF ~~ THEN REPLY @9 /* ~Oh yes. I know that cant speaking idiot. I owe him him one. Working for me now, eh? I'll be glad to have that one under my heel. Why is he coming here?~ */ GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @10 /* ~Well, as you know, the recent... difficulties... have left our ranks decimated. Shadow Masters from all over are sending what men they can to increase our numbers. We can't lose Athkatla, not after what happened in Waterdeep.~ */
  = @11 /* ~Not sure if it will be enough, but every little bit counts. Even if most of the thieves we get are dregs from the other guilds.~ */
  IF ~~ THEN REPLY @12 /* ~Narlen and Lily aren't dregs. Don't worry. They'll be a welcome addition and I'm sure the others will pull their weight. How much longer until they get here?~ */ GOTO 5
  IF ~~ THEN REPLY @13 /* ~Hmmph. We'll see. When are they due to arrive?~ */ GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY @14 /* ~From what I've been told, they left some time ago... so... mmmm... lessee... seven plus eight, carry the one... just a sec... lemme take off this shoe...~ #74207 */
  IF ~~ THEN REPLY @15 /* ~Hello!~ */ GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @16 /* ~They should be here in a day or two!~ */
  IF ~~ THEN REPLY @17 /* ~Just let me know when they get here.~ */ GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @18 /* ~Will do Boss! You can count on me!~ */
  IF ~~ THEN DO ~SetGlobal("TSPlot","GLOBAL",3)
SetGlobalTimer("TSPlotTimer","GLOBAL",ONE_DAY)
SetDialogue("TSGLT2")~ JOURNAL @19 /* ~Narlen Darkwalk and Black Lily come to Athkatla

Lathan has informed me that reinforcements from the Baldur's Gate Guild branch are to arrive within the next day or two. The rogues are lead by none other than Narlen Darkwalk and Black Lily. I wonder why they have left the Gate?~ */ EXIT
END

IF ~Global("TSPlot","GLOBAL",5) Global("TSPlot5Talk","LOCALS",0)~ THEN BEGIN 8
  SAY @20 /* ~Aye, Boss. There you are! Something's come up! Renal wants you to deal with it as soon as possible.~ */
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 9 // from: 8.0
  SAY @21 /* ~Seems there's a new Captain of the Guard here in the docks and believe it or not, he's waging war on the Shadow Thieves! I suppose with the recent troubles we've been having, he or one of his superiors, has decided that this would be the perfect time to strike against us.~ */
  = @22 /* ~Now you don't have to go it alone, unless you wish. Renal has placed some thieves at your disposal to aid you in this and we have a some extra hands as well.~ */
  = @23 /* ~Orders from the top are that you're to raid the Guard House here in the docks and wipe out the garrison. It's especially important that the Captain is killed in this operation. He can't be reasoned with or bribed, so this is the only way.~ */
  = @24 /* ~Now this is the important part: do you want help with this? Or do you think you can take it alone? I'd take the help if I were you, but it's your call.~ */
  IF ~~ THEN REPLY @25 /* ~Yes. I'll accept the reinforcements. I could use the help.~ */ DO ~SetGlobal("TSPlot","GLOBAL",6)
  SetGlobal("TSPlot5Talk","LOCALS",1)   SetGlobal("TSPlot5Help","GLOBAL",1)~ GOTO 13
  IF ~~ THEN REPLY @26 /* ~No, there's no need. I'll take care of this fool myself.~ */ DO ~SetGlobal("TSPlot","GLOBAL",6)   SetGlobal("TSPlot5Talk","LOCALS",1)~ GOTO 15
END

IF ~~ THEN BEGIN 13
  SAY @27 /* ~Good and good! I only wish I could take part in the assault! Just exit the guild through the front door. Your Rogues will be waiting outside. Speak to one of them and they'll follow you to the Guard House.~ */
  = @28 /* ~The Guard House itself is in the north-central section of the Docks, two buildings east of the Temple of Oghma. The place is crawling with guards, and Captain himself will likely be well defended.~ */
  IF ~~ THEN GOTO 24
END

IF ~~ THEN BEGIN 15
  SAY @29 /* ~Very well. We really can't afford to lose more thieves anyway. I'll tell Renal that you wish to handle this on your own. It'll be quite the feather in your cap, if you pull it off.~ */
  = @30 /* ~The Guard House is in the north-central section of the Docks, east of the Temple of Oghma. The place is crawling with guards, and Captain himself will likely be well defended.~ */
  IF ~~ THEN GOTO 25
END

IF ~Global("TSPlot","GLOBAL",6)
Global("TSPlot5Talk","LOCALS",1)
Global("TSPlot5Help","GLOBAL",0)
!Dead("TS5Bad")
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 17
  SAY @31 /* ~Don't delay your assault on the garrison too long, Boss. Renal is furious at this Captain for opposing his authority. If this mess isn't taken care of soon, we'll all be in hot water!~ */
  IF ~~ THEN EXIT
END

IF ~Global("TSPlot","GLOBAL",6)
Global("TSPlot5Talk","LOCALS",1)
Global("TSPlot5Help","GLOBAL",1)
!Dead("TS5Bad")
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 18
  SAY @32 /* ~Don't delay your assault on the garrison too long, Boss. Renal is furious at this Captain for opposing his authority. If this mess isn't taken care of soon, we'll all be in hot water!~ */
  = @33 /* ~Don't forget to talk to one of the rogues in front of the guild. They're spoiling for a fight and will follow you to the barracks.~ */
  IF ~~ THEN EXIT
END

IF ~Global("TSPlot","GLOBAL",6)
Dead("TS5Bad")
InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 20
  SAY @34 /* ~Great Job Boss! We heard all about your success! The Bloodscalp was very pleased.~ */
  IF ~~ THEN DO ~SetGlobal("TSPlot","GLOBAL",7)
  SetGlobalTimer("TSPlotTimer","GLOBAL",TWO_DAYS)
  AddXPObject(Player1,5000)
  AddXPObject(Player2,5000)
  AddXPObject(Player3,5000)
  AddXPObject(Player4,5000)
  AddXPObject(Player5,5000)
  AddXPObject(Player6,5000)~ GOTO 21
END

IF ~~ THEN BEGIN 21 // from: 20.0
  SAY @35 /* ~He's given me something to pass on to you as a reward. Looks valuable... Here it is.~ */
  IF ~~ THEN DO ~SetDialog("TSGLT2")~ GOTO 22
END

IF ~~ THEN BEGIN 22
  SAY @36 /* ~I'll let you know if anything else comes up that requires your attention.~ */
  IF ~~ THEN EXIT
END

IF ~!InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 23
  SAY @37 /* ~I'm sorry, I can only speak to <CHARNAME>. I hope you understand.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 24
  SAY @38 /* ~Speak to me again when he's dead and I'll inform Renal that you've accomplished the task. Don't take too long or we'll be shut down for good!~ */
  IF ~~ THEN JOURNAL @39 /* ~The Assault on the Guard House

I have been commanded to assault the local garrison and kill the Captain of the Guard there. The Guard House is in the north-central section of the Docks. I've been given command of a contingent of thieves and assassins to aid me in this task. I must speak to one of the rogues and they will then follow me to the garrison. I must not delay too long or I risk losing my guild... and possibly more.~ */ EXIT
END

IF ~~ THEN BEGIN 25
  SAY @40 /* ~Speak to me again when he's dead and I'll inform Renal that you've accomplished the task. Don't take too long or we'll be shut down for good!~ */
  IF ~~ THEN JOURNAL @41 /* ~The Assault on the Guard House

I have been commanded to assault the local garrison and kill the Captain of the Guard there. The Guard House is in the north-central section of the Docks. I must not delay too long or I risk losing my guild... and possibly more.~ */ EXIT
END
