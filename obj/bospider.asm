bospider:
    ldx.b 0x01
    jmp (.DB7B,X)

.DB7B: d16[.DB83, .DBE8, .DC63, .DF7F]

.DB83:
    lda.b 0x02
    bne .DBA6

    jsl 0x84AACA
    beq .DB91

    jml 0x828398

.DB91:
    jsl 0x849FE6
    inc.b 0x02
    lda.b #0x3C
    sta.b 0x35
    lda.w 0x1F26
    beq .DBA6

    lda.b #0x23
    jsl _80878B
.DBA6:
    dec.b 0x35
    beq .DBAB

    rtl

.DBAB:
    jsl 0x82827D
    stz.b 0x28
    lda.b 0x11
    and.b #0x0E
    sta.b 0x34
    lda.b #0x04
    sta.b 0x12
    lda.b #0x08
    sta.b 0x26
    rep #0x20
    lda.w #0xD655
    sta.b 0x20
    lda.w #0xFD80
    sta.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    stz.b 0x3D
    stz.b 0x3E
    stz.b 0x3F
    stz.b 0x1F
    stz.b 0x0D
    lda.b #0x04
    sta.b 0x2F
    lda.b #0x10
    sta.b 0x36
    rtl

.DBE8:
    ldx.b 0x02
    jsr (.DBEE,X)
    rtl

.DBEE: d16[.DBF4, .DC03, .DC41]

.DBF4:
    rep #0x20
    tdc
    sta.w 0x1F0E
    sep #0x20
    stz.b 0x27
    lda.b #0x02
    sta.b 0x02
    rts

.DC03:
    lda.w 0x0B9C
    lsr
    bcc .DC40

    lda.b 0x27
    and.b #0x7F
    cmp.b #0x20
    beq .DC1F

    inc
    ora.b #0x80
    sta.b 0x27
    lda.b #0x0C
    jsl _80888B.88B6
    jmp .DC40

.DC1F:
    lda.b #0x00
    jsl 0x848F07
    jsl 0x849FFE
    lda.b #0x04
    sta.b 0x02
    lda.b #0x10
    sta.b 0x35
    lda.w 0x1F26
    beq .DC40

    lda.b #0x24
    jsl _80878B
    jsl 0x8280B4
.DC40:
    rts

.DC41:
    lda.b 0x35
    bne .DC54

    lda.b #0x04
    sta.b 0x01
    lda.b #0x08
    sta.b 0x02
    lda.b #0x30
    sta.b 0x35
    jmp .DC62

.DC54:
    dec.b 0x35
    jsl 0x82825D
    jsl 0x848EEA
    jsl 0x8280B4
.DC62:
    rts

.DC63:
    ldx.b 0x02
    jsr (.DCD8,X)
    lda.b 0x27
    beq .DCD4

    lda.b 0x3F
    beq .DC73

    jmp .DC76

.DC73:
    jmp .DC78

.DC76:
    dec.b 0x3F
.DC78:
    jsl 0x849B43
    beq .DCCC

    lda.b 0x27
    and.b #0x7F
    bne .DCB7

    lda.w 0x0BCF
    and.b #0x7F
    beq .DCBB

    lda.b #0x13
    jsl _80888B
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x01
    sta.w 0x0BD8
    sta.w 0x1F0C
    lda.b #0x28
    sta.b 0x35
    lda.b #0x01
    sta.w 0x1F13
    sta.w 0x1F14
    sta.w 0x1F17
    jsl 0x849F85
    jmp .DCD4

.DCB7:
    lda.b #0x0E
    trb.b 0x11
.DCBB:
    lda.b #0x13
    jsl _80888B
    lda.b #0x18
    sta.b 0x3F
    lda.b #0x05
    sta.b 0x28
    jmp .DCD0

.DCCC:
    lda.b 0x34
    tsb.b 0x11
.DCD0:
    jsl 0x849B03
.DCD4:
    jml 0x8280B4

