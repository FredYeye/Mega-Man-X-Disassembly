fire_wave:
    ldx.b 0x01
    jsr (.9443,X)
    rtl

.9443: d16[.944D, .94B2, .94A4, .94A4, .94A4]

.944D:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x02
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    lda.w 0x0B9C
    and.b #0x0E
    bne .946A

    lda.b #0x61
    jsl _80888B.88B6
.946A:
    stz.b 0x38
    stz.b 0x39
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
    rep #0x20
    lda.w #0x0700
    bit.b 0x10
    bvs .9487

    lda.w #0xF900
.9487:
    sta.b 0x1A
    lda.w #0xBF13
    sta.b 0x20
    stz.b 0x28
    sep #0x20
    lda.w 0x0C18
    beq .949B

    lda.b #0x02
    sta.b 0x02
.949B:
    lda.b #0x46
    sta.b 0x16
    lda.b #0x80
    sta.b 0x17
.94A3:
    rts

.94A4:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.94B2:
    ldx.b 0x02
    jsr (.94CE,X)
    lda.b 0x00
    beq .94A3

    jsl _82808F.80B4
    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    lda.b 0x30
    eor.b #0x01
    sta.b 0x30
    rts

.94CE: d16[.94D2, .94F8]

.94D2:
    ldx.b 0x03
    bne .94E5

    inc.b 0x03
    stz.b 0x30
    lda.b #0x05
    sta.b 0x37
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.94E5:
    dec.b 0x37
    bne .94EF

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.94EF:
    jsl update_pos_x
    jsl _848EEA
    rts

.94F8:
    ldx.b 0x03
    bne .9505

    inc.b 0x03
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.9505:
    lda.b 0x0F
    bpl .9513

    inc.b 0x30
    dec.w 0x0BDD
    jsl _8283A3
    rts

.9513:
    jsl _848EEA
    rts
