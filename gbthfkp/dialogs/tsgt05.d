// creator  : WeiDU (version 195)
// argument : SHTH05.DLG
// game     : .
// source   : ./override/SHTH05.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSGT05~

IF ~Global("TalkedToJoster","GLOBAL",0)
~ THEN BEGIN 0 // from:
  SAY #32294 /* ~Hail, <CHARNAME>! It is time! Renal awaits your tribute!~ */
  IF ~~ THEN REPLY #32538 /* ~Time? Time for what? What are you doing here?~ */ DO ~SetGlobal("TalkedToJoster","GLOBAL",1)
~ GOTO 1
  IF ~~ THEN REPLY #32819 /* ~Yes, yes, I have been expecting you. No need to get excited.~ */ DO ~SetGlobal("TalkedToJoster","GLOBAL",1)
~ GOTO 2
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #32594 /* ~Haha! You are of course joking with me. You know full well that your guild quota must be paid to Renal, lest he take your charter from you. ~ */
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 2 // from: 0.1
  SAY #32820 /* ~This is not excited. I am merely eager to receive  your guild quota. Renal awaits it. He wishes to see if you are a profitable guild master. If not, someone else will be appointed.~ */
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 19.0 2.0 1.0
  SAY #32821 /* ~Now then, if you would be so kind as to give me the gold that you owe. It is a small amount, surely. You look a prosperous guild.~ */
  IF ~Global("PGQuota","GLOBAL",1)
Global("RandomCost","GLOBAL",0)
~ THEN GOTO 4
  IF ~Global("PGQuota","GLOBAL",2)
Global("RandomCost","GLOBAL",0)
~ THEN GOTO 5
  IF ~Global("PGQuota","GLOBAL",3)
Global("RandomCost","GLOBAL",0)
~ THEN GOTO 6
  IF ~Global("PGQuota","GLOBAL",4)
Global("RandomCost","GLOBAL",0)
~ THEN GOTO 7
  IF ~Global("PGQuota","GLOBAL",5)
Global("RandomCost","GLOBAL",0)
~ THEN GOTO 8
  IF ~GlobalGT("PGQuota","GLOBAL",5)
RandomNumGT(100,20)
RandomNumLT(100,71)
Global("RandomCost","GLOBAL",0)
~ THEN GOTO 9
  IF ~GlobalGT("PGQuota","GLOBAL",5)
RandomNumGT(100,70)
RandomNumLT(100,91)
Global("RandomCost","GLOBAL",0)
~ THEN GOTO 10
  IF ~GlobalGT("PGQuota","GLOBAL",5)
RandomNumLT(100,21)
Global("RandomCost","GLOBAL",0)
~ THEN GOTO 11
  IF ~GlobalGT("PGQuota","GLOBAL",5)
RandomNumGT(100,90)
Global("RandomCost","GLOBAL",0)
~ THEN GOTO 12
  IF ~Global("RandomCost","GLOBAL",1)
~ THEN GOTO 9
  IF ~Global("RandomCost","GLOBAL",2)
~ THEN GOTO 10
  IF ~Global("RandomCost","GLOBAL",3)
~ THEN GOTO 11
  IF ~Global("RandomCost","GLOBAL",4)
~ THEN GOTO 12
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY #32822 /* ~This time is a mere 500 gold. Certainly you can pay this without too much stress. Your thieves are young, but they are skilled.~ */
  IF ~PartyGoldGT(499)
~ THEN REPLY #32831 /* ~I will pay. It is my duty and I do so gladly.~ */ DO ~TakePartyGold(500)
~ GOTO 13
  IF ~~ THEN REPLY #32832 /* ~I cannot pay just yet. Can you wait until I am able?~ */ GOTO 14
END

IF ~~ THEN BEGIN 5 // from: 3.1
  SAY #32823 /* ~Again, a mere 500 gold to appease your betters in the main guild offices. Certainly you are able to pay.~ */
  IF ~PartyGoldGT(499)
