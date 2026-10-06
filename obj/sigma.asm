sigma:
    ldx.b 0x01
    jmp (.C3B7,X)

.C3B7: d16[.C3CB, .C3F7, .C48B, .C570, .C58C, .C6C0, .CA36, .CAD1, .CBC6, .CD30]

.C3CB:
    rep #0x20
    lda.w 0x0BB0
    cmp.w #0x00C0
    sep #0x20
    bcs .C3F4

    lda.b #0x02
    sta.b 0x01
    jsl 0x849F85
    rep #0x20
    stz.w 0x1E6E
    stz.w 0x1E68
    sep #0x20
    lda.b #0xF6
    ldy.b #0x03
    jsl _808850.8868
    inc.w 0x1F49
.C3F4:
    stz.b 0x27
    rtl

.C3F7:
    ldx.b 0x02
    jmp (.C3FC,X)

.C3FC: d16[.C404, .C419, .C42C, .C447]

.C404:
    rep #0x20
    lda.w 0x1E50
    sep #0x20
    bne .C418

    lda.b #0x1E
    sta.b 0x33
    lda.b #0x02
    sta.b 0x02
    stz.w 0x1F49
.C418:
    rtl

.C419:
    dec.b 0x33
    bne .C42B

    lda.b #0x00
    jsl 0x848000
    lda.b #0x10
    sta.b 0x33
    lda.b #0x04
    sta.b 0x02
.C42B:
    rtl

.C42C:
    dec.b 0x33
    bne .C446

    lda.b #0x01
    jsl 0x848000
    lda.b #0x3C
    sta.b 0x33
    lda.b #0x06
    sta.b 0x02
    jsl 0x849FAD
    jsl 0x84A041
.C446:
    rtl

.C447:
    dec.b 0x33
    bne .C487

    jsl 0x8282D3
    bne .C488

    inc.w 0x0000,X
    lda.b #0x3E
    sta.w 0x000A,X
    stx.b 0x0C
    rep #0x20
    tdc
    sta.w 0x000C,X
    lda.w #0xFFE0
    sta.b 0x08
    lda.w #0x00D0
    sta.b 0x05
    sep #0x30
    jsl 0x82827D
    lda.b #0x04
    sta.b 0x12
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    lda.b #0x2E
    jsl _80878B
.C487:
    rtl

.C488:
    inc.b 0x33
    rtl

.C48B:
    ldx.b 0x02
    jmp (.C490,X)

.C490: d16[.C498, .C4CF, .C53B, .C555]

.C498:
    jsl 0x828321
    bne .C4CE

    inc.w 0x0000,X
    lda.b #0x26
    sta.w 0x000A,X
    rep #0x20
    lda.w #0x00C0
    sta.w 0x0005,X
    lda.w #0xFFFF
    sta.w 0x0008,X
    stx.b 0x20
    lda.w #0xFFEE
    sta.b 0x08
    sta.b 0x35
    lda.w #0xF000
    sta.b 0x1C
    sep #0x20
    lda.b #0x0C
    sta.b 0x37
    sta.b 0x38
    lda.b #0x02
    sta.b 0x02
.C4CE:
    rtl

.C4CF:
    lda.b 0x38
    bne .C522

    lda.b 0x37
    dec
    beq .C4FD

    sta.b 0x38
    sta.b 0x37
    rep #0x30
    and.w #0x00FF
    asl
    asl
    asl
    asl
    eor.w #0xFFFF
    inc
    clc
    adc.b 0x08
    sta.b 0x08
    ldx.b 0x20
    clc
    adc.w #0x0011
    sta.w 0x0008,X
    sep #0x30
    jml 0x8280B4

.C4FD:
    lda.b #0x04
    sta.b 0x02
    lda.b #0x80
    sta.w 0x0000
    lda.b #0x50
    sta.w 0x0002
    lda.b #0x40
    sta.w 0x0004
    lda.b #0x30
    sta.w 0x0006
    lda.b #0x12
    sta.w 0x0008
    jsl 0x83F747
    jml 0x8280B4

