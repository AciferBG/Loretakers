/////////////////////////////////////////
// Dialogue 2 Wererats

BEGIN ~AC#FP1W2~
BEGIN ~AC#FP1W1~

CHAIN IF ~NumTimesTalkedTo(0)~ THEN AC#FP1W1 chain_hello_00
@0
== AC#FP1W2 @1
== AC#FP1W1 @2
== AC#FP1W2 @3
== AC#FP1W1 @4
== AC#FP1W2 @5
== AC#FP1W1 @6
== AC#FP1W2 @7
== AC#FP1W1 @8
END
IF ~See([PC])~ THEN EXTERN AC#FP1W1 see_pc
IF ~!See([PC])~ THEN EXTERN AC#FP1W1 dont_see_pc

CHAIN AC#FP1W1 see_pc
@9
DO ~Enemy() ActionOverride("AC#FP1W2",Enemy())~ EXIT

CHAIN AC#FP1W1 dont_see_pc
@10
DO ~ActionOverride("AC#FP1W2",EscapeArea()) EscapeArea()~ EXIT


/////////////////////////////////////////
// Dialogue Prisoner

BEGIN ~AC#FPPR1~

IF ~Global("FreePrisoner","AC#FP1",1)~ THEN BEGIN hello_open_door_please
SAY @11
IF ~~ THEN EXIT
END

IF ~Global("FreePrisoner","AC#FP1",2)~ THEN BEGIN hello_free
SAY @12
IF ~~ THEN REPLY @13 GOTO your_welcome
IF ~~ THEN REPLY @14 GOTO your_welcome
IF ~~ THEN REPLY @15 GOTO reward
IF ~~ THEN REPLY @16 GOTO reward
END

	IF ~~ THEN BEGIN your_welcome
	SAY @17
	IF ~~ THEN DO ~ReputationInc(1)~ GOTO outta_here 
	END

	IF ~~ THEN BEGIN reward
	SAY @18
	IF ~~ THEN REPLY @19 GOTO force_reward_02
	IF ~~ THEN REPLY @20 GOTO outta_here
	END
	
		IF ~~ THEN BEGIN force_reward_02
		SAY @21
		IF ~~ THEN DO ~GiveGoldForce(10)~ GOTO outta_here 
		END

	IF ~~ THEN BEGIN outta_here
	SAY @22
	IF ~~ THEN REPLY @23 GOTO find_way
	IF ~~ THEN REPLY @24 GOTO find_way
	END
	
		IF ~~ THEN BEGIN find_way
		SAY @25
		IF ~~ THEN GOTO one_final_word
		END
		
			IF ~~ THEN BEGIN one_final_word
			SAY @26
			IF ~~ THEN REPLY @27 GOTO bye
			IF ~~ THEN REPLY @28 GOTO bye
			IF ~~ THEN REPLY @29 GOTO bye
			IF ~~ THEN REPLY @30 GOTO bye
			END
			
				IF ~~ THEN BEGIN bye
				SAY @31
				IF ~~ THEN DO ~AddexperienceParty(90)
				SetGlobal("FreePrisoner","AC#FP1",10)
				EscapeArea()~ EXIT 
				END

IF ~NumTimesTalkedTo(0)~ THEN BEGIN hello_0
SAY @32
IF ~~ THEN REPLY @33 GOTO who_are_you 
IF ~~ THEN REPLY @34 GOTO not_gonna_help_you 
END

	IF ~~ THEN BEGIN who_are_you
	SAY @35
	IF ~~ THEN REPLY @36 GOTO where
	IF ~~ THEN REPLY @37 GOTO not_gonna_help_you
	END
	
		IF ~~ THEN BEGIN where
		SAY @38
		IF ~~ THEN REPLY @39 GOTO free_you
		IF ~~ THEN REPLY @37 GOTO not_gonna_help_you
		END
		
			IF ~~ THEN BEGIN free_you
			SAY @40
			IF ~~ THEN DO ~SetGlobal("FreePrisoner","AC#FP1",1)~ EXIT 
			END
			
			IF ~~ THEN BEGIN not_gonna_help_you
			SAY @41
			IF ~~ THEN DO ~SetGlobal("FreePrisoner","AC#FP1",1)~ EXIT 
			END

// Dialogue Wererat Clan chief
BEGIN ~AC#FPWRC~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 
  SAY @42
  IF ~~ THEN REPLY @43 + fight
  IF ~~ THEN REPLY @44 + who_are_you
