hoganmer:
    ldx.b 0x01
    jsr (.AE8F,X)
    lda.b 0x11
    and.b #0x3F
    ora.b 0x33
    sta.b 0x11
    rtl

.AE8F: d16[.AE95, .AED0, .B0A9]

.AE95:
    jsl 0x82827D
    lda.b #0x08
    sta.b 0x27
    lda.b #0x03
    sta.b 0x26
    sta.b 0x38
    lda.b #0x02
    sta.b 0x12
    sta.b 0x02
    stz.b 0x37
    stz.b 0x2F
    rep #0x20
    lda.w #0xC426
    sta.b 0x20
    ldx.b #0x00
    lda.w 0x0BAD
    cmp.b 0x05
    bcc .AEBF

    ldx.b #0x40
.AEBF:
    stx.b 0x33
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x00
    jsl _848EEA.8F07
    jmp .B0D9

.AED0:
    ldx.b 0x02
    jsr (.AEFA,X)
    lda.l 0x7F8300
    sta.b 0x11
    jsl 0x849B43
    beq .AEF1

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .AEF1

    lda.b #0x04
    sta.b 0x01
    sta.b 0x0B
.AEF1:
    jsl 0x8280B4
    jsl 0x849B03
    rts

.AEFA: d16[.AF04, .AF70, .AF9B, .B01E, .B075]

.AF04:
    ldx.b 0x03
    bne .AF15

    inc.b 0x03
    lda.b #0x3C
    sta.b 0x36
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.AF15:
    jsl 0x82806E
    bcc .AF2E

    rep #0x30
    ldx.b 0x34
    beq .AF27

    stz.w 0x0000,X
    stz.w 0x0002,X
.AF27:
    sep #0x30
    jsl 0x828387
    rts

.AF2E:
    lda.b 0x37
    beq .AF35

    jmp .B0D2

.AF35:
    dec.b 0x38
    bne .AF56

    inc.b 0x38
    rep #0x10
    ldx.b 0x20
    phx
    ldx.w #0xC41E
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .AF51

    jsr .B0C4
.AF51:
    plx
    stx.b 0x20
    sep #0x10
.AF56:
    dec.b 0x36
    bne .AF6F

    lda.b #0x3C
    sta.b 0x36
    rep #0x20
    ldx.b #0x00
    lda.w 0x0BAD
    cmp.b 0x05
    bcc .AF6B

    ldx.b #0x40
.AF6B:
    stx.b 0x33
    sep #0x20
.AF6F:
    rts

.AF70:
    ldx.b 0x03
    jsr (.AF7A,X)
    jsl 0x8491BE
    rts

.AF7A: d16[.AF7E, .AF8D]

.AF7E:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x06
    jsl _848EEA.8F07
    rts

.AF8D:
    lda.b 0x2B
    bit.b #0x04
    beq .AF96

    jmp .B0B8

.AF96:
    jsl update_pos_xy.neg_ay_ax
    rts

.AF9B:
    ldx.b 0x03
    jmp (.AFA0,X)

.AFA0: d16[.AFA8, .AFB9, .AFE5, .AFF4]

.AFA8:
    lda.b #0x02
    sta.b 0x03
    jsl 0x84A07C
    sta.b 0x39
    lda.b #0x02
    jsl _848EEA.8F07
    rts

.AFB9:
    lda.b 0x0F
    bit.b #0x01
    beq .AFCC

    lda.b #0x04
    sta.b 0x03
    stz.b 0x36
    jsr .B109
    beq .AFCC

    inc.b 0x36
.AFCC:
    rep #0x10
    ldx.w #0xC422
    stx.b 0x20
    jsl 0x849B03
    rep #0x10
    ldx.w #0xC426
    stx.b 0x20
    sep #0x10
.AFE0:
    jsl _848EEA
    rts

.AFE5:
    lda.b 0x36
    beq .AFE0

    lda.b #0x06
    sta.b 0x03
    lda.b #0x04
    jsl _848EEA.8F07
    rts

.AFF4:
    lda.b 0x0F
    bpl .AFFF

    lda.b #0x3C
    sta.b 0x38
    jmp .B0B8

.AFFF:
    bit.b #0x01
    beq .B019

    rep #0x20
    lda.w #0xC41A
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    rep #0x20
    lda.w #0xC426
    sta.b 0x20
    sep #0x20
.B019:
    jsl _848EEA
    rts

.B01E:
    ldx.b 0x03
    jsr (.B028,X)
    jsl 0x8491BE
    rts

.B028: d16[.B02C, .B059]

.B02C:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    ldx.b #0x00
    lda.w 0x0BAD
    cmp.b 0x05
    bcc .B03D

    ldx.b #0x40
.B03D:
    stx.b 0x33
    lda.w #0x0150
    bit.b 0x32
    bvs .B049

    lda.w #0xFEB0
.B049:
    sta.b 0x1A
    lda.w #0x0507
    sta.b 0x1C
    sep #0x20
    lda.b #0x06
    jsl _848EEA.8F07
    rts

.B059:
    lda.b 0x2B
    bit.b #0x08
    beq .B062

    jmp .B0BD

.B062:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.b 0x1C
    cmp.w #0x0080
    sep #0x20
    bpl .B074

    jmp .B0BD

.B074:
    rts

.B075:
    ldx.b 0x03
    bne .B086

    inc.b 0x03
    lda.b #0x08
    sta.b 0x36
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.B086:
    dec.b 0x36
    bne .B0A8

    jsr .B0CB
    rep #0x10
    ldx.b 0x20
    phx
    ldx.w #0xC41E
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .B0A3

    jsr .B0C4
.B0A3:
    plx
    stx.b 0x20
    sep #0x10
.B0A8:
    rts

.B0A9:
    lda.b #0x00
    jsl 0x84A37F
    jsl 0x84A4AB
    jsl 0x828398
    rts

.B0B8:
    stz.b 0x02
    stz.b 0x03
    rts

.B0BD:
    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.B0C4:
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.B0CB:
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.B0D2:
    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.B0D9:
    stz.b 0x34
    stz.b 0x35
    jsl 0x8282B9
    bne .B104

    inc.w 0x0000,X
    lda.b #0x03
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x0029,X
    stx.b 0x34
    bra .B106

.B104:
    sta.b 0x37
.B106:
    sep #0x30
    rts

;-----

.B109:
    jsl 0x828358
    bne .B13E

    inc.w 0x0000,X
    lda.b #0x01
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x39
    sta.w 0x0035,X
    rep #0x20
    lda.w #0x0014
    bit.b 0x32
    bvs .B12D

    lda.w #0xFFEC
.B12D:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x0033,X
    sep #0x22
.B13E:
    sep #0x10
    rts
