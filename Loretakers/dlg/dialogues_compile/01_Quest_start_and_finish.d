BEGIN AC#FPST1
BEGIN AC#FPST2
BEGIN AC#FPCO2

CHAIN IF ~Global("AC#Braintransceiver","GLOBAL",3)~ THEN AC#FPCO2 hello_thank_you 
@0
= @1
= @2
= @3
DO ~SetGlobal("AC#LoreQuestMain","GLOBAL",20)
GiveGoldForce(2000) AddExperienceParty(3000)
GiveItemCreate("AC#FPRIN",Player1,1,0,0)~  EXTERN AC#FPCO2 bye_lets_go

CHAIN AC#FPCO2 bye_lets_go
@4
DO ~EraseJournalEntry(@100000)
EraseJournalEntry(@100001)
EraseJournalEntry(@100002)
EraseJournalEntry(@100003)
EraseJournalEntry(@100004)
EraseJournalEntry(@100005)
EraseJournalEntry(@100006)
EraseJournalEntry(@100007)
EraseJournalEntry(@100010)
EraseJournalEntry(@100011)
EraseJournalEntry(@100012)
EraseJournalEntry(@100020)
AddJournalEntry(@100021,QUEST_DONE)
ActionOverride("AC#FPST2",EscapeArea()) 
ActionOverride("AC#FPST1",EscapeArea()) 
EscapeArea()~ EXIT

//BOOK START AC#FPST1

