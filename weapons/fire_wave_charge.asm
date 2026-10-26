fire_wave_charge:
    ldx.b 0x01
    jsr (.9DDA,X)
    rtl

.9DDA: d16[.9DE4, .9E38, .9E2A, .9E2A, .9E2A]

.9DE4:
    lda.b #0x02
    sta.b 0x01
    inc.w 0x0C25
    lda.b #0x08
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    stz.b 0x38
    stz.b 0x39
    lda.b 0x0B
    bpl .9E05

    lda.b #0x02
    sta.b 0x02
    sta.b 0x38
    stz.b 0x03
    bra .9E1A

.9E05:
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    jsl _839518
    lda.b #0xCD
    sta.b 0x20
    lda.b #0xBF
    sta.b 0x21
.9E1A:
    lda.b #0xF0
    sta.b 0x2A
    jsr .9F65
    lda.b #0x8C
    sta.b 0x16
    lda.b #0x80
    sta.b 0x17
.9E29:
    rts

.9E2A:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.9E38:
    ldx.b 0x02
    jsr (.9E62,X)
    lda.b 0x00
    beq .9E29

    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    lda.b 0x02
    cmp.b #0x06
    beq .9E29

    jsl _82808F.80B4
    lda.b 0x0E
    bne .9E5B

    lda.b #0x04
    sta.b 0x02
.9E5B:
    lda.b 0x30
    eor.b #0x01
    sta.b 0x30
    rts

.9E62: d16[.9E6A, .9EBA, .9EE0, .9EED]

.9E6A:
    ldx.b 0x03
    bne .9E90

    inc.b 0x03
    stz.b 0x30
    rep #0x20
    lda.w #0x0180
    bit.b 0x10
    bvs .9E7E

    lda.w #0xFE80
.9E7E:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.9E90:
    jsl _8491AD.91BE
    lda.b 0x2B
    bit.b #0x04
    beq .9EA0

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
.9EA0:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.w #0xFE00
    cmp.b 0x1C
    bmi .9EAF

    sta.b 0x1C
.9EAF:
    sep #0x20
    jsl _848EEA
    stz.b 0x2A
    jmp .9F65

.9EBA:
    ldx.b 0x03
    bne .9ED1

    inc.b 0x03
    stz.b 0x30
    lda.b #0x61
    jsl _80888B
    lda.b #0x00
    jsl _848EEA.8F07
    jmp .9F2A

.9ED1:
    lda.b 0x0F
    bpl .9ED9

    lda.b #0x04
    sta.b 0x02
.9ED9:
    jsl _848EEA
    jmp .9F2A

.9EE0:
    inc.b 0x30
    dec.w 0x0BDD
    dec.w 0x0C25
    jsl _8283A3
    rts

.9EED:
    ldx.b 0x03
    bne .9EFB

    inc.b 0x03
    inc.b 0x30
    stz.b 0x2F
    lda.b #0x01
    sta.b 0x37
.9EFB:
    lda.b #0xF0
    sta.b 0x2A
    jsr .9F65
    dec.b 0x37
    bne .9F0D

    lda.b #0x0A
    sta.b 0x37
    jsr .9F3B
.9F0D:
    jsl update_pos_x
    jsl _8491AD.91BE
    jsl _82806E
    bcs .9F25

    lda.b 0x2B
    bit.b #0x04
    beq .9F25

    bit.b #0x03
    beq .9F29

.9F25:
    lda.b #0x04
    sta.b 0x02
.9F29:
    rts

.9F2A:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xBFB9
    sta.b 0x20
    sep #0x20
    rts

//-----

.9F3B:
    jsl _82833E
    bne .9F62

    inc.w 0x0000,X
    inc.w 0x0BDD
    lda.b #0x13
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b #0x80
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.9F62:
    sep #0x30
    rts

//-----

.9F65:
    stz.b 0x29
    jsl _8490A0
    and.b #0x3F
    cmp.b #0x0E
    beq .9F7E

    cmp.b #0x0D
    beq .9F7E

    cmp.b #0x34
    bcc .9F84

    lda.w 0x0C18
    beq .9F84

.9F7E:
    lda.b #0x04
    sta.b 0x02
    bra .9F85

.9F84:
    rts

.9F85:
    jsl _8282AC.82D3
    bne .9FA7

    inc.w 0x0000,X
    lda.b #0x31
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.9FA7:
    sep #0x30
    rts
