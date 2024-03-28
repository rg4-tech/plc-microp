LDmicro0.2
MICRO=Atmel AVR ATmega328 28-PDIP
CYCLE=1000 us at Timer0, YPlcCycleDuty:0, ConfigurationWord(s):0x6F4C91200000000
CRYSTAL=8000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILED=C:\Programmi_std\Ladder_micro\Programmi\parcheggio_pcf8574.c
COMPILER=AVRGCC

PULL-UP LIST
    PB: 0xFFFFFFFF 
    PC: 0xFFFFFFFF 
    PD: 0xFFFFFFFF 
END

VAR LIST
    1 bytes #PORTD 	Now not used !!!
    1 bytes #TRISD 	Now not used !!!
    2 bytes B 	Now not used !!!
    2 bytes C 	Now not used !!!
    1 bytes C1
    1 bytes CC1 	Now not used !!!
    1 bytes Cdig 	Now not used !!!
    1 bytes Cdigit 	Now not used !!!
    2 bytes Cnew 	Now not used !!!
    1 bytes Csel_digit
    1 bytes Cslot 	Now not used !!!
    2 bytes D 	Now not used !!!
    2 bytes E 	Now not used !!!
    2 bytes F 	Now not used !!!
    2 bytes G 	Now not used !!!
    2 bytes I2C1 	Now not used !!!
    2 bytes Seg_A 	Now not used !!!
    2 bytes Seg_B 	Now not used !!!
    2 bytes Seg_C 	Now not used !!!
    2 bytes Seg_D 	Now not used !!!
    2 bytes Seg_E 	Now not used !!!
    2 bytes Seg_F 	Now not used !!!
    2 bytes Seg_G 	Now not used !!!
    2 bytes Seg_a 	Now not used !!!
    2 bytes T1 	Now not used !!!
    2 bytes T2 	Now not used !!!
    2 bytes T3 	Now not used !!!
    1 bytes T4 	Now not used !!!
    2 bytes T5 	Now not used !!!
    1 bytes T6 	Now not used !!!
    1 bytes T7 	Now not used !!!
    1 bytes Tnew 	Now not used !!!
    2 bytes Tpulse_E_abbassa 	Now not used !!!
    2 bytes Tpulse_E_alza 	Now not used !!!
    2 bytes Tpulse_U_abbassa 	Now not used !!!
    2 bytes Tpulse_U_alza 	Now not used !!!
    2 bytes Tpulse_alza 	Now not used !!!
    2 bytes bcd 	Now not used !!!
    2 bytes cent 	Now not used !!!
  129 bytes char7seg
    1 bytes char7seg[0]
    2 bytes count 	Now not used !!!
    2 bytes decine 	Now not used !!!
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
    2 bytes out1 	Now not used !!!
    2 bytes seg_a 	Now not used !!!
    2 bytes seg_b 	Now not used !!!
    2 bytes seg_c 	Now not used !!!
    2 bytes seg_d 	Now not used !!!
    2 bytes seg_e 	Now not used !!!
    2 bytes seg_f 	Now not used !!!
    2 bytes seg_g 	Now not used !!!
    2 bytes sel_digit 	Now not used !!!
    2 bytes send 	Now not used !!!
    2 bytes slot 	Now not used !!!
    2 bytes src 	Now not used !!!
    2 bytes tens 	Now not used !!!
    2 bytes tens_temp 	Now not used !!!
    2 bytes unit 	Now not used !!!
    2 bytes unita
END

IO LIST
    Xalza_E_manuale at 25 0 0
    Xalza_U_manuale at 24 0 0
    Xft_E_sbarra at 14 0 0
    Xft_U_sbarra at 10 0 0
    Xft_entrata at 15 0 0
    Xft_uscita at 9 0 0
    Xp_reset at 13 0 0
    YSeg_A at 2 0 0
    YSeg_B at 3 0 0
    YSeg_C at 4 0 0
    YSeg_D at 5 0 0
    YSeg_E at 6 0 0
    YSeg_F at 11 0 0
    YSeg_G at 12 0 0
    Ycentinaia at 23 0 0
    Ydecine at 16 0 0
    Yunita at 26 0 0
    A at 0 0 0
    I2C1_SCL at 0 0 0
    I2C1_SDA at 0 0 0
