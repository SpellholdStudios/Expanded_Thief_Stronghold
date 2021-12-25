// creator  : WeiDU (version 195)
// argument : TSGLT1.DLG
// game     : .
// source   : ./override/TSGLT1.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~TSGLT1~

IF ~!InPartySlot(LastTalkedToBy(Myself),0)
~ THEN BEGIN 0 // from:
  SAY #32046 /* ~Sorry,  I don't take orders from subordinates. I report only to <CHARNAME> and Renal.~ [JARIEL06] */
  IF ~~ THEN EXIT
END

IF ~Global("PGFailed","GLOBAL",1)
~ THEN BEGIN 1 // from:
  SAY #35309 /* ~Shame about the guild, eh? We had a good thing going for a while. If you want it back, Renal might consider reinstating you... with a hefty fine, of course.~ [JARIEL08] */
  IF ~~ THEN DO ~EraseJournalEntry(55542)
~ JOURNAL #55538 /* ~Thieves' Guild Stronghold: the guild has failed.

My thieves will no longer work with me unless I have the support of the main Shadow Thief guild. They suggested that I ask Renal Bloodscalp to reinstate me. ~ */ EXIT
END

IF ~GlobalTimerNotExpired("PGThievesReturn","GLOBAL")
Global("JarielInitiated","GLOBAL",1)
~ THEN BEGIN 2 // from:
  SAY #32687 /* ~I have nothing to report on the status of your rogues just yet. We must wait until 5 days has elapsed. ~ */
  IF ~~ THEN EXIT
END

IF ~Global("JarielInitiated","GLOBAL",0)
~ THEN BEGIN 3 // from:
  SAY #32048 /* ~Welcome to the guild. I haven't heard much about you, but if Renal says you are alright, I'll take his word on it.~ [JARIEL02] */
  IF ~~ THEN REPLY #32064 /* ~That is wise of you. You would not want to cross him.~ */ DO ~SetGlobal("HanzThief","GLOBAL",1)
SetGlobal("MilphThief","GLOBAL",1)
SetGlobal("KretorThief","GLOBAL",1)
SetGlobal("MorsaThief","GLOBAL",1)
SetGlobal("VariaThief","GLOBAL",1)
SetGlobal("JarielInitiated","GLOBAL",1)
~ GOTO 4
  IF ~~ THEN REPLY #32065 /* ~Yes, well, I am looking forward to helping this guild branch prosper.~ */ DO ~SetGlobal("HanzThief","GLOBAL",1)
SetGlobal("MilphThief","GLOBAL",1)
SetGlobal("KretorThief","GLOBAL",1)
SetGlobal("MorsaThief","GLOBAL",1)
SetGlobal("VariaThief","GLOBAL",1)
SetGlobal("JarielInitiated","GLOBAL",1)
~ GOTO 5
END

IF ~~ THEN BEGIN 4 // from: 3.0
  SAY #32067 /* ~Let's not have an antagonistic relationship, <CHARNAME>. I am your lieutenant, and I will need to be able to trust you. ~ */
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 5 // from: 3.1
  SAY #32068 /* ~I'm sure you will. We'd all like a shot at being part of a successful chapter. Many are anxious to prove themselves in Mae'Var's absence.~ */
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 5.0 4.0
  SAY #32071 /* ~Now then, would you like the basics of the guild, or should we just get to business?~ */
  IF ~~ THEN REPLY #32072 /* ~Tell me the basics. How do I run this place?~ */ GOTO 7
  IF ~~ THEN REPLY #32073 /* ~I'd like to get right to work. I think I know how to handle the place.~ */ GOTO 13
END

IF ~~ THEN BEGIN 7 // from: 6.0
  SAY #32074 /* ~Well, you have a stable of several thieves here, which I will introduce to you. Each has a specialty, and each has more thieves under them. ~ */
  IF ~~ THEN GOTO 8
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY #32075 /* ~You will direct their patterns of thievery. If successful, they will bring in money to the guild. If not, they may be captured by the city guards.~ */
  IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 9 // from: 12.0
  SAY #32077 /* ~You must make a certain amount of gold to meet the quota set by Renal. If you miss a quota, you will be removed as guild leader and this branch will be closed.~ */
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 10 // from: 9.0
  SAY #32078 /* ~You can pay the extra money out of your pocket if you like, but it'll get expensive. You'll get profits from the guild, but be careful you don't take too much.~ */
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 11 // from: 8.0
  SAY #32111 /* ~Your directions will result in higher or lower risk to your thieves, but sometimes simple bad luck intervenes.  If captured, you can bribe a thief out of prison.~ */
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 12 // from: 11.0
  SAY #32112 /* ~You can continue with all your thieves in prison, but you will get no profit. No use getting mad at me... if I die, the guild fails. I have Renal's ear, you see. ~ */
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 13 // from: 10.0 6.1
  SAY #32115 /* ~Now, would you like to discuss the patterns your thieves will assume this week? They are operating at a low level of risk right now, just covering the quota. ~ */
  IF ~Global("JamesLathan","GLOBAL",0)
!Dead("Lathen")
~ THEN REPLY #62163 /* ~Leave it as it is, then.~ */ DO ~EraseJournalEntry(45237)
~ UNSOLVED_JOURNAL #55539 /* ~Thieves' Guild Stronghold: A stable of thieves.

Jariel has informed me of my duties as guildmaster. I am to assign the activities of my thieves on a weekly basis, judging the risks accordingly. When the results are in, I may take a profit from their actions. I must also pay the guild quotamaster when he comes, conveniently about the same time as my thieves will be done. If I do not pay him on time, the guild will be shut down. The Shadow Thieves do not support guild offshoots that cannot provide adequate profit.~ */ GOTO 14
  IF ~~ THEN REPLY #32170 /* ~I will make changes.~ */ DO ~EraseJournalEntry(45237)
~ UNSOLVED_JOURNAL #55539 /* ~Thieves' Guild Stronghold: A stable of thieves.

Jariel has informed me of my duties as guildmaster. I am to assign the activities of my thieves on a weekly basis, judging the risks accordingly. When the results are in, I may take a profit from their actions. I must also pay the guild quotamaster when he comes, conveniently about the same time as my thieves will be done. If I do not pay him on time, the guild will be shut down. The Shadow Thieves do not support guild offshoots that cannot provide adequate profit.~ */ GOTO 15
  IF ~OR(2)
Global("JamesLathan","GLOBAL",1)
Dead("Lathen")
~ THEN REPLY #62163 /* ~Leave it as it is, then.~ */ DO ~EraseJournalEntry(45237)
~ UNSOLVED_JOURNAL #55539 /* ~Thieves' Guild Stronghold: A stable of thieves.

Jariel has informed me of my duties as guildmaster. I am to assign the activities of my thieves on a weekly basis, judging the risks accordingly. When the results are in, I may take a profit from their actions. I must also pay the guild quotamaster when he comes, conveniently about the same time as my thieves will be done. If I do not pay him on time, the guild will be shut down. The Shadow Thieves do not support guild offshoots that cannot provide adequate profit.~ */ GOTO 200
END

IF ~~ THEN BEGIN 14 // from: 206.0 196.0 144.0 143.0 142.0 141.0 140.0 139.0 138.0 137.0 136.0 135.0 134.1 133.0 120.2 120.1 119.3 93.3 67.3 41.3 15.3 13.0
  SAY #32171 /* ~In 5 days I will tell you the results of their work. Until then, speak with Lathan. He may have some business that requires your personal attention. ~ */
  IF ~~ THEN DO ~SetGlobalTimer("PGThievesReturn","GLOBAL",FIVE_DAYS)
SetGlobal("NotifyThiefHead","GLOBAL",0)
SetGlobal("PGThievesLeave","GLOBAL",1)
~ EXIT
END

IF ~~ THEN BEGIN 15 // from: 196.1 13.1
  SAY #32313 /* ~The first of your thieves is Hanz. He specializes in house breaking and safe cracking. Nobles are a favorite target of his. ~ */
  IF ~GlobalLT("HanzThief","GLOBAL",5)
!Dead("Hanz")
~ THEN REPLY #32317 /* ~Hanz, eh? What is he currently up to?~ */ GOTO 16
  IF ~Global("HanzThief","GLOBAL",5)
!Dead("Hanz")
~ THEN REPLY #32317 /* ~Hanz, eh? What is he currently up to?~ */ GOTO 28
  IF ~Dead("Hanz")
~ THEN REPLY #32317 /* ~Hanz, eh? What is he currently up to?~ */ GOTO 29
  IF ~~ THEN REPLY #32319 /* ~I don't want to change the activity of any of the thieves.~ */ GOTO 14
END

IF ~~ THEN BEGIN 16 // from: 15.0
  SAY #32330 /* ~Hanz is currently available for assignment. Do you want to change the way he goes about his business for the next 5 days or so?~ */
  IF ~~ THEN REPLY #32331 /* ~Yes, I want to know exactly what he is up to.~ */ GOTO 17
  IF ~~ THEN REPLY #32332 /* ~Actually, leave him as is. Go to the next rogue.~ */ GOTO 41
  IF ~~ THEN REPLY #32439 /* ~I don't want him to do anything for the next few days.~ */ DO ~SetGlobal("HanzThief","GLOBAL",0)
~ GOTO 41
END

IF ~~ THEN BEGIN 17 // from: 30.0 16.0
  SAY #32336 /* ~Alright. How high of a quota should be set for him? This will of course mean burglaring more or less houses, so there may be increased risk to him.~ */
  IF ~~ THEN REPLY #32340 /* ~I want as high a return as possible. Tell him to do as many houses as he can.~ */ GOTO 18
  IF ~~ THEN REPLY #32341 /* ~Tell him to do his work in moderation. No need to get the guards in an uproar.~ */ GOTO 19
END

IF ~~ THEN BEGIN 18 // from: 17.0
  SAY #32361 /* ~Very well. Should he order his men to work in groups with him? There will be less jobs done, so less profit, but there will also be less risk of capture.~ */
  IF ~~ THEN REPLY #32366 /* ~Keep to groups. I don't want guards sneaking up on them.~ */ GOTO 20
  IF ~~ THEN REPLY #32367 /* ~No, I want them to fan out as individuals.~ */ GOTO 21
END

IF ~~ THEN BEGIN 19 // from: 17.1
  SAY #32362 /* ~Very well then. Should Hanz have his men group up or spread out? Groups will mean less risk of capture, but also less individual jobs done.~ */
  IF ~~ THEN REPLY #32372 /* ~Groups would be best. Better safe than sorry.~ */ GOTO 22
  IF ~~ THEN REPLY #32373 /* ~No, they are doing less jobs as it is with a low quota.~ */ GOTO 23
END

IF ~~ THEN BEGIN 20 // from: 18.0
  SAY #32376 /* ~Alright. Lastly, should they tackle large targets,  or should Hanz keep to mercantile homes? Nobles are better guarded, but they have more lootables.~ */
  IF ~~ THEN REPLY #32380 /* ~Go for the better targets.~ */ GOTO 24
  IF ~~ THEN REPLY #32381 /* ~Keep to the lower profile targets.~ */ GOTO 25