~ THEN REPLY #32833 /* ~I will pay. It is my duty and I do so gladly.~ */ DO ~TakePartyGold(500)
~ GOTO 13
  IF ~~ THEN REPLY #32834 /* ~I cannot pay just yet. Can you wait until I am able?~ */ GOTO 14
END

IF ~~ THEN BEGIN 6 // from: 3.2
  SAY #32824 /* ~I am afraid that I must ask for a total of 1000 gold this time. Renal demands hard sacrifices from all his guild underlings and you are no different.~ */
  IF ~PartyGoldGT(999)
~ THEN REPLY #32835 /* ~That is quite a lot, but I will not shirk my duty. I will pay.~ */ DO ~TakePartyGold(1000)
~ GOTO 13
  IF ~~ THEN REPLY #32836 /* ~I cannot pay just yet. Can you wait until I am able?~ */ GOTO 14
END

IF ~~ THEN BEGIN 7 // from: 3.3
  SAY #32825 /* ~Once again we must all tighten our belts and pay what we can. Renal asks for a quota of 1000 gold. It is hard, but fair.~ */
  IF ~PartyGoldGT(999)
~ THEN REPLY #32837 /* ~That is quite a lot, but I will not shirk my duty. I will pay.~ */ DO ~TakePartyGold(1000)
~ GOTO 13
  IF ~~ THEN REPLY #32838 /* ~I cannot pay just yet. Can you wait until I am able?~ */ GOTO 14
END

IF ~~ THEN BEGIN 8 // from: 3.4
  SAY #32826 /* ~A reprieve for you this time. Renal has said that I need only collect 350 gold from your guild today. Very reasonable, I should think.~ */
  IF ~PartyGoldGT(349)
~ THEN REPLY #32839 /* ~A welcome break. I will gladly pay this small amount.~ */ DO ~TakePartyGold(350)
~ GOTO 13
  IF ~~ THEN REPLY #32840 /* ~I cannot pay just yet. Can you wait until I am able?~ */ GOTO 14
END

IF ~~ THEN BEGIN 9 // from: 3.9 3.5
  SAY #32827 /* ~A mere 500 gold is the tally this time. You have met the demand for larger amounts before, so no doubt this will be an easy goal.~ */
  IF ~PartyGoldGT(499)
~ THEN REPLY #32841 /* ~It is a duty that I gladly perform. I will pay.~ */ DO ~TakePartyGold(500)
SetGlobal("RandomCost","GLOBAL",0)
~ GOTO 13
  IF ~~ THEN REPLY #32842 /* ~I cannot pay just yet. Can you wait until I am able?~ */ DO ~SetGlobal("RandomCost","GLOBAL",1)
~ GOTO 14
END

IF ~~ THEN BEGIN 10 // from: 3.10 3.6
  SAY #32828 /* ~This time I am called to relieve you of 900 gold as quota. Renal will make good use of your tribute.~ */
  IF ~PartyGoldGT(899)
~ THEN REPLY #32843 /* ~A hard payment to swallow, but I will pay it nonetheless.~ */ DO ~TakePartyGold(900)
SetGlobal("RandomCost","GLOBAL",0)
~ GOTO 13
  IF ~~ THEN REPLY #32844 /* ~I cannot pay just yet. Can you wait until I am able?~ */ DO ~SetGlobal("RandomCost","GLOBAL",2)
~ GOTO 14
END

IF ~~ THEN BEGIN 11 // from: 3.11 3.7
  SAY #32829 /* ~300 gold is all that is asked this week. A mere pittance from a successful guild such as yourselves.~ */
  IF ~PartyGoldGT(299)
