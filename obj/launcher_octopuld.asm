launcher_octopuld:
    ldx.b 0x01
    jmp (.C42E,X)

.C42E: d16[.C436, .C48E, .C530, .C9C4]

.C436:
    lda.b 0x02
    bne .C459

    jsl 0x84AACA
    beq .C444

    jml 0x828398

.C444:
    lda.b #0x3C
    sta.b 0x34
    inc.b 0x02
    jsl 0x849FE6
    lda.w 0x1F26
    beq .C459

    lda.b #0x2E
    jsl _80878B
.C459:
    dec.b 0x34
    beq .C45E

    rtl

.C45E:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x04
    sta.b 0x12
    stz.b 0x02
    stz.b 0x36
    lda.b #0xFF
    sta.b 0x2F
    stz.b 0x39
    stz.b 0x3A
    stz.b 0x3C
    lda.b #0x03
    sta.b 0x0C
    stz.b 0x3B
    lda.b #0x04
    sta.b 0x26
    rep #0x20
    lda.w #0xC60A
    sta.b 0x20
    sep #0x20
    rtl

.C48E:
    ldx.b 0x02
    jsr (.C497,X)
    jml 0x8280B4

.C497: d16[.C49F, .C4BE, .C4EB, .C510]

.C49F:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x01
    jsr .CA35
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.b 0x08
    lda.w #0xFF00
    sta.b 0x1C
    sep #0x20
    lda.b #0x28
    sta.b 0x34
    rts

.C4BE:
    jsl update_pos_y
    jsl 0x848EEA
    lda.b 0x34
    beq .C4CE

    dec.b 0x34
    bne .C4EA

.C4CE:
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .C4EA

    lda.b #0x04
    sta.b 0x02
    lda.b #0x02
    jsl 0x848F07
    rep #0x20
    tdc
    sta.w 0x1F0E
    sep #0x20
.C4EA:
    rts

.C4EB:
    jsl 0x848EEA
    inc.b 0x34
    lda.b 0x34
    lsr
    bcc .C50B

    lda.b #0x0C
    jsl _80888B.88B6
    lda.b 0x27
    and.b #0x7F
    inc
    sta.b 0x27
    cmp.b #0x20
    bcc .C50B

    lda.b #0x06
    sta.b 0x02
.C50B:
    lda.b #0x80
    tsb.b 0x27
    rts

.C510:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C52F

    jsl 0x849FFE
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.w 0x1F26
    beq .C52F

    lda.b #0x1E
    jsl _80878B
.C52F:
    rts

.C530:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x02
    jsr (.C5D7,X)
    lda.b #0x0C
    ldx.b 0x3C
    beq .C541

    lda.b #0x05
.C541:
    ldx.b 0x3A
    beq .C547

    lda.b #0x00
.C547:
    sta.b 0x28
    jsl 0x849B43
    beq .C58E

    bmi .C5B8

    lda.b 0x3C
    bne .C58E

    lda.b #0x3C
    sta.b 0x3C
    lda.b 0x02
    sta.b 0x3D
    lda.b #0x08
    sta.b 0x02
    lda.b 0x17
    sta.b 0x2C
    lda.b 0x0F
    sta.b 0x10
    lda.b 0x13
    sta.b 0x3E
    lda.b 0x14
    sta.b 0x31
    lda.b 0x15
    sta.b 0x32
    lda.b #0x04
    jsr .CA35
    lda.b #0x13
    jsl _80888B
    lda.w 0x1F1D
    cmp.b #0x0D
    beq .C58B

    cmp.b #0x16
    bne .C58E

.C58B:
    jsr .CAA7
.C58E:
    lda.b 0x3C
    beq .C59D

    dec
    sta.b 0x3C
    and.b #0x03
    bne .C59D

    lda.b #0x0E
    trb.b 0x11
.C59D:
    lda.b #0x80
    tsb.b 0x27
    lda.b 0x3B
    bne .C5A9

    jsl 0x849B03
.C5A9:
    lda.w 0x0BCF
    and.b #0x7F
    bne .C5B4

    lda.b #0x01
    sta.b 0x30
.C5B4:
    jml 0x8280B4

