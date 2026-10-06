sea_attacker:
    ldx.b 0x01
    jsr (.A1CD,X)
    lda.b 0x27
    beq .A1BE

    jsl 0x849B43
    beq .A1B2

    lda.b 0x27
    and.b #0x7F
    bne .A1A6

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    bra .A1BE

.A1A6:
    lda.b 0x01
    sta.b 0x03
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .A1B8

.A1B2:
    lda.b 0x34
    ora.b 0x11
    sta.b 0x11
.A1B8:
    jsl 0x849B03
    beq .A1BE

.A1BE:
    jsl 0x8280B4
    jsl 0x82806E
    bcc .A1CC

    jsl 0x828398
.A1CC:
    rtl

.A1CD: d16[.A1D5, .A206, .A254, .A2CF]

.A1D5:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x34
    lda.b #0x02
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x3C
    sta.b 0x37
    jsr .A2E0
    rep #0x20
    lda.w #0xCB27
    sta.b 0x20
    lda.b 0x05
    sta.b 0x3C
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.A206:
    ldx.b 0x02
    jsr (.A20C,X)
    rts

.A20C: d16[.A210, .A232]

.A210:
    lda.b #0x04
    sta.b 0x12
    ldx.b 0x33
    lda.b 0x0B
    beq .A221

    rep #0x20
    lda.w 0x00CB19,X
    bra .A226

.A221:
    rep #0x20
    lda.w 0x00CB13,X
.A226:
    clc
    adc.b 0x08
    sta.b 0x38
    sep #0x20
    lda.b #0x02
    sta.b 0x02
    rts

.A232:
    jsl update_pos_y
    rep #0x20
    lda.b 0x08
    cmp.b 0x38
    bne .A24D

    lda.w #0x0004
    sta.b 0x01
    lda.w #0x0000
    sta.b 0x02
    lda.w #0x003C
    sta.b 0x3A
.A24D:
    sep #0x20
    jsl _848EEA
    rts

.A254:
    ldx.b 0x02
    jsr (.A25A,X)
    rts

.A25A: d16[.A260, .A282, .A2A7]

.A260:
    dec.b 0x3A
    lda.b 0x3A
    cmp.b #0x28
    bne .A281

    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x02
    lda.b 0x11
    ora.b #0x30
    sta.b 0x11
    rep #0x20
    lda.w #0xCB2C
    sta.b 0x20
    sep #0x20
.A281:
    rts

.A282:
    rep #0x20
    lda.w #0x0080
    sta.w 0x0000
    lda.b 0x3C
    sta.w 0x0002
    sep #0x20
    jsl 0x87A3EC
    beq .A29A

    jsr .A324
.A29A:
    jsl update_pos_x
    jsl update_pos_y
    jsl _848EEA
    rts

.A2A7:
    dec.b 0x3A
    bne .A2BE

    jsr .A2E0
    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x02
    sta.b 0x02
    lda.b #0x03
    jsl _848EEA.8F07
    bra .A2CE

.A2BE:
    lda.b 0x0F
    cmp.b #0x80
    bne .A2CA

    lda.b #0x02
    jsl _848EEA.8F07
.A2CA:
    jsl _848EEA
.A2CE:
    rts

.A2CF:
    jsl 0x84A4AB
    jsl 0x828398
    sep #0x10
    lda.b #0x01
    jsl 0x84A37F
    rts

;-----

.A2E0:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .A2EF

    lda.w #0x0000
    bra .A2F6

.A2EF:
    lda.b 0x11
    ora.w #0x0040
    sta.b 0x11
.A2F6:
    beq .A2FF

    lda.w #0x0400
    sta.b 0x1A
    bra .A30B

.A2FF:
    lda.b 0x11
    and.w #0x00BF
    sta.b 0x11
    lda.w #0xFC00
    sta.b 0x1A
.A30B:
    ldx.b 0x33
    sep #0x20
    lda.b 0x0B
    beq .A31A

    rep #0x20
    lda.w 0x00CB23,X
    bra .A31F

.A31A:
    rep #0x20
    lda.w 0x00CB1D,X
.A31F:
    sta.b 0x1C
    sep #0x20
    rts

;-----

.A324:
    rep #0x20
    lda.w #0x0000
    sta.b 0x1A
    lda.w #0xFA00
    sta.b 0x1C
    lda.w #0x0002
    jsl _848EEA.8F07
    sep #0x20
    rts