.C522:
    dec.b 0x38
    jsl 0x82825D
    rep #0x30
    ldx.b 0x20
    lda.b 0x08
    clc
    adc.w #0x0011
    sta.w 0x0008,X
    sep #0x30
    jml 0x8280B4

.C53B:
    lda.w 0x1F2C
    bmi .C551

    lda.b #0x0E
    sta.b 0x33
    rep #0x20
    lda.w #0x1000
    sta.b 0x1C
    sep #0x20
    lda.b #0x06
    sta.b 0x02
.C551:
    jml 0x8280B4

.C555:
    jsl 0x82825D
    dec.b 0x33
    bne .C56C

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    lda.b #0x01
    sta.w 0x1F3F
    jsl 0x849FFE
.C56C:
    jml 0x8280B4

.C570:
    lda.w 0x1F3F
    bne .C58B

    lda.b #0xF6
    ldy.b #0x03
    jsl _808850.8868
    jsl 0x84A041
    lda.b #0x78
    sta.b 0x33
    lda.b #0x08
    sta.b 0x01
    stz.b 0x02
.C58B:
    rtl

.C58C:
    ldx.b 0x02
    jmp (.C591,X)

.C591: d16[.C59F, .C5B9, .C5D8, .C62C, .C64D, .C667, .C68E]

.C59F:
    dec.b 0x33
    bne .C5B8

    lda.b #0x02
    sta.b 0x02
    inc.w 0x1F08
    jsl 0x80B085
    lda.b #0x14
    sta.b 0x33
    lda.b #0x23
    jsl _80878B
.C5B8:
    rtl

.C5B9:
    dec.b 0x33
    bne .C5D7

    lda.b #0x04
    sta.b 0x02
    rep #0x20
    lda.w #0xFFEE
    sta.b 0x08
    sta.b 0x35
    lda.w #0xF000
    sta.b 0x1C
    sep #0x20
    lda.b #0x0C
    sta.b 0x37
    sta.b 0x38
.C5D7:
    rtl

.C5D8:
    lda.b 0x38
    bne .C622

    lda.b 0x37
    dec
    beq .C5FD

    sta.b 0x37
    sta.b 0x38
    rep #0x20
    and.w #0x00FF
    asl
    asl
    asl
    asl
    eor.w #0xFFFF
    inc
    clc
    adc.b 0x08
    sta.b 0x08
    sep #0x20
    jml 0x8280B4

.C5FD:
    lda.b #0x80
    sta.w 0x0000
    lda.b #0x50
    sta.w 0x0002
    lda.b #0x40
    sta.w 0x0004
    lda.b #0x30
    sta.w 0x0006
    lda.b #0x13
    sta.w 0x0008
    jsl 0x83F747
    lda.b #0x06
    sta.b 0x02
    jml 0x8280B4

.C622:
    dec.b 0x38
    jsl 0x82825D
    jml 0x8280B4

.C62C:
    lda.w 0x1F2C
    bmi .C649

    lda.b #0x02
    jsl 0x848F07
    rep #0x20
    tdc
    sta.w 0x1F0E
    sep #0x20
    ldy.b #0x01
    lda.b #0x04
    sta (0x0C),Y
    lda.b #0x08
    sta.b 0x02
.C649:
    jml 0x8280B4

.C64D:
    jsl 0x848EEA
    lda.b 0x0F
    beq .C663

    bmi .C65F

    lda.b #0xA2
    jsl _80888B.88B6
    bra .C663

.C65F:
    lda.b #0x0A
    sta.b 0x02
.C663:
    jml 0x8280B4

.C667:
    lda.w 0x0B9C
    lsr
    bcc .C686

    lda.b #0x0C
    jsl _80888B.88B6
    lda.b 0x27
    and.b #0x7F
    inc
    sta.b 0x27
    cmp.b #0x20
    bcc .C686

    lda.b #0x0C
    sta.b 0x02
    lda.b #0x1E
    sta.b 0x33
.C686:
    lda.b #0x80
    tsb.b 0x27
    jml 0x8280B4

