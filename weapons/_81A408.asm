_81A408:
    ldx.b 0x01
    jsr (.A40E,X)
    rtl

.A40E: d16[.A418, .A43C, .A498, .A4AF, .A4B8]

.A418:
    jsr _81A54C
    stz.b 0x37
    rep #0x20
    lda.w #0x0600
    sta.b 0x38
    stz.b 0x3A
    lda.w #0xBE38
    sta.b 0x20
    sep #0x20
    jsl _82808F.80B4
    lda.b #0x08
    sta.b 0x16
    lda.b #0x05
    jsl _848EEA.8F07
    rts

.A43C:
    bit.b 0x11
    bvc .A44E

    lda.b 0x37
    inc
    inc
    inc
    inc
    cmp.b #0x1D
    bmi .A458

    lda.b #0x00
    bra .A458

.A44E:
    lda.b 0x37
    dec
    dec
    dec
    dec
    bpl .A458

    lda.b #0x1C
.A458:
    sta.b 0x37
    asl
    asl
    tax
    rep #0x20
    lda.w 0xEEBA,X
    asl
    asl
    asl
    sta.b 0x1A
    lda.w 0xEEBC,X
    asl
    asl
    asl
    sta.b 0x1C
    lda.b 0x38
    bit.b 0x10
    bvs .A479

    eor.w #0xFFFF
    inc
.A479:
    clc
    adc.b 0x1A
    sta.b 0x1A
    lda.b 0x3A
    clc
    adc.b 0x1C
    sta.b 0x1C
    sep #0x20
    jsl update_pos_xy.no_accel
    jsl _82808F.80B4
    lda.b 0x0E
    beq .A4B8

    jsl _848EEA
    rts

.A498:
    rep #0x20
    lda.b 0x38
    eor.w #0xFFFF
    inc
    sta.b 0x38
    lda.w #0x0300
    sta.b 0x3A
    sep #0x20
    jsl _82808F.80B4
    inc.b 0x30
.A4AF:
    lda.b #0x02
    sta.b 0x01
    jsl _848EEA
    rts

.A4B8:
    inc.b 0x30
    dec.w 0x0BDD
    jsl _8283A3
    rts