END

IF ~~ THEN BEGIN 21 // from: 18.1
  SAY #32377 /* ~Very well. And what of potential targets? Should they go after high profile, high profit places or just stick to mercantile houses?  High profile means high risk!~ */
  IF ~~ THEN REPLY #32395 /* ~The spoils of the better targets will make up for the risk. Take the chance!~ */ GOTO 26
  IF ~~ THEN REPLY #32396 /* ~Ehh, that's enough risk already, I think. Best stick to the safer targets.~ */ GOTO 24
END

IF ~~ THEN BEGIN 22 // from: 19.0
  SAY #32384 /* ~You are playing it fairly safe so far, but what about targets?  Should they try for noble estates or mercantile homes? Estates are high profit, but higher risk.~ */
  IF ~~ THEN REPLY #32397 /* ~Try for the better targets. ~ */ GOTO 25
  IF ~~ THEN REPLY #32398 /* ~Play it safe all the way.~ */ GOTO 27
END

IF ~~ THEN BEGIN 23 // from: 19.1
  SAY #32386 /* ~Should they go after high profile places or just stick to mercantile homes? Nobles have more lootables, but there is a larger risk.~ */
  IF ~~ THEN REPLY #32399 /* ~Try for the homes of nobles. ~ */ GOTO 24
  IF ~~ THEN REPLY #32400 /* ~Stick to the less guarded businessmen.~ */ GOTO 25
END

IF ~~ THEN BEGIN 24 // from: 23.0 21.1 20.0
  SAY #32391 /* ~I will inform Hanz of your instructions immediately.~ */
  IF ~RandomNumLT(100,36)
~ THEN GOTO 39
  IF ~RandomNumGT(100,35)
~ THEN GOTO 40
END

IF ~~ THEN BEGIN 25 // from: 23.1 22.0 20.1
  SAY #32391 /* ~I will inform Hanz of your instructions immediately.~ */
  IF ~RandomNumLT(100,21)
~ THEN GOTO 37
  IF ~RandomNumGT(100,20)
~ THEN GOTO 38
END

IF ~~ THEN BEGIN 26 // from: 21.0
  SAY #32391 /* ~I will inform Hanz of your instructions immediately.~ */
  IF ~RandomNumLT(100,51)
~ THEN GOTO 35
  IF ~RandomNumGT(100,50)
~ THEN GOTO 36
END

IF ~~ THEN BEGIN 27 // from: 22.1
  SAY #32391 /* ~I will inform Hanz of your instructions immediately.~ */
  IF ~RandomNumLT(100,11)
~ THEN GOTO 33
  IF ~RandomNumGT(100,10)
~ THEN GOTO 34
END

IF ~~ THEN BEGIN 28 // from: 15.1
  SAY @58 /* ~Unfortunately, Hanz is currently in the hands of the guards. Will you authorize his release? We can bribe the city officials if you put up the 1000 gold.~ */
  IF ~PartyGoldGT(999)
~ THEN REPLY #32411 /* ~I will pay it. No rogue of mine will languish in jail.~ */ DO ~TakePartyGold(1000)
~ GOTO 30
  IF ~~ THEN REPLY #32412 /* ~He'll have to wait. I cannot spare the coin just yet.~ */ GOTO 31
  IF ~~ THEN REPLY @61 /* ~Pay a bribe?  Never!  I'll break Hanz out of jail myself.~ */ GOTO 210
END

IF ~~ THEN BEGIN 29 // from: 15.2
  SAY #32406 /* ~Hanz is unfortunately dead. There is nothing that can be done for him. ~ */
  IF ~~ THEN GOTO 41
END

IF ~~ THEN BEGIN 30 // from: 28.0
  SAY #32407 /* ~I will have his released as soon as possible. Do you want to assign him his duties for the next week then?~ */
  IF ~~ THEN REPLY #32413 /* ~Yes, I will give him his duties now.~ */ DO ~SetGlobal("HanzRescue","GLOBAL",1)
~ GOTO 17
  IF ~~ THEN REPLY #32414 /* ~No, leave him to rest this week.~ */ DO ~SetGlobal("HanzThief","GLOBAL",0)
SetGlobal("HanzRescue","GLOBAL",1)
~ GOTO 41
END

IF ~~ THEN BEGIN 31 // from: 28.1
  SAY #32408 /* ~Then Hanz will stay in the custody of the guards for now. I'll get a message to him so that he knows he is not forgotten.~ */
  IF ~~ THEN GOTO 41
END

IF ~~ THEN BEGIN 32 // from:
  SAY #32199 /* ~Hanz is already assigned a task for this period.~ */
  IF ~~ THEN GOTO 41
END

IF ~~ THEN BEGIN 33 // from: 27.0
  SAY #32418 /* ~Your current instructions should pose very little difficulty for him. I'll wager he would even like more of a challenge. ~ */
  IF ~~ THEN DO ~SetGlobal("HanzThief","GLOBAL",1)
SetGlobal("HanzAssigned","GLOBAL",1)
~ GOTO 41
END

IF ~~ THEN BEGIN 34 // from: 27.1
  SAY #32418 /* ~Your current instructions should pose very little difficulty for him. I'll wager he would even like more of a challenge. ~ */
  IF ~~ THEN DO ~SetGlobal("HanzThief","GLOBAL",1)
SetGlobal("HanzAssigned","GLOBAL",1)
~ GOTO 41
END

IF ~~ THEN BEGIN 35 // from: 26.0
  SAY #32420 /* ~He will not likely appreciate such risky directions, but he will obey them as you command. I'm sure he will prevail against the odds. ~ */
  IF ~~ THEN DO ~SetGlobal("HanzThief","GLOBAL",4)
SetGlobal("HanzAssigned","GLOBAL",1)
~ GOTO 41
END

IF ~~ THEN BEGIN 36 // from: 26.1
  SAY #32420 /* ~He will not likely appreciate such risky directions, but he will obey them as you command. I'm sure he will prevail against the odds. ~ */
  IF ~~ THEN DO ~SetGlobal("HanzThief","GLOBAL",4)
SetGlobal("HanzAssigned","GLOBAL",1)
~ GOTO 41
END

IF ~~ THEN BEGIN 37 // from: 25.0
  SAY #32421 /* ~He is not liekly to be too troubled by your directions. Fairly low difficulty for a housebreaker of his skill. I'm sure he will prove quite profitable.~ */
  IF ~~ THEN DO ~SetGlobal("HanzThief","GLOBAL",2)
SetGlobal("HanzAssigned","GLOBAL",1)
~ GOTO 41
END

IF ~~ THEN BEGIN 38 // from: 25.1
  SAY #32422 /* ~He is not likely to be too troubled by your directions. Fairly low difficulty for a housebreaker of his skill. I'm sure he will prove quite profitable.~ */
  IF ~~ THEN DO ~SetGlobal("HanzThief","GLOBAL",2)
SetGlobal("HanzAssigned","GLOBAL",1)
~ GOTO 41
END

IF ~~ THEN BEGIN 39 // from: 24.0
  SAY #32424 /* ~You have set a fairly difficult task before Hanz, but he is resilient and resourceful, and I am sure he will turn it to his profit. Expect good things of him.~ */
  IF ~~ THEN DO ~SetGlobal("HanzThief","GLOBAL",3)
SetGlobal("HanzAssigned","GLOBAL",1)
~ GOTO 41
END

IF ~~ THEN BEGIN 40 // from: 24.1
  SAY #32424 /* ~You have set a fairly difficult task before Hanz, but he is resilient and resourceful, and I am sure he will turn it to his profit. Expect good things of him.~ */
  IF ~~ THEN DO ~SetGlobal("HanzThief","GLOBAL",3)
SetGlobal("HanzAssigned","GLOBAL",1)
~ GOTO 41
END

IF ~~ THEN BEGIN 41 // from: 210.0 40.0 39.0 38.0 37.0 36.0 35.0 34.0 33.0 32.0 31.0 30.1 29.0 16.2 16.1
  SAY #32425 /* ~The next rogues is Goshan, an assassin.  He is not limited to merely killing, but also uses strategic threats and... encouragement to pay for protection.~ */
  IF ~GlobalLT("MilphThief","GLOBAL",5)
!Dead("Milph")
~ THEN REPLY #32432 /* ~What is Goshan's current status?~ */ GOTO 42
  IF ~Global("MilphThief","GLOBAL",5)
!Dead("Milph")
~ THEN REPLY #32432 /* ~What is Goshan's current status?~ */ GOTO 54
  IF ~Dead("Milph")
~ THEN REPLY #32432 /* ~What is Goshan's current status?~ */ GOTO 55
  IF ~~ THEN REPLY #32434 /* ~I'll just leave everyone else the way they are.~ */ GOTO 14
END

IF ~~ THEN BEGIN 42 // from: 41.0
  SAY #32435 /* ~There is nothing preventing Goshan from taking your orders this tenday. Do you want to modify what he will be doing for the next 5 days or so?~ */
  IF ~~ THEN REPLY #32436 /* ~Yes, I will direct him personally.~ */ GOTO 43
  IF ~~ THEN REPLY #32437 /* ~No, that will be fine. Go to the next rogue.~ */ GOTO 67
  IF ~~ THEN REPLY #32439 /* ~I don't want him to do anything for the next few days.~ */ DO ~SetGlobal("MilphThief","GLOBAL",0)
~ GOTO 67
END

IF ~~ THEN BEGIN 43 // from: 56.0 42.0
  SAY #32440 /* ~How selective should he be in his clientelle? It takes quite some time to make sure a job is on the level. More time to research will mean less profit.~ */
  IF ~~ THEN REPLY #32441 /* ~Tell him to be as quick as possible in his research. We need the extra gold.~ */ GOTO 44
  IF ~~ THEN REPLY #32442 /* ~He should be very selective. I don't want him taking undue risk. ~ */ GOTO 45
END

IF ~~ THEN BEGIN 44 // from: 43.0
  SAY #32443 /* ~Very well. Should he also take less time in the execution of the job? Usually there is a fair amount of investigation into target people or documents.~ */
  IF ~~ THEN REPLY #32444 /* ~He should take his time on the target. ~ */ GOTO 46
  IF ~~ THEN REPLY #32445 /* ~Again, he should be a quick as possible.~ */ GOTO 47
END

IF ~~ THEN BEGIN 45 // from: 43.1
  SAY #32446 /* ~Should Goshan take his time researching the target as well? There is usually a reason the employer does not do the job himself.~ */
  IF ~~ THEN REPLY #32447 /* ~Again, tell him to take his time.~ */ GOTO 48
  IF ~~ THEN REPLY #32448 /* ~No, he should be quick with the target. Get out of the job as soon as possible.~ */ GOTO 49
END

