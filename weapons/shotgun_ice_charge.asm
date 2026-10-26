shotgun_ice_charge:
    lda.w 0x1F49
    beq .A39A

    lda.b #0x04
    sta.b 0x01
.A39A:
    ldx.b 0x01
    jmp (.A39F,X)

.A39F: d16[.A3A9, .A429, .A4F5, .A423, .A4F1]

.A3A9:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x08
    sta.b 0x18
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x95
    sta.b 0x16
    lda.b #0x01
    sta.b 0x37
    ldx.b 0x3C
    lda.w 0x00BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x00BE3D,X
    sta.w 0x0002
    bpl .A3E1

    dec.w 0x0003
.A3E1:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .A3EE

    eor.w #0xFFFF
    inc
.A3EE:
    clc
    adc.w ram.obj.mega_man.pos_x+1
    sta.b 0x05
    lda.w ram.obj.mega_man.pos_y+1
    clc
    adc.w 0x0002
    sta.b 0x08
    stz.b 0x1A
    stz.b 0x1C
    lda.w #0xC023
    sta.b 0x20
    lda.w #0xB049
    sta.b 0x31
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x00
    jsl _848EEA.8F07
    jsl 0x848FCA
    jml _82808F.80B4

.A423:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x30
.A429:
    ldx.b 0x02
    jsr (.A446,X)
    jsl 0x848FCA
    jsl _82806E
    bcs .A43C

    jml _82808F.80B4

.A43C:
    stz.w 0x0C25
    dec.w 0x0BDD
    jml 0x8283A3

.A446: d16[.A450, .A463, .A490, .A4A7, .A4CD]

.A450:
    jsl _848EEA
    lda.b 0x0F
    bpl .A462

    lda.b #0x02
    sta.b 0x02
    lda.b #0x02
    jsl _848EEA.8F07
.A462:
    rts

.A463:
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFA00
    bpl .A475

    lda.w #0xFA00
    sta.b 0x1C
.A475:
    sep #0x20
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .A48F

    lda.b #0x04
    sta.b 0x02
    lda.b #0x1E
    sta.b 0x37
    stz.b 0x1E
    stz.b 0x1C
    stz.b 0x1D
.A48F:
    rts

.A490:
    dec.b 0x37
    bne .A4A2

    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x10
    sta.b 0x1F
    lda.b #0x06
    sta.b 0x02
.A4A2:
    jsl 0x84AB6E
    rts

.A4A7:
    jsr .A508
    jsl _848EEA
    lda.b 0x2B
    and.b #0x04
    bne .A4C8

    lda.b #0x08
    sta.b 0x02
    lda.b #0x02
    jsl _848EEA.8F07
    lda.b #0xFF
    sta.b 0x2F
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
.A4C8:
    jsl 0x84AB6E
    rts

.A4CD:
    jsr .A508
    lda.b 0x2B
    and.b #0x04
    beq .A4EC

    lda.b #0x06
    sta.b 0x02
    lda.b #0x01
    jsl _848EEA.8F07
    stz.b 0x2F
    stz.b 0x1E
    lda.b #0x10
    sta.b 0x1F
    stz.b 0x1C
    stz.b 0x1D
.A4EC:
    jsl 0x84AB6E
    rts

.A4F1:
    jsl 0x84A51A
.A4F5:
    lda.b #0x4C
    jsl _80888B
    jsr .A55B
    stz.w 0x0C25
    dec.w 0x0BDD
    jml 0x8283A3

//-----

.A508:
    lda.b 0x11
    asl
    asl
    bcs .A526

    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.b 0x1A
    cmp.w #0xFC00
    bpl .A53C

    lda.w #0xFC00
    sta.b 0x1A
    ldx.b #0x00
    stx.b 0x1F
    bra .A53C

.A526:
    jsl update_pos_xy.neg_ay_pos_ax
    rep #0x20
    lda.b 0x1A
    cmp.w #0x0400
    bmi .A53C

    lda.w #0x0400
    sta.b 0x1A
    ldx.b #0x00
    stx.b 0x1F
.A53C:
    lda.b 0x1C
    cmp.w #0xFA00
    bpl .A548

    lda.w #0xFA00
    sta.b 0x1C
.A548:
    sep #0x20
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x03
    beq .A55A

    lda.b #0x04
    sta.b 0x01
    inc.b 0x30
.A55A:
    rts

//-----

.A55B:
    lda.b #0x06
    sta.b 0x38
.A55F:
    jsl _8282AC.82ED
    bne .A598

    inc.w 0x0000,X
    lda.b 0x38
    ror
    ror
    ror
    and.b #0x40
    eor.b 0x11
    sta.w 0x0011,X
    lda.b #0x02
    sta.w 0x000A,X
    lda.b 0x38
    cmp.b #0x03
    lda.b #0x01
    bcs .A583

    lda.b #0x02
.A583:
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dec.b 0x38
    bne .A55F

.A598:
    sep #0x30
    rts
