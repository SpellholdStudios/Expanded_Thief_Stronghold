// creator  : WeiDU (version 195)
// argument : SHTHLT02.DLG
// game     : .
// source   : ./override/SHTHLT02.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSGLT2~

IF ~!InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 0 // from:
  SAY @1 /* ~Good day to you. You'll understand if I refuse to speak with you? I can discuss business only with guildmaster <CHARNAME>. ~ [LATHAN08] */
  IF ~~ THEN EXIT
END

IF ~Global("LathanPlot","GLOBAL",0)
!Global("PGFailed","GLOBAL",1)
~ THEN BEGIN 1 // from:
  SAY #32994 /* ~Ahh, the new guild leader. I trust you will find the facilities to your liking. ~ [LATHAN02] */
  IF ~~ THEN REPLY #32995 /* ~I'm sure I will. Who are you and why are you in my guild?~ */ GOTO 2
  IF ~~ THEN REPLY #32996 /* ~Thank you for the welcome. And you are...?~ */ GOTO 2
END

IF ~~ THEN BEGIN 2 // from: 1.1 1.0
  SAY #32997 /* ~A fair question. I am Lathan, and I will be your eyes and ears when there is a matter that requires your personal attention.~ */
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #32998 /* ~You are new, so there is little on the agenda just yet. I will try to inform you when something comes up. ~ */
  IF ~~ THEN DO ~CreateCreature("TSAma1",[450.425],10)
~ EXIT
END

IF ~!Global("PGFailed","GLOBAL",1)
OR(2)
GlobalGT("LathanPlot","GLOBAL",7)
GlobalTimerNotExpired("KretorTimer","LOCALS")
~ THEN BEGIN 4 // from:
  SAY #32999 /* ~Nothing to report just yet. ~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5 // from:
  SAY #32992 /* ~And just who are you? Answer quick or I'll have you thrown out for disturbing the guildmaster.~ */
  IF ~~ THEN EXTERN ~TSAMA1~ 1
END

IF ~~ THEN BEGIN 6 // from:
  SAY #33002 /* ~What? Ah...yes, m'lady Ama. I meant no offense. Ah, <CHARNAME>, I would suggest you obey proper protocal and present your dagger before your better.~ */
  IF ~~ THEN EXTERN ~TSAMA1~ 2
END

IF ~~ THEN BEGIN 7 // from:
  SAY #33026 /* ~You must be so proud, <PRO_SIRMAAM>. Already you have been singled out for service to the greater guild. I suggest you do not be late.~ */
  IF ~~ THEN DO ~SetGlobal("LathanPlot","GLOBAL",1)
~ UNSOLVED_JOURNAL #55522 /* ~Thieves' Guild Stronghold: A meeting with Ama.

I have been contacted by a woman that says she is the Shadowmaster of eastern Esmeltaran. She produced a signet ring to prove her identity. She wishes me to act as a decoy in ambushing a politician that has grown too meddlesome for his own good. She will set up a meeting with him and I, on the pretense of introducing him to a prominent guild leader. I am to meet her in Waukeen's Promenade when it is dark. That is where the ambush will be.~ */ EXIT
END

IF ~Global("LathanPlot","GLOBAL",1)
~ THEN BEGIN 8 // from:
  SAY #33027 /* ~Do not be late for your meeting, <CHARNAME>. Miss Ama will be awaiting the closure of her trap.~ */
  IF ~~ THEN EXIT
END

IF ~Global("LathanPlot","GLOBAL",2)
Global("AmaTalk","LOCALS",0)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 9 // from:
  SAY #33041 /* ~Er, hello. I... I had you followed and... and I'm awfully sorry about the mess with that Ama person. My informant tells me her cohorts wore the insignia of the Night Knives.~ */
  IF ~~ THEN DO ~SetGlobal("AmaTalk","LOCALS",1)
SetGlobalTimer("KretorTimer","LOCALS",ONE_DAY)
~ GOTO 10
END