END

PROGRAM
RUNG 1
  COMMENT RG 4 Tech - Tutorial Youtube LDmicro - https://www.youtube.com/@rg4tech\r\nparcheggio con 3 display e PCF8574
END
RUNG 2
  CONTACTS Rinit 1 0
  PARALLEL
    MOVE out1 255
    COIL Rinit 0 1 0 0
  END
END
RUNG 3
  TCY Tnew 50000 0
  OSR
  I2C_WR I2C1 out1 - Master 0x38 0 MSB 100000
END
RUNG 4
  CONTACTS Xft_E_sbarra 1 1
  OSF
  CTD C1 0 10 /
  PARALLEL
    COIL Rverde 0 0 0 0
    COIL Rrosso 1 0 0 0
  END
END
RUNG 5
  COMMENT Entrata
END
RUNG 6
  CONTACTS Xft_entrata 1 1
  TON T3 500000 0
  OSR
  NEQ C1 0
  COIL RsbarraE_alza 0 1 0 0
END
RUNG 7
  CONTACTS Xalza_E_manuale 1 1
  OSR
  COIL RsbarraE_alza 0 1 0 0
END
RUNG 8
  CONTACTS RsbarraE_alza 0 0
  THI Tpulse_E_alza 500000 0
  PARALLEL
    SERIES
      CONTACTS ROut_sbarraE_abbassa 1 0
      COIL ROut_sbarraE_alza 0 0 0 0
    END
    COIL Rmem_sbarraE_su 0 1 0 0
    SERIES
      OSF
      COIL RsbarraE_alza 0 0 1 0
    END
  END
END
RUNG 9
  CONTACTS Xft_E_sbarra 1 1
  OSF
  COIL RsbarraE_abbassa 0 1 0 0
END
RUNG 10
  CONTACTS Rforza_sbarraE_giu 0 0
  OSR
  COIL RsbarraE_abbassa 0 1 0 0
END
RUNG 11
  CONTACTS RsbarraE_abbassa 0 0
  THI Tpulse_E_abbassa 500000 0
  PARALLEL
    SERIES
      CONTACTS Xft_E_sbarra 0 1
      PARALLEL
        SERIES
          CONTACTS ROut_sbarraE_alza 1 0
          COIL ROut_sbarraE_abbassa 0 0 0 0
        END
        COIL Rmem_sbarraE_su 0 0 1 0
      END
    END
    SERIES
      OSF
      COIL RsbarraE_abbassa 0 0 1 0
    END
  END
END
RUNG 12
  CONTACTS Rmem_sbarraE_su 0 0
  TON T1 6000000 0
  COIL Rforza_sbarraE_giu 0 0 0 0
END
RUNG 13
  COMMENT Uscita
END
RUNG 14
  CONTACTS Xft_uscita 1 1
  TON T5 500000 0
  OSR
  COIL RsbarraU_alza 0 1 0 0
END
RUNG 15
  CONTACTS Xalza_U_manuale 1 1
  OSR
  COIL RsbarraU_alza 0 1 0 0
END
RUNG 16
  CONTACTS RsbarraU_alza 0 0
  THI Tpulse_U_alza 500000 0
  PARALLEL
    SERIES
      CONTACTS ROut_sbarraU_abbassa 1 0
      COIL ROut_sbarraU_alza 0 0 0 0
    END
    COIL Rmem_sbarraU_su 0 1 0 0
    SERIES
      OSF
      COIL RsbarraU_alza 0 0 1 0
    END
  END
END
RUNG 17
  CONTACTS Xft_U_sbarra 1 1
  OSF
  COIL RsbarraU_abbassa 0 1 0 0
END
RUNG 18
  CONTACTS Rforza_sbarraU_giu 0 0
  OSR
  COIL RsbarraU_abbassa 0 1 0 0
END
RUNG 19
  CONTACTS RsbarraU_abbassa 0 0
  THI Tpulse_U_abbassa 500000 0
  PARALLEL
    SERIES
      CONTACTS Xft_U_sbarra 0 1
      PARALLEL
        SERIES
          CONTACTS ROut_sbarraU_alza 1 0
          COIL ROut_sbarraU_abbassa 0 0 0 0
        END
        COIL Rmem_sbarraU_su 0 0 1 0
      END
    END
    SERIES
      OSF
      COIL RsbarraU_abbassa 0 0 1 0
    END
  END
