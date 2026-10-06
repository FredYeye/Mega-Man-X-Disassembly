anglerge:
    ldx.b 0x01
    jmp (.AE16,X)

.AE16: d16[.AE1C, .AF91, .B342]

.AE1C:
    ldx.b 0x02
    jmp (.AE21,X)

.AE21: d16[.AE29, .AEC4, .AF54, .AF3C]

.AE29:
    phb
    rep #0x31
    lda.w #0xCBAD
    sta.b 0x20
    ldx.w #0xCB77
    ldy.w #0x0AA1
    lda.w #0x000D
    mvn 0x00,0x86
    lda.w #0x012C
    sta.b 0x3B
    sep #0x30
    plb
    jsr _82B7DB
    jsr .B67D
    jsr .B706
    jsr .B731
    lda.b #0x01
    sta.b 0x0E
    stz.b 0x11
    lda.b #0x04
    sta.b 0x26
    lda.b #0x40
    sta.b 0x27
    sta.b 0x29
    lda.b #0x07
    sta.b 0x28
    stz.b 0x2C
    stz.b 0x3A
    stz.b 0x2A
    stz.b 0x19
    lda.b #0xFF
    sta.b 0x18
    lda.b 0x0B
    bmi .AE7A

    lda.b #0x02
    sta.b 0x01
    rtl

.AE7A:
    lda.b #0x02
    sta.b 0x02
    sta.w 0x0BA1
    rep #0x31
    ldx.b 0x1A
    lda.w 0x0008,X
    adc.w #0x0050
    sta.w 0x0008,X
    ldx.b 0x1C
    lda.w 0x0008,X
    clc
    adc.w #0x0050
    sta.w 0x0008,X
    ldx.b 0x0F
    lda.w 0x0008,X
    clc
    adc.w #0x0050
    sta.w 0x0008,X
    lda.b 0x0B
    and.w #0x007F
    asl
    tax
    lda.w 0x00CBEF,X
    sta.w 0x1F28
    lda.w 0x00CBF5,X
    sta.w 0x1F2A
    lda.w #0x0050
    sta.b 0x34
    jsr .B40D
    sep #0x30
    rtl

.AEC4:
    rep #0x20
    jsr .B40D
    lda.b 0x05
    clc
    adc.w #0xFEE0
    cmp.w 0x1E4D
    bcc .AEDE

    ldx.b #0x00
    stx.w 0x0BA1
    ldx.b #0x06
    stx.b 0x02
    rtl

.AEDE:
    lda.b 0x05
    clc
    adc.w #0xFF00
    cmp.w 0x1E4D
    bcs .AF3B

    lda.w 0x1E5E
    sta.l 0x7FD61A
    lda.w 0x1E60
    sta.l 0x7FD61C
    lda.w 0x1E68
    sta.l 0x7FD61E
    lda.w 0x1E6E
    sta.l 0x7FD620
    lda.b 0x05
    clc
    adc.w #0xFF60
    sta.w 0x1E5E
    lda.b 0x05
    clc
    adc.w #0xFF70
    sta.w 0x1E60
    lda.b 0x08
    clc
    adc.w #0xFF30
    sta.w 0x1E68
    lda.b 0x08
    clc
    adc.w #0xFF80
    sta.w 0x1E6E
    sep #0x20
    lda.b #0x04
    sta.b 0x02
    lda.b #0x3C
    jsl 0x84A333
    lda.b #0x30
    jsl _80888B
.AF3B:
    rtl

.AF3C:
    rep #0x21
    lda.b 0x05
    adc.w #0xFEE0
    cmp.w 0x1E4D
    sep #0x20
    bcs .AF53

    lda.b #0x02
    sta.b 0x02
    lda.b #0x02
    sta.w 0x0BA1
.AF53:
    rtl