.C68E:
    dec.b 0x33
    bne .C6BC

    lda.b #0x2A
    jsl _80878B
    lda.b #0x03
    jsl 0x848F07
    lda.b #0x0A
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    stz.b 0x2F
    stz.b 0x35
    stz.b 0x36
    stz.b 0x30
    lda.b 0x11
    and.b #0x0E
    sta.b 0x34
    lda.b #0x0A
    sta.b 0x26
    jsl 0x849FFE
.C6BC:
    jml 0x8280B4

.C6C0:
    lda.b 0x34
    tsb.b 0x11
    stz.b 0x30
    ldx.b 0x02
    jsr (.C73D,X)
    lda.b #0x12
    ldx.b 0x35
    beq .C6D3

    lda.b #0x05
.C6D3:
    sta.b 0x28
    rep #0x20
    lda.b 0x36
    and.w #0x00FF
    clc
    adc.w #0xD78A
    sta.b 0x20
    sep #0x20
    lda.w 0x0BCF
    and.b #0x7F
    beq .C722

    jsl 0x849B43
    beq .C722

    bpl .C718

    lda.b #0x0C
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    inc.w 0x0BD8
    inc.w 0x1F0C
    lda.b #0x0A
    jsl 0x848F07
    rep #0x10
    ldy.w #0x01E8
    jsl 0x828011
    sep #0x10
    stz.b 0x3D
    jml 0x8280B4

.C718:
    lda.b #0x3C
    sta.b 0x35
    lda.b #0x13
    jsl _80888B
.C722:
    lda.b 0x35
    beq .C731

    dec
    sta.b 0x35
    and.b #0x03
    bne .C731

    lda.b #0x0E
    trb.b 0x11
.C731:
    jsl 0x849B03
    lda.b #0x01
    sta.b 0x30
    jml 0x8280B4

.C73D: d16[.C74D, .C7E0, .C84F, .C89F, .C8EA, .C91F, .C9AE, .CA14]

.C74D:
    ldx.b 0x03
    jmp (.C752,X)

.C752: d16[.C758, .C796, .C7A7]

.C758:
    jsl 0x84AC92
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0400
    bcs .C771

    lda.w #0xFC00
    sta.b 0x1A
    lda.w #0xFFD0
    bra .C776

.C771:
    sta.b 0x1A
    lda.w #0x0030
.C776:
    clc
    adc.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .C783

    eor.w #0xFFFF
    inc
.C783:
    lsr
    lsr
    sep #0x20
    sta.b 0x33
    lda.b #0x04
    jsl 0x848F07
    stz.b 0x36
    lda.b #0x02
    sta.b 0x03
    rts

.C796:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C7A6

    lda.b #0x04
    sta.b 0x03
    lda.b #0x04
    sta.b 0x36
.C7A6:
    rts

.C7A7:
    jsl 0x82823E
    dec.b 0x33
    beq .C7C2

    rep #0x20
    lda.w #0xD780
    sta.b 0x20
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .C7C5

.C7C2:
    jmp .CEE1

.C7C5:
    rep #0x30
    lda.w #0xD7A4
    sta.b 0x20
    sep #0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .C7DF

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
.C7DF:
    rts

.C7E0:
    ldx.b 0x03
    jmp (.C7E5,X)

.C7E5: d16[.C7EB, .C813, .C828]

.C7EB:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x04
    jsl 0x848F07
    stz.b 0x36
    jsl 0x84AC92
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0600
    bcs .C809

    lda.w #0xFA00
.C809:
    sta.b 0x1A
    lda.w #0x0100
    sta.b 0x1C
    sep #0x20
    rts

.C813:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C827

    lda.b #0x04
    sta.b 0x03
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x04
    sta.b 0x36
.C827:
    rts

.C828:
    jsl 0x82820A
    rep #0x20
    lda.w #0xD780
    sta.b 0x20
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .C84E

    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
    rep #0x20
    lda.w #0x00C0
    sta.b 0x1C
    sep #0x20
.C84E:
    rts

.C84F:
    lda.b 0x03
    bne .C861

    inc.b 0x03
    jsl 0x84AC92
    lda.b #0x09
    jsl 0x848F07
    stz.b 0x36
.C861:
    jsl 0x848EEA
    lda.b 0x0F
    beq .C89E

    bpl .C86E

    jmp .CEE1

