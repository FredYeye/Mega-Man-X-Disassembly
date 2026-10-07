turn_cannon:
    ldx.b 0x01
    jsr (.997F,X)
    lda.b 0x36
    tsb.b 0x11
    jsl 0x849B43
    beq .996B

    bpl .9967

    jsl 0x84A4AB
    lda.b 0x0B
    bmi .9973

    lda.b #0x00
    jsl 0x84A37F
    jml 0x828387

.9967:
    lda.b #0x0E
    trb.b 0x11
.996B:
    jsl _849B03
    jml 0x8280B4

.9973:
    rep #0x10
    ldx.b 0x33
    lda.b #0xFF
    sta.w 0x0035,X
    sep #0x10
    rtl

.997F: d16[.9987, .998B, .99C8, .99F9]

.9987:
    jsl 0x82827D
.998B:
    lda.b 0x11
    and.b #0x0E
    sta.b 0x36
    lda.b #0x05
    sta.b 0x27
    lda.b #0x03
    sta.b 0x26
    sta.b 0x28
    lda.b #0x04
    sta.b 0x12
    stz.b 0x30
    rep #0x20
    lda.w #0xCA50
    sta.b 0x20
    sep #0x20
.99AA:
    lda.b 0x0B
    lsr
    bcs .99B7

    lda.b #0x00
    jsl _848EEA.8F07
    bra .99BD

.99B7:
    lda.b #0x08
    jsl _848EEA.8F07
.99BD:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    lda.b #0x30
    sta.b 0x39
    rts

.99C8:
    dec.b 0x39
    bne .99F4

    inc.b 0x39
    lda.b 0x0F
    bit.b #0x02
    beq .99F4

    lda.b 0x0B
    lsr
    bcs .99E5

    lda.b #0x04
    sta.b 0x02
    lda.b #0x01
    jsl _848EEA.8F07
    bra .99EF

.99E5:
    lda.b #0x06
    sta.b 0x02
    lda.b #0x09
    jsl _848EEA.8F07
.99EF:
    lda.b #0x06
    sta.b 0x01
    rts

.99F4:
    jsl _848EEA
    rts

.99F9:
    jsl _848EEA
    lda.b 0x0B
    bpl .9A0A

    rep #0x10
    ldx.b 0x33
    stz.w 0x0036,X
    sep #0x10
.9A0A:
    lda.b 0x0F
    bmi .99AA

    beq .9A25

    lda.b 0x0B
    bpl .9A1D

    rep #0x10
    ldx.b 0x33
    inc.w 0x0036,X
    sep #0x10
.9A1D:
    lda.b 0x0F
    cmp.b #0x02
    beq .9A26

    bmi .9A5B

.9A25:
    rts

.9A26:
    rep #0x10
    jsl 0x828358
    bne .9A58

    ldy.w #0x0000
    jsr .9A90
    jsl 0x8282D3
    bne .9A58

    ldy.w #0x0000
    jsr .9B3A
    jsl 0x828358
    bne .9A58

    ldy.w #0x0004
    jsr .9A90
    jsl 0x8282D3
    bne .9A58

    ldy.w #0x0004
    jsr .9B3A
.9A58:
    sep #0x10
    rts

.9A5B:
    rep #0x10
    jsl 0x828358
    bne .9A8D

    ldy.w #0x0010
    jsr .9ADB
    jsl 0x8282D3
    bne .9A8D

    ldy.w #0x0010
    jsr .9B3A
    jsl 0x828358
    bne .9A8D

    ldy.w #0x0014
    jsr .9ADB
    jsl 0x8282D3
    bne .9A8D

    ldy.w #0x0014
    jsr .9B3A
.9A8D:
    sep #0x10
    rts

;-----

.9A90:
    inc.w 0x0000,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x11
    ora.b 0x36
    sta.w 0x0011,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b #0x13
    sta.w 0x000A,X
    lda.b #0x05
    sta.w 0x000B,X
    rep #0x20
    tya
    bne .9AB8

    lda.w #0xFE00
    bra .9ABB

.9AB8:
    lda.w #0x0200
.9ABB:
    sta.w 0x001A,X
    lda 0x00CA5F,Y
    clc
    adc.b 0x05
    sta.w 0x0005,X
    iny
    iny
    lda 0x00CA5F,Y
    clc
    adc.b 0x08
    sta.w 0x0008,X
    lda.w #0xCA5A
    sta.w 0x0020,X
    sep #0x20
    rts

;-----

.9ADB:
    inc.w 0x0000,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x11
    ora.b 0x36
    sta.w 0x0011,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b #0x27
    sta.w 0x000A,X
    rep #0x20
    tya
    and.w #0x0004
    bne .9B01

    lda.w #0xFE90
    bra .9B04

.9B01:
    lda.w #0x0170
.9B04:
    sta.w 0x001A,X
    lda.b 0x0B
    lsr
    bcs .9B11

    lda.w #0x0170
    bra .9B1A

.9B11:
    tya
    clc
    adc.w #0x0008
    tay
    lda.w #0xFE90
.9B1A:
    sta.w 0x001C,X
    lda 0x00CA5F,Y
    clc
    adc.b 0x05
    sta.w 0x0005,X
    iny
    iny
    lda 0x00CA5F,Y
    clc
    adc.b 0x08
    sta.w 0x0008,X
    lda.w #0xCA5A
    sta.w 0x0020,X
    sep #0x20
    rts

;-----

.9B3A:
    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    ora.b 0x36
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x0B
    lsr
    bcc .9B59

    tya
    clc
    adc.w #0x0008
    tay
.9B59:
    lda 0x00CA7F,Y
    clc
    adc.b 0x05
    sta.w 0x0005,X
    iny
    iny
    lda 0x00CA7F,Y
    clc
    adc.b 0x08
    sta.w 0x0008,X
    sep #0x20
    rts
