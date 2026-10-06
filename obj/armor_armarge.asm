armor_armarge:
    ldx.b 0x01
    jmp (.B146,X)

.B146: d16[.B14E, .B1F9, .B2E5, .B905]

.B14E:
    lda.b 0x02
    bne .B177

    jsl 0x84AACA
    beq .B15C

    jml 0x828398

.B15C:
    inc.b 0x02
    jsl 0x849FE6
    lda.b #0x3C
    sta.b 0x34
    lda.b #0x3C
    jsl 0x84A333
    lda.w 0x1F26
    beq .B177

    lda.b #0x2E
    jsl _80878B
.B177:
    dec.b 0x34
    beq .B17C

    rtl

.B17C:
    jsl 0x82827D
    rep #0x10
    ldy.w #0x01F0
    jsl 0x828011
    lda.l 0x7F835D
    and.b #0xFE
    sta.b 0x11
    and.b #0x0E
    sta.b 0x35
    stz.b 0x33
    stz.b 0x37
    stz.b 0x38
    stz.b 0x3C
    stz.b 0x02
    lda.b #0x0B
    jsr _83B9C5
    rep #0x20
    lda.b 0x08
    sta.w 0x0002
    lda.b 0x05
    sec
    sbc.w #0x0008
    sta.w 0x0000
    jsr _83BB35
    lda.b 0x05
    clc
    adc.w #0x0008
    sta.w 0x0000
    jsr _83BB35
    lda.b 0x08
    clc
    adc.w #0x0008
    sta.w 0x0002
    jsr _83BB35
    lda.b 0x05
    sec
    sbc.w #0x0008
    sta.w 0x0000
    jsr _83BB35
    lda.w #0xC948
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x04
    sta.b 0x12
    lda.b #0x06
    sta.b 0x26
    lda.b #0x00
    jsl 0x848000
    rtl

.B1F9:
    ldx.b 0x02
    jsr (.B202,X)
    jml 0x8280B4

.B202: d16[.B20C, .B23A, .B274, .B291, .B2C3]

.B20C:
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .B239

    lda.b #0x02
    sta.b 0x02
    lda.b #0x04
    jsr _83B9C5
    rep #0x20
    lda.w #0xC952
    sta.b 0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    sta.b 0x1C
    sep #0x20
.B239:
    rts

.B23A:
    lda.b 0x03
    bne .B252

    jsl 0x848EEA
    lda.b 0x0F
    bpl .B252

    lda.b 0x1D
    bpl .B252

    lda.b #0x02
    jsl 0x848F07
    inc.b 0x03
.B252:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .B273

    lda.b #0x08
    jsl 0x84A333
    lda.b #0x05
    jsr _83B9C5
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    stz.b 0x2F
.B273:
    rts

.B274:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .B290

    lda.b #0x06
    sta.b 0x02
    stz.b 0x27
    rep #0x20
    tdc
    sta.w 0x1F0E
    sep #0x20
    lda.b #0x15
    jsl 0x848F07
.B290:
    rts

.B291:
    lda.b 0x0F
    bmi .B29A

    jsl 0x848EEA
    rts

.B29A:
    lda.w 0x0B9C
    and.b #0x01
    beq .B2C2

    lda.b #0x0C
    jsl _80888B.88B6
    inc.b 0x27
    lda.b #0x80
    ora.b 0x27
    sta.b 0x27
    and.b #0x7F
    cmp.b #0x20
    bcc .B2C2

    lda.b #0x08
    sta.b 0x02
    lda.b #0x0A
    sta.b 0x34
    lda.b #0x00
    jsr _83B9C5
.B2C2:
    rts

.B2C3:
    dec.b 0x34
    bne .B2E4

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    stz.b 0x31
    lda.b #0x01
    sta.b 0x32
    jsl 0x849FFE
    lda.w 0x1F26
    beq .B2E4

    lda.b #0x1E
    jsl _80878B
.B2E4:
    rts

.B2E5:
    ldx.b 0x02
    jsr (.B3D7,X)
    lda.b 0x27
    sta.b 0x39
    lda.b 0x35
    tsb.b 0x11
    lda.b 0x37
    bmi .B2FE

    and.b #0x01
    beq .B306

    lda.b #0x00
    bra .B308

.B2FE:
    lda.b 0x33
    bne .B306

    lda.b #0x00
    bra .B308

.B306:
    lda.b #0x0B
.B308:
    sta.b 0x28
    lda.b 0x38
    beq .B327

    dec.b 0x38
    lda.b 0x02
    cmp.b #0x08
    bne .B31C

    lda.b 0x03
    cmp.b #0x08
    bcs .B327