IF ~~ THEN BEGIN 10 // from: 9.0
  SAY #33042 /* ~She must have fashioned her fake signet, or perhaps I just didn't look closely enough. I am very sorry, and I am glad to see you well.~ */
  IF ~~ THEN REPLY #34779 /* ~I, however, am not glad to see you. Pack your things and get out.~ */ GOTO 12
  IF ~~ THEN REPLY #34780 /* ~No harm done in the long run. I'm sure to earn the occasional enemy.~ */ GOTO 15
  IF ~~ THEN REPLY #34781 /* ~Just you make damn sure you don't set me up for such again!~ */ GOTO 14
END

IF ~Global("LathanPlot","GLOBAL",2)
Global("AmaTalk","LOCALS",1)
GlobalTimerExpired("KretorTimer","LOCALS")
!Global("PGFailed","GLOBAL",1)
!Dead("Kretor")
!Global("KretorThief","GLOBAL",5)
~ THEN BEGIN 11 // from:
  SAY @18 /* ~Hello <CHARNAME>, I should speak to you about the current state of guild affairs.  Something's come up and I think it requires your attention. ~ [LATHAN07] */
  IF ~~ THEN GOTO 18
END

IF ~~ THEN BEGIN 12 // from: 10.0
  SAY #34782 /* ~You cannot mean this! I... I will be cast from the guild. None other will trust in me. Please <PRO_SIRMAAM>, give me another chance. I am your dedicated servant.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 13 // from: 12.0
  SAY #34783 /* ~I would add that it is doubtful that anyone will be chosen to fill my vacancy. Yours is an unproven guild and manpower is short. There will be no more reports on guild concerns without me. Please, reconsider.~ */
  IF ~~ THEN REPLY #34792 /* ~Very well, but I want no more mistakes on your part.~ */ GOTO 14
  IF ~~ THEN REPLY #34793 /* ~No, I have made up my mind. Get out.~ */ GOTO 16
END

IF ~~ THEN BEGIN 14 // from: 16.1 13.0 10.2
  SAY #34794 /* ~I assure you that I shall be ever vigilant with guild concerns. I shall bring them to your attention as soon as I have them. ~ */
  IF ~False()
~ THEN GOTO 18
  IF ~~ THEN GOTO 40
END

IF ~~ THEN BEGIN 15 // from: 10.1
  SAY #34795 /* ~Perhaps, but I shall be ever vigilant in keeping you apprised of any shady goings on here in your guild. ~ */
  IF ~False()
~ THEN GOTO 18
  IF ~~ THEN GOTO 40
END

IF ~~ THEN BEGIN 16 // from: 13.1
  SAY #34796 /* ~Very well. I leave the guild in your capable hands, though there will be very little for you to do without a proper assistant. It is your choice though.~ */
  IF ~~ THEN REPLY #34797 /* ~Yes, and I have made it. Goodbye.~ */ GOTO 17
  IF ~~ THEN REPLY #34798 /* ~And I think I have strung you along long enough. You will stay and assist me.~ */ GOTO 14
END

IF ~~ THEN BEGIN 17 // from: 16.0
  SAY #34799 /* ~Goodbye then. ~ */
  IF ~~ THEN DO ~SetGlobal("JamesLathan","GLOBAL",1)
EraseJournalEntry(55522)
EscapeArea()
~ JOURNAL #55526 /* ~Thieves' Guild Stronghold: Harsh judgement.

I have dismissed Lathan from my guild. His mistake with Ama almost got me killed. I don't care whether the guild suffers or not, we are better off without him.~ */ EXIT
END

IF ~~ THEN BEGIN 18 // from: 15.0 14.0 11.0
  SAY #34801 /* ~Kretor has a problem that he has been keeping from you. He has been filling in his quota with his own gold because someone in his ranks of pickpockets is skimming off the top.~ */
  IF ~~ THEN GOTO 19