.DCD8: d16[.DCEA, .DD31, .DDB8, .DDFE, .DE1D, .DE8D, .DF32, .DDAA, .DF4F]

.DCEA:
    lda.b 0x27
    and.b #0x7F
    cmp.b #0x10
    bpl .DCFD

    cmp.b #0x08
    bpl .DD02

    lda.b #0x04
    sta.b 0x3E
    jmp .DD06

.DCFD:
    stz.b 0x3E
    jmp .DD06

.DD02:
    lda.b #0x02
    sta.b 0x3E
.DD06:
    jsl 0x849086
    and.b #0x03
    asl
    tax
    rep #0x20
    lda.w 0x00D65F,X
    sta.b 0x05
    ldx.b 0x3E
    lda.w 0x00D6A5,X
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
    lda.b #0x30
    sta.b 0x35
    lda.b #0x20
    sta.b 0x36
    lda.b #0x08
    sta.b 0x02
    stz.b 0x1F
    rts

.DD31:
    lda.b 0x3B
    bpl .DD38

    jmp .DDA1

.DD38:
    dec.b 0x3B
    lda.b 0x3A
    bpl .DD46

    lda.b #0x03
    sta.w 0x0000
    jmp .DD4B

.DD46:
    lda.b #0x01
    sta.w 0x0000
.DD4B:
    jsl 0x849086
    and.w 0x0000
    cmp.b #0x03
    bne .DD58

    lda.b #0x00
.DD58:
    sta.b 0x3A
    lda.b 0x3C
    bpl .DD65

    lda.b 0x3A
    sta.b 0x3C
    jmp .DD9B

.DD65:
    cmp.b #0x00
    bne .DD7F

    lda.b 0x3A
    beq .DD76

    lda.b #0x02
    sta.b 0x3A
    sta.b 0x3C
    jmp .DD9B

.DD76:
    lda.b #0x01
    sta.b 0x3A
    sta.b 0x3C
    jmp .DD9B

.DD7F:
    cmp.b #0x01
    bne .DD97

    lda.b 0x3A
    beq .DD8E

    stz.b 0x3A
    stz.b 0x3C
    jmp .DD9B

.DD8E:
    lda.b #0x02
    sta.b 0x3A
    sta.b 0x3C
    jmp .DD9B

.DD97:
    lda.b 0x3A
    sta.b 0x3C
.DD9B:
    jsr .E1B2
    jmp .DD31

.DDA1:
    lda.b #0x0E
    sta.b 0x02
    lda.b #0x3C
    sta.b 0x35
    rts

.DDAA:
    lda.b 0x35
    beq .DDB3

    dec.b 0x35
    jmp .DDB7

.DDB3:
    lda.b #0x04
    sta.b 0x02
.DDB7:
    rts

.DDB8:
    lda.b 0x2F
    bne .DDC6

    lda.b #0x43
    jsl _80888B.88B6
    lda.b #0x04
    sta.b 0x2F
.DDC6:
    dec.b 0x2F
    jsl 0x82825D
    jsl 0x848EEA
    rep #0x20
    lda.b 0x08
    cmp.w #0x01B0
    bmi .DDF5

    sep #0x20
    lda.b #0x10
    sta.b 0x02
    lda.b #0x09
    jsl 0x848F07
    lda.b #0x18
    sta.b 0x35
    rep #0x20
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
    jmp .DDFA

.DDF5:
    sep #0x20
    jsr .E0EF
.DDFA:
    jsr .E0B2
    rts

.DDFE:
    lda.b 0x2F
    bne .DE0C

    lda.b #0x43
    jsl _80888B.88B6
    lda.b #0x04
    sta.b 0x2F
.DE0C:
    dec.b 0x2F
    jsl 0x82823E
    jsl 0x848EEA
    jsr .E0EF
    jsr .E0B2
    rts

.DE1D:
    rep #0x20
    lda.b 0x08
    cmp.w #0x0100
    bpl .DE2D

    jsl 0x82825D
    jmp .DE86

