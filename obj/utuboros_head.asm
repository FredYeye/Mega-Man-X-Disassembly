utuboros_head:
    ldx.b 0x01
    jmp (.BD69,X)

.BD69: d16[.BD6F, .BE13, .C1DE]

.BD6F:
    jsl 0x82827D
    lda.b #0x18
    sta.b 0x0A
    jsl 0x84A23A
    tya
    beq .BD8B

    rep #0x30
    ldx.w 0x0000
    stz.w 0x0000,X
    stz.w 0x0002,X
    sep #0x30
.BD8B:
    lda.b #0x23
    sta.b 0x0A
    lda.b #0x48
    sta.b 0x27
    lda.b #0x04
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x06
    sta.b 0x28
    stz.b 0x33
    stz.b 0x39
    stz.b 0x3C
    stz.b 0x3E
    rep #0x20
    stz.b 0x34
    lda.w 0x1E5E
    sta.l 0x7FD700
    lda.w 0x1E60
    sta.l 0x7FD702
    lda.w 0x1E68
    sta.l 0x7FD704
    lda.w 0x1E6E
    sta.l 0x7FD706
    lda.b 0x0B
    and.w #0x00FF
    asl
    tax
    lda.w 0x00CCA5,X
    sta.b 0x05
    lda.w 0x00CCA9,X
    sta.w 0x1E5E
    lda.w 0x00CCAD,X
    sta.w 0x1E60
    lda.w 0x00CCB1,X
    sta.w 0x1E68
    lda.w 0x00CCB5,X
    sta.w 0x1E6E
    lda.w #0xCC33
    sta.b 0x20
    lda.b 0x0B
    and.w #0x00FF
    bne .BE0A

    lda.w #0x0006
    sta.b 0x02
    stz.b 0x03
    lda.w 0x0BAD
    sta.b 0x05
    lda.w #0x02E0
    sta.b 0x08
    inc.b 0x39
.BE0A:
    sep #0x20
    jsr .C2B6
    jsr .C305
    rtl

.BE13:
    ldx.b 0x02
    jsr (.BE9F,X)
    lda.b 0x39
    bne .BE46

    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .BE46

    lda.b 0x0B
    bne .BE30

    lda.b 0x27
    cmp.b #0x24
    bcs .BE3E

.BE30:
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
    bra .BE46

.BE3E:
    inc.b 0x39
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
.BE46:
    jsr .C27D
    lda.b 0x2E
    cmp.b #0x0E
    bne .BE5B

    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
.BE5B:
    lda.l 0x7F832E
    sta.b 0x11
    jsl 0x849B43
    beq .BE87

    inc.b 0x3C
    rep #0x10
    ldx.b 0x3A
    sta.w 0x003C,X
    lda.b 0x27
    sta.w 0x0027,X
    sep #0x10
    lda.b 0x27
    and.b #0x7F
    bne .BE87

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    bra .BE93

.BE87:
    lda.b 0x3C
    beq .BE8F

    lda.b #0x0E
    trb.b 0x11
.BE8F:
    jsl 0x849B03
.BE93:
    lda.b 0x11
    and.b #0x3F
    ora.b 0x33
    sta.b 0x11
    jml 0x8280B4

.BE9F: d16[.BFCB, .C004, .C125, .BEA9, .BF1F]

.BEA9:
    ldx.b 0x03
    jmp (.BEAE,X)

.BEAE: d16[.BEB4, .BED3, .BEF8]

.BEB4:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    stz.b 0x1A
    lda.w #0xFE80
    sta.b 0x1C
    lda.w #0x0010
    sta.w 0x0000
    sep #0x20
    jsr .C35C
    lda.b #0x06
    jsl 0x848F07
    rts

.BED3:
    rep #0x20
    lda.b 0x0B
    and.w #0x00FF
    asl
    tax
    lda.b 0x08
    cmp.w 0x00CCC1,X
    sep #0x20
    bcc .BEED

    lda.b #0xC8
    sta.b 0x36
    lda.b #0x04
    sta.b 0x03
