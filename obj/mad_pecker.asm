mad_pecker:
    lda.b 0x35
    tsb.b 0x11
    ldx.b 0x01
    jsr (.A7FE,X)
    lda.b 0x00
    bne .A7E2

    rtl

.A7E2:
    jsl 0x849B43
    beq .A7F6

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .A7F6

    lda.b #0x08
    sta.b 0x01
.A7F6:
    jsl 0x849B03
    jml 0x8280B4

.A7FE: d16[.A808, .A84F, .A873, .A8FD, .A935]

.A808:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x35
    lda.b #0x06
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x00
    jsl _848EEA.8F07
    rep #0x20
    lda.w #0xCB49
    sta.b 0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    stz.b 0x31
    sep #0x20
    lda.b #0x00
    ror
    ror
    tsb.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x000E
    bcc .A847

    lda.w #0xFFF2
.A847:
    clc
    adc.b 0x05
    sta.b 0x05
    sep #0x20
    rts

.A84F:
    jsl _848EEA
    jsr .A951
    bcs .A868

    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    lda.b #0x12
    sta.b 0x33
.A868:
    jsl 0x82806E
    bcc .A872

    jsl 0x828387
.A872:
    rts

.A873:
    jsl _848EEA
    lda.b 0x02
    bne .A8CA

    dec.b 0x33
    bne .A8FC

    inc.b 0x02
    jsl 0x828321
    beq .A894

    sep #0x10
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    lda.b #0x3C
    sta.b 0x33
    rts

.A894:
    inc.w 0x0000,X
    lda.b #0x1F
    sta.w 0x000A,X
    jsl get_rng
    xba
    lda.b #0x00
    xba
    and.b #0x0F
    tay
    lda 0x00CB4D,Y
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0009
    sta.w 0x0008,X
    sep #0x20
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    stx.b 0x31
    sep #0x10
.A8CA:
    lda.b 0x0F
    beq .A8FC

    lda.b 0x11
    and.b #0x40
    rep #0x30
    beq .A8DE

    lda.b 0x05
    clc
    adc.w #0x0012
    bra .A8E4

.A8DE:
    lda.b 0x05
    sec
    sbc.w #0x0012
.A8E4:
    ldx.b 0x31
    sta.w 0x0005,X
    stz.b 0x31
    sep #0x20
    lda.b #0x04
    sta.w 0x0001,X
    sep #0x10
    lda.b #0x3C
    sta.b 0x33
    lda.b #0x06
    sta.b 0x01
.A8FC:
    rts

.A8FD:
    jsl _848EEA
    jsr .A951
    bcc .A90A

.A906:
    lda.b #0x3C
    sta.b 0x33
.A90A:
    dec.b 0x33
    bne .A92A

    jsl get_rng
    and.b #0x0F
    tax
    lda.w 0x00CB4D,X
    bne .A906

    lda.b #0x12
    sta.b 0x33
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    lda.b #0x01
    jsl _848EEA.8F07
.A92A:
    jsl 0x82806E
    bcc .A934

    jsl 0x828387
.A934:
    rts

.A935:
    lda.b #0x01
    jsl 0x84A37F
    jsl 0x84A4AB
    rep #0x10
    ldx.b 0x31
    beq .A94A

    lda.b #0x04
    sta.w 0x0001,X
.A94A:
    jsl 0x828387
    sep #0x10
    rts

;-----

.A951:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    ror
    ror
    eor.b 0x11
    and.b #0x40
    bne .A987

    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .A971

    eor.w #0xFFFF
    inc
.A971:
    cmp.w #0x0040
    sep #0x20
    bcs .A987

    lda.b #0x1F
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x1E
    sta.b 0x0A
    cpy.b #0x0C
    rts

.A987:
    sec
    rts