~ THEN REPLY #32845 /* ~It is a small amout to pay to support the greater guild as a whole.~ */ DO ~TakePartyGold(300)
SetGlobal("RandomCost","GLOBAL",0)
~ GOTO 13
  IF ~~ THEN REPLY #32846 /* ~I cannot pay just yet. Can you wait until I am able?~ */ DO ~SetGlobal("RandomCost","GLOBAL",3)
~ GOTO 14
END

IF ~~ THEN BEGIN 12 // from: 3.12 3.8
  SAY #32830 /* ~Ahh, unfortunately I must ask you for 1000 gold this week. I know it is a lot, but Renal demands that his guilds all pitch in when the need is great.~ */
  IF ~PartyGoldGT(999)
~ THEN REPLY #32847 /* ~That is quite a lot, but I will pay it cheerfully. ~ */ DO ~TakePartyGold(1000)
SetGlobal("RandomCost","GLOBAL",0)
~ GOTO 13
  IF ~~ THEN REPLY #32848 /* ~I cannot pay just yet. Can you wait until I am able?~ */ DO ~SetGlobal("RandomCost","GLOBAL",4)
~ GOTO 14
END

IF ~~ THEN BEGIN 13 // from: 12.0 11.0 10.0 9.0 8.0 7.0 6.0 5.0 4.0
  SAY #32849 /* ~A pleasure doing business with you. Renal will be most pleased with your performance. I wish you well. ~ */
  IF ~~ THEN DO ~IncrementGlobal("PGQuota","GLOBAL",1)
SetGlobal("JosterLeave","GLOBAL",1)
EscapeArea()
EraseJournalEntry(55541)
~ SOLVED_JOURNAL #55540 /* ~Thieves' Guild Stronghold: paying my dues.

I have paid the quotamaster his due for another 5 days. Renal shall be pleased with the profit I have shown him.~ */ EXIT
END

IF ~~ THEN BEGIN 14 // from: 12.1 11.1 10.1 9.1 8.1 7.1 6.1 5.1 4.1
  SAY #32850 /* ~Renal will not stand for any delay. I am on a tight schedule and you cannot interrupt it. I will give you until 5 days from the day I arrived. After that I will leave and you will lose your guild charter.~ */
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 15 // from: 14.0
  SAY #32851 /* ~Be aware that this will not delay my next visit at all. I return every 5 days. If you wait until the 5th day to pay, I will still return the next. It is to your benefit to pay me quick.~ */
  IF ~~ THEN REPLY #32856 /* ~What if I am unable to get back to the guild? ~ */ GOTO 16
  IF ~~ THEN REPLY #32857 /* ~I will pay you as soon as I can. ~ */ GOTO 18
END

IF ~~ THEN BEGIN 16 // from: 15.0
  SAY #32873 /* ~That is no concern of ours. If you lose the guild through your negligence, you may be offered the chance to purchase your way back in. Renal will collect the fee if it comes to that.~ */
  IF ~~ THEN GOTO 17
END

IF ~~ THEN BEGIN 17 // from: 18.0 16.0
  SAY #32874 /* ~It will not be small, but if you really wish to regain your place, you will have little other choice. Pay when you can, but do it soon. You will pay more to Renal later.~ */
  IF ~~ THEN DO ~EraseJournalEntry(55540)
~ UNSOLVED_JOURNAL #55541 /* ~Thieves' Guild Stronghold: payment must come.

I must pay my guild dues to the quotamaster quickly or he will declare my guild a failure and Renal will shut it down.~ */ EXIT
END

IF ~~ THEN BEGIN 18 // from: 15.1
  SAY #32880 /* ~Be sure you do. If you miss a payment or take too long, you will be stripped of all power over the guild. The only way to get it back after that will be to pay a fine to Renal himself.~ */
  IF ~~ THEN GOTO 17
END

IF ~True()
~ THEN BEGIN 19 // from:
  SAY #32881 /* ~Ahh, you return. Obviously you have come to your senses and will pay the quota that Renal is due. ~ */
  IF ~~ THEN GOTO 3
END
