LDmicro0.2
MICRO=Atmel AVR ATmega328 28-PDIP
CYCLE=10000 us at Timer0, YPlcCycleDuty:0, ConfigurationWord(s):0x76FA345D00000000
CRYSTAL=8000000 Hz
BAUD=9600 Hz, RATE=1000000 Hz, SPEED=100000 Hz
COMPILED=C:\Programmi_std\Ladder_micro\Programmi\comando_1_pompa.hex
COMPILER=IHEX

PULL-UP LIST
    PB: 0xFFFFFFFF 
    PC: 0xFFFFFFFF 
    PD: 0xFFFFFFFF 
END

VAR LIST
    1 bytes TClock 	Now not used !!!
    2 bytes Tnew 	Now not used !!!
END

IO LIST
    Xgall_MAX at 3 0 0
    Xgall_MIN at 2 0 0
    Xliv_allarme at 4 0 0
    Xsalvamotore at 12 0 0
    Xsel_MAN at 5 0 0
    Xsel_auto at 6 0 0
    Ymotore at 13 0 0
    Ysirena at 23 0 0
    Yspia_ON_pompa at 14 0 0
    Yspia_livello_all at 16 0 0
    Yspia_salvamotore at 15 0 0
END

PROGRAM
RUNG 1
  COMMENT RG 4 Tech - Tutorial Youtube LDmicro - https://www.youtube.com/@rg4tech\r\nComando di 1 pompa di svuotamento
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
  COMMENT Comando motore
END
RUNG 5
  PARALLEL
    CONTACTS Xsel_MAN 1 1
    SERIES
      CONTACTS Xsel_auto 1 1
      CONTACTS RON_gall 0 0
    END
  END
  CONTACTS Xsalvamotore 0 1
  PARALLEL
    COIL Ymotore 0 0 0 0
    COIL Yspia_ON_pompa 0 0 0 0
  END
END
RUNG 6
  COMMENT Segnalazioni
END
RUNG 7
  PARALLEL
    CONTACTS Xliv_allarme 1 1
    CONTACTS Xsalvamotore 1 1
  END
  COIL Ysirena 0 0 0 0
END
RUNG 8
  TCY TClock 400000 0
  COIL Rclock 0 0 0 0
END
RUNG 9
  CONTACTS Xliv_allarme 1 1
  CONTACTS Rclock 0 0
  COIL Yspia_livello_all 0 0 0 0
END
RUNG 10
  CONTACTS Xsalvamotore 1 1
  CONTACTS Rclock 0 0
  COIL Yspia_salvamotore 0 0 0 0
END