END

IF ~~ THEN BEGIN 19 // from: 18.0
  SAY #34802 /* ~Kretor claims that the thieves know which one it is, though they will not say. He has asked me to deal with this since you are new and he does not quite trust you yet. These matters are your responsibility though. ~ */
  IF ~~ THEN REPLY #34803 /* ~Right you are. I will take an active hand in my guild.~ */ GOTO 20
  IF ~~ THEN REPLY #34804 /* ~I suppose such things are required of me now.~ */ GOTO 20
END

IF ~~ THEN BEGIN 20 // from: 19.1 19.0
  SAY #34805 /* ~I will explain what is happening. Kretor has four thieves under him. They are a young group with little experience and not much respect. They feign innocence, but they know who is stealing.~ */
  IF ~~ THEN GOTO 21
END

IF ~~ THEN BEGIN 21 // from: 20.0
  SAY #34806 /* ~The first is Darronal Gwin II, a spoiled child of a noble family. I think he works for Kretor out of bordom, or perhaps he's slumming. He doesn't really need the money, but he is pretty obstinant.~ */
  IF ~~ THEN GOTO 22
END

IF ~~ THEN BEGIN 22 // from: 21.0
  SAY #34809 /* ~The second is a boy named Thrand. Don't know much about him, except that he came from the south. Presumably his parents were slaves and he has little to his name. He might be stealing to buy his parents out of slavery.~ */
  IF ~~ THEN GOTO 23
END

IF ~~ THEN BEGIN 23 // from: 22.0
  SAY #34810 /* ~The third is a lass named Shadel. Had a rough home life, as near as I can figure. Joined up with Kretor because she had nowhere else to go. She could be skimming to pay for passage out of Athkatla, but I don't know.~ */
  IF ~~ THEN GOTO 24
END

IF ~~ THEN BEGIN 24 // from: 23.0
  SAY #34813 /* ~The last is a pompous little twit named, get this, Blood Nightmaster. He's a thief under Kretor because he thinks he's the best little rogue in the world. He could be stealing from us because he thinks it's daring.~ */
  IF ~~ THEN REPLY #34814 /* ~So, which do you think it could be?~ */ GOTO 25
  IF ~~ THEN REPLY #34815 /* ~A motley lot. Each could be the one. ~ */ GOTO 25
END

IF ~~ THEN BEGIN 25 // from: 24.1 24.0
  SAY #34816 /* ~It could be any of them, yes. I particularly don't like that 'Blood' idiot, but that is my personal bias. You have several options open to you at this point. Here is what I propose.~ */
  IF ~~ THEN GOTO 26
END

IF ~~ THEN BEGIN 26 // from: 30.4 25.0
  SAY #34818 /* ~You can kill them all, which may be extreme. Or kill one, to serve as an example. Or you can dock all their pay. This may make the one steal more, but it will make the others more likely to turn them in.~ */
  IF ~~ THEN REPLY #34820 /* ~I will do nothing. It is Kretor's mess, if he can't sort it out he will cover the losses.~ */ UNSOLVED_JOURNAL #55527 /* ~Thieves' Guild Stronghold: Thieves among thieves.

I have been told that one of Kretor's pickpockets has been stealing from the guild. None of the four possible culprits claim to know who has done it. I have decided to do nothing. It is Kretor's problem. He will solve it or pay the consequences.~ */ GOTO 27
  IF ~~ THEN REPLY #34821 /* ~Kill them all. I will not have the taint of this in my guild. Kretor will replace them.~ */ UNSOLVED_JOURNAL #55530 /* ~Thieves' Guild Stronghold: Thieves among thieves.