.C86E:
    jsl 0x828358
    bne .C89C

    inc.w 0x0000,X
    lda.b #0x2D
    sta.w 0x000A,X
    lda.b 0x0F
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0014
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.C89C:
    sep #0x30
.C89E:
    rts

.C89F:
    lda.b 0x03
    bne .C8AF

    inc.b 0x03
    lda.b #0x05
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x36
.C8AF:
    jsl 0x848EEA
    lda.b 0x0F
    beq .C8E9

    bpl .C8BC

    jmp .CEE1

.C8BC:
    jsl 0x828358
    bne .C8E1

    inc.w 0x0000,X
    lda.b #0x2C
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.C8E1:
    sep #0x30
    lda.b #0x50
    jsl _80888B
.C8E9:
    rts

.C8EA:
    lda.b 0x03
    bne .C8FC

    inc.b 0x03
    lda.b #0x08
    jsl 0x848F07
    stz.b 0x36
    lda.b #0x3C
    sta.b 0x33
.C8FC:
    jsl 0x84AC92
    dec.b 0x33
    bne .C907

    jmp .CEF4

.C907:
    rep #0x20
    lda.w #0xD7A8
    sta.b 0x20
    sep #0x20
    stz.b 0x28
    jsl 0x849B43
    bvc .C91E

    lda.b #0x47
    jsl _80888B
.C91E:
    rts

.C91F:
    ldx.b 0x03
    jmp (.C924,X)

.C924: d16[.C92A, .C939, .C970]

.C92A:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x06
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x36
    rts

.C939:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C96F

    lda.b #0x04
    sta.b 0x03
    lda.b #0x07
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x36
    rep #0x20
    lda.b 0x1A
    bpl .C959

    eor.w #0xFFFF
    inc
.C959:
    clc
    adc.w #0x0080
    ldx.b 0x1B
    bmi .C965

    eor.w #0xFFFF
    inc
.C965:
    sta.b 0x1A
    sep #0x20
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
.C96F:
    rts

.C970:
    jsl 0x82820A
    rep #0x20
    lda.w #0xD780
    sta.b 0x20
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .C9AD

    rep #0x20
    lda.b 0x08
    cmp.w #0x0040
    bcc .C99E

    sec
    sbc.w #0x0018
    cmp.w 0x0BB0
    sep #0x20
    bcc .C99E

    stz.b 0x03
    rts

.C99E:
    rep #0x20
    lda.w #0xFE80
    sta.b 0x1C
    sep #0x20
    lda.b #0x0C
    sta.b 0x02
    stz.b 0x03
.C9AD:
    rts

.C9AE:
    ldx.b 0x03
    jmp (.C9B3,X)

.C9B3: d16[.C9B9, .C9C8, .C9F1]

.C9B9:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x06
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x36
    rts

.C9C8:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .C9F0

    lda.b #0x04
    sta.b 0x03
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    lda.b #0x07
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x36
.C9F0:
    rts

.C9F1:
    jsl 0x82820A
    rep #0x20
    lda.w #0xD780
    sta.b 0x20
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .CA0D

    stz.b 0x2F
    jmp .CEE1

.CA0D:
    and.b #0x03
    beq .CA13

    stz.b 0x03
.CA13:
    rts

.CA14:
    lda.b 0x03
    bne .CA26

    inc.b 0x03
    lda.b #0x03
    jsl 0x848F07
    stz.b 0x36
    lda.b #0x28
    sta.b 0x33
.CA26:
    jsl 0x84AC92
    jsl 0x848EEA
    dec.b 0x33
    bne .CA35

    jmp .CEF4

.CA35:
    rts

.CA36:
    jsl 0x84A66D
    bpl .CA48

    lda.b #0x0E
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    jml 0x8280B4

.CA48:
    lda.b 0x03
    cmp.b #0x14
    bcs .CA52

    jml 0x8280B4

.CA52:
    lda.b 0x3D
    bmi .CACD

    bne .CA61

    inc.b 0x3D
    inc.w 0x1F08
    jml 0x80B085

