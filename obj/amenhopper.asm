amenhopper:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.AB05,X)
    jsl 0x849B43
    beq .AAF7

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .AAF7

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
.AAF3:
    jml 0x828387

.AAF7:
    jsl 0x849B03
    jsl 0x82806E
    bcs .AAF3

    jml 0x8280B4

.AB05: d16[.AB0F, .AB3F, .AC10, .AD0E, .AD2C]

.AB0F:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x04
    sta.b 0x12
    lda.b #0x02
    sta.b 0x26
    lda.b #0x02
    sta.b 0x27
    lda.b #0x3C
    sta.b 0x35
    stz.b 0x38
    rep #0x20
    lda.w #0xCB6D
    sta.b 0x20
    lda.b 0x05
    sta.b 0x36
    sep #0x20
    lda.b #0x04
    jsl 0x848F07
    rts

.AB3F:
    ldx.b 0x02
    jmp (.AB44,X)

.AB44: d16[.AB4C, .AB64, .ABE8, .ABF7]

.AB4C:
    rep #0x20
    stz.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x04
    jsl 0x848F07
    lda.b #0x02
    sta.b 0x02
.AB64:
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    rep #0x20
    lda.b 0x1C
    cmp.w #0xF800
    bpl .AB7E

    lda.w #0xF800
    sta.b 0x1C
.AB7E:
    sep #0x20
    lda.b 0x2B
    and.b #0x04
    beq .AB91

    lda.b #0x06
    sta.b 0x02
    lda.b #0x05
    jsl 0x848F07
    rts

.AB91:
    lda.b 0x2E
    cmp.b #0x0E
    beq .AB9B

    cmp.b #0x0D
    bne .ABE7

.AB9B:
    lda.b #0x04
    sta.b 0x02
    lda.b #0x05
    jsl 0x848F07
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0007
    and.w #0xFFF0
    sta.w 0x0000
    lda.w 0x1F2D
    and.w #0x00FF
    clc
    adc.w 0x0000
    sec
    sbc.w #0x0007
    sta.b 0x08
    sep #0x20
    jsl 0x8282D3
    bne .ABE5

    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
    rep #0x20
    lda.w 0x0000
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
.ABE5:
    sep #0x30
.ABE7:
    rts

.ABE8:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .ABF6

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.ABF6:
    rts

.ABF7:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .AC0F

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    lda.b #0x01
    ldx.b 0x38
    beq .AC0D

    lda.b #0x78
.AC0D:
    sta.b 0x34
.AC0F:
    rts

.AC10:
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0007
    and.w #0xFFF0
    sta.w 0x0000
    lda.w 0x1F2D
    and.w #0x00FF
    clc
    adc.w 0x0000
    sec
    sbc.w #0x0007
    sta.b 0x08
    sep #0x20
    ldx.b 0x02
    jmp (.AC35,X)

.AC35: d16[.AC3D, .AC66, .AC81, .ACCC]

.AC3D:
    jsr .ADB6
    lda.b #0x02
    sta.b 0x02
    lda.b #0x01
    jsl 0x848F07
    stz.b 0x1E
    lda.b #0x1C
    sta.b 0x1F
    lda.b 0x11
    asl
    asl
    rep #0x20
    bcc .AC5D

    lda.w #0x0460
    bra .AC60

.AC5D:
    lda.w #0xFBA0
.AC60:
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
.AC66:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .AC80

    lda.b #0x02
    jsl 0x848F07
    lda.b 0x11
    asl
    asl
    lda.b #0x04
    bcc .AC7E

    lda.b #0x06
.AC7E:
    sta.b 0x02
.AC80:
    rts

.AC81:
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay_pos_ax
    jsr .ADE2
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x02
    beq .ACB8

    lda.b #0xE6
    sta.b 0x29
    lda.b #0xE0
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .ACC3

    lda.b #0x40
    tsb.b 0x11
    lda.b #0x06
    sta.b 0x02
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
.ACB8:
    rep #0x20
    lda.b 0x1A
    sep #0x20
    bne .ACC2

    stz.b 0x02
.ACC2:
    rts

.ACC3:
    lda.b #0x08
    sta.b 0x01
    stz.b 0x02
    stz.b 0x38
    rts

.ACCC:
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay_ax
    jsr .ADE2
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x01
    beq .AD03

    lda.b #0x1A
    sta.b 0x29
    lda.b #0xE0
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .ACC3

    lda.b #0x40
    trb.b 0x11
    lda.b #0x04
    sta.b 0x02
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
.AD03:
    rep #0x20
    lda.b 0x1A
    sep #0x20
    bne .AD0D

    stz.b 0x02
.AD0D:
    rts

.AD0E:
    jsl 0x848EEA
    dec.b 0x34
    bne .AD22

    jsr .ADB6
    lda.b #0x08
    sta.b 0x01
    lda.b #0x01
    sta.b 0x38
    rts

.AD22:
    lda.b 0x34
    cmp.b #0x28
    bne .AD2B

    jsr .ADEA
.AD2B:
    rts

.AD2C:
    ldx.b 0x02
    jmp (.AD31,X)

.AD31: d16[.AD37, .AD5E, .AD9B]

.AD37:
    lda.b #0x02
    sta.b 0x02
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0140
    bcs .AD49

    lda.w #0xFEC0
.AD49:
    sta.b 0x1A
    lda.w #0x0421
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x03
    jsl 0x848F07
    bra .AD76

.AD5E:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .AD76

    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0006
    sta.b 0x08
    sep #0x20
    lda.b #0x04
    sta.b 0x02
.AD76:
    lda.b 0x38
    bne .AD98

    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0007
    and.w #0xFFF0
    sta.w 0x0000
    lda.w 0x1F2D
    and.w #0x00FF
    clc
    adc.w 0x0000
    sec
    sbc.w #0x0007
    sta.b 0x08
.AD98:
    sep #0x20
    rts

.AD9B:
    jsl update_pos_xy.neg_ay
    jsl 0x848EEA
    jsl 0x8491BE
    rep #0x20
    lda.b 0x1C
    sep #0x20
    bpl .ADB5

    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
.ADB5:
    rts

;-----

.ADB6:
    lda.b #0x40
    trb.b 0x11
    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x36
    bcs .ADC7

    eor.w #0xFFFF
    inc
.ADC7:
    cmp.w #0x0080
    bcc .ADD3

    lda.b 0x36
    sec
    sbc.b 0x05
    bra .ADD9

.ADD3:
    lda.w 0x0BAD
    sec
    sbc.b 0x05
.ADD9:
    sep #0x20
    lda.b #0x00
    ror
    ror
    tsb.b 0x11
    rts

;-----

.ADE2:
    dec.b 0x35
    bne .AE10

    lda.b #0x3C
    sta.b 0x35
.ADEA:
    jsl 0x849086
    and.b #0x1F
    cmp.b #0x0B
    bcs .AE0E

    jsl 0x828358
    bne .AE0E

    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.AE0E:
    sep #0x30
.AE10:
    rts
