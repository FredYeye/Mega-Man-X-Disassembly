planty:
    ldx.b 0x01
    jsr (.C24F,X)
    lda.b 0x11
    and.b #0x3F
    ora.b 0x33
    sta.b 0x11
    rtl

.C24F: d16[.C255, .C283, .C390]

.C255:
    jsl 0x82827D
    lda.b #0x02
    sta.b 0x27
    lda.b #0x03
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    stz.b 0x2F
    rep #0x20
    ldx.b #0x00
    lda.w 0x0BAD
    cmp.b 0x05
    bcc .C274

    ldx.b #0x40
.C274:
    stx.b 0x33
    jsl 0x8280B4
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    rts

.C283:
    jsl 0x82806E
    bcc .C28E

    lda.b #0x04
    sta.b 0x01
    rts

.C28E:
    ldx.b 0x02
    jsr (.C2C9,X)
    jsl 0x8280B4
    lda.l 0x7F8304
    sta.b 0x11
    jsl 0x849B43
    beq .C2C4

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .C2C4

    lda.b #0x04
    sta.b 0x01
    lda.b #0x00
    jsl 0x84A37F
    jsl 0x84A4AB
    stz.w 0x0000
    stz.w 0x0001
    jmp 0x81C3C1

.C2C4:
    jsl 0x849B03
    rts

.C2C9: d16[.C2D1, .C2F2, .C32D, .C368]

.C2D1:
    ldx.b 0x03
    bne .C2E4

    inc.b 0x03
    stz.b 0x20
    stz.b 0x21
    inc.b 0x30
    lda.b #0x00
    jsl 0x848F07
    rts

.C2E4:
    jsr _81C407
    beq .C2F1

    stz.b 0x30
    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.C2F1:
    rts

.C2F2:
    ldx.b 0x03
    bne .C2FF

    inc.b 0x03
    lda.b #0x00
    jsl 0x848F07
    rts

.C2FF:
    lda.b 0x0F
    bpl .C30A

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.C30A:
    bit.b #0x02
    beq .C328

    rep #0x20
    lda.w #0xC5E6
    sta.b 0x20
    sep #0x20
    lda.b #0x2F
    jsl 0x80888B
    lda.b #0x08
    sta.w 0x0000
    stz.w 0x0001
    jsr _81C3C1
.C328:
    jsl 0x848EEA
    rts

.C32D:
    ldx.b 0x03
    bne .C33A

    inc.b 0x03
    lda.b #0x01
    jsl 0x848F07
    rts

.C33A:
    rep #0x20
    ldx.b #0x00
    lda.w 0x0BAD
    cmp.b 0x05
    bcc .C347

    ldx.b #0x40
.C347:
    stx.b 0x33
    sep #0x20
    lda.b 0x0F
    bit.b #0x01
    beq .C354

    jsr _81C395
.C354:
    lda.b 0x0F
    bpl .C363

    jsr _81C407
    bne .C363

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
.C363:
    jsl 0x848EEA
    rts

.C368:
    ldx.b 0x03
    bne .C375

    inc.b 0x03
    lda.b #0x04
    jsl 0x848F07
    rts

.C375:
    lda.b 0x0F
    bpl .C37E

    stz.b 0x02
    stz.b 0x03
    rts

.C37E:
    bit.b #0x02
    beq .C38B

    stz.w 0x0000
    stz.w 0x0001
    jsr _81C3C1
.C38B:
    jsl 0x848EEA
    rts

.C390:
    jsl 0x828387
    rts