IF ~~ THEN BEGIN 46 // from: 44.0
  SAY #32449 /* ~Very well.  Which type of employment do you wish him to seek?  Mainly intelligence gathering work, or... extermination of pests?~ */
  IF ~~ THEN REPLY #32453 /* ~Exterminations. They will pay better, despite the risk.~ */ GOTO 50
  IF ~~ THEN REPLY #32454 /* ~Lean more towards information gathering. It is less risky.~ */ GOTO 51
END

IF ~~ THEN BEGIN 47 // from: 44.1
  SAY #32450 /* ~Very well. Where should he concentrate his resources? Should he focus on mainly intelligence gathering work, or more on... extermination of pests?~ */
  IF ~~ THEN REPLY #32455 /* ~Exterminations are the way to go. They will pay better becuase of the risk.~ */ GOTO 52
  IF ~~ THEN REPLY #32456 /* ~Lean more towards the gathering of information. It is less risky.~ */ GOTO 50
END

IF ~~ THEN BEGIN 48 // from: 45.0
  SAY #32451 /* ~Alright. You seem to be playing it safe so far, so I imagine you'll want him to stick mainly with information gathering, as opposed to assassinations.~ */
  IF ~~ THEN REPLY #32457 /* ~No, I don't want him to wast his talents. Have him seek out... pest removal jobs.~ */ GOTO 51
  IF ~~ THEN REPLY #32458 /* ~Yes, he should stick with simple information retrieval.~ */ GOTO 53
END

IF ~~ THEN BEGIN 49 // from: 45.1
  SAY #32452 /* ~Very well. Where should he concentrate his resources?  Primarily intelligence gathering work, or more with... extermination of pests?~ */
  IF ~~ THEN REPLY #32459 /* ~Pest removal. It will probably yield better payment.~ */ GOTO 50
  IF ~~ THEN REPLY #32460 /* ~Stick to spying and the like. No need to make blood enemies.~ */ GOTO 51
END

IF ~~ THEN BEGIN 50 // from: 49.0 47.1 46.0
  SAY #32464 /* ~Very well. I will inform Goshan of your instructions. ~ */
  IF ~RandomNumLT(100,36)
~ THEN GOTO 65
  IF ~RandomNumGT(100,35)
~ THEN GOTO 66
END

IF ~~ THEN BEGIN 51 // from: 49.1 48.0 46.1
  SAY #32464 /* ~Very well. I will inform Goshan of your instructions. ~ */
  IF ~RandomNumLT(100,21)
~ THEN GOTO 63
  IF ~RandomNumGT(100,20)
~ THEN GOTO 64
END

IF ~~ THEN BEGIN 52 // from: 47.0
  SAY #32464 /* ~Very well. I will inform Goshan of your instructions. ~ */
  IF ~RandomNumLT(100,51)
~ THEN GOTO 61
  IF ~RandomNumGT(100,50)
~ THEN GOTO 62
END

IF ~~ THEN BEGIN 53 // from: 48.1
  SAY #32464 /* ~Very well. I will inform Goshan of your instructions. ~ */
  IF ~RandomNumLT(100,11)
~ THEN GOTO 59
  IF ~RandomNumGT(100,10)
~ THEN GOTO 60
END

IF ~~ THEN BEGIN 54 // from: 41.1
  SAY @110 /* ~Goshan is in the custody of the city guards at the moment. We can bribe the guards if you will put up the 2000 gold it will cost.~ */
  IF ~PartyGoldGT(1999)
~ THEN REPLY #32469 /* ~Consider it paid. He is a valuable member of the guild.~ */ DO ~TakePartyGold(2000)
~ GOTO 56
  IF ~~ THEN REPLY #32470 /* ~I cannot pay it just now. He will have to wait.~ */ GOTO 57
  IF ~~ THEN REPLY @113 /* ~No, no.  None of the above.  I'll spring Goshen myself.  I'm not afraid to get my hands dirty.~ */ GOTO 209
END

IF ~~ THEN BEGIN 55 // from: 41.2
  SAY #32466 /* ~Goshan has passed on. Unfortunate, but there is nothing to be done about it.~ */
  IF ~~ THEN GOTO 67
END

IF ~~ THEN BEGIN 56 // from: 54.0
  SAY #32467 /* ~I will have him released as soon as possible. Do you wish to assign him duties as well?~ */
  IF ~~ THEN REPLY #32471 /* ~Yes, he should be put straight back to work.~ */ DO ~SetGlobal("MilphRescue","GLOBAL",1)
~ GOTO 43
  IF ~~ THEN REPLY #32472 /* ~No, he can rest for a few days. ~ */ DO ~SetGlobal("MilphThief","GLOBAL",0)
SetGlobal("MilphRescue","GLOBAL",1)
~ GOTO 67
END

IF ~~ THEN BEGIN 57 // from: 54.1
  SAY #32468 /* ~Then he will stay in custody for now. They will be guarding him well, so bribery is the only way.~ */
  IF ~~ THEN GOTO 67
END

IF ~~ THEN BEGIN 58 // from:
  SAY #32473 /* ~Goshan is already assigned a task for this period.~ */
  IF ~~ THEN GOTO 67
END

IF ~~ THEN BEGIN 59 // from: 53.0
  SAY #32475 /* ~There is a small amount of risk in the task ahead, but bad luck can always strike. I will wish him well in his duties, and we shall see how he fares. ~ */
  IF ~~ THEN DO ~SetGlobal("MilphThief","GLOBAL",1)
SetGlobal("MilphAssigned","GLOBAL",1)
~ GOTO 67
END

IF ~~ THEN BEGIN 60 // from: 53.1
  SAY #32475 /* ~There is a small amount of risk in the task ahead, but bad luck can always strike. I will wish him well in his duties, and we shall see how he fares. ~ */
  IF ~~ THEN DO ~SetGlobal("MilphThief","GLOBAL",1)
SetGlobal("MilphAssigned","GLOBAL",1)
~ GOTO 67
END

IF ~~ THEN BEGIN 61 // from: 52.0
  SAY #32477 /* ~This is a very risky venture, but I'm sure Goshan is up to the task. Wish him luck, and we shall see how he fares.~ */
  IF ~~ THEN DO ~SetGlobal("MilphThief","GLOBAL",4)
SetGlobal("MilphAssigned","GLOBAL",1)
~ GOTO 67
END

IF ~~ THEN BEGIN 62 // from: 52.1
  SAY #32477 /* ~This is a very risky venture, but I'm sure Goshan is up to the task. Wish him luck, and we shall see how he fares.~ */
  IF ~~ THEN DO ~SetGlobal("MilphThief","GLOBAL",4)
SetGlobal("MilphAssigned","GLOBAL",1)
~ GOTO 67
END

IF ~~ THEN BEGIN 63 // from: 51.0
  SAY #32479 /* ~This should be a fairly easy series of tasks for Goshan. We shall see though. Things have gone wrong before. ~ */
  IF ~~ THEN DO ~SetGlobal("MilphThief","GLOBAL",2)
SetGlobal("MilphAssigned","GLOBAL",1)
~ GOTO 67
END

IF ~~ THEN BEGIN 64 // from: 51.1
  SAY #32479 /* ~This should be a fairly easy series of tasks for Goshan. We shall see though. Things have gone wrong before. ~ */
  IF ~~ THEN DO ~SetGlobal("MilphThief","GLOBAL",2)
SetGlobal("MilphAssigned","GLOBAL",1)
~ GOTO 67
END

IF ~~ THEN BEGIN 65 // from: 50.0
  SAY #32481 /* ~This is a reasonably difficult series of instructions for Goshan, but I'm sure it will all work out in the end. ~ */
  IF ~~ THEN DO ~SetGlobal("MilphThief","GLOBAL",3)
SetGlobal("MilphAssigned","GLOBAL",1)
~ GOTO 67
END

IF ~~ THEN BEGIN 66 // from: 50.1
  SAY #32481 /* ~This is a reasonably difficult series of instructions for Goshan, but I'm sure it will all work out in the end. ~ */
  IF ~~ THEN DO ~SetGlobal("MilphThief","GLOBAL",3)
SetGlobal("MilphAssigned","GLOBAL",1)
~ GOTO 67
END

IF ~~ THEN BEGIN 67 // from: 209.0 66.0 65.0 64.0 63.0 62.0 61.0 60.0 59.0 58.0 57.0 56.1 55.0 42.2 42.1
  SAY #32482 /* ~The next of your guild thieves is Kretor. He has a stable of pickpockets below him, and he makes sure that the purses of pedestians are none too safe.~ */
  IF ~GlobalLT("KretorThief","GLOBAL",5)
!Dead("Kretor")
~ THEN REPLY #34786 /* ~And this Kretor is ready to accept my commands?~ */ GOTO 68
  IF ~Global("KretorThief","GLOBAL",5)
!Dead("Kretor")
~ THEN REPLY #34786 /* ~And this Kretor is ready to accept my commands?~ */ GOTO 80
  IF ~Dead("Kretor")
~ THEN REPLY #34786 /* ~And this Kretor is ready to accept my commands?~ */ GOTO 81
  IF ~~ THEN REPLY #32487 /* ~Everyone else is fine the way they currently are.~ */ GOTO 14
  IF ~Global("KretorThief","GLOBAL",9)
!Dead("Kretor")
~ THEN REPLY #34786 /* ~And this Kretor is ready to accept my commands?~ */ GOTO 197
END

IF ~~ THEN BEGIN 68 // from: 67.0
  SAY #32488 /* ~Kretor awaits your words as we speak.~ */
  IF ~~ THEN REPLY #32493 /* ~Then I shall detail what is needed of him.~ */ GOTO 69
  IF ~~ THEN REPLY #32494 /* ~I'm sure he is fine as he is. Move to the next in my service.~ */ GOTO 93
  IF ~~ THEN REPLY #32495 /* ~I want him to do nothing. I want none of his cutpurses on the street.~ */ DO ~SetGlobal("KretorThief","GLOBAL",0)
~ GOTO 93
END

IF ~~ THEN BEGIN 69 // from: 82.0 68.0
  SAY #32489 /* ~Very well. How rough should he be with his victims? Should he try to cut a purse and sneak away, or should they actively mug the odd commoner?~ */
  IF ~~ THEN REPLY #32496 /* ~I want as much gold as he can muster. Tell him not to spare the blackjack.~ */ GOTO 70
  IF ~~ THEN REPLY #32497 /* ~I don't want people seriously hurt. Tell him to stick to lifting purses.~ */ GOTO 71
END

IF ~~ THEN BEGIN 70 // from: 69.0
  SAY #32490 /* ~Alright. Should he stick to the taverns and inns where his victims will be intoxicated, or should he scout the upscale areas, such as the government district?~ */
  IF ~~ THEN REPLY #32500 /* ~The taverns will be fine. Most will never miss their drinking money.~ */ GOTO 72
  IF ~~ THEN REPLY #32501 /* ~Go straight for the rich areas. I don't want peasant money. ~ */ GOTO 73
END

