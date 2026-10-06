creeper:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.A9C9,X)
    lda.b 0x00
    bne .A997

    rtl

.A997:
    jsl 0x849B43
    beq .A9B5

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .A9B5

    lda.b #0x01
    jsl 0x84A37F
.A9AD:
    jsl 0x84A4AB
    jml 0x828398

.A9B5:
    stz.b 0x29
    stz.b 0x2A
    jsl _8490A0
    cmp.b #0x34
    bcs .A9AD

    jsl 0x849B03
    jml 0x8280B4

.A9C9: d16[.A9D1, .AA22, .AA23, .AA89]

.A9D1:
    lda.b 0x11
    and.b #0x40
    pha
    jsl 0x82827D
    pla
    tsb.b 0x11
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x01
    sta.b 0x27
    lda.b #0x01
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x03
    jsl _848EEA.8F07
    lda.b 0x11
    and.b #0x40
    rep #0x20
    beq .AA0A

    lda.b 0x0B
    asl
    tax
    lda.w 0x00CB67,X
    bra .AA15

.AA0A:
    lda.b 0x0B
    asl
    tax
    lda.w 0x00CB67,X
    eor.w #0xFFFF
    inc
.AA15:
    sta.b 0x1A
    lda.w #0xCB5D
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
.AA22:
    rts

.AA23:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .AA43

    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
.AA43:
    lda.b 0x2B
    and.b #0x04
    beq .AA7A

    lda.b #0x06
    sta.b 0x01
    lda.b #0x04
    jsl _848EEA.8F07
    stz.b 0x2F
    lda.b #0x40
    trb.b 0x11
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    lda.b #0x00
    ror
    ror
    tsb.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0080
    bcs .AA75

    lda.w #0xFF80
.AA75:
    sta.b 0x1A
    sep #0x20
    rts

.AA7A:
    jsl _848EEA
    jsl 0x82806E
    bcc .AA88

    jsl 0x828398
.AA88:
    rts

.AA89:
    jsl update_pos_x
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .AAA9

    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
.AAA9:
    lda.b 0x2B
    and.b #0x04
    bne .AAC1

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x04
    sta.b 0x01
    lda.b #0x03
    jsl _848EEA.8F07
    lda.b #0xFF
    sta.b 0x2F
.AAC1:
    jsl _848EEA
    jsl 0x82806E
    bcc .AACF

    jsl 0x828398
.AACF:
    rts
