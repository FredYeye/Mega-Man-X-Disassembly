rangda_bangda_eye:
    ldx.b 0x01
    jmp (.AE10,X)

.AE10: d16[.AE16, .AE3D, .B133]

.AE16:
    jsl 0x82827D
    lda.b #0x06
    sta.b 0x12
    lda.b #0x07
    sta.b 0x28
    lda.b #0x0A
    sta.b 0x27
    lda.b #0x06
    sta.b 0x26
    lda.b #0x3A
    sta.b 0x20
    lda.b #0xD5
    sta.b 0x21
    stz.b 0x33
    stz.b 0x3C
    lda.b 0x11
    and.b #0xEF
    sta.b 0x3B
    rtl

.AE3D:
    lda.b 0x3B
    sta.b 0x11
    ldx.b 0x02
    jsr (.AE89,X)
    lda.b #0x01
    sta.b 0x30
    bit.b 0x33
    bvs .AE79

    stz.b 0x30
    jsl 0x849B43
    beq .AE75

    bpl .AE63

    lda.b #0x04
    sta.b 0x01
    jsr .B1D0
    jsl 0x84A4AB
.AE63:
    lda.b #0x0E
    trb.b 0x11
    lda.b #0x13
    jsl _80888B
    lda.b #0x05
    sta.b 0x28
    lda.b #0x3C
    sta.b 0x3C
.AE75:
    jsl _849B03
.AE79:
    lda.b 0x3C
    beq .AE85

    dec.b 0x3C
    bne .AE85

    lda.b #0x07
    sta.b 0x28
.AE85:
    jml 0x8280B4

.AE89: d16[.AE93, .AF6E, .AEAD, .AFDD, .B0AB]

.AE93:
    ldx.b 0x03
    bne .AEAC

    inc.b 0x03
    lda.b #0x06
    sta.b 0x12
    ldx.b 0x0B
    stz.w 0x1F3F,X
    lda.b #0x40
    tsb.b 0x33
    lda.b #0x00
    jsl _848EEA.8F07
.AEAC:
    rts

.AEAD:
    ldx.b 0x03
    jmp (.AEB2,X)

.AEB2: d16[.AEBE, .AED9, .AF21, .AF36, .AF42, .AF61]

.AEBE:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x04
    sta.b 0x12
    lda.b 0x11
    and.b #0xF1
    ora.b #0x0A
    sta.b 0x11
    sta.b 0x3B
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .B1C8

.AED9:
    lda.b 0x0F
    bpl .AF1C

    lda.b #0x04
    sta.b 0x03
    lda.b #0x40
    trb.b 0x33
    jsl 0x84A07C
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EEBA,X
    sta.b 0x1A
    lda.w 0x00EEBC,X
    sta.b 0x1C
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    lda.w 0x0BAD
    sta.w 0x0004
    lda.w 0x0BB0
    sta.w 0x0006
    jsl _80CEAE
    lda.w 0x0000
    lsr
    sta.b 0x34
    sta.b 0x36
    sep #0x20
.AF1C:
    jsl _848EEA
    rts

.AF21:
    jsl 0x82820A
    rep #0x20
    dec.b 0x34
    sep #0x20
    bne .AF35

    lda.b #0x06
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x38
.AF35:
    rts

.AF36:
    dec.b 0x38
    bne .AF41

    lda.b #0x08
    sta.b 0x03
    jmp .B152

.AF41:
    rts

.AF42:
    rep #0x20
    dec.b 0x36
    sep #0x20
    bne .AF5C

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x40
    tsb.b 0x33
    jsr .B167
    lda.b #0x10
    jsl _848EEA.8F07
    rts

.AF5C:
    jsl 0x82820A
    rts

.AF61:
    lda.b 0x0F
    bpl .AF69

    stz.b 0x02
    stz.b 0x03
.AF69:
    jsl _848EEA
    rts

.AF6E:
    ldx.b 0x03
    jmp (.AF73,X)

.AF73: d16[.AF7D, .AF96, .AFAB, .AFBD, .AFD0]

.AF7D:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x04
    sta.b 0x12
    lda.b 0x11
    and.b #0xF9
    sta.b 0x11
    sta.b 0x3B
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .B1C8

.AF96:
    lda.b 0x0F
    bpl .AFA6

    lda.b #0x04
    sta.b 0x03
    lda.b #0x40
    trb.b 0x33
    lda.b #0x0F
    sta.b 0x38
.AFA6:
    jsl _848EEA
    rts

.AFAB:
    dec.b 0x38
    bne .AFBC

    lda.b #0x06
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x38
    lda.b #0x00
    jsr .B17E
.AFBC:
    rts

.AFBD:
    dec.b 0x38
    bne .AFCF

    lda.b #0x08
    sta.b 0x03
    lda.b #0x40
    tsb.b 0x33
    lda.b #0x10
    jsl _848EEA.8F07
.AFCF:
    rts

.AFD0:
    lda.b 0x0F
    bpl .AFD8

    stz.b 0x02
    stz.b 0x03
.AFD8:
    jsl _848EEA
    rts

.AFDD:
    ldx.b 0x03
    jmp (.AFE2,X)

.AFE2: d16[.AFF0, .B00B, .B020, .B061, .B075, .B083, .B09E]