.BEED:
    jsl update_pos_y
    jsl 0x848EEA
    jmp .C37E

.BEF8:
    dec.b 0x36
    bne .BF02

    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
.BF02:
    lda.w 0x0B9C
    lsr
    bcc .BF14

    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
.BF14:
    jsl update_pos_y
    jsl 0x848EEA
    jmp .C37E

.BF1F:
    ldx.b 0x03
    jmp (.BF24,X)

.BF24: d16[.BF2C, .BF85, .BFA9, .BFB8]

.BF2C:
    lda.b #0x02
    sta.b 0x03
    rep #0x30
    ldx.w #0x0040
    jsl 0x849086
    lsr
    bcc .BF3F

    ldx.w #0xFFC0
.BF3F:
    stx.w 0x0000
    lda.w 0x1E4D
    clc
    adc.w #0x0080
    sta.b 0x05
    lda.w #0x0100
    sta.b 0x1C
    lda.w 0x1E56
    clc
    adc.w 0x1E58
    clc
    adc.w #0x0100
    lsr
    sta.w 0x0000
    sep #0x20
    lda.b #0x00
    ldy.w #0xFE9E
    ldx.w 0x0000
    cpx.b 0x05
    bcc .BF72

    lda.b #0x40
    ldy.w #0x0162
.BF72:
    sta.b 0x33
    sty.b 0x1A
    sep #0x10
    stz.b 0x29
    lda.b #0xE0
    sta.b 0x2A
    lda.b #0x00
    jsl 0x848F07
    rts

.BF85:
    jsl 0x8490A0
    cmp.b #0x0D
    bne .BFA2

    lda.b #0x04
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x36
    lda.b #0xE8
    sta.w 0x0000
    lda.b #0xFF
    sta.w 0x0001
    jsr .C35C
.BFA2:
    jsl update_pos_y
    jmp .C37E

.BFA9:
    dec.b 0x36
    bne .BFB5

    lda.b #0x06
    sta.b 0x03
    lda.b #0x78
    sta.b 0x36
.BFB5:
    jmp .C37E

.BFB8:
    dec.b 0x36
    bne .BFC4

    stz.b 0x39
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.BFC4:
    jsl 0x82820A
    jmp .C37E

.BFCB:
    ldx.b 0x03
    jmp (.BFD0,X)

.BFD0: d16[.BFD6, .BFEC, .BFF5]

.BFD6:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0xFE80
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    rts

.BFEC:
    lda.b #0x3C
    sta.b 0x36
    lda.b #0x04
    sta.b 0x03
    rts

.BFF5:
    dec.b 0x36
    bne .BFFF

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.BFFF:
    jsl update_pos_x
    rts

.C004:
    ldx.b 0x03
    bne .C00B

    jmp .C092

.C00B:
    rep #0x21
    lda.w #0x0060
    bit.b 0x32
    bvs .C017

    lda.w #0xFFA0
.C017:
    adc.b 0x05
    cmp.w 0x1E56
    bcc .C02C

    sbc.w #0x0100
    cmp.w 0x1E58
    bcs .C02C

    dec.b 0x36
    bne .C039

    bra .C030

.C02C:
    sep #0x20
    inc.b 0x3E
.C030:
    sep #0x20
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.C039:
    ldx.b 0x0B
    beq .C069

    lda.b 0x08
    clc
    adc.w #0xFFB0
    cmp.w 0x1E5A
    bcs .C054

    lda.b 0x1C
    bmi .C069

    eor.w #0xFFFF
    inc
    sta.b 0x1C
    bra .C069

.C054:
    lda.b 0x08
    clc
    adc.w #0xFFB0
    cmp.w 0x1E5C
    bcc .C069

    lda.b 0x1C
    bpl .C069

    eor.w #0xFFFF
    inc
    sta.b 0x1C
.C069:
    sep #0x20
    jsl 0x82820A
    lda.b 0x27
    bpl .C083

    lda.b #0x08
    sta.b 0x3D
    lda.b #0x36
    jsl _80888B
    lda.b #0x08
    jsl 0x848F07
