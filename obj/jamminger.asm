jamminger:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.DDA2,X)
    jsl _848EEA
    stz.b 0x35
    jsl 0x849B03
    beq .DD7B

    inc.b 0x35
.DD7B:
    jsl 0x849B43
    beq .DD95

    bpl .DD91

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
.DD8D:
    jml 0x828387

.DD91:
    lda.b #0x0E
    trb.b 0x11
.DD95:
    jsl 0x82806E
    bcs .DD8D

    jsr .DF5B
    jml 0x8280B4

.DDA2: d16[.DDB0, .DDDC, .DE59, .DEA3, .DED3, .DEF0, .DF14]

.DDB0:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x02
    sta.b 0x27
    lda.b #0x01
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    stz.b 0x34
    lda.b #0x00
    jsl _848EEA.8F07
    rep #0x20
    lda.w #0xD0C5
    sta.b 0x20
    lda.b 0x05
    sta.b 0x37
    sep #0x20
    rts

.DDDC:
    jsl 0x84A07C
    asl
    asl
    tax
    jsr .DF32
    jsl 0x82820A
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .DDF8

    eor.w #0xFFFF
    inc
.DDF8:
    cmp.w #0x0040
    bcs .DE56

    lda.w 0x0BB0
    sec
    sbc.b 0x08
    bcs .DE09

    eor.w #0xFFFF
    inc
.DE09:
    cmp.w #0x0040
    bcs .DE56

    sep #0x20
    jsl 0x84A07C
    sta.w 0x0000
    asl
    asl
    tax
    rep #0x20
    lda.w 0x86EE3A,X
    lsr
    lsr
    lsr
    lsr
    bit.w #0x0080
    beq .DE2C

    eor.w #0xFFFF
    inc
.DE2C:
    tay
    sty.b 0x1F
    lda.w 0x86EE3C,X
    lsr
    lsr
    lsr
    lsr
    bit.w #0x0080
    beq .DE3F

    eor.w #0xFFFF
    inc
.DE3F:
    tay
    sty.b 0x1E
    jsr .DF32
    lda.w 0x0000
    lsr
    lsr
    and.b #0x06
    sta.b 0x36
    lda.b #0x04
    sta.b 0x01
    lda.b #0x20
    sta.b 0x34
.DE56:
    sep #0x30
    rts

.DE59:
    ldx.b 0x36
    jmp (.DE5E,X)

.DE5E: d16[.DE66, .DE6C, .DE72, .DE78]

.DE66:
    jsl update_pos_xy.neg_ay_ax
    bra .DE7C

.DE6C:
    jsl update_pos_xy.pos_ay_neg_ax
    bra .DE7C

.DE72:
    jsl update_pos_xy.pos_ay_ax
    bra .DE7C

.DE78:
    jsl update_pos_xy.neg_ay_pos_ax
.DE7C:
    dec.b 0x34
    bne .DE88

    lda.b #0x06
    sta.b 0x01
    lda.b #0x1E
    sta.b 0x34
.DE88:
    lda.b 0x35
    beq .DEA2

    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x1D
    stz.b 0x1C
    lda.b #0x0C
    sta.b 0x34
    lda.b #0x0A
    sta.b 0x01
    stz.b 0x02
.DEA2:
    rts

.DEA3:
    dec.b 0x34
    bne .DED2

    lda.b #0x08
    sta.b 0x01
    jsl 0x84A07C
    asl
    asl
    tax
    rep #0x20
    lda.w 0x86EE3A,X
    lsr
    bit.w #0x4000
    beq .DEC0

    ora.w #0x8000
.DEC0:
    sta.b 0x1A
    lda.w 0x86EE3C,X
    lsr
    bit.w #0x4000
    beq .DECE

    ora.w #0x8000
.DECE:
    sta.b 0x1C
    sep #0x20
.DED2:
    rts

.DED3:
    jsl 0x82820A
    lda.b 0x35
    beq .DEEF

    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x1D
    stz.b 0x1C
    lda.b #0x0C
    sta.b 0x34
    lda.b #0x0A
    sta.b 0x01
.DEEF:
    rts

.DEF0:
    lda.b 0x02
    bne .DF03

    jsl update_pos_y
    dec.b 0x34
    bne .DF02

    inc.b 0x02
    lda.b #0x3C
    sta.b 0x34
.DF02:
    rts

.DF03:
    dec.b 0x34
    bne .DF13

    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
.DF13:
    rts

.DF14:
    lda.b 0x02
    bne .DF29

    lda.b #0x00
    jsl _848EEA.8F07
    rep #0x20
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
    inc.b 0x02
.DF29:
    jsl _848EEA
    jsl update_pos_y
    rts

;-----

.DF32:
    rep #0x20
    lda.w 0x86EE3A,X
    lsr
    bit.w #0x4000
    beq .DF40

    ora.w #0x8000
.DF40:
    clc
    adc.w 0x86EE3A,X
    sta.b 0x1A
    lda.w 0x86EE3C,X
    lsr
    bit.w #0x4000
    beq .DF52

    ora.w #0x8000
.DF52:
    clc
    adc.w 0x86EE3C,X
    sta.b 0x1C
    sep #0x20
    rts

;-----

.DF5B:
    lda.b 0x01
    cmp.b #0x0C
    beq .DF7B

    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x37
    bcs .DF6E

    eor.w #0xFFFF
    inc
.DF6E:
    cmp.w #0x00A0
    sep #0x20
    bcc .DF7B

    lda.b #0x0C
    sta.b 0x01
    stz.b 0x02
.DF7B:
    rts
