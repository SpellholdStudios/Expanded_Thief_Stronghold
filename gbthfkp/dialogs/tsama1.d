// creator  : WeiDU (version 195)
// argument : SHTHASS1.DLG
// game     : .
// source   : ./data/Dialog.bif
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSAma1~

IF ~Global("AmaWaukeen","GLOBAL",0)~ THEN BEGIN 0 // from:
  SAY #33000 /* ~I think you will find that something has indeed 'come up.'~ */
  IF ~~ THEN EXTERN ~TSGLT2~ 5
END

IF ~~ THEN BEGIN 1 // from:
  SAY #33001 /* ~My name is Ama, and I am Shadowmaster of eastern Esmeltaran. Here is my signet, I think you'll find it authentic. Now stand aside! ~ */
  IF ~~ THEN EXTERN ~TSGLT2~ 6
END

IF ~~ THEN BEGIN 2 // from:
  SAY #33003 /* ~Now, now, no need for such displays. I am here to ask a favor, after all.~ */
  IF ~~ THEN REPLY #33004 /* ~What is it you would ask of me?~ */ GOTO 3
  IF ~~ THEN REPLY #33005 /* ~Why are you so far afield of your home city? ~ */ GOTO 7
  IF ~~ THEN REPLY #33006 /* ~What do you want of my guild. I will not risk it on foolish endeavors.~ */ GOTO 8
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #33007 /* ~Nothing terribly inconveniencing. I would like you to participate in a little rendezvous, and help in the removal of a pest.~ */
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 4 // from: 8.0 7.0 3.0
  SAY #33008 /* ~There is a government official causing us no end of trouble with his tariffs and spot checks on caravans. This fool thinks he can stifle the thieving trade of an entire city.~ */
  IF ~~ THEN GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 4.0
  SAY #33009 /* ~He has been trying to muscle into a relationship with the Shadow Thieves, and while we could pay, it is better that we send a message to any of his cohorts.~ */
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 5.0
  SAY #33010 /* ~I have come here with a promise of granting his wishes, but I only want to lure him away from his palasade defenses. This is where you come in.~ */
  IF ~~ THEN REPLY #33013 /* ~Speak what you need. I am listening.~ */ GOTO 9
  IF ~~ THEN REPLY #33014 /* ~I will be no decoy. What is it you are asking?~ */ GOTO 9
END

IF ~~ THEN BEGIN 7 // from: 2.1
  SAY #33011 /* ~I have come to try and end the meddling of a politician that has grown too big for himself. ~ */
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 8 // from: 2.2
  SAY #33012 /* ~This is not foolish, it is important Shadow Thief business. Best you listen and listen good.~ */
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 9 // from: 6.1 6.0
  SAY #33015 /* ~He wishes to be introduced to a contact here in the city, and that contact will be you. The meeting is already set up, and when he arrives, we will take him by surprise.~ */
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 10 // from: 9.0
  SAY #33016 /* ~You are known somewhat in this place, if not as a guildmaster. He will believe you are a legitimate contact. He seems willing to believe anything, so long as it is theatrical.~ */
  IF ~~ THEN REPLY #33017 /* ~Should I not have heard of this through Renal? He is my superior.~ */ GOTO 11
  IF ~~ THEN REPLY #33018 /* ~I will help. When is this meeting to take place?~ */ GOTO 12
  IF ~~ THEN REPLY #33019 /* ~I cannot spare the time for this right now.~ */ GOTO 13
END

IF ~~ THEN BEGIN 11 // from: 10.0
  SAY #33020 /* ~You will come to learn that you have many superiors in the Shadow Thieves. Disobey any of them at your peril. You would not want to be thought a traitor... like Mae'Var.~ */
  IF ~~ THEN REPLY #33021 /* ~Alright, I will help as best I can. When is the meeting to take place?~ */ GOTO 12
  IF ~~ THEN REPLY #33022 /* ~I do not have time for this right now.~ */ GOTO 13
