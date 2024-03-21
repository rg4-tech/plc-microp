LDmicro0.2
MICRO=Atmel AVR ATmega328 28-PDIP
CYCLE=10000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0xE079CF9F00000000
CRYSTAL=8000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILED=C:\Programmi_std\Ladder_micro\Programmi\display_counter.hex
COMPILER=IHEX

PULL-UP LIST
    PB: 0xFFFFFFFF 
    PC: 0xFFFFFFFF 
    PD: 0xFFFFFFFF 
END

VAR LIST
    2 bytes B
    2 bytes C
    1 bytes C1
    1 bytes CC1 	Now not used !!!
    2 bytes Cnew 	Now not used !!!
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
  129 bytes char7seg
    1 bytes char7seg[0]
    2 bytes dest 	Now not used !!!
    2 bytes display
    2 bytes src 	Now not used !!!
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
    A at 0 0 0
END

PROGRAM
RUNG 1
  COMMENT RG 4 Tech - Tutorial Youtube LDmicro - https://www.youtube.com/@rg4tech\r\nDisplay UP - DOWN
END
RUNG 2
  CONTACTS Xconteggio_DW 0 0
  CTR C1 0 9 /
END
RUNG 3
  CONTACTS Xconteggio_UP 0 0
  CTC C1 9 0 /
END
RUNG 4
  7SEGMENTS display C1 C
END
RUNG 5
  AND A display 1
  EQU A 1
  COIL YSeg_A 0 0 0 0
END
RUNG 6
  AND B display 2
  EQU B 2
  COIL YSeg_B 0 0 0 0
END
RUNG 7
  AND C display 4
  EQU C 4
  COIL YSeg_C 0 0 0 0
END
RUNG 8
  AND D display 8
  EQU D 8
  COIL YSeg_D 0 0 0 0
END
RUNG 9
  AND E display 16
  EQU E 16
  COIL YSeg_E 0 0 0 0
END
RUNG 10
  AND F display 32
  EQU F 32
  COIL YSeg_F 0 0 0 0
END
RUNG 11
  AND G display 64
  EQU G 64
  COIL YSeg_G 0 0 0 0
END
