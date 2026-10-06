metal_wing:
    ldx.b 0x01
    jmp (.DB9D,X)

.DB9D: d16[.DBA3, .DBEB, .DCD3]

.DBA3:
    jsl 0x84A1D0
    cpy.b #0x0A
    bcs .DBD1

    lda.w 0x0C26
    bit.b #0x20
    beq .DBD1

    jsl 0x82827D
    lda.b #0x04
    sta.b 0x12
    stz.b 0x2F
    lda.b #0x02
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x03
    sta.b 0x26
    rep #0x20
    lda.w 0x0BAD
    cmp.b 0x05
    bcc .DBD5

.DBD1:
    jml 0x828387

.DBD5:
    lda.w #0xD0C1
    sta.b 0x20
    lda.w #0x0480
    sta.b 0x1A
    stz.b 0x1C
    stz.b 0x1E
    sep #0x20
    lda.b #0x02
    jml 0x848F07

.DBEB:
    jsl 0x82806E
    bcc .DBF5

    jml 0x828387

.DBF5:
    lda.l 0x7F8356
    ora.b #0x40
    sta.b 0x11
    ldx.b 0x02
    jsr (.DC21,X)
    jsl 0x849B43
    beq .DC19

    bpl .DC15

    jsl 0x84A4AB
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rtl

.DC15:
    lda.b #0x0E
    trb.b 0x11
.DC19:
    jsl 0x849B03
    jml 0x8280B4

.DC21: d16[.DC27, .DC56, .DC9E]

.DC27:
    ldx.b 0x03
    bne .DC44

    inc.b 0x03
    lda.b #0x01
    ldx.b 0x0B
    bmi .DC3C

    jsl get_rng
    and.b #0x7E
    clc
    adc.b #0x3C
.DC3C:
    sta.b 0x33
    lda.b #0x00
    jsl _848EEA.8F07
.DC44:
    dec.b 0x33
    bne .DC4D

    lda.b #0x04
    jmp _8386F1

.DC4D:
    jsl update_pos_x
    jsl _848EEA
    rts

.DC56:
    ldx.b 0x03
    jmp (.DC5B,X)

.DC5B: d16[.DC61, .DC6F, .DC86]

.DC61:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x40
    sta.b 0x1F
    lda.b #0x02
    jsl _848EEA.8F07
.DC6F:
    lda.b 0x0F
    bpl .DC7D

    lda.b #0x04
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
.DC7D:
    jsl update_pos_xy.neg_ay_pos_ax
    jsl _848EEA
    rts

.DC86:
    jsl update_pos_xy.neg_ay_pos_ax
    rep #0x20
    lda.w #0x0680
    cmp.b 0x1A
    bcs .DC97

    sta.b 0x1A
    stz.b 0x02
.DC97:
    sep #0x20
    jsl _848EEA
    rts

.DC9E:
    ldx.b 0x03
    bne .DCAE

    inc.b 0x03
    lda.b #0x04
    sta.b 0x1F
    lda.b #0x01
    jsl _848EEA.8F07
.DCAE:
    jsl update_pos_xy.neg_ay_ax
    rep #0x21
    lda.b 0x05
    adc.w #0xFFC0
    cmp.w 0x1E4D
    bcc .DCC5

    lda.b 0x1A
    cmp.w #0x0200
    bcs .DCCC

.DCC5:
    sep #0x20
    lda.b #0x02
    jmp _8386F1

.DCCC:
    sep #0x20
    jsl _848EEA
    rts

.DCD3:
    jsl 0x82806E
    bcc .DCDD

    jml 0x828398

.DCDD:
    ldx.b 0x02
    jsr (.DCE7,X)
    jsl 0x8280B4
    rtl

.DCE7: d16[.DCED, .DD07, .DD2C]

.DCED:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x10
    sta.b 0x1F
    lda.b #0x10
    sta.b 0x1E
    lda.b #0x10
    sta.b 0x29
    lda.b #0x10
    sta.b 0x2A
    lda.b #0x03
    jsl _848EEA.8F07
.DD07:
    jsr .DD35
    jsl _8490A0
    cmp.b #0x34
    bcc .DD16

    lda.b #0x04
    sta.b 0x02
.DD16:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.w #0x0200
    cmp.b 0x1A
    bcc .DD25

    sta.b 0x1A
.DD25:
    sep #0x20
    jsl _848EEA
    rts

.DD2C:
    jsl 0x84A4AB
    jsl 0x828387
    rts

;-----

.DD35:
    lda.w 0x0B9C
    and.b #0x07
    bne .DD63

    jsl 0x8282D3
    bne .DD61

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    jsl get_rng
    and.w #0x000F
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.DD61:
    sep #0x30
.DD63:
    rts