.AF54:
    jsr .B759
    jsr _82B82F
    rep #0x20
    lda.b 0x33
    sec
    sbc.w #0x0108
    sta.b 0x33
    sep #0x20
    lda.b 0x35
    sbc.b #0x00
    sta.b 0x35
    bpl .AF8B

    rep #0x10
    ldx.b 0x1A
    lda.b 0x08
    clc
    adc.b #0x08
    sta.w 0x0008,X
    ldx.b 0x1C
    stz.w 0x002B,X
    sep #0x10
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    stz.w 0x0BA1
    rtl

.AF8B:
    rep #0x20
    jsr .B40D
    rtl

.AF91:
    dec.b 0x3B
    bpl .AF97

    stz.b 0x3B
.AF97:
    ldx.b 0x02
    jsr (.AFD4,X)
    lda.b 0x2A
    beq .AFA5

    stz.b 0x2A
    jsr _82B7C1
.AFA5:
    jsl 0x849B43
    beq .AFC4

    bmi .AFBC

    inc.b 0x2A
    lda.b #0x0A
    sta.b 0x3D
    lda.b #0x05
    sta.b 0x28
    jsr _82B7A2
    bra .AFC4

.AFBC:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x03
    stz.b 0x27
.AFC4:
    lda.b 0x3D
    beq .AFD0

    dec.b 0x3D
    bne .AFD0

    lda.b #0x01
    sta.b 0x28
.AFD0:
    jml 0x849B03

.AFD4: d16[.AFFB, .B13B, .B07B, .B07B, .AFDE]

.AFDE:
    ldx.b 0x03
    jmp (.AFE3,X)

.AFE3: d16[.AFE7, .AFF2]

.AFE7:
    lda.b #0x02
    sta.b 0x03
    lda.b #0xFF
    sta.b 0x16
    jmp .B6A5

.AFF2:
    dec.b 0x16
    bne .AFFA

    stz.b 0x02
    stz.b 0x03
.AFFA:
    rts

.AFFB:
    ldx.b 0x03
    bne .B006

    inc.b 0x03
    lda.b #0x14
    sta.b 0x16
    rts

.B006:
    jsl 0x82806E
    bcc .B00D

    rts

.B00D:
    dec.b 0x16
    bne .B070

    rep #0x21
    lda.b 0x0B
    and.w #0x0003
    asl
    asl
    tax
    lda.b 0x05
    adc.w #0xFFC0
    cmp.w 0x0BAD
    bcc .B027

    inx
    inx
.B027:
    jsl 0x849086
    and.w #0x0003
    beq .B031

    inx
.B031:
    sep #0x20
    lda.w 0x00CBB9,X
    sta.b 0x02
    stz.b 0x03
    cmp.b 0x18
    bne .B049

    inc.b 0x19
    lda.b 0x19
    cmp.b #0x02
    bcc .B04B

    jsr .B071
.B049:
    stz.b 0x19
.B04B:
    lda.b 0x02
    cmp.b #0x02
    bne .B064

    lda.b 0x29
    beq .B061

    bit.w 0x1F2C
    bvs .B061

    lda.b #0x40
    tsb.w 0x1F2C
    bra .B064

.B061:
    jsr .B071
.B064:
    lda.b 0x3A
    beq .B06C

    lda.b #0x06
    sta.b 0x02
.B06C:
    lda.b 0x02
    sta.b 0x18
.B070:
    rts

.B071:
    txa
    eor.b #0x01
    tax
    lda.w 0x00CBB9,X
    sta.b 0x02
    rts

.B07B:
    ldx.b 0x03
    bne .B0B5

    inc.b 0x03
    inc.b 0x2C
    lda.b #0x78
    sta.b 0x16
    sta.b 0x1F
    stz.b 0x36
    stz.b 0x37
    lda.b 0x02
    cmp.b #0x06
    bne .B0B4

    stz.w 0x0000
    lda.b 0x3A
    bne .B09F

    lda.b #0x03
    sta.w 0x0000
.B09F:
    stz.b 0x3A
    jsl 0x849086
    and.w 0x0000
    sta.b 0x1F
    bne .B0B4

    lda.b 0x3B
    bne .B0B2

    beq .B0B4