.DE2D:
    sep #0x20
    lda.b 0x1F
    bne .DE63

    lda.b 0x1E
    bne .DE63

    lda.b 0x0D
    bne .DE61

    jsl 0x849086
    and.b #0x03
    bne .DE63

    lda.b #0x0A
    sta.b 0x02
    lda.b #0x0C
    sta.b 0x03
    lda.b #0x20
    sta.b 0x35
    lda.b #0x01
    sta.b 0x1E
    sta.b 0x0D
    rep #0x20
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
    jmp .DE8C

.DE61:
    stz.b 0x0D
.DE63:
    lda.b #0x01
    sta.b 0x1F
    dec.b 0x35
    lda.b 0x35
    bne .DE86

    lda.b #0x00
    jsl 0x848F07
    lda.b #0x02
    sta.b 0x02
    stz.b 0x1E
    lda.b #0x80
    sta.b 0x3A
    sta.b 0x3C
    lda.b #0x08
    sta.b 0x3B
    jmp .DE8C

.DE86:
    sep #0x20
    jsl 0x848EEA
.DE8C:
    rts

.DE8D:
    dec.b 0x35
    bne .DEA0

    stz.b 0x1E
    lda.b 0x03
    sta.b 0x02
    lda.b #0x00
    jsl 0x848F07
    jmp .DF2F

.DEA0:
    lda.b 0x35
    cmp.b #0x10
    beq .DEA9

    jmp .DF2F

.DEA9:
    rep #0x10
    ldy.w #0x0026
    sty.b 0x37
    sep #0x10
.DEB2:
    sep #0x10
    lda.b #0x2B
    sta.b 0x0A
    jsr .E17D
    lda.b #0x63
    sta.b 0x0A
    cpy.b #0x08
    bpl .DF2F

    rep #0x10
    jsl 0x828358
    bne .DF2F

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x11
    ora.b 0x34
    sta.w 0x0011,X
    lda.b 0x16
    sta.w 0x0016,X
    rep #0x20
    ldy.b 0x37
    lda 0x00D667,Y
    sta.w 0x000B,X
    dey
    dey
    lda 0x00D667,Y
    sta.w 0x0000
    dey
    dey
    lda 0x00D667,Y
    sta.w 0x0002
    dey
    dey
    lda 0x00D667,Y
    sta.w 0x001A,X
    dey
    dey
    lda 0x00D667,Y
    sta.w 0x001C,X
    dey
    dey
    sty.b 0x37
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w 0x0002
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
    sep #0x20
    cpy.w #0xFFFE
    bne .DEB2
.DF2F:
    sep #0x10
    rts

.DF32:
    rep #0x20
    lda.b 0x08
    cmp.w #0x00E0
    bpl .DF42

    ldx.b #0x00
    stx.b 0x02
    jmp .DF48

.DF42:
    sep #0x20
    jsl 0x82825D
.DF48:
    sep #0x20
    jsl 0x848EEA
    rts

.DF4F:
    lda.b 0x0F
    bpl .DF59

    lda.b #0x01
    jsl 0x848F07
.DF59:
    lda.b 0x35
    beq .DF6A

    dec.b 0x35
    lda.b 0x3F
    bne .DF7A

    lda.b #0x0A
    sta.b 0x28
    jmp .DF7A

.DF6A:
    lda.b #0x01
    sta.b 0x35
    lda.b #0x0C
    sta.b 0x02
    stz.b 0x28
    lda.b #0x00
    jsl 0x848F07
.DF7A:
    jsl 0x848EEA
    rts

.DF7F:
    ldx.b 0x02
    jmp (.DF84,X)

.DF84: d16[.DF90, .DFC4, .DFFC, .E038, .E07E, .E09A]

.DF90:
    lda.b 0x35
    beq .DF9E

    lda.b #0x01
    sta.w 0x1F13
    dec.b 0x35
    jmp .DFC0

