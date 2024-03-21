LDmicro0.2
MICRO=Atmel AVR ATmega328 28-PDIP
CYCLE=1000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0xD0B93CB800000000
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILED=C:\Programmi_std\Ladder_micro\Programmi\display_counter_anodoC.c
COMPILER=AVRGCC

PULL-UP LIST
    PB: 0xFFFFFFFF 
    PC: 0xFFFFFFFF 
    PD: 0xFFFFFFFF 
END

VAR LIST
    1 bytes #PORTD 	Now not used !!!
    1 bytes #TRISD 	Now not used !!!
    2 bytes B
    2 bytes C
    1 bytes C1 	Now not used !!!
    1 bytes CC1 	Now not used !!!
    1 bytes Cdig 	Now not used !!!
    1 bytes Cdigit 	Now not used !!!
    2 bytes Cnew 	Now not used !!!
    1 bytes Csel_digit 	Now not used !!!
    1 bytes Cslot 	Now not used !!!
    2 bytes D
    2 bytes E
    2 bytes F
    2 bytes G
    2 bytes Seg_A 	Now not used !!!
    2 bytes Seg_B 	Now not used !!!
    2 bytes Seg_C 	Now not used !!!
    2 bytes Seg_D 	Now not used !!!
    2 bytes Seg_E 	Now not used !!!
    2 bytes Seg_F 	Now not used !!!
    2 bytes Seg_G 	Now not used !!!
    2 bytes Seg_a 	Now not used !!!
    2 bytes T1 	Now not used !!!
    1 bytes T2 	Now not used !!!
    1 bytes T3 	Now not used !!!
    1 bytes T4 	Now not used !!!
    1 bytes T5 	Now not used !!!
    1 bytes T6 	Now not used !!!
    1 bytes T7 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes bcd 	Now not used !!!
    2 bytes cent
  129 bytes char7seg
    1 bytes char7seg[0]
    2 bytes count 	Now not used !!!
    2 bytes decine
    2 bytes decine_temp 	Now not used !!!
    2 bytes decine_tmp 	Now not used !!!
    2 bytes dest 	Now not used !!!
    2 bytes dgt 	Now not used !!!
    2 bytes dig 	Now not used !!!
    2 bytes dig0 	Now not used !!!
    2 bytes dig1 	Now not used !!!
    2 bytes dig2 	Now not used !!!
    2 bytes digit 	Now not used !!!
    2 bytes digit0 	Now not used !!!
    2 bytes digit1 	Now not used !!!
    2 bytes digit2 	Now not used !!!
    2 bytes display 	Now not used !!!
    2 bytes hund 	Now not used !!!
    2 bytes hundred 	Now not used !!!
    2 bytes number 	Now not used !!!
    2 bytes numero 	Now not used !!!
    2 bytes seg_a 	Now not used !!!
    2 bytes seg_b 	Now not used !!!
    2 bytes seg_c 	Now not used !!!
    2 bytes seg_d 	Now not used !!!
    2 bytes seg_e 	Now not used !!!
    2 bytes seg_f 	Now not used !!!
    2 bytes seg_g 	Now not used !!!
    2 bytes sel_digit 	Now not used !!!
    2 bytes slot 	Now not used !!!
    2 bytes src 	Now not used !!!
    2 bytes tens 	Now not used !!!
    2 bytes tens_temp 	Now not used !!!
    2 bytes unit 	Now not used !!!
    2 bytes unita 	Now not used !!!
END

IO LIST
    Xconteggio_DW at 15 0 0
    Xconteggio_UP at 14 0 0
    YSeg_A at 2 0 0
    YSeg_B at 3 0 0
    YSeg_C at 4 0 0
    YSeg_D at 5 0 0
    YSeg_E at 6 0 0
    YSeg_F at 11 0 0
    YSeg_G at 12 0 0
    Ycentinaia at 28 0 0
    Ydecine at 27 0 0
    Yunita at 26 0 0
    A at 0 0 0
END

PROGRAM
RUNG 1
  COMMENT RG 4 Tech - Tutorial Youtube LDmicro - https://www.youtube.com/@rg4tech\r\n3 Display UP - DOWN anodo comune
END
RUNG 2
  CONTACTS Xconteggio_DW 1 1
  CTD C1 0 10 /
END
RUNG 3
  CONTACTS Xconteggio_UP 1 1
  CTU C1 10 10 /
END
RUNG 4
  PARALLEL
    MOVE numero C1
    DIV cent numero 100
    MOD decine_tmp numero 100
    DIV decine decine_tmp 10
    MOD unita decine_tmp 10
  END
END
RUNG 5
  CONTACTS Ros 1 0
  COIL Ros 0 0 0 0
END
RUNG 6
  CONTACTS Ros 0 0
  CTC Csel_digit 2 0 /
END
RUNG 7
  EQU Csel_digit 0
  PARALLEL
    COIL Yunita 1 0 0 0
    MOVE dgt unita
  END
END
RUNG 8
  EQU Csel_digit 1
  PARALLEL
    COIL Ydecine 1 0 0 0
    MOVE dgt decine
  END
END
RUNG 9
  EQU Csel_digit 2
  PARALLEL
    COIL Ycentinaia 1 0 0 0
    MOVE dgt cent
  END
END
RUNG 10
  7SEGMENTS display dgt A
END
RUNG 11
  AND A display 1
  EQU A 1
  COIL YSeg_A 0 0 0 0
END
RUNG 12
  AND B display 2
  EQU B 2
  COIL YSeg_B 0 0 0 0
END
RUNG 13
  AND C display 4
  EQU C 4
  COIL YSeg_C 0 0 0 0
END
RUNG 14
  AND D display 8
  EQU D 8
  COIL YSeg_D 0 0 0 0
END
RUNG 15
  AND E display 16
  EQU E 16
  COIL YSeg_E 0 0 0 0
END
RUNG 16
  AND F display 32
  EQU F 32
  COIL YSeg_F 0 0 0 0
END
RUNG 17
  AND G display 64
  EQU G 64
  COIL YSeg_G 0 0 0 0
END
