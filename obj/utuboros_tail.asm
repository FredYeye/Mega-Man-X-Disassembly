utuboros_tail:
    ldx.b 0x01
    jmp (.C732,X)

.C732: d16[.C738, .C764, utuboros_body.C402]

.C738:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x12
    lda.b #0x48
    sta.b 0x27
    lda.b #0x04
    sta.b 0x26
    lda.b #0x06
    sta.b 0x28
    lda.b #0x0C
    sta.b 0x0B
    sta.b 0x2F
    stz.b 0x3C
    lda.l 0x7F822E
    sta.b 0x18
    lda.b #0x30
    sta.b 0x16
    lda.b #0x0C
    jml 0x848F07

.C764:
    lda.l 0x7F832E
    sta.b 0x11
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    and.b #0x7F
    bne .C77E

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    rtl

.C77E:
    lda.w 0x003C,X
    beq .C78A

    stz.w 0x003C,X
    lda.b #0x0E
    trb.b 0x11
.C78A:
    sep #0x10
    ldx.b 0x02
    jsr (.C7CA,X)
    jsr _82C6B9
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    adc.w #0xCD0C
    sta.b 0x20
    sep #0x20
    jsl 0x849B43
    beq .C7C2

    lda.b 0x27
    and.b #0x7F
    bne .C7B4

    lda.b #0x02
    sta.b 0x02
    bra .C7C2

.C7B4:
    rep #0x10
    ldx.b 0x0C
    lda.b 0x27
    sta.w 0x0027,X
    sta.w 0x003C,X
    sep #0x10
.C7C2:
    jsl _849B03
    jml 0x8280B4

.C7CA: d16[.C7CE, .C7CF]

.C7CE:
    rts

.C7CF:
    ldx.b 0x03
    bne .C7E6

    inc.b 0x03
    jsl 0x84A4AB
    lda.b #0x04
    sta.b 0x36
    lda.b #0x30
    sta.b 0x34
    lda.b #0x02
    sta.b 0x35
    rts

.C7E6:
    dec.b 0x36
    bne .C832

    lda.b #0x04
    sta.b 0x36
    rep #0x30
    lda.w #0x0508
    sta.w 0x0004
    ldx.b 0x0C
    lda.b 0x34
    sec
    sbc.w #0x0028
    sta.b 0x34
    bpl .C814

    sep #0x20
    lda.b #0x04
    sta.w 0x0001,X
    stz.w 0x0002,X
    stz.w 0x0003,X
    stz.w 0x0027,X
    bra .C830

.C814:
    lda.w 0x0034,X
    sec
    sbc.b 0x34
    and.w #0x03FF
    tax
    lda.l 0x7FD200,X
    sta.w 0x0000
    lda.l 0x7FD202,X
    sta.w 0x0002
    jsl 0x84A462
.C830:
    sep #0x30
.C832:
    rts