.B0B2:
    inc.b 0x1F
.B0B4:
    rts

.B0B5:
    stz.b 0x2C
    jsr .B630
    lda.w 0x0B9C
    and.b #0x1F
    bne .B0CF

    lda.b #0x31
    ldx.b 0x02
    cpx.b #0x06
    bne .B0CB

    lda.b #0x32
.B0CB:
    jsl _80888B
.B0CF:
    dec.b 0x16
    bne .B0E3

.B0D3:
    rep #0x10
    ldx.b 0x36
    beq .B0DC

    inc.w 0x000B,X
.B0DC:
    sep #0x10
    stz.b 0x02
    stz.b 0x03
.B0E2:
    rts

.B0E3:
    jsr .B5E1
    beq .B0E2

    bmi .B0D3

    rep #0x10
    lda.b 0x02
    cmp.b #0x06
    beq .B101

    ldy.w #0x0200
    lda.w 0x0BD3
    bit.b #0x04
    beq .B117

    ldy.w #0x01C0
    bra .B117

.B101:
    ldx.w #0x0000
    lda.w 0x0BD3
    bit.b #0x04
    beq .B10E

    ldx.w #0x0004
.B10E:
    lda.b 0x1F
    beq .B114

    inx
    inx
.B114:
    ldy.w 0x00CBB1,X
.B117:
    sty.b 0x1A
    sep #0x10
    rep #0x21
    lda.w 0x0BAC
    adc.b 0x1A
    sta.w 0x0BAC
    sep #0x20
    stz.w 0x0000
    lda.b 0x1B
    bpl .B131

    dec.w 0x0000
.B131:
    lda.w 0x0BAE
    adc.w 0x0000
    sta.w 0x0BAE
    rts

.B13B:
    lda.b 0x29
    bne .B146

    stz.b 0x02
    stz.b 0x03
    jmp .B3E3

.B146:
    ldx.b 0x03
    jsr (.B1A6,X)
    phb
    rep #0x30
    lda.b 0x17
    bne .B178

    ldx.w #0xCB85
    ldy.w #0x0B22
    lda.w #0x0013
    mvn 0x00,0x86
    ldx.w #0xD000
    ldy.w #0xD1FE
    lda.w #0x00E0
    mvn 0x7F,0x7F
    ldx.w #0xD0FF
    ldy.w #0xD2FD
    lda.w #0x00E0
    mvn 0x7F,0x7F
    bra .B19C

.B178:
    ldx.w #0xCB99
    ldy.w #0x0B22
    lda.w #0x0013
    mvn 0x00,0x86
    ldx.w #0xD000
    ldy.w #0xD3FC
    lda.w #0x00E0
    mvn 0x7F,0x7F
    ldx.w #0xD0FF
    ldy.w #0xD4FB
    lda.w #0x00E0
    mvn 0x7F,0x7F
.B19C:
    sep #0x30
    lda.b 0x17
    eor.b #0x01
    sta.b 0x17
    plb
    rts

.B1A6: d16[.B1B4, .B1F5, .B224, .B254, .B28C, .B307, .B31A]

.B1B4:
    lda.b #0x02
    sta.b 0x03
    inc.w 0x0AA1
    inc.w 0x0AA8
    stz.b 0x17
    stz.b 0x3A
    rep #0x20
    lda.w #0xFF80
    sta.b 0x1A
    sta.b 0x1C
    lda.w #0x0002
    sta.b 0x12
    lda.b 0x08
    sec
    sbc.w #0x0020
    sec
    sbc.w 0x1E50
    clc
    adc.b 0x12
    sta.b 0x0F
    lda.w 0x0BCF
    and.w #0x007F
    beq .B1ED

    lda.w #0x231D
    sta.w 0x0300
.B1ED:
    sep #0x20
    inc.w 0x00A1
    jmp .B419

