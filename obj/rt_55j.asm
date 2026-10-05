rt_55j:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.CC67,X)
    lda.b 0x39
    bne .CC2C

    stz.b 0x28
    rep #0x20
    lda.w #0xC70E
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    jsl 0x849B43
    rep #0x20
    lda.w #0xC704
    sta.b 0x20
    sep #0x20
.CC2C:
    lda.b #0x06
    ldx.b 0x3A
    beq .CC36

    dec.b 0x3A
    lda.b #0x05
.CC36:
    sta.b 0x28
    jsl 0x849B03
    jsl 0x849B43
    beq .CC60

    bpl .CC54

    inc.b 0x37
    lda.b #0x0A
    sta.b 0x01
    stz.b 0x02
    lda.b 0x38
    beq .CC54

    jsl 0x849F79
.CC54:
    lda.b 0x3A
    bne .CC60

    lda.b #0x0E
    trb.b 0x11
    lda.b #0x1E
    sta.b 0x3A
.CC60:
    jsr .CF98
    jml 0x8280B4

.CC67: d16[.CC73, .CCA9, .CD01, .CD5C, .CDB4, .CEC3]

.CC73:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x40
    sta.b 0x27
    stz.b 0x37
    stz.b 0x38
    stz.b 0x39
    stz.b 0x3A
    rep #0x20
    lda.w #0xC704
    sta.b 0x20
    sep #0x20
    lda.b #0x04
    jsl 0x848F07
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x04
    sta.b 0x01
    rts

.CCA9:
    ldx.b 0x02
    jmp (.CCAE,X)

.CCAE: d16[.CCB4, .CCD9, .CCEE]

.CCB4:
    lda.b #0x02
    sta.b 0x02
    jsl 0x84AC92
    rep #0x20
    lda.w #0x0618
    sta.b 0x1C
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    asl
    asl
    sta.b 0x1A
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    lda.b #0x02
    jsl 0x848F07
.CCD9:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .CCED

    lda.b #0x04
    sta.b 0x02
    jsl 0x8281E8
    jsl 0x8491BE
.CCED:
    rts

.CCEE:
    jsl 0x8281E8
    jsl 0x8491BE
    lda.b 0x1D
    bpl .CD00

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.CD00:
    rts

.CD01:
    ldx.b 0x02
    jmp (.CD06,X)

.CD06: d16[.CD0C, .CD20, .CD49]

.CD0C:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x04
    jsl 0x848F07
    rep #0x20
    stz.b 0x1C
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
.CD20:
    jsl 0x8281E8
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .CD48

    lda.b #0x04
    sta.b 0x02
    lda.b #0x05
    jsl 0x848F07
    lda.b #0x10
    jsl 0x84A333
    lda.b #0x1A
    jsl 0x80888B
.CD48:
    rts

.CD49:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .CD5B

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    lda.b #0x3C
    sta.b 0x34
.CD5B:
    rts

.CD5C:
    lda.b 0x02
    bne .CD68

    inc.b 0x02
    lda.b #0x00
    jsl 0x848F07
.CD68:
    jsl 0x84AC92
    dec.b 0x34
    bne .CDAF

    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    jsr .CEF6
    bcs .CDAF

    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .CD8B

    eor.w #0xFFFF
    inc
.CD8B:
    cmp.w #0x0080
    bcs .CDAD

    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcc .CD9D

    cmp.w #0x0080
    bcs .CDAD

.CD9D:
    sep #0x20
    jsl get_rng
    and.b #0x1F
    cmp.b #0x16
    bcs .CDAF

    lda.b #0x08
    sta.b 0x01
.CDAD:
    sep #0x30
.CDAF:
    jsl 0x848EEA
    rts

.CDB4:
    ldx.b 0x02
    jmp (.CDB9,X)

.CDB9: d16[.CDC5, .CDD4, .CE16, .CE47, .CE99, .CEB4]

.CDC5:
    lda.b #0x02
    sta.b 0x02
    jsl 0x84AC92
    lda.b #0x01
    jsl 0x848F07
    rts

.CDD4:
    jsl 0x848EEA
    lda.b 0x0F
    bne .CE15

    lda.b #0x04
    sta.b 0x02
    stz.b 0x36
    rep #0x10
    jsl 0x828358
    bne .CE11

    inc.w 0x0000,X
    lda.b #0x07
    sta.w 0x000A,X
    stz.w 0x000B,X
    jsr .CF35
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x000B
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    tdc
    sta.w 0x000C,X
    sep #0x30
    inc.b 0x39
    rts

.CE11:
    sep #0x30
    inc.b 0x36
.CE15:
    rts

.CE16:
    jsl 0x848EEA
    lda.b 0x36
    beq .CE32

    bmi .CE33

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x39
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x3C
    sta.b 0x34
