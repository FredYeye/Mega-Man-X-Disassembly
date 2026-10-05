capsule:
    ldx.b 0x01
    jmp (.CA80,X)

.CA80: d16[.CA86, .CB16, .CE4F]

.CA86:
    ldx.w 0x1F7A
    cpx.b #0x03
    bne .CAB9

    lda.w 0x1F7E
    bmi .CAC4

    inc
    sta.w 0x1F7E
    cmp.b #0x05
    bcc .CAC4

    lda.b #0x05
    sta.w 0x1F7E
    lda.w 0x1F99
    and.w 0x1F9C
    cmp.b #0xFF
    bne .CAC4

    bit.w 0x1F7C
    bvc .CAC4

    lda.w 0x0BCF
    and.b #0x7F
    cmp.b #0x20
    bne .CAC4

    bra .CAC8

.CAB9:
    ldy.w 0x86D365,X
    lda 0x86D3D8,Y
    and.w 0x1F99
    beq .CAC8

.CAC4:
    jml 0x828398

.CAC8:
    jsl 0x82827D
    stz.b 0x18
    stz.b 0x26
    lda.b #0x02
    sta.b 0x12
    sta.b 0x30
    lda.b #0x01
    sta.b 0x27
    stz.b 0x0F
    lda.b #0x25
    sta.b 0x10
    lda.b #0x02
    sta.b 0x02
    rep #0x20
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    asl
    tax
    lda.w 0x86D341,X
    sta.b 0x05
    lda.w 0x86D343,X
    sta.b 0x08
    lda.w #0xD319
    sta.b 0x20
    lda.w #0xB2E0
    sta.b 0x31
    sep #0x20
    lda.w 0x1F7A
    cmp.b #0x02
    beq .CB10

    cmp.b #0x05
    bne .CB15

.CB10:
    stz.b 0x02
    jsr .CF38
.CB15:
    rtl

.CB16:
    jsl 0x82806E
    bcc .CB20

    jml 0x828387

.CB20:
    lda.b #0x80
    tsb.b 0x2C
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    adc.w #0xD319
    sta.b 0x20
    jsl 0x82D7D0
    jsr .CFE1
    jsl 0x849A02
    lda.b 0x0F
    and.w #0x000F
    clc
    adc.w #0xD31D
    sta.b 0x20
    jsl 0x82D7D0
    jsr .CFE1
    jsl 0x849A02
    sep #0x20
    ldx.b 0x02
    jsr (.CB60,X)
    jsl 0x848FCA
    jml 0x82808F

.CB60: d16[.CB6A, .CBBB, .CC2A, .CC84, .CCB2]

.CB6A:
    ldx.b 0x03
    bne .CB97

    inc.b 0x03
    rep #0x20
    lda.w #0x0200
    sta.b 0x1C
    lda.w #0x2C00
    sta.b 0x29
    sep #0x20
    lda.w 0x1F7A
    cmp.b #0x02
    bne .CB8B

    lda.b #0x20
    jsl 0x80888B
.CB8B:
    lda.b #0x40
    jsl 0x84A311
    lda.b #0x00
    jsl 0x848F07
.CB97:
    lda.w 0x1F7A
    cmp.b #0x05
    beq .CBA4

    jsr .CF5D
    jsr .CF90
.CBA4:
    jsl 0x8490A0
    cmp.b #0x34
    bcs .CBB2

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.CBB2:
    jsl 0x82825D
    jsl 0x848EEA
    rts

.CBBB:
    ldx.b 0x03
    bne .CBC7

    inc.b 0x03
    lda.b #0x00
    jsl 0x848F07
.CBC7:
    lda.b #0x39
    sta.b 0x20
    lda.b #0xD3
    sta.b 0x21
    jsl 0x849B03
    beq .CC25

    lda.b #0xF1
    jsl 0x808868
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    sta.w 0x1F49
    jsl 0x849FE6
    rep #0x20
    lda.w 0x1E56
    sta.l 0x7FF000
    lda.w 0x1E58
    sta.l 0x7FF002
    lda.w 0x1E5A
    sta.l 0x7FF004
    lda.w 0x1E5C
    sta.l 0x7FF006
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    asl
    tax
    lda.w 0x86D3A4,X
    beq .CC23

    sta.w 0x1E5E
    sta.w 0x1E60
    lda.w 0x86D3A6,X
    sta.w 0x1E68
    sta.w 0x1E6E
.CC23:
    sep #0x20
.CC25:
    jsl 0x848EEA
    rts

.CC2A:
    ldx.b 0x03
    jmp (.CC2F,X)

.CC2F: d16[.CC35, .CC62, .CC72]

.CC35:
    rep #0x20
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    asl
    tax
    lda.w 0x86D3A4,X
    beq .CC58

    lda.w 0x1E4D
    cmp.w 0x1E6A
    bne .CC55

    lda.w 0x1E50
    cmp.w 0x1E6C
    beq .CC58

.CC55:
    sep #0x20
    rts

