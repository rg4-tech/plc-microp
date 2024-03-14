LDmicro0.2
MICRO=Atmel AVR ATmega328 28-PDIP
CYCLE=10000 us at Timer0, YPlcCycleDuty:0, ConfigurationWord(s):0x993CD3D700000000
CRYSTAL=8000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILED=C:\Programmi_std\Ladder_micro\Programmi\cancello_elettrico.hex
COMPILER=IHEX

PULL-UP LIST
    PB: 0xFFFFFFFF 
    PC: 0xFFFFFFFF 
    PD: 0xFFFFFFFF 
END

VAR LIST
    2 bytes T1
    2 bytes T2
    1 bytes T3
    1 bytes T4
    2 bytes T5
    2 bytes T6
    1 bytes T7
    1 bytes T8
    1 bytes Tlamp
    2 bytes Tnew 	Now not used !!!
    2 bytes Treset
END

IO LIST
    XFotoc at 2 0 0
    XP_apre at 4 0 0
    XP_chiude at 3 0 0
    XP_telec at 6 0 0
    Xstop at 5 0 0
    YOUT_anta1_AP at 12 0 0
    YOUT_anta1_CH at 13 0 0
    YOUT_anta2_AP at 15 0 0
    YOUT_anta2_CH at 16 0 0
    Ylampeggiante at 11 0 0
    Yserratura at 14 0 0
END

PROGRAM
RUNG 1
  COMMENT --add comment here--
END
RUNG 2
  CONTACTS XFotoc 1 0
  COIL Rfotocellule 0 0 0 0
END
RUNG 3
  PARALLEL
    CONTACTS XP_apre 1 1
    CONTACTS XP_telec 1 1
  END
  CONTACTS Rfotocellule 0 0
  PARALLEL
    COIL RON_ciclo 0 1 0 0
    COIL Rstop 0 0 1 0
  END
END
RUNG 4
  CONTACTS RON_ciclo 0 0
  THI T6 1500000 0
  COIL Yserratura 0 0 0 0
END
RUNG 5
  CONTACTS RON_ciclo 0 0
  CONTACTS Rpausa 1 0
  TCY Tlamp 400000 0
  COIL Ylampeggiante 0 0 0 0
END
RUNG 6
  COMMENT Anta 1 APRE
END
RUNG 7
  CONTACTS RON_ciclo 0 0
  GRT T6 100
  OSR
  COIL Ranta1_AP 0 1 0 0
END
RUNG 8
  CONTACTS Ranta1_AP 0 0
  CONTACTS Rfotocellule 0 0
  CONTACTS Rstop 1 0
  CONTACTS YOUT_anta1_CH 1 0
  COIL YOUT_anta1_AP 0 0 0 0
END
RUNG 9
  COMMENT Anta 2 APRE (parte tempo apertura T1)
END
RUNG 10
  CONTACTS YOUT_anta1_AP 0 0
  RTO T3 1000000 0
  COIL Ranta2_AP 0 1 0 0
END
RUNG 11
  CONTACTS Ranta2_AP 0 0
  CONTACTS Rfotocellule 0 0
  CONTACTS Rstop 1 0
  CONTACTS YOUT_anta2_CH 1 0
  COIL YOUT_anta2_AP 0 0 0 0
END
RUNG 12
  COMMENT Inizio pausa (al termine di T1)
END
RUNG 13
  CONTACTS YOUT_anta1_AP 0 0
  RTO T1 8000000 0
  PARALLEL
    COIL Ranta1_AP 0 0 1 0
    COIL Ranta2_AP 0 0 1 0
    COIL Rpausa 0 1 0 0
    RES T3
  END
END
RUNG 14
  COMMENT Fine pausa (anta 2 chiude)
END
RUNG 15
  CONTACTS Rpausa 0 0
  CONTACTS Rfotocellule 0 0
  CONTACTS Rstop 1 0
  TON T5 3000000 0
  PARALLEL
    COIL Ranta2_CH 0 1 0 0
    COIL Rpausa 0 0 1 0
    RES T1
  END