.B31C:
    lda.b 0x38
    lsr
    lsr
    lsr
    bcc .B327

    lda.b #0x0E
    trb.b 0x11
.B327:
    jsl 0x849B43
    bvc .B357

    lda.b 0x3C
    clc
    adc.b #0x02
    sta.b 0x3C
    lda.b #0x01
    sta.b 0x3B
    lda.b 0x37
    lsr
    bcs .B340

    jmp .B3C4

.B340:
    lda.w 0x1F1D
    cmp.b #0x02
    beq .B34F

    cmp.b #0x03
    beq .B34F

    cmp.b #0x01
    bne .B3C4

.B34F:
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    bra .B3C4

.B357:
    beq .B3C4

    lda.b 0x38
    beq .B363

    lda.b 0x39
    sta.b 0x27
    bra .B3C4

.B363:
    lda.b #0x3C
    sta.b 0x38
    lda.b 0x02
    bne .B371

    lda.b 0x03
    cmp.b #0x0C
    bcc .B397

.B371:
    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    lda.b #0x40
    trb.b 0x11
    lda.w 0x1F1B
    tsb.b 0x11
    lda.b 0x33
    bne .B397

    lda.w 0x1F1D
    cmp.b #0x0C
    beq .B38F

    cmp.b #0x15
    bne .B397

.B38F:
    lda.b #0x02
    sta.b 0x03
    lda.b #0xB4
    sta.b 0x38
.B397:
    lda.b #0x13
    jsl _80888B
    lda.b 0x27
    and.b #0x7F
    bne .B3C4

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x01
    sta.w 0x0BD8
    sta.w 0x1F0C
    lda.b #0x07
    jsr _83B9C5
    lda.b 0x11
    and.b #0xF1
    ora.b #0x08
    sta.b 0x11
    jml 0x8280B4

.B3C4:
    jsl 0x849B03
    lda.w 0x0BCF
    and.b #0x7F
    bne .B3D3

    lda.b #0x01
    sta.b 0x30
.B3D3:
    jml 0x8280B4

.B3D7: d16[.B3E1, .B69A, .B5F2, .B781, .B823]

.B3E1:
    ldx.b 0x03
    jmp (.B3E6,X)

.B3E6: d16[.B3F6, .B413, .B43E, .B465, .B490, .B4FB, .B5A6, .B5DF]

.B3F6:
    lda.b #0x03
    jsr _83B9C5
    lda.b #0x02
    sta.b 0x03
    jsl 0x84AC92
    rep #0x20
    lda.w #0x0506
    sta.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b #0xFF
    sta.b 0x2F
    rts

.B413:
    jsl 0x84AC92
    jsl update_pos_xy.neg_ay
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x0F
    bpl .B43D

    lda.b #0x04
    sta.b 0x03
    lda.b #0x0B
    jsr _83B9C5
    lda.b #0x80
    tsb.b 0x37
    rep #0x20
    lda.w #0xC948
    sta.b 0x20
    sep #0x20
.B43D:
    rts

.B43E:
    jsl 0x84AC92
    jsl update_pos_xy.neg_ay
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .B464

    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
    lda.b #0x06
    sta.b 0x03
.B464:
    rts

.B465:
    jsl 0x84AC92
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay
    lda.b 0x2B
    and.b #0x04
    beq .B48F

    lda.b #0x08
    sta.b 0x03
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0600
    bcs .B489

    lda.w #0xFA00
.B489:
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
.B48F:
    rts

.B490:
    jsl update_pos_x
    jsl 0x8491BE
    jsl 0x848EEA
    lda.b 0x2B
    and.b #0x03
    beq .B4FA

    lda.b #0x48
    jsl _80888B
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0010
    bcs .B4B6

    lda.w #0xFFF0
.B4B6:
    clc
    adc.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    jsr _83BB35
    sep #0x20
    jsl 0x849086
    and.b #0x0F
    cmp.b #0x06
    bcs .B4D9

    lda.b 0x1B
    eor.b #0x80
    sta.b 0x1B
    jmp _83B9FB

.B4D9:
    lda.b #0x08
    jsl 0x84A311
    rep #0x20
    lda.w 0x00EE4C
    asl
    adc.w 0x00EE4C
    sta.b 0x1C
    ldx.b 0x1B
    bmi .B4F2

    eor.w #0xFFFF
    inc
.B4F2:
    sta.b 0x1A
    sep #0x20
    lda.b #0x0A
    sta.b 0x03
.B4FA:
    rts

.B4FB:
    lda.b #0x40
    trb.b 0x11
    lda.b 0x1B
    and.b #0x80
    lsr
    eor.b #0x40
    tsb.b 0x11
    jsl 0x82820A
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x2B
    bne .B519

    rts