IF ~~ THEN BEGIN 71 // from: 69.1
  SAY #32491 /* ~As you wish. Should he stick to the taverns and inns where his victims will likely be intoxicated, or scout the upscale areas, such as the government district?~ */
  IF ~~ THEN REPLY #32502 /* ~Stay amongst the revelling crouds. They will not notice a thief as easily.~ */ GOTO 74
  IF ~~ THEN REPLY #32503 /* ~The risk is worth going to the rich areas. Have him avoid commoners.~ */ GOTO 75
END

IF ~~ THEN BEGIN 72 // from: 70.0
  SAY #32492 /* ~Very well. One last thing; Should he bribe the owners of the establishments he works out of. It is always good if the witnessess are sympathetic to the accused.~ */
  IF ~~ THEN REPLY #32505 /* ~Save the money and just be careful.~ */ GOTO 76
  IF ~~ THEN REPLY #32506 /* ~By all means. Buying silence is a fine investment.~ */ GOTO 77
END

IF ~~ THEN BEGIN 73 // from: 70.1
  SAY #32498 /* ~This is risky, indeed!  Will you bribe the owners of the places he works out of? It is safer if they are sympathetic, but if you are concerned about the gold...~ */
  IF ~~ THEN REPLY #32507 /* ~All gold will come back here. There will be none for outsiders.~ */ GOTO 78
  IF ~~ THEN REPLY #32508 /* ~Silence is golden, and I don't mind paying for it.~ */ GOTO 76
END

IF ~~ THEN BEGIN 74 // from: 71.0
  SAY #32499 /* ~Since you are playing it safe, I imagine you will wish Kretor to bribe the owners of the taverns he works out of. It costs a few coins, but it can buy silence.~ */
  IF ~~ THEN REPLY #32509 /* ~Tell him to save the money and just try not to get caught.~ */ GOTO 77
  IF ~~ THEN REPLY #32510 /* ~Yes. I want as little risk as possible. Pay the gold.~ */ GOTO 79
END

IF ~~ THEN BEGIN 75 // from: 71.1
  SAY #32504 /* ~One last thing: It is customary to bribe the owner of the establishment you work around. Should he pay for silence, or just try not to get noticed?~ */
  IF ~~ THEN REPLY #32511 /* ~Tell him not to bribe anyone. The gold should come back to the guild.~ */ GOTO 76
  IF ~~ THEN REPLY #32512 /* ~He should pay. I don't want to invite trouble by not doing it.~ */ GOTO 77
END

IF ~~ THEN BEGIN 76 // from: 75.0 73.1 72.0
  SAY #32516 /* ~I will tell Kretor of all you have decided.~ */
  IF ~RandomNumLT(100,36)
~ THEN GOTO 91
  IF ~RandomNumGT(100,35)
~ THEN GOTO 92
END

IF ~~ THEN BEGIN 77 // from: 75.1 74.0 72.1
  SAY #32516 /* ~I will tell Kretor of all you have decided.~ */
  IF ~RandomNumLT(100,21)
~ THEN GOTO 89
  IF ~RandomNumGT(100,20)
~ THEN GOTO 90
END

IF ~~ THEN BEGIN 78 // from: 73.0
  SAY #32516 /* ~I will tell Kretor of all you have decided.~ */
  IF ~RandomNumLT(100,51)
~ THEN GOTO 87
  IF ~RandomNumGT(100,50)
~ THEN GOTO 88
END

IF ~~ THEN BEGIN 79 // from: 74.1
  SAY #32516 /* ~I will tell Kretor of all you have decided.~ */
  IF ~RandomNumLT(100,11)
~ THEN GOTO 85
  IF ~RandomNumGT(100,10)
~ THEN GOTO 86
END

IF ~~ THEN BEGIN 80 // from: 67.1
  SAY @163 /* ~Kretor has been arrested and is being held out of our reach. It will cost 500 gold to have him released. This is a reasonable bribe. Will you pay the gold?~ */
  IF ~PartyGoldGT(499)
~ THEN REPLY #32521 /* ~I will pay. His business is humble, but it is valuable to the guild.~ */ DO ~TakePartyGold(500)
~ GOTO 82
  IF ~~ THEN REPLY #32522 /* ~He will have to wait. ~ */ GOTO 83
  IF ~~ THEN REPLY @166 /* ~Absolutely not!  I've yet to see a jail that can keep me in or out!  Kretor will be free in no time.~ */ GOTO 208
END

IF ~~ THEN BEGIN 81 // from: 67.2
  SAY #32518 /* ~Kretor is dead. There is nothing to be done about it.~ */
  IF ~~ THEN GOTO 93
END

IF ~~ THEN BEGIN 82 // from: 80.0
  SAY #32519 /* ~I will effect his release then. Do you wish to assign him duties now, or will you wait? ~ */
  IF ~~ THEN REPLY #32523 /* ~I will assign them now. He will have to earn back his ransom.~ */ DO ~SetGlobal("KretorRescue","GLOBAL",1)
~ GOTO 69
  IF ~~ THEN REPLY #32524 /* ~No, I will give him time to rest for now.~ */ DO ~SetGlobal("KretorThief","GLOBAL",0)
SetGlobal("KretorRescue","GLOBAL",1)
~ GOTO 93
END

IF ~~ THEN BEGIN 83 // from: 80.1
  SAY #32520 /* ~Then he will stay in prison, in the company of guttertrash and thugfists.~ */
  IF ~~ THEN GOTO 93
END

IF ~~ THEN BEGIN 84 // from:
  SAY #32525 /* ~Kretor is already assigned a task for this period.~ */
  IF ~~ THEN GOTO 93
END

IF ~~ THEN BEGIN 85 // from: 79.0
  SAY #32527 /* ~The guidlines you have set mean an easy time for Kretor, though it is never certain how things will come to an end. ~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",1)
SetGlobal("KretorAssigned","GLOBAL",1)
~ GOTO 93
END

IF ~~ THEN BEGIN 86 // from: 79.1
  SAY #32527 /* ~The guidlines you have set mean an easy time for Kretor, though it is never certain how things will come to an end. ~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",1)
SetGlobal("KretorAssigned","GLOBAL",1)
~ GOTO 93
END

IF ~~ THEN BEGIN 87 // from: 78.0
  SAY #32529 /* ~Your tasks mean a rough few days ahead for Kretor. I'm sure he can manage, but it will be difficult. ~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",4)
SetGlobal("KretorAssigned","GLOBAL",1)
~ GOTO 93
END

IF ~~ THEN BEGIN 88 // from: 78.1
  SAY #32529 /* ~Your tasks mean a rough few days ahead for Kretor. I'm sure he can manage, but it will be difficult. ~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",4)
SetGlobal("KretorAssigned","GLOBAL",1)
~ GOTO 93
END

IF ~~ THEN BEGIN 89 // from: 77.0
  SAY #32531 /* ~Things should go well. What you have outlined is not too difficult. We shall see though. ~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",2)
SetGlobal("KretorAssigned","GLOBAL",1)
~ GOTO 93
END

IF ~~ THEN BEGIN 90 // from: 77.1
  SAY #32531 /* ~Things should go well. What you have outlined is not too difficult. We shall see though. ~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",2)
SetGlobal("KretorAssigned","GLOBAL",1)
~ GOTO 93
END

IF ~~ THEN BEGIN 91 // from: 76.0
  SAY #32533 /* ~The next few days may be a little difficult with what you have ordered. I'm sure it will turn out for the best though. ~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",3)
SetGlobal("KretorAssigned","GLOBAL",1)
~ GOTO 93
END

IF ~~ THEN BEGIN 92 // from: 76.1
  SAY #32533 /* ~The next few days may be a little difficult with what you have ordered. I'm sure it will turn out for the best though. ~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",3)
SetGlobal("KretorAssigned","GLOBAL",1)
~ GOTO 93
END

IF ~~ THEN BEGIN 93 // from: 208.0 198.0 197.0 92.0 91.0 90.0 89.0 88.0 87.0 86.0 85.0 84.0 83.0 82.1 81.0 68.2 68.1
  SAY #32534 /* ~The next rogue in your employ is Morsa, and she has a gift for bringing contraband goods into the city.~ */
  IF ~GlobalLT("MorsaThief","GLOBAL",5)
!Dead("Morsa")
~ THEN REPLY #32537 /* ~A smuggler, eh? Is she currently active?~ */ GOTO 94
  IF ~Global("MorsaThief","GLOBAL",5)
!Dead("Morsa")
~ THEN REPLY #32537 /* ~A smuggler, eh? Is she currently active?~ */ GOTO 106
  IF ~Dead("Morsa")
~ THEN REPLY #32537 /* ~A smuggler, eh? Is she currently active?~ */ GOTO 107
  IF ~~ THEN REPLY #32539 /* ~That's enough. Everyone else can stay as they are.~ */ GOTO 14
END

IF ~~ THEN BEGIN 94 // from: 93.0
  SAY #32540 /* ~Morsa is more than ready to serve. Shall you change how she does her tasks?~ */
  IF ~~ THEN REPLY #32541 /* ~Yes, I want to take an active hand in this.~ */ GOTO 95
  IF ~~ THEN REPLY #32542 /* ~I'm sure she knows her business. Leave her as is.~ */ GOTO 119
  IF ~~ THEN REPLY #32543 /* ~I want her to stop. I want no smuggled goods brought into the city.~ */ DO ~SetGlobal("MorsaThief","GLOBAL",0)
~ GOTO 119
END

IF ~~ THEN BEGIN 95 // from: 108.0 94.0
  SAY #32544 /* ~Very well. Morsa prefers to bring in small amounts of items for individuals, as they are harder to detect. But she can bring in large shipments for guilds.  ~ */
  IF ~~ THEN REPLY #32545 /* ~Volume, volume, volume. Have her transport as much as possible.~ */ GOTO 96
  IF ~~ THEN REPLY #32546 /* ~Tell her to stick to what she feels is best. Small amounts are fine.~ */ GOTO 97
END

IF ~~ THEN BEGIN 96 // from: 95.0
  SAY #32547 /* ~Now to contents. She prefers benign substances, but she can get dangerous spell components for mages. These are harder to transport, but they pay higher. ~ */
  IF ~~ THEN REPLY #32549 /* ~Tell her to avoid dangerous goods. They are not worth the trouble.~ */ GOTO 98
  IF ~~ THEN REPLY #32550 /* ~The profits are worth it to risk the dangerous substances.~ */ GOTO 99
END

IF ~~ THEN BEGIN 97 // from: 95.1
  SAY #32548 /* ~She tries to stick to jewels and the like, but she can also bring in dangerous goods for mages and other deviants. ~ */
  IF ~~ THEN REPLY #32551 /* ~I want her to stay away from the dangerous goods.~ */ GOTO 100
  IF ~~ THEN REPLY #32552 /* ~She should bring in whatever is more profitable. The safe stuff is not worth it.~ */ GOTO 101
END