.CC58:
    sep #0x20
    lda.b #0x02
    sta.b 0x03
    stz.w 0x1F49
    rts

.CC62:
    lda.b #0x04
    sta.b 0x03
    lda.b #0x2A
    jsl 0x80888B
    lda.b #0x01
    jsl 0x848F07
.CC72:
    lda.b 0x0F
    bpl .CC7F

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    jmp .CFEA

.CC7F:
    jsl 0x848EEA
    rts

.CC84:
    ldx.b 0x03
    bne .CC90

    inc.b 0x03
    lda.b #0x02
    jsl 0x848F07
.CC90:
    lda.b #0x3D
    sta.b 0x20
    lda.b #0xD3
    sta.b 0x21
    jsl 0x849B03
    beq .CCAD

    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    sta.w 0x1F49
    sta.w 0x0BD8
    sta.w 0x1F3B
.CCAD:
    jsl 0x848EEA
    rts

.CCB2:
    ldx.b 0x03
    jmp (.CCB7,X)

.CCB7: d16[.CCC9, .CD24, .CD49, .CD6B, .CD9B, .CDAD, .CDBE, .CDED, .CE40]

.CCC9:
    lda.b #0x02
    sta.b 0x03
    stz.w 0x1F49
    rep #0x20
    lda.b 0x05
    sta.w 0x0BAD
    stz.w 0x00A7
    stz.w 0x00A9
    stz.w 0x00AB
    stz.w 0x0BDE
    stz.w 0x0BE0
    sep #0x20
    lda.b #0x14
    sta.b 0x33
    sta.w 0x1F48
    sta.w 0x1F31
    stz.w 0x0BDB
    lda.b #0x04
    sta.w 0x1F12
    lda.b #0x03
    sta.w 0x0C0F
    ldx.b #0x30
    ldy.b #0x40
    jsl 0x828000
    rep #0x10
    ldy.w #0x0100
    jsl 0x828011
    sep #0x10
    jsl 0x84A2A7
    lda.b #0x4B
    jsl 0x80888B
    jsl 0x849FE6
    stz.w 0x0C16
    rts

.CD24:
    dec.b 0x33
    bne .CD48

    lda.b #0x04
    sta.b 0x03
    lda.b #0xFF
    sta.b 0x33
    lda.b #0x08
    sta.b 0x38
    sta.b 0x37
    lda.b #0x03
    sta.b 0x3A
    stz.b 0x39
    lda.b #0x08
    sta.b 0x36
    lda.b #0x08
    sta.b 0x35
    lda.b #0x01
    sta.b 0x34
.CD48:
    rts

.CD49:
    lda.b #0x00
    jsr .CE53
    dec.b 0x33
    bne .CD5B

    lda.b #0x06
    sta.b 0x03
    lda.b #0x80
    sta.b 0x33
    rts

.CD5B:
    lda.b 0x33
    cmp.b #0x14
    bne .CD66

    lda.b #0x00
    jsr .CECD
.CD66:
    ldx.b #0x00
    jmp .CEF3

.CD6B:
    lda.b #0x01
    jsr .CE53
    dec.b 0x33
    bne .CD96

    lda.b #0x08
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x33
    rep #0x30
    ldy.w #0x0160
    jsl 0x828011
    lda.w 0x0BDB
    and.w #0x00FF
    adc.w #0x0100
    tay
    jsl 0x828011
    sep #0x30
    rts

.CD96:
    ldx.b #0x01
    jmp .CEF3

.CD9B:
    dec.b 0x33
    bne .CDAC

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x33
    lda.b #0x01
    jsr .CECD
.CDAC:
    rts

.CDAD:
    dec.b 0x33
    bne .CDBD

    lda.b #0x0C
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x33
    jsl 0x84A01D
.CDBD:
    rts

.CDBE:
    dec.b 0x33
    bne .CDEC

    stz.w 0x0BD8
    stz.w 0x1F3B
    lda.b #0x0E
    sta.b 0x03
    stz.b 0x3B
    lda.b #0x01
    sta.b 0x3C
    ldx.b #0x05
.CDD4:
    lda.l 0x7EFFC0,X
    sta.l 0x7FF008,X
    dex
    bpl .CDD4

    ldx.b #0x05
.CDE1:
    lda.l 0x86EE23,X
    sta.l 0x7EFFC0,X
    dex
    bpl .CDE1

.CDEC:
    rts

.CDED:
    dec.b 0x3C
    bne .CE2B

    ldx.w 0x1F7A
    lda.w 0x86D36E,X
    clc
    adc.b 0x3B
    tax
    lda.w 0x86D36E,X
    cmp.b #0xFF
    bne .CE20

    lda.b #0x10
    sta.b 0x03
    stz.w 0x1F48
    stz.w 0x1F31
    stz.w 0x0BD8
    stz.w 0x1F3B
    ldx.b #0x05
.CE14:
    lda.l 0x7FF008,X
    sta.l 0x7EFFC0,X
    dex
    bpl .CE14

    rts

