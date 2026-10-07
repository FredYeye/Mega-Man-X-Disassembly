velguader:
    ldx.b 0x01
    jmp (.C838,X)

.C838: d16[.C840, .C88B, .C90C, .D036]

.C840:
    lda.b 0x02
    bne .C84A

    inc.b 0x02
    lda.b #0x10
    sta.b 0x35
.C84A:
    dec.b 0x35
    beq .C84F

    rtl

.C84F:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x34
    lda.b #0x02
    sta.b 0x12
    lda.b #0x06
    sta.b 0x26
    lda.b #0x20
    sta.b 0x27
    stz.b 0x02
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
    rep #0x20
    lda.w #0xCD14
    sta.b 0x20
    stz.b 0x36
    sep #0x20
    stz.b 0x39
    stz.b 0x3A
    stz.b 0x3B
    stz.b 0x3C
    stz.b 0x3D
    lda.b #0x00
    jsl _848EEA.8F07
    rtl

.C88B:
    ldx.b 0x02
    jsr (.C894,X)
    jmp _82808F.80B4

    rtl

.C894: d16[.C89A, .C8B4, .C8D4]

.C89A:
    lda.w 0x1F3F
    beq .C8B3

    jsl 0x849FE6
    lda.b #0x02
    sta.b 0x02
    lda.b #0x05
    jsl _848EEA.8F07
    lda.b #0x7E
    jsl _80888B
.C8B3:
    rts

.C8B4:
    lda.b 0x0F
    bmi .C8BF

    jsl _848EEA
    jmp .C8D3

.C8BF:
    rep #0x20
    tdc
    sta.w 0x1F0E
    sep #0x20
    stz.b 0x27
    lda.b #0x04
    sta.b 0x02
    lda.b #0x00
    jsl _848EEA.8F07
.C8D3:
    rts

.C8D4:
    lda.w 0x0B9C
    lsr
    bcc .C907

    lda.b 0x27
    and.b #0x7F
    cmp.b #0x20
    beq .C8F0

    inc
    ora.b #0x80
    sta.b 0x27
    lda.b #0x0C
    jsl _80888B.88B6
    jmp .C907

.C8F0:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    stz.b 0x38
    stz.w 0x1F1D
    lda.b #0x1E
    jsl _80878B
    jsl 0x849FFE
.C907:
    jsl _848EEA
    rts

.C90C:
    ldx.b 0x02
    jsr (.C9A6,X)
    lda.b 0x27
    bne .C918

    jmp .C9A1

.C918:
    lda.b 0x38
    beq .C91F

    jmp .C923

.C91F:
    lda.b #0x0A
    sta.b 0x28
.C923:
    jsl 0x849B43
    beq .C96A

    lda.b 0x27
    and.b #0x7F
    bne .C95A

    lda.w 0x0BCF
    and.b #0x7F
    beq .C95E

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    lda.b #0x20
    sta.b 0x35
    lda.b #0x01
    sta.w 0x0BD8
    sta.w 0x1F0C
    jsl 0x849FE6
    lda.b #0x01
    sta.w 0x1F13
    sta.w 0x1F14
    sta.w 0x1F17
    jmp .C9A1

.C95A:
    lda.b #0x0E
    trb.b 0x11
.C95E:
    lda.b #0x18
    sta.b 0x38
    lda.b #0x05
    sta.b 0x28
    lda.b #0x01
    sta.b 0x3D
.C96A:
    lda.w 0x1F1D
    cmp.b #0x02
    beq .C979

    cmp.b #0x1D
    beq .C979

    cmp.b #0x03
    bne .C991

.C979:
    lda.b 0x3C
    bne .C991

    lda.b #0x07
    jsl _848EEA.8F07
    lda.b #0x0C
    sta.b 0x02
    stz.b 0x03
    lda.b #0x01
    sta.b 0x3C
    lda.b #0x22
    sta.b 0x38
.C991:
    lda.b 0x3D
    bne .C999

    lda.b 0x34
    tsb.b 0x11
.C999:
    stz.b 0x3D
    dec.b 0x38
    jsl _849B03
.C9A1:
    jml 0x8280B4

    rtl

.C9A6: d16[.C9B4, .CB90, .CC71, .CDD5, .CE84, .CEC1, .CFCB]

