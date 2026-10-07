snow_shooter:
    ldx.b 0x01
    jsr (.DEF9,X)
    lda.b 0x27
    beq .DED2

    jsl 0x849B43
    beq .DEC8

    lda.b 0x27
    and.b #0x7F
    bne .DEC0

    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0020
    sta.b 0x08
    sep #0x20
    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
    bra .DEF4

.DEC0:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .DECE

.DEC8:
    lda.b 0x34
    ora.b 0x11
    sta.b 0x11
.DECE:
    jsl _849B03
.DED2:
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0020
    sta.b 0x08
    sep #0x20
    jsl _82808F.80B4
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0020
    sta.b 0x08
    sep #0x20
    jsl 0x82806E
    bcc .DEF8

.DEF4:
    jsl 0x828387
.DEF8:
    rtl

.DEF9: d16[.DEFF, .DF31, .DFB0]

.DEFF:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x34
    jsl _879ED4
    lda.b #0x08
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x03
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    rep #0x20
    lda.w #0xD432
    sta.b 0x20
    sep #0x20
    lda.b #0x14
    sta.b 0x33
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.DF31:
    lda.b 0x33
    cmp.b #0x15
    bmi .DF3B

    jsl _879ED4
.DF3B:
    lda.b 0x33
    cmp.b #0x14
    beq .DF56

    dec.b 0x33
    bne .DFAF

    lda.b #0x04
    sta.b 0x01
    lda.b #0x30
    sta.b 0x33
    lda.b #0x00
    jsl _848EEA.8F07
    jmp .DFAF

.DF56:
    dec.b 0x33
    jsl 0x84A07C
    sta.b 0x35
    lda.b 0x11
    and.b #0x40
    bne .DF71

    lda.b #0x14
    sta.w 0x0000
    lda.b #0x1C
    sta.w 0x0002
    jmp .DF7B

.DF71:
    lda.b #0x04
    sta.w 0x0000
    lda.b #0x0C
    sta.w 0x0002
.DF7B:
    lda.b 0x35
    cmp.w 0x0000
    bmi .DFAB

    lda.b 0x35
    cmp.w 0x0002
    bpl .DFAB

    lda.b 0x35
    asl
    asl
    tax
    rep #0x20
    lda.w 0x86EE3A,X
    asl
    bpl .DF99

    ora.w #0xF000
.DF99:
    sta.b 0x1A
    lda.w 0x86EE3C,X
    asl
    bpl .DFA4

    ora.w #0xF000
.DFA4:
    sta.b 0x1C
    sep #0x20
    jmp .DFAF

.DFAB:
    lda.b #0x5A
    sta.b 0x33
.DFAF:
    rts

.DFB0:
    dec.b 0x33
    bne .DFC8

    lda.b #0x02
    sta.b 0x01
    lda.b #0x5A
    sta.b 0x33
    jsr .DFCD
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .DFCC

.DFC8:
    jsl _848EEA
.DFCC:
    rts

;-----

.DFCD:
    rep #0x10
    jsl 0x828358
    bne .E034

    inc.w 0x0000,X
    lda.b #0x23
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x34
    ora.b 0x11
    sta.w 0x0011,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b #0x02
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    beq .E00A

    rep #0x20
    lda.w #0xFFF0
    sta.w 0x0000
    lda.w #0x0000
    sta.w 0x0002
    jmp .E018

.E00A:
    rep #0x20
    lda.w #0xFFF0
    sta.w 0x0000
    lda.w #0x0000
    sta.w 0x0002
.E018:
    lda.b 0x05
    clc
    adc.w 0x0002
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w 0x0000
    sta.w 0x0008,X
    lda.b 0x1A
    sta.w 0x001A,X
    lda.b 0x1C
    sta.w 0x001C,X
.E034:
    sep #0x30
    rts
