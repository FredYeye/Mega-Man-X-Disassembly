lava_drop:
    ldx.b 0x01
    jsr (.C9AC,X)
    jsl 0x849B03
    jsl 0x8280B4
    jsl 0x82806E
    bcc .C9AB

    jsl 0x828387
.C9AB:
    rtl

.C9AC: d16[.C9B4, .C9DA, .C9F4, .CA2F]

.C9B4:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x01
    sta.b 0x30
    stz.b 0x35
    rep #0x20
    lda.w #0xD314
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.C9DA:
    lda.b 0x0F
    bpl .C9EF

    lda.b #0x04
    sta.b 0x01
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x15
    sta.b 0x33
    jmp .C9F3

.C9EF:
    jsl _848EEA
.C9F3:
    rts

.C9F4:
    dec.b 0x33
    bne .CA2A

    jsr .CA3F
    lda.b #0x06
    sta.b 0x01
    lda.b #0x00
    jsl _848EEA.8F07
    jsl get_rng
    and.b #0x03
    beq .CA15

    cmp.b #0x01
    beq .CA1C

    cmp.b #0x02
    beq .CA23

.CA15:
    lda.b #0x50
    sta.b 0x33
    jmp .CA27

.CA1C:
    lda.b #0x3C
    sta.b 0x33
    jmp .CA27

.CA23:
    lda.b #0x28
    sta.b 0x33
.CA27:
    jmp .CA2E

.CA2A:
    jsl _848EEA
.CA2E:
    rts

.CA2F:
    dec.b 0x33
    bne .CA3A

    lda.b #0x02
    sta.b 0x01
    jmp .CA3E

.CA3A:
    jsl _848EEA
.CA3E:
    rts

;-----

.CA3F:
    rep #0x10
    jsl 0x828358
    bne .CA78

    inc.w 0x0000,X
    lda.b #0x1F
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b #0x40
    sta.w 0x001E,X
    stz.w 0x001F,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    stz.w 0x001A,X
    stz.w 0x001C,X
.CA78:
    sep #0x30
    rts