CHAIN IF ~NumTimesTalkedTo(0) Global("AC#LoreQuestMain","GLOBAL",0)~ THEN AC#FPST1 START.01.00 
@5
==AC#FPST2 @6 
==AC#FPST1 @7 
==AC#FPST2 @8
==AC#FPST1 @9
==SKIEJ IF ~InParty("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @10
==SKIEJ IF ~InParty("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @11
==JAHEIJ IF ~InParty("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN @12
==IMOEN2 IF ~InParty("IMOEN") !StateCheck("IMOEN",CD_STATE_NOTVALID)~ THEN @13
==DYNAHJ IF ~InParty("DYNAHEIR") !StateCheck("DYNAHEIR",CD_STATE_NOTVALID)~ THEN @14
==AC#FPST2 @15
==XZARJ IF ~InParty("XZAR") !StateCheck("XZAR",CD_STATE_NOTVALID)~ THEN @16
==XANJ IF ~InParty("XANJ") !StateCheck("XANJ",CD_STATE_NOTVALID)~ THEN @17
==NEERAJ IF ~InParty("NEERA") !StateCheck("NEERA",CD_STATE_NOTVALID)~ THEN @18
==BAELOTHJ IF ~InParty("BAELOTH") !StateCheck("BAELOTH",CD_STATE_NOTVALID)~ THEN @19
==EDWINJ IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @20
==AC#FPST1 @21
END
IF~~THEN REPLY @22 EXTERN AC#FPST1 START.01.01
IF~~THEN REPLY @23 EXTERN AC#FPST1 START.01.01
IF~~THEN REPLY @24 EXTERN AC#FPST1 START.01.01
IF~~THEN REPLY @25 EXTERN AC#FPST1 START.01.01
IF~~THEN REPLY @26 EXTERN AC#FPST1 START.01.01

CHAIN IF ~NumTimesTalkedToGT(0) Global("AC#LoreQuestMain","GLOBAL",0)~ THEN AC#FPST1 START.01.0R 
@27
==AC#FPST2 @28
END
IF~~THEN REPLY @29 EXTERN AC#FPST1 START.01.01
IF~~THEN REPLY @30 EXIT

CHAIN AC#FPST1 START.01.01
@31
=@32 
==AC#FPST2@33
==AC#FPST1 @34
==MINSCJ IF ~InParty("MINSC") !StateCheck("MINSC",CD_STATE_NOTVALID)~ THEN @35
==AC#FPST2 @36
==ALORAJ IF ~InParty("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN @37
==AC#FPST1 @38
==AC#FPST1 @39
END
IF~~THEN REPLY @40 EXTERN AC#FPST1 START.01.02
IF~~THEN REPLY @41 EXTERN AC#FPST1 START.01.03
IF~~THEN REPLY @42 EXTERN AC#FPST1 START.01.03
IF~~THEN REPLY @43 EXTERN AC#FPST1 START.01.03
IF~~THEN REPLY @44 EXTERN AC#FPST1 START.01.04

CHAIN AC#FPST1 START.01.02
@45 
EXTERN AC#FPST1 START.01.05

CHAIN AC#FPST1 START.01.03
@46
EXTERN AC#FPST1 START.01.05

CHAIN AC#FPST1 START.01.05
@47
END
IF~~THEN REPLY @48 EXTERN AC#FPST1 help_us
IF~~THEN REPLY @49 EXTERN AC#FPST1 help_us
IF~~THEN REPLY @50 EXTERN AC#FPST1 help_us
IF~~THEN REPLY @51 EXTERN AC#FPST1 help_us
IF~~THEN REPLY @52 EXTERN AC#FPST1 START.01.04


CHAIN AC#FPST1 help_us
@53
DO ~SetGlobal("AC#LoreQuestMain","GLOBAL",1)
AddJournalEntry(@100000,QUEST)~ EXIT

CHAIN AC#FPST1 START.01.04
@54
EXIT

//FINAL
//Global("AC#FP_LoremasterFree","GLOBAL",1)

CHAIN IF ~Global("AC#Braintransceiver","GLOBAL",3)~ THEN AC#FPST1 START.0F.00 
@55
END
IF~~THEN REPLY @56 EXTERN AC#FPST1 START.0F.01
IF~~THEN REPLY @57 EXTERN AC#FPST1 bye

CHAIN AC#FPST1 START.0F.01
@58 
END
IF~~THEN EXTERN AC#FPST1 illithids
IF~Global("AC#FP_LoremasterFree","GLOBAL",0)~THEN EXTERN AC#FPST1 did_you_manage_free_loremaster

	CHAIN AC#FPST1 did_you_manage_free_loremaster
	@59 
	END
	IF~Global("AC#FP_LoremasterFree","GLOBAL",0)~THEN REPLY @60 EXTERN AC#FPST1 bye_keep_searching_loremaster
	IF~GlobalGT("AC#FP_LoremasterFree","GLOBAL",0)~THEN REPLY @61 EXTERN AC#FPST1 thanks_keep_searching_loremaster

		CHAIN IF ~~ THEN AC#FPST1 bye_keep_searching_loremaster
		@62
		EXIT
		
		CHAIN IF ~~ THEN AC#FPST1 thanks_keep_searching_loremaster
		@63
		EXIT
		
CHAIN AC#FPST1 illithids
@64
==AC#FPST2 @65
==AC#FPST1 @66
==AC#FPST1 @67
==AC#FPST2 @68
EXIT

	CHAIN IF ~~ THEN AC#FPST1 bye
	@69
	EXIT

CHAIN IF ~Global("AC#LoreQuestMain","GLOBAL",1)~ THEN AC#FPST1 hello_talk_to_tuck 
@70
EXIT
//ALWAYS LAST

CHAIN IF ~GlobalGT("AC#LoreQuestMain","GLOBAL",0)~ THEN AC#FPST1 START.02.00 
@71
EXIT

///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

//1ST CONTINUED

CHAIN IF ~Global("AC#Braintransceiver","GLOBAL",3)~ THEN AC#FPST2 hello_thank_you 
@135
EXIT

CHAIN IF ~Global("AC#LoreQuestMain","GLOBAL",1)~ THEN AC#FPST2 START.01B.00
@72
END
IF~~THEN REPLY @73 EXTERN AC#FPST2 START.01B.01
IF~~THEN REPLY @74 EXTERN AC#FPST2 START.01B.01
IF~~THEN REPLY @75 EXTERN AC#FPST2 bye_dont_care
IF~~THEN REPLY @76 EXTERN AC#FPST2 bye_dont_care

CHAIN AC#FPST2 START.01B.01
@77 
END
IF~~THEN REPLY @78 EXTERN AC#FPST2 what_exaclty_happened

CHAIN AC#FPST2 what_exaclty_happened
@79
END 
IF~~THEN REPLY @80 EXTERN AC#FPST2 when_did_that_start
IF~~THEN REPLY @81 EXTERN AC#FPST2 when_did_that_start
IF~~THEN REPLY @82 EXTERN AC#FPST2 corresponding_books

CHAIN AC#FPST2 when_did_that_start
@83
END
IF~~THEN EXTERN AC#FPST2 cosmic_horror

CHAIN AC#FPST2 cosmic_horror
@84
==EDWINJ IF ~InParty("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN @85
END IF~~THEN REPLY @86 EXTERN AC#FPST2 corresponding_books

CHAIN AC#FPST2 corresponding_books
@87
END
IF~~THEN REPLY @88 EXTERN AC#FPST2 START.01B.02
IF~~THEN REPLY @89 EXTERN AC#FPST2 START.01B.02
IF~~THEN REPLY @90 EXTERN AC#FPST2 START.01B.02

CHAIN AC#FPST2 START.01B.02
@91
==DORNJ IF ~InParty("DORN") !StateCheck("DORN",CD_STATE_NOTVALID)~ THEN @92
==AC#FPST2 @93
END
IF~~THEN REPLY @94 EXTERN AC#FPST2 take_a_look_book
IF~~THEN REPLY @95 EXTERN AC#FPST2 Eyvind_disappeared

	CHAIN AC#FPST2 take_a_look_book
	@96
	==SKIEJ IF ~InParty("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN @97
	==AC#FPST2 @98
	END
	IF~~THEN DO ~GiveItemCreate("AC#FPRMC",Player1,1,0,0)~ EXTERN AC#FPST2 Eyvind_disappeared

CHAIN AC#FPST2 Eyvind_disappeared
@99
END 
IF~~THEN REPLY @100 EXTERN AC#FPST2 where_is_Eyvind
IF~~THEN REPLY @101 EXTERN AC#FPST2 enemies_city

	CHAIN AC#FPST2 enemies_city
	@102
	END 
	IF~~THEN REPLY @100 EXTERN AC#FPST2 where_is_Eyvind

CHAIN AC#FPST2 where_is_Eyvind
@103
END
IF~~THEN REPLY @104 EXTERN AC#FPST2 strange_woman
IF~~THEN REPLY @105 EXTERN AC#FPST2 strange_woman

CHAIN AC#FPST2 strange_woman
@106
==AC#FPST2 @107
==AC#FPST2 @108
END
IF~~THEN REPLY @109 EXTERN AC#FPST2 START.01B.04
IF~~THEN REPLY @110 EXTERN AC#FPST2 START.01B.04
IF~~THEN REPLY @111 EXTERN AC#FPST2 START.01B.04

CHAIN AC#FPST2 START.01B.04
@112
END
IF~~THEN EXTERN AC#FPST2 search_strange_woman

CHAIN AC#FPST2 search_strange_woman
@113
END
IF~~THEN REPLY @114 EXTERN AC#FPST2 goodbye_search_strange_woman

CHAIN AC#FPST2 goodbye_search_strange_woman
@115
DO ~SetGlobal("AC#LoreQuestMain","GLOBAL",2)
EraseJournalEntry(@100000)
AddJournalEntry(@100001,QUEST)~ EXIT

CHAIN AC#FPST2 bye_dont_care
@116
EXIT

//AFTER CLEANER

CHAIN IF ~GlobalGT("AC#LoreQuestMain","GLOBAL",1)~ THEN AC#FPST2 START.02.00
@117
END
IF~Global("AC#LoreQuestMain","GLOBAL",3)~THEN REPLY @118 EXTERN AC#FPST2 START.02.01
IF~Global("AC#LoreQuestMain","GLOBAL",3)~THEN REPLY @119 EXTERN AC#FPST2 START.02.01
IF~Global("AC#LoreQuestMain","GLOBAL",7)~THEN REPLY @120 EXTERN AC#FPST2 heard_unveilers
IF~~THEN REPLY @121 EXIT

	CHAIN AC#FPST2 heard_unveilers
	@122
	END
	IF~~THEN REPLY @123 EXTERN AC#FPST2 heard_unveilers_02
	
	CHAIN AC#FPST2 heard_unveilers_02
	@124
	END
	IF~~THEN REPLY @125 EXTERN AC#FPST2 bye_dont_care

CHAIN AC#FPST2 START.02.01
@126
==AC#FPST2 @127
==AC#FPST2 @128
END
IF~~THEN REPLY @129 EXTERN AC#FPST2 bye_seek_gond
IF~~THEN REPLY @130 EXTERN AC#FPST2 bye_seek_gond
IF~~THEN REPLY @131 EXTERN AC#FPST2 START.02.03

CHAIN AC#FPST2 START.02.03
@132
END
IF~~THEN EXTERN AC#FPST2 bye_seek_gond

CHAIN AC#FPST2 bye_seek_gond
@133
DO ~SetGlobal("AC#LoreQuestMain","GLOBAL",4)
EraseJournalEntry(@100002)
AddJournalEntry(@100003,QUEST)~ EXIT

//ALWAYS LAST

CHAIN IF ~True()~ THEN AC#FPST2 START.01A.00
@134
EXIT