.B1F5:
    lda.b #0x88
    sta.w 0x2123
    sta.w 0x00C6
    lda.b #0x08
    sta.w 0x2124
    sta.w 0x00C7
    stz.w 0x2125
    stz.w 0x00C8
    stz.w 0x212A
    stz.w 0x212B
    lda.b #0x07
    sta.w 0x212E
    sta.w 0x00CE
    stz.w 0x212F
    stz.w 0x00CF
    lda.b #0x04
    sta.b 0x03
    rts

.B224:
    rep #0x21
    lda.b 0x12
    adc.w #0x0006
    sta.b 0x12
    cmp.w #0x00C0
    bcc .B239

    sep #0x20
    lda.b #0x06
    sta.b 0x03
    rts

.B239:
    lda.b 0x08
    sec
    sbc.w #0x0020
    sec
    sbc.w 0x1E50
    clc
    adc.b 0x12
    sta.b 0x0F
    sep #0x20
    jsr .B51C
    beq .B251

    inc.b 0x3A
.B251:
    jmp .B419

.B254:
    rep #0x21
    lda.b 0x1A
    adc.w #0xFFFC
    sta.b 0x1A
    lda.b 0x1C
    clc
    adc.w #0x0004
    sta.b 0x1C
    cmp.w #0xFFC0
    bmi .B280

    lda.w #0xFF40
    sta.b 0x1A
    lda.w #0xFFC0
    sta.b 0x1C
    ldx.b #0x08
    stx.b 0x03
    ldx.b #0x00
    stx.b 0x1E
    ldx.b #0x01
    stx.b 0x1F
.B280:
    sep #0x20
    jsr .B51C
    beq .B289

    inc.b 0x3A
.B289:
    jmp .B419

.B28C:
    lda.b 0x3A
    bne .B29F

    dec.b 0x1F
    bne .B2B0

    ldx.b 0x1E
    inc.b 0x1E
    inc.b 0x1E
    lda.w 0x00CBC5,X
    bpl .B2A9

.B29F:
    lda.b #0x0A
    sta.b 0x03
    lda.b #0x10
    sta.b 0x16
    bra .B2C8

.B2A9:
    sta.b 0x16
    lda.w 0x00CBC6,X
    sta.b 0x1F
.B2B0:
    rep #0x20
    ldx.b 0x16
    bne .B2C0

    jsr .B2D4
    bmi .B2C8

    jsr .B2EF
    bra .B2C8

.B2C0:
    jsr .B2EF
    bpl .B2C8

    jsr .B2D4
.B2C8:
    sep #0x20
    jsr .B51C
    beq .B2D1

    inc.b 0x3A
.B2D1:
    jmp .B419

.B2D4:
    lda.w #0xFFFC
    ldx.b 0x16
    beq .B2DE

    lda.w #0x0004
.B2DE:
    sta.w 0x0000
    lda.b 0x1A
    clc
    adc.w 0x0000
    cmp.w #0xFE70
    bmi .B2EE

    sta.b 0x1A
.B2EE:
    rts

.B2EF:
    lda.w #0xFFFD
    ldx.b 0x16
    beq .B2F9

    lda.w #0x0003
.B2F9:
    sta.w 0x0000
    lda.b 0x1C
    clc
    adc.w 0x0000
    bpl .B306

    sta.b 0x1C
.B306:
    rts

.B307:
    dec.b 0x16
    bne .B310

    lda.b #0x0C
    sta.b 0x03
    rts

.B310:
    jsr .B51C
    beq .B317

    inc.b 0x3A
.B317:
    jmp .B419

.B31A:
    rep #0x21
    lda.b 0x1A
    adc.w #0x0004
    sta.b 0x1A
    lda.b 0x1C
    clc
    adc.w #0xFFFC
    sta.b 0x1C
    cmp.b 0x1A
    sep #0x20
    bpl .B338

    stz.b 0x02
    stz.b 0x03
    jmp .B3E3

.B338:
    jsr .B51C
    beq .B33F

    inc.b 0x3A
.B33F:
    jmp .B419

