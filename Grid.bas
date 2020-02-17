10 rem *** Simple grid scroll ***
20 rem *** My first BASIC program in 30 years ***
30 rem *** Feb 2020 ***

100 REM *** Variables ***
110 REM None as of yet, might add some variables later

200 REM *** Some prep work ***
210 REM Found some code online to copy the charset from ROM into RAM
220 REM So far it seems to work as I want 
230 REM but I need to work out what the code actually does
240 PRINTCHR$(142)              :REM SWITCH TO UPPER CASE
250 POKE52,48:POKE 56,48:CLR    :REM RESERVE MEMORY FOR CHARACTERS
260 POKE56334,PEEK(56334)AND254 :REM TURN OFF KEYSCAN INTERRUPT TIMER
270 POKE1,PEEK(1)AND251         :REM SWITCH IN CHARACTER
280 FORI=0TO511:POKEI+12288,PEEK(I+53248):NEXT
290 POKE1,PEEK(1)OR4            :REM SWITCH IN I/O
300 POKE56334,PEEK(56334)OR1    :REM RESTART KEYSCAN INTERRUPT TIMER
310 POKE 53272,(PEEK(53272)AND240)+12 :REM Switch from ROM to RAM

400 REM *** Set up the character grid ***
410 REM Fill the screen with "@" symbols
420 REM By Playing around with charset data
430 REM a simple scrolling grid can be created
440 poke 53280,0: poke 53281,0 :REM Setting screen and border to black
450 print chr$ (147)           :REM Clear the screen

500 REM Filling the screen, pretty simple but effective
510 PRINT "{blue}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
520 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
530 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
540 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
550 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
560 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
570 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
580 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
590 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
600 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
610 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
620 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
630 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
640 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
650 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
660 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
670 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
680 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
690 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
700 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
710 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
720 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
730 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
740 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
750 PRINT "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

800 REM Doing the real effect by poking data into the charset
810 REM Maybe I will look into doing something a bit more efficient?
820 FOR I=12288 TO 12288+7:READ x: POKE I,x:NEXT
830 DATA 24,24,255,255,24,24,24,24
840 FOR I=12288 TO 12288+7:READ x: POKE I,x:NEXT
850 DATA 24,255,255,24,24,24,24,24
860 FOR I=12288 TO 12288+7:READ x: POKE I,x:NEXT
870 DATA 255,255,24,24,24,24,24,24
880 FOR I=12288 TO 12288+7:READ x: POKE I,x:NEXT
890 DATA 255,24,24,24,24,24,24,255
900 FOR I=12288 TO 12288+7:READ x: POKE I,x:NEXT
910 DATA 24,24,24,24,24,24,255,255
920 FOR I=12288 TO 12288+7:READ x: POKE I,x:NEXT
930 DATA 24,24,24,24,24,255,255,24
940 FOR I=12288 TO 12288+7:READ x: POKE I,x:NEXT
950 DATA 24,24,24,24,255,255,24,24
960 FOR I=12288 TO 12288+7:READ x: POKE I,x:NEXT
970 DATA 24,24,24,255,255,24,24,24
980 RESTORE: REM reset the data pointer and start over
990 GOTO 800: REM Loop forever <Insert evil laugh here>