.C5B8:
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x01
    tsb.w 0x0BD8
    tsb.w 0x1F0C
    lda.b #0x04
    jsr .CA35
    lda.b #0x13
    jsl _80888B
    jml 0x8280B4

.C5D7: d16[.C5E3, .C694, .C8B6, .C92E, .C976, .C997]

.C5E3:
    ldx.b 0x03
    jmp (.C5E8,X)

.C5E8: d16[.C5F2, .C61F, .C639, .C664, .C684]

.C5F2:
    lda.b #0x02
    sta.b 0x03
    jsl get_rng
    and.b #0x03
    asl
    tax
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0180
    bcs .C60C

    lda.w #0xFE80
.C60C:
    sta.b 0x1A
    lda.w 0xC6F8,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x2C
    sta.b 0x1E
    lda.b #0x02
    jsr .CA35
    rts

.C61F:
    jsl 0x84AC92
    jsl 0x848EEA
    lda.b 0x0F
    beq .C638

    jsr .CA45
    lda.b #0x04
    sta.b 0x03
    lda.b 0x17
    and.b #0x7F
    sta.b 0x17
.C638:
    rts

.C639:
    jsl 0x84AC92
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    jsl 0x848EEA
    lda.b 0x17
    bpl .C663

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    beq .C663

    bmi .C65A

    jmp .CA45

.C65A:
    lda.b #0x06
    sta.b 0x03
    lda.b #0x01
    jsr .CA35
.C663:
    rts

.C664:
    jsl 0x84AC92
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .C683

    lda.b #0x08
    sta.b 0x03
    lda.b #0x00
    jsr .CA35
    lda.b #0x1E
    sta.b 0x34
.C683:
    rts

.C684:
    jsl 0x84AC92
    jsl 0x848EEA
    dec.b 0x34
    bne .C693

    jmp .C9F7

.C693:
    rts

.C694:
    ldx.b 0x03
    jmp (.C699,X)

.C699: d16[.C6A5, .C6E9, .C740, .C7AB, .C86B, .C89C]

.C6A5:
    lda.b #0x02
    sta.b 0x03
    jsl 0x84AC92
    lda.b #0x01
    jsr .CA35
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .C6C0

    eor.w #0xFFFF
    inc
.C6C0:
    xba
    and.w #0xFF00
    sta.w snes_regs.wrdivl
    lda.w #0x002A
    sta.w snes_regs.wrdivb
    lda.w #0x0720
    sta.b 0x1C
    ldx.b #0x2C
    stx.b 0x1E
    nop
    lda.b 0x10
    asl
    asl
    lda.w snes_regs.rddivl
    bcs .C6E4

    eor.w #0xFFFF
    inc
.C6E4:
    sta.b 0x1A
    sep #0x20
    rts

.C6E9:
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x1D
    bpl .C73F

    lda.b #0x04
    sta.b 0x03
    lda.b #0x07
    jsl 0x848F07
    lda.b #0x48
    sta.b 0x34
    rep #0x20
    lda.w #0xFF00
    sta.b 0x1C
    stz.b 0x1A
    lda.w #0xC614
    sta.b 0x20
    sep #0x20
    lda.b #0x01
    sta.b 0x39
    sta.b 0x3A
    jsl 0x828358
    bne .C73D

    inc.w 0x0000,X
    lda.b #0x1D
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    tdc
    sta.w 0x000C,X
.C73D:
    sep #0x30
.C73F:
    rts

.C740:
    jsl 0x848EEA
    jsl update_pos_y
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .C766

    rep #0x20
    lda.w #0x0200
    sta.b 0x1C
    sep #0x20
    lda.b #0x08
    sta.b 0x03
    lda.b #0x08
    jsl 0x848F07
    rts

.C766:
    lda.w 0x0BCF
    and.b #0x7F
    beq .C7AA

    lda.w 0x0C32
    ora.w 0x1F0C
    bne .C7AA

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .C7AA

    rep #0x20
    lda.w 0x0BB0
    cmp.b 0x08
    sep #0x20
    bcc .C7AA

    lda.b #0x06
    sta.b 0x03
    jsl 0x849F14
    lda.b #0x09
    jsl 0x848F07
    rep #0x20
    lda.w #0x01E1
    sta.b 0x34
    sep #0x20
    lda.b #0x20
    sta.b 0x3B
    stz.b 0x39
