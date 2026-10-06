sine_faller:
    lda.b 0x36
    tsb.b 0x11
    ldx.b 0x01
    jsr (.D30C,X)
    jsl 0x849B03
    beq .D2DD

    inc.b 0x3B
.D2DD:
    jsl 0x849B43
    beq .D2FF

    lda.b #0x0E
    trb.b 0x11
    stz.b 0x1A
    stz.b 0x1B
    lda.b 0x27
    and.b #0x7F
    bne .D2FF

    lda.b #0x00
    jsl 0x84A37F
    jsl 0x84A4AB
.D2FB:
    jml 0x828398

.D2FF:
    lda.b 0x00
    beq .D30B

    jsl 0x8280B4
    lda.b 0x0E
    beq .D2FB

.D30B:
    rtl

.D30C: d16[.D318, .D377, .D39D, .D444, .D473, .D4A2]

.D318:
    jsl 0x84A1D0
    cpy.b #0x03
    bcc .D325

    jsl 0x828398
    rts

.D325:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x36
    stz.b 0x3B
    lda.b #0x01
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    rep #0x20
    stz.b 0x1A
    lda.w #0xFE00
    sta.b 0x1C
    lda.w #0xC8D8
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b 0x0B
    beq .D372

    lda.l 0x7F8211
    sta.b 0x18
    lda.l 0x7F8311
    sta.b 0x11
    and.b #0x0E
    sta.b 0x36
    lda.b #0x13
    sta.b 0x16
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.D372:
    lda.b #0x30
    tsb.b 0x11
    rts

.D377:
    jsl _848EEA
    jsl update_pos_xy.no_accel
    rep #0x20
    lda.w 0x1E50
    clc
    adc.w #0x0020
    sec
    sbc.b 0x08
    bcs .D398

    cmp.w #0x0040
    bcc .D398

    sep #0x20
    lda.b #0x04
    sta.b 0x01
.D398:
    sep #0x20
    jmp .D4F5

.D39D:
    lda.b 0x3B
    beq .D3A8

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    rts

.D3A8:
    jsl _848EEA
    ldx.b 0x02
    jsr (.D3B9,X)
    lda.b 0x0B
    beq .D3B8

    jmp 0x81D529

.D3B8:
    rts

.D3B9: d16[.D3BF, .D3DD, .D425]

.D3BF:
    rep #0x20
    stz.b 0x1A
    lda.w #0xFFC0
    sta.b 0x1C
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    sep #0x20
    stz.b 0x34
    ror.b 0x34
    lda.b #0x40
    sta.b 0x1F
    lda.b #0x02
    sta.b 0x02
    rts

.D3DD:
    lda.b 0x34
    bmi .D3E7

    jsl update_pos_xy.pos_ay_ax
    bra .D3EB

.D3E7:
    jsl update_pos_xy.pos_ay_neg_ax
.D3EB:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    xba
    and.b #0x80
    eor.b 0x34
    beq .D404

    lda.b #0x20
    sta.b 0x1F
    lda.b #0x04
    sta.b 0x02
.D404:
    rep #0x20
    lda.b 0x1A
    bmi .D416

    cmp.w #0x0400
    bmi .D420

    lda.w #0x0400
    sta.b 0x1A
    bra .D420

.D416:
    cmp.w #0xFC00
    bpl .D420

    lda.w #0xFC00
    sta.b 0x1A
.D420:
    sep #0x20
    jmp .D4F5

.D425:
    rep #0x20
    lda.b 0x1A
    sep #0x20
    bne .D432

    stz.b 0x02
    jmp .D4F5

.D432:
    lda.b 0x34
    bmi .D43D

    jsl update_pos_xy.pos_ay_neg_ax
    jmp .D4F5

.D43D:
    jsl update_pos_xy.pos_ay_ax
    jmp .D4F5

.D444:
    lda.b 0x02
    bne .D463

    inc.b 0x02
    rep #0x20
    lda.w #0x0400
    sta.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b 0x36
    tsb.b 0x11
    lda.b 0x0B
    bne .D463

    lda.b #0x01
    jsl _848EEA.8F07
.D463:
    jsl update_pos_xy.no_accel
    jsl _848EEA
    lda.b 0x0B
    beq .D472

    jmp 0x81D529

.D472:
    rts

.D473:
    lda.b 0x02
    bne .D48B

    inc.b 0x02
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x01
    jsl _848EEA.8F07
.D48B:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .D4A1

    lda.b #0x0A
    sta.b 0x01
    lda.b #0x02
    sta.b 0x02
.D4A1:
    rts

.D4A2:
    ldx.b 0x02
    jmp (.D4A7,X)

.D4A7: d16[.D4AF, .D4B9, .D4D9, .D4F0]

.D4AF:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x01
    jsl _848EEA.8F07
.D4B9:
    jsl _848EEA
    lda.b 0x0F
    bpl .D4D8

    lda.b #0x04
    sta.b 0x02
    lda.b #0x02
    jsl _848EEA.8F07
    lda.b #0x30
    sta.b 0x35
    rep #0x20
    lda.w #0xFFC0
    sta.b 0x1C
    sep #0x20
.D4D8:
    rts

.D4D9:
    jsl _848EEA
    jsl update_pos_y
    dec.b 0x35
    bne .D4EF

    lda.b #0x06
    sta.b 0x02
    lda.b #0x03
    jsl _848EEA.8F07
.D4EF:
    rts

.D4F0:
    jsl _848EEA
    rts

.D4F5:
    lda.b 0x00
    beq .D51F

    rep #0x20
    lda.b 0x37
    sec
    sbc.w 0x0BAD
    bcs .D507

    eor.w #0xFFFF
    inc
.D507:
    cmp.w #0x0100
    bcs .D520

    lda.b 0x39
    sec
    sbc.w 0x0BB0
    bcs .D518

    eor.w #0xFFFF
    inc
.D518:
    cmp.w #0x00C0
    bcs .D520

    sep #0x20
.D51F:
    rts

.D520:
    sep #0x20
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    rts

.D529:
    jsl 0x8491BE
    lda.b 0x2B
    beq .D53D

    stz.b 0x02
    ldx.b #0x08
    and.b #0x04
    beq .D53B

    ldx.b #0x0A
.D53B:
    stx.b 0x01
.D53D:
    rts