.B519:
    bit.b #0x04
    beq .B545

    jsl 0x849086
    and.b #0x0F
    cmp.b #0x06
    bcs .B545

    rep #0x20
    lda.w #0x0010
    clc
    adc.b 0x08
    sta.w 0x0002
    lda.b 0x05
    sta.w 0x0000
    jsr _83BB35
    sep #0x20
    lda.b #0x48
    jsl _80888B
    jmp _83B9FB

.B545:
    lda.b #0x48
    jsl _80888B
    lda.b 0x2B
    bit.b #0x0C
    rep #0x20
    beq .B57E

    lsr
    lsr
    lsr
    lda.w #0x0010
    bcs .B55E

    lda.w #0xFFF0
.B55E:
    clc
    adc.b 0x08
    sta.w 0x0002
    lda.b 0x05
    sta.w 0x0000
    jsr _83BB35
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
    lda.b #0x08
    jsl 0x84A333
    bra .B5A5

.B57E:
    lsr
    lda.w #0x0010
    bcs .B587

    lda.w #0xFFF0
.B587:
    clc
    adc.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    jsr _83BB35
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
    lda.b #0x08
    jsl 0x84A311
.B5A5:
    rts

.B5A6:
    rep #0x20
    lda.w #0xC952
    sta.b 0x20
    sep #0x20
    jsl update_pos_xy.neg_ay
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .B5CD

    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
.B5CD:
    lda.b 0x2B
    and.b #0x04
    beq .B5DE

    lda.b #0x0E
    sta.b 0x03
    stz.b 0x2B
    lda.b #0x05
    jsr _83B9C5
.B5DE:
    rts

.B5DF:
    jsl 0x8491BE
    jsl 0x848EEA
    lda.b 0x0F
    bpl .B5F1

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.B5F1:
    rts

.B5F2:
    ldx.b 0x03
    jmp (.B5F7,X)

.B5F7: d16[.B5FD, .B60B, .B67F]

.B5FD:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x34
    lda.b #0x00
    jsr _83B9C5
    rts

.B60B:
    jsl 0x84AC92
    jsr _83BA1D
    beq .B625

    lda.b #0x04
    sta.b 0x03
    lda.b #0x01
    tsb.b 0x37
    lda.b #0x1E
    sta.b 0x3B
    lda.b #0x09
    jmp _83B9C5

.B625:
    lda.b 0x34
    beq .B62D

    dec.b 0x34
    bne .B67E

.B62D:
    stz.b 0x03
    lda.b 0x32
    cmp.b #0x02
    bcc .B640

    dec.b 0x32
    lda.b 0x31
    eor.b #0x02
    sta.b 0x31
    sta.b 0x02
    rts

.B640:
    jsl 0x849086
    and.b #0x0F
    tax
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .B655

    eor.w #0xFFFF
    inc
.B655:
    cmp.w #0x0080
    sep #0x20
    bcs .B66A

    cmp.b #0x50
    bcs .B665

    lda.w 0x00C983,X
    bra .B66D

.B665:
    lda.w 0x00C993,X
    bra .B66D

.B66A:
    lda.w 0x00C9A3,X
.B66D:
    cmp.b 0x31
    beq .B67A

    sta.b 0x31
    sta.b 0x02
    lda.b #0x01
    sta.b 0x32
    rts

.B67A:
    sta.b 0x02
    inc.b 0x32
.B67E:
    rts

.B67F:
    jsr _83BAA7
    lda.b 0x34
    beq .B688

    dec.b 0x34
.B688:
    dec.b 0x3B
    bne .B699

    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    trb.b 0x37
    lda.b #0x00
    jmp _83B9C5

.B699:
    rts

.B69A:
    ldx.b 0x03
    jmp (.B69F,X)

.B69F: d16[.B6A5, .B6BB, .B759]

.B6A5:
    lda.b #0x02
    sta.b 0x03
    jsl 0x849086
    and.b #0x0F
    tax
    lda.w 0x00C973,X
    sta.b 0x36
    lda.b #0x06
    jsr _83B9C5
    rts

.B6BB:
    jsl 0x848EEA
    lda.b 0x17
    bpl .B73E

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    bmi .B730

    beq .B73E

    dec.b 0x36
    jsl 0x828358
    bne .B726

    inc.w 0x0000,X
    lda.b #0x04
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.w #0x000F
    bcs .B6F3

    lda.w #0xFFF1
.B6F3:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x000E
    sta.w 0x0008,X
    jsl 0x8282D3
    bne .B726

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x0F
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.B726:
    sep #0x30
    lda.b #0x33
    jsl _80888B
    bra .B73E

