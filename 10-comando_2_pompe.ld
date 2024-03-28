LDmicro0.2
MICRO=Atmel AVR ATmega328 28-PDIP
CYCLE=10000 us at Timer0, YPlcCycleDuty:0, ConfigurationWord(s):0x3640BA2600000000
CRYSTAL=8000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILED=C:\Programmi_std\Ladder_micro\Programmi\comando_2_pompe.hex
COMPILER=IHEX

PULL-UP LIST
    PB: 0xFFFFFFFF 
    PC: 0xFFFFFFFF 
    PD: 0xFFFFFFFF 
END

VAR LIST
    1 bytes TClock
    2 bytes Tnew 	Now not used !!!
END

IO LIST
    Xgall_MAX at 3 0 0
    Xgall_MIN at 2 0 0
    Xliv_allarme at 4 0 0
    Xliv_emerg at 16 0 0
    Xsalvamotore1 at 14 0 0
    Xsalvamotore2 at 15 0 0
    Xsel_MAN1 at 5 0 0
    Xsel_MAN2 at 12 0 0
    Xsel_auto1 at 6 0 0
    Xsel_auto2 at 13 0 0
    Ymotore1 at 23 0 0
    Ymotore2 at 24 0 0
    Ysirena at 27 0 0
    Yspia_livello_all at 28 0 0
    Yspia_salvamotore1 at 25 0 0
    Yspia_salvamotore2 at 26 0 0
END

PROGRAM
RUNG 1
  COMMENT RG 4 Tech - Tutorial Youtube LDmicro - https://www.youtube.com/@rg4tech\r\nComando di 2 pompa di svuotamento con alternanza
END
RUNG 2
  COMMENT ON/OFF galleggianti
END
RUNG 3
  CONTACTS Xgall_MIN 1 1
  PARALLEL
    CONTACTS Xgall_MAX 1 1
    CONTACTS RON_gall 0 0
  END
  COIL RON_gall 0 0 0 0
END
RUNG 4
  CONTACTS RON_gall 0 0
  COIL Raltnz_pompe 0 0 0 1
END
RUNG 5
  COMMENT Comando motore pompa 1
END
RUNG 6
  PARALLEL
    CONTACTS Xsel_MAN1 1 1
    SERIES
      CONTACTS Xsel_auto1 1 1
      CONTACTS RON_gall 0 0
      PARALLEL
        CONTACTS Raltnz_pompe 0 0
        CONTACTS Xliv_emerg 1 1
      END
    END
  END
  CONTACTS Xsalvamotore1 0 1
  COIL Ymotore1 0 0 0 0
END
RUNG 7
  COMMENT Comando motore pompa 2
END
RUNG 8
  PARALLEL
    CONTACTS Xsel_MAN2 1 1
    SERIES
      CONTACTS Xsel_auto2 1 1
      CONTACTS RON_gall 0 0
      PARALLEL
        CONTACTS Raltnz_pompe 1 0
        CONTACTS Xliv_emerg 1 1
      END
    END
  END
  CONTACTS Xsalvamotore2 0 1
  COIL Ymotore2 0 0 0 0
END
RUNG 9
  COMMENT Segnalazioni
END
RUNG 10
  PARALLEL
    CONTACTS Xliv_allarme 1 1
    CONTACTS Xliv_emerg 1 1
    CONTACTS Xsalvamotore1 1 1
    CONTACTS Xsalvamotore2 1 1
  END
  COIL Ysirena 0 0 0 0
END
RUNG 11
  TCY TClock 400000 0
  COIL Rclock 0 0 0 0
END
RUNG 12
  PARALLEL
    CONTACTS Xliv_allarme 1 1
    CONTACTS Xliv_emerg 1 1
  END
  CONTACTS Rclock 0 0
  COIL Yspia_livello_all 0 0 0 0
END
RUNG 13
  CONTACTS Xsalvamotore1 1 1
  CONTACTS Rclock 0 0
  COIL Yspia_salvamotore1 0 0 0 0
END
RUNG 14
  CONTACTS Xsalvamotore2 1 1
  CONTACTS Rclock 0 0
  COIL Yspia_salvamotore2 0 0 0 0
END