.CE32:
    rts

.CE33:
    lda.b #0x0B
    jsl 0x848F07
    lda.b #0x06
    sta.b 0x02
    stz.b 0x39
    lda.b #0x01
    lda.b 0x38
    jsr .CF71
    rts

.CE47:
    jsl 0x848EEA
    lda.b 0x0F
    bne .CE95

    lda.b #0x08
    sta.b 0x02
    stz.b 0x36
    rep #0x10
    jsl 0x828358
    bne .CE88

    inc.w 0x0000,X
    lda.b #0x07
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
    stz.w 0x0026,X
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x000B
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    tdc
    sta.w 0x000C,X
    sep #0x30
    inc.b 0x39
    stz.b 0x38
    rts

.CE88:
    sep #0x30
    inc.b 0x36
    lda.b 0x38
    beq .CE95

    jsl 0x849F79
    rts

.CE95:
    jsr .CF71
    rts

.CE99:
    jsl 0x848EEA
    lda.b 0x36
    beq .CEB3

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x39
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x3C
    sta.b 0x34
.CEB3:
    rts

.CEB4:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .CEC2

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
.CEC2:
    rts

.CEC3:
    lda.b 0x02
    bne .CECD

    lda.b #0x78
    sta.b 0x34
    inc.b 0x02
.CECD:
    rep #0x20
    lda.w #0xFFE1
    sta.w 0x0000
    sta.w 0x0002
    lda.w #0x003F
    sta.w 0x0004
    sta.w 0x0006
    lda.w #0x0003
    sta.w 0x0008
    sep #0x20
    jsl 0x84A4C6
    dec.b 0x34
    bne .CEF5

    jsl 0x828398
.CEF5:
    rts

;-----

.CEF6:
    lda.b #0x0C
    sta.b 0x2A
    ldx.b #0x16
    lda.b 0x11
    and.b #0x40
    bne .CF04

    ldx.b #0xEA
.CF04:
    stx.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcs .CF34

    ldx.b #0x26
    lda.b 0x11
    and.b #0x40
    bne .CF18

    ldx.b #0xDA
.CF18:
    stx.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcs .CF34

    ldx.b #0x36
    lda.b 0x11
    and.b #0x40
    bne .CF2C

    ldx.b #0xCA
.CF2C:
    stx.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
.CF34:
    rts

;-----

.CF35:
    lda.b 0x11
    and.b #0x40
    rep #0x20
    beq .CF4A

    lda.b 0x05
    sec
    sbc.w 0x1E4D
    cmp.w #0x0080
    sep #0x20
    bra .CF55

.CF4A:
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    cmp.w #0x0080
    sep #0x20
.CF55:
    lda.b 0x0B
    bne .CF65

    jsl get_rng
    lsr
    bcc .CF6B

    lsr
    lsr
    lsr
    bcc .CF6B

.CF65:
    lda.b #0x02
    sta.w 0x0026,X
    rts

.CF6B:
    lda.b #0xFF
    sta.w 0x0026,X
    rts

;-----

.CF71:
    lda.b 0x0F
    dec
    dec
    asl
    tax
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w 0xC712,X
    bcc .CF86

    eor.w #0xFFFF
    inc
.CF86:
    clc
    adc.b 0x05
    sta.w 0x0BAD
    lda.w 0xC71A,X
    clc
    adc.b 0x08
    sta.w 0x0BB0
    sep #0x20
    rts

;-----

.CF98:
    lda.b 0x27
    and.b #0x7F
    cmp.b #0x20
    bcs .D01F

    inc.b 0x35
    lda.b 0x27
    and.b #0x7F
    sec
    sbc.b #0x10
    bcs .CFAD

    lda.b #0x00
.CFAD:
    asl
    clc
    adc.b #0x0C
    cmp.b 0x35
    bcs .D01F

    jsl 0x8282D3
    bne .D01B

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
    stz.w 0x0001
    stz.w 0x0003
    jsl get_rng
    and.b #0x0F
    sta.w 0x0000
    jsl get_rng
    sta.w 0x0002
    sta.w 0x0004
    cmp.b #0x00
    rep #0x20
    bpl .CFF5

    lda.w #0xFFF0
    trb.w 0x0002
    lda.b 0x05
    sec
    sbc.w 0x0002
    bra .CFFE

.CFF5:
    lda.w 0x0002
    and.w #0x000F
    clc
    adc.b 0x05
.CFFE:
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w 0x0000
    sec
    sbc.w #0x0006
    sta.w 0x0008,X
    tdc
    sta.w 0x001A,X
    lda.w 0x0004
    and.w #0x0080
    sta.w 0x000C,X
.D01B:
    sep #0x30
    stz.b 0x35
.D01F:
    rts
