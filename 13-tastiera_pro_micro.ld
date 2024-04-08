LDmicro0.2
MICRO=Atmel AVR ATmega32U4 44-Pin packages
CYCLE=10000 us at Timer1, YPlcCycleDuty:0, ConfigurationWord(s):0x7FB90A2A00000000
CRYSTAL=16000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILED=C:\Programmi_std\Ladder_micro\Programmi\tastiera_pro_micro.hex
COMPILER=IHEX

PULL-UP LIST
    PB: 0xFFFFFFFF 
    PC: 0xFFFFFFFF 
    PD: 0xFFFFFFFF 
    PE: 0xFFFFFFFF 
    PF: 0xFFFFFFFF 
END

VAR LIST
    1 bytes Ccount
    2 bytes Cnew 	Now not used !!!
    1 bytes T1 	Now not used !!!
    1 bytes T5 	Now not used !!!
    1 bytes T9 	Now not used !!!
    2 bytes TM1
    2 bytes TM2
    2 bytes TM5
    2 bytes TM9
    1 bytes TMcanc
    1 bytes TR1 	Now not used !!!
    1 bytes Tcanc 	Now not used !!!
    1 bytes Tck 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
    2 bytes count 	Now not used !!!
END

IO LIST
    XR0 at 39 0 0
    XR1 at 38 0 0
    XR2 at 37 0 0
    XR3 at 36 0 0
    YC0 at 1 0 0
    YC1 at 28 0 0
    YC2 at 29 0 0
    YLedtx at 22 0 0
    YPD7 at 27 0 0
END

PROGRAM
RUNG 1
  CONTACTS Rclk 1 0
  COIL Rclk 0 0 0 0
END
RUNG 2
  CONTACTS Rclk 1 0
  CTC Ccount 2 0 /
END
RUNG 3
  EQU Ccount 0
  COIL YC0 0 0 0 0
END
RUNG 4
  EQU Ccount 1
  COIL YC1 0 0 0 0
END
RUNG 5
  EQU Ccount 2
  COIL YC2 0 0 0 0
END
RUNG 6
  COMMENT Cifra 1\r\n
END
RUNG 7
  PARALLEL
    CONTACTS XR0 1 0
    CONTACTS YC0 1 0
  END
  COIL R1 0 1 0 0
END
RUNG 8
  CONTACTS YC0 0 0
  CONTACTS XR0 0 0
  COIL R1 0 0 1 0
END
RUNG 9
  COMMENT Cifra 2\r\n
END
RUNG 10
  PARALLEL
    CONTACTS XR0 1 0
    CONTACTS YC1 1 0
  END
  COIL R2 0 1 0 0
END
RUNG 11
  CONTACTS YC1 0 0
  CONTACTS XR0 0 0
  COIL R2 0 0 1 0
END
RUNG 12
  COMMENT Cifra 5\r\n
END
RUNG 13
  PARALLEL
    CONTACTS XR1 1 0
    CONTACTS YC1 1 0
  END
  COIL R5 0 1 0 0
END
RUNG 14
  CONTACTS YC1 0 0
  CONTACTS XR1 0 0
  COIL R5 0 0 1 0
END
RUNG 15
  COMMENT Cifra 9\r\n
END
RUNG 16
  PARALLEL
    CONTACTS XR2 1 0
    CONTACTS YC2 1 0
  END
  COIL R9 0 1 0 0
END
RUNG 17
  CONTACTS YC2 0 0
  CONTACTS XR2 0 0
  COIL R9 0 0 1 0
END
RUNG 18
  COMMENT # cancelletto
END
RUNG 19
  PARALLEL
    CONTACTS XR3 1 0
    CONTACTS YC2 1 0
  END
  COIL Rcanc 0 1 0 0
END
RUNG 20
  CONTACTS YC2 0 0
  CONTACTS XR3 0 0
  COIL Rcanc 0 0 1 0
END
RUNG 21
  COMMENT Memorizzazione codice\r\n
END
RUNG 22
  CONTACTS R1 1 0
  COIL RM1 0 1 0 0
END
RUNG 23
  CONTACTS R1 0 0
  TON TM1 3000000 0
  COIL RM1 0 0 1 0
END
RUNG 24
  CONTACTS RM1 0 0
  CONTACTS R5 1 0
  COIL RM5 0 1 0 0
END
RUNG 25
  CONTACTS R5 1 0
  COIL RM1 0 0 1 0
END
RUNG 26
  CONTACTS R5 0 0
  TON TM5 3000000 0
  COIL RM5 0 0 1 0
END
RUNG 27
  CONTACTS RM5 0 0
  CONTACTS R9 1 0
  COIL RM9 0 1 0 0
END
RUNG 28
  CONTACTS R9 1 0
  PARALLEL
    COIL RM5 0 0 1 0
    COIL RM1 0 0 1 0
  END
END
RUNG 29
  CONTACTS R9 0 0
  TON TM9 3000000 0
  COIL RM9 0 0 1 0
END
RUNG 30
  CONTACTS RM9 0 0
  CONTACTS R2 1 0
  COIL RM2 0 1 0 0
END
RUNG 31
  CONTACTS R2 1 0
  PARALLEL
    COIL RM9 0 0 1 0
    COIL RM5 0 0 1 0
    COIL RM1 0 0 1 0
  END
END
RUNG 32
  CONTACTS R2 0 0
  TON TM2 3000000 0
  COIL RM2 0 0 1 0
END
RUNG 33
  CONTACTS RM2 0 0
  CONTACTS Rcanc 1 0
  COIL RMcanc 0 1 0 0
END
RUNG 34
  CONTACTS Rcanc 1 0
  PARALLEL
    COIL RM9 0 0 1 0
    COIL RM5 0 0 1 0
    COIL RM2 0 0 1 0
    COIL RM1 0 0 1 0
  END
END
RUNG 35
  CONTACTS Rcanc 0 0
  TON TMcanc 800000 0
  COIL RMcanc 0 0 1 0
END
RUNG 36
  CONTACTS RMcanc 0 0
  COIL YPD7 0 0 0 0
END
RUNG 37
  COMMENT Led pressione tasti
END
RUNG 38
  CONTACTS R1 0 0
  CONTACTS R2 0 0
  CONTACTS R5 0 0
  CONTACTS R9 0 0
  CONTACTS Rcanc 0 0
  COIL YLedtx 0 0 0 0
END