IF ~~ THEN BEGIN 98 // from: 96.0
  SAY #32553 /* ~Very well. Now, I must ask. She does not like it, but there is good money in smuggling slaves. Should she dabble in this as well?~ */
  IF ~~ THEN REPLY #32557 /* ~She would just be the transport, so I see no harm.~ */ DO ~ReputationInc(-1)
SetGlobal("TSPCIsSlaver","GLOBAL",1)
~ GOTO 102
  IF ~~ THEN REPLY #32558 /* ~Absolutely not. I won't have it.~ */ DO ~SetGlobal("TSPCIsSlaver","GLOBAL",0)
~ GOTO 103
END

IF ~~ THEN BEGIN 99 // from: 96.1
  SAY #32554 /* ~Since you are being risky anyway, I should tell you that there is a lot of money to be made in smuggling slaves. The dangers are high though.~ */
  IF ~~ THEN REPLY #32559 /* ~The gold will ease any pangs of guilt I feel. Have her do it.~ */ DO ~ReputationInc(-1)
SetGlobal("TSPCIsSlaver","GLOBAL",1)
~ GOTO 104
  IF ~~ THEN REPLY #32560 /* ~I will have no such thing in my guild.~ */ DO ~SetGlobal("TSPCIsSlaver","GLOBAL",0)
~ GOTO 102
END

IF ~~ THEN BEGIN 100 // from: 97.0
  SAY #32555 /* ~You're playing it safe, but I should ask anyway. There is money to be made in smuggling slaves. Should Morsa dabble in this?~ */
  IF ~~ THEN REPLY #32561 /* ~By all means. She will just be a gobetween, so I see nothing wrong.~ */ DO ~ReputationInc(-1)
SetGlobal("TSPCIsSlaver","GLOBAL",1)
~ GOTO 103
  IF ~~ THEN REPLY #32562 /* ~I will not have such a thing in my guild. I forbid it.~ */ DO ~SetGlobal("TSPCIsSlaver","GLOBAL",0)
~ GOTO 105
END

IF ~~ THEN BEGIN 101 // from: 97.1
  SAY #32556 /* ~There is something else to consider. There is good money in smuggling slaves. Should Morsa dabble in this as well?~ */
  IF ~~ THEN REPLY #32563 /* ~Certainly. If not us, then someone else. We might as well profit.~ */ DO ~ReputationInc(-1)
SetGlobal("TSPCIsSlaver","GLOBAL",1)
~ GOTO 102
  IF ~~ THEN REPLY #32564 /* ~No, I will not allow it. I will not have the guild associated with slave trading.~ */ DO ~SetGlobal("TSPCIsSlaver","GLOBAL",0)
~ GOTO 103
END

IF ~~ THEN BEGIN 102 // from: 101.0 99.1 98.0
  SAY #32568 /* ~I will inform Morsa of your decisions. ~ */
  IF ~RandomNumLT(100,36)
~ THEN GOTO 117
  IF ~RandomNumGT(100,35)
~ THEN GOTO 118
END

IF ~~ THEN BEGIN 103 // from: 101.1 100.0 98.1
  SAY #32568 /* ~I will inform Morsa of your decisions. ~ */
  IF ~RandomNumLT(100,21)
~ THEN GOTO 115
  IF ~RandomNumGT(100,20)
~ THEN GOTO 116
END

IF ~~ THEN BEGIN 104 // from: 99.0
  SAY #32568 /* ~I will inform Morsa of your decisions. ~ */
  IF ~RandomNumLT(100,51)
~ THEN GOTO 113
  IF ~RandomNumGT(100,50)
~ THEN GOTO 114
END

IF ~~ THEN BEGIN 105 // from: 100.1
  SAY #32568 /* ~I will inform Morsa of your decisions. ~ */
  IF ~RandomNumLT(100,11)
~ THEN GOTO 111
  IF ~RandomNumGT(100,10)
~ THEN GOTO 112
END

IF ~~ THEN BEGIN 106 // from: 93.1
  SAY @215 /* ~Morsa is in the hands of the guards. Smugglers are not well liked, and it will cost 2500 gold to bribe her out. Do you have the coin to pay?~ */
  IF ~PartyGoldGT(2499)
~ THEN REPLY #32575 /* ~I will pay. She will be free as soon as possible.~ */ DO ~TakePartyGold(2500)
~ GOTO 108
  IF ~~ THEN REPLY #32576 /* ~She will have to wait. ~ */ GOTO 109
  IF ~~ THEN REPLY @218 /* ~Don't you know me better than that, by now?  I'll take care of this myself.  Morsa will be walking free before you can say 'Jailbreak'.~ */ GOTO 207
END

IF ~~ THEN BEGIN 107 // from: 93.2
  SAY #32570 /* ~Morsa is dead. It is a great loss, and there is nothing to be done about it. ~ */
  IF ~~ THEN GOTO 119
END

IF ~~ THEN BEGIN 108 // from: 106.0
  SAY #32571 /* ~I will see to it that she is released before the day is out. Will you want her to return to her duties immediately?~ */
  IF ~~ THEN REPLY #32573 /* ~Yes, I must recoup these losses quickly.~ */ DO ~SetGlobal("MorsaRescue","GLOBAL",1)
~ GOTO 95
  IF ~~ THEN REPLY #32574 /* ~No, let her rest a while.~ */ DO ~SetGlobal("MorsaThief","GLOBAL",0)
SetGlobal("MorsaRescue","GLOBAL",1)
~ GOTO 119
END

IF ~~ THEN BEGIN 109 // from: 106.1
  SAY #32572 /* ~Then she will stay there until the money is available.~ */
  IF ~~ THEN GOTO 119
END

IF ~~ THEN BEGIN 110 // from:
  SAY #32577 /* ~Morsa is already assigned a task.~ */
  IF ~~ THEN GOTO 119
END

IF ~~ THEN BEGIN 111 // from: 105.0
  SAY #32579 /* ~The conditions you have given will not be difficult to fulfill. I hope Morsa does not get complacent.~ */
  IF ~~ THEN DO ~SetGlobal("MorsaThief","GLOBAL",1)
SetGlobal("MorsaAssigned","GLOBAL",1)
~ GOTO 119
END

IF ~~ THEN BEGIN 112 // from: 105.1
  SAY #32579 /* ~The conditions you have given will not be difficult to fulfill. I hope Morsa does not get complacent.~ */
  IF ~~ THEN DO ~SetGlobal("MorsaThief","GLOBAL",1)
SetGlobal("MorsaAssigned","GLOBAL",1)
~ GOTO 119
END

IF ~~ THEN BEGIN 113 // from: 104.0
  SAY #32581 /* ~The conditions you have set will be extremely dangerous for Morsa. I'm sure she can handle it, but I'll wager it will be difficult. ~ */
  IF ~~ THEN DO ~SetGlobal("MorsaThief","GLOBAL",4)
SetGlobal("MorsaAssigned","GLOBAL",1)
~ GOTO 119
END

IF ~~ THEN BEGIN 114 // from: 104.1
  SAY #32581 /* ~The conditions you have set will be extremely dangerous for Morsa. I'm sure she can handle it, but I'll wager it will be difficult. ~ */
  IF ~~ THEN DO ~SetGlobal("MorsaThief","GLOBAL",4)
SetGlobal("MorsaAssigned","GLOBAL",1)
~ GOTO 119
END

IF ~~ THEN BEGIN 115 // from: 103.0
  SAY #32583 /* ~The conditions you have set should be fairly reasonable to achieve. Everything should be fine, though who can be sure?~ */
  IF ~~ THEN DO ~SetGlobal("MorsaThief","GLOBAL",3)
SetGlobal("MorsaAssigned","GLOBAL",1)
~ GOTO 119
END

IF ~~ THEN BEGIN 116 // from: 103.1
  SAY #32583 /* ~The conditions you have set should be fairly reasonable to achieve. Everything should be fine, though who can be sure?~ */
  IF ~~ THEN DO ~SetGlobal("MorsaThief","GLOBAL",2)
SetGlobal("MorsaAssigned","GLOBAL",1)
~ GOTO 119
END

IF ~~ THEN BEGIN 117 // from: 102.0
  SAY #32585 /* ~This may be a difficult time for Morsa, but I think she can handle it. I hope all goes well.~ */
  IF ~~ THEN DO ~SetGlobal("MorsaThief","GLOBAL",3)
SetGlobal("MorsaAssigned","GLOBAL",1)
~ GOTO 119
END

IF ~~ THEN BEGIN 118 // from: 102.1
  SAY #32585 /* ~This may be a difficult time for Morsa, but I think she can handle it. I hope all goes well.~ */
  IF ~~ THEN DO ~SetGlobal("MorsaThief","GLOBAL",3)
SetGlobal("MorsaAssigned","GLOBAL",1)
~ GOTO 119
END

IF ~~ THEN BEGIN 119 // from: 207.0 118.0 117.0 116.0 115.0 114.0 113.0 112.0 111.0 110.0 109.0 108.1 107.0 94.2 94.1
  SAY #32586 /* ~You have one more rogue.  Varia's preferred activity is providing 'protection,' and keeping embarrasing facts about powerful people  safe... for a fee.~ */
  IF ~GlobalLT("VariaThief","GLOBAL",5)
!Dead("Varia")
~ THEN REPLY #32593 /* ~Protection rackets and blackmail, eh? Is she ready for orders?~ */ GOTO 120
  IF ~Global("VariaThief","GLOBAL",5)
!Dead("Varia")
~ THEN REPLY #32593 /* ~Protection rackets and blackmail, eh? Is she ready for orders?~ */ GOTO 132
  IF ~Dead("Varia")
~ THEN REPLY #32593 /* ~Protection rackets and blackmail, eh? Is she ready for orders?~ */ GOTO 133
  IF ~~ THEN REPLY #32595 /* ~I'm sure she's fine. I'll leave her the way she is.~ */ GOTO 14
END

IF ~~ THEN BEGIN 120 // from: 119.0
  SAY #32599 /* ~Varia is ready to take orders. She will do as you bid.~ */
  IF ~~ THEN REPLY #32600 /* ~Good. I want to take as direct a hand in this as I can.~ */ GOTO 121
  IF ~~ THEN REPLY #32601 /* ~I'll just have her stay as she is. She knows her business, I am sure. ~ */ GOTO 14
  IF ~~ THEN REPLY #32602 /* ~Then have her cease all activities for the next little while.~ */ DO ~SetGlobal("VariaThief","GLOBAL",0)
~ GOTO 14
END

IF ~~ THEN BEGIN 121 // from: 134.0 120.0
  SAY #32605 /* ~Very well.  She prefers to offer 'protection' to the merchants of the outlying towns, such as Trademeet. Less profitable, but the guards are less effective.~ */
  IF ~~ THEN REPLY #32607 /* ~Tell her to work here in Athkatla. The merchants here can pay more.~ */ GOTO 122
  IF ~~ THEN REPLY #32608 /* ~A wise policy. Have her continue.~ */ GOTO 123
END

