   0:# INIT TABLES
   1:INIT TABLE signed 1 byte char7seg[129] := {63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113, 191, 134, 219, 207, 230, 237, 253, 135, 255, 239, 247, 252, 185, 222, 249, 241, 0, 176, 34, 78, 109, 210, 218, 32, 57, 15, 114, 112, 12, 64, 128, 82, 63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 9, 13, 97, 65, 67, 211, 159, 119, 124, 57, 94, 121, 113, 61, 116, 48, 30, 117, 56, 85, 84, 92, 115, 103, 51, 109, 120, 62, 28, 106, 118, 110, 91, 57, 100, 15, 35, 8, 32, 95, 124, 88, 94, 123, 113, 111, 116, 16, 14, 117, 24, 85, 84, 92, 115, 103, 80, 109, 120, 62, 28, 106, 118, 110, 91, 57, 48, 15, 1, 0, 99}
   2:# INIT VARS
   3:if not '$once_0_INIT_VARS' {
   4:    set bit '$once_0_INIT_VARS'
   5:    let var 'C1' := 9
   6:    let var 'C1' := 0
   7:}
  20:# 
  21:# ======= START RUNG 1 =======
  22:LabelRung1:
  23:
  24:# RG 4 Tech - Tutorial Youtube LDmicro - https://www.youtube.com
  25:# Display UP - DOWN
  26:# 
  27:# ======= START RUNG 2 =======
  28:LabelRung2:
  29:
  30:set bit '$rung_top'
  32:# start series [
  33:# ELEM_CONTACTS
  34:if not 'Xconteggio_DW' {
  35:    clear bit '$rung_top'
  36:}
  38:# ELEM_CTR
  39:if '$rung_top' {
  40:    clear bit '$rung_top'
  41:    if not '$once_1_CTR_C1' {
  42:        set bit '$once_1_CTR_C1'
  43:        decrement 'C1'
  44:        if 'C1' < '0' {
  45:            let var 'C1' := 9
  46:            set bit '$rung_top'
  47:        }
  48:    }
  49:} else {
  50:    clear bit '$once_1_CTR_C1'
  51:}
  53:# ] finish series
  54:# 
  55:# ======= START RUNG 3 =======
  56:LabelRung3:
  57:
  58:set bit '$rung_top'
  60:# start series [
  61:# ELEM_CONTACTS
  62:if not 'Xconteggio_UP' {
  63:    clear bit '$rung_top'
  64:}
  66:# ELEM_CTC
  67:if '$rung_top' {
  68:    clear bit '$rung_top'
  69:    if not '$once_2_CTC_C1' {
  70:        set bit '$once_2_CTC_C1'
  71:        increment 'C1'
  72:        if 'C1' > '9' {
  73:            let var 'C1' := 0
  74:            set bit '$rung_top'
  75:        }
  76:    }
  77:} else {
  78:    clear bit '$once_2_CTC_C1'
  79:}
  81:# ] finish series
  82:# 
  83:# ======= START RUNG 4 =======
  84:LabelRung4:
  85:
  86:set bit '$rung_top'
  88:# start series [
  89:# ELEM_7SEG
  90:if '$rung_top' {
  91:    let var '$scratch' := 176
  92:    if 'C1' == '$scratch' {
  93:        let var 'C1' := 128
  94:    } else {
  95:        if 'C1' < '0' {
  96:            let var 'C1' := 32
  97:        } else {
  98:            if 'C1' < '129' {
  99:            } else {
 100:                let var 'C1' := 32
 101:            }
 102:        }
 103:    }
 104:    let var '$scratch' := 'char7seg[C1]'
 105:    let var 'display' := '$scratch'
 106:}
 108:# ] finish series
 109:# 
 110:# ======= START RUNG 5 =======
 111:LabelRung5:
 112:
 113:set bit '$rung_top'
 115:# start series [
 116:# ELEM_AND
 117:if '$rung_top' {
 118:    let var 'A' := 'display' & '1'
 119:}
 121:# ELEM_EQU
 122:if '$rung_top' {
 123:    if 'A' != '1' {
 124:        clear bit '$rung_top'
 125:    }
 126:}
 128:# ELEM_COIL
 129:let bit 'YSeg_A' := '$rung_top'
 131:# ] finish series
 132:# 
 133:# ======= START RUNG 6 =======
 134:LabelRung6:
 135:
 136:set bit '$rung_top'
 138:# start series [
 139:# ELEM_AND
 140:if '$rung_top' {
 141:    let var 'B' := 'display' & '2'
 142:}
 144:# ELEM_EQU
 145:if '$rung_top' {
 146:    if 'B' != '2' {
 147:        clear bit '$rung_top'
 148:    }
 149:}
 151:# ELEM_COIL
 152:let bit 'YSeg_B' := '$rung_top'
 154:# ] finish series
 155:# 
 156:# ======= START RUNG 7 =======
 157:LabelRung7:
 158:
 159:set bit '$rung_top'
 161:# start series [
 162:# ELEM_AND
 163:if '$rung_top' {
 164:    let var 'C' := 'display' & '4'
 165:}
 167:# ELEM_EQU
 168:if '$rung_top' {
 169:    if 'C' != '4' {
 170:        clear bit '$rung_top'
 171:    }
 172:}
 174:# ELEM_COIL
 175:let bit 'YSeg_C' := '$rung_top'
 177:# ] finish series
 178:# 
 179:# ======= START RUNG 8 =======
 180:LabelRung8:
 181:
 182:set bit '$rung_top'
 184:# start series [
 185:# ELEM_AND
 186:if '$rung_top' {
 187:    let var 'D' := 'display' & '8'
 188:}
 190:# ELEM_EQU
 191:if '$rung_top' {
 192:    if 'D' != '8' {
 193:        clear bit '$rung_top'
 194:    }
 195:}
 197:# ELEM_COIL
 198:let bit 'YSeg_D' := '$rung_top'
 200:# ] finish series
 201:# 
 202:# ======= START RUNG 9 =======
 203:LabelRung9:
 204:
 205:set bit '$rung_top'
 207:# start series [
 208:# ELEM_AND
 209:if '$rung_top' {
 210:    let var 'E' := 'display' & '16'
 211:}
 213:# ELEM_EQU
 214:if '$rung_top' {
 215:    if 'E' != '16' {
 216:        clear bit '$rung_top'
 217:    }
 218:}
 220:# ELEM_COIL
 221:let bit 'YSeg_E' := '$rung_top'
 223:# ] finish series
 224:# 
 225:# ======= START RUNG 10 =======
 226:LabelRung10:
 227:
 228:set bit '$rung_top'
 230:# start series [
 231:# ELEM_AND
 232:if '$rung_top' {
 233:    let var 'F' := 'display' & '32'
 234:}
 236:# ELEM_EQU
 237:if '$rung_top' {
 238:    if 'F' != '32' {
 239:        clear bit '$rung_top'
 240:    }
 241:}
 243:# ELEM_COIL
 244:let bit 'YSeg_F' := '$rung_top'
 246:# ] finish series
 247:# 
 248:# ======= START RUNG 11 =======
 249:LabelRung11:
 250:
 251:set bit '$rung_top'
 253:# start series [
 254:# ELEM_AND
 255:if '$rung_top' {
 256:    let var 'G' := 'display' & '64'
 257:}
 259:# ELEM_EQU
 260:if '$rung_top' {
 261:    if 'G' != '64' {
 262:        clear bit '$rung_top'
 263:    }
 264:}
 266:# ELEM_COIL
 267:let bit 'YSeg_G' := '$rung_top'
 269:# ] finish series
 270:LabelRung12:
 271:
 272:# Latest INT_OP here