I have been told that one of Kretor's pickpockets has been stealing from the guild. None of the four possible culprits claim to know who has done it. I have decided to kill them all. I will not have dishonest thieves under me. Kretor can replace them. ~ */ GOTO 28
  IF ~~ THEN REPLY #34822 /* ~Kill one of them. This will scare the rest, and we may get the right one.~ */ GOTO 30
  IF ~~ THEN REPLY #34823 /* ~Dock their pay, all of them. I won't have Kretor pay the cost for their treachery.~ */ UNSOLVED_JOURNAL #55531 /* ~Thieves' Guild Stronghold: Thieves among thieves.

I have been told that one of Kretor's pickpockets has been stealing from the guild. None of the four possible culprits claim to know who has done it. I have decided to dock all of their pay until the guilty party either comes forward or is turned in. Perhaps that will... encourage some honesty.~ */ GOTO 29
END

IF ~~ THEN BEGIN 27 // from: 26.0
  SAY #34824 /* ~I doubt Kretor will be pleased, but he will continue to pay the quota out of his own pocket until this is settled. I will let you know how the matter played out in couple of days.~ */
  IF ~~ THEN DO ~SetGlobal("KretorPay","GLOBAL",1)
SetGlobal("LathanPlot","GLOBAL",3)
SetGlobalTimer("LathanLeaving","GLOBAL",FIVE_DAYS)
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 28 // from: 26.1
  SAY #34825 /* ~That... that is your decision to make. I will have the order carried out immediately. It is unfortunate, really, and I'm not sure they can be replaced any time soon. I will have this matter be settled in couple of days~ */
  IF ~~ THEN DO ~SetGlobal("KretorPay","GLOBAL",1)
SetGlobal("LathanPlot","GLOBAL",4)
SetGlobalTimer("LathanLeaving","GLOBAL",FIVE_DAYS)
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 29 // from: 26.3
  SAY #34828 /* ~That will certainly spur some unrest in their little clique. They all require gold for their own reasons. I will have the matter taken care of within couple of days.~ */
  IF ~~ THEN DO ~SetGlobal("KretorPay","GLOBAL",2)
SetGlobal("LathanPlot","GLOBAL",7)
SetGlobalTimer("LathanLeaving","GLOBAL",FIVE_DAYS)
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 30 // from: 26.2
  SAY #34829 /* ~Very well. Do you have a preference for which one should be killed? I prefer to leave such choices to the guild leader. Helps me sleep at night, you understand.~ */
  IF ~~ THEN REPLY #34852 /* ~I don't know. Kill that Darronal Gwin. He's probably the one.~ */ DO ~SetGlobal("KretorPay","GLOBAL",2)
SetGlobal("LathanPlot","GLOBAL",5)
~ GOTO 31
  IF ~~ THEN REPLY #34853 /* ~Kill Thrand. I'm sure the sob-story of his family is a fake anyway.~ */ DO ~SetGlobal("KretorPay","GLOBAL",1)
SetGlobal("LathanPlot","GLOBAL",6)
~ GOTO 31
  IF ~~ THEN REPLY #34854 /* ~Oh, just kill that Shadel person. She's probably the thief.~ */ DO ~SetGlobal("KretorPay","GLOBAL",1)
SetGlobal("LathanPlot","GLOBAL",6)
~ GOTO 31
  IF ~~ THEN REPLY #34855 /* ~Kill that pompous Blood Nightmaster. That wannabe is probably the thief.~ */ DO ~SetGlobal("KretorPay","GLOBAL",1)
SetGlobal("LathanPlot","GLOBAL",6)
~ GOTO 31
  IF ~~ THEN REPLY #34856 /* ~Perhaps I should consider the other options again.~ */ GOTO 26
END

IF ~~ THEN BEGIN 31 // from: 30.3 30.2 30.1 30.0
  SAY #34863 /* ~If that's what you wish, that's what will be done. I will report back to you in couple of days with the results.~ */
  IF ~~ THEN DO ~SetGlobalTimer("LathanLeaving","GLOBAL",FIVE_DAYS)
EscapeArea()
~ UNSOLVED_JOURNAL #55532 /* ~Thieves' Guild Stronghold: Thieves among thieves.