IF ~~ THEN BEGIN 122 // from: 121.0
  SAY #32609 /* ~As you wish. How forceful should she be? She gets less coin if she is lenient, but the victims are less likely to call the authorities.~ */
  IF ~~ THEN REPLY #32613 /* ~No need for anyone to get hurt. Keep her negotiations civil.~ */ GOTO 124
  IF ~~ THEN REPLY #32614 /* ~If people refuse to pay, they should suffer for it. It will encourage others.~ */ GOTO 125
END

IF ~~ THEN BEGIN 123 // from: 121.1
  SAY #32610 /* ~Very well. Should she use force to encourage payment? Threats lose their sting eventually, but harming people results in higher guard activity.~ */
  IF ~~ THEN REPLY #32615 /* ~People don't need to get hurt in these deals. ~ */ GOTO 126
  IF ~~ THEN REPLY #32616 /* ~If people do not pay, we must backup our threats with force.~ */ GOTO 127
END

IF ~~ THEN BEGIN 124 // from: 122.0
  SAY #32623 /* ~It will be so.  In her blackmail endeavors she usually sticks to minor government officials. Their secrets are not worth as much, but they pay more readily.~ */
  IF ~~ THEN REPLY #32627 /* ~Tell her to focus efforts on higher level officials. The coin is worth the risk.~ */ GOTO 128
  IF ~~ THEN REPLY #32628 /* ~Tell her to concentrate on the lower level officials for now.~ */ GOTO 129
END

IF ~~ THEN BEGIN 125 // from: 122.1
  SAY #32624 /* ~All right. Now, in her blackmail endeavors she usually sticks to minor government officials. Their secrets are not worth as much, but they pay more readily.~ */
  IF ~~ THEN REPLY #32629 /* ~Go for the higher level officials! There is no gain without risk!~ */ GOTO 130
  IF ~~ THEN REPLY #32630 /* ~Stay to the lesser officials in government. We don't need powerful enemies.~ */ GOTO 128
END

IF ~~ THEN BEGIN 126 // from: 123.0
  SAY #32625 /* ~Since you are playing it safe, will you want her to blackmail lesser government officials?  Their secrets are not worth as much, but they pay more readily.~ */
  IF ~~ THEN REPLY #32631 /* ~I think she should approach the upper level targets. It is worth the risk.~ */ GOTO 129
  IF ~~ THEN REPLY #32632 /* ~Yes, stay with the lower level targets. No need to make powerful enemies.~ */ GOTO 131
END

IF ~~ THEN BEGIN 127 // from: 123.1
  SAY #32626 /* ~And should she confine her blackmail to lesser government officials? Their secrets are not worth as much, but they pay more readily.~ */
  IF ~~ THEN REPLY #32633 /* ~No, try for the upper level officials. It's worth the risk.~ */ GOTO 128
  IF ~~ THEN REPLY #32634 /* ~Stay with the intermediate officials. No need to anger powerful enemies.~ */ GOTO 129
END

IF ~~ THEN BEGIN 128 // from: 127.0 125.1 124.0
  SAY #32646 /* ~I will inform Varia of your directions. ~ */
  IF ~RandomNumLT(100,36)
~ THEN GOTO 143
  IF ~RandomNumGT(100,35)
~ THEN GOTO 144
END

IF ~~ THEN BEGIN 129 // from: 127.1 126.0 124.1
  SAY #32646 /* ~I will inform Varia of your directions. ~ */
  IF ~RandomNumLT(100,21)
~ THEN GOTO 141
  IF ~RandomNumGT(100,20)
~ THEN GOTO 142
END

IF ~~ THEN BEGIN 130 // from: 125.0
  SAY #32646 /* ~I will inform Varia of your directions. ~ */
  IF ~RandomNumLT(100,51)
~ THEN GOTO 139
  IF ~RandomNumGT(100,50)
~ THEN GOTO 140
END

IF ~~ THEN BEGIN 131 // from: 126.1
  SAY #32646 /* ~I will inform Varia of your directions. ~ */
  IF ~RandomNumLT(100,11)
~ THEN GOTO 137
  IF ~RandomNumGT(100,10)
~ THEN GOTO 138
END

IF ~~ THEN BEGIN 132 // from: 119.1
  SAY @267 /* ~Varia is incarcerated. Seems she angered the wrong member of government. I estimate it will require a 3000 gold bribe to free her. Will you pay it?~ */
  IF ~PartyGoldGT(2999)
~ THEN REPLY #32655 /* ~I will pay. I wouldn't want her on my bad side.~ */ DO ~TakePartyGold(3000)
~ GOTO 134
  IF ~~ THEN REPLY #32656 /* ~I will not pay just yet. She will have to wait.~ */ GOTO 135
  IF ~~ THEN REPLY @270 /* ~Don't fret your pointy little head about it Jariel.  I'll set Varia free.~ */ GOTO 206
END

IF ~~ THEN BEGIN 133 // from: 119.2
  SAY #32651 /* ~Varia is dead. There is nothing to do but move on. ~ */
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 134 // from: 132.0
  SAY #32652 /* ~I will make sure she is free before day's end. Do you wish to assign her a task now?~ */
  IF ~~ THEN REPLY #32659 /* ~Yes, she needs to earn back this bribe money.~ */ DO ~SetGlobal("VariaRescue","GLOBAL",1)
~ GOTO 121
  IF ~~ THEN REPLY #32660 /* ~No, she may rest for now.~ */ DO ~SetGlobal("VariaThief","GLOBAL",0)
SetGlobal("VariaRescue","GLOBAL",1)
~ GOTO 14
END

IF ~~ THEN BEGIN 135 // from: 132.1
  SAY #32653 /* ~Then she will remain in custody until you say otherwise.~ */
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 136 // from:
  SAY #32666 /* ~Varia is already assigned a task for this period.~ */
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 137 // from: 131.0
  SAY #32668 /* ~The conditions you have set forth for Varia are pretty easy to meet, though nothing is ever certain. I am sure it will turn out well though.~ */
  IF ~~ THEN DO ~SetGlobal("VariaThief","GLOBAL",1)
SetGlobal("VariaAssigned","GLOBAL",1)
~ GOTO 14
END

IF ~~ THEN BEGIN 138 // from: 131.1
  SAY #32668 /* ~The conditions you have set forth for Varia are pretty easy to meet, though nothing is ever certain. I am sure it will turn out well though.~ */
  IF ~~ THEN DO ~SetGlobal("VariaThief","GLOBAL",1)
SetGlobal("VariaAssigned","GLOBAL",1)
~ GOTO 14
END

IF ~~ THEN BEGIN 139 // from: 130.0
  SAY #32670 /* ~These are sure to be difficult conditions for her to meet, though she has always been up to the task before. I'm sure it will all work out for the best.~ */
  IF ~~ THEN DO ~SetGlobal("VariaThief","GLOBAL",4)
SetGlobal("VariaAssigned","GLOBAL",1)
~ GOTO 14
END

IF ~~ THEN BEGIN 140 // from: 130.1
  SAY #32670 /* ~These are sure to be difficult conditions for her to meet, though she has always been up to the task before. I'm sure it will all work out for the best.~ */
  IF ~~ THEN DO ~SetGlobal("VariaThief","GLOBAL",4)
SetGlobal("VariaAssigned","GLOBAL",1)
~ GOTO 14
END

IF ~~ THEN BEGIN 141 // from: 129.0
  SAY #32672 /* ~She should find these conditions relatively easy to meet. I am sure everything will turn out for the best. ~ */
  IF ~~ THEN DO ~SetGlobal("VariaThief","GLOBAL",2)
SetGlobal("VariaAssigned","GLOBAL",1)
~ GOTO 14
END

IF ~~ THEN BEGIN 142 // from: 129.1
  SAY #32672 /* ~She should find these conditions relatively easy to meet. I am sure everything will turn out for the best. ~ */
  IF ~~ THEN DO ~SetGlobal("VariaThief","GLOBAL",2)
SetGlobal("VariaAssigned","GLOBAL",1)
~ GOTO 14
END

IF ~~ THEN BEGIN 143 // from: 128.0
  SAY #32673 /* ~This will be a relatively difficult set of
circumstance for her to overcome. I'm sure she'll be up to the task though. ~ */
  IF ~~ THEN DO ~SetGlobal("VariaThief","GLOBAL",3)
SetGlobal("VariaAssigned","GLOBAL",1)
~ GOTO 14
END

IF ~~ THEN BEGIN 144 // from: 128.1
  SAY #32673 /* ~This will be a relatively difficult set of
circumstance for her to overcome. I'm sure she'll be up to the task though. ~ */
  IF ~~ THEN DO ~SetGlobal("VariaThief","GLOBAL",3)
SetGlobal("VariaAssigned","GLOBAL",1)
~ GOTO 14
END

IF ~GlobalTimerExpired("PGThievesReturn","GLOBAL")
~ THEN BEGIN 145 // from:
  SAY #32690 /* ~It is time to see how your thieves functioned with their last set of instructions. I'll begin with Hanz.~ [JARIEL07] */
  IF ~Global("HanzThief","GLOBAL",1)
!Dead("Hanz")
~ THEN GOTO 146
  IF ~Global("HanzThief","GLOBAL",2)
!Dead("Hanz")
~ THEN GOTO 147
  IF ~Global("HanzThief","GLOBAL",3)
!Dead("Hanz")
~ THEN GOTO 148
  IF ~Global("HanzThief","GLOBAL",4)
!Dead("Hanz")
~ THEN GOTO 149
  IF ~Global("HanzThief","GLOBAL",5)
!Dead("Hanz")
~ THEN GOTO 150
  IF ~Dead("Hanz")
~ THEN GOTO 153
  IF ~Global("HanzThief","GLOBAL",0)
!Dead("Hanz")
~ THEN GOTO 154
END

IF ~~ THEN BEGIN 146 // from: 145.0
  SAY #32692 /* ~Hanz did reasonably well. He did not have much of a challenge, but a meager profit is ample reward for low risk.~ */
  IF ~~ THEN DO ~GiveGoldForce(200)
~ GOTO 155
END

IF ~~ THEN BEGIN 147 // from: 145.1
  SAY #32693 /* ~Hanz has returned a nice profit, after his sources and men have been paid. Not the most dangerous set of tasks, but they yielded a fine amount of coin.~ */
  IF ~~ THEN DO ~GiveGoldForce(400)
~ GOTO 155
END

IF ~~ THEN BEGIN 148 // from: 145.2
  SAY #32695 /* ~Hanz has returned with a nice profit. His task was dangerous, but his skill has brought him through unscathed. ~ */
  IF ~~ THEN DO ~GiveGoldForce(600)
~ GOTO 155
END

IF ~~ THEN BEGIN 149 // from: 145.3
  SAY #32696 /* ~It was amazing that he returned at all, but Hanz has pulled through. His task was very difficult, and he has an appropriate amount of coin to show for it.~ */
  IF ~~ THEN DO ~GiveGoldForce(900)
~ GOTO 155
END