.C9B4:
    ldx.b 0x03
    jsr (.C9BA,X)
    rts

.C9BA: d16[.C9CA, .CA4F, .CAAE, .CAD4, .CB29, .CB38, .CB65, .CB74]

.C9CA:
    lda.b 0x39
    bne .C9D7

    lda.b #0x02
    jsl _848EEA.8F07
    jmp .CA02

.C9D7:
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    lda.b 0x11
    and.b #0x40
    beq .C9F0

    rep #0x20
    lda.b 0x05
    clc
    adc.w #0x0010
    sta.b 0x05
    jmp .C9FA

.C9F0:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0010
    sta.b 0x05
.C9FA:
    sep #0x20
    lda.b #0x03
    jsl _848EEA.8F07
.CA02:
    lda.b 0x3A
    bne .CA0C

    lda.b 0x39
    cmp.b #0x03
    bne .CA21

.CA0C:
    rep #0x20
    lda.w #0xCD14
    sta.b 0x20
    sep #0x20
    lda.b #0x06
    sta.b 0x03
    jsr .D0E7
    stz.b 0x39
    jmp .CA4E

.CA21:
    lda.b #0x02
    sta.b 0x03
    inc.b 0x39
    lda.b 0x11
    and.b #0x40
    beq .CA37

    rep #0x20
    lda.w #0x0600
    sta.b 0x1A
    jmp .CA3E

.CA37:
    rep #0x20
    lda.w #0xFA00
    sta.b 0x1A
.CA3E:
    lda.w #0x0550
    sta.b 0x1C
    lda.w #0xCD1E
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
.CA4E:
    rts

.CA4F:
    lda.b 0x0F
    and.b #0x01
    beq .CA59

    jsl _848EEA
.CA59:
    lda.b 0x0F
    and.b #0x02
    beq .CA63

    jsl update_pos_xy.neg_ay
.CA63:
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x01
    bne .CA73

    lda.b 0x2B
    and.b #0x02
    beq .CA86

.CA73:
    lda.b 0x2B
    and.b #0x04
    bne .CA86

    lda.b #0x04
    sta.b 0x03
    lda.b #0x09
    jsl _848EEA.8F07
    jmp .CAAB

.CA86:
    rep #0x20
    lda.b 0x1C
    bpl .CAAB

    sep #0x20
    lda.b 0x3A
    beq .CAA5

    lda.b 0x2B
    and.b #0x04
    beq .CAAB

    lda.b #0x04
    jsl _848EEA.8F07
    lda.b #0x0E
    sta.b 0x03
    jmp .CAAB

.CAA5:
    lda.b #0x11
    jsl _848EEA.8F07
.CAAB:
    sep #0x20
    rts

.CAAE:
    lda.b 0x0F
    bmi .CAB9

    jsl _848EEA
    jmp .CAD3

.CAB9:
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bmi .CAC9

    sep #0x20
    lda.b 0x3A
    beq .CACF

.CAC9:
    sep #0x20
    lda.b #0x03
    sta.b 0x39
.CACF:
    lda.b #0x00
    sta.b 0x03
.CAD3:
    rts

.CAD4:
    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    bne .CB1A

    lda.b 0x2B
    and.b #0x01
    bne .CAEE

    lda.b 0x2B
    and.b #0x02
    beq .CB26

.CAEE:
    lda.b #0x0A
    jsl _848EEA.8F07
    lda.b #0x0A
    sta.b 0x03
    lda.b #0x40
    sta.b 0x1E
    rep #0x20
    lda.w #0x03D5
    sta.b 0x1C
    lda.b 0x11
    and.w #0x0040
    beq .CB12

    lda.w #0xFF00
    sta.b 0x1A
    jmp .CB26

.CB12:
    lda.w #0x0100
    sta.b 0x1A
    jmp .CB26

.CB1A:
    sep #0x20
    lda.b #0x04
    jsl _848EEA.8F07
    lda.b #0x08
    sta.b 0x03
.CB26:
    sep #0x20
    rts

.CB29:
    lda.b 0x0F
    bmi .CB34

    jsl _848EEA
    jmp .CB37

.CB34:
    jsr .D137
.CB37:
    rts