.AFF0:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x04
    sta.b 0x12
    lda.b 0x11
    and.b #0xF1
    ora.b #0x0C
    sta.b 0x11
    sta.b 0x3B
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .B1C8

.B00B:
    lda.b 0x0F
    bpl .B01B

    lda.b #0x04
    sta.b 0x03
    lda.b #0x40
    trb.b 0x33
    lda.b #0x0F
    sta.b 0x38
.B01B:
    jsl _848EEA
    rts

.B020:
    dec.b 0x38
    bne .B060

    lda.b #0x06
    sta.b 0x03
    jsl get_rng
    and.b #0x1C
    tax
    lda.w 0x00D53E,X
    sta.b 0x34
    lda.w 0x00D53F,X
    sta.b 0x38
    lda.w 0x00D540,X
    jsr .B17E
    lda.b 0x38
    jsr .B17E
    lda.b 0x34
    sta.b 0x39
    jsr .B13E
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EEBA,X
    sta.b 0x1A
    lda.w 0x00EEBC,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x3C
    sta.b 0x38
.B060:
    rts

.B061:
    dec.b 0x38
    bne .B070

    lda.b #0x08
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x38
    jmp .B152

.B070:
    jsl 0x82820A
    rts

.B075:
    dec.b 0x38
    bne .B082

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x38
    rts

.B082:
    rts

.B083:
    dec.b 0x38
    bne .B099

    lda.b #0x0C
    sta.b 0x03
    lda.b #0x40
    tsb.b 0x33
    jsr .B167
    lda.b #0x10
    jsl _848EEA.8F07
    rts

.B099:
    jsl 0x82820A
    rts

.B09E:
    lda.b 0x0F
    bpl .B0A6

    stz.b 0x02
    stz.b 0x03
.B0A6:
    jsl _848EEA
    rts

.B0AB:
    ldx.b 0x03
    jmp (.B0B0,X)

.B0B0: d16[.B0BA, .B0D5, .B0EA, .B119, .B126]

.B0BA:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x04
    sta.b 0x12
    lda.b 0x11
    and.b #0xF1
    ora.b #0x0C
    sta.b 0x11
    sta.b 0x3B
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .B1C8

.B0D5:
    lda.b 0x0F
    bpl .B0E5

    lda.b #0x04
    sta.b 0x03
    lda.b #0x40
    trb.b 0x33
    lda.b #0x0F
    sta.b 0x38
.B0E5:
    jsl _848EEA
    rts

.B0EA:
    dec.b 0x38
    bne .B118

    dec.b 0x3A
    bne .B101

    lda.b #0x08
    sta.b 0x03
    lda.b #0x40
    tsb.b 0x33
    lda.b #0x10
    jsl _848EEA.8F07
    rts

.B101:
    lda.b #0x06
    sta.b 0x03
    lda.b #0x5A
    sta.b 0x38
    lda.b #0x00
    jsr .B17E
    lda.b #0x02
    jsr .B17E
    lda.b #0xFE
    jmp .B17E

.B118:
    rts

.B119:
    dec.b 0x38
    bne .B125

    lda.b #0x04
    sta.b 0x03
    lda.b #0x01
    sta.b 0x38
.B125:
    rts

.B126:
    lda.b 0x0F
    bpl .B12E

    stz.b 0x02
    stz.b 0x03
.B12E:
    jsl _848EEA
    rts

.B133:
    ldx.b 0x0B
    lda.b #0x80
    sta.w 0x1F3F,X
    jml 0x828398

.B13E:
    jsl 0x84A07C
    clc
    adc.b 0x39
    bpl .B14A

    clc
    adc.b #0x20
.B14A:
    cmp.b #0x20
    bmi .B151

    sec
    sbc.b #0x20
.B151:
    rts

.B152:
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
    rts

.B167:
    rep #0x20
    lda.b 0x0B
    and.w #0x00FF
    asl
    asl
    tax
    lda.w 0x00D4EF,X
    sta.b 0x05
    lda.w 0x00D4F1,X
    sta.b 0x08
    sep #0x20
    rts

.B17E:
    sta.w 0x0000
    jsl 0x828358
    bne .B1C5

    inc.w 0x0000,X
    lda.b #0x26
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0xF9
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    phx
    lda.w 0x0000
    sta.b 0x39
    jsr .B13E
    plx
    rep #0x20
    and.w #0x00FF
    asl
    asl
    tay
    lda 0x00EEBA,Y
    sta.w 0x001A,X
    lda 0x00EEBC,Y
    sta.w 0x001C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
.B1C5:
    sep #0x10
    rts

.B1C8:
    ldx.b 0x0B
    lda.b #0x01
    sta.w 0x1F3F,X
    rts

;-----

.B1D0:
    rep #0x10
    lda.b 0x11
    ora.b #0x20
    sta.l 0x7F838F
    ldy.w #0x000F
.B1DD:
    jsl 0x8282D3
    bne .B213

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    eor.b #0x40
    sta.b 0x11
    jsl get_rng
    and.b #0x01
    clc
    adc.b #0x5B
    ora.b #0x80
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dey
    bpl .B1DD

.B213:
    sep #0x10
    rts