IF ~~ THEN BEGIN 150 // from: 145.4
  SAY @58 /* ~Unfortunately, Hanz is currently in the hands of the guards. Will you authorize his release? We can bribe the city officials if you put up the 1000 gold.~ */
  IF ~PartyGoldGT(999)
~ THEN REPLY #32702 /* ~Yes, I will not have him stuck behind bars.~ */ DO ~TakePartyGold(1000)
~ GOTO 151
  IF ~~ THEN REPLY #32759 /* ~No, he will have to wait.~ */ GOTO 152
  IF ~~ THEN REPLY @61 /* ~Pay a bribe?  Never!  I'll break Hanz out of jail myself.~ */ GOTO 205
END

IF ~~ THEN BEGIN 151 // from: 150.0
  SAY #32744 /* ~Very well, I will have him released as soon as possible. You will have to reassign him his tasks when I am done reporting on the others. ~ */
  IF ~~ THEN DO ~SetGlobal("HanzThief","GLOBAL",0)
SetGlobal("HanzRescue","GLOBAL",1)
~ GOTO 155
END

IF ~~ THEN BEGIN 152 // from: 150.1
  SAY #32704 /* ~Then Hanz will remain out of our reach until the bribe is paid.~ */
  IF ~~ THEN GOTO 155
END

IF ~~ THEN BEGIN 153 // from: 145.5
  SAY #32705 /* ~Hanz is unfortunately dead. Nothing to be done about that.~ */
  IF ~~ THEN GOTO 155
END

IF ~~ THEN BEGIN 154 // from: 145.6
  SAY #32707 /* ~Hanz was not assigned a set of instructions, so he has nothing to show for this past period. You can modify his itinerary after I finish reporting on the others.~ */
  IF ~~ THEN GOTO 155
END

IF ~~ THEN BEGIN 155 // from: 205.0 154.0 153.0 152.0 151.0 149.0 148.0 147.0 146.0
  SAY #32708 /* ~Let's check on how Goshan did under your instruction. ~ */
  IF ~Global("MilphThief","GLOBAL",1)
!Dead("Milph")
~ THEN GOTO 156
  IF ~Global("MilphThief","GLOBAL",2)
!Dead("Milph")
~ THEN GOTO 157
  IF ~Global("MilphThief","GLOBAL",3)
!Dead("Milph")
~ THEN GOTO 158
  IF ~Global("MilphThief","GLOBAL",4)
!Dead("Milph")
~ THEN GOTO 159
  IF ~Global("MilphThief","GLOBAL",5)
!Dead("Milph")
~ THEN GOTO 160
  IF ~Dead("Milph")
~ THEN GOTO 163
  IF ~Global("MilphThief","GLOBAL",0)
!Dead("Milph")
~ THEN GOTO 164
END

IF ~~ THEN BEGIN 156 // from: 155.0
  SAY #32719 /* ~Goshan has returned with a small profit. There was not much risk involved at all, so he has brought an appropriate amount as a reward.~ */
  IF ~~ THEN DO ~GiveGoldForce(200)
~ GOTO 165
END

IF ~~ THEN BEGIN 157 // from: 155.1
  SAY #32720 /* ~Goshan has made a fair profit for the low risk instructions you gave him. Of course, he has had to pay contacts and the like.~ */
  IF ~~ THEN DO ~GiveGoldForce(300)
~ GOTO 165
END

IF ~~ THEN BEGIN 158 // from: 155.2
  SAY #32721 /* ~Goshan is back with a fine profit, escaping all dangers unscathed. He is quite skilled, I'm sure you will agree.~ */
  IF ~~ THEN DO ~GiveGoldForce(500)
~ GOTO 165
END

IF ~~ THEN BEGIN 159 // from: 155.3
  SAY #32722 /* ~Goshan has survived all you have put before him and returned with a tidy sum, though I am sure he is not grateful for the risk of his tasks. ~ */
  IF ~~ THEN DO ~GiveGoldForce(750)
~ GOTO 165
END

IF ~~ THEN BEGIN 160 // from: 155.4
  SAY @110 /* ~Goshan is in the custody of the city guards at the moment. We can bribe the guards if you will put up the 2000 gold it will cost.~ */
  IF ~PartyGoldGT(1999)
~ THEN REPLY #32727 /* ~Certainly. I would not wish him to be left behind bars for long.~ */ DO ~TakePartyGold(2000)
~ GOTO 161
  IF ~~ THEN REPLY #32728 /* ~He will have to wait it out in jail for now.~ */ GOTO 162
  IF ~~ THEN REPLY @113 /* ~No, no.  None of the above.  I'll spring Goshen myself.  I'm not afraid to get my hands dirty.~ */ GOTO 204
END

IF ~~ THEN BEGIN 161 // from: 160.0
  SAY #32744 /* ~Very well, I will have him released as soon as possible. You will have to reassign him his tasks when I am done reporting on the others. ~ */
  IF ~~ THEN DO ~SetGlobal("MilphThief","GLOBAL",0)
SetGlobal("MilphRescue","GLOBAL",1)
~ GOTO 165
END

IF ~~ THEN BEGIN 162 // from: 160.1
  SAY #32725 /* ~Then Goshan will stay locked up until you say and pay otherwise. ~ */
  IF ~~ THEN GOTO 165
END

IF ~~ THEN BEGIN 163 // from: 155.5
  SAY #32732 /* ~Goshan is no longer among the living. Unfortunate, but there is nothing to be done.~ */
  IF ~~ THEN GOTO 165
END

IF ~~ THEN BEGIN 164 // from: 155.6
  SAY #32734 /* ~Goshan was not assigned a task in this last period. You will have to modify his instructions when I am done reporting on the others.~ */
  IF ~~ THEN GOTO 165
END

IF ~~ THEN BEGIN 165 // from: 204.0 164.0 163.0 162.0 161.0 159.0 158.0 157.0 156.0
  SAY #32736 /* ~Next under your command is Kretor. Let's check on his progress.~ */
  IF ~Global("KretorThief","GLOBAL",1)
!Dead("Kretor")
~ THEN GOTO 166
  IF ~Global("KretorThief","GLOBAL",2)
!Dead("Kretor")
~ THEN GOTO 167
  IF ~Global("KretorThief","GLOBAL",3)
!Dead("Kretor")
~ THEN GOTO 168
  IF ~Global("KretorThief","GLOBAL",4)
!Dead("Kretor")
~ THEN GOTO 169
  IF ~Global("KretorThief","GLOBAL",5)
!Dead("Kretor")
~ THEN GOTO 170
  IF ~Dead("Kretor")
~ THEN GOTO 173
  IF ~Global("KretorThief","GLOBAL",0)
!Dead("Kretor")
~ THEN GOTO 174
  IF ~Global("KretorThief","GLOBAL",9)
!Dead("Kretor")
~ THEN GOTO 199
END

IF ~~ THEN BEGIN 166 // from: 165.0
  SAY #32739 /* ~Kretor played it safe, as per your instruction. He kept his activities to a minimum and has returned with a small bit of coin.~ */
  IF ~~ THEN DO ~GiveGoldForce(250)
~ GOTO 175
END

IF ~~ THEN BEGIN 167 // from: 165.1
  SAY #32740 /* ~Kretor did not face too much difficulty in meeting your demands. He has returned with a few gold, but not a great amount.~ */
  IF ~~ THEN DO ~GiveGoldForce(500)
~ GOTO 175
END

IF ~~ THEN BEGIN 168 // from: 165.2
  SAY #32741 /* ~Kretor has proven quite resourceful. Your conditions were difficult, but he has met them and returned with a fair amount of gold. ~ */
  IF ~~ THEN DO ~GiveGoldForce(750)
~ GOTO 175
END

IF ~~ THEN BEGIN 169 // from: 165.3
  SAY #32742 /* ~Complain as he might about the unreasonable nature of your instructions, Kretor has nonetheless returned victorious. He has brought quite a bit of coin.~ */
  IF ~~ THEN DO ~GiveGoldForce(1000)
~ GOTO 175
END

IF ~~ THEN BEGIN 170 // from: 165.4
  SAY @163 /* ~Kretor has been arrested and is being held out of our reach. It will cost 500 gold to have him released. This is a reasonable bribe. Will you pay the gold?~ */
  IF ~PartyGoldGT(499)
~ THEN REPLY #32758 /* ~Yes, I will. He is of no use behind bars.~ */ DO ~TakePartyGold(500)
~ GOTO 171
  IF ~~ THEN REPLY #32759 /* ~No, he will have to wait.~ */ GOTO 172
  IF ~~ THEN REPLY @166 /* ~Absolutely not!  I've yet to see a jail that can keep me in or out!  Kretor will be free in no time.~ */ GOTO 203
END

IF ~~ THEN BEGIN 171 // from: 170.0
  SAY #32744 /* ~Very well, I will have him released as soon as possible. You will have to reassign him his tasks when I am done reporting on the others. ~ */
  IF ~~ THEN DO ~SetGlobal("KretorThief","GLOBAL",0)
SetGlobal("KretorRescue","GLOBAL",1)
~ GOTO 175
END

IF ~~ THEN BEGIN 172 // from: 170.1
  SAY #32745 /* ~Kretor will rot with the other guttertrash in a pauper's prison until you say otherwise. ~ */
  IF ~~ THEN GOTO 175
END

IF ~~ THEN BEGIN 173 // from: 165.5
  SAY #32746 /* ~Kretor has been killed. Nothing more to be said about it. ~ */
  IF ~~ THEN GOTO 175
END

IF ~~ THEN BEGIN 174 // from: 165.6
  SAY #32747 /* ~Kretor was not given any instructions for this past period. You can modify his itinerary after I have finished reporting on the others.~ */
  IF ~~ THEN GOTO 175
END

IF ~~ THEN BEGIN 175 // from: 203.0 199.0 174.0 173.0 172.0 171.0 169.0 168.0 167.0 166.0
  SAY #32748 /* ~Next under your command is Morsa. Shall we see how she has fared under your leadership?~ */
  IF ~Global("MorsaThief","GLOBAL",1)
!Dead("Morsa")
~ THEN GOTO 176
  IF ~Global("MorsaThief","GLOBAL",2)
!Dead("Morsa")
~ THEN GOTO 177
  IF ~Global("MorsaThief","GLOBAL",3)
!Dead("Morsa")
~ THEN GOTO 178
  IF ~Global("MorsaThief","GLOBAL",4)
!Dead("Morsa")
~ THEN GOTO 179
  IF ~Global("MorsaThief","GLOBAL",5)
!Dead("Morsa")
~ THEN GOTO 180
  IF ~Dead("Morsa")
~ THEN GOTO 183
  IF ~Global("MorsaThief","GLOBAL",0)
!Dead("Morsa")
~ THEN GOTO 184
END

IF ~~ THEN BEGIN 176 // from: 175.0
  SAY #32760 /* ~Morsa kept her activities to a minimum, transporting only small amounts of contraband. Her return is accordingly small. ~ */
  IF ~~ THEN DO ~GiveGoldForce(100)