.CE20:
    sta.b 0x3C
    lda.w 0x86D36F,X
    sta.b 0x3D
    inc.b 0x3B
    inc.b 0x3B
.CE2B:
    lda.w 0x00A8
    sta.w 0x00AA
    lda.b 0x3D
    sta.w 0x00A8
    eor.w 0x00AA
    and.w 0x00A8
    sta.w 0x00AC
    rts

.CE40:
    jsl 0x82806E
    bcc .CE4A

    lda.b #0x04
    sta.b 0x01
.CE4A:
    jsl 0x848EEA
    rts

.CE4F:
    jml 0x828398

;-----

.CE53:
    sta.w 0x0000
    dec.b 0x35
    bne .CEB2

    lda.b #0x09
    sec
    sbc.b 0x34
    sta.b 0x35
    dec.b 0x36
    bne .CE72

    lda.w 0x0000
    bne .CE6F

    jsr .CEB3
    bra .CE72

.CE6F:
    jsr .CEC0
.CE72:
    rep #0x10
    ldy.w #0x0003
.CE77:
    jsl 0x8282D3
    bne .CEB0

    inc.w 0x0000,X
    lda.b #0x37
    sta.w 0x000A,X
    lda.b 0x34
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x08
    adc.w #0xFFE8
    sta.w 0x0008,X
    jsl 0x849086
    and.w #0x001F
    sta.w 0x0000
    lda.b 0x05
    clc
    adc.w #0xFFF0
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    sep #0x20
    dey
    bpl .CE77

.CEB0:
    sep #0x10
.CEB2:
    rts

;-----

.CEB3:
    lda.b 0x34
    cmp.b #0x07
    beq .CEBB

    inc.b 0x34
.CEBB:
    lda.b #0x03
    sta.b 0x36
    rts

;-----

.CEC0:
    lda.b 0x34
    cmp.b #0x01
    beq .CEC8

    dec.b 0x34
.CEC8:
    lda.b #0x01
    sta.b 0x36
    rts

;-----

.CECD:
    sta.w 0x0000
    jsl 0x828321
    bne .CEF0

    inc.w 0x0000,X
    lda.b #0x4E
    sta.w 0x000A,X
    lda.w 0x0000
    sta.w 0x0003,X
    lda.w 0x1F7A
    and.b #0xFF
    tay
    lda 0x86D365,Y
    sta.w 0x000B,X
.CEF0:
    sep #0x10
    rts

;-----

.CEF3:
    dec.b 0x37
    bne .CF25

    lda.b 0x38
    sta.b 0x37
    dec.b 0x3A
    bne .CF0E

    lda.b #0x03
    sta.b 0x3A
    txa
    beq .CF0B

    jsr .CF2F
    bra .CF0E

.CF0B:
    jsr .CF26
.CF0E:
    lda.b 0x39
    inc
    and.b #0x03
    sta.b 0x39
    rep #0x31
    and.w #0x00FF
    asl
    adc.w #0x0160
    tay
    jsl 0x828011
    sep #0x30
.CF25:
    rts

;-----

.CF26:
    lda.b 0x38
    cmp.b #0x01
    beq .CF2E

    dec.b 0x38
.CF2E:
    rts

;-----

.CF2F:
    lda.b 0x38
    cmp.b #0x08
    beq .CF37

    inc.b 0x38
.CF37:
    rts

;-----

.CF38:
    jsl 0x8282D3
    bne .CF5A

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x1D
    sta.w 0x000B,X
    stz.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.CF5A:
    sep #0x30
    rts

;-----

.CF5D:
    lda.w 0x0B9C
    and.b #0x0F
    bne .CF8F

    rep #0x10
    ldy.w #0x0003
.CF69:
    jsl 0x8282D3
    bne .CF8D

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    tya
    clc
    adc.b #0x2A
    ora.b #0x80
    sta.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    phy
    jsr .CFB3
    ply
    dey
    bpl .CF69

.CF8D:
    sep #0x10
.CF8F:
    rts

;-----

.CF90:
    lda.w 0x0B9C
    bit.b #0x03
    bne .CFB0

    jsl 0x8282D3
    bne .CFB0

    inc.w 0x0000,X
    lda.b #0x31
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    jsr .CFB3
.CFB0:
    sep #0x20
    rts

;-----

.CFB3:
    rep #0x21
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    asl
    tay
    lda 0x86D343,Y
    adc.w #0xFFD0
    sta.w 0x0008,X
    jsl 0x849086
    and.w #0x001F
    sta.w 0x0000
    lda.b 0x05
    clc
    adc.w #0xFFF0
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    sep #0x20
    rts

;-----

.CFE1:
    lda.b 0x20
    clc
    adc.w #0x0010
    sta.b 0x20
    rts

;-----

.CFEA:
    jsl 0x828321
    bne .D00F

    inc.w 0x0000,X
    lda.b #0x5C
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    stz.w 0x000B,X
    rep #0x21
    lda.b 0x08
    adc.w #0x000A
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
.D00F:
    sep #0x30
    rts