.CA61:
    lda.w 0x0040
    bne .CACC

    lda.b #0x3E
    sta.b 0x16
    lda.b #0x02
    jsl 0x848F07
    lda.b #0x2D
    sta.b 0x11
    lda.b #0x06
    sta.b 0x12
    rep #0x20
    lda.w #0x0080
    sta.b 0x05
    lda.w #0x003E
    sta.b 0x08
    jsl 0x8282D3
    bne .CACC

    inc.w 0x0000,X
    lda.b #0x43
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b #0x80
    sta.b 0x3D
    rep #0x20
    tdc
    sta.w 0x000C,X
    stz.w 0x1F3F
    stz.w 0x1F41
    stz.w 0x1F43
    jsl 0x828321
    bne .CACC

    inc.w 0x0000,X
    lda.b #0x6B
    sta.w 0x000A,X
    stz.w 0x000B,X
    jsl 0x828321
    bne .CACC

    inc.w 0x0000,X
    lda.b #0x6B
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
.CACC:
    rtl

.CACD:
    jml 0x8280B4

.CAD1:
    ldx.b 0x02
    jsr (.CADA,X)
    jml 0x8280B4

.CADA: d16[.CAE6, .CAFD, .CB2E, .CB5A, .CB64, .CB88]

.CAE6:
    inc.w 0x1F3B
    lda.b #0x02
    sta.b 0x02
    lda.b #0x08
    sta.b 0x12
    lda.b #0x2F
    jsl _80878B
    lda.b #0x01
    sta.w 0x1F3F
    rts

.CAFD:
    lda.w 0x1F3F
    bne .CB2D

    jsl 0x8282D3
    bne .CB2B

    inc.w 0x0000,X
    lda.b #0x43
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    sta.w 0x1F0E
    sep #0x20
    lda.b #0x04
    sta.b 0x02
    lda.b #0x01
    sta.w 0x1F3F
    stz.b 0x27
.CB2B:
    sep #0x10
.CB2D:
    rts

.CB2E:
    lda.w 0x1F3F
    bne .CB59

    jsl 0x8282D3
    bne .CB57

    inc.w 0x0000,X
    lda.b #0x43
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    sep #0x20
    lda.b #0x01
    sta.w 0x1F3F
    lda.b #0x06
    sta.b 0x02
.CB57:
    sep #0x10
.CB59:
    rts

.CB5A:
    lda.w 0x1F3F
    bne .CB63

    lda.b #0x08
    sta.b 0x02
.CB63:
    rts

.CB64:
    lda.w 0x0B9C
    lsr
    bcc .CB83

    lda.b #0x0C
    jsl _80888B.88B6
    lda.b 0x27
    and.b #0x7F
    inc
    sta.b 0x27
    cmp.b #0x20
    bcc .CB83

    lda.b #0x0A
    sta.b 0x02
    lda.b #0x1E
    sta.b 0x33
.CB83:
    lda.b #0x80
    tsb.b 0x27
    rts

.CB88:
    dec.b 0x33
    bne .CBC5

    lda.b #0x10
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x2B
    jsl _80878B
    rep #0x20
    lda.w #0x0040
    sta.b 0x1A
    sep #0x20
    lda.b #0x10
    sta.b 0x33
    stz.w 0x1F3F
    stz.b 0x35
    stz.b 0x30
    inc.w 0x1F43
    lda.b 0x11
    and.b #0x0E
    sta.b 0x34
    lda.b #0x0A
    sta.b 0x26
    jsl 0x849FFE
    dec.w 0x1F3B
    inc.w 0x1F08
.CBC5:
    rts

.CBC6:
    lda.b 0x34
    tsb.b 0x11
    stz.b 0x30
    ldx.b 0x02
    jsr (.CC39,X)
    rep #0x20
    lda.w #0xD7A0
    sta.b 0x20
    sep #0x20
    lda.b #0x13
    ldx.b 0x35
    beq .CBE2

    lda.b #0x00
.CBE2:
    sta.b 0x28
    jsl 0x849B43
    beq .CC19

    bpl .CC0F

    lda.b #0x12
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x80
    sta.w 0x1F3F
    stz.w 0x1F40
    stz.w 0x1F41
    stz.w 0x1F42
    stz.w 0x1F43
    inc.w 0x0BD8
    inc.w 0x1F0C
    jml 0x8280B4