END
RUNG 16
  CONTACTS Ranta2_CH 0 0
  CONTACTS Rfotocellule 0 0
  CONTACTS Rstop 1 0
  CONTACTS YOUT_anta2_AP 1 0
  COIL YOUT_anta2_CH 0 0 0 0
END
RUNG 17
  COMMENT Anta 1 chiude
END
RUNG 18
  CONTACTS YOUT_anta2_CH 0 0
  RTO T4 1000000 0
  COIL Ranta1_CH 0 1 0 0
END
RUNG 19
  CONTACTS Ranta1_CH 0 0
  CONTACTS Rfotocellule 0 0
  CONTACTS Rstop 1 0
  CONTACTS YOUT_anta1_AP 1 0
  COIL YOUT_anta1_CH 0 0 0 0
END
RUNG 20
  COMMENT Fine ciclo (a fine T2)
END
RUNG 21
  CONTACTS YOUT_anta2_CH 0 0
  RTO T2 8000000 0
  PARALLEL
    COIL Ranta1_CH 0 0 1 0
    COIL Ranta2_CH 0 0 1 0
    COIL RON_ciclo 0 0 1 0
    RES T4
    RES T2
  END
END
RUNG 22
  COMMENT Pulsante di stop
END
RUNG 23
  CONTACTS Xstop 1 1
  COIL Rstop 0 0 0 1
END
RUNG 24
  CONTACTS Xstop 1 1
  TON Treset 3000000 0
  PARALLEL
    COIL RON_ciclo 0 0 1 0
    COIL Ranta1_AP 0 0 1 0
    COIL Ranta2_AP 0 0 1 0
    COIL Ranta1_CH 0 0 1 0
    COIL Ranta2_CH 0 0 1 0
    COIL Rpausa 0 0 1 0
    RES T1
    RES T2
    RES T3
    RES T4
  END
END
RUNG 25
  COMMENT Pulsante chiude
END
RUNG 26
  CONTACTS XP_chiude 1 1
  CONTACTS RON_ciclo 0 0
  PARALLEL
    CONTACTS Ranta1_AP 0 0
    CONTACTS Ranta2_AP 0 0
    CONTACTS Xstop 0 0
  END
  PARALLEL
    COIL Rman_chiude 0 1 0 0
    COIL Rstop 0 0 1 0
  END
END
RUNG 27
  CONTACTS Rman_chiude 0 0
  PARALLEL
    COIL Ranta1_AP 0 0 1 0
    COIL Ranta2_AP 0 0 1 0
    RES T1
    RES T3
  END
END
RUNG 28
  CONTACTS Rman_chiude 0 0
  TON T7 500000 0
  PARALLEL
    COIL Ranta2_CH 0 1 0 0
    COIL Rman_chiude 0 0 1 0
  END
END
RUNG 29
  COMMENT Pulsante apre o telecomando (mentre il cancello \\xE8 in chiusura)
END
RUNG 30
  PARALLEL
    CONTACTS XP_apre 1 1
    CONTACTS XP_telec 1 1
  END
  PARALLEL
    CONTACTS Ranta1_CH 0 0
    CONTACTS Ranta2_CH 0 0
  END
  PARALLEL
    COIL Rman_apre 0 1 0 0
    COIL Rstop 0 0 1 0
  END
END
RUNG 31
  CONTACTS Rman_apre 0 0
  PARALLEL
    COIL Ranta1_CH 0 0 1 0
    COIL Ranta2_CH 0 0 1 0
    RES T2
    RES T3
    RES T4
  END
END
RUNG 32
  CONTACTS Rman_apre 0 0
  TON T8 500000 0
  PARALLEL
    COIL Ranta1_AP 0 1 0 0
    COIL Rman_apre 0 0 1 0
  END
END
