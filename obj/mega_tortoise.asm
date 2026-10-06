mega_tortoise:
    lda.b 0x35
    tsb.b 0x11
    ldx.b 0x01
    jsr (.EC32,X)
    jsl 0x849B43
    beq .EC21

    bpl .EC1D

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
    jml 0x828398

.EC1D:
    lda.b #0x0E
    trb.b 0x11
.EC21:
    jsl 0x849B03
    jsl 0x82808F
    lda.b 0x0E
    beq .EC2E

    rtl

.EC2E:
    jml 0x828387

.EC32: d16[.EC3A, .EC81, .ECA8, .ECD9]

.EC3A:
    lda.b 0x0B
    and.b #0x01
    beq .EC4F

    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .EC4F

    pla
    jml 0x828387

.EC4F:
    sep #0x20
    jsl 0x82827D
    lda.b 0x0B
    tsb.b 0x11
    lda.b 0x11
    and.b #0x0E
    sta.b 0x35
    lda.b #0x04
    sta.b 0x26
    lda.b #0x10
    sta.b 0x27
    lda.b #0x06
    sta.b 0x12
    rep #0x20
    lda.w #0xD4E0
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    rts

.EC81:
    jsl _848EEA
    lda.b 0x02
    bne .EC8F

    inc.b 0x02
    lda.b #0x28
    sta.b 0x34
.EC8F:
    dec.b 0x34
    bne .ECA7

    jsr .ED71
    bpl .EC9B

    inc.b 0x34
    rts

.EC9B:
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
.ECA7:
    rts

.ECA8:
    jsl _848EEA
    lda.b 0x02
    bne .ECB6

    inc.b 0x02
    lda.b #0x30
    sta.b 0x34
.ECB6:
    jsr .ED71
    bpl .ECC8

    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    rts

.ECC8:
    dec.b 0x34
    bne .ECD8

    lda.b #0x02
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
.ECD8:
    rts

.ECD9:
    jsl _848EEA
    lda.b 0x0F
    bmi .ECE4

    bne .ECF1

    rts

.ECE4:
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rts

.ECF1:
    rep #0x10
    jsl 0x828358
    bne .ED6E

    inc.w 0x0000,X
    lda.b #0x25
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b 0x11
    ora.b 0x35
    sta.w 0x0011,X
    and.b #0x40
    bne .ED1A

    lda.b 0x0F
    bra .ED1E

.ED1A:
    lda.b 0x0F
    eor.b #0x03
.ED1E:
    cmp.b #0x01
    rep #0x21
    bne .ED29

    lda.w #0xFFF9
    bra .ED2C

.ED29:
    lda.w #0x0007
.ED2C:
    adc.b 0x05
    sta.b 0x36
    sta.w 0x0005,X
    lda.w #0xFFE4
    clc
    adc.b 0x08
    sta.b 0x38
    sta.w 0x0008,X
    sep #0x20
    jsl 0x8282D3
    bne .ED6E

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x28
    sta.w 0x000B,X
    lda.b 0x11
    ora.b 0x35
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x36
    sta.w 0x0005,X
    lda.b 0x38
    sta.w 0x0008,X
    sep #0x30
    lda.b #0x1E
    jsl _80888B
.ED6E:
    sep #0x30
    rts

;-----

.ED71:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    lda.b 0x11
    bcs .ED86

    and.b #0x40
    beq .ED8A

.ED83:
    lda.b #0x80
    rts

.ED86:
    and.b #0x40
    beq .ED83

.ED8A:
    lda.b #0x00
    rts