.CC0F:
    lda.b #0x3C
    sta.b 0x35
    lda.b #0x13
    jsl _80888B
.CC19:
    lda.b 0x35
    beq .CC28

    dec
    sta.b 0x35
    and.b #0x03
    bne .CC28

    lda.b #0x0E
    trb.b 0x11
.CC28:
    rep #0x20
    lda.w #0xD796
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    jml 0x8280B4

.CC39: d16[.CC41, .CC8C, .CCA3, .CCE9]

.CC41:
    dec.b 0x33
    bne .CC8B

    jsl 0x849086
    lsr
    bcc .CC5D

    jsl 0x849086
    and.b #0x01
    tax
    lda.b #0x01
    sta.w 0x1F40,X
    lda.b #0x02
    sta.b 0x02
    rts

.CC5D:
    jsl 0x849086
    and.b #0x40
    sta.b 0x3D
    jsl 0x849086
    asl
    bcc .CC7C

    lda.b #0x06
    sta.b 0x02
    lda.b #0x3F
    sta.b 0x38
    lda.b #0x3C
    sta.b 0x33
    sta.w 0x1F42
    rts

.CC7C:
    lda.b #0x04
    sta.b 0x02
    lda.b #0x08
    sta.b 0x38
    lda.b #0x1E
    sta.b 0x33
    sta.w 0x1F42
.CC8B:
    rts

.CC8C:
    rep #0x20
    lda.w 0x1F40
    sep #0x20
    bne .CCA2

    jsl 0x849086
    and.b #0x3F
    clc
    adc.b #0x10
    sta.b 0x33
    stz.b 0x02
.CCA2:
    rts

.CCA3:
    dec.b 0x33
    bne .CCE6

    lda.b #0x10
    sta.b 0x33
    jsl 0x828358
    bne .CCE6

    inc.w 0x0000,X
    lda.b #0x31
    sta.w 0x000A,X
    lda.b 0x3D
    sta.w 0x0011,X
    lda.b 0x38
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0010
    sta.w 0x0008,X
    sep #0x30
    dec.b 0x38
    bpl .CCE6

    jsl 0x849086
    and.b #0x3F
    clc
    adc.b #0x10
    sta.b 0x33
    stz.b 0x02
.CCE6:
    sep #0x30
    rts

.CCE9:
    dec.b 0x33
    bne .CD2F

    lda.b #0x03
    sta.b 0x33
    jsl 0x828358
    bne .CD2D

    inc.w 0x0000,X
    lda.b #0x32
    sta.w 0x000A,X
    lda.b 0x38
    lsr
    sta.w 0x000B,X
    lda.b 0x3D
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0018
    sta.w 0x0008,X
    sep #0x20
    dec.b 0x38
    bpl .CD2D

    jsl 0x849086
    and.b #0x3F
    clc
    adc.b #0x10
    sta.b 0x33
    stz.b 0x02
.CD2D:
    sep #0x10
.CD2F:
    rts

.CD30:
    ldx.b 0x02
    jmp (.CD35,X)

.CD35: d16[.CD47, .CD7E, .CDB3, .CDDA, .CDFF, .CE1F, .CE37, .CE62, .CE8B]

.CD47:
    lda.b #0x02
    sta.b 0x02
    lda.b #0xFF
    sta.b 0x00
    jsl 0x849F85
    inc.w 0x1F13
    inc.w 0x1F14
    inc.w 0x1F15
    inc.w 0x1F16
    inc.w 0x1F17
    inc.w 0x1F18
    inc.w 0x1F1A
    inc.w 0x1F3B
    inc.w 0x1F31
    lda.b #0x3C
    sta.b 0x33
    lda.b #0xF6
    ldy.b #0x03
    jsl _808850.8868
    jml 0x8280B4

.CD7E:
    dec.b 0x33
    bne .CDAF

    jsl 0x849FAD
    jsl 0x849FE6
    dec.w 0x1F13
    dec.w 0x1F14
    dec.w 0x1F15
    dec.w 0x1F16
    dec.w 0x1F17
    dec.w 0x1F18
    dec.w 0x1F1A
    lda.b #0x78
    sta.b 0x33
    lda.b #0x04
    sta.b 0x02
    lda.b #0xF0
    sta.b 0x39
    jsl 0x84A311