.B342:
    ldx.b 0x03
    bne .B35C

    inc.b 0x03
    lda.b #0x78
    sta.b 0x16
    lda.b #0x21
    jsl _80888B
    lda.b 0x02
    cmp.b #0x02
    bne .B35B

    jsr .B3E3
.B35B:
    rtl

.B35C:
    dec.b 0x16
    bne .B39A

    rep #0x21
    lda.b 0x05
    sta.w 0x002C
    lda.b 0x08
    adc.w #0xFFE0
    sta.w 0x002E
    lda.l 0x7FD61A
    sta.w 0x1E5E
    lda.l 0x7FD61C
    sta.w 0x1E60
    lda.l 0x7FD61E
    sta.w 0x1E68
    lda.l 0x7FD620
    sta.w 0x1E6E
    sep #0x20
    lda.b #0x00
    jsl 0x848011
    jsr _82B800
    jml 0x828398

.B39A:
    rep #0x21
    lda.w 0x1F25
    and.w #0x00FF
    cmp.w #0x0020
    bcs .B3C5

    lda.b 0x05
    sta.w 0x002C
    lda.b 0x08
    adc.w #0xFFE0
    sta.w 0x002E
    ldx.b #0x00
    lda.w 0x0B9C
    bit.w #0x0002
    beq .B3C0

    ldx.b #0x05
.B3C0:
    txa
    jsl 0x848011
.B3C5:
    stz.w 0x0000
    lda.w #0xFFE0
    sta.w 0x0002
    lda.w #0x003F
    sta.w 0x0004
    sta.w 0x0006
    sep #0x20
    lda.b #0x07
    sta.w 0x0008
    jsl 0x84A4C6
    rtl

.B3E3:
    stz.w 0x0AA1
    stz.w 0x0AA8
    stz.w 0x2123
    stz.w 0x00C6
    stz.w 0x2124
    stz.w 0x00C7
    lda.b #0x40
    trb.w 0x1F2C
    lda.w 0x0BCF
    and.b #0x7F
    beq .B40C

    stz.w 0x0300
    lda.b #0x28
    sta.w 0x0301
    inc.w 0x00A1
.B40C:
    rts

;-----

.B40D:
    lda.w 0x1E50
    sec
    sbc.b 0x34
    sta.w 0x00C4
    rts

.B417:
    plp
    rts

;-----

.B419:
    php
    rep #0x30
    ldx.w #0x0000
    ldy.w #0x0006
    lda.b 0x1A
    cmp.w #0xFF00
    bcc .B42F

    ldx.w #0x0003
    ldy.w #0x000A
.B42F:
    stx.w 0x0000
    sty.w 0x0002
    stz.b 0x33
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    clc
    adc.w 0x0000
    sta.b 0x34
    lda.b 0x08
    sec
    sbc.w #0x0020
    sec
    sbc.w 0x1E50
    clc
    adc.w 0x0002
    sta.b 0x36
    bmi .B417

    cmp.w #0x00E8
    bpl .B417

    ldx.w #0x0000
.B45D:
    lda.w #0xFFFF
    sta.l 0x7FD000,X
    lda.w #0x0000
    sta.l 0x7FD0FF,X
    inx
    inx
    cpx.b 0x36
    bcc .B45D

    lda.w #0xFFFF
    sta.l 0x7FD000,X
    lda.w #0x0000
    sta.l 0x7FD0FF,X
    ldx.b 0x36
.B481:
    lda.b 0x33
    clc
    adc.b 0x1A
    sta.b 0x33
    sep #0x20
    lda.b 0x35
    adc.b #0xFF
    sta.b 0x35
    rep #0x20
    lda.b 0x34
    bpl .B49B

    lda.w #0x0000
    bra .B4A3

.B49B:
    cmp.w #0x0100
    bcc .B4A3

    lda.w #0x00FF
.B4A3:
    sta.l 0x7FD000,X
    inx
    cpx.w #0x00E8
    bcs .B4BF

    cpx.b 0x0F
    bcc .B481

    lda.w #0xFFFF
.B4B4:
    sta.l 0x7FD000,X
    inx
    inx
    cpx.w #0x00E8
    bcc .B4B4