.CB38:
    jsl _848EEA
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.b 0x1C
    cmp.w #0xF700
    bpl .CB4E

    lda.w #0xF700
    sta.b 0x1C
.CB4E:
    sep #0x20
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .CB64

    lda.b #0x0B
    jsl _848EEA.8F07
    lda.b #0x0C
    sta.b 0x03
.CB64:
    rts

.CB65:
    lda.b 0x0F
    bmi .CB70

    jsl _848EEA
    jmp .CB73

.CB70:
    jsr .D137
.CB73:
    rts

.CB74:
    lda.b 0x0F
    bpl .CB8B

    lda.b #0x01
    sta.b 0x35
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
    jmp .CB8F

.CB8B:
    jsl _848EEA
.CB8F:
    rts

.CB90:
    ldx.b 0x03
    jsr (.CB96,X)
    rts

.CB96: d16[.CB9A, .CBB4]

.CB9A:
    lda.b #0x05
    jsl _848EEA.8F07
    lda.b #0x08
    sta.b 0x35
    lda.b #0x02
    sta.b 0x03
    stz.b 0x39
    rep #0x20
    lda.w #0xCD28
    sta.b 0x20
    sep #0x20
    rts

.CBB4:
    lda.b 0x0F
    cmp.b #0x80
    bne .CBBD

    jmp .CC5C

.CBBD:
    and.b #0x01
    bne .CBC4

    jmp .CC51

.CBC4:
    lda.b 0x39
    beq .CBCB

    jmp .CC53

.CBCB:
    ldy.b 0x35
    dey
    dey
    sty.b 0x35
    cpy.b #0xFF
    bne .CBD8

    jmp .CC5C

.CBD8:
    rep #0x10
    jsl 0x828358
    beq .CBE3

    jmp .CC5C

.CBE3:
    lda.b #0x01
    sta.b 0x39
    inc.w 0x0000,X
    lda.b #0x13
    sta.w 0x000B,X
    lda.b #0x29
    sta.w 0x000A,X
    lda.b 0x11
    ora.b 0x34
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b 0x11
    and.b #0x40
    beq .CC1C

    rep #0x20
    lda 0x00CD32,Y
    sta.w 0x001A,X
    lda.w #0x0017
    sta.w 0x0000
    jmp .CC2E

.CC1C:
    rep #0x20
    lda 0x00CD32,Y
    eor.w #0xFFFF
    inc
    sta.w 0x001A,X
    lda.w #0xFFE9
    sta.w 0x0000
.CC2E:
    lda.w #0x0500
    sta.w 0x001C,X
    lda.w #0xFFF4
    sta.w 0x0002
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w 0x0002
    sta.w 0x0008,X
    sep #0x20
    jmp .CC53

.CC51:
    stz.b 0x39
.CC53:
    sep #0x10
    jsl _848EEA
    jmp .CC6E

.CC5C:
    sep #0x10
    lda.b #0x0F
    sta.b 0x35
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
.CC6E:
    sep #0x10
    rts

.CC71:
    ldx.b 0x03
    jsr (.CC77,X)
    rts

.CC77: d16[.CC7D, .CCE4, .CDB5]

.CC7D:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x06
    jsl _848EEA.8F07
    lda.b #0x07
    sta.b 0x35
    stz.b 0x39
    stz.b 0x36
    stz.b 0x3A
    stz.b 0x3E
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x0BB0
    cmp.w #0x0050
    bmi .CCBF

    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bpl .CCB4

    cmp.w #0xFFE0
    bmi .CCBF

    lsr
    ora.w #0xF000
    jmp .CCBA

.CCB4:
    cmp.w #0x0020
    bpl .CCBF

    lsr
.CCBA:
    sta.b 0x1A
    jmp .CCCA

.CCBF:
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    asl
    asl
    asl
    sta.b 0x1A
.CCCA:
    lda.w #0xFCA0
    sta.b 0x1C
    lda.w #0xCD28
    sta.b 0x20
    sep #0x20
    jsl get_rng
    and.b #0x07
    lsr
    bne .CCE3

    lda.b #0x01
    sta.b 0x36
.CCE3:
    rts

.CCE4:
    lda.b 0x3E
    bne .CCED

    dec.b 0x3E
    jmp .CCF7

.CCED:
    lda.b #0x20
    sta.b 0x3E
    lda.b #0x77
    jsl _80888B.88B6