.CDAF:
    jml 0x8280B4

.CDB3:
    dec.b 0x33
    bne .CDD0

    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    lda.w #0xD796
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x06
    sta.b 0x02
.CDD0:
    jsr .CEB4
    jsr .CEC1
    jml 0x8280B4

.CDDA:
    jsl 0x8281E8
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .CDF5

    lda.b #0x08
    sta.b 0x02
    rep #0x20
    lda.w #0x0200
    sta.b 0x1C
    sep #0x20
.CDF5:
    jsr .CEB4
    jsr .CEC1
    jml 0x8280B4

.CDFF:
    jsl 0x8281E8
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .CE15

    lda.b #0x0A
    sta.b 0x02
    lda.b #0x3C
    sta.b 0x33
.CE15:
    jsr .CEB4
    jsr .CEC1
    jml 0x8280B4

.CE1F:
    dec.b 0x33
    bne .CE2D

    lda.b #0x0C
    sta.b 0x02
    lda.b #0x21
    jsl _80888B.88B6
.CE2D:
    jsr .CEB4
    jsr .CEC1
    jml 0x8280B4

.CE37:
    lda.b #0x0E
    sta.b 0x02
    lda.b #0x80
    sta.w 0x0000
    lda.b #0x50
    sta.w 0x0002
    lda.b #0x40
    sta.w 0x0004
    lda.b #0x30
    sta.w 0x0006
    lda.b #0x1E
    sta.w 0x0008
    jsl 0x83F747
    jsr .CEC1
    jsr .CEB4
    jml 0x8280B4

.CE62:
    lda.w 0x1F2C
    bmi .CE81

    lda.b #0x10
    sta.b 0x02
    lda.b #0x04
    sta.w 0x1F7B
    stz.w 0x00CB
    stz.w 0x00CC
    stz.w 0x00CD
    lda.b #0x3F
    sta.w 0x00CA
    stz.w 0x00C9
.CE81:
    jsr .CEB4
    jsr .CEC1
    jml 0x8280B4

.CE8B:
    lda.w 0x0B9C
    lsr
    bcc .CEAA

    lda.w 0x00CB
    cmp.b #0x1F
    beq .CEAA

    inc
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    cmp.b #0x18
    bne .CEAA

    jsl 0x84A014
.CEAA:
    jsr .CEC1
    jsr .CEB4
    jml 0x8280B4

;-----

.CEB4:
    dec.b 0x39
    bne .CEC0

    lda.b #0xF0
    sta.b 0x39
    jsl 0x84A311
.CEC0:
    rts

;-----

.CEC1:
    rep #0x20
    lda.w #0xFFE0
    sta.w 0x0000
    sta.w 0x0002
    lda.w #0x003F
    sta.w 0x0004
    sta.w 0x0006
    sep #0x20
    lda.b #0x07
    sta.w 0x0008
    jsl 0x84A4C6
    rts

;-----

.CEE1:
    jsl 0x849086
    and.b #0x0F
    cmp.b #0x06
    lda.b #0x0E
    bcc .CEEF

    lda.b #0x08
.CEEF:
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.CEF4:
    stz.b 0x3D
    rep #0x20
    lda.w 0x0BAD
    cmp.w #0x0040
    bcs .CF09

    sep #0x20
    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    rts

.CF09:
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .CF15

    eor.w #0xFFFF
    inc
.CF15:
    cmp.w #0x0050
    sep #0x20
    rol.b 0x3D
    rep #0x20
    lda.w #0x00A8
    cmp.w 0x0BB0
    sep #0x20
    rol.b 0x3D
    lda.b 0x3D
    asl
    adc.b 0x3D
    clc
    adc.b #0x02
    tax
    ldy.b #0x02
    jsl 0x849086
    and.b #0x0F
.CF39:
    sec
    sbc.w 0x00D7AC,X
    bcc .CF43

    dex
    dey
    bne .CF39

.CF43:
    tya
    asl
    sta.b 0x02
    stz.b 0x03
    rts