~ GOTO 185
END

IF ~~ THEN BEGIN 177 // from: 175.1
  SAY #32761 /* ~The risk was small, but the reward is just fine comparatively. A nice profit, all things considered. She would probably enjoy more of a challenge though.~ */
  IF ~~ THEN DO ~GiveGoldForce(250)
~ GOTO 185
END

IF ~~ THEN BEGIN 178 // from: 175.2
  SAY #32762 /* ~Morsa responded well to this level of challenge, and has returned with a tidy sum of gold. It was risky, but she came through just fine in the end. ~ */
  IF ~~ THEN DO ~GiveGoldForce(500)
~ GOTO 185
END

IF ~~ THEN BEGIN 179 // from: 175.3
  SAY #32763 /* ~She did not enjoy the danger of the situation you put her in, but nevertheless, she has pulled it off and come through. She has brought a nice sum.~ */
  IF ~~ THEN DO ~GiveGoldForce(750)
~ GOTO 185
END

IF ~~ THEN BEGIN 180 // from: 175.4
  SAY @215 /* ~Morsa is in the hands of the guards. Smugglers are not well liked, and it will cost 2500 gold to bribe her out. Do you have the coin to pay?~ */
  IF ~PartyGoldGT(2499)
~ THEN REPLY #32775 /* ~Yes, get her back in my service as soon as possible.~ */ DO ~TakePartyGold(2500)
~ GOTO 181
  IF ~~ THEN REPLY #32776 /* ~No, she will have to wait.~ */ GOTO 182
  IF ~~ THEN REPLY @218 /* ~Don't you know me better than that, by now?  I'll take care of this myself.  Morsa will be walking free before you can say 'Jailbreak'.~ */ GOTO 202
END

IF ~~ THEN BEGIN 181 // from: 180.0
  SAY #32765 /* ~Very well, I will have her released before the day is out. You will have to reassign her tasks to her when I am done reporting on the others. ~ */
  IF ~~ THEN DO ~SetGlobal("MorsaThief","GLOBAL",0)
SetGlobal("MorsaRescue","GLOBAL",1)
~ GOTO 185
END

IF ~~ THEN BEGIN 182 // from: 180.1
  SAY #32766 /* ~Then She will stay locked up until you can put up the gold. ~ */
  IF ~~ THEN GOTO 185
END

IF ~~ THEN BEGIN 183 // from: 175.5
  SAY #32767 /* ~Morsa is dead. A sad loss, and sadder still that there is nothing to be done about it.~ */
  IF ~~ THEN GOTO 185
END

IF ~~ THEN BEGIN 184 // from: 175.6
  SAY #32768 /* ~Morsa was not given instructions, so she has nothing to show for this past period. You can modify her itinerary after I finish reporting on the others.~ */
  IF ~~ THEN GOTO 185
END

IF ~~ THEN BEGIN 185 // from: 202.0 184.0 183.0 182.0 181.0 179.0 178.0 177.0 176.0
  SAY #32769 /* ~Last in your service is Varia. Let's check on how she has done under your instruction.~ */
  IF ~Global("VariaThief","GLOBAL",1)
!Dead("Varia")
~ THEN GOTO 186
  IF ~Global("VariaThief","GLOBAL",2)
!Dead("Varia")
~ THEN GOTO 187
  IF ~Global("VariaThief","GLOBAL",3)
!Dead("Varia")
~ THEN GOTO 188
  IF ~Global("VariaThief","GLOBAL",4)
!Dead("Varia")
~ THEN GOTO 189
  IF ~Global("VariaThief","GLOBAL",5)
!Dead("Varia")
~ THEN GOTO 190
  IF ~Dead("Varia")
~ THEN GOTO 193
  IF ~Global("VariaThief","GLOBAL",0)
!Dead("Varia")
~ THEN GOTO 194
END

IF ~~ THEN BEGIN 186 // from: 185.0
  SAY #32777 /* ~She did reasonable well, considering the restrictions you put on her. Her risk was low, so her return is as well. A meager profit.~ */
  IF ~~ THEN DO ~GiveGoldForce(150)
~ GOTO 195
END

IF ~~ THEN BEGIN 187 // from: 185.1
  SAY #32778 /* ~Varia did well for you. The risk was relatively low, however, so the rewards are not too high. A nice return regardless.~ */
  IF ~~ THEN DO ~GiveGoldForce(300)
~ GOTO 195
END

IF ~~ THEN BEGIN 188 // from: 185.2
  SAY #32779 /* ~She has done well, and returned with a nice profit. The risk was worth it, I suppose. Well instructed.~ */
  IF ~~ THEN DO ~GiveGoldForce(500)
~ GOTO 195
END

IF ~~ THEN BEGIN 189 // from: 185.3
  SAY #32780 /* ~She is well worth her pay today. The risk was astounding, but she was returned with nary a scratch on her.~ */
  IF ~~ THEN DO ~GiveGoldForce(800)
~ GOTO 195
END

IF ~~ THEN BEGIN 190 // from: 185.4
  SAY @267 /* ~Varia is incarcerated. Seems she angered the wrong member of government. I estimate it will require a 3000 gold bribe to free her. Will you pay it?~ */
  IF ~PartyGoldGT(2999)
~ THEN REPLY #32789 /* ~I will pay it. She is a valuable member of the guild.~ */ DO ~TakePartyGold(3000)
~ GOTO 191
  IF ~~ THEN REPLY #32790 /* ~I will not pay it at this time.~ */ GOTO 192
  IF ~~ THEN REPLY @270 /* ~Don't fret your pointy little head about it Jariel.  I'll set Varia free.~ */ GOTO 201
END

IF ~~ THEN BEGIN 191 // from: 190.0
  SAY #32782 /* ~She will be free by nightfall. You will have to assign her tasks to her once again however. Otherwise she will just enjoy being free.~ */
  IF ~~ THEN DO ~SetGlobal("VariaThief","GLOBAL",0)
SetGlobal("VariaRescue","GLOBAL",1)
~ GOTO 195
END

IF ~~ THEN BEGIN 192 // from: 190.1
  SAY #32783 /* ~Then Varia will languish in prison until she is freed. ~ */
  IF ~~ THEN GOTO 195
END

IF ~~ THEN BEGIN 193 // from: 185.5
  SAY #32784 /* ~Varia is no longer alive. It is a great loss. ~ */
  IF ~~ THEN GOTO 195
END

IF ~~ THEN BEGIN 194 // from: 185.6
  SAY #32785 /* ~Varia was not assigned a set of instructions, so she has nothing to show for this past period. You can modify her itinerary shortly, if you so choose.~ */
  IF ~~ THEN GOTO 195
END

IF ~~ THEN BEGIN 195 // from: 201.0 194.0 193.0 192.0 191.0 189.0 188.0 187.0 186.0
  SAY #32786 /* ~Now then, that's all of them. Do not forget to give the quota master his dues, or Renal will close down the guild. He does not wait for long. ~ */
  IF ~~ THEN UNSOLVED_JOURNAL #55542 /* ~Thieves' Guild Stronghold: business as usual.

I must remember to check in at my thieves' guild every 5 days or so. I must continue to check on my thieves and also pay the quotamaster. ~ */ GOTO 196
END

IF ~~ THEN BEGIN 196 // from: 195.0
  SAY #32791 /* ~You can now choose to do one of two things. Your thieves can continue with the same instructions they already have, or you can choose to change their focus.~ */
  IF ~Global("JamesLathan","GLOBAL",0)
!Dead("Lathen")
~ THEN REPLY #62161 /* ~I will leave them as they are. No need to change anything.~ */ GOTO 14
  IF ~~ THEN REPLY #32793 /* ~I will modify their instructions.~ */ GOTO 15
  IF ~OR(2)
Global("JamesLathan","GLOBAL",1)
Dead("Lathen")
~ THEN REPLY #62161 /* ~I will leave them as they are. No need to change anything.~ */ GOTO 200
END

IF ~~ THEN BEGIN 197 // from: 67.4
  SAY #34787 /* ~Unfortunately, Kretor has quit. He could not keep up with the demands of the quota you set because his own thieves were stealing from the guild.~ */
  IF ~~ THEN GOTO 93
END

IF ~~ THEN BEGIN 198 // from:
  SAY #34788 /* ~Kretor has quit, unfortunately. He was covering the quota out of his own pocket, because some of his own thieves were stealing from the guild coffers.~ */
  IF ~~ THEN GOTO 93
END

IF ~~ THEN BEGIN 199 // from: 165.7
  SAY #34903 /* ~Kretor has unfortunately quit your service. This branch of your guild has been closed.~ */
  IF ~~ THEN GOTO 175
END

IF ~~ THEN BEGIN 200 // from: 196.2 13.2
  SAY #62162 /* ~In 5 days I will tell you the results of their work.~ */
  IF ~~ THEN DO ~SetGlobalTimer("PGThievesReturn","GLOBAL",FIVE_DAYS)
SetGlobal("NotifyThiefHead","GLOBAL",0)
SetGlobal("PGThievesLeave","GLOBAL",1)
~ EXIT
END

IF ~~ THEN BEGIN 201 // from: 190.2
  SAY @363 /* ~Boss, you have what they call 'intestinal fortitude.'  The guards will no doubt run at the first sight of you.~ */
  IF ~~ THEN GOTO 195
END

IF ~~ THEN BEGIN 202 // from: 180.2
  SAY @364 /* ~I'm sure she will.~ */
  IF ~~ THEN GOTO 185
END

IF ~~ THEN BEGIN 203 // from: 170.2
  SAY @365 /* ~I must say, I've never worked for a guildmaster as... courageous as you.~ */
  IF ~~ THEN GOTO 175
END

IF ~~ THEN BEGIN 204 // from: 160.2
  SAY @366 /* ~I'm sure he will appreciate your efforts.~ */
  IF ~~ THEN GOTO 165
END

IF ~~ THEN BEGIN 205 // from: 150.2
  SAY @367 /* ~Well then, I'm sure it's just a matter of time until Hanz is walking free.~ */
  IF ~~ THEN GOTO 155
END

IF ~~ THEN BEGIN 206 // from: 132.2
  SAY @363 /* ~Boss, you have what they call 'intestinal fortitude.'  The guards will no doubt run at the first sight of you.~ */
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 207 // from: 106.2
  SAY @364 /* ~I'm sure she will.~ */
  IF ~~ THEN GOTO 119
END

IF ~~ THEN BEGIN 208 // from: 80.2
  SAY @365 /* ~I must say, I've never worked for a guildmaster as... courageous as you.~ */
  IF ~~ THEN GOTO 93
END

IF ~~ THEN BEGIN 209 // from: 54.2
  SAY @366 /* ~I'm sure he will appreciate your efforts.~ */
  IF ~~ THEN GOTO 67
END

IF ~~ THEN BEGIN 210 // from: 28.2
  SAY @367 /* ~Well then, I'm sure it's just a matter of time until Hanz is walking free.~ */
  IF ~~ THEN GOTO 41
END