.CCF7:
    lda.b 0x0F
    bpl .CD02

    lda.b 0x39
    bne .CD02

    jmp .CD8F

.CD02:
    lda.b 0x0F
    and.b #0x01
    bne .CD0D

    stz.b 0x3A
    jmp .CD86

.CD0D:
    lda.b 0x3A
    beq .CD14

    jmp .CD86

.CD14:
    dec.b 0x35
    lda.b 0x35
    bne .CD1D

    jmp .CD8F

.CD1D:
    rep #0x10
    jsl 0x828358
    bne .CD86

    inc.b 0x3A
    inc.w 0x0000,X
    lda.b #0x08
    sta.w 0x000B,X
    lda.b #0x29
    sta.w 0x000A,X
    lda.b 0x11
    ora.b 0x34
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x16
    sta.w 0x0016,X
    rep #0x20
    lda.b 0x11
    and.w #0x0040
    bne .CD57

    lda.w #0xFFE9
    sta.w 0x0000
    jmp .CD5D

.CD57:
    lda.w #0x0017
    sta.w 0x0000
.CD5D:
    lda.w #0x0010
    sta.w 0x0002
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w 0x0002
    sta.w 0x0008,X
    lda.b 0x1A
    sta.w 0x001A,X
    lda.b 0x1C
    sta.w 0x001C,X
    sep #0x20
    lda.b #0x40
    sta.w 0x001E
.CD86:
    sep #0x10
    jsl _848EEA
    jmp .CDB4

.CD8F:
    lda.b 0x36
    beq .CDA4

    lda.b #0x28
    sta.b 0x35
    lda.b #0x04
    sta.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    jmp .CDB4

.CDA4:
    lda.b #0x0F
    sta.b 0x35
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
.CDB4:
    rts

.CDB5:
    dec.b 0x35
    bne .CDD0

    lda.b #0x07
    sta.b 0x35
    stz.b 0x39
    stz.b 0x3A
    stz.b 0x36
    lda.b #0x02
    sta.b 0x03
    lda.b #0x06
    jsl _848EEA.8F07
    jmp .CDD4

.CDD0:
    jsl _848EEA
.CDD4:
    rts

.CDD5:
    ldx.b 0x03
    jsr (.CDDB,X)
    rts

.CDDB: d16[.CDE1, .CE0B, .CE1B]

.CDE1:
    rep #0x20
    lda.b 0x11
    and.w #0x0040
    bne .CDF2

    lda.w #0xFDA0
    sta.b 0x1A
    jmp .CDF7

.CDF2:
    lda.w #0x0260
    sta.b 0x1A
.CDF7:
    stz.b 0x1C
    lda.w #0xCD28
    sta.b 0x20
    sep #0x20
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x03
    rts

.CE0B:
    lda.b 0x0F
    beq .CE16

    jsl _848EEA
    jmp .CE1A

.CE16:
    lda.b #0x04
    sta.b 0x03
.CE1A:
    rts

.CE1B:
    jsl update_pos_x
    jsl _848EEA
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x01
    bne .CE6F

    lda.b 0x2B
    and.b #0x02
    bne .CE6F

    lda.b 0x11
    and.b #0x40
    bne .CE47

    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.w #0x0020
    sta.b 0x36
    jmp .CE52

.CE47:
    rep #0x20
    lda.w 0x0BAD
    clc
    adc.w #0x0020
    sta.b 0x36
.CE52:
    lda.b 0x36
    sec
    sbc.b 0x05
    sta.b 0x36
    lda.b 0x11
    and.w #0x0040
    bne .CE68

    lda.b 0x36
    eor.w #0xFFFF
    inc
    sta.b 0x36
.CE68:
    lda.b 0x36
    cmp.w #0x0000
    bpl .CE81

.CE6F:
    sep #0x20
    lda.b #0x08
    sta.b 0x35
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
.CE81:
    sep #0x20
    rts

.CE84:
    rep #0x20
    lda.b 0x11
    and.w #0x0040
    beq .CE95

    lda.w #0x03C0
    sta.b 0x1A
    jmp .CE9A

.CE95:
    lda.w #0xFC40
    sta.b 0x1A
