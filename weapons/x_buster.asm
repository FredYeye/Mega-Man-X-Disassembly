x_buster:
    ldx.b 0x01
    jsr (.A224,X)
    rtl

.A224: d16[.A22E, .A25F, .A294, .A2BA, .A2BA]

.A22E:
    jsr _81A54C
    rep #0x20
    lda.w #0x0400
    bit.b 0x10
    bvs .A23D

    lda.w #0xFC00
.A23D:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xBE20
    sta.b 0x20
    sep #0x20
    stz.b 0x2F
    lda.b #0x40
    sta.b 0x1F
    stz.b 0x1E
    jsl 0x8280B4
    lda.b #0x08
    sta.b 0x16
    lda.b #0x04
    jsl _848EEA.8F07
    rts

.A25F:
    bit.b 0x11
    bvs .A276

    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.w #0xFA00
    cmp.b 0x1A
    bmi .A272

    sta.b 0x1A
.A272:
    sep #0x20
    bra .A287

.A276:
    jsl update_pos_xy.neg_ay_pos_ax
    rep #0x20
    lda.w #0x0600
    cmp.b 0x1A
    bpl .A285

    sta.b 0x1A
.A285:
    sep #0x20
.A287:
    jsl 0x8280B4
.A28B:
    lda.b 0x0E
    beq .A2C0

    jsl _848EEA
    rts

.A294:
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    lda.w #0x0300
    sta.b 0x1C
    stz.b 0x1E
    sep #0x20
    jsl 0x8280B4
    lda.w 0x1F9D
    bpl .A2B3

    sta.w 0x1F23
.A2B3:
    inc.b 0x30
    lda.b #0x02
    sta.b 0x01
    rts

.A2BA:
    inc.b 0x30
    jsl 0x84A51A
.A2C0:
    dec.w 0x0BDD
    jsl 0x8283A3
    rts
