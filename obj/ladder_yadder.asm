ladder_yadder:
    ldx.b 0x01
    jmp (.A9E4,X)

.A9E4: d16[.A9EA, .AA0C, .AB6A]

.A9EA:
    jsl 0x82827D
    lda.b #0x03
    sta.b 0x27
    lda.b #0x03
    sta.b 0x28
    lda.b #0x02
    sta.b 0x26
    lda.b #0x20
    sta.b 0x33
    stz.b 0x29
    rep #0x20
    lda.b 0x05
    sta.b 0x35
    lda.w #0xD172
    sta.b 0x20
    rtl

.AA0C:
    jsl 0x82806E
    bcc .AA16

    jml 0x828387

.AA16:
    lda.l 0x7F836C
    and.b #0x0F
    ora.b 0x34
    sta.b 0x11
    ldx.b 0x02
    jsr (.AA4E,X)
    lda.b #0x04
    sta.b 0x12
    bit.b 0x0F
    bvs .AA4A

    lda.b #0x02
    sta.b 0x12
    jsl 0x849B43
    beq .AA46

    bpl .AA42

    jsl 0x84A4AB
    lda.b #0x04
    sta.b 0x01
    rtl

.AA42:
    lda.b #0x0E
    trb.b 0x11
.AA46:
    jsl _849B03
.AA4A:
    jml 0x8280B4

.AA4E: d16[.AA56, .AAA8, .AADB, .AB35]

.AA56:
    ldx.b 0x03
    jmp (.AA5B,X)

.AA5B: d16[.AA61, .AA80, .AA89]

.AA61:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x20
    sta.b 0x37
    lda.b #0x30
    sta.b 0x34
    rep #0x20
    lda.b 0x35
    sta.b 0x05
    lda.w #0x0100
    sta.b 0x1C
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
.AA80:
    dec.b 0x37
    bne .AA88

    lda.b #0x04
    sta.b 0x03
.AA88:
    rts

.AA89:
    dec.b 0x33
    bne .AA9C

    lda.b #0x20
    sta.b 0x33
    lda.b #0x02
    sta.b 0x03
    lda.b #0x20
    sta.b 0x37
    jmp .AB73

.AA9C:
    jsr .AB80
    jsl update_pos_y
    jsl _848EEA
    rts

.AAA8:
    ldx.b 0x03
    bne .AAB4

    inc.b 0x03
    lda.b #0x01
    jsl _848EEA.8F07
.AAB4:
    jsl _848EEA
    lda.b 0x0F
    bpl .AAC1

    lda.b #0x04
    jmp .AB6E

.AAC1:
    and.b #0x0F
    tax
    cmp.b #0x02
    bne .AACC

    lda.b #0x00
    sta.b 0x34
.AACC:
    rep #0x21
    lda.w 0x00D176,X
    and.w #0x00FF
    adc.b 0x35
    sta.b 0x05
    sep #0x20
    rts

.AADB:
    ldx.b 0x03
    jmp (.AAE0,X)

.AAE0: d16[.AAE6, .AB04, .AB0D]

.AAE6:
    lda.b #0x02
    sta.b 0x03
    lda.b 0x35
    sta.b 0x05
    lda.b 0x36
    sta.b 0x06
    lda.b #0x3C
    sta.b 0x38
    lda.b #0x40
    sta.b 0x34
    lda.b #0x20
    sta.b 0x37
    lda.b #0x02
    jsl _848EEA.8F07
.AB04:
    dec.b 0x37
    bne .AB0C

    lda.b #0x04
    sta.b 0x03
.AB0C:
    rts

.AB0D:
    dec.b 0x38
    bne .AB16

    lda.b #0x06
    jmp .AB6E

.AB16:
    dec.b 0x33
    bne .AB29

    lda.b #0x20
    sta.b 0x33
    lda.b #0x02
    sta.b 0x03
    lda.b #0x20
    sta.b 0x37
    jmp .AB73

.AB29:
    jsr .AB80
    jsl update_pos_y
    jsl _848EEA
    rts

.AB35:
    ldx.b 0x03
    bne .AB41

    inc.b 0x03
    lda.b #0x03
    jsl _848EEA.8F07
.AB41:
    jsl _848EEA
    lda.b 0x0F
    bpl .AB4E

    lda.b #0x00
    jmp .AB6E

.AB4E:
    and.b #0x0F
    tax
    bne .AB57

    lda.b #0x70
    sta.b 0x34
.AB57:
    rep #0x20
    lda.w 0x00D176,X
    and.w #0x00FF
    eor.w #0xFFFF
    inc
    adc.b 0x35
    sta.b 0x05
    sep #0x20
    rts

.AB6A:
    jml 0x828387

.AB6E:
    sta.b 0x02
    stz.b 0x03
    rts

.AB73:
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
    rts

;-----

.AB80:
    lda.b #0x10
    ldx.b 0x1D
    bmi .AB88

    lda.b #0xF0
.AB88:
    sta.b 0x2A
    jsl _8490A0
    cmp.b #0x12
    beq .ABA2

    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
    lda.b #0x20
    sta.b 0x33
.ABA2:
    rts