.C7AA:
    rts

.C7AB:
    rep #0x20
    lda.b 0x05
    sta.w 0x0BAD
    lda.b 0x08
    clc
    adc.w #0x0020
    sta.w 0x0BB0
    sep #0x20
    jsl 0x848EEA
    lda.w 0x0BE3
    and.b #0xEF
    ora.w 0x0BE2
    rep #0x20
    beq .C7DA

    lda.b 0x34
    sec
    sbc.w #0x0010
    bcs .C7D8

    lda.w #0x0001
.C7D8:
    sta.b 0x34
.C7DA:
    dec.b 0x34
    sep #0x20
    beq .C837

    dec.b 0x3B
    bne .C818

    lda.w 0x0BCF
    and.b #0x7F
    dec
    bne .C7F7

    lda.b #0x02
    sta.w 0x0BCE
    jsl 0x849F2A
    bra .C847

.C7F7:
    ora.b #0x80
    sta.w 0x0BCF
    jsl 0x849F14
    lda.b 0x27
    and.b #0x7F
    inc
    cmp.b #0x21
    bcc .C80A

    dec
.C80A:
    ora.b #0x80
    sta.b 0x27
    lda.b #0x4F
    jsl _80888B.88B6
    lda.b #0x20
    sta.b 0x3B
.C818:
    lda.b 0x17
    bpl .C836

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    rep #0x30
    and.w #0x007F
    clc
    adc.w #0x009F
    asl
    tay
    ldx.w #0x0040
    jsl 0x828000
    sep #0x30
.C836:
    rts

.C837:
    jsl 0x849F79
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0008
    sta.b 0x08
    sep #0x20
.C847:
    lda.b #0x08
    jsl 0x848F07
    stz.b 0x3B
    rep #0x20
    lda.w #0x0200
    sta.b 0x1C
    sep #0x20
    lda.b #0x08
    sta.b 0x03
    rep #0x10
    ldy.w #0x013E
    ldx.w #0x0040
    jsl 0x828000
    sep #0x10
    rts

.C86B:
    jsl update_pos_y
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x08
    beq .C89B

    lda.b #0x0A
    sta.b 0x03
    stz.b 0x39
    stz.b 0x3A
    lda.b #0x01
    jsr .CA35
    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x2C
    sta.b 0x1E
    rep #0x20
    lda.w #0xC60A
    sta.b 0x20
    sep #0x20
.C89B:
    rts

.C89C:
    jsl 0x84AC92
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .C8B5

    jmp .C9F7

.C8B5:
    rts

.C8B6:
    ldx.b 0x03
    jmp (.C8BB,X)

.C8BB: d16[.C8C1, .C8CC, .C922]

.C8C1:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x03
    jsl 0x848F07
    rts

.C8CC:
    jsl 0x84AC92
    jsl 0x848EEA
    lda.b 0x0F
    beq .C921

    lda.b #0x03
    sta.b 0x0B
    lda.b #0x04
    sta.b 0x03
    lda.b #0x1E
    jsl _80888B
.C8E6:
    jsl 0x828321
    bne .C91F

    inc.w 0x0000,X
    lda.b #0x08
    sta.w 0x000A,X
    lda.b 0x0B
    sta.w 0x000B,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    lda.b 0x0B
    and.w #0x0003
    asl
    asl
    tay
    lda 0xC6E8,Y
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda 0xC6EA,Y
    clc
    adc.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dec.b 0x0B
    bpl .C8E6

.C91F:
    sep #0x30
.C921:
    rts

.C922:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C92D

    jmp .C9F7

.C92D:
    rts

.C92E:
    ldx.b 0x03
    jmp (.C933,X)

.C933: d16[.C939, .C947, .C96A]

.C939:
    jsl 0x84AC92
    lda.b #0x02
    sta.b 0x03
    lda.b #0x03
    jsr .CA35
    rts

.C947:
    jsl 0x848EEA
    lda.b 0x17
    bpl .C969

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    beq .C969

    bmi .C95C

    jmp .CA45