.B4BF:
    lda.w #0xFFFF
    sta.l 0x7FD0E8
    stz.b 0x33
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    clc
    adc.w 0x0000
    sta.b 0x34
    ldx.b 0x36
.B4D6:
    lda.b 0x33
    adc.b 0x1C
    sta.b 0x33
    sep #0x20
    lda.b 0x35
    adc.b #0xFF
    sta.b 0x35
    rep #0x20
    lda.b 0x34
    bpl .B4F6

    lda.w #0xFFFF
    sta.l 0x7FD000,X
    lda.w #0x0000
    bra .B4FE

.B4F6:
    cmp.w #0x0100
    bcc .B4FE

    lda.w #0x00FF
.B4FE:
    sta.l 0x7FD0FF,X
    inx
    cpx.w #0x00E8
    bcs .B51A

    cpx.b 0x0F
    bcc .B4D6

    lda.w #0x0000
.B50F:
    sta.l 0x7FD0FF,X
    inx
    inx
    cpx.w #0x00E8
    bcc .B50F

.B51A:
    plp
    rts

;-----

.B51C:
    lda.w 0x0C32
    bne .B588

    rep #0x20
    jsr .B58B
    jsr .B5B6
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0xFFE0
    sta.w 0x0002
    lda.w 0x0BAD
    clc
    adc.w #0x0008
    sta.w 0x0004
    lda.w 0x0BB0
    clc
    adc.w #0x0010
    sta.w 0x0006
    sep #0x20
    jsl 0x84A097
    cmp.b 0x38
    beq .B557

    bcs .B588

.B557:
    rep #0x21
    lda.w 0x0BAD
    adc.w #0xFFF8
    sta.w 0x0004
    lda.w 0x0BB0
    clc
    adc.w #0xFFF0
    sta.w 0x0006
    sep #0x20
    jsl 0x84A097
    cmp.b 0x39
    bcc .B588

    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.w 0x1E50
    cmp.b 0x0F
    sep #0x20
    bcs .B588

    lda.b #0x01
    rts

.B588:
    lda.b #0x00
    rts

;-----

.B58B:
    ldy.b #0x0F
    lda.b 0x1A
    cmp.w #0xFFE0
    bpl .B595

    iny
.B595:
    cmp.w #0xFFA0
    bpl .B59B

    iny
.B59B:
    cmp.w #0xFF60
    bpl .B5A1

    iny
.B5A1:
    cmp.w #0xFF20
    bpl .B5A7

    iny
.B5A7:
    cmp.w #0xFEA0
    bpl .B5AD

    iny
.B5AD:
    cmp.w #0xFE71
    bpl .B5B3

    iny
.B5B3:
    sty.b 0x38
    rts

;-----

.B5B6:
    ldy.b #0x17
    lda.b 0x1C
    cmp.w #0xFE71
    bmi .B5C0

    dey
.B5C0:
    cmp.w #0xFEA0
    bmi .B5C6

    dey
.B5C6:
    cmp.w #0xFF20
    bmi .B5CC

    dey
.B5CC:
    cmp.w #0xFF60
    bmi .B5D2

    dey
.B5D2:
    cmp.w #0xFFA0
    bmi .B5D8

    dey
.B5D8:
    cmp.w #0xFFE0
    bmi .B5DE

    dey
.B5DE:
    sty.b 0x39
    rts

;-----

.B5E1:
    rep #0x21
    ldx.w 0x0C32
    bne .B626

    ldx.w 0x1F0C
    bne .B626

    lda.b 0x05
    adc.w #0xFF60
    cmp.w 0x0BAD
    bcs .B62B

    lda.b 0x05
    clc
    adc.w #0x0010
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0009
    sta.w 0x0002
    lda.w 0x0BAD
    sta.w 0x0004
    lda.w 0x0BB0
    sta.w 0x0006
    sep #0x20
    jsl 0x84A097
    cmp.b #0x1C
    bcs .B626

    cmp.b #0x15
    bcc .B626

    lda.b #0x01
    rts