END

IF ~~ THEN BEGIN 12 // from: 11.0 10.1
  SAY #33023 /* ~It will be any evening that is best for you. I will await you in Waukeen's Promenade after dark, and then dispense a runner to get Sir Greshal. The suddeness will seem dramatic to him.~ */
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 13 // from: 11.1 10.2
  SAY #33024 /* ~Then come another night. I will wait in Waukeen's Promenade after dark, and dispense a runner when you do come. Sir Greshal will think it dramatic.~ */
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 14 // from: 13.0 12.0
  SAY #33025 /* ~Do not disappoint in this matter. It is of the utmost importance.~ */
  IF ~~ THEN DO ~SetGlobal("AmaWaukeen","GLOBAL",1)
EscapeArea()~ EXTERN ~TSGLT2~ 7
END

IF ~Global("AmaWaukeen","GLOBAL",2)~ THEN BEGIN 15 // from:
  SAY #33030 /* ~You are here. Good. I saw you approach and have given the signal. Wait here and Sir Greshal will arrive shortly.~ */
  IF ~~ THEN DO ~SetGlobal("AmaWaukeen","GLOBAL",3)
~ GOTO 17
END

IF ~!InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 16 // from:
  SAY #33031 /* ~Get off, I'm waiting for <CHARNAME>.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 17 // from: 15.0
  SAY #33032 /* ~Er, he is probably going to be nervous so I would suggest keeping any weapons out of sight. A backpack will do. Best to appear harmless.~ */
  IF ~~ THEN DO ~SetGlobal("LathanPlot","GLOBAL",2)
SetGlobal("AmaSetup","GLOBAL",1)~ EXIT
END

IF ~Global("AmaSetup","GLOBAL",1)~ THEN BEGIN 18 // from:
  SAY #33033 /* ~Just wait a little longer. I'm sure he'll be here soon. He'll want us in full view and unarmed. ~ */
  IF ~~ THEN DO ~SetGlobal("AmaSetup","GLOBAL",2)~ EXIT
END

IF ~Global("AmaSetup","GLOBAL",2)~ THEN BEGIN 19 // from:
  SAY #33034 /* ~Ahh, here he comes now. ~ */
  IF ~~ THEN DO ~SetGlobal("AmaSetup","GLOBAL",3)
CreateCreature("shthoff1",[731.764],14)~ EXIT
END

IF ~~ THEN BEGIN 20 // from:
  SAY #33035 /* ~Now, everything is in place! Strike at <CHARNAME>!~ */
  IF ~~ THEN REPLY #33036 /* ~What?! What is the meaning of this?!~ */ GOTO 21
  IF ~~ THEN REPLY #33037 /* ~I knew something was up! What in the hells is going on here?!~ */ GOTO 21
END

IF ~~ THEN BEGIN 21 // from: 20.1 20.0
  SAY #33038 /* ~In Mae'Var's name, he strikes at you from beyond the grave through us! Vengeance will be served upon his killers!~ */
  IF ~~ THEN GOTO 22
END

IF ~~ THEN BEGIN 22 // from: 21.0
  SAY #33039 /* ~You have fallen for the trap, taken the bait. Now you are vulnerable, and my assassins are in place! Let the Night Knives take you!~ */
  IF ~~ THEN DO ~Enemy()
ActionOverride("shthoff1",Enemy())
CreateCreature("spmugg",[629.989],3)
CreateCreature("spmugg",[649.804],3)
CreateCreature("spmugg",[989.707],3)
CreateCreature("spmugg",[1094.901],3)
EraseJournalEntry(55522)
~ SOLVED_JOURNAL #55524 /* ~Thieves' Guild Stronghold: Ambush!

Ama has proven to be a traitor! Her entire story was a lie, simply to lure me to my doom! She wished to kill me in Mae'Var's name. I am alive to write this, so obviously she did not succeed. I shall be on my guard in the future.~ */ EXIT
END