END

	IF ~~ THEN BEGIN fight
	SAY @45
	IF ~~ THEN DO ~Enemy()
	SetGlobal("AllHostile","AC#FP1",1)~ EXIT 
	END
	
		IF ~~ THEN BEGIN who_are_you
		SAY @46
		IF ~~ THEN REPLY @47 GOTO many_books
		IF ~~ THEN REPLY @48 GOTO fight
		IF ~~ THEN REPLY @49 GOTO fight
		END
		
			IF ~~ THEN BEGIN many_books
			SAY @50
			IF ~~ THEN REPLY @51 GOTO interested_in_books
			IF ~~ THEN REPLY @52 GOTO fight
			END
			
				IF ~~ THEN BEGIN interested_in_books
				SAY @53
				IF ~~ THEN REPLY @54 GOTO who_priest
				IF ~~ THEN REPLY @55 + guilty_books
				IF ~~ THEN REPLY @56 + fight
				END
				
					IF ~~ THEN BEGIN guilty_books
					SAY @57
					IF ~~ THEN REPLY @58 GOTO who_priest
					IF ~~ THEN REPLY @59 + fight
					END
				
					IF ~~ THEN BEGIN who_priest
					SAY @60
					IF ~~ THEN REPLY @61 GOTO old_sewers
					IF ~~ THEN REPLY @62 + fight
					END
					
						IF ~~ THEN BEGIN old_sewers
						SAY @63
						IF ~~ THEN REPLY @55 + decaying_books
						IF ~~ THEN REPLY @64 + decaying_books
						IF ~~ THEN REPLY @65 + fight
						//IF ~~ THEN REPLY ~There is something funny about you. In a good way. I think that under right circumstances, we could be friends. Perhaps I should just leave you be...~ GOTO job_offer
						END
						
							IF ~~ THEN BEGIN decaying_books
							SAY @66
							IF ~~ THEN REPLY @67 GOTO earned_money
							IF ~~ THEN REPLY @68 GOTO earned_money
							IF ~~ THEN REPLY @69 + fight
							END
							
								IF ~~ THEN BEGIN earned_money
								SAY @70
								IF ~~ THEN REPLY @71 GOTO who_is_priest_02
								IF ~~ THEN REPLY @72 GOTO fight
								END
								
								IF ~~ THEN BEGIN who_is_priest_02
								SAY @73
								IF ~~ THEN GOTO job_kill_sunite
								END
								
								IF ~~ THEN BEGIN job_kill_sunite
								SAY @74
								IF ~~ THEN REPLY @75 EXTERN AC#FPWRC how_much
								IF ~~ THEN REPLY @76 GOTO fight
								END
								
								CHAIN AC#FPWRC how_much
								@77
								==JAHEIJ IF ~InParty("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @78
								==KHALIJ IF ~InParty("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN @79
								==%RASAAD_JOINED% IF ~InParty("RASAAD") !StateCheck("RASAAD",CD_STATE_NOTVALID)~ THEN @80
								==%MINSC_JOINED% IF ~InParty("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @81
								==YESLIJ IF ~InParty("YESLICK") !StateCheck("YESLICK",CD_STATE_NOTVALID)~ THEN @82
								==SKIEJ IF ~InParty("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @83
								==AJANTJ IF ~InParty("AJANTIS") !StateCheck("AJANTIS",CD_STATE_NOTVALID)~ THEN @84
								==AC#FPWRC @85
								END
									IF ~~ THEN REPLY @86 GOTO kill_innocent
									IF ~~ THEN REPLY @87 GOTO yes_killjob
									IF ~~ THEN REPLY @88 GOTO fight
									
									APPEND ~AC#FPWRC~
									
										IF ~~ THEN BEGIN kill_innocent
										SAY @89
										IF ~~ THEN REPLY @90 GOTO no_killjob
										IF ~~ THEN REPLY @87 GOTO yes_killjob
										END
								
								IF ~~ THEN BEGIN no_killjob
								SAY @91
								IF ~~ THEN GOTO fight
								END
								
								IF ~~ THEN BEGIN yes_killjob
								SAY @92
								IF ~~ THEN DO ~SetGlobal("AC#FPKillTheHermit","GLOBAL",1)
								AddJournalEntry(@120000,QUEST)~ EXIT
								END
						
							IF ~~ THEN BEGIN job_offer
							SAY @93
							IF ~~ THEN REPLY @94 GOTO fight
							END
							
							IF ~Global("AC#FPKillTheHermit","GLOBAL",1)~ THEN BEGIN return.00
							SAY @95
							IF~Dead("AC#FPSUN")~THEN REPLY @96 GOTO return.01
							IF~!Dead("AC#FPSUN")~THEN REPLY @97 EXIT
							IF~~THEN REPLY @98 DO ~SetGlobal("AC#FPKillTheHermit","GLOBAL",-1)~ GOTO fight
							END
							
							IF~~THEN BEGIN return.01
							SAY @99
							IF ~~ THEN GOTO return.02
							END
							
							IF~~THEN BEGIN return.02
							SAY @100
							IF~~ THEN GOTO return.03
							END
							
							IF~~THEN BEGIN return.03
							SAY @101
							IF~~THEN REPLY @102 GOTO return.04
							IF~~THEN REPLY @103 GOTO fight
							END
							
							IF~~THEN BEGIN return.04
							SAY @104
							IF~~THEN DO ~SetGlobal("AC#FPKillTheHermit","GLOBAL",2) AddExperienceParty(300) GiveItem("ac#fp1sw",LastTalkedToBy()) 
							GiveItem("AC#FPPIP",LastTalkedToBy()) 
							EraseJournalEntry(@120000)
							EraseJournalEntry(@120001)
							AddJournalEntry(@120002,QUEST_DONE)
							EscapeArea()~ EXIT
							END
							END
