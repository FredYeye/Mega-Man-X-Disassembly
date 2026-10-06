gun_volt:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.DA25,X)
    jsl 0x849B03
    jsl 0x849B43
    beq .DA13

    lda.b 0x27
    and.b #0x7F
    bne .DA0F

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
    jml 0x828398

.DA0F:
    lda.b #0x0E
    trb.b 0x11
.DA13:
    lda.b 0x0B
    bmi .DA1D

    jsl 0x82806E
    bcs .DA21

.DA1D:
    jml 0x8280B4

.DA21:
    jml 0x828387

.DA25: d16[.DA2D, .DA6D, .DAA6, .DAD8]

.DA2D:
    jsl 0x82827D
    stz.b 0x37
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x04
    sta.b 0x12
    lda.b #0x03
    sta.b 0x26
    lda.b #0x10
    sta.b 0x27
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x3C
    sta.b 0x34
    rep #0x20
    lda.w #0xCDF5
    sta.b 0x20
    sep #0x20
    lda.b 0x0B
    bmi .DA67

    rep #0x20
    lda.b 0x05
    cmp.w 0x0BAD
    bcc .DA68

    sep #0x20
.DA67:
    rts

.DA68:
    pla
    jml 0x828387

.DA6D:
    jsl 0x848EEA
    dec.b 0x34
    bne .DAA0

    lda.b 0x37
    ldy.b #0x01
    jsl 0x84AC22
    sta.b 0x37
    bpl .DAA1

    jsl 0x849086
    ldx.b #0x04
    lsr
    bcc .DA8C

    ldx.b #0x06
.DA8C:
    stx.b 0x01
    lda.b #0x01
    sta.b 0x35
    jsl 0x849086
    and.b #0x07
    sta.b 0x36
    lda.b #0x01
    jsl 0x848F07
.DAA0:
    rts

.DAA1:
    lda.b #0x3C
    sta.b 0x34
    rts

.DAA6:
    jsl 0x848EEA
    lda.b 0x17
    bpl .DAD7

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    and.b #0x7F
    beq .DAC1

    jsr .DB19
    lda.b #0x1E
    jsl _80888B
.DAC1:
    lda.b 0x0F
    bpl .DAD7

    dec.b 0x35
    bpl .DAD7

    lda.b #0x02
    sta.b 0x01
    lda.b #0x07
    jsl 0x848F07
    lda.b #0x3C
    sta.b 0x34
.DAD7:
    rts

.DAD8:
    jsl 0x848EEA
    lda.b 0x17
    bpl .DB18

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    and.b #0x7F
    beq .DB06

    lda.b #0x44
    jsl _80888B
    lda.b #0xFF
    sta.w 0x0001
    lda.b #0xEF
    sta.w 0x0000
    jsr .DB4C
    stz.w 0x0000
    stz.w 0x0001
    jsr .DB4C
.DB06:
    lda.b 0x0F
    bpl .DB18

    lda.b #0x02
    sta.b 0x01
    lda.b #0x07
    jsl 0x848F07
    lda.b #0x3C
    sta.b 0x34
.DB18:
    rts

;-----

.DB19:
    lda.b 0x36
    asl
    clc
    adc.b 0x35
    tay
    lda 0x86CDF9,Y
    tay
    jsl 0x828358
    bne .DB49

    inc.w 0x0000,X
    lda.b #0x0E
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    lda 0x86CE09,Y
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda 0x86CE11,Y
    clc
    adc.b 0x08
    sta.w 0x0008,X
.DB49:
    sep #0x30
    rts

;-----

.DB4C:
    jsl 0x828358
    bne .DB73

    inc.w 0x0000,X
    lda.b #0x0E
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
    rep #0x20
    lda.w 0x0000
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0006
    sta.w 0x0008,X
.DB73:
    sep #0x30
    rts