.C083:
    lda.b 0x3D
    beq .C091

    dec.b 0x3D
    bne .C091

    lda.b #0x00
    jsl 0x848F07
.C091:
    rts

.C092:
    inc.b 0x03
    lda.b #0xC8
    sta.b 0x36
    lda.b #0x00
    sta.b 0x37
    jsl 0x84A07C
    tax
    bit.b 0x33
    bvc .C0E5

    cmp.b #0x06
    bcs .C0AB

    ldx.b #0x06
.C0AB:
    cmp.b #0x0B
    bcc .C0B9

    cmp.b #0x18
    bcc .C0B7

    ldx.b #0x06
    bra .C0CC

.C0B7:
    ldx.b #0x0A
.C0B9:
    cmp.b #0x08
    bne .C0CC

    ldx.b #0x07
    rep #0x10
    ldy.w 0x0BB0
    cpy.b 0x08
    bcc .C0CA

    inx
    inx
.C0CA:
    sep #0x10
.C0CC:
    txa
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00CC25,X
    sta.b 0x1A
    lda.w 0x00CC27,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    rts

.C0E5:
    cmp.b #0x16
    bcs .C0F3

    cmp.b #0x08
    bcs .C0F1

    ldx.b #0x1A
    bra .C10C

.C0F1:
    ldx.b #0x16
.C0F3:
    cmp.b #0x1B
    bcc .C0F9

    ldx.b #0x1A
.C0F9:
    cmp.b #0x18
    bne .C10C

    ldx.b #0x17
    rep #0x10
    ldy.w 0x0BB0
    cpy.b 0x08
    bcs .C10A

    inx
    inx
.C10A:
    sep #0x10
.C10C:
    txa
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00CBF9,X
    sta.b 0x1A
    lda.w 0x00CBFB,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    rts

.C125:
    ldx.b 0x03
    beq .C158

    dec.b 0x36
    bne .C14F

    lda.b #0x08
    sta.b 0x36
    inc.b 0x38
    rep #0x20
    jsr .C255
    sep #0x20
    beq .C14F

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    lda.b 0x33
    eor.b #0x40
    sta.b 0x33
    lda.b #0x00
    jsl 0x848F07
    rts

.C14F:
    jsl 0x82820A
    jsl 0x848EEA
    rts

.C158:
    inc.b 0x03
    rep #0x20
    ldx.b #0x40
    lda.w 0x0BAD
    cmp.b 0x05
    bcs .C167

    ldx.b #0x00
.C167:
    cpx.b 0x33
    bne .C17E

    sep #0x20
    txa
    eor.b #0x40
    tax
    lda.b 0x3E
    stz.b 0x3E
    bne .C17E

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    rts

.C17E:
    rep #0x20
    lda.b 0x0B
    and.w #0x007F
    asl
    tay
    lda 0x00CCB9,Y
    sta.w 0x0000
    lda 0x00CCBD,Y
    sta.w 0x0002
    lda.b 0x27
    and.w #0x00FF
    cmp.w #0x0024
    bcc .C1A3

    lda.w #0x7F00
    sta.w 0x0002
.C1A3:
    ldy.b #0x00
    cpx.b #0x40
    beq .C1AB

    ldy.b #0x20
.C1AB:
    lda.b 0x08
    cmp.w 0x0BB0
    bcc .C1C0

    cmp.w 0x0000
    bcc .C1C0

.C1B7:
    tya
    and.w #0x00FF
    clc
    adc.w #0x0010
    tay
.C1C0:
    tyx
    beq .C1C7

    cpy.b #0x20
    bne .C1CC

.C1C7:
    cmp.w 0x0002
    bcs .C1B7

.C1CC:
    sty.b 0x38
    jsr .C255
    sep #0x20
    lda.b #0x08
    sta.b 0x36
    lda.b #0x00
    jsl 0x848F07
    rts

.C1DE:
    ldx.b 0x02
    jmp (.C1E3,X)