.CE9A:
    lda.w #0x048A
    sta.b 0x1C
    lda.w #0xCD1E
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x00
    sta.b 0x02
    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    sta.b 0x3A
    lda.b #0x03
    sta.b 0x39
    lda.b #0x02
    jsl _848EEA.8F07
    rts

.CEC1:
    jsl 0x879ED4
    jsl _8491AD.91BE
    lda.b 0x35
    beq .CED2

    dec.b 0x35
    jmp .CFB0

.CED2:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .CEE0

    eor.w #0xFFFF
    inc
.CEE0:
    cmp.w #0x0080
    bpl .CEEE

    sep #0x20
    lda.b #0x01
    sta.b 0x39
    jmp .CEF2

.CEEE:
    sep #0x20
    stz.b 0x39
.CEF2:
    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.b 0x08
    bcs .CF00

    eor.w #0xFFFF
    inc
.CF00:
    cmp.w #0x0080
    bmi .CF0E

    sep #0x20
    lda.b #0x01
    sta.b 0x3A
    jmp .CF12

.CF0E:
    sep #0x20
    stz.b 0x3A
.CF12:
    jsr .D148
    lda.b 0x3A
    beq .CF51

    lda.b 0x39
    beq .CF37

    lda.b 0x36
    cmp.b #0x05
    bpl .CF26

    jmp .CF97

.CF26:
    cmp.b #0x0A
    bpl .CF2D

    jmp .CFA5

.CF2D:
    cmp.b #0x0E
    bpl .CF34

    jmp .CFAC

.CF34:
    jmp .CF90

.CF37:
    lda.b 0x36
    cmp.b #0x04
    bpl .CF40

    jmp .CF97

.CF40:
    cmp.b #0x06
    bpl .CF47

    jmp .CFA5

.CF47:
    cmp.b #0x08
    bpl .CF4E

    jmp .CF90

.CF4E:
    jmp .CFAC

.CF51:
    lda.b 0x39
    beq .CF76

    lda.b 0x36
    cmp.b #0x02
    bpl .CF5E

    jmp .CF9E

.CF5E:
    cmp.b #0x04
    bpl .CF65

    jmp .CF97

.CF65:
    cmp.b #0x09
    bpl .CF6C

    jmp .CFA5

.CF6C:
    cmp.b #0x0E
    bpl .CF73

    jmp .CF90

.CF73:
    jmp .CFAC

.CF76:
    lda.b 0x36
    cmp.b #0x02
    bpl .CF7F

    jmp .CF9E

.CF7F:
    cmp.b #0x04
    bpl .CF86

    jmp .CF97

.CF86:
    cmp.b #0x0C
    bpl .CF8D

    jmp .CFA5

.CF8D:
    jmp .CF90

.CF90:
    lda.b #0x08
    sta.b 0x02
    jmp .CFB0

.CF97:
    lda.b #0x04
    sta.b 0x02
    jmp .CFB0

.CF9E:
    lda.b #0x02
    sta.b 0x02
    jmp .CFB0

.CFA5:
    lda.b #0x06
    sta.b 0x02
    jmp .CFB0

.CFAC:
    lda.b #0x00
    sta.b 0x02
.CFB0:
    stz.b 0x3A
    stz.b 0x39
    stz.b 0x36
    stz.b 0x37
    stz.b 0x3C
    stz.w 0x1F1D
    rep #0x20
    lda.w #0xCD14
    sta.b 0x20
    sep #0x20
    jsl _848EEA
    rts

.CFCB:
    ldx.b 0x03
    jsr (.CFD1,X)
    rts

.CFD1: d16[.CFD7, .CFDF, .D01D]

.CFD7:
    jsr .D188
    lda.b #0x02
    sta.b 0x03
    rts

.CFDF:
    jsl _848EEA
    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x01
    bne .D003

    lda.b 0x2B
    and.b #0x02
    beq .D00C

    rep #0x20
    lda.w #0x0100
    sta.b 0x1A
    sep #0x20
    jmp .D00C

.D003:
    rep #0x20
    lda.w #0xFF00
    sta.b 0x1A
    sep #0x20
.D00C:
    lda.b 0x2B
    and.b #0x04
    beq .D01C

    lda.b #0x0B
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x03
.D01C:
    rts

.D01D:
    lda.b 0x0F
    bpl .D025

    jsl _848EEA