.DF9E:
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F17
    lda.b #0x02
    sta.b 0x02
    ldy.b #0x02
    lda.b #0xF6
    jsl _808850.8868
    jsl 0x849FE6
    lda.b #0x30
    tsb.w 0x0BB9
    lda.b #0xFF
    sta.b 0x35
.DFC0:
    jml 0x8280B4

.DFC4:
    lda.w 0x0B9C
    and.b #0x1F
    bne .DFD1

    lda.b #0x20
    jsl 0x84A333
.DFD1:
    dec.b 0x35
    bne .DFD9

    lda.b #0x04
    sta.b 0x02
.DFD9:
    rep #0x20
    lda.w #0xFFC0
    sta.w 0x0000
    sta.w 0x0002
    lda.w #0x007F
    sta.w 0x0004
    sta.w 0x0006
    sep #0x20
    lda.b #0x03
    sta.w 0x0008
    jsl 0x8280B4
    jml 0x84A4C6

.DFFC:
    lda.b #0x06
    sta.b 0x02
    phb
    rep #0x30
    ldx.w #0xD6AB
    ldy.w #0x0AA1
    lda.w #0x0006
    mvn 0x00,0x86
    ldx.w #0xD6B2
    ldy.w #0x0B22
    lda.w #0x0009
    mvn 0x00,0x86
    jsr .E27C
    sep #0x30
    plb
    lda.b #0x3F
    sta.w 0x00CA
    stz.w 0x00CB
    lda.b #0x01
    sta.b 0x0C
    jsr .E212
    lda.b #0xC0
    sta.b 0x35
    jml 0x8280B4

.E038:
    lda.w 0x0B9C
    and.b #0x01
    bne .E047

    lda.b 0x0C
    cmp.b #0x1F
    beq .E047

    inc.b 0x0C
.E047:
    lda.b 0x35
    cmp.b #0xB0
    bne .E053

    lda.b #0x21
    jsl _80888B.88B6
.E053:
    dec.b 0x35
    lda.b 0x35
    bne .E06C

    lda.b #0x08
    sta.b 0x02
    lda.b #0x1F
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    stz.w 0x0AA1
    rtl

.E06C:
    cmp.b #0xB0
    bcc .E077

    jsr .E212
    jml 0x8280B4

.E077:
    jsr .E239
    jml 0x8280B4

.E07E:
    lda.w 0x0B9C
    and.b #0x01
    bne .E099

    dec.w 0x00CB
    dec.w 0x00CC
    dec.w 0x00CD
    bne .E099

    lda.b #0x01
    sta.w 0x1F23
    lda.b #0x0A
    sta.b 0x02
.E099:
    rtl

.E09A:
    stz.w 0x1F0C
    stz.w 0x0BD8
    jsl 0x849FFE
    lda.b #0x04
    sta.w 0x1F10
    lda.b #0x01
    sta.w 0x1F7B
    jml 0x828398

;-----

.E0B2:
    lda.b #0x2B
    sta.b 0x0A
    jsr .E17D
    lda.b #0x63
    sta.b 0x0A
    cpy.b #0x08
    bpl .E0EC

    rep #0x20
    lda.b 0x08
    cmp.w #0x017A
    bpl .E0EC

    lda.w 0x0BB0
    sec
    sbc.b 0x08
    bcs .E0D6

    eor.w #0xFFFF
    inc
.E0D6:
    cmp.w #0x0020
    bcs .E0EC

    sep #0x20
    jmp .E0E0

.E0E0:
    lda.b 0x02
    sta.b 0x03
    lda.b #0x0A
    sta.b 0x02
    lda.b #0x20
    sta.b 0x35
.E0EC:
    sep #0x20
    rts

;-----

.E0EF:
    rep #0x20
    lda.b 0x1A
    bmi .E100

    beq .E109

    sep #0x20
    lda.b #0xF8
    sta.b 0x29
    jmp .E10D

.E100:
    sep #0x20
    lda.b #0x08
    sta.b 0x29
    jmp .E10D