I have been told that one of Kretor's pickpockets has been stealing from the guild. None of the four possible culprits claim to know who has done it. I have decided to kill one of them. With luck I'll get the right one. If not, I'm sure the fear will straighten the others out. ~ */ EXIT
END

IF ~Global("LathanPlot","GLOBAL",3)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 32 // from:
  SAY #34868 /* ~Well, it has been over 5 days now and your plan of inaction has indeed resulted in some very startling results. I'm not sure it will be exactly what you were hoping for though.~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",9)
SetGlobal("LathanPlot","GLOBAL",8)
~ GOTO 37
END

IF ~Global("LathanPlot","GLOBAL",4)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 33 // from:
  SAY #34870 /* ~Well, it has been 5 days or so since your order to have all the thieves suspected of skimming funds killed, and the results have been predictable. That section of the guild has been decimated.~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",9)
SetGlobal("LathanPlot","GLOBAL",8)
~ GOTO 39
END

IF ~Global("LathanPlot","GLOBAL",5)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 34 // from:
  SAY #34871 /* ~Well, it has been 5 days since your order to kill Darronal Gwin II, and not a coin has gone missing since. Either you have killed the right one, or you have scared the rest straight.~ */
  IF ~~ THEN DO ~EraseJournalEntry(55527)
EraseJournalEntry(55530)
EraseJournalEntry(55531)
EraseJournalEntry(55532)
SetGlobal("LathanPlot","GLOBAL",8)
~ JOURNAL #55533 /* ~Thieves' Guild Stronghold: Thieves among thieves.

It would seem that I chose the right thief to kill. Kretor reports that the stealing of guild funds has stopped. A lucky choice indeed. ~ */ GOTO 41
END

IF ~Global("LathanPlot","GLOBAL",6)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 35 // from:
  SAY #34872 /* ~Well, it has been 5 days or so since your order to kill one of the thieves under Kretor for their suspected setaling from the guild coffers, and I must say that perhaps the results could have been better.~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",9)
SetGlobal("LathanPlot","GLOBAL",8)
~ GOTO 42
END

IF ~Global("LathanPlot","GLOBAL",7)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 36 // from:
  SAY #34873 /* ~Well, the thieves under Kretor have had a week to live with the reduction in pay that you ordered, and some startling results have been achieved. You certainly provoked a reaction.~ */
  IF ~~ THEN DO ~SetGlobal("LathanPlot","GLOBAL",8)
~ GOTO 43
END

IF ~~ THEN BEGIN 37 // from: 32.0
  SAY #34874 /* ~The stealing of our funds has indeed stopped, but it is because Kretor has quit and closed down that section of your operations.He could not afford to continue funding the quota out of his own purse.~ */
  IF ~~ THEN DO ~EraseJournalEntry(55527)
EraseJournalEntry(55530)
EraseJournalEntry(55531)
EraseJournalEntry(55532)
~ JOURNAL #55536 /* ~Thieves' Guild Stronghold: Thieves among thieves.

Kretor has quit, shutting down my pickpockets one and all. My plan of inaction did not fare as well as I had hoped. A significant loss to my guild.~ */ GOTO 38
END

IF ~~ THEN BEGIN 38 // from: 42.0 39.0 37.0
  SAY #34875 /* ~Not the result you might have wished for. Better luck next time, I suppose.~ */
  IF ~~ THEN REPLY #34876 /* ~Why did you not warn me this would happen? ~ */ GOTO 45
  IF ~~ THEN REPLY #34877 /* ~Ah well, we shall get on without him as best we can.~ */ GOTO 44
  IF ~~ THEN REPLY #34878 /* ~Have him killed, will you? I will not tolerate deserters.~ */ GOTO 46
END

IF ~~ THEN BEGIN 39 // from: 33.0
  SAY #34879 /* ~You may have stopped the stealing, but Kretor could not afford to fill the quota on his own, so he has quit. It is a shame, really. ~ */
  IF ~~ THEN DO ~EraseJournalEntry(55527)