.D025:
    lda.b #0x01
    sta.b 0x35
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.D036:
    ldx.b 0x02
    jsr (.D043,X)
    lda.b 0x3B
    bne .D042

    jmp _82808F.80B4

.D042:
    rtl

.D043: d16[.D047, .D06D]

.D047:
    lda.b 0x34
    tsb.b 0x11
    lda.b 0x35
    beq .D054

    dec.b 0x35
    jmp .D06C

.D054:
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F17
    lda.b #0x07
    jsl _848EEA.8F07
    jsr .D188
    lda.b #0x02
    sta.b 0x02
    stz.b 0x35
.D06C:
    rts

.D06D:
    jsl _848EEA
    lda.b 0x35
    bne .D0AF

    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x01
    bne .D095

    lda.b 0x2B
    and.b #0x02
    beq .D09E

    rep #0x20
    lda.w #0x0100
    sta.b 0x1A
    sep #0x20
    jmp .D09E

.D095:
    rep #0x20
    lda.w #0xFF00
    sta.b 0x1A
    sep #0x20
.D09E:
    lda.b 0x2B
    and.b #0x04
    beq .D0E6

    jsr .D151
    lda.b #0x01
    sta.b 0x3B
    lda.b #0x50
    sta.b 0x35
.D0AF:
    rep #0x20
    lda.w #0xFFE1
    sta.w 0x0000
    sta.w 0x0002
    lda.w #0x001F
    sta.w 0x0004
    sta.w 0x0006
    lda.w #0x0003
    sta.w 0x0008
    sep #0x20
    jsl 0x84A4C6
    dec.b 0x35
    bne .D0E6

    stz.w 0x0BD8
    stz.w 0x1F0C
    jsl 0x849FFE
    lda.b #0x00
    sta.w 0x1F3F
    jsl 0x828398
.D0E6:
    rts

;-----

.D0E7:
    lda.b 0x11
    and.b #0x40
    beq .D0FB

    rep #0x20
    lda.w #0x0600
    clc
    adc.w #0x0010
    sta.b 0x1A
    jmp .D106

.D0FB:
    rep #0x20
    lda.w #0xFA00
    sec
    sbc.w #0x0010
    sta.b 0x1A
.D106:
    stz.b 0x1C
    sep #0x20
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .D118

    eor.w #0xFFFF
    inc
.D118:
    cmp.w #0x0080
    bpl .D124

    ldx.b #0x30
    stx.b 0x1E
    jmp .D134

.D124:
    cmp.w #0x00A0
    bpl .D130

    ldx.b #0x28
    stx.b 0x1E
    jmp .D134

.D130:
    ldx.b #0x10
    stx.b 0x1E
.D134:
    sep #0x20
    rts

;-----

.D137:
    stz.b 0x03
    lda.b #0x0A
    sta.b 0x02
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x08
    sta.b 0x35
    rts

;-----

.D148:
    jsl get_rng
    and.b #0x0F
    sta.b 0x36
    rts

;-----

.D151:
    rep #0x10
    ldy.w #0x0010
.D156:
    jsl 0x8282D3
    bne .D185

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    stz.w 0x000C,X
    sep #0x20
    lda 0x00CD3A,Y
    sta.w 0x000B,X
    lda.b 0x11
    ora.b 0x34
    sta.w 0x0011,X
    dey
    bne .D156

.D185:
    sep #0x10
    rts

;-----

.D188:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .D1AD

    lda.b 0x02
    cmp.w #0x000C
    beq .D1A3

    rep #0x20
    lda.w #0x0280
    sta.b 0x1A
    jmp .D1CD

.D1A3:
    rep #0x20
    lda.w #0x0280
    sta.b 0x1A
    jmp .D1C5

.D1AD:
    lda.b 0x02
    cmp.w #0x000C
    beq .D1BE

    rep #0x20
    lda.w #0xFD80
    sta.b 0x1A
    jmp .D1CD

.D1BE:
    rep #0x20
    lda.w #0xFD80
    sta.b 0x1A
.D1C5:
    lda.w #0x0280
    sta.b 0x1C
    jmp .D1D2

.D1CD:
    lda.w #0x0480
    sta.b 0x1C
.D1D2:
    lda.w #0xCD1E
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    rts
