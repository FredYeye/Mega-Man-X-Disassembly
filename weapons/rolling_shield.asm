rolling_shield:
    ldx.b 0x01
    jsr (.92F5,X)
    jml 0x848FCA

.92F5: d16[.92FF, .9347, .941C, .941C, .941C]

.92FF:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x02
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    stz.b 0x3A
    stz.b 0x38
    stz.b 0x39
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
    rep #0x20
    lda.w #0x0400
    bit.b 0x10
    bvs .932E

    lda.w #0xFC00
.932E:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    lda.w #0xAF87
    sta.b 0x31
    sep #0x20
    lda.b #0x48
    sta.b 0x16
    lda.b #0x80
    sta.b 0x17
.9346:
    rts

.9347:
    ldx.b 0x02
    jsr (.9381,X)
    lda.b #0x0F
    sta.b 0x20
    lda.b #0xBF
    sta.b 0x21
    jsl 0x849BC8
    lda.b #0x05
    sta.b 0x20
    lda.b #0xBF
    sta.b 0x21
    jsl _8491AD.91BE
    lda.b 0x00
    beq .9346

    jsl _82808F.80B4
    lda.b 0x0E
    bne .9378

    lda.b #0x04
    sta.b 0x02
    sta.b 0x03
    sta.b 0x30
.9378:
    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    rts

.9381: d16[.9387, .93A3, .9420]

.9387:
    ldx.b 0x03
    bne .9394

    inc.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.9394:
    lda.b 0x0F
    bpl .939E

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.939E:
    jsl _848EEA
    rts

.93A3:
    ldx.b 0x03
    jmp (.93A8,X)

.93A8: d16[.93AE, .93BB, .93F0]

.93AE:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x30
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.93BB:
    lda.b 0x2B
    bit.b #0x04
    beq .93C6

    lda.b #0x04
    sta.b 0x03
    rts

.93C6:
    bit.b #0x03
    beq .93DA

    inc.b 0x3A
    lda.b 0x3A
    cmp.b #0x02
    bcc .93D7

    lda.b #0x08
    sta.b 0x01
    rts

.93D7:
    jsr .942A
.93DA:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.w #0xFC00
    cmp.b 0x1C
    bmi .93E9

    sta.b 0x1C
.93E9:
    sep #0x20
    jsl _848EEA
    rts

.93F0:
    lda.b 0x2B
    bit.b #0x04
    bne .93FF

    lda.b #0x02
    sta.b 0x03
    stz.b 0x1C
    stz.b 0x1D
    rts

.93FF:
    bit.b #0x03
    beq .9413

    inc.b 0x3A
    lda.b 0x3A
    cmp.b #0x02
    bcc .9410

    lda.b #0x08
    sta.b 0x01
    rts

.9410:
    jsr .942A
.9413:
    jsl update_pos_x
    jsl _848EEA
    rts

.941C:
    jsl 0x84A4AB
.9420:
    inc.b 0x30
    dec.w 0x0BDD
    jsl _8283A3
    rts

;-----

.942A:
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rts
