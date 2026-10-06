crusher:
    ldx.b 0x01
    jsr (.9690,X)
    lda.b 0x11
    and.b #0x3F
    ora.b 0x33
    sta.b 0x11
    rtl

.9690: d16[.9696, .9709, .9930]

.9696:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x28
    lda.b #0x30
    tsb.b 0x11
    lda.b #0x04
    sta.b 0x26
    sta.b 0x27
    jsl 0x84A1D0
    cpy.b #0x04
    bcc .96B5

    jsl 0x828387
    rts

.96B5:
    lda.b #0x04
    sta.b 0x12
    cpy.b #0x02
    bne .96CD

    rep #0x10
    ldx.w 0x0000
    lda.w 0x0012,X
    cmp.b #0x04
    bcc .96CB

    stz.b 0x12
.96CB:
    sep #0x10
.96CD:
    lda.b #0x40
    sta.b 0x1E
    jsl 0x828358
    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    stx.b 0x34
    rep #0x21
    tdc
    sta.w 0x000C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    lda.b 0x12
    adc.w #0x0002
    sta.w 0x0012,X
    sep #0x10
    ldx.b #0x00
    stx.b 0x33
    lda.w #0xC8CE
    sta.b 0x20
    lda.b 0x05
    sta.b 0x3B
    sep #0x20
    rts

.9709:
    jsl 0x82806E
    bcc .971F

    lda.b #0x04
    sta.b 0x01
    rep #0x10
    ldx.b 0x34
    lda.b #0x04
    sta.w 0x0001,X
    sep #0x10
    rts

.971F:
    sep #0x20
    ldx.b 0x02
    jsr (.9764,X)
    lda.l 0x7F831E
    sta.b 0x11
    jsl 0x8280B4
    jsl 0x849B43
    beq .975F

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .975F

    lda.b #0x06
    sta.b 0x02
    rep #0x10
    ldx.b 0x34
    lda.b #0x7F
    sta.w 0x002A,X
    lda.w 0x0027,X
    and.b #0x7F
    beq .975C

    lda.b #0x08
    sta.w 0x0002,X
    stz.w 0x0003,X
.975C:
    sep #0x10
    rts

.975F:
    jsl 0x849B03
    rts

.9764: d16[.976C, .9808, .9847, .9921]

.976C:
    ldx.b 0x03
    bne .9799

    rep #0x10
    inc.b 0x03
    ldx.b 0x34
    stz.w 0x0002,X
    stz.w 0x0003,X
    sep #0x10
    rep #0x20
    lda.w #0x00C0
    bit.b 0x32
    bvs .978A

    lda.w #0xFF40
.978A:
    sta.b 0x1A
    sep #0x20
    lda.b #0x20
    sta.b 0x36
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.9799:
    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x3B
    sta.w 0x0000
    bpl .97A9

    eor.w #0xFFFF
    inc
.97A9:
    cmp.w #0x0040
    bcc .97C1

    lda.w #0xFF40
    ldx.b #0x00
    bit.w 0x0000
    bpl .97BD

    lda.w #0x00C0
    ldx.b #0x40
.97BD:
    sta.b 0x1A
    stx.b 0x33
.97C1:
    sep #0x20
    jsl update_pos_x
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x03
    beq .97E3

    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
    lda.b 0x33
    eor.b #0x40
    sta.b 0x33
.97E3:
    lda.b 0x36
    beq .97EB

    dec.b 0x36
    bra .9801

.97EB:
    lda.b 0x05
    and.b #0x0F
    bne .9801

    jsr .9935
    bne .97FD

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    rts

.97FD:
    lda.b #0x1E
    sta.b 0x36
.9801:
    jsl _848EEA
    jmp .998E

.9808:
    ldx.b 0x03
    bne .9823

    inc.b 0x03
    rep #0x10
    ldx.b 0x34
    lda.b #0x02
    sta.w 0x0002,X
    stz.w 0x0003,X
    sep #0x10
    lda.b #0x02
    jsl _848EEA.8F07
    rts