EraseJournalEntry(55530)
EraseJournalEntry(55531)
EraseJournalEntry(55532)
~ JOURNAL #55537 /* ~Thieves' Guild Stronghold: Thieves among thieves.

Kretor has quit, following my order to have all of the pickpockets suspected of stealing guild funds killed. He could not support that section all on his own. A definite loss to my guild.~ */ GOTO 38
END

IF ~~ THEN BEGIN 40 // from: 15.1 14.1
  SAY #34880 /* ~For now, all is well. We cannot help but prosper if everything goes as planned.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 41 // from: 43.0 34.0
  SAY #34882 /* ~Well done. It shall be business as usual for all concerned.~ */
  IF ~~ THEN REPLY #34883 /* ~And I hope we shall not have this problem again.~ */ GOTO 44
  IF ~~ THEN REPLY #34884 /* ~A nasty bit of business, and I am glad it is over.~ */ GOTO 44
END

IF ~~ THEN BEGIN 42 // from: 35.0
  SAY #34894 /* ~The one killed was not the culprit, and Kretor has been paying extra now for both the lost manpower and the stolen coin. He has had enough, and has told me he has quit.~ */
  IF ~~ THEN DO ~EraseJournalEntry(55527)
EraseJournalEntry(55530)
EraseJournalEntry(55531)
EraseJournalEntry(55532)
~ JOURNAL #55535 /* ~Thieves' Guild Stronghold: Thieves among thieves.

Damnation! My order to kill one of the people suspected of stealing from the guild has backfired. Kretor has quit under the strain of holding up that section of the guild on his own. It is a significant blow to my guild.~ */ GOTO 38
END

IF ~~ THEN BEGIN 43 // from: 36.0
  SAY #34895 /* ~Darronal Gwin II has turned up dead. It would seem that the others did not appreciate him hurting their wages for his gain. Excellent decision, I should say. ~ */
  IF ~~ THEN DO ~EraseJournalEntry(55527)
EraseJournalEntry(55530)
EraseJournalEntry(55531)
EraseJournalEntry(55532)
~ JOURNAL #55534 /* ~Thieves' Guild Stronghold: Thieves among thieves.

My order to dock the pay of all thieves under Kretor has been fruitful. One of them has turned up dead, undoubtedly snuffed out by cohorts that did not appreciate his thievery cutting into their profits. I doubt I will have any more trouble.~ */ GOTO 41
END

IF ~~ THEN BEGIN 44 // from: 46.0 45.0 41.1 41.0 38.1
  SAY #34898 /* ~I'm sure that all concerned have learned from this. I will apprise you when another matter requires your attention. ~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 45 // from: 38.0
  SAY #34899 /* ~The events were perfectly predictable, <PRO_SIRMAAM>. I am your mouthpiece, not your mentor. You will have to make these decisions as you see fit. ~ */
  IF ~~ THEN GOTO 44
END

IF ~~ THEN BEGIN 46 // from: 38.2
  SAY #34900 /* ~As you see fit, <PRO_SIRMAAM>. A strange end to an unfortunate bit of business, then. ~ */
  IF ~~ THEN GOTO 44
END

IF ~Global("PGFailed","GLOBAL",1)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 47 // from:
  SAY #35310 /* ~I'd like to keep working for you, but without the support of the larger guild of Shadow Thieves, it's just not possible. Maybe Renal would reinstate you if you asked nicely. ~ [LATHAN06] */
  IF ~~ THEN DO ~EraseJournalEntry(55542)
~ UNSOLVED_JOURNAL #55538 /* ~Thieves' Guild Stronghold: the guild has failed.

My thieves will no longer work with me unless I have the support of the main Shadow Thief guild. They suggested that I ask Renal Bloodscalp to reinstate me. ~ */ EXIT
END