.E109:
    sep #0x20
    stz.b 0x29
.E10D:
    lda.b #0xF0
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x15
    beq .E176

    cmp.b 0x3D
    beq .E176

    cmp.b #0x14
    beq .E128

    cmp.b #0x16
    beq .E140

    jmp .E176

.E128:
    sta.b 0x3D
    lda.b 0x02
    cmp.b #0x04
    bne .E15E

    lda.b #0x06
    sta.b 0x02
    rep #0x20
    ldx.b 0x3E
    lda.w 0x00D6A5,X
    sta.b 0x1A
    jmp .E17A

.E140:
    sep #0x20
    sta.b 0x3D
    lda.b 0x02
    cmp.b #0x04
    bne .E15E

    lda.b #0x06
    sta.b 0x02
    rep #0x20
    ldx.b 0x3E
    lda.w 0x00D6A5,X
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    jmp .E17A

.E15E:
    sep #0x20
    lda.b #0x04
    sta.b 0x02
    rep #0x20
    stz.b 0x1A
    ldx.b 0x3E
    lda.w 0x00D6A5,X
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    jmp .E17A

.E176:
    sep #0x20
    sta.b 0x3D
.E17A:
    sep #0x20
    rts

;-----

.E17D:
    rep #0x30
    ldy.w #0x0000
    ldx.w #0x1428
.E185:
    lda.w 0x0000,X
    beq .E1A4

    sep #0x20
    lda.w 0x000A,X
    cmp.b 0x0A
    rep #0x20
    bne .E1A4

    txa
    sta 0x0000,Y
    tdc
    sta.w 0x002C
    cpx.w 0x002C
    beq .E1A4

    iny
    iny
.E1A4:
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1628
    bcc .E185

    sep #0x30
    rts

;-----

.E1B2:
    rep #0x10
    jsl 0x8282D3
    bne .E1FC

    inc.w 0x0000,X
    lda.b #0x3C
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x3A
    and.w #0x00FF
    asl
    tay
    lda 0x00D68F,Y
    sta.w 0x0005,X
    lda.b 0x3B
    and.w #0x00FF
    asl
    tay
    lda 0x00D695,Y
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
    sep #0x20
    lda.b 0x16
    sta.w 0x0016,X
    lda.b 0x11
    ora.b 0x34
    ora.b #0x0A
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b #0x06
    sta.w 0x0012,X
.E1FC:
    sep #0x10
    rts

    lda.w 0x0BCF
    and.b #0x7F
    beq .E211

    rep #0x10
    ldy.w #0x019C
    jsl _828000.8011
    sep #0x10
.E211:
    rts

;-----

.E212:
    phb
    rep #0x30
    ldx.w #0xD001
    ldy.w #0xD000
    lda.w #0x006F
    mvn 0x7F,0x7F
    ldx.w #0xD0DE
    ldy.w #0xD0DF
    lda.w #0x006E
    mvp 0x7F,0x7F
    sep #0x30
    plb
    lda.b 0x0C
    ora.b #0xE0
    sta.l 0x7FD070
    rts

;-----

.E239:
    phb
    rep #0x30
    ldx.w #0xD008
    ldy.w #0xD000
    lda.w #0x006C
    mvn 0x7F,0x7F
    ldx.w #0xD0D5
    ldy.w #0xD0DF
    lda.w #0x006C
    mvp 0x7F,0x7F
    sep #0x30
    plb
    lda.b 0x0C
    ora.b #0xE0
    sta.l 0x7FD06C
    sta.l 0x7FD06D
    sta.l 0x7FD06E
    sta.l 0x7FD06F
    sta.l 0x7FD070
    sta.l 0x7FD071
    sta.l 0x7FD072
    sta.l 0x7FD073
    rts

;-----

.E27C:
    ldx.w #0x00DE
    lda.w #0x0000
.E282:
    sta.l 0x7FD000,X
    dex
    dex
    bpl .E282

    rts