.9823:
    lda.b 0x0F
    bpl .9840

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rep #0x10
    ldx.b 0x34
    lda.b #0x04
    sta.w 0x0002,X
    stz.w 0x0003,X
    ldx.w #0x0002
    stx.b 0x37
    sep #0x10
.9840:
    jsl _848EEA
    jmp .998E

.9847:
    ldx.b 0x03
    jmp (.984C,X)

.984C: d16[.9858, .986F, .98C1, .98E8, .98FF, .990C]

.9858:
    lda.b #0x02
    sta.b 0x03
    lda.b 0x08
    sta.b 0x39
    lda.b 0x09
    sta.b 0x3A
    lda.b #0x08
    sta.b 0x36
    lda.b #0x0C
    jsl _848EEA.8F07
    rts

.986F:
    dec.b 0x36
    bne .98A2

    lda.b #0x04
    sta.b 0x03
    stz.b 0x37
    stz.b 0x38
    jsl 0x8282D3
    bne .989F

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
.989F:
    sep #0x10
    rts

.98A2:
    lda.w 0x0B9C
    lsr
    bcc .98BA

    rep #0x21
    lda.b 0x05
    adc.b 0x37
    sta.b 0x05
    lda.b 0x37
    eor.w #0xFFFF
    inc
    sta.b 0x37
    sep #0x20
.98BA:
    jsl _848EEA
    jmp .998E

.98C1:
    lda.b 0x37
    beq .98E3

    bpl .98D7

    lda.b #0x0A
    sta.b 0x03
    rep #0x20
    stz.b 0x1A
    lda.w #0xFE00
    sta.b 0x1C
    sep #0x20
    rts

.98D7:
    lda.b #0x06
    sta.b 0x03
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x01
    sta.b 0x1D
.98E3:
    jsl _848EEA
    rts

.98E8:
    jsl update_pos_y
    rep #0x20
    lda.b 0x39
    cmp.b 0x08
    sep #0x20
    bcc .98FA

    lda.b #0x08
    sta.b 0x03
.98FA:
    jsl _848EEA
    rts

.98FF:
    lda.b 0x37
    bne .9907

    stz.b 0x02
    stz.b 0x03
.9907:
    jsl _848EEA
    rts

.990C:
    jsl update_pos_xy.pos_ay_neg_ax
    lda.b 0x1D
    cmp.b #0x02
    bmi .991C

    lda.b #0x04
    sta.b 0x03
    stz.b 0x37
.991C:
    jsl _848EEA
    rts

.9921:
    lda.b #0x04
    sta.b 0x01
    jsl 0x84A4AB
    lda.b #0x03
    jsl 0x84A37F
    rts

.9930:
    jsl 0x828387
    rts

;-----

.9935:
    stz.b 0x2A
    lda.b #0xF8
    sta.b 0x29
    jsr .9948
    bne .9947

    lda.b #0x08
    sta.b 0x29
    jsr .9948
.9947:
    rts

;-----

.9948:
    lda.b #0x10
    sta.b 0x36
    rep #0x20
    lda.b 0x08
    sta.b 0x37
.9952:
    jsl _8490A0
    cmp.w #0x000D
    bcs .9962

    cmp.w #0x0000
    beq .9971

    bra .9980

.9962:
    cmp.w #0x0034
    beq .9980

    cmp.w #0x0035
    beq .9987

    cmp.w #0x003B
    beq .9987

.9971:
    lda.b 0x08
    clc
    adc.w #0x0010
    sta.b 0x08
    ldx.b 0x36
    dex
    stx.b 0x36
    bne .9952

.9980:
    lda.b 0x37
    sta.b 0x08
    sep #0x20
    rts

.9987:
    lda.b 0x37
    sta.b 0x08
    sep #0x22
    rts

;-----

.998E:
    rep #0x30
    ldx.b 0x34
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x30
    rts
