storm_tornado_charge:
    ldx.b 0x01
    jsr (.9FB8,X)
    lda.b 0x0B
    bne .9FB7

    jml 0x848FCA

.9FB7:
    rtl

.9FB8: d16[.9FC2, .A01D, .A00F, .A00F, .A00F]

.9FC2:
    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x02
    sta.b 0x18
    sta.b 0x30
    stz.b 0x12
    stz.b 0x38
    stz.b 0x39
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    rep #0x21
    lda.w #0xFFA0
    ldx.b 0x0B
    beq .9FEB

    lda.w #0x0060
.9FEB:
    adc.w ram.obj.mega_man.pos_y+1
    sta.b 0x08
    lda.w ram.obj.mega_man.pos_x+1
    sta.b 0x05
    lda.w #0xAECF
    sta.b 0x31
    sep #0x20
    lda.b #0x41
    sta.b 0x16
    lda.b 0x0B
    bne .A00E

    lda.b #0x80
    sta.b 0x17
    inc.w 0x0C25
    jmp .A0B5

.A00E:
    rts

.A00F:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x38
    sta.b 0x02
    lda.b 0x39
    sta.b 0x03
    stz.b 0x30
.A01D:
    ldx.b 0x02
    jsr (.A03B,X)
    lda.b 0x00
    beq .A00E

    lda.b 0x02
    sta.b 0x38
    lda.b 0x03
    sta.b 0x39
    lda.w 0x0B9C
    lsr
    bcs .A038

    jsl _82808F
.A038:
    jmp .A0C9

.A03B: d16[.A043, .A066, .A085, .A0A4]

.A043:
    ldx.b 0x03
    bne .A057

    inc.b 0x03
    stz.b 0x30
    lda.b #0x01
    ldx.b 0x0B
    beq .A053

    lda.b #0x04
.A053:
    jsl _848EEA.8F07
.A057:
    lda.b 0x0F
    bpl .A061

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.A061:
    jsl _848EEA
    rts

.A066:
    ldx.b 0x03
    bne .A076

    inc.b 0x03
    lda.b #0x1E
    sta.b 0x37
    lda.b #0x02
    jsl _848EEA.8F07
.A076:
    dec.b 0x37
    bne .A080

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.A080:
    jsl _848EEA
    rts

.A085:
    ldx.b 0x03
    bne .A097

    inc.b 0x03
    lda.b #0x03
    ldx.b 0x0B
    beq .A093

    lda.b #0x00
.A093:
    jsl _848EEA.8F07
.A097:
    lda.b 0x0F
    bpl .A09F

    lda.b #0x06
    sta.b 0x02
.A09F:
    jsl _848EEA
    rts

.A0A4:
    lda.b 0x0B
    bne .A0B0

    inc.b 0x30
    dec.w 0x0BDD
    dec.w 0x0C25
.A0B0:
    jsl _8283A3
    rts

.A0B5:
    jsl _82833E
    bne .A0C6

    inc.w 0x0000,X
    lda.b #0x14
    sta.w 0x000A,X
    sta.w 0x000B,X
.A0C6:
    sep #0x10
    rts

.A0C9:
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    asl
    asl
    adc.w #0xBFD7
    sta.b 0x20
    sep #0x20
    rts