END
RUNG 20
  CONTACTS Rmem_sbarraU_su 0 0
  TON T2 6000000 0
  COIL Rforza_sbarraU_giu 0 0 0 0
END
RUNG 21
  CONTACTS Xp_reset 1 1
  MOVE C1 10
END
RUNG 22
  CONTACTS Xft_U_sbarra 1 1
  OSF
  CTU C1 10 10 /
END
RUNG 23
  CONTACTS ROut_sbarraE_alza 0 0
  PARALLEL
    SERIES
      OSF
      SET_BIT out1 0
    END
    SERIES
      OSR
      CLEAR_BIT out1 0
    END
  END
END
RUNG 24
  CONTACTS ROut_sbarraE_abbassa 0 0
  PARALLEL
    SERIES
      OSF
      SET_BIT out1 1
    END
    SERIES
      OSR
      CLEAR_BIT out1 1
    END
  END
END
RUNG 25
  CONTACTS ROut_sbarraU_alza 0 0
  PARALLEL
    SERIES
      OSF
      SET_BIT out1 2
    END
    SERIES
      OSR
      CLEAR_BIT out1 2
    END
  END
END
RUNG 26
  CONTACTS ROut_sbarraU_abbassa 0 0
  PARALLEL
    SERIES
      OSF
      SET_BIT out1 3
    END
    SERIES
      OSR
      CLEAR_BIT out1 3
    END
  END
END
RUNG 27
  CONTACTS Rverde 0 0
  PARALLEL
    SERIES
      OSF
      SET_BIT out1 4
    END
    SERIES
      OSR
      CLEAR_BIT out1 4
    END
  END
END
RUNG 28
  CONTACTS Rrosso 0 0
  PARALLEL
    SERIES
      OSF
      SET_BIT out1 5
    END
    SERIES
      OSR
      CLEAR_BIT out1 5
    END
  END
END
RUNG 29
  CONTACTS R6 0 0
  PARALLEL
    SERIES
      OSF
      SET_BIT out1 6
    END
    SERIES
      OSR
      CLEAR_BIT out1 6
    END
  END
END
RUNG 30
  CONTACTS R7 0 0
  PARALLEL
    SERIES
      OSF
      SET_BIT out1 7
    END
    SERIES
      OSR
      CLEAR_BIT out1 7
    END
  END
END
RUNG 31
  PARALLEL
    MOVE numero C1
    DIV cent numero 100
    MOD decine_tmp numero 100
    DIV decine decine_tmp 10
    MOD unita decine_tmp 10
  END
END
RUNG 32
  CONTACTS Ros 1 0
  COIL Ros 0 0 0 0
END
RUNG 33
  CONTACTS Ros 0 0
  CTC Csel_digit 2 0 /
END
RUNG 34
  EQU Csel_digit 0
  PARALLEL
    COIL Yunita 0 0 0 0
    MOVE dgt unita
  END
END
RUNG 35
  EQU Csel_digit 1
  PARALLEL
    COIL Ydecine 0 0 0 0
    MOVE dgt decine
  END
END
RUNG 36
  EQU Csel_digit 2
  PARALLEL
    COIL Ycentinaia 0 0 0 0
    MOVE dgt cent
  END
END
RUNG 37
  7SEGMENTS display dgt C
END
RUNG 38
  AND A display 1
  EQU A 1
  COIL YSeg_A 0 0 0 0
END
RUNG 39
  AND B display 2
  EQU B 2
  COIL YSeg_B 0 0 0 0
END
RUNG 40
  AND C display 4
  EQU C 4
  COIL YSeg_C 0 0 0 0
END
RUNG 41
  AND D display 8
  EQU D 8
  COIL YSeg_D 0 0 0 0
END
RUNG 42
  AND E display 16
  EQU E 16
  COIL YSeg_E 0 0 0 0
END
RUNG 43
  AND F display 32
  EQU F 32
  COIL YSeg_F 0 0 0 0
END
RUNG 44
  AND G display 64
  EQU G 64
  COIL YSeg_G 0 0 0 0
END