.C95C:
    lda.b #0x04
    sta.b 0x03
    lda.b #0x00
    jsr .CA35
    lda.b #0x1E
    sta.b 0x34
.C969:
    rts

.C96A:
    jsl 0x848EEA
    dec.b 0x34
    bne .C975

    jmp .C9F7

.C975:
    rts

.C976:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C996

    lda.b 0x3D
    sta.b 0x02
    lda.b 0x2C
    sta.b 0x17
    lda.b 0x31
    sta.b 0x14
    lda.b 0x32
    sta.b 0x15
    lda.b 0x3E
    sta.b 0x13
    lda.b 0x10
    sta.b 0x0F
.C996:
    rts

.C997:
    lda.b 0x03
    bne .C9AE

    lda.b #0x01
    jsr .CA35
    rep #0x20
    stz.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b #0x2C
    sta.b 0x1E
    inc.b 0x03
.C9AE:
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .C9C3

    jmp .C9F7

.C9C3:
    rts

.C9C4:
    jsl 0x84A66D
    bpl .C9E3

    lda.w 0x1F7A
    cmp.b #0x09
    bcc .C9DF

    lda.b #0x1C
    jsl _80878B
    lda.b #0xF5
    ldy.b #0x03
    jsl _808850.8868
.C9DF:
    jml 0x828398

.C9E3:
    lda.w 0x1F15
    bne .C9EC

    jsl 0x848EEA
.C9EC:
    lda.b 0x03
    cmp.b #0x14
    bcs .C9F6

    jml 0x8280B4

.C9F6:
    rtl

.C9F7:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .CA05

    eor.w #0xFFFF
    inc
.CA05:
    cmp.w #0x0080
    sep #0x20
    bcs .CA14

    cmp.b #0x50
    bcs .CA18

    lda.b #0x00
    bra .CA1A

.CA14:
    lda.b #0x20
    bra .CA1A

.CA18:
    lda.b #0x40
.CA1A:
    ldx.b 0x36
    beq .CA21

    clc
    adc.b #0x60
.CA21:
    sta.b 0x37
    jsl get_rng
    and.b #0x1F
    clc
    adc.b 0x37
    tax
    lda.w 0xC628,X
    sta.b 0x02
    stz.b 0x03
    rts

.CA35:
    ldx.b 0x36
    beq .CA3C

    clc
    adc.b #0x05
.CA3C:
    tax
    lda.w 0xC61E,X
    jsl 0x848F07
    rts

.CA45:
    lda.b #0x02
    sta.w 0x0000
    stz.w 0x0001
    lda.b 0x0F
    lsr
    rep #0x20
    lda.w #0xFFF5
    bcs .CA5A

    lda.w #0x0006
.CA5A:
    sta.b 0x37
.CA5C:
    jsl 0x828358
    bne .CA97

    inc.w 0x0000,X
    lda.b #0x1E
    sta.w 0x000A,X
    lda.w 0x0000
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.b 0x37
    bcc .CA83

    eor.w #0xFFFF
    inc
.CA83:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0007
    sta.w 0x0008,X
    dec.w 0x0000
    bpl .CA5C

.CA97:
    sep #0x30
    lda.w 0x0000
    cmp.b #0x02
    beq .CAA6

    lda.b #0x1E
    jsl _80888B
.CAA6:
    rts

;-----

.CAA7:
    lda.b 0x0C
    beq .CAF5

    dec.b 0x0C
    bne .CAF5

    inc.b 0x36
    lda.b #0x04
    jsr .CA35
    lda.b 0x17
    sta.b 0x2C
    lda.b 0x0F
    sta.b 0x10
    lda.b 0x13
    sta.b 0x3E
    lda.b 0x14
    sta.b 0x31
    lda.b 0x15
    sta.b 0x32
    lda.b #0x0A
    sta.b 0x3D
    stz.b 0x03
    ldy.b #0x03
.CAD2:
    jsl 0x8282D3
    bne .CAF3

    inc.w 0x0000,X
    lda.b #0x07
    sta.w 0x000A,X
    tya
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    dey
    bpl .CAD2

.CAF3:
    sep #0x30
.CAF5:
    rts
