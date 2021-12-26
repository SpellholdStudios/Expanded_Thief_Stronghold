BEGIN ~TSKamuzu~

IF ~InPartySlot(LastTalkedToBy(Myself),0)
Global("FreedKamuzu","GLOBAL",3)~ THEN BEGIN 25
  SAY @48 /* ~Greetings <CHARNAME>. I will always be grateful to you, for what you have done for me. I am ready to begin working if you wish? I can make many potions, all very useful to thieves in particular, though I'm afraid to say that the raw materials are expensive.~ */
  IF ~~ THEN REPLY @49 /* ~Yes, let's see what you can make.~ */ GOTO 26
END

IF ~~ THEN BEGIN 26
  SAY @50 /* ~My pleasure! It is good to work as a free man again!~ */
  IF ~~ THEN DO ~SetGlobal("FreedKamuzu","GLOBAL",4) StartStore("TSKamuzu",LastTalkedToBy(Myself))~ EXIT
END

IF ~InPartySlot(LastTalkedToBy(Myself),0)
Global("FreedKamuzu","GLOBAL",4)~ THEN BEGIN 27
  SAY @51 /* ~Greetings once again, my <LADYLORD>. Do you wish me to make more potions for you?~ */
  IF ~~ THEN REPLY @49 /* ~Yes, let's see what you can make.~ */ GOTO 28
  IF ~~ THEN REPLY @53 /* ~No, not at this time Kamuzu. Just take it easy.~ */ GOTO 29
END

IF ~~ THEN BEGIN 28
  SAY @54 /* ~Always willing to serve you, my <LADYLORD>...~ */
  IF ~~ THEN DO ~StartStore("TSKamuzu",LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN 29
  SAY @55 /* ~You are most gracious. I will be here whenever you have need of me. I'll just go back to my gardening...~ */
  IF ~~ THEN EXIT
END

IF ~!InPartySlot(LastTalkedToBy(Myself),0)~ THEN BEGIN 30
  SAY @56 /* ~A pearl to you, <GABBER>. Is <PRO_LADYLORD> <CHARNAME> about?~ */
  IF ~~ THEN EXIT
END

APPEND ~MaeGuy01~
IF WEIGHT #-1 ~Global("FreedKamuzu","GLOBAL",2)
GlobalGT("AmaWaukeen","GLOBAL",0)~ THEN BEGIN a13
  SAY #51411 /* ~<CHARNAME>! It is I, Kamuzu, whom you freed from Mae'Var's prison. I must speak with you.~ */
  IF ~~ THEN REPLY #51413 /* ~What is it old man?~ */ GOTO a15
  IF ~~ THEN REPLY #51414 /* ~This sounds urgent? What is it?~ */ GOTO a15
  IF ~~ THEN REPLY #51416 /* ~I have no time to speak with you at present.~ */ GOTO a14
END

IF ~~ THEN BEGIN a14
  SAY #51418 /* ~Your life may be in danger! Please listen to me!~ */
  IF ~~ THEN REPLY #51420 /* ~Very well. What is it?~ */ GOTO a15
  IF ~~ THEN REPLY #51422 /* ~You have nothing to say that would interest me. Begone!~ */ GOTO a16
END

IF ~~ THEN BEGIN a15
  SAY #51425 /* ~That woman that was just here, I wouldn't trust her if I were you!~ */
  IF ~~ THEN REPLY #51426 /* ~Why is that?~ */ GOTO a17
END

IF ~~ THEN BEGIN a16
  SAY #51431 /* ~As you wish.~ */
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN a17
  SAY #51432 /* ~I know her. I have seen her in the prison with Mae'Var. I think that they were lovers. She may be trying to kill you.~ */
  IF ~~ THEN REPLY #51433 /* ~That's ridiculous. She is a high-ranking Shadow Thief and I shall trust her over you.~ */ GOTO a18
  IF ~~ THEN REPLY #51434 /* ~This is news indeed! I thank you, Kamuzu. I shall be careful.~ */ GOTO a19
END

IF ~~ THEN BEGIN a18
  SAY #51437 /* ~Believe what you wish but I have seen the woman with Mae'Var. I only wish to warn you. I shall leave you to your business.~ */
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN a19
  SAY #51438 /* ~It is the least that I could do. You have saved my life! Be careful, <CHARNAME>. She is not to be trusted! Farewell!~ */
  IF ~~ THEN GOTO a20
END

IF ~~ THEN BEGIN a20
  SAY @38 /* ~I... <CHARNAME>, could I...~ */
  IF ~~ THEN REPLY @39 /* ~Yes? What is it Kamuzu?~ */ GOTO a21
  IF ~~ THEN REPLY @40 /* ~Enough! Begone foul-smelling beggar!~ */ GOTO a24
END

IF ~~ THEN BEGIN a21
  SAY @41 /* ~I... I thought I would leave this place and never look back, but... I'm still a Shadow Thief! I am not without talents. Why do you think Mae'var kept me alive for so long? I am an Alchemist, by trade, and I can make many potions for you and would do so gladly! I owe you my life and more! Would take me on?~ */
  IF ~~ THEN REPLY @42 /* ~Of course! I welcome you back into the ranks of the Shadow Thieves.~ */ GOTO a22
  IF ~~ THEN REPLY @43 /* ~What?! And have you smelling up the place? I think not. Go, and be glad I don't throw you back in your hole!~ */ GOTO a23
END

IF ~~ THEN BEGIN a22
  SAY @44 /* ~Thank you! Thank you my <LADYLORD>! You won't regret this, I promise! Please, come and speak to me on the third floor when you are finished here.~ */
  IF ~~ THEN DO ~SetGlobal("FreedKamuzu","GLOBAL",3)
ChangeAIScript("PGuild",OVERRIDE)
SetDialog("TSKamuzu")
EscapeAreaMove("AR0324",700,650,6)~ JOURNAL @45 /* ~Kamuzu... The Potion Maker?

It seems that old man, Kamuzu, is a talented alchemist. Talented enough, at least, that Mae'Var kept him alive all that time. He has asked to work for me and I have accepted his offer. Should I have need of his services, I can find him on the third floor of the guild. I wonder what he can make? I'll have to pay him a visit soon.~ */ EXIT
END

IF ~~ THEN BEGIN a23
  SAY @46 /* ~No! Please no! Gotta get away!!~ */
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN a24
  SAY @47 /* ~Yes... Yes of course... Goodbye! (Kamuzu quickly runs away.)~ */
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END
END
