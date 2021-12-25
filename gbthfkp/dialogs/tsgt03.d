// creator  : WeiDU (version 195)
// argument : SHTH03.DLG
// game     : .
// source   : ./override/SHTH03.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSGT03~

IF ~!AreaCheck("AR1005")
!InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 0 // from:
  SAY #32933 /* ~If'n it's all the same to you, my words are reserved for <CHARNAME> alone, 'cuz <PRO_HESHE>'s my one boss, and the only one I'll take orders from.~ */
  IF ~~ THEN EXIT
END

IF ~!AreaCheck("AR1005")
Global("TalkedToKretor","AR0322",0)
InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 1 // from:
  SAY #32935 /* ~We ain't had time to chat yet, so I'll introduce myself nice and proper. I'm Kretor, and I don't like being run ragged, thank you very much.~ */
  IF ~~ THEN DO ~SetGlobal("TalkedToKretor","AR0322",1)
~ GOTO 2
END

IF ~~ THEN BEGIN 2 // from: 10.0 1.0
  SAY #32936 /* ~I'll offer my opinions and recommendations whether ye ask or not, and if'n they don't please, I apologize now ahead of time.~ */
  IF ~Global("KretorThief","GLOBAL",1)
Global("KretorRescue","GLOBAL",0)
Global("KretorPay","GLOBAL",0)
~ THEN GOTO 4
  IF ~Global("KretorThief","GLOBAL",2)
Global("KretorRescue","GLOBAL",0)
Global("KretorPay","GLOBAL",0)
~ THEN GOTO 5
  IF ~Global("KretorThief","GLOBAL",3)
Global("KretorRescue","GLOBAL",0)
Global("KretorPay","GLOBAL",0)
~ THEN GOTO 6
  IF ~Global("KretorThief","GLOBAL",4)
Global("KretorRescue","GLOBAL",0)
Global("KretorPay","GLOBAL",0)
~ THEN GOTO 7
  IF ~Global("KretorThief","GLOBAL",0)
Global("KretorRescue","GLOBAL",0)
Global("KretorPay","GLOBAL",0)
~ THEN GOTO 8
  IF ~Global("KretorRescue","GLOBAL",1)
Global("KretorPay","GLOBAL",0)
~ THEN GOTO 9
  IF ~Global("KretorPay","GLOBAL",1)
~ THEN GOTO 16
  IF ~Global("KretorPay","GLOBAL",2)
GlobalGT("LathanPlot","GLOBAL",7)
~ THEN GOTO 17
  IF ~Global("KretorPay","GLOBAL",2)
Global("LathanPlot","GLOBAL",7)
~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 2.8
  SAY @22 /* ~These thieving underlings of mine will be the death of me!  I hope your plan to deal with them works out.  I was at the end of my rope.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 4 // from: 2.0
  SAY #32937 /* ~These slow times is good, and I ain't afraid to say so. The others might yank on your leg, saying they can't stand small risk. Liars they are, 'cuz there ain't a person alive that hates easy work.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 5 // from: 2.1
  SAY #32938 /* ~Now, I know you've got a profit to make, but risking my neck with prison ain't gonna make it happen. Sure, your choices seemed safe, but who knows what can happen.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 6 // from: 2.2
  SAY #32939 /* ~This job is just getting worse and worse. Ain't no way I'll outlive the tenday if you keep me at this pace. Risky as hell. Don't say you ain't been warned.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 7 // from: 2.3
  SAY #32940 /* ~Y'know, I thought I'd be screamin' blue at you for risking my neck like you are, but it's kinda exciting. Ain't enough of a rush to want to keep it up though. Ease off a bit, or risk losing me.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 8 // from: 2.4
  SAY #32941 /* ~Sittin' around like this is just fine by me. Ain't got a thing to do and I'm just fine. After all, they ain't gonna send the guild quota bill to me.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 9 // from: 2.5
  SAY #32942 /* ~I gotta put it to ya, you sure came through when I needed. Of course, if it weren't for you I wouldn't have been locked up in the first place. Watch the risk in future, I can't take it.~ */
  IF ~~ THEN DO ~SetGlobal("KretorRescue","GLOBAL",0)
~ GOTO 13
END

IF ~!AreaCheck("AR1005")
InPartySlot(LastTalkedToBy,0)
Global("PGFailed","GLOBAL",0)
~ THEN BEGIN 10 // from:
  SAY #32943 /* ~Fine to see your face again, <CHARNAME>. What do you want of me now?~ */
  IF ~~ THEN REPLY #32944 /* ~Give me a status report on how you think I'm doing.~ */ GOTO 2
  IF ~~ THEN REPLY #32945 /* ~You seem a little confrontational. I hope I can count on you to perform loyally.~ */ GOTO 11
  IF ~~ THEN REPLY #32946 /* ~How did you come to find yourself in the Shadow Thieves?~ */ GOTO 12
END

IF ~~ THEN BEGIN 11 // from: 10.1
  SAY #32947 /* ~I know's my place, and I'll do my job as you say. Nothing says I gotta like it. Get on, you've got some guildmaster business or somesuch to do. Don't waste your time talking to me.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12 // from: 10.2
  SAY #32948 /* ~People need someone to lighten their loads, and the purse is a good place to start. I do what I do and the Shadow Thieves let me do it. Best job in town, even though it's still a job.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 13 // from: 17.0 16.0 9.0 8.0 7.0 6.0 5.0 4.0 3.0
  SAY #32949 /* ~Of course you shouldn't take anything I say about the guild all that seriously. I'd just as soon be on the street doing what I do. I'm there all the time anyway.~ */
  IF ~~ THEN EXIT
END

IF ~!AreaCheck("AR1005")
Global("PGFailed","GLOBAL",1)
InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 14 // from:
  SAY #32984 /* ~Heeeh, you ain't no more than me now. Get off with ya. You ain't the boss no more.~ */
  IF ~~ THEN DO ~EraseJournalEntry(55542)
~ EXIT
END

IF ~!AreaCheck("AR1005")
Global("PGFailed","GLOBAL",1)
!InPartySlot(LastTalkedToBy,0)
~ THEN BEGIN 15 // from:
  SAY #32985 /* ~You ain't even a shadow of your friend, and <PRO_HESHE> ain't the guildmaster no more, so that makes you a shadow of nothing.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 16 // from: 2.6
  SAY #34901 /* ~I ain't happy, not one bit. This business with them underlings stealing is only getting me the shaft. Ain't gonna go on long.~ */
  IF ~~ THEN DO ~SetGlobal("KretorPay","GLOBAL",0)
~ GOTO 13
END

IF ~~ THEN BEGIN 17 // from: 2.7
  SAY #34902 /* ~You handled that there business with them thieving underlings of mine like a pro. You keep up the good work and we'll get on fine.~ */
  IF ~~ THEN DO ~SetGlobal("KretorPay","GLOBAL",0)
~ GOTO 13
END

IF ~AreaCheck("AR1005")
~ THEN BEGIN 18 // from:
  SAY @21 /* ~You're a real pro, Boss.  A real pro!  Don't expect too much this week, but I should make the quota now.  Let's ditch this joint, eh?~ */
  IF ~~ THEN DO ~SetGlobal("TSKretorJail","GLOBAL",0)
SetGlobal("KretorThief","GLOBAL",0)
SetGlobal("KretorRescue","GLOBAL",1)
EscapeArea()
~ EXIT
END