.C1E3: d16[.C1E9, .C1FF, .C223]

.C1E9:
    lda.b #0x02
    sta.b 0x02
    jsr .C32A
    jsl 0x84A4AB
    stz.b 0x29
    lda.b #0xF0
    sta.b 0x2A
    lda.b #0x78
    sta.b 0x36
    rtl

.C1FF:
    jsl 0x8490A0
    cmp.b #0x0E
    bne .C213

    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
.C213:
    jsl 0x82820A
    jsr .C27D
    dec.b 0x36
    bne .C222

    lda.b #0x04
    sta.b 0x02
.C222:
    rtl

.C223:
    lda.b #0x25
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x23
    sta.b 0x0A
    tya
    bne .C254

    rep #0x20
    lda.l 0x7FD700
    sta.w 0x1E5E
    lda.l 0x7FD702
    sta.w 0x1E60
    lda.l 0x7FD704
    sta.w 0x1E68
    lda.l 0x7FD706
    sta.w 0x1E6E
    jsl 0x828398
.C254:
    rtl

;-----

.C255:
    ldy.b 0x38
    lda 0x00CC65,Y
    and.w #0x00FF
    bit.w #0x0080
    bne .C27C

    asl
    asl
    tax
    lda.w 0x00EE3A,X
    clc
    bpl .C26C

    sec
.C26C:
    ror
    sta.b 0x1A
    lda.w 0x00EE3C,X
    clc
    bpl .C276

    sec
.C276:
    ror
    sta.b 0x1C
    lda.w #0x0000
.C27C:
    rts

;-----

.C27D:
    rep #0x30
    lda.b 0x05
    cmp.b 0x22
    bne .C28B

    lda.b 0x08
    cmp.b 0x24
    beq .C2B3

.C28B:
    ldx.b 0x34
    lda.b 0x05
    sta.l 0x7FD200,X
    lda.b 0x08
    sta.l 0x7FD202,X
    sep #0x20
    lda.b 0x0F
    and.b #0x7F
    ora.b 0x33
    sta.l 0x7FD204,X
    rep #0x20
    txa
    inc
    inc
    inc
    inc
    inc
    and.w #0x03FF
    tax
    stx.b 0x34
.C2B3:
    sep #0x30
    rts

;-----

.C2B6:
    rep #0x10
    ldy.w #0x0000
.C2BB:
    jsl 0x828321
    inc.w 0x0000,X
    lda.b #0x24
    sta.w 0x000A,X
    tya
    asl
    sta.w 0x000B,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    iny
    cpy.w #0x0006
    bne .C2BB

    jsl 0x828321
    inc.w 0x0000,X
    lda.b #0x25
    sta.w 0x000A,X
    stx.b 0x3A
    rep #0x20
    tdc
    sta.w 0x000C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x30
    rts

;-----

.C305:
    rep #0x30
    pea 0x867F
    plb
    ldx.w #0x0400
.C30E:
    lda.b 0x05
    sta.w 0xD200,X
    lda.b 0x08
    sta.w 0xD202,X
    sep #0x20
    stz.w 0xD204,X
    rep #0x20
    dex
    dex
    dex
    dex
    dex
    bpl .C30E

    plb
    sep #0x30
    rts

;-----

.C32A:
    jsl 0x8282D3
    inc.w 0x0000,X
    lda.b #0x1A
    sta.w 0x000A,X
    lda.l 0x7F832E
    ora.b 0x33
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x0F
    and.b #0x7F
    sta.w 0x0017,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    sep #0x10
    rts

;-----

.C35C:
    jsl 0x828307
    bne .C37B

    inc.w 0x0000,X
    lda.b #0x12
    sta.w 0x000A,X
    rep #0x21
    lda.b 0x08
    adc.w 0x0000
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    sep #0x20
.C37B:
    sep #0x10
    rts

;-----

.C37E:
    lda.w 0x0B9C
    and.b #0x0F
    bne .C38B

    lda.b #0x35
    jsl _80888B
.C38B:
    rts