.B626:
    sep #0x20
    lda.b #0x00
    rts

.B62B:
    sep #0x20
    lda.b #0xFF
    rts

;-----

.B630:
    lda.w 0x0B9C
    and.b #0x03
    bne .B67C

    jsl 0x8282D3
    bne .B67A

    inc.w 0x0000,X
    lda.b #0x1B
    sta.w 0x000A,X
    ldy.w #0xFFFF
    lda.b 0x02
    cmp.b #0x06
    beq .B655

    jsl 0x849086
    and.b #0x1C
    tay
.B655:
    tya
    sta.w 0x000B,X
    rep #0x21
    jsl 0x849086
    and.w #0x000F
    adc.b 0x08
    sta.w 0x0008,X
    jsl 0x849086
    and.w #0x0007
    clc
    adc.w #0xFFF4
    clc
    adc.b 0x05
    sta.w 0x0005,X
    sep #0x20
.B67A:
    sep #0x10
.B67C:
    rts

;-----

.B67D:
    jsl 0x8282D3
    inc.w 0x0000,X
    lda.b #0x1C
    sta.w 0x000A,X
    stx.b 0x1A
    rep #0x21
    tdc
    sta.w 0x000C,X
    lda.b 0x05
    adc.w #0x0032
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0008
    sta.w 0x0008,X
    sep #0x30
    rts

;-----

.B6A5:
    jsl 0x849086
    and.b #0x07
    tay
    lda 0x00CBD0,Y
    sta.w 0x0000
    lda.b #0x03
    sta.w 0x0001
.B6B7:
    jsl 0x828358
    bne .B703

    rep #0x20
    tdc
    sta.w 0x000C,X
    sep #0x20
    inc.w 0x0000,X
    lda.b #0x0F
    sta.w 0x000A,X
    lda.w 0x0000
    sta.w 0x0002,X
    lda.w 0x0001
    sta.w 0x000B,X
    rep #0x20
    and.w #0x00FF
    asl
    tay
    lda 0x00CBD8,Y
    and.w #0x00FF
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda 0x00CBD9,Y
    and.w #0x00FF
    clc
    adc.b 0x08
    sec
    sbc.w #0x0020
    sta.w 0x0008,X
    sep #0x20
    dec.w 0x0001
    bpl .B6B7

.B703:
    sep #0x10
    rts

;-----

.B706:
    jsl 0x8282B9
    inc.w 0x0000,X
    lda.b #0x0A
    sta.w 0x000A,X
    sta.w 0x002B,X
    stx.b 0x1C
    rep #0x21
    tdc
    sta.w 0x000C,X
    lda.b 0x05
    adc.w #0x000E
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0xFFEF
    sta.w 0x0008,X
    sep #0x30
    rts

;-----

.B731:
    jsl 0x8282D3
    inc.w 0x0000,X
    lda.b #0x1E
    sta.w 0x000A,X
    stx.b 0x0F
    rep #0x21
    tdc
    sta.w 0x000C,X
    lda.b 0x05
    adc.w #0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0004
    sta.w 0x0008,X
    sep #0x30
    rts

;-----

.B759:
    rep #0x30
    ldx.b 0x1A
    lda.w 0x0007,X
    sec
    sbc.w #0x0108
    sta.w 0x0007,X
    sep #0x30
    lda.w 0x0009,X
    sbc.b #0x00
    sta.w 0x0009,X
    rep #0x30
    ldx.b 0x1C
    lda.w 0x0007,X
    sec
    sbc.w #0x0108
    sta.w 0x0007,X
    sep #0x30
    lda.w 0x0009,X
    sbc.b #0x00
    sta.w 0x0009,X
    rep #0x30
    ldx.b 0x0F
    lda.w 0x0007,X
    sec
    sbc.w #0x0108
    sta.w 0x0007,X
    sep #0x30
    lda.w 0x0009,X
    sbc.b #0x00
    sta.w 0x0009,X
    rts