.B730:
    jsl 0x84AC92
    lda.b 0x36
    bne .B73E

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.B73E:
    jsr _83BA1D
    beq .B758

    lda.b #0x02
    sta.b 0x02
    lda.b #0x04
    sta.b 0x03
    lda.b #0x01
    tsb.b 0x37
    lda.b #0x09
    jsr _83B9C5
    lda.b #0x1E
    sta.b 0x3B
.B758:
    rts

.B759:
    jsl 0x84AC92
    jsr _83BAA7
    dec.b 0x3B
    bne .B780

    lda.b #0x01
    trb.b 0x37
    lda.b 0x36
    bne .B777

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    lda.b #0x00
    jmp _83B9C5

.B777:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x06
    jsr _83B9C5
.B780:
    rts

.B781:
    ldx.b 0x03
    jmp (.B786,X)

.B786: d16[.B78C, .B7A2, .B813]

.B78C:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x0A
    jsr _83B9C5
    stz.b 0x36
    lda.b #0x80
    sta.b 0x37
    lda.b #0x4E
    jsl _80888B
    rts

.B7A2:
    jsr _83BAA7
    jsl 0x848EEA
    lda.b 0x17
    bpl .B812

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    and.b #0x0F
    clc
    adc.b #0x90
    rep #0x30
    and.w #0x00FF
    asl
    tay
    ldx.w #0x0050
    lda.w 0x0BCF
    and.w #0x007F
    beq .B7CE

    jsl 0x828000
.B7CE:
    sep #0x30
    lda.b 0x0F
    bpl .B812

    lda.b #0x08
    sta.b 0x3D
.B7D8:
    jsl 0x828358
    bne .B800

    inc.w 0x0000,X
    lda.b #0x04
    sta.w 0x000A,X
    lda.b 0x3D
    sta.w 0x000B,X
    stz.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dec.b 0x3D
    bne .B7D8

.B800:
    sep #0x10
    lda.b #0x04
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x34
    stz.b 0x37
    lda.b #0x02
    jsl _80888B
.B812:
    rts

.B813:
    dec.b 0x34
    bne .B822

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    lda.b #0x00
    jsr _83B9C5
.B822:
    rts

.B823:
    ldx.b 0x03
    jmp (.B828,X)

.B828: d16[.B836, .B845, .B875, .B894, .B8E0, .B875, .B8BD]

.B836:
    lda.b #0x07
    jsr _83B9C5
    lda.b #0x04
    sta.b 0x03
    lda.b #0x14
    sta.b 0x3A
    bra .B852

.B845:
    lda.b #0x08
    jsr _83B9C5
    lda.b #0x08
    sta.b 0x03
    lda.b #0x5A
    sta.b 0x3A
.B852:
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0100
    bcc .B860

    lda.w #0xFF00
.B860:
    sta.b 0x1A
    lda.w #0x0100
    sta.b 0x1C
    lda.w #0xC952
    sta.b 0x20
    sep #0x20
    lda.b #0xFF
    sta.b 0x2F
    stz.b 0x37
    rts

.B875:
    jsl update_pos_xy.neg_ay
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .B88D

    inc.b 0x03
    inc.b 0x03
    stz.b 0x2F
.B88D:
    lda.b 0x3A
    beq .B893

    dec.b 0x3A
.B893:
    rts

.B894:
    jsl update_pos_x
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x3A
    bne .B8BA

    lda.b 0x36
    beq .B8B3

    lda.b #0x02
    sta.b 0x02
    sta.b 0x03
    lda.b #0x06
    jmp _83B9C5

.B8B3:
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.B8BA:
    dec.b 0x3A
    rts

.B8BD:
    jsl update_pos_x
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x3A
    bne .B8DD

    jsr _83BAC7
    inc.b 0x33
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    lda.b #0x00
    jmp _83B9C5

.B8DD:
    dec.b 0x3A
    rts

.B8E0:
    jsl 0x848EEA
    lda.b 0x17
    bpl .B8F6

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    bpl .B8F6

    lda.b #0x47
    jsl _80888B
.B8F6:
    lda.b 0x3A
    bne .B902

    inc.b 0x03
    inc.b 0x03
    lda.b #0x14
    sta.b 0x3A
.B902:
    dec.b 0x3A
    rts

.B905:
    jsl 0x84A66D
    bpl .B924

    lda.w 0x1F7A
    cmp.b #0x09
    bcc .B920

    lda.b #0x1C
    jsl _80878B
    lda.b #0xF5
    ldy.b #0x03
    jsl _808850.8868
.B920:
    jml 0x828398

.B924:
    lda.w 0x1F15
    bne .B92D

    jsl 0x848EEA
.B92D:
    lda.b 0x03
    cmp.b #0x14
    bcs .B937

    jml 0x8280B4

.B937:
    rtl
