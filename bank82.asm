org 0x8000*2
base 0x828000

;-----

_828000:
    php
    phd
    sep #0x20
    rep #0x10
    stx.w 0x0002
    stz.w 0x0003
    asl.w 0x0002
    bra .801D

.8011:
    php
    phd
    sep #0x20
    rep #0x10
    stz.w 0x0002
    stz.w 0x0003
.801D:
    pea 0x0000
    pld
    lda 0x868133,Y
    sta.b 0x10
    lda 0x868134,Y
    sta.b 0x11
    lda.b #0x85
    sta.b 0x16
    stz.b 0x01
.8031:
    sep #0x30
    ldy.b #0x00
    lda (0x10),Y
    beq .8067

    sta.b 0x00
    iny
    rep #0x31
    lda (0x10),Y
    sta.b 0x14
    iny
    iny
    lda (0x10),Y
    and.w #0x00FF
    asl
    clc
    adc.b 0x02
    tax
    lda.b 0x10
    adc.w #0x0004
    sta.b 0x10
    ldy.w #0x0000
.8058:
    lda [0x14],Y
    sta.w 0x0300,X
    iny
    iny
    inx
    inx
    dec.b 0x00
    bne .8058

    bra .8031

.8067:
    lda.b #0x01
    sta.b 0xA1
    pld
    plp
    rtl

;-----

_82806E:
    rep #0x20
    sec
    lda.b 0x05
    sbc.w 0x1E4D
    clc
    adc.w #0x0040
    cmp.w #0x0180
    bcs .808C

    sec
    lda.b 0x08
    sbc.w 0x1E50
    clc
    adc.w #0x0040
    cmp.w #0x0160
.808C:
    sep #0x20
    rtl

;-----

_82808F:
    rep #0x20
    sec
    lda.b 0x05
    sbc.w 0x1E4D
    clc
    adc.w #0x0060
    cmp.w #0x01C0
    bcs .80AF

    sec
    lda.b 0x08
    sbc.w 0x1E50
    clc
    adc.w #0x0050
    cmp.w #0x0180
    bcc .80D9

.80AF:
    sep #0x20
    stz.b 0x0E
    rtl

.80B4:
    rep #0x20
    sec
    lda.b 0x05
    sbc.w 0x1E4D
    clc
    adc.w #0x0020
    cmp.w #0x0140
    bcs .80D4

    sec
    lda.b 0x08
    sbc.w 0x1E50
    clc
    adc.w #0x0010
    cmp.w #0x0100
    bcc .80D9

.80D4:
    sep #0x20
    stz.b 0x0E
    rtl

.80D9:
    sep #0x20
    lda.b #0x81
    sta.b 0x0E
    sep #0x30
    ldx.b 0x12
    bpl .80E7

    ldx.b #0x0A
.80E7:
    jmp (.80EA,X)

.80EA: d16[.810B, .8120, .8135, .814A, .815F, .80F6]

.80F6:
    lda.w 0x00E7
    cmp.b #0x20
    bcs .810A

    asl
    tax
    rep #0x20
    tdc
    sta.w 0x0920,X
    sep #0x20
    inc.w 0x00E7
.810A:
    rtl

.810B:
    lda.w 0x00E8
    cmp.b #0x20
    bcs .811F

    asl
    tax
    rep #0x20
    tdc
    sta.w 0x0960,X
    sep #0x20
    inc.w 0x00E8
.811F:
    rtl

.8120:
    lda.w 0x00E9
    cmp.b #0x20
    bcs .8134

    asl
    tax
    rep #0x20
    tdc
    sta.w 0x09A0,X
    sep #0x20
    inc.w 0x00E9
.8134:
    rtl

.8135:
    lda.w 0x00EA
    cmp.b #0x20
    bcs .8149

    asl
    tax
    rep #0x20
    tdc
    sta.w 0x09E0,X
    sep #0x20
    inc.w 0x00EA
.8149:
    rtl

.814A:
    lda.w 0x00EB
    cmp.b #0x20
    bcs .815E

    asl
    tax
    rep #0x20
    tdc
    sta.w 0x0A20,X
    sep #0x20
    inc.w 0x00EB
.815E:
    rtl

.815F:
    lda.w 0x00EC
    cmp.b #0x20
    bcs .8173

    asl
    tax
    rep #0x20
    tdc
    sta.w 0x0A60,X
    sep #0x20
    inc.w 0x00EC
.8173:
    rtl

;-----

_828174:
    php
    rep #0x20
    sec
    lda.b 0x1E
    and.w #0x00FF
    sbc.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sec
    lda.b 0x1F
    and.w #0x00FF
    sbc.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    bra .820B

.8195:
    php
    rep #0x20
    sec
    lda.b 0x1E
    and.w #0x00FF
    sbc.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    clc
    lda.b 0x1F
    and.w #0x00FF
    adc.b 0x1A
    sta.b 0x1A
    bra .820B

.81B2:
    php
    rep #0x20
    clc
    lda.b 0x1E
    and.w #0x00FF
    adc.b 0x1C
    sta.b 0x1C
    sec
    lda.b 0x1F
    and.w #0x00FF
    sbc.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    bra .820B

.81CF:
    php
    rep #0x20
    clc
    lda.b 0x1E
    and.w #0x00FF
    adc.b 0x1C
    sta.b 0x1C
    clc
    lda.b 0x1F
    and.w #0x00FF
    adc.b 0x1A
    sta.b 0x1A
    bra .820B

.81E8:
    php
    rep #0x20
    sec
    lda.b 0x1E
    and.w #0x00FF
    sbc.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    bra .820B

.81FB:
    php
    rep #0x20
    clc
    lda.b 0x1E
    and.w #0x00FF
    adc.b 0x1C
    sta.b 0x1C
    bra .820B

.820A:
    php
.820B:
    rep #0x21
    lda.b obj.pos_x
    adc.b obj.speed_x
    sta.b obj.pos_x
    sep #0x20
    lda.b #0x00
    bit.b obj.speed_x+1
    bpl .821C

    dec
.821C:
    adc.b obj.pos_x+2
    sta.b obj.pos_x+2
    rep #0x20
    sec
    lda.b obj.pos_y
    sbc.b obj.speed_y
    sta.b obj.pos_y
    sep #0x20
    stz.w 0x0000
    bit.b obj.speed_y+1
    bpl .8235

    dec.w 0x0000
.8235:
    lda.b obj.pos_y+2
    sbc.w 0x0000
    sta.b obj.pos_y+2
    plp
    rtl

;-----

_82823E:
    php
    rep #0x21
    lda.b 0x04
    adc.b 0x1A
    sta.b 0x04
    sep #0x20
    bit.b 0x1B
    bmi .8255

    lda.b 0x06
    adc.b #0x00
    sta.b 0x06
    plp
    rtl

.8255:
    lda.b 0x06
    adc.b #0xFF
    sta.b 0x06
    plp
    rtl

;-----

_82825D:
    php
    rep #0x20
    lda.b 0x07
    sec
    sbc.b 0x1C
    sta.b 0x07
    sep #0x20
    bit.b 0x1D
    bmi .8275

    lda.b 0x09
    sbc.b #0x00
    sta.b 0x09
    plp
    rtl

.8275:
    lda.b 0x09
    sbc.b #0xFF
    sta.b 0x09
    plp
    rtl

;-----

_82827D:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x03
    sta.b 0x28
    lda.b 0x0A
    dec
    asl
    tax
    lda.w 0x86A5E7,X
    sta.b 0x16
    lda.w 0x86A5E8,X
    tax
    lda.l 0x7F8200,X
    sta.b 0x18
    lda.l 0x7F8300,X
    sta.b 0x11
    stz.b 0x30
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    stz.b 0x1E
    sep #0x20
    rtl

;-----

_8282AC:
    rep #0x30
    jmp (.82B1,X)

.82B1: d16[.82B9, .82D3, .8307, .8321]

.82B9:
    rep #0x30
    ldx.w #0x1628
.82BE:
    lda.w 0x0000,X
    beq .833B

    txa
    clc
    adc.w #0x0030
    tax
    cpx.w #0x1928
    bcc .82BE

    sep #0x20
    lda.b #0x01
    rtl

.82D3:
    rep #0x30
    ldx.w #0x1928
.82D8:
    lda.w 0x0000,X
    beq .833B

    txa
    clc
    adc.w #0x0020
    tax
    cpx.w #0x1D08
    bcc .82D8

    sep #0x20
    lda.b #0x01
    rtl

.82ED:
    rep #0x30
    ldx.w #0x0C98
.82F2:
    lda.w 0x0000,X
    beq .833B

    txa
    clc
    adc.w #0x0020
    tax
    cpx.w #0x0E18
    bcc .82F2

    sep #0x20
    lda.b #0x01
    rtl

.8307:
    rep #0x30
    ldx.w #0x1D08
.830C:
    lda.w 0x0000,X
    beq .833B

    txa
    clc
    adc.w #0x0010
    tax
    cpx.w #0x1E08
    bcc .830C

    sep #0x20
    lda.b #0x01
    rtl

.8321:
    rep #0x30
    ldx.w #0x0E68
.8326:
    lda.w 0x0000,X
    beq .833B

    txa
    clc
    adc.w #0x0040
    tax
    cpx.w #0x1228
    bcc .8326

    sep #0x20
    lda.b #0x01
    rtl

.833B:
    sep #0x22
    rtl

;-----

_82833E:
    rep #0x30
    ldx.w #0x1228
.8343:
    lda.w 0x0000,X
    beq _8282AC.833B

    txa
    clc
    adc.w #0x0040
    tax
    cpx.w #0x1428
    bcc .8343

    sep #0x20
    lda.b #0x01
    rtl

;-----

_828358:
    rep #0x30
    ldx.w #0x1428
.835D:
    lda.w 0x0000,X
    beq _8282AC.833B

    txa
    clc
    adc.w #0x0040
    tax
    cpx.w #0x1628
    bcc .835D

    sep #0x20
    lda.b #0x01
    rtl

;-----

_828372:
    sep #0x20
    rep #0x10
    ldx.b 0x0C
    beq .8398

    phb
    lda.b #0x7E
    pha
    plb
    lda.b #0x87
    sta.w 0x0000,X
    plb
    bra .8398

.8387:
    sep #0x20
    rep #0x10
    ldx.b 0x0C
    beq .8398

    phb
    lda.b #0x7E
    pha
    plb
    stz.w 0x0000,X
    plb
.8398:
    rep #0x20
    stz.b 0x00
    stz.b 0x02
    stz.b 0x0E
    sep #0x20
    rtl

;-----

_8283A3:
    rep #0x20
    stz.b 0x00
    stz.b 0x02
    stz.b 0x0E
    stz.b 0x2C
    sep #0x20
    rtl

;-----

_8283B0:
    ldx.b 0x01
    jmp (.83B5,X)

.83B5: d16[.83BF, .8429, .84E0, .8421, .84E0]

.83BF:
    lda.b #0x02
    sta.b 0x01
    ldx.w 0x1F7A
    lda.w 0x0BB9
    and.b #0x70
    ora.b #0x06
    sta.b 0x11
    stz.b 0x30
    stz.b 0x39
    stz.b 0x3A
    stz.b 0x18
    lda.b #0xFF
    sta.b 0x10
    lda.b #0x05
    sta.b 0x16
    lda.b #0x11
    sta.b 0x37
    lda.b 0x11
    asl
    asl
    lda.b #0x08
    bcs .83ED

    lda.b #0x18
.83ED:
    sta.b 0x38
    rep #0x20
    lda.w #0xBF6B
    sta.b 0x20
    lda.w #0xAD8A
    sta.b 0x31
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    sta.b 0x08
    lda.b 0x10
    asl
    asl
    lda.w #0x0480
    bcs .8411

    lda.w #0xFB80
.8411:
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x01
    jsl 0x848F07
    jml 0x8280B4

.8421:
    stz.b 0x30
    lda.b #0x02
    sta.b 0x01
    inc.b 0x39
.8429:
    ldx.b 0x02
    jsr (.8452,X)
    jsr _828538
    jsl 0x848EEA
    jsl 0x8280B4
    jsl 0x82806E
    bcc .8451

    lda.b 0x3A
    beq .844A

    rep #0x10
    ldx.b 0x0C
    stz.w 0x0028,X
.844A:
    dec.w 0x0BDD
    jml 0x8283A3

.8451:
    rtl

.8452: d16[.8456, .8479]

.8456:
    jsl 0x82820A
    dec.b 0x37
    bne .8478

    lda.b #0x02
    sta.b 0x02
    lda.b #0x02
    sta.b 0x37
    lda.b 0x38
    cmp.b #0x10
    bcs .846F

    dec
    bra .8470

.846F:
    inc
.8470:
    and.b #0x1F
    sta.b 0x38
    jsl 0x8284F2
.8478:
    rts

.8479:
    dec.b 0x37
    bne .84AC

    lda.b #0x02
    sta.b 0x37
    jsl 0x84A07C
    sec
    sbc.b 0x38
    and.b #0x1F
    cmp.b #0x10
    bcc .8492

    dec.b 0x38
    bra .8494

.8492:
    inc.b 0x38
.8494:
    lda.b 0x38
    and.b #0x1F
    sta.b 0x38
    jsl 0x8284F2
    rep #0x20
    lda.w 0x0000
    sta.b 0x1A
    lda.w 0x0002
    sta.b 0x1C
    sep #0x20
.84AC:
    jsl 0x82820A
    lda.w 0x0BCF
    and.b #0x7F
    beq .84DF

    lda.b 0x3A
    bne .84DF

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .84DF

    rep #0x20
    lda.b 0x08
    adc.w #0x2000
    sta.b 0x08
    sep #0x20
    lda.b 0x39
    bne .84DF

    inc.w 0x1F94
    lda.b #0x80
    tsb.w 0x1F94
.84DF:
    rts

.84E0:
    rep #0x10
    lda.b 0x3A
    beq .84EB

    ldx.b 0x0C
    stz.w 0x0028,X
.84EB:
    dec.w 0x0BDD
    jml 0x8283A3

;-----

_8284F2:
    asl
    asl
    tax
    phd
    pea 0x0000
    pld
    rep #0x20
    lda.w 0x00EE3A,X
    and.w #0x8000
    sta.b 0x00
    lda.w 0x00EE3C,X
    and.w #0x8000
    sta.b 0x02
    lda.w 0x00EE3A,X
    asl
    sta.b 0x04
    lda.w 0x00EE3A,X
    lsr
    ora.b 0x00
    lsr
    ora.b 0x00
    clc
    adc.b 0x04
    sta.b 0x00
    lda.w 0x00EE3C,X
    asl
    sta.b 0x06
    lda.w 0x00EE3C,X
    lsr
    ora.b 0x02
    lsr
    ora.b 0x02
    clc
    adc.b 0x06
    sta.b 0x02
    pld
    sep #0x20
    rtl

;-----

_828538:
    lda.b 0x3A
    bne .8581

    jsl 0x84AC5A
    cpy.b #0x00
    beq .8580

    phy
    rep #0x30
    ldx.w #0x0000
    ldy.w #0xB700
    lda.w #0x001F
    phb
    mvn 0x7F,0x00
    plb
    sep #0x30
    ply
    dey
    dey
.855A:
    phy
    tyx
    rep #0x30
    lda.l 0x7FB700,X
    tax
    jsl 0x849C0E
    bcs .8572

    sep #0x30
    ply
    dey
    dey
    bmi .8580

    bra .855A

.8572:
    stx.b 0x0C
    inc.w 0x0028,X
    sep #0x30
    inc.b 0x3A
    lda.b #0x02
    sta.b 0x12
    ply
.8580:
    rts

.8581:
    rep #0x30
    ldx.b 0x0C
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    lda.w 0x0000,X
    bne .8598

    stz.b 0x3A
.8598:
    sep #0x10
    rts

;-----

_82859B:
    lda.b #0x01
    sta.b 0x28
    ldx.b 0x01
    jsr (.85A7,X)
    stz.b 0x28
    rtl

.85A7: d16[.85AD, .85DB, .88A9]

.85AD:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x26
    sta.b 0x27
    sta.b 0x2F
    stz.b 0x3F
    stz.b 0x2A
    lda.l 0x7F821E
    sta.b 0x18
    sta.b 0x2F
    stz.b 0x30
    lda.b #0x40
    sta.b 0x1E
    stz.b 0x1F
    rep #0x10
    ldx.w #0xC0E3
    stx.b 0x20
    sep #0x10
    lda.b #0x20
    sta.b 0x16
    rts

.85DB:
    ldx.b 0x02
    jsr (.8653,X)
    ldy.w 0x1F7A
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0011,X
    and.b #0x40
    ora.l 0x7F831E
    ora 0x86BAC5,Y
    sta.b 0x11
    sep #0x10
    lda.b 0x27
    and.b #0x7F
    beq .8601

    jsl 0x8280B4
.8601:
    jsl 0x849B43
    beq .864E

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .864E

    lda.b 0x02
    cmp.b #0x04
    beq .8630

    cmp.b #0x08
    beq .862B

.861B:
    lda.b #0x06
    sta.b 0x02
    rep #0x10
    ldx.b 0x0C
    lda.b #0x06
    sta.w 0x0002,X
    sep #0x10
    rts

.862B:
    lda.b #0xB0
    sta.b 0x27
    rts

.8630:
    lda.b 0x3F
    beq .861B

    lda.b #0x0E
    sta.b 0x03
    stz.b 0x2C
    rep #0x10
    ldx.b 0x0C
    lda.b #0x04
    sta.w 0x0002,X
    lda.b #0x08
    sta.w 0x0003,X
    sta.w 0x0037,X
    sep #0x10
    rts

.864E:
    jsl 0x849B03
    rts

.8653: d16[.865D, .866A, .871D, .867B, .8686]

.865D:
    ldx.b 0x03
    bne .8669

    inc.b 0x03
    lda.b #0x0B
    jsl 0x848F07
.8669:
    rts

.866A:
    ldx.b 0x03
    bne .8676

    inc.b 0x03
    lda.b #0x0B
    jsl 0x848F07
.8676:
    jsl 0x848EEA
    rts

.867B:
    jsl 0x84A4AB
    stz.b 0x3F
    lda.b #0x04
    sta.b 0x01
    rts

.8686:
    ldx.b 0x03
    jmp (.868B,X)

.868B: d16[.8691, .86B2, .86D5]

.8691:
    stz.b 0x1A
    stz.b 0x1B
    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x04
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x03
    lda.b 0x3F
    beq .86B1

    lda.b #0x02
    sta.b 0x03
    lda.b #0x02
    sta.b 0x0B
    stz.b 0x10
.86B1:
    rts

.86B2:
    dec.b 0x0B
    bne .86D4

    lda.b #0x02
    sta.b 0x0B
    ldy.b 0x10
    rep #0x10
    ldx.b 0x31,Y
    inc.w 0x0002,X
    stz.w 0x0003,X
    sep #0x10
    iny
    iny
    sty.b 0x10
    cpy.b #0x0E
    bne .86D4

    lda.b #0x04
    sta.b 0x03
.86D4:
    rts

.86D5:
    lda.b 0x0E
    beq .8718

    jsl 0x828174
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .871C

    jsl 0x84A4AB
    stz.b 0x27
    lda.b #0x20
    sta.b 0x2A
    lda.b #0xF8
    sta.b 0x29
    jsl 0x8490A0
    beq .8707

    cmp.b #0x0D
    bcc .8718

    cmp.b #0x34
    beq .8718

    lda.b #0x08
    sta.b 0x29
.8707:
    jsl 0x8490A0
    beq .8715

    cmp.b #0x0D
    bcc .8718

    cmp.b #0x34
    beq .8718

.8715:
    jsr _8289B2
.8718:
    lda.b #0x04
    sta.b 0x01
.871C:
    rts

.871D:
    ldx.b 0x03
    jmp (.8722,X)

.8722: d16[.8732, .8749, .8779, .87B0, .8806, .8822, .8841, .884E]

.8732:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x1A
    stz.b 0x1B
    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x1E
    sta.b 0x0B
    lda.b #0x04
    jsl 0x848F07
    rts

.8749:
    dec.b 0x0B
    bne .8774

    lda.b #0x04
    sta.b 0x03
    lda.b #0x18
    sta.b 0x2F
    stz.b 0x2C
    stz.b 0x10
    lda.b #0x04
    jsl 0x848F07
    rep #0x10
    jsr _8288D1
    bmi .8772

    ldx.b 0x0C
    stz.w 0x0002,X
    stz.w 0x0003,X
    stz.b 0x02
    stz.b 0x03
.8772:
    sep #0x10
.8774:
    jsl 0x848EEA
    rts

.8779:
    jsl 0x828174
    lda.b 0x2F
    bpl .8786

    jsr _8288B0
    bra .8792

.8786:
    dec.b 0x2F
    bne .8792

    dec.b 0x2F
    inc.b 0x10
    stz.b 0x1C
    stz.b 0x1D
.8792:
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .87AD

    lda.b #0x06
    sta.b 0x03
    lda.b #0x1E
    jsl 0x84A333
    lda.b #0x10
    sta.b 0x0B
    jsr _8289B2
.87AD:
    jmp _828929

.87B0:
    dec.b 0x0B
    beq .87EE

    jsl 0x828174
    lda.b 0x2F
    bpl .87BF

    jsr _8288B0
.87BF:
    dec.b 0x2F
    bne .87CB

    dec.b 0x2F
    inc.b 0x10
    stz.b 0x1C
    stz.b 0x1D
.87CB:
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .8803

    ldx.b 0x2C
    inx
    stx.b 0x2C
    cpx.b #0x03
    bcs .87EE

    jsl 0x849086
    and.b #0x0F
    cmp.w 0x86C10D,X
    bcc .87EE

    lda.b #0x04
    sta.b 0x03
    rts

.87EE:
    lda.b #0x08
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x0B
    lda.b 0x10
    beq .8803

    rep #0x10
    ldx.b 0x0C
    dec.w 0x0037,X
    sep #0x10
.8803:
    jmp _828929

.8806:
    dec.b 0x0B
    bne .8821

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x02
    sta.b 0x1D
    rep #0x10
    ldx.b 0x0C
    lda.b #0x01
    sta.w 0x0037,X
    sep #0x10
.8821:
    rts

.8822:
    jsl 0x82825D
    rep #0x30
    ldx.b 0x0C
    lda.b 0x08
    cmp.w 0x0008,X
    bcs .883C

    dec.w 0x0037,X
    lda.w #0x000C
    sta.b 0x03
    jmp _828995

.883C:
    sep #0x30
    jmp _828929

.8841:
    rep #0x30
    ldx.b 0x0C
    lda.w 0x0008,X
    dec
    sta.b 0x08
    sep #0x30
    rts

.884E:
    ldx.b 0x2C
    jmp (.8853,X)

.8853: d16[.8859, .886A, .88A0]

.8859:
    lda.b #0x02
    sta.b 0x2C
    jsl 0x84A4AB
    lda.b #0x02
    sta.b 0x0B
    lda.b #0x0C
    sta.b 0x10
    rts

.886A:
    dec.b 0x0B
    bne .889F

    lda.b #0x02
    sta.b 0x0B
    ldy.b 0x10
    rep #0x10
    ldx.b 0x31,Y
    inc.w 0x0002,X
    stz.w 0x0003,X
    sep #0x10
    dey
    dey
    sty.b 0x10
    bpl .889F

    lda.b 0x2A
    cmp.b #0x7F
    beq .8897

    rep #0x10
    ldx.b 0x0C
    lda.b #0x06
    sta.w 0x0002,X
    sep #0x10
.8897:
    lda.b #0x04
    sta.b 0x2C
    lda.b #0x1E
    sta.b 0x0B
.889F:
    rts

.88A0:
    dec.b 0x0B
    bne .88A8

    lda.b #0x04
    sta.b 0x01
.88A8:
    rts

.88A9:
    jsl 0x8283A3
    jmp 0x828995

;-----

_8288B0:
    rep #0x30
    stz.w 0x0000
    dec.w 0x0000
    ldx.b 0x0C
    lda.w 0x0007,X
    sec
    sbc.b 0x1C
    sta.w 0x0007,X
    sep #0x20
    lda.w 0x0009,X
    sbc.w 0x0000
    sta.w 0x0009,X
    sep #0x10
    rts

;-----

_8288D1:
    ldy.w #0x000C
.88D4:
    jsl 0x8282D3
    bne .8912

    inc.w 0x0000,X
    lda.b #0x11
    sta.w 0x000A,X
    phy
    lda.b #0x00
    xba
    lda.w 0x1F7A
    tay
    lda.b 0x11
    and.b #0x40
    ora.l 0x7F831E
    ora 0x86BAC5,Y
    sta.w 0x0011,X
    ply
    lda.b 0x12
    sta.w 0x0012,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    stx 0x31,Y
    dey
    dey
    bpl .88D4

.8912:
    tya
    sta.b 0x3F
    bmi .8928

    stz.w 0x003F
.891A:
    cpy.w #0x000C
    beq .8928

    iny
    iny
    ldx.b 0x31,Y
    stz.w 0x0000,X
    bra .891A

.8928:
    rts

;-----

_828929:
    rep #0x31
    ldx.b 0x37
    ldy.b 0x0C
    lda.b 0x08
    adc 0x0008,Y
    lsr
    sta.w 0x0008,X
    ldy.b 0x3B
    lda.b 0x08
    clc
    adc.w 0x0008,X
    lsr
    sta 0x0008,Y
    ldx.b 0x3D
    lda.b 0x08
    clc
    adc 0x0008,Y
    lsr
    sta.w 0x0008,X
    ldx.b 0x37
    ldy.b 0x3B
    lda.w 0x0008,X
    clc
    adc 0x0008,Y
    lsr
    ldx.b 0x39
    sta.w 0x0008,X
    ldx.b 0x37
    ldy.b 0x0C
    lda.w 0x0008,X
    clc
    adc 0x0008,Y
    lsr
    ldx.b 0x33
    sta.w 0x0008,X
    ldx.b 0x33
    lda.w 0x0008,X
    clc
    adc 0x0008,Y
    lsr
    ldx.b 0x31
    sta.w 0x0008,X
    ldx.b 0x33
    ldy.b 0x37
    lda.w 0x0008,X
    clc
    adc 0x0008,Y
    lsr
    ldx.b 0x35
    sta.w 0x0008,X
    sep #0x30
    rts

;-----

_828995:
    rep #0x30
    lda.b 0x3F
    and.w #0x00FF
    beq .89AD

    ldy.w #0x000C
.89A1:
    ldx.b 0x31,Y
    stz.w 0x0000,X
    stz.w 0x0002,X
    dey
    dey
    bpl .89A1

.89AD:
    sep #0x30
    stz.b 0x3F
    rts

;-----

_8289B2:
    lda.b #0x18
    sta.b 0x2A
    lda.b #0x08
    sta.b 0x29
    stz.b 0x0F
    stz.b 0x1F
    jsl 0x8490A0
    cmp.b #0x34
    bcc .8A2A

    cmp.b #0x35
    bne .89CE

    lda.b #0x08
    sta.b 0x1F
.89CE:
    inc.b 0x0F
    jsr _828AA5
    rep #0x31
    lda.b 0x05
    adc.w #0x0008
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0018
    sta.w 0x0002
    ldx.w #0x0307
    lda.b 0x1F
    and.w #0x00FF
    beq .89F3

    ldx.w #0x0304
.89F3:
    txa
    sta.w 0x0008
    jsl 0x849111
    sep #0x30
    jsr _828AD9
    rep #0x21
    lda.b 0x05
    adc.w #0x0008
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0018
    sta.w 0x0002
    lda.b 0x1F
    and.w #0x00FF
    asl
    tax
    lda.w 0x86C0ED,X
    sta.w 0x0008
    jsl 0x849111
    jsl 0x80B8D5
    sep #0x20
.8A2A:
    lda.b #0x18
    sta.b 0x2A
    lda.b #0xF8
    sta.b 0x29
    stz.b 0x1F
    jsl 0x8490A0
    cmp.b #0x34
    bcc .8AA2

    cmp.b #0x35
    bne .8A44

    lda.b #0x08
    sta.b 0x1F
.8A44:
    lda.b 0x0F
    bne .8A4B

    jsr _828AA5
.8A4B:
    rep #0x31
    lda.b 0x05
    adc.w #0xFFF8
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0018
    sta.w 0x0002
    ldx.w #0x0307
    lda.b 0x1F
    and.w #0x00FF
    beq .8A6B

    ldx.w #0x0304
.8A6B:
    txa
    sta.w 0x0008
    jsl 0x849111
    sep #0x30
    jsr _828AD9
    rep #0x21
    lda.b 0x05
    adc.w #0xFFF8
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0018
    sta.w 0x0002
    lda.b 0x1F
    and.w #0x00FF
    asl
    tax
    lda.w 0x86C0ED,X
    sta.w 0x0008
    jsl 0x849111
    jsl 0x80B8D5
    sep #0x20
.8AA2:
    stz.b 0x1F
    rts

;-----

_828AA5:
    rep #0x10
    lda.b #0x26
    jsl 0x80888B
    ldy.w #0x0005
.8AB0:
    jsl 0x8282D3
    bne .8AD6

    inc.w 0x0000,X
    lda.b #0x12
    sta.w 0x000A,X
    tya
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    adc.w #0x0020
    sta.w 0x0008,X
    sep #0x20
    dey
    bpl .8AB0

.8AD6:
    sep #0x10
    rts

;-----

_828AD9:
    lda.b 0x29
    clc
    adc.b #0x10
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcs .8AF5

    cmp.b #0x0F
    beq .8AF0

    cmp.b #0x10
    bne .8AF9

.8AF0:
    jsr _828B5B
    bra .8AF9

.8AF5:
    lda.b #0x01
    tsb.b 0x1F
.8AF9:
    lda.b 0x29
    sec
    sbc.b #0x20
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcs .8B15

    cmp.b #0x0F
    beq .8B10

    cmp.b #0x10
    bne .8B19

.8B10:
    jsr _828B5B
    bra .8B19

.8B15:
    lda.b #0x04
    tsb.b 0x1F
.8B19:
    lda.b 0x29
    clc
    adc.b #0x10
    sta.b 0x29
    lda.b 0x2A
    clc
    adc.b #0x10
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcs .8B3C

    cmp.b #0x0F
    beq .8B37

    cmp.b #0x10
    bne .8B40

.8B37:
    jsr _828B5B
    bra .8B40

.8B3C:
    lda.b #0x02
    tsb.b 0x1F
.8B40:
    lda.b 0x2A
    sec
    sbc.b #0x20
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcs .8B5A

    cmp.b #0x0F
    beq .8B57

    cmp.b #0x10
    bne .8B5A

.8B57:
    jsr _828B5B
.8B5A:
    rts

;-----

_828B5B:
    stz.b 0x19
    cmp.b #0x10
    bne .8B65

    lda.b #0x08
    sta.b 0x19
.8B65:
    lda.b 0x29
    clc
    adc.b #0x10
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .8B78

    lda.b #0x01
    tsb.b 0x19
.8B78:
    lda.b 0x29
    sec
    sbc.b #0x20
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .8B8B

    lda.b #0x04
    tsb.b 0x19
.8B8B:
    lda.b 0x29
    clc
    adc.b #0x10
    sta.b 0x29
    lda.b 0x2A
    clc
    adc.b #0x10
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .8BA5

    lda.b #0x02
    tsb.b 0x19
.8BA5:
    lda.b 0x2A
    sec
    sbc.b #0x10
    sta.b 0x2A
    stz.w 0x0001
    lda.b 0x29
    sta.w 0x0000
    bpl .8BB9

    dec.w 0x0001
.8BB9:
    stz.w 0x0003
    lda.b 0x2A
    sta.w 0x0002
    bpl .8BC6

    dec.w 0x0003
.8BC6:
    rep #0x21
    lda.b 0x05
    adc.w 0x0000
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w 0x0002
    sta.w 0x0002
    lda.b 0x19
    and.w #0x00FF
    asl
    tax
    lda.w 0x86C0ED,X
    sta.w 0x0008
    jsl 0x849111
    jsl 0x80B8D5
    sep #0x20
    stz.b 0x19
    rts

;-----

_828BF3:
    ldx.b 0x01
    jsr (.8C09,X)
    jsl 0x849B03
    jsl 0x8280B4
    lda.b 0x0E
    bne .8C08

    jml 0x8283A3

.8C08:
    rtl

.8C09: d16[.8C0D, .8C47]

.8C0D:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x28
    stz.b 0x18
    lda.b #0x21
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x01
    sta.b 0x27
    sta.b 0x26
    stz.b 0x12
    lda.b 0x11
    and.b #0xF0
    ora.b #0x20
    sta.b 0x11
    and.b #0x40
    rep #0x20
    beq .8C3A

    lda.w #0x0400
    bra .8C3D

.8C3A:
    lda.w #0xFC00
.8C3D:
    sta.b 0x1A
    lda.w #0xC110
    sta.b 0x20
    sep #0x20
    rts

.8C47:
    jsl 0x82823E
    rts

;-----

_828C4C:
    ldx.b 0x01
    jmp (.8C51,X)

.8C51: d16[.8C5B, .8C9B, .8CE1, .8D18, .8D57]

.8C5B:
    lda.b #0x19
    sta.b 0x0A
    jsl 0x82827D
    lda.b #0x0B
    sta.b 0x0A
    sta.b 0x28
    lda.b #0x00
    sta.b 0x12
    lda.b #0x01
    sta.b 0x26
    sta.b 0x27
    lda.b #0x40
    sta.b 0x1E
    lda.b 0x0B
    asl
    tax
    rep #0x20
    lda.w 0x86C122,X
    ldx.b 0x0B
    bpl .8C88

    eor.w #0xFFFF
    inc
.8C88:
    sta.b 0x1A
    lda.w #0xC114
    sta.b 0x20
    sep #0x20
    lda.b #0x03
    jsl 0x848F07
    jml 0x8280B4

.8C9B:
    jsl 0x8281E8
    jsl 0x82806E
    bcc .8CA9

    jml 0x8283A3

.8CA9:
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x07
    beq .8CDD

    stz.b 0x37
    lda.b #0x28
    sta.b 0x38
    lda.b 0x2B
    bit.b #0x04
    beq .8CCB

    lda.b #0x04
    sta.b 0x01
    lda.b #0x04
    jsl 0x848F07
    bra .8CDD

.8CCB:
    bit.b #0x01
    beq .8CD3

    lda.b #0x40
    tsb.b 0x11
.8CD3:
    lda.b #0x06
    sta.b 0x01
    lda.b #0x08
    jsl 0x848F07
.8CDD:
    jml 0x8280B4

.8CE1:
    stz.b 0x29
    lda.b #0x0C
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .8CFB

    dec.b 0x38
    bne .8D10

    inc.b 0x37
    lda.b 0x37
    cmp.b #0x04
    bcc .8D02

.8CFB:
    jsr _828D6B
    jml 0x8280B4

.8D02:
    clc
    adc.b #0x04
    jsl 0x848F07
    ldx.b 0x37
    lda.w 0x86C128,X
    sta.b 0x38
.8D10:
    jsl 0x848EEA
    jml 0x8280B4

.8D18:
    lda.b 0x11
    asl
    asl
    lda.b #0x08
    bcs .8D22

    lda.b #0xF8
.8D22:
    sta.b 0x29
    stz.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .8D3A

    dec.b 0x38
    bne .8D4F

    inc.b 0x37
    lda.b 0x37
    cmp.b #0x04
    bcc .8D41

.8D3A:
    jsr _828D6B
    jml 0x8280B4

.8D41:
    clc
    adc.b #0x08
    jsl 0x848F07
    ldx.b 0x37
    lda.w 0x86C128,X
    sta.b 0x38
.8D4F:
    jsl 0x848EEA
    jml 0x8280B4

.8D57:
    jsl 0x849B03
    jsl 0x848EEA
    lda.b 0x0F
    bpl .8D67

    jml 0x8283A3

.8D67:
    jml 0x8280B4

;-----

_828D6B:
    lda.b #0x23
    jsl 0x80888B
    lda.b #0x08
    sta.b 0x01
    lda.l 0x7F8222
    sta.b 0x18
    lda.b #0x25
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rep #0x20
    lda.w #0xC11E
    sta.b 0x20
    sep #0x20
    lda.b 0x11
    and.b #0xF1
    ora.b #0x04
    sta.b 0x11
    rts

;-----

_828D97:
    ldx.b 0x01
    jsr (.8DC5,X)
    lda.b 0x2B
    bne .8DB4

    lda.b 0x37
    beq .8DB4

    jsl 0x849B03
    bne .8DB4

    jsl 0x849B43
    beq .8DBC

    jsl 0x84A37F
.8DB4:
    jsl 0x84A4AB
.8DB8:
    jml 0x8283A3

.8DBC:
    jsl 0x8280B4
    lda.b 0x0E
    beq .8DB8

    rtl

.8DC5: d16[.8DCD, .8E15, .8E42, .8E61]

.8DCD:
    lda.b #0x20
    sta.b 0x0A
    jsl 0x82827D
    lda.b #0x0C
    sta.b 0x0A
    lda.b #0x04
    sta.b 0x12
    lda.b #0x01
    sta.b 0x27
    sta.b 0x26
    lda.b #0x06
    jsl 0x848F07
    rep #0x20
    lda.w #0xC12C
    sta.b 0x20
    lda.b 0x08
    sta.b 0x38
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    jsl 0x849086
    and.b #0x03
    tax
    lda.w 0x00C140,X
    sta.b 0x37
    jsl 0x8491BE
    lda.b 0x2B
    beq .8E14

    lda.b #0x06
    sta.b 0x01
    stz.b 0x2B
.8E14:
    rts

.8E15:
    jsl 0x8281E8
    jsl 0x8491BE
    lda.b 0x2E
    cmp.b #0x0E
    beq .8E27

    cmp.b #0x0D
    bne .8E2F

.8E27:
    lda.b #0x04
    sta.b 0x01
    lda.b #0x20
    sta.b 0x1E
.8E2F:
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFC00
    bpl .8E3D

    lda.w #0xFC00
    sta.b 0x1C
.8E3D:
    sep #0x20
    jmp _828E64

.8E42:
    jsl 0x8281E8
    jsl 0x848EEA
    jsl 0x8491BE
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFE00
    bpl .8E5C

    lda.w #0xFE00
    sta.b 0x1C
.8E5C:
    sep #0x20
    jmp _828E64

.8E61:
    dec.b 0x37
    rts

;-----

_828E64:
    lda.b 0x08
    sec
    sbc.b 0x38
    sep #0x20
    cmp.b 0x37
    bcc .8E71

    stz.b 0x37
.8E71:
    rts

;-----

_828E72:
    ldx.b 0x01
    jmp (.8E77,X)

.8E77: d16[.8E85, .8EFA, .8F16, .8F26, .8F56, .8F5D, .8F9B]

.8E85:
    lda.b #0x22
    sta.b 0x0A
    jsl 0x82827D
    lda.b #0x02
    sta.b 0x12
    lda.b #0x0D
    sta.b 0x0A
    lda.b #0x01
    sta.b 0x27
    lda.b 0x0B
    bne .8EC8

    lda.b #0x01
    sta.b 0x26
    lda.b #0xFF
    sta.b 0x2F
    rep #0x20
    lda.w #0xC144
    sta.b 0x20
    lda.w 0x86EE8A
    asl
    asl
    asl
    sta.b 0x1A
    lda.w 0x86EE8C
    asl
    asl
    asl
    sta.b 0x1C
    sep #0x20
    lda.b #0x02
    jsl 0x848F07
    jml 0x8280B4

.8EC8:
    lda.b #0x06
    sta.b 0x01
    lda.b #0x02
    sta.b 0x26
    stz.b 0x28
    rep #0x20
    lda.w #0xC14E
    sta.b 0x20
    lda.w #0xFE00
    sta.b 0x1A
    sep #0x20
    lda.b #0x20
    sta.b 0x1F
    lda.b #0x18
    sta.b 0x37
    lda.b #0x06
    sta.b 0x38
    lda.b #0x0C
    sta.b 0x39
    lda.b #0x04
    jsl 0x848F07
    jml 0x8280B4

.8EFA:
    jsl 0x82820A
    jsl 0x849B03
    jsl 0x8491BE
    lda.b 0x2B
    beq .8F12

    inc.b 0x01
    inc.b 0x01
    jsl 0x848EEA
.8F12:
    jml 0x8280B4

.8F16:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .8F22

    jml 0x8283A3

.8F22:
    jml 0x8280B4

.8F26:
    jsl 0x828174
    dec.b 0x39
    bne .8F4F

    lda.b #0x06
    sta.b 0x39
    lda.b #0x08
    sta.b 0x01
    jsl 0x84A07C
    cmp.b #0x18
    beq .8F4F

    sec
    sbc.b #0x08
    and.b #0x1F
    cmp.b #0x10
    bcc .8F4B

    lda.b #0x0C
    bra .8F4D

.8F4B:
    lda.b #0x0A
.8F4D:
    sta.b 0x01
.8F4F:
    jsl 0x849B43
    jmp _828FDC

.8F56:
    jsl 0x82823E
    jmp _828FDC

.8F5D:
    lda.b 0x38
    beq .8F94

    dec.b 0x39
    bne .8F94

    dec.b 0x38
    lda.b #0x06
    sta.b 0x39
    dec.b 0x37
    lda.b 0x37
    asl
    asl
    tax
    rep #0x20
    lda.w 0x86EE3A,X
    asl
    sta.b 0x1A
    lda.w 0x86EE3C,X
    asl
    sta.b 0x1C
    sep #0x20
    cpx.b #0x5C
    beq .8F94

    cpx.b #0x50
    bcs .8F8E

    lda.b #0x09
    bra .8F90

.8F8E:
    lda.b #0x08
.8F90:
    jsl 0x848F07
.8F94:
    jsl 0x82820A
    jmp _828FDC

.8F9B:
    lda.b 0x38
    beq .8FD5

    dec.b 0x39
    bne .8FD5

    dec.b 0x38
    lda.b #0x06
    sta.b 0x39
    lda.b 0x37
    inc
    and.b #0x1F
    sta.b 0x37
    asl
    asl
    tax
    rep #0x20
    lda.w 0x86EE3A,X
    asl
    sta.b 0x1A
    lda.w 0x86EE3C,X
    asl
    sta.b 0x1C
    sep #0x20
    cpx.b #0x64
    beq .8FD5

    cpx.b #0x74
    bcc .8FCF

    lda.b #0x06
    bra .8FD1

.8FCF:
    lda.b #0x05
.8FD1:
    jsl 0x848F07
.8FD5:
    jsl 0x82820A
    jmp _828FDC

;-----

_828FDC:
    jsl 0x849B43
    jsl 0x849B03
    bne .9020

    ldy.b #0x27
    lda (0x0C),Y
    and.b #0x7F
    beq .9020

    jsl 0x8280B4
    lda.b 0x0E
    beq .9024

    dec.b 0x3A
    lda.b 0x3A
    and.b #0x01
    bne .901F

    jsl 0x8282D3
    bne .901D

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.901D:
    sep #0x30
.901F:
    rtl

.9020:
    jsl 0x84A4AB
.9024:
    jml 0x8283A3

;-----

_829028:
    ldx.b 0x01
    jmp (.902D,X)

.902D: d16[.9033, .908A, .90AD]

.9033:
    lda.b #0x29
    sta.b 0x0A
    jsl 0x82827D
    lda.b #0x0E
    sta.b 0x0A
    lda.b #0x02
    sta.b 0x12
    lda.b 0x0B
    beq .9064

    lda.b #0x04
    sta.b 0x01
    lda.b #0x06
    jsl 0x848F07
    rep #0x20
    lda.w #0xFC00
    sta.b 0x1C
    lda.w #0xFC00
    sta.b 0x1A
    lda.w #0xC166
    sta.b 0x20
    bra .907A

.9064:
    lda.b #0x05
    jsl 0x848F07
    lda.b #0x0C
    sta.b 0x1F
    rep #0x20
    lda.w #0xFE00
    sta.b 0x1A
    lda.w #0xC162
    sta.b 0x20
.907A:
    sep #0x20
    lda.b #0x01
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    stz.b 0x28
    jml 0x8280B4

.908A:
    jsl 0x828174
    jsl 0x849B43
    jsl 0x849B03
    beq .90A0

    jsl 0x84A4AB
.909C:
    jml 0x8283A3

.90A0:
    jsl 0x82806E
    bcs .909C

    jsr _8290DB
    jml 0x8280B4

.90AD:
    jsl 0x848EEA
    jsl 0x82820A
    jsl 0x849B03
    lda.b 0x02
    bne .90CD

    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .90CD

    stz.b 0x1C
    stz.b 0x1D
    inc.b 0x02
.90CD:
    jsl 0x82806E
    bcs .90D7

    jml 0x8280B4

.90D7:
    jml 0x8283A3

;-----

_8290DB:
    inc.b 0x37
    lda.b 0x37
    and.b #0x03
    bne .9109

    jsl 0x8282D3
    bne .9107

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x02
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    clc
    adc.w #0x0008
    sta.w 0x0005,X
    lda.b 0x08
    inc
    sta.w 0x0008,X
.9107:
    sep #0x30
.9109:
    rts

;-----

_82910A:
    ldx.b 0x01
    jsr (_82913B.914A,X)
    lda.b 0x27
    beq _82913B

    jsl 0x849B43
    beq .9131

    lda.b 0x27
    and.b #0x7F
    bne .9128

    stz.b 0x38
    lda.b #0x04
    sta.b 0x01
    jmp _82913B

.9128:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    jmp _82913B

.9131:
    lda.b 0x3F
    ora.b 0x11
    sta.b 0x11
    jsl 0x849B03

;-----

_82913B:
    jsl 0x8280B4
    jsl 0x82806E
    bcc .9149

    jsl 0x8283A3
.9149:
    rtl

.914A: d16[.9150, .91BB, .93EF]

.9150:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x01
    sta.b 0x28
    lda.l 0x7F8231
    sta.b 0x18
    lda.l 0x7F8331
    ora.b #0x30
    sta.b 0x11
    lda.b 0x11
    and.b #0x0E
    sta.b 0x3F
    lda.b #0x00
    sta.b 0x12
    stz.b 0x3E
    rep #0x20
    lda.w #0xFC80
    sta.b 0x1A
    sta.b 0x1C
    sep #0x20
    lda.b #0x33
    sta.b 0x16
    lda.b 0x0B
    beq .91A7

    cmp.b #0x01
    beq .9195

    cmp.b #0x03
    bne .91A7

.9195:
    rep #0x20
    lda.w #0xC170
    sta.b 0x20
    sep #0x20
    lda.b #0x08
    sta.b 0x39
    lda.b #0x01
    jmp .91B6

.91A7:
    rep #0x20
    lda.w #0xC175
    sta.b 0x20
    sep #0x20
    lda.b #0x07
    sta.b 0x39
    lda.b #0x00
.91B6:
    jsl 0x848F07
    rts

.91BB:
    ldx.b 0x02
    jsr (.91C1,X)
    rts

.91C1: d16[.91CF, .91F4, .921B, .9242, .9269, .938A, .93AD]

.91CF:
    lda.b 0x0B
    beq .91E1

    cmp.b #0x01
    beq .91E7

    cmp.b #0x02
    beq .91EB

    lda.b #0x18
    sta.b 0x37
    bra .91EF

.91E1:
    lda.b #0x0C
    sta.b 0x37
    bra .91EF

.91E7:
    stz.b 0x37
    bra .91EF

.91EB:
    lda.b #0x32
    sta.b 0x37
.91EF:
    lda.b #0x0C
    sta.b 0x02
    rts

.91F4:
    lda.b 0x0B
    beq .9206

    cmp.b #0x01
    beq .920C

    cmp.b #0x02
    beq .9212

    lda.b #0x64
    sta.b 0x37
    bra .9216

.9206:
    lda.b #0x58
    sta.b 0x37
    bra .9216

.920C:
    lda.b #0x4C
    sta.b 0x37
    bra .9216

.9212:
    lda.b #0x6E
    sta.b 0x37
.9216:
    lda.b #0x0C
    sta.b 0x02
    rts

.921B:
    lda.b 0x0B
    beq .922D

    cmp.b #0x01
    beq .9233

    cmp.b #0x02
    beq .9239

    lda.b #0x8C
    sta.b 0x37
    bra .923D

.922D:
    lda.b #0x82
    sta.b 0x37
    bra .923D

.9233:
    lda.b #0x78
    sta.b 0x37
    bra .923D

.9239:
    lda.b #0xAE
    sta.b 0x37
.923D:
    lda.b #0x0C
    sta.b 0x02
    rts

.9242:
    lda.b 0x0B
    beq .9254

    cmp.b #0x01
    beq .925A

    cmp.b #0x02
    beq .9260

    lda.b #0xE4
    sta.b 0x37
    bra .9264

.9254:
    lda.b #0xDA
    sta.b 0x37
    bra .9264

.925A:
    lda.b #0xD0
    sta.b 0x37
    bra .9264

.9260:
    lda.b #0xF0
    sta.b 0x37
.9264:
    lda.b #0x0C
    sta.b 0x02
    rts

.9269:
    ldx.b 0x37
    lda.w 0x00C1B6,X
    sta.b 0x38
    inx
    lda.b 0x39
    sta.b 0x03
    lda.w 0x00C1B6,X
    sta.b 0x39
    beq .927F

    jmp .92C3

.927F:
    rep #0x20
    lda.w #0x0380
    sta.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b 0x03
    cmp.b #0x03
    bne .9296

    jsr _82948A
    jmp .92B1

.9296:
    cmp.b #0x02
    bne .92A0

    jsr _82949F
    jmp .92B1

.92A0:
    cmp.b #0x07
    bne .92AA

    jsr _8294B4
    jmp .92B1

.92AA:
    cmp.b #0x08
    bne .92B1

    jsr _8294C9
.92B1:
    lda.b #0x09
    jsl 0x848F07
    rep #0x20
    lda.w #0xC184
    sta.b 0x20
    sep #0x20
    jmp .9385

.92C3:
    cmp.b #0x01
    beq .92CA

    jmp .930E

.92CA:
    rep #0x20
    lda.w #0xFC80
    sta.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b 0x03
    cmp.b #0x02
    bne .92E1

    jsr _82949F
    jmp .92FC

.92E1:
    cmp.b #0x03
    bne .92EB

    jsr _8294DE
    jmp .92FC

.92EB:
    cmp.b #0x07
    bne .92F5

    jsr _8294B4
    jmp .92FC

.92F5:
    cmp.b #0x08
    bne .92FC

    jsr _8294C9
.92FC:
    lda.b #0x0B
    jsl 0x848F07
    rep #0x20
    lda.w #0xC189
    sta.b 0x20
    sep #0x20
    jmp .9385

.930E:
    cmp.b #0x02
    bne .9342

    rep #0x20
    lda.w #0xFC80
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b 0x03
    cmp.b #0x00
    bne .9329

    jsr _82949F
    jmp .9330

.9329:
    cmp.b #0x01
    bne .9330

    jsr _8294F3
.9330:
    lda.b #0x0C
    jsl 0x848F07
    rep #0x20
    lda.w #0xC18E
    sta.b 0x20
    sep #0x20
    jmp .9385

.9342:
    cmp.b #0x03
    bne .9376

    rep #0x20
    lda.w #0xFC80
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b 0x03
    cmp.b #0x00
    bne .935D

    jsr _829508
    jmp .9364

.935D:
    cmp.b #0x01
    bne .9364

    jsr _829508
.9364:
    lda.b #0x0A
    jsl 0x848F07
    rep #0x20
    lda.w #0xC193
    sta.b 0x20
    sep #0x20
    jmp .9385

.9376:
    rep #0x20
    lda.w #0xFC80
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b 0x03
    sta.b 0x39
.9385:
    lda.b #0x0A
    sta.b 0x02
    rts

.938A:
    lda.b 0x0F
    cmp.b #0x80
    bne .93A8

    jsr _82943B
    dec.b 0x38
    beq .939D

    jsl 0x82820A
    bra .93AC

.939D:
    lda.b #0x08
    sta.b 0x02
    inc.b 0x37
    inc.b 0x37
    jmp .93AC

.93A8:
    jsl 0x848EEA
.93AC:
    rts

.93AD:
    lda.b 0x0F
    cmp.b #0x80
    bne .93DB

    lda.b #0x08
    sta.b 0x02
    lda.b 0x0B
    beq .93CF

    cmp.b #0x01
    beq .93C3

    cmp.b #0x03
    bne .93CF

.93C3:
    rep #0x20
    lda.w #0xC17A
    sta.b 0x20
    sep #0x20
    jmp .93EC

.93CF:
    rep #0x20
    lda.w #0xC17F
    sta.b 0x20
    sep #0x20
    jmp .93EC

.93DB:
    jsl 0x848EEA
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    bne .93EC

    lda.b #0x04
    sta.b 0x01
.93EC:
    sep #0x10
    rts

.93EF:
    rep #0x20
    lda.b 0x05
    sta.b 0x3A
    lda.b 0x08
    sta.b 0x3C
    sep #0x20
    lda.b 0x39
    beq .940B

    dec
    beq .9411

    dec
    beq .9417

    dec
    beq .941D

    jmp .9420

.940B:
    jsr _829508
    jmp .9420

.9411:
    jsr _8294F3
    jmp .9420

.9417:
    jsr _8294F3
    jmp .9420

.941D:
    jsr _8294DE
.9420:
    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
    rep #0x20
    lda.b 0x3A
    sta.b 0x05
    lda.b 0x3C
    sta.b 0x08
    sep #0x20
    jsl 0x8283A3
    rts

;-----

_82943B:
    lda.b 0x39
    beq .9450

    dec
    beq .945C

    dec
    beq .9468

    dec
    beq .9474

    dec
    dec
    dec
    beq .9480

    jmp .9489

.9450:
    rep #0x20
    lda.w #0xC19D
    sta.b 0x20
    sep #0x20
    jmp .9489

.945C:
    rep #0x20
    lda.w #0xC1A2
    sta.b 0x20
    sep #0x20
    jmp .9489

.9468:
    rep #0x20
    lda.w #0xC1A7
    sta.b 0x20
    sep #0x20
    jmp .9489

.9474:
    rep #0x20
    lda.w #0xC1AC
    sta.b 0x20
    sep #0x20
    jmp .9489

.9480:
    rep #0x20
    lda.w #0xC1B1
    sta.b 0x20
    sep #0x20
.9489:
    rts

;-----

_82948A:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0013
    sta.b 0x05
    lda.b 0x08
    sec
    sbc.w #0x0012
    sta.b 0x08
    sep #0x20
    rts

;-----

_82949F:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0011
    sta.b 0x05
    lda.b 0x08
    clc
    adc.w #0x0011
    sta.b 0x08
    sep #0x20
    rts

;-----

_8294B4:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0006
    sta.b 0x05
    lda.b 0x08
    clc
    adc.w #0x000D
    sta.b 0x08
    sep #0x20
    rts

;-----

_8294C9:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0006
    sta.b 0x05
    lda.b 0x08
    sec
    sbc.w #0x000E
    sta.b 0x08
    sep #0x20
    rts

;-----

_8294DE:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0013
    sta.b 0x05
    lda.b 0x08
    sec
    sbc.w #0x0014
    sta.b 0x08
    sep #0x20
    rts

;-----

_8294F3:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0016
    sta.b 0x05
    lda.b 0x08
    clc
    adc.w #0x0016
    sta.b 0x08
    sep #0x20
    rts

;-----

_829508:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x000E
    sta.b 0x05
    lda.b 0x08
    sec
    sbc.w #0x0015
    sta.b 0x08
    sep #0x20
    rts

;-----

_82951D:
    ldx.b 0x01
    jsr (.9534,X)
    lda.b 0x00
    beq .9533

    lda.b 0x37
    lsr
    bcc .9533

    jsl 0x848FCA
    jml 0x82808F

.9533:
    rtl

.9534: d16[.953A, .9562, .958E]

.953A:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x18
    lda.l 0x7F833D
    sta.b 0x11
    lda.b #0x3E
    sta.b 0x16
    lda.b #0x3D
    sta.b 0x10
    lda.b #0x00
    jsl 0x848F07
    rep #0x20
    lda.w #0xB0F5
    sta.b 0x31
    sep #0x20
    lda.b #0x78
    sta.b 0x37
    rts

.9562:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    and.b #0x7F
    bne .9571

    lda.b #0x01
    sta.b 0x37
.9571:
    sep #0x10
    jsl 0x848EEA
    dec.b 0x37
    beq .957F

    lda.b 0x0B
    beq .958D

.957F:
    lda.b #0x04
    sta.b 0x01
    lda.b #0x02
    jsl 0x848F07
    lda.b #0xFE
    sta.b 0x37
.958D:
    rts

.958E:
    dec.b 0x37
    jsl 0x848EEA
    lda.b 0x0F
    bpl .959C

    jsl 0x8283A3
.959C:
    rts

;-----

_82959D:
    ldx.b 0x01
    jmp (.95A2,X)

.95A2: d16[.95AE, .95CE, .95DF, .95F0, .95F0, .960B]

.95AE:
    lda.b 0x02
    bne .95B8

    inc.b 0x02
    lda.b #0x3C
    sta.b 0x33
.95B8:
    dec.b 0x33
    beq .95BD

    rtl

.95BD:
    jsl 0x82827D
    lda.b #0x04
    sta.b 0x12
    stz.b 0x02
    lda.b #0x06
    jsl 0x848F07
    rtl

.95CE:
    jsr _829677
    jsr _82963D
    jsr _829666
    jsl 0x848EEA
    jml 0x8280B4

.95DF:
    jsr _829677
    jsr _82963D
    jsr _829666
    jsl 0x848EEA
    jml 0x8280B4

.95F0:
    jsr _829677
    jsr _82963D
    jsr _829666
    jsl 0x848EEA
    lda.b 0x03
    cmp.b #0x14
    bcs .9607

    jml 0x8280B4

.9607:
    jml 0x828398

.960B:
    lda.b 0x02
    bne .9626

    inc.b 0x02
    rep #0x20
    stz.b 0x1A
    lda.w #0xFF00
    sta.b 0x1C
    sep #0x20
    lda.b #0x10
    sta.b 0x1E
    lda.b #0x12
    jsl 0x848F07
.9626:
    jsl 0x8281E8
    lda.w 0x0B9C
    lsr
    bcc .963C

    jsl 0x8280B4
    lda.b 0x0E
    bne .963C

    jml 0x828398

.963C:
    rtl

;-----

_82963D:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0036,X
    bne .964F

    lda.b #0x0A
    sta.b 0x01
    stz.b 0x02
    sep #0x10
    rts

.964F:
    lda.w 0x0001,X
    sta.b 0x01
    lda.w 0x0002,X
    sta.b 0x02
    lda.w 0x0003,X
    sta.b 0x03
    lda.w 0x0011,X
    sta.b 0x11
    sep #0x30
    rts

;-----

_829666:
    rep #0x30
    ldx.b 0x0C
    lda.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    sta.b 0x08
    sep #0x30
    rts

;-----

_829677:
    ldy.b #0x37
    lda (0x0C),Y
    bmi .9681

    jsl 0x848F07
.9681:
    rts

;-----

    incsrc "obj/crusher.asm"

;-----

_82999F:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.99D0,X)
    jsl 0x849B03
    jsl 0x849B43
    beq .99C6

    bpl .99C2

    jsl 0x84A4AB
    lda.b #0x01
    jsl 0x84A37F
.99BE:
    jml 0x828387

.99C2:
    lda.b #0x0E
    trb.b 0x11
.99C6:
    jsl 0x82806E
    bcs .99BE

    jml 0x8280B4

.99D0: d16[.99D8, .9A37, .9A48, .9AED]

.99D8:
    jsl 0x82827D
    rep #0x20
    lda.w #0xC93E
    sta.b 0x20
    lda.w #0x0080
    sta.b 0x1C
    sep #0x20
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0xFF
    sta.b 0x2F
    lda.b 0x0B
    and.b #0x40
    tsb.b 0x11
    lda.b 0x0B
    asl
    asl
    rep #0x20
    lda.w #0x0800
    bcc .9A08

    lda.w #0xF800
.9A08:
    sta.b 0x1A
    sep #0x20
    lda.b #0x08
    sta.b 0x34
.9A10:
    jsl 0x82823E
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    bne .9A28

    dec.b 0x34
    bne .9A10

    pla
    pla
    jml 0x828387

.9A28:
    lda.b #0x03
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x00
    jsl 0x848F07
    rts

.9A37:
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .9A43

    cmp.b #0x80
    bpl .9A47

.9A43:
    lda.b #0x04
    sta.b 0x01
.9A47:
    rts

.9A48:
    ldx.b 0x02
    jmp (.9A4D,X)

.9A4D: d16[.9A51, .9ABB]

.9A51:
    lda.w 0x1F0D
    beq .9A92

    stz.b 0x36
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .9A68

    eor.w #0xFFFF
    inc
    inc.b 0x36
.9A68:
    cmp.w #0x0020
    sep #0x20
    bcs .9A92

    lda.b #0x02
    sta.b 0x02
    lda.b 0x36
    clc
    adc.b #0x02
    jsl 0x848F07
    lda.b #0x10
    sta.b 0x35
    lda.b 0x36
    lsr
    rep #0x20
    lda.w #0x0200
    bcs .9A8D

    lda.w #0xFE00
.9A8D:
    sta.b 0x1C
    sep #0x20
    rts

.9A92:
    jsr _829B3B
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .9AA3

    eor.w #0xFFFF
    inc
.9AA3:
    cmp.w #0x0004
    sep #0x20
    bcs .9ABA

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    lda.b #0x01
    jsl 0x848F07
    lda.b #0x30
    sta.b 0x35
.9ABA:
    rts

.9ABB:
    jsr _829B5F
    cmp.b #0x34
    bcs .9AD4

    lda.b 0x36
    eor.b #0x01
    sta.b 0x36
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
.9AD4:
    jsl 0x82825D
    jsl 0x8491BE
    jsl 0x848EEA
    dec.b 0x35
    bne .9AEC

    stz.b 0x02
    lda.b #0x00
    jsl 0x848F07
.9AEC:
    rts

.9AED:
    jsr _829B3B
    jsl 0x848EEA
    dec.b 0x35
    bne .9B3A

    jsl 0x828358
    bne .9B2E

    inc.w 0x0000,X
    lda.b #0x02
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b #0x03
    sta.w 0x0016,X
    rep #0x20
    lda.b 0x08
    sta.w 0x0008,X
    lda.b 0x10
    asl
    asl
    lda.w #0x000C
    bcs .9B28

    lda.w #0xFFF4
.9B28:
    clc
    adc.b 0x05
    sta.w 0x0005,X
.9B2E:
    sep #0x30
    lda.b #0x04
    sta.b 0x01
    lda.b #0x00
    jsl 0x848F07
.9B3A:
    rts

;-----

_829B3B:
    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.b 0x08
    lda.w #0x0080
    bcc .9B4B

    lda.w #0xFF80
.9B4B:
    sta.b 0x1C
    sep #0x20
    jsr _829B5F
    cmp.b #0x34
    bcc .9B5E

    jsl 0x82825D
    jsl 0x8491BE
.9B5E:
    rts

;-----

_829B5F:
    lda.b 0x11
    asl
    asl
    lda.b #0x10
    bcc .9B69

    lda.b #0xF0
.9B69:
    sta.b 0x29
    lda.b 0x1D
    asl
    lda.b #0x10
    bcs .9B74

    lda.b #0xF0
.9B74:
    sta.b 0x2A
    jsl 0x8490A0
    rts

;-----

_829B7B:
    lda.b 0x01
    bne .9BAC

    inc.b 0x01
    lda.b #0x04
    jsl 0x848F07
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0200
    bcs .9B95

    lda.w #0xFE00
.9B95:
    sta.b 0x1A
    lda.w #0xC93A
    sta.b 0x20
    sep #0x20
    lda.b #0x3C
    sta.b 0x35
    lda.b #0x02
    sta.b 0x27
    sta.b 0x26
    sta.b 0x28
    stz.b 0x30
.9BAC:
    jsl 0x848EEA
    jsl 0x82823E
    jsl 0x849B03
    bne .9BC7

    dec.b 0x35
    beq .9BC7

    jsl 0x8280B4
    lda.b 0x0E
    beq .9BC7

    rtl

.9BC7:
    jml 0x8283A3

;-----

    incsrc "obj/spiky.asm"
    incsrc "obj/bomb_been.asm"

;-----

_82A0DE:
    ldx.b 0x01
    jmp (.A0E3,X)

.A0E3: d16[.A0EB, .A10C, .A135, .A14E]

.A0EB:
    jsl 0x82827D
    lda.b #0x06
    sta.b 0x12
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x30
    sta.b 0x37
    rep #0x20
    stz.b 0x33
    stz.b 0x35
    sep #0x20
    jsr _82A171
    jml 0x8280B4

.A10C:
    lda.b 0x02
    bne .A11F

    inc.b 0x35
    dec.b 0x37
    bne .A118

    inc.b 0x02
.A118:
    jsr _82A171
    jml 0x8280B4

.A11F:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .A118

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    lda.b #0x01
    jsl 0x848F07
    bra .A118

.A135:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .A147

    lda.b #0x02
    jsl 0x848F07
    lda.b #0x06
    sta.b 0x01
.A147:
    jsr _82A171
    jml 0x8280B4

.A14E:
    lda.b 0x02
    bne .A160

    jsl 0x848EEA
    lda.b 0x0F
    bpl .A16A

    inc.b 0x02
    lda.b #0x30
    sta.b 0x37
.A160:
    dec.b 0x35
    dec.b 0x37
    bne .A16A

    jml 0x828398

.A16A:
    jsr _82A171
    jml 0x8280B4

;-----

_82A171:
    php
    rep #0x30
    ldx.b 0x0C
    lda.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    sec
    sbc.w #0x0021
    clc
    adc.b 0x35
    sta.b 0x08
    plp
    rts

;-----

_82A189:
    ldx.b 0x01
    jsr (.A1CD,X)
    lda.b 0x27
    beq .A1BE

    jsl 0x849B43
    beq .A1B2

    lda.b 0x27
    and.b #0x7F
    bne .A1A6

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    bra .A1BE

.A1A6:
    lda.b 0x01
    sta.b 0x03
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .A1B8

.A1B2:
    lda.b 0x34
    ora.b 0x11
    sta.b 0x11
.A1B8:
    jsl 0x849B03
    beq .A1BE

.A1BE:
    jsl 0x8280B4
    jsl 0x82806E
    bcc .A1CC

    jsl 0x828398
.A1CC:
    rtl

.A1CD: d16[.A1D5, .A206, .A254, .A2CF]

.A1D5:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x34
    lda.b #0x02
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x3C
    sta.b 0x37
    jsr _82A2E0
    rep #0x20
    lda.w #0xCB27
    sta.b 0x20
    lda.b 0x05
    sta.b 0x3C
    sep #0x20
    lda.b #0x00
    jsl 0x848F07
    rts

.A206:
    ldx.b 0x02
    jsr (.A20C,X)
    rts

.A20C: d16[.A210, .A232]

.A210:
    lda.b #0x04
    sta.b 0x12
    ldx.b 0x33
    lda.b 0x0B
    beq .A221

    rep #0x20
    lda.w 0x00CB19,X
    bra .A226

.A221:
    rep #0x20
    lda.w 0x00CB13,X
.A226:
    clc
    adc.b 0x08
    sta.b 0x38
    sep #0x20
    lda.b #0x02
    sta.b 0x02
    rts

.A232:
    jsl 0x82825D
    rep #0x20
    lda.b 0x08
    cmp.b 0x38
    bne .A24D

    lda.w #0x0004
    sta.b 0x01
    lda.w #0x0000
    sta.b 0x02
    lda.w #0x003C
    sta.b 0x3A
.A24D:
    sep #0x20
    jsl 0x848EEA
    rts

.A254:
    ldx.b 0x02
    jsr (.A25A,X)
    rts

.A25A: d16[.A260, .A282, .A2A7]

.A260:
    dec.b 0x3A
    lda.b 0x3A
    cmp.b #0x28
    bne .A281

    lda.b #0x01
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x02
    lda.b 0x11
    ora.b #0x30
    sta.b 0x11
    rep #0x20
    lda.w #0xCB2C
    sta.b 0x20
    sep #0x20
.A281:
    rts

.A282:
    rep #0x20
    lda.w #0x0080
    sta.w 0x0000
    lda.b 0x3C
    sta.w 0x0002
    sep #0x20
    jsl 0x87A3EC
    beq .A29A

    jsr _82A324
.A29A:
    jsl 0x82823E
    jsl 0x82825D
    jsl 0x848EEA
    rts

.A2A7:
    dec.b 0x3A
    bne .A2BE

    jsr _82A2E0
    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x02
    sta.b 0x02
    lda.b #0x03
    jsl 0x848F07
    bra .A2CE

.A2BE:
    lda.b 0x0F
    cmp.b #0x80
    bne .A2CA

    lda.b #0x02
    jsl 0x848F07
.A2CA:
    jsl 0x848EEA
.A2CE:
    rts

.A2CF:
    jsl 0x84A4AB
    jsl 0x828398
    sep #0x10
    lda.b #0x01
    jsl 0x84A37F
    rts

;-----

_82A2E0:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .A2EF

    lda.w #0x0000
    bra .A2F6

.A2EF:
    lda.b 0x11
    ora.w #0x0040
    sta.b 0x11
.A2F6:
    beq .A2FF

    lda.w #0x0400
    sta.b 0x1A
    bra .A30B

.A2FF:
    lda.b 0x11
    and.w #0x00BF
    sta.b 0x11
    lda.w #0xFC00
    sta.b 0x1A
.A30B:
    ldx.b 0x33
    sep #0x20
    lda.b 0x0B
    beq .A31A

    rep #0x20
    lda.w 0x00CB23,X
    bra .A31F

.A31A:
    rep #0x20
    lda.w 0x00CB1D,X
.A31F:
    sta.b 0x1C
    sep #0x20
    rts

;-----

_82A324:
    rep #0x20
    lda.w #0x0000
    sta.b 0x1A
    lda.w #0xFA00
    sta.b 0x1C
    lda.w #0x0002
    jsl 0x848F07
    sep #0x20
    rts

;-----

_82A33A:
    lda.b 0x3C
    tsb.b 0x11
    ldx.b 0x01
    jsr (.A3A1,X)
    jsl 0x82806E
    bcc .A34D

    jml 0x828387

.A34D:
    lda.b 0x3D
    beq .A35C

    lda.w 0x1F0D
    beq .A35C

    jsl 0x849DC8
    bra .A362

.A35C:
    jsl 0x849B43
    beq .A39D

.A362:
    lda.b 0x27
    and.b #0x7F
    bne .A399

    lda.b #0x0A
    sta.b 0x01
    stz.b 0x03
    lda.b #0x07
    jsl 0x848F07
    lda.b #0x23
    jsl 0x80888B
    lda.b 0x3E
    beq .A384

    jsl 0x849FAD
    stz.b 0x3E
.A384:
    lda.b 0x3B
    beq .A38B

    stz.w 0x0BD8
.A38B:
    lda.b 0x3D
    beq .A399

    lda.b #0x01
    sta.w 0x0BB6
    stz.b 0x3D
    stz.w 0x0BE5
.A399:
    lda.b #0x0E
    trb.b 0x11
.A39D:
    jml 0x8280B4

.A3A1: d16[.A3AD, .A3E3, .A422, .A538, .A5C4, .A68B]

.A3AD:
    jsl 0x82827D
    lda.b #0x02
    sta.b 0x12
    stz.b 0x03
    stz.b 0x3B
    stz.b 0x3D
    stz.b 0x3E
    lda.b #0x00
    jsl 0x848F07
    lda.b #0xFF
    sta.b 0x2F
    lda.b 0x11
    and.b #0x0E
    sta.b 0x3C
    lda.b #0x0A
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    rep #0x20
    lda.w #0xCB31
    sta.b 0x20
    lda.b 0x05
    sta.b 0x31
    sep #0x20
    rts

.A3E3:
    lda.b 0x02
    bne .A40E

    inc.b 0x02
    rep #0x20
    lda.w 0x0BAD
    cmp.b 0x05
    sep #0x20
    lda.b #0x00
    ror
    lsr
    tsb.b 0x11
    and.b #0x40
    rep #0x20
    beq .A403

    lda.w #0x0080
    bra .A406

.A403:
    lda.w #0xFF80
.A406:
    sta.b 0x1A
    sep #0x20
    lda.b #0x1E
    sta.b 0x33
.A40E:
    jsl 0x82823E
    jsl 0x848EEA
    dec.b 0x33
    bne .A41D

    jsr _82A72B
.A41D:
    jsl 0x849B03
    rts

.A422:
    ldx.b 0x02
    jmp (.A427,X)

.A427: d16[.A42D, .A435, .A4FE]

.A42D:
    lda.b #0x02
    sta.b 0x02
    lda.b #0xB4
    sta.b 0x33
.A435:
    jsl 0x848EEA
    dec.b 0x33
    bne .A448

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x34
    stz.b 0x03
    rts

.A448:
    lda.w 0x0BD8
    ora.w 0x1F0C
    bne .A45A

    lda.w 0x0BCF
    beq .A45A

    lda.w 0x0BB6
    bne .A45D

.A45A:
    jmp .A4F9

.A45D:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .A48E

    cmp.w #0x0060
    sep #0x20
    bcs .A481

    lda.b 0x11
    and.b #0x40
    bne .A477

    jmp .A4F9

.A477:
    jsl 0x84A07C
    cmp.b #0x06
    bcc .A4F9

    cmp.b #0x0B
.A481:
    bcs .A4F9

    sta.b 0x35
    lda.w 0x0BD3
    and.b #0x04
    beq .A4B5

    bra .A4B0

.A48E:
    cmp.w #0xFFA0
    sep #0x20
    bcc .A4F9

    lda.b 0x11
    and.b #0x40
    bne .A4F9

    jsl 0x84A07C
    cmp.b #0x16
    bcc .A4F9

    cmp.b #0x1B
    bcs .A4F9

    sta.b 0x35
    lda.w 0x0BD3
    and.b #0x04
    beq .A4B5

.A4B0:
    jsr _82A6A1
    bra .A4B8

.A4B5:
    jsr _82A6A1
.A4B8:
    rep #0x30
    lda.b 0x20
    pha
    lda.w #0xCB3B
    sta.b 0x20
    sep #0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    rep #0x20
    pla
    sta.b 0x20
    sep #0x30
    bcc .A4F9

    lda.b #0x01
    sta.w 0x0BD8
    sta.b 0x3B
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    lda.b #0x10
    sta.w 0x0000
    stz.w 0x0001
    jsr _82A75E
    lda.b #0x01
    jsl 0x848F07
    inc.b 0x3E
    jsl 0x849F85
    rts

.A4F9:
    jsl 0x849B03
    rts

.A4FE:
    lda.b #0x03
    tsb.w 0x0BD4
    jsl 0x84A07C
    sta.b 0x35
    jsr _82A6A1
    jsl 0x848EEA
    lda.b 0x0F
    bpl .A537

    lda.b #0x08
    sta.b 0x01
    stz.b 0x02
    jsl 0x849FAD
    stz.b 0x3E
    stz.w 0x0BB6
    inc.b 0x3D
    lda.b #0x01
    sta.w 0x0BE5
    lda.b #0xB4
    sta.b 0x33
    rep #0x20
    lda.w #0xCB3F
    sta.b 0x20
    sep #0x20
.A537:
    rts

.A538:
    lda.b 0x02
    bne .A58E

    inc.b 0x34
    lda.b 0x34
    cmp.b #0x08
    bcc .A54F

    jsl 0x849086
    lsr
    bcc .A54F

    jsr _82A72B
    rts

.A54F:
    inc.b 0x34
    lda.b #0x1E
    sta.b 0x33
    jsl 0x84A07C
    asl
    asl
    tax
    bit.b #0x40
    beq .A566

    lda.b #0x40
    trb.b 0x11
    bra .A56A

.A566:
    lda.b #0x40
    tsb.b 0x11
.A56A:
    rep #0x20
    lda.w 0x00EE3A,X
    lsr
    lsr
    bit.w #0x2000
    beq .A579

    ora.w #0xC000
.A579:
    sta.b 0x1A
    lda.w 0x00EE3C,X
    lsr
    lsr
    bit.w #0x2000
    beq .A588

    ora.w #0xC000
.A588:
    sta.b 0x1C
    sep #0x20
    inc.b 0x02
.A58E:
    jsr _82A799
    lda.b 0x1D
    bmi .A5A9

    lda.b #0xE8
    sta.b 0x2A
    stz.b 0x29
    jsl 0x8490A0
    cmp.b #0x0D
    beq .A5A9

    jsl 0x82823E
    bra .A5AD

.A5A9:
    jsl 0x82820A
.A5AD:
    jsl 0x8491BE
    lda.b 0x2B
    bne .A5B9

    dec.b 0x33
    bne .A5BB

.A5B9:
    stz.b 0x02
.A5BB:
    jsl 0x848EEA
    jsl 0x849B03
    rts

.A5C4:
    jsl 0x848EEA
    jsr _82A799
    stz.w 0x0C19
    lda.b 0x11
    and.b #0x40
    rep #0x20
    bne .A5DB

    lda.w #0xFF80
    bra .A5DE

.A5DB:
    lda.w #0x0080
.A5DE:
    sta.b 0x1A
    sep #0x20
    jsl 0x82823E
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    bne .A5F4

    lda.b 0x06
    bpl .A5FA

.A5F4:
    lda.b #0x40
    eor.b 0x11
    sta.b 0x11
.A5FA:
    rep #0x20
    lda.b 0x05
    sta.w 0x0BAD
    lda.b 0x08
    sta.w 0x0BB0
    sep #0x30
    dec.b 0x33
    bne .A619

    lda.b #0x02
    sta.w 0x0BCE
    jsl 0x849F25
    lda.b #0xB4
    sta.b 0x33
.A619:
    ldx.b 0x02
    jmp (.A61E,X)

.A61E: d16[.A624, .A650, .A67E]

.A624:
    lda.b #0x07
    tsb.w 0x0BD4
    lda.w 0x0BE3
    bit.b #0x80
    beq .A63E

    lda.b #0x04
    sta.b 0x02
    lda.b #0x04
    jsl 0x848F07
    jsr _82A6E4
    rts

.A63E:
    lda.w 0x0BDF
    and.b #0x03
    beq .A64F

    lda.b #0x02
    sta.b 0x02
    lda.b #0x03
    jsl 0x848F07
.A64F:
    rts

.A650:
    lda.b #0x07
    tsb.w 0x0BD4
    lda.w 0x0BE3
    and.b #0x80
    beq .A66A

    lda.b #0x04
    sta.b 0x02
    lda.b #0x04
    jsl 0x848F07
    jsr _82A6E4
    rts

.A66A:
    lda.b 0x0F
    bpl .A67D

    lda.w 0x0BDF
    and.b #0x03
    bne .A67D

    stz.b 0x02
    lda.b #0x02
    jsl 0x848F07
.A67D:
    rts

.A67E:
    lda.b 0x0F
    bpl .A685

    stz.b 0x02
    rts

.A685:
    lda.b #0x08
    tsb.w 0x0BD4
    rts

.A68B:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .A6A0

    jsl 0x828387
    stz.w 0x0000
    stz.w 0x0001
    jsr _82A75E
.A6A0:
    rts

;-----

_82A6A1:
    php
    sep #0x30
    lda.b 0x35
    asl
    asl
    tax
    rep #0x20
    lda.w 0x0BC2
    sta.b 0x37
    lda.w 0x0BC4
    sta.b 0x39
    lda.w 0x00EE3A,X
    eor.w #0xFFFF
    inc
    sta.w 0x0BC2
    lda.w 0x00EE3C,X
    eor.w #0xFFFF
    inc
    sta.w 0x0BC4
    phd
    pea 0x0BA8
    pld
    jsl 0x82820A
    pld
    lda.b 0x37
    sta.w 0x0BC2
    lda.b 0x39
    bpl .A6DF

    lda.w #0x0000
.A6DF:
    sta.w 0x0BC4
    plp
    rts

;-----

_82A6E4:
    lda.b 0x27
    and.b #0x7F
    sec
    sbc.b #0x02
    sta.b 0x27
    beq .A6F1

    bpl .A726

.A6F1:
    lda.b #0x80
    sta.b 0x27
    lda.b #0x0A
    sta.b 0x01
    lda.b #0x06
    jsl 0x848F07
    lda.b #0x23
    jsl 0x80888B
    lda.b 0x3E
    beq .A70F

    jsl 0x849FAD
    stz.b 0x3E
.A70F:
    lda.b 0x3B
    beq .A718

    stz.w 0x0BD8
    stz.b 0x3B
.A718:
    lda.b 0x3D
    beq .A726

    lda.b #0x01
    sta.w 0x0BB6
    stz.w 0x0BE5
    stz.b 0x3D
.A726:
    lda.b #0x0E
    trb.b 0x11
    rts

;-----

_82A72B:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    inc.b 0x03
    jsl 0x8282D3
    bne .A75B

    inc.w 0x0000,X
    stz.w 0x000B,X
    lda.b #0x17
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
.A75B:
    sep #0x30
    rts

;-----

_82A75E:
    jsl 0x8282D3
    bne .A796

    inc.w 0x0000,X
    lda.b #0x17
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    rep #0x20
    bne .A784

    lda.b 0x05
    sec
    sbc.w 0x0000
    bra .A78A

.A784:
    lda.b 0x05
    clc
    adc.w 0x0000
.A78A:
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.A796:
    sep #0x30
    rts

;-----

_82A799:
    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x31
    bcc .A7B0

    cmp.w #0x0080
    bcc .A7D1

    sep #0x20
    lda.b 0x11
    and.b #0x40
    bne .A7C1

    rts

.A7B0:
    eor.w #0xFFFF
    inc
    cmp.w #0x0080
    bcc .A7D1

    sep #0x20
    lda.b 0x11
    and.b #0x40
    bne .A7D1

.A7C1:
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
.A7D1:
    sep #0x20
    rts

;-----

_82A7D4:
    lda.b 0x35
    tsb.b 0x11
    ldx.b 0x01
    jsr (.A7FE,X)
    lda.b 0x00
    bne .A7E2

    rtl

.A7E2:
    jsl 0x849B43
    beq .A7F6

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .A7F6

    lda.b #0x08
    sta.b 0x01
.A7F6:
    jsl 0x849B03
    jml 0x8280B4

.A7FE: d16[.A808, .A84F, .A873, .A8FD, .A935]

.A808:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x35
    lda.b #0x06
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x00
    jsl 0x848F07
    rep #0x20
    lda.w #0xCB49
    sta.b 0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    stz.b 0x31
    sep #0x20
    lda.b #0x00
    ror
    ror
    tsb.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x000E
    bcc .A847

    lda.w #0xFFF2
.A847:
    clc
    adc.b 0x05
    sta.b 0x05
    sep #0x20
    rts

.A84F:
    jsl 0x848EEA
    jsr _82A951
    bcs .A868

    lda.b #0x01
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    lda.b #0x12
    sta.b 0x33
.A868:
    jsl 0x82806E
    bcc .A872

    jsl 0x828387
.A872:
    rts

.A873:
    jsl 0x848EEA
    lda.b 0x02
    bne .A8CA

    dec.b 0x33
    bne .A8FC

    inc.b 0x02
    jsl 0x828321
    beq .A894

    sep #0x10
    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    lda.b #0x3C
    sta.b 0x33
    rts

.A894:
    inc.w 0x0000,X
    lda.b #0x1F
    sta.w 0x000A,X
    jsl 0x849086
    xba
    lda.b #0x00
    xba
    and.b #0x0F
    tay
    lda 0x00CB4D,Y
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0009
    sta.w 0x0008,X
    sep #0x20
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    stx.b 0x31
    sep #0x10
.A8CA:
    lda.b 0x0F
    beq .A8FC

    lda.b 0x11
    and.b #0x40
    rep #0x30
    beq .A8DE

    lda.b 0x05
    clc
    adc.w #0x0012
    bra .A8E4

.A8DE:
    lda.b 0x05
    sec
    sbc.w #0x0012
.A8E4:
    ldx.b 0x31
    sta.w 0x0005,X
    stz.b 0x31
    sep #0x20
    lda.b #0x04
    sta.w 0x0001,X
    sep #0x10
    lda.b #0x3C
    sta.b 0x33
    lda.b #0x06
    sta.b 0x01
.A8FC:
    rts

.A8FD:
    jsl 0x848EEA
    jsr _82A951
    bcc .A90A

.A906:
    lda.b #0x3C
    sta.b 0x33
.A90A:
    dec.b 0x33
    bne .A92A

    jsl 0x849086
    and.b #0x0F
    tax
    lda.w 0x00CB4D,X
    bne .A906

    lda.b #0x12
    sta.b 0x33
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    lda.b #0x01
    jsl 0x848F07
.A92A:
    jsl 0x82806E
    bcc .A934

    jsl 0x828387
.A934:
    rts

.A935:
    lda.b #0x01
    jsl 0x84A37F
    jsl 0x84A4AB
    rep #0x10
    ldx.b 0x31
    beq .A94A

    lda.b #0x04
    sta.w 0x0001,X
.A94A:
    jsl 0x828387
    sep #0x10
    rts

;-----

_82A951:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    ror
    ror
    eor.b 0x11
    and.b #0x40
    bne .A987

    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .A971

    eor.w #0xFFFF
    inc
.A971:
    cmp.w #0x0040
    sep #0x20
    bcs .A987

    lda.b #0x1F
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x1E
    sta.b 0x0A
    cpy.b #0x0C
    rts

.A987:
    sec
    rts

;-----

_82A989:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x01
    jsr (.A9C9,X)
    lda.b 0x00
    bne .A997

    rtl

.A997:
    jsl 0x849B43
    beq .A9B5

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .A9B5

    lda.b #0x01
    jsl 0x84A37F
.A9AD:
    jsl 0x84A4AB
    jml 0x828398

.A9B5:
    stz.b 0x29
    stz.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcs .A9AD

    jsl 0x849B03
    jml 0x8280B4

.A9C9: d16[.A9D1, .AA22, .AA23, .AA89]

.A9D1:
    lda.b 0x11
    and.b #0x40
    pha
    jsl 0x82827D
    pla
    tsb.b 0x11
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x01
    sta.b 0x27
    lda.b #0x01
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x03
    jsl 0x848F07
    lda.b 0x11
    and.b #0x40
    rep #0x20
    beq .AA0A

    lda.b 0x0B
    asl
    tax
    lda.w 0x00CB67,X
    bra .AA15

.AA0A:
    lda.b 0x0B
    asl
    tax
    lda.w 0x00CB67,X
    eor.w #0xFFFF
    inc
.AA15:
    sta.b 0x1A
    lda.w #0xCB5D
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
.AA22:
    rts

.AA23:
    jsl 0x8281E8
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .AA43

    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
.AA43:
    lda.b 0x2B
    and.b #0x04
    beq .AA7A

    lda.b #0x06
    sta.b 0x01
    lda.b #0x04
    jsl 0x848F07
    stz.b 0x2F
    lda.b #0x40
    trb.b 0x11
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    lda.b #0x00
    ror
    ror
    tsb.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0080
    bcs .AA75

    lda.w #0xFF80
.AA75:
    sta.b 0x1A
    sep #0x20
    rts

.AA7A:
    jsl 0x848EEA
    jsl 0x82806E
    bcc .AA88

    jsl 0x828398
.AA88:
    rts

.AA89:
    jsl 0x82823E
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .AAA9

    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
.AAA9:
    lda.b 0x2B
    and.b #0x04
    bne .AAC1

    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x04
    sta.b 0x01
    lda.b #0x03
    jsl 0x848F07
    lda.b #0xFF
    sta.b 0x2F
.AAC1:
    jsl 0x848EEA
    jsl 0x82806E
    bcc .AACF

    jsl 0x828398
.AACF:
    rts

;-----

    incsrc "obj/amenhopper.asm"

;-----

_82AE11:
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
    jsr _82B67D
    jsr _82B706
    jsr _82B731
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
    jsr _82B40D
    sep #0x30
    rtl

.AEC4:
    rep #0x20
    jsr _82B40D
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
    jsl 0x80888B
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
    jsr _82B759
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
    jsr _82B40D
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
    jmp _82B6A5

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
    jsr _82B630
    lda.w 0x0B9C
    and.b #0x1F
    bne .B0CF

    lda.b #0x31
    ldx.b 0x02
    cpx.b #0x06
    bne .B0CB

    lda.b #0x32
.B0CB:
    jsl 0x80888B
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
    jsr _82B5E1
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
    jmp _82B419

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
    jsr _82B51C
    beq .B251

    inc.b 0x3A
.B251:
    jmp _82B419

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
    jsr _82B51C
    beq .B289

    inc.b 0x3A
.B289:
    jmp _82B419

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
    jsr _82B51C
    beq .B2D1

    inc.b 0x3A
.B2D1:
    jmp _82B419

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
    jsr _82B51C
    beq .B317

    inc.b 0x3A
.B317:
    jmp _82B419

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
    jsr _82B51C
    beq .B33F

    inc.b 0x3A
.B33F:
    jmp _82B419

.B342:
    ldx.b 0x03
    bne .B35C

    inc.b 0x03
    lda.b #0x78
    sta.b 0x16
    lda.b #0x21
    jsl 0x80888B
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

_82B40D:
    lda.w 0x1E50
    sec
    sbc.b 0x34
    sta.w 0x00C4
    rts

.B417:
    plp
    rts

;-----

_82B419:
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
    bmi _82B40D.B417

    cmp.w #0x00E8
    bpl _82B40D.B417

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

_82B51C:
    lda.w 0x0C32
    bne .B588

    rep #0x20
    jsr _82B58B
    jsr _82B5B6
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

_82B58B:
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

_82B5B6:
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

_82B5E1:
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

_82B630:
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

_82B67D:
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

_82B6A5:
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

_82B706:
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

_82B731:
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

_82B759:
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

;-----

_82B7A2:
    lda.w 0x0BCF
    and.b #0x7F
    beq .B7C0

    rep #0x20
    ldx.b #0x1E
.B7AD:
    cpx.b #0x02
    beq .B7B7

    lda.w 0x0400,X
    sta.w 0x0320,X
.B7B7:
    dex
    dex
    bpl .B7AD

    sep #0x20
    inc.w 0x00A1
.B7C0:
    rts

;-----

_82B7C1:
    jsr _82B7F2
    rep #0x20
    ldy.b #0x1E
.B7C8:
    lda.l 0x7FD5FA,X
    sta 0x0320,Y
    dex
    dex
    dey
    dey
    bpl .B7C8

    sep #0x20
    inc.w 0x00A1
    rts

;-----

_82B7DB:
    jsr _82B7F2
    rep #0x20
    ldy.b #0x1E
.B7E2:
    lda 0x0320,Y
    sta.l 0x7FD5FA,X
    dex
    dex
    dey
    dey
    bpl .B7E2

    sep #0x20
    rts

;-----

_82B7F2:
    lda.b 0x0B
    and.b #0x7F
    asl
    asl
    asl
    asl
    asl
    clc
    adc.b #0x1E
    tax
    rts

;-----

_82B800:
    ldx.b #0x02
    ldy.b #0x04
.B804:
    rep #0x20
    lda 0x00CBE0,Y
    clc
    adc.b 0x05
    sta.b 0x05
    lda 0x00CBE2,Y
    clc
    adc.b 0x08
    sec
    sbc.w #0x0020
    sta.b 0x08
    sep #0x20
    lda.w 0x00CBEC,X
    phx
    phy
    jsl 0x84A37F
    ply
    plx
    dey
    dey
    dex
    bpl .B804

    sep #0x20
    rts

;-----

_82B82F:
    lda.w 0x0B9C
    and.b #0x03
    bne .B85F

    jsl 0x8282D3
    bne .B85D

    inc.w 0x0000,X
    lda.b #0x20
    sta.w 0x000A,X
    rep #0x21
    lda.b 0x08
    adc.w #0x0030
    sta.w 0x0008,X
    jsl 0x849086
    and.w #0x003F
    clc
    adc.b 0x05
    sta.w 0x0005,X
    sep #0x20
.B85D:
    sep #0x10
.B85F:
    rts

;-----

_82B860:
    jsl 0x828358
    bne .B88C

    inc.w 0x0000,X
    lda.b #0x12
    sta.w 0x000A,X
    stz.w 0x000B,X
    stx.b 0x36
    rep #0x21
    lda.b 0x05
    adc.w #0xFFF8
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0007
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
    sep #0x22
.B88C:
    sep #0x10
    rts

;-----

    incsrc "obj/bee_blader.asm"

;-----

_82BD64:
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
    jsr _82C2B6
    jsr _82C305
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
    jsr _82C27D
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
    jsr _82C35C
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
    jsl 0x82825D
    jsl 0x848EEA
    jmp _82C37E

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
    jsl 0x82825D
    jsl 0x848EEA
    jmp _82C37E

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
    jsr _82C35C
.BFA2:
    jsl 0x82825D
    jmp _82C37E

.BFA9:
    dec.b 0x36
    bne .BFB5

    lda.b #0x06
    sta.b 0x03
    lda.b #0x78
    sta.b 0x36
.BFB5:
    jmp _82C37E

.BFB8:
    dec.b 0x36
    bne .BFC4

    stz.b 0x39
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.BFC4:
    jsl 0x82820A
    jmp _82C37E

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
    jsl 0x82823E
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
    jsl 0x80888B
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
    jsr _82C255
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
    jsr _82C255
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
    jsr _82C32A
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
    jsr _82C27D
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

_82C255:
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

_82C27D:
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

_82C2B6:
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

_82C305:
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

_82C32A:
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

_82C35C:
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

_82C37E:
    lda.w 0x0B9C
    and.b #0x0F
    bne .C38B

    lda.b #0x35
    jsl 0x80888B
.C38B:
    rts

;-----

_82C38C:
    ldx.b 0x01
    jmp (.C391,X)

.C391: d16[.C397, .C3B7, .C402]

.C397:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x12
    lda.b #0x18
    sta.b 0x27
    sta.b 0x2F
    lda.l 0x7F822E
    sta.b 0x18
    stz.b 0x28
    lda.b #0x30
    sta.b 0x16
    lda.b #0x06
    jml 0x848F07

.C3B7:
    stz.b 0x2C
    lda.l 0x7F832E
    sta.b 0x11
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    and.b #0x7F
    bne .C3CF

    lda.b #0x04
    sta.b 0x01
    rtl

.C3CF:
    lda.w 0x003C,X
    beq .C3D4

.C3D4:
    ldx.w #0xCCCF
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .C3E7

    jsr _82C533
.C3E7:
    jsr _82C6B9
    lda.b 0x2C
    beq .C3F2

    jsl 0x82C70E
.C3F2:
    lda.b #0xC5
    sta.b 0x20
    lda.b #0xCC
    sta.b 0x21
    jsl 0x849B43
    jml 0x8280B4

.C402:
    ldx.b 0x02
    jsr (.C429,X)
    lda.w 0x0B9C
    lsr
    bcc .C415

    lda.b 0x00
    beq .C415

    jml 0x8280B4

.C415:
    dec.b 0x37
    bne .C428

    jsl 0x849086
    and.b #0x03
    tax
    lda.w 0x00CD08,X
    sta.b 0x37
    jsr _82C500
.C428:
    rtl

.C429: d16[.C431, .C440, .C49C, .C4A7]

.C431:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x3C
    sta.b 0x36
    lda.b #0x08
    sta.b 0x37
    jmp _82C6B9

.C440:
    dec.b 0x36
    bne .C46A

    lda.b #0x04
    sta.b 0x02
    lda.b 0x0B
    lsr
    tax
    lda.w 0x00CD01,X
    sta.b 0x36
    rep #0x20
    lda.w #0xCCC5
    sta.b 0x20
    lda.b 0x05
    sec
    sbc.b 0x22
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x08
    sta.b 0x1E
    rts

.C46A:
    rep #0x20
    lda.b 0x08
    sec
    sbc.b 0x24
    bne .C474

    inc
.C474:
    sta.b 0x1C
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .C499

    jsl 0x84A4AB
    lda.b #0x3C
    jsl 0x84A333
    lda.b 0x0A
    cmp.b #0x25
    bne .C495

    jsr _82C4E5
.C495:
    jsl 0x828398
.C499:
    jmp _82C6B9

.C49C:
    dec.b 0x36
    bne .C4A4

    lda.b #0x06
    sta.b 0x02
.C4A4:
    jmp _82C6B9

.C4A7:
    jsl 0x828174
    rep #0x20
    lda.w #0xFE00
    cmp.b 0x1C
    bmi .C4B6

    sta.b 0x1C
.C4B6:
    lda.w 0x1E5C
    clc
    adc.w #0x0140
    cmp.b 0x08
    sep #0x20
    bcc .C4CD

    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .C4E4

.C4CD:
    jsl 0x84A4AB
    lda.b #0x3C
    jsl 0x84A333
    lda.b 0x0A
    cmp.b #0x25
    bne .C4E0

    jsr _82C4E5
.C4E0:
    jsl 0x828398
.C4E4:
    rts

;-----

_82C4E5:
    php
    ldx.b #0x06
.C4E8:
    rep #0x21
    lda.b 0x05
    adc.w #0x0002
    sta.b 0x05
    sep #0x20
    lda.b #0x01
    phx
    jsl 0x84A37F
    plx
    dex
    bne .C4E8

    plp
    rts

;-----

_82C500:
    jsl 0x8282D3
    bne .C530

    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    lda.b #0x03
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x08
    adc.w #0x0010
    sta.w 0x0008,X
    jsl 0x849086
    and.w #0x001F
    clc
    adc.b 0x05
    sec
    sbc.w #0x0010
    sta.w 0x0005,X
    sep #0x20
.C530:
    sep #0x10
    rts

;-----

_82C533:
    lda.w 0x0BCF
    and.b #0x7F
    bne .C53B

    rts

.C53B:
    rep #0x30
    lda.w 0x0BAD
    sec
    sbc.w 0x0BCA
    sta.w 0x0008
    lda.w 0x0BB0
    clc
    adc.w #0x0009
    cmp.b 0x08
    bcc .C5A0

    lda.w 0x0BB0
    clc
    adc.w #0xFFE5
    cmp.b 0x08
    bcs .C5A0

    lda.w 0x0008
    sta.w 0x000A
    bpl .C574

    jsr _82C69F
    beq .C584

    stz.w 0x000A
    jsr _82C685
    beq .C584

    bra .C5A0

.C574:
    jsr _82C685
    beq .C584

    lda.w #0xFFFF
    sta.w 0x000A
    jsr _82C69F
    bne .C5A0

.C584:
    ldx.w #0x0002
    lda.w #0x0001
    ldy.w 0x000A
    bmi .C595

    lda.w #0xFFFF
    ldx.w #0x0001
.C595:
    clc
    adc.w 0x0BAD
    sta.w 0x0BAD
    txa
    tsb.w 0x0BD4
.C5A0:
    lda.w 0x0BB0
    cmp.w 0x0BCC
    beq .C5AC

    bpl .C5DE

    bra .C5B5

.C5AC:
    lda.w 0x0BC4
    beq .C5DE

    bpl .C5B5

    bra .C5DE

.C5B5:
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    clc
    adc.w #0x0017
    cmp.w #0x002E
    bcs .C5DE

    lda.w 0x0BB0
    clc
    adc.w #0xFFEE
    cmp.b 0x08
    bcc .C5DE

    lda.b 0x08
    clc
    adc.w #0x0010
    sta.w 0x0BB0
    lda.w #0x0008
    tsb.w 0x0BD4
.C5DE:
    ldx.w #0x0004
    lda.w 0x0BD7
    and.w #0x00FF
    beq .C5EC

    ldx.w #0x0000
.C5EC:
    stx.w 0x000E
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    clc
    adc.w #0x000F
    cmp.w #0x001E
    bcs .C645

    lda.w 0x0BAD
    sec
    sbc.b 0x05
    clc
    adc.w #0x0010
    tax
    lda.w 0x00CCD3,X
    ora.w #0xFF00
    clc
    adc.b 0x08
    sta.w 0x000A
    lda.w 0x0BB0
    clc
    adc.w #0x0010
    clc
    adc.w 0x000E
    sta.w 0x0000
    cmp.w 0x000A
    bcc .C645

    lda.b 0x08
    clc
    adc.w #0x0010
    cmp.w 0x0000
    bcc .C645

    lda.w 0x000A
    sec
    sbc.w #0x000F
    sta.w 0x0BB0
    lda.w #0x0004
    tsb.w 0x0BD4
    tsb.b 0x2C
.C645:
    sep #0x30
    rts

;-----

_82C648:
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    clc
    adc.w #0x0017
    cmp.w #0x002E
    bcs _82C533.C645

    lda.w 0x0BB0
    clc
    adc.w #0x0010
    clc
    adc.w 0x000E
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0010
    cmp.w 0x0000
    bcc _82C533.C645

    lda.b 0x08
    cmp.w 0x0000
    bcs _82C533.C645

    adc.w #0xFFF1
    sta.w 0x0BB0
    lda.w #0x0004
    tsb.w 0x0BD4
    bra _82C533.C645

;-----

_82C685:
    lda.w #0x000A
    clc
    adc.w 0x0BAD
    sec
    sbc.b 0x05
    clc
    adc.w #0x0010
    cmp.w #0x0020
    beq .C69B

    bcc .C69B

    rts

.C69B:
    lda.w #0x0000
    rts

;-----

_82C69F:
    lda.w #0xFFF6
    clc
    adc.w 0x0BAD
    sec
    sbc.b 0x05
    clc
    adc.w #0x0010
    cmp.w #0x0020
    beq .C6B5

    bcc .C6B5

    rts

.C6B5:
    lda.w #0x0000
    rts

;-----

_82C6B9:
    rep #0x30
    lda.b 0x0B
    and.w #0x00FF
    tay
    ldx.b 0x0C
    lda.w 0x0034,X
    sec
    sbc 0x00CCF3,Y
    and.w #0x03FF
    tax
    lda.l 0x7FD200,X
    sta.b 0x05
    lda.l 0x7FD202,X
    sta.b 0x08
    sep #0x20
    lda.l 0x7FD204,X
    and.b #0x40
    sta.w 0x0000
    lda.b 0x11
    and.b #0x3F
    ora.w 0x0000
    sta.b 0x11
    ldy.w #0x0012
    lda.b 0x0B
    cmp.b #0x0C
    beq .C6FA

    ldy.w #0x0009
.C6FA:
    sty.w 0x0000
    lda.l 0x7FD204,X
    and.b #0x3F
    clc
    adc.w 0x0000
    jsl 0x848F07
    sep #0x10
    rts

;-----

_82C70E:
    php
    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x22
    clc
    adc.w 0x0BAD
    sta.w 0x0BAD
    lda.b 0x08
    sec
    sbc.b 0x24
    clc
    adc.w 0x0BB0
    sta.w 0x0BB0
    sep #0x20
    plp
    rtl

;-----

_82C72D:
    ldx.b 0x01
    jmp (.C732,X)

.C732: d16[.C738, .C764, _82C38C.C402]

.C738:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x12
    lda.b #0x48
    sta.b 0x27
    lda.b #0x04
    sta.b 0x26
    lda.b #0x06
    sta.b 0x28
    lda.b #0x0C
    sta.b 0x0B
    sta.b 0x2F
    stz.b 0x3C
    lda.l 0x7F822E
    sta.b 0x18
    lda.b #0x30
    sta.b 0x16
    lda.b #0x0C
    jml 0x848F07

.C764:
    lda.l 0x7F832E
    sta.b 0x11
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    and.b #0x7F
    bne .C77E

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    rtl

.C77E:
    lda.w 0x003C,X
    beq .C78A

    stz.w 0x003C,X
    lda.b #0x0E
    trb.b 0x11
.C78A:
    sep #0x10
    ldx.b 0x02
    jsr (.C7CA,X)
    jsr _82C6B9
    rep #0x21
    lda.b 0x0F
    and.w #0x000F
    adc.w #0xCD0C
    sta.b 0x20
    sep #0x20
    jsl 0x849B43
    beq .C7C2

    lda.b 0x27
    and.b #0x7F
    bne .C7B4

    lda.b #0x02
    sta.b 0x02
    bra .C7C2

.C7B4:
    rep #0x10
    ldx.b 0x0C
    lda.b 0x27
    sta.w 0x0027,X
    sta.w 0x003C,X
    sep #0x10
.C7C2:
    jsl 0x849B03
    jml 0x8280B4

.C7CA: d16[.C7CE, .C7CF]

.C7CE:
    rts

.C7CF:
    ldx.b 0x03
    bne .C7E6

    inc.b 0x03
    jsl 0x84A4AB
    lda.b #0x04
    sta.b 0x36
    lda.b #0x30
    sta.b 0x34
    lda.b #0x02
    sta.b 0x35
    rts

.C7E6:
    dec.b 0x36
    bne .C832

    lda.b #0x04
    sta.b 0x36
    rep #0x30
    lda.w #0x0508
    sta.w 0x0004
    ldx.b 0x0C
    lda.b 0x34
    sec
    sbc.w #0x0028
    sta.b 0x34
    bpl .C814

    sep #0x20
    lda.b #0x04
    sta.w 0x0001,X
    stz.w 0x0002,X
    stz.w 0x0003,X
    stz.w 0x0027,X
    bra .C830

.C814:
    lda.w 0x0034,X
    sec
    sbc.b 0x34
    and.w #0x03FF
    tax
    lda.l 0x7FD200,X
    sta.w 0x0000
    lda.l 0x7FD202,X
    sta.w 0x0002
    jsl 0x84A462
.C830:
    sep #0x30
.C832:
    rts

;-----

_82C833:
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
    jsl 0x848F07
    rtl

.C88B:
    ldx.b 0x02
    jsr (.C894,X)
    jmp 0x8280B4

    rtl

.C894: d16[.C89A, .C8B4, .C8D4]

.C89A:
    lda.w 0x1F3F
    beq .C8B3

    jsl 0x849FE6
    lda.b #0x02
    sta.b 0x02
    lda.b #0x05
    jsl 0x848F07
    lda.b #0x7E
    jsl 0x80888B
.C8B3:
    rts

.C8B4:
    lda.b 0x0F
    bmi .C8BF

    jsl 0x848EEA
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
    jsl 0x848F07
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
    jsl 0x8088B6
    jmp .C907

.C8F0:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    stz.b 0x38
    stz.w 0x1F1D
    lda.b #0x1E
    jsl 0x80878B
    jsl 0x849FFE
.C907:
    jsl 0x848EEA
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
    jsl 0x848F07
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
    jsl 0x849B03
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
    jsl 0x848F07
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
    jsl 0x848F07
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
    jsr _82D0E7
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

    jsl 0x848EEA
.CA59:
    lda.b 0x0F
    and.b #0x02
    beq .CA63

    jsl 0x8281E8
.CA63:
    jsl 0x8491BE
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
    jsl 0x848F07
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
    jsl 0x848F07
    lda.b #0x0E
    sta.b 0x03
    jmp .CAAB

.CAA5:
    lda.b #0x11
    jsl 0x848F07
.CAAB:
    sep #0x20
    rts

.CAAE:
    lda.b 0x0F
    bmi .CAB9

    jsl 0x848EEA
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
    jsl 0x8281E8
    jsl 0x8491BE
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
    jsl 0x848F07
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
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x03
.CB26:
    sep #0x20
    rts

.CB29:
    lda.b 0x0F
    bmi .CB34

    jsl 0x848EEA
    jmp .CB37

.CB34:
    jsr _82D137
.CB37:
    rts

.CB38:
    jsl 0x848EEA
    jsl 0x8281E8
    rep #0x20
    lda.b 0x1C
    cmp.w #0xF700
    bpl .CB4E

    lda.w #0xF700
    sta.b 0x1C
.CB4E:
    sep #0x20
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .CB64

    lda.b #0x0B
    jsl 0x848F07
    lda.b #0x0C
    sta.b 0x03
.CB64:
    rts

.CB65:
    lda.b 0x0F
    bmi .CB70

    jsl 0x848EEA
    jmp .CB73

.CB70:
    jsr _82D137
.CB73:
    rts

.CB74:
    lda.b 0x0F
    bpl .CB8B

    lda.b #0x01
    sta.b 0x35
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
    jmp .CB8F

.CB8B:
    jsl 0x848EEA
.CB8F:
    rts

.CB90:
    ldx.b 0x03
    jsr (.CB96,X)
    rts

.CB96: d16[.CB9A, .CBB4]

.CB9A:
    lda.b #0x05
    jsl 0x848F07
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
    jsl 0x848EEA
    jmp .CC6E

.CC5C:
    sep #0x10
    lda.b #0x0F
    sta.b 0x35
    lda.b #0x00
    jsl 0x848F07
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
    jsl 0x848F07
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
    jsl 0x849086
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
    jsl 0x8088B6
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
    jsl 0x848EEA
    jmp .CDB4

.CD8F:
    lda.b 0x36
    beq .CDA4

    lda.b #0x28
    sta.b 0x35
    lda.b #0x04
    sta.b 0x03
    lda.b #0x00
    jsl 0x848F07
    jmp .CDB4

.CDA4:
    lda.b #0x0F
    sta.b 0x35
    lda.b #0x00
    jsl 0x848F07
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
    jsl 0x848F07
    jmp .CDD4

.CDD0:
    jsl 0x848EEA
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
    jsl 0x848F07
    lda.b #0x02
    sta.b 0x03
    rts

.CE0B:
    lda.b 0x0F
    beq .CE16

    jsl 0x848EEA
    jmp .CE1A

.CE16:
    lda.b #0x04
    sta.b 0x03
.CE1A:
    rts

.CE1B:
    jsl 0x82823E
    jsl 0x848EEA
    jsl 0x8491BE
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
    jsl 0x848F07
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
    jsl 0x848F07
    rts

.CEC1:
    jsl 0x879ED4
    jsl 0x8491BE
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
    jsr _82D148
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
    jsl 0x848EEA
    rts

.CFCB:
    ldx.b 0x03
    jsr (.CFD1,X)
    rts

.CFD1: d16[.CFD7, .CFDF, .D01D]

.CFD7:
    jsr _82D188
    lda.b #0x02
    sta.b 0x03
    rts

.CFDF:
    jsl 0x848EEA
    jsl 0x8281E8
    jsl 0x8491BE
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
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x03
.D01C:
    rts

.D01D:
    lda.b 0x0F
    bpl .D025

    jsl 0x848EEA
.D025:
    lda.b #0x01
    sta.b 0x35
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
    lda.b #0x00
    jsl 0x848F07
    rts

.D036:
    ldx.b 0x02
    jsr (.D043,X)
    lda.b 0x3B
    bne .D042

    jmp 0x8280B4

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
    jsl 0x848F07
    jsr _82D188
    lda.b #0x02
    sta.b 0x02
    stz.b 0x35
.D06C:
    rts

.D06D:
    jsl 0x848EEA
    lda.b 0x35
    bne .D0AF

    jsl 0x8281E8
    jsl 0x8491BE
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

    jsr _82D151
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

_82D0E7:
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

_82D137:
    stz.b 0x03
    lda.b #0x0A
    sta.b 0x02
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x35
    rts

;-----

_82D148:
    jsl 0x849086
    and.b #0x0F
    sta.b 0x36
    rts

;-----

_82D151:
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

_82D188:
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

;-----

    incsrc "obj/ball_de_voux.asm"

;-----

_82D519:
    ldx.b 0x01
    jmp (.D51E,X)

.D51E: d16[.D526, .D576, .D5F8, .D781]

.D526:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x10
    lda.b #0x40
    sta.b 0x27
    lda.b #0x01
    sta.b 0x0E
    lda.b #0x08
    sta.b 0x28
    stz.b 0x11
    stz.b 0x17
    rep #0x20
    lda.b 0x0B
    and.w #0x00FF
    asl
    asl
    tax
    lda.w 0x00CDB1,X
    sta.b 0x05
    lda.w 0x00CDB3,X
    sta.b 0x08
    lda.w 0x00CDB5,X
    sta.b 0x12
    lda.w 0x00CDB7,X
    sta.b 0x14
    stz.b 0x1A
    lda.w #0x0040
    sta.b 0x1C
    sep #0x20
    jsr _82D8E2
    jsr _82B7DB
    stz.b 0x1F
    lda.b #0x01
    sta.b 0x1E
    lda.b #0x41
    sta.b 0x0F
    stz.b 0x16
    rtl

.D576:
    stz.b 0x30
    jsl 0x82806E
    bcc .D580

    inc.b 0x30
.D580:
    stz.b 0x2C
    jsr _82D97A
    jsr _82D9AB
    rep #0x10
    ldx.w #0xCD7D
    stx.b 0x20
    jsl 0x82D7D0
    jsr _82D875
    ldx.w #0xCD91
    stx.b 0x20
    jsl 0x82D7D0
    jsr _82D875
    ldx.w #0xCD9D
    stx.b 0x20
    jsl 0x82D7D0
    jsr _82D875
    ldx.w #0xCD95
    stx.b 0x20
    jsl 0x82D7D0
    jsr _82D875
    sep #0x10
    jsr _82D785
    jsr _82D7B7
    lda.b 0x2C
    beq .D5CA

    jsl 0x82C70E
.D5CA:
    lda.b 0x17
    beq .D5D3

    stz.b 0x17
    jsr _82B7C1
.D5D3:
    rep #0x10
    ldx.w #0xCD91
    stx.b 0x20
    jsl 0x849B43
    beq .D5F0

    bpl .D5EB

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    stz.b 0x27
    rtl

.D5EB:
    inc.b 0x17
    jsr _82B7A2
.D5F0:
    rep #0x10
    ldx.w #0xCD7D
    stx.b 0x20
    rtl

.D5F8:
    rep #0x10
    stz.b 0x2C
    ldx.w #0xCD7D
    stx.b 0x20
    jsl 0x82D7D0
    jsr _82D875
    ldx.w #0xCD95
    stx.b 0x20
    jsl 0x82D7D0
    jsr _82D875
    ldx.w #0xCD91
    stx.b 0x20
    jsl 0x82D7D0
    jsr _82D875
    ldx.w #0xCD9D
    stx.b 0x20
    jsl 0x82D7D0
    jsr _82D875
    sep #0x10
    ldx.b 0x02
    jsr (.D63F,X)
    jsr _82D7B7
    lda.b 0x2C
    beq .D63E

    jsl 0x82C70E
.D63E:
    rtl

.D63F: d16[.D649, .D66C, .D6FE, .D722, .D738]

.D649:
    lda.b #0x02
    sta.b 0x02
    stz.b 0x1F
    lda.b #0x08
    sta.b 0x1E
    lda.b #0x21
    jsl 0x80888B
    lda.b #0x14
    sta.b 0x33
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x3C
    sta.b 0x35
    stz.b 0x2F
    rts

.D66C:
    rep #0x20
    lda.w #0xFC00
    cmp.b 0x1C
    bmi .D677

    sta.b 0x1C
.D677:
    lda.w #0xFFA0
    sta.w 0x0000
    stz.w 0x0002
    lda.w #0x007F
    sta.w 0x0004
    lda.w #0x003F
    sta.w 0x0006
    sep #0x20
    lda.b #0x07
    sta.w 0x0008
    jsl 0x84A4C6
    lda.b 0x35
    beq .D6A5

    dec.b 0x35
    bne .D6A5

    lda.b #0x06
    jsl 0x848000
.D6A5:
    jsr _82D8A2
    jsl 0x828174
    lda.b 0x33
    cmp.b #0x18
    bne .D6B5

    jsr _82D971
.D6B5:
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .D6FD

    lda.b 0x33
    cmp.b #0x18
    bne .D6E6

    lda.b #0x04
    sta.b 0x02
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x03
    sta.b 0x1D
    lda.b #0x20
    sta.b 0x1E
    ldx.b #0x05
    ldy.b #0x02
    lda.b #0x78
    jsl 0x84A33C
    lda.b #0x25
    jsl 0x80888B
    rts

.D6E6:
    jsl 0x848000
    inc.b 0x33
    lda.b #0x25
    jsl 0x80888B
    stz.b 0x1C
    stz.b 0x1D
    jsl 0x84A333
    jmp _82D907

.D6FD:
    rts

.D6FE:
    jsr _82D971
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .D71D

    lda.b #0x06
    sta.b 0x02
    lda.b #0x25
    jsl 0x80888B
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x02
    sta.b 0x1D
.D71D:
    jsl 0x828174
    rts

.D722:
    jsr _82D971
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x04
    beq .D733

    lda.b #0x08
    sta.b 0x02
.D733:
    jsl 0x828174
    rts

.D738:
    lda.b #0x25
    jsl 0x80888B
    rep #0x21
    lda.b 0x05
    adc.w #0xFF98
    sta.w 0x002C
    lda.b 0x08
    clc
    adc.w #0x0008
    sta.w 0x002E
    sep #0x20
    lda.b 0x0B
    asl
    inc
    jsl 0x848011
    rep #0x21
    lda.b 0x0B
    and.w #0x00FF
    asl
    asl
    tax
    lda.w 0x00CDB9,X
    sta.w 0x002C
    lda.w 0x00CDBB,X
    sta.w 0x002E
    sep #0x20
    lda.b 0x0B
    asl
    inc
    inc
    jsl 0x848011
    lda.b #0x06
    sta.b 0x01
    rts

.D781:
    jsr _82D7B7
    rtl

;-----

_82D785:
    ldx.b 0x16
    bne .D7A0

    dec.b 0x0F
    bne .D79B

    lda.b #0x41
    sta.b 0x0F
    inc.b 0x16
    lda.b #0xC0
    sta.b 0x1C
    lda.b #0xFF
    sta.b 0x1D
.D79B:
    jsl 0x828174
    rts

.D7A0:
    dec.b 0x0F
    bne .D7B2

    lda.b #0x41
    sta.b 0x0F
    stz.b 0x16
    lda.b #0x40
    sta.b 0x1C
    lda.b #0x00
    sta.b 0x1D
.D7B2:
    jsl 0x8281B2
    rts

;-----

_82D7B7:
    lda.b 0x10
    beq .D7CF

    rep #0x20
    lda.w 0x1E8D
    sta.w 0x1EAA
    lda.w 0x1E90
    sta.w 0x1EAC
    tdc
    sta.w 0x1F2E
    sep #0x20
.D7CF:
    rts

;-----

_82D7D0:
    php
    sep #0x20
    rep #0x10
    lda.w 0x0BCF
    and.b #0x7F
    beq .D7E5

    ldx.w #0x0BA8
    jsl 0x849C0E
    bcs .D7E7

.D7E5:
    plp
    rtl

.D7E7:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.w 0x0BCA
    sta.w 0x0008
    lda.w 0x0006
    cmp.w #0x0008
    bcc .D823

    ldx.w #0x0002
    lda.w 0x0004
    cmp.w #0x0008
    bcc .D809

    lda.w #0x0007
.D809:
    dec
    ldy.w 0x0000
    bpl .D816

    ldx.w #0x0001
    eor.w #0xFFFF
    inc
.D816:
    clc
    adc.w 0x0BAD
    sta.w 0x0BAD
    txa
    tsb.w 0x0BD4
    bra .D873

.D823:
    ldx.w #0x0008
    ldy.w 0x0002
    bpl .D845

    lda.w #0x0001
    tsb.b 0x2C
    ldx.w #0x0004
    lda.w 0x0006
    cmp.w #0x0004
    bcc .D83E

    lda.w #0x0003
.D83E:
    dec
    eor.w #0xFFFF
    inc
    bra .D868

.D845:
    sep #0x20
    lda.b 0x2C
    bmi .D85B

    lda.w 0x0BD3
    bit.b #0x04
    beq .D85B

    lda.b #0x7F
    sta.w 0x0BCE
    jsl 0x849F2A
.D85B:
    rep #0x20
    lda.w 0x0006
    cmp.w #0x0004
    bcc .D868

    lda.w #0x0003
.D868:
    clc
    adc.w 0x0BB0
    sta.w 0x0BB0
    txa
    tsb.w 0x0BD4
.D873:
    plp
    rtl

;-----

_82D875:
    php
    rep #0x10
    ldx.b 0x20
    phx
    ldx.w #0xCD99
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .D89D

    lda.b #0x80
    tsb.w 0x0BD4
    lda.b #0x40
    tsb.w 0x0BD4
    ldy.w 0x0000
    bpl .D89D

    lda.b #0x40
    trb.w 0x0BD4
.D89D:
    plx
    stx.b 0x20
    plp
    rts

;-----

_82D8A2:
    lda.w 0x0B9C
    and.b #0x03
    bne .D8DF

    jsl 0x8282D3
    bne .D8DF

    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    lda.b #0x03
    sta.w 0x000B,X
    rep #0x21
    jsl 0x849086
    and.w #0x007F
    sta.w 0x0000
    lda.b 0x05
    adc.w #0xFFC0
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0040
    sta.w 0x0008,X
    sep #0x20
.D8DF:
    sep #0x10
    rts

;-----

_82D8E2:
    rep #0x10
    ldy.w #0x0001
.D8E7:
    jsl 0x8282D3
    bne .D904

    inc.w 0x0000,X
    lda.b #0x26
    sta.w 0x000A,X
    tya
    sta.w 0x000B,X
    rep #0x21
    tdc
    sta.w 0x000C,X
    sep #0x20
    dey
    bpl .D8E7

.D904:
    sep #0x10
    rts

;-----

_82D907:
    rep #0x10
    ldy.w #0x001E
.D90C:
    jsl 0x8282D3
    bne .D96E

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    jsl 0x849086
    and.b #0x0F
    sta.w 0x0000
    stz.w 0x0001
    and.b #0x03
    clc
    adc.b #0x2A
    sta.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    rep #0x21
    lda 0x00CDBD,Y
    adc.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0040
    sta.w 0x0008,X
    lda 0x00CDBD,Y
    asl
    asl
    asl
    sta.w 0x001A,X
    jsl 0x849086
    xba
    and.w #0x0180
    clc
    adc.w #0x0100
    sta.w 0x001C,X
    lda.w #0x0030
    sta.w 0x001E,X
    sep #0x20
    dey
    dey
    bpl .D90C

.D96E:
    sep #0x10
    rts

;-----

_82D971:
    lda.b #0xA7
    sta.b 0x20
    lda.b #0xCD
    sta.b 0x21
    rts

;-----

_82D97A:
    dec.b 0x34
    bne .D9AA

    lda.b #0x78
    sta.b 0x34
    jsl 0x828321
    bne .D9A8

    inc.w 0x0000,X
    lda.b #0x49
    sta.w 0x000A,X
    lda.b #0x81
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x05
    adc.w #0x0014
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0000
    sta.w 0x0008,X
.D9A8:
    sep #0x30
.D9AA:
    rts

;-----

_82D9AB:
    rep #0x10
    ldy.w #0x0005
.D9B0:
    lda 0x1F3F,Y
    bne .D9E2

    jsl 0x828321
    bne .D9E5

    inc.w 0x0000,X
    lda.b #0x4B
    sta.w 0x000A,X
    sta 0x1F3F,Y
    tya
    sta.w 0x000B,X
    phy
    rep #0x20
    and.w #0x00FF
    asl
    asl
    tay
    lda 0x00CDDD,Y
    sta.w 0x0005,X
    lda 0x00CDDF,Y
    sta.w 0x0008,X
    sep #0x20
    ply
.D9E2:
    dey
    bpl .D9B0

.D9E5:
    sep #0x10
    rts

;-----

    incsrc "obj/gun_volt.asm"

;-----

_82DB76:
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
    jsl 0x80878B
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
    jsl 0x8088B6
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
    jsl 0x80878B
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
    jsl 0x80888B
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
    jsl 0x80888B
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
    jsr _82E1B2
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
    jsl 0x8088B6
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
    jsr _82E0EF
.DDFA:
    jsr _82E0B2
    rts

.DDFE:
    lda.b 0x2F
    bne .DE0C

    lda.b #0x43
    jsl 0x8088B6
    lda.b #0x04
    sta.b 0x2F
.DE0C:
    dec.b 0x2F
    jsl 0x82823E
    jsl 0x848EEA
    jsr _82E0EF
    jsr _82E0B2
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
    jsr _82E17D
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
    jsl 0x808868
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
    jsr _82E27C
    sep #0x30
    plb
    lda.b #0x3F
    sta.w 0x00CA
    stz.w 0x00CB
    lda.b #0x01
    sta.b 0x0C
    jsr _82E212
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
    jsl 0x8088B6
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

    jsr _82E212
    jml 0x8280B4

.E077:
    jsr _82E239
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

_82E0B2:
    lda.b #0x2B
    sta.b 0x0A
    jsr _82E17D
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

_82E0EF:
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

_82E17D:
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

_82E1B2:
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

_82E212:
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

_82E239:
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

_82E27C:
    ldx.w #0x00DE
    lda.w #0x0000
.E282:
    sta.l 0x7FD000,X
    dex
    dex
    bpl .E282

    rts

;-----

_82E28B:
    ldx.b 0x01
    jsr (.E2A4,X)
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0001,X
    cmp.b #0x06
    bne .E2A1

    sep #0x10
    jsl 0x828398
.E2A1:
    sep #0x10
    rtl

.E2A4: d16[.E2AC, .E2BB, .E2F0, .E327]

.E2AC:
    lda.b #0x07
    jsl 0x848F07
    lda.b #0x02
    sta.b 0x01
    jsl 0x8280B4
    rts

.E2BB:
    lda.b 0x0F
    bmi .E2C6

    jsl 0x848EEA
    jmp .E2EB

.E2C6:
    lda.b #0x04
    sta.b 0x01
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0020
    sta.w 0x002C
    sta.b 0x1A
    lda.b 0x08
    sta.w 0x002E
    sta.b 0x1C
    sep #0x20
    lda.b #0x00
    sta.b 0x0B
    jsl 0x848011
    jmp .E2EF

.E2EB:
    jsl 0x8280B4
.E2EF:
    rts

.E2F0:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0002,X
    cmp.b #0x0C
    beq .E2FE

    jmp .E324

.E2FE:
    sep #0x10
    lda.b #0x08
    jsl 0x848F07
    lda.b #0x06
    sta.b 0x01
    rep #0x20
    lda.b 0x1A
    sta.w 0x002C
    lda.b 0x1C
    sta.w 0x002E
    sep #0x20
    lda.b #0x01
    sta.b 0x0B
    jsl 0x848011
    jsl 0x8280B4
.E324:
    sep #0x10
    rts

.E327:
    lda.b 0x0F
    bmi .E336

    jsl 0x848EEA
    jsl 0x8280B4
    jmp .E33A

.E336:
    jsl 0x828398
.E33A:
    rts

;-----

_82E33B:
    ldx.b 0x01
    jsr (.E341,X)
    rtl

.E341: d16[.E347, .E384, .E5CA]

.E347:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x12
    stz.b 0x18
    stz.b 0x28
    lda.b #0xFF
    sta.b 0x26
    lda.w 0x0BB9
    and.b #0x30
    ora.b #0x04
    sta.b 0x11
    sta.b 0x2F
    rep #0x10
    ldx.w #0xD8A8
    lda.b 0x0B
    and.b #0x7F
    beq .E36E

    ldx.w #0xD89E
.E36E:
    stx.b 0x20
    sep #0x10
    jsl 0x8280B4
    lda.b #0x12
    sta.b 0x16
    lda.b 0x0B
    and.b #0x7F
    inc
    jsl 0x848F07
    rts

.E384:
    jsl 0x82806E
    bcc .E398

    lda.b 0x0B
    bpl .E393

    jsl 0x828387
    rts

.E393:
    lda.b #0x04
    sta.b 0x01
    rts

.E398:
    ldx.b 0x02
    jmp (.E39D,X)

.E39D: d16[.E3A5, .E400, .E467, .E4CE]

.E3A5:
    ldx.b 0x03
    bne .E3C3

    inc.b 0x03
    rep #0x20
    stz.b 0x1A
    lda.w #0x02F5
    sta.b 0x1C
    ldy.b 0x0B
    bpl .E3BA

    stz.b 0x1C
.E3BA:
    sep #0x20
    lda.b #0x37
    sta.b 0x1E
    stz.b 0x1F
    rts

.E3C3:
    lda.b 0x2B
    bit.b #0x08
    bne .E3D5

    jsl 0x828174
    jsl 0x8280B4
    lda.b 0x1D
    bpl .E3DE

.E3D5:
    lda.b #0x02
    sta.b 0x02
    stz.b 0x1C
    stz.b 0x1D
    rts

.E3DE:
    jsl 0x81E0F6
    lda.w 0x0BCF
    and.b #0x7F
    beq .E3FF

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .E3FF

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    jmp .E4CE

.E3FF:
    rts

.E400:
    lda.b 0x2B
    bit.b #0x04
    beq .E421

    stz.b 0x2F
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    lda.b 0x26
    bpl .E41F

    lda.b #0xF0
    sta.b 0x26
    lda.w 0x1F9D
    bpl .E41F

    lda.b #0x06
    sta.b 0x26
.E41F:
    stz.b 0x27
.E421:
    jsl 0x828174
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFB00
    bpl .E433

    lda.w #0xFB00
    sta.b 0x1C
.E433:
    sep #0x20
    lda.b 0x26
    cmp.b #0x3C
    bcs .E441

    lda.w 0x0B9C
    lsr
    bcc .E445

.E441:
    jsl 0x8280B4
.E445:
    jsl 0x81E0F6
    lda.w 0x0BCF
    and.b #0x7F
    beq .E466

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .E466

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    jmp .E4CE

.E466:
    rts

.E467:
    ldx.b 0x03
    bne .E477

    inc.b 0x03
    lda.b 0x0B
    and.b #0x7F
    inc
    inc
    jsl 0x848F07
.E477:
    jsl 0x81E0F6
    lda.b 0x2B
    bit.b #0x04
    bne .E48A

    lda.b #0x02
    sta.b 0x02
    stz.b 0x1C
    stz.b 0x1D
    rts

.E48A:
    lda.b 0x28
    bne .E4A9

    lda.b 0x0B
    bmi .E4A9

    lda.b 0x26
    cmp.b #0x3C
    bcs .E49A

    dec.b 0x27
.E49A:
    dec.b 0x26
    bne .E4A3

    lda.b #0x04
    sta.b 0x01
    rts

.E4A3:
    lda.b 0x27
    bit.b #0x01
    bne .E4AD

.E4A9:
    jsl 0x8280B4
.E4AD:
    lda.w 0x0BCF
    and.b #0x7F
    beq .E4C9

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .E4C9

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    bra .E4CE

.E4C9:
    jsl 0x848EEA
    rts

.E4CE:
    ldx.b 0x03
    jmp (.E4D3,X)

.E4D3: d16[.E4DB, .E566, .E59B, .E5BD]

.E4DB:
    lda.w 0x0BCF
    and.b #0x7F
    cmp.w 0x1F9A
    bne .E52F

    lda.b 0x0B
    and.b #0x7F
    sta.w 0x0000
    ldx.b #0x00
.E4EE:
    lda.w 0x1F83,X
    bpl .E51D

    cmp.b #0x8E
    bcs .E51D

    pha
    lda.b #0x0D
    jsl 0x8088B6
    pla
    inc
    sta.w 0x1F83,X
    cmp.b #0x8E
    beq .E527

    ldy.w 0x0000
    bne .E522

    inc
    sta.w 0x1F83,X
    cmp.b #0x8E
    beq .E527

    lda.b #0x06
    sta.b 0x03
    lda.b #0x04
    sta.b 0x26
    rts

.E51D:
    inx
    cpx.b #0x04
    bne .E4EE

.E522:
    lda.b #0x04
    sta.b 0x01
    rts

.E527:
    lda.b #0x2B
    jsl 0x8088B6
    bra .E522

.E52F:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    sta.w 0x1F13
    sta.w 0x1F14
    sta.w 0x1F15
    sta.w 0x1F16
    sta.w 0x1F17
    sta.w 0x1F18
    sta.w 0x1F19
    sta.w 0x0BB6
    lda.b #0x80
    tsb.b 0x00
    lda.b #0x04
    sta.b 0x26
    ldx.b #0x08
    lda.b 0x0B
    and.b #0x7F
    beq .E55F

    ldx.b #0x02
.E55F:
    stx.b 0x27
    jsl 0x849F85
    rts

.E566:
    lda.w 0x0BCF
    and.b #0x7F
    beq .E596

    dec.b 0x26
    bne .E59A

    lda.b #0x04
    sta.b 0x26
    lda.w 0x0BCF
    and.b #0x7F
    inc
    cmp.w 0x1F9A
    bcc .E587

    lda.b #0x04
    sta.b 0x03
    lda.w 0x1F9A
.E587:
    ora.b #0x80
    sta.w 0x0BCF
    lda.b #0x0C
    jsl 0x8088B6
    dec.b 0x27
    bne .E59A

.E596:
    lda.b #0x04
    sta.b 0x03
.E59A:
    rts

.E59B:
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F15
    stz.w 0x1F16
    stz.w 0x1F17
    stz.w 0x1F18
    stz.w 0x1F19
    lda.b #0x04
    sta.b 0x01
    lda.b #0x80
    trb.b 0x00
    jsl 0x849FAD
    rts

.E5BD:
    dec.b 0x26
    bne .E5C9

    lda.b #0x0D
    jsl 0x8088B6
    bra .E5CA

.E5C9:
    rts

.E5CA:
    jsl 0x828398
    rts

;-----

_82E5CF:
    ldx.b 0x01
    jmp (.E5D4,X)

.E5D4: d16[.E5DA, .E623, .E664]

.E5DA:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x18
    lda.l 0x7F8323
    and.b #0xFE
    sta.b 0x11
    lda.b #0x27
    sta.b 0x16
    lda.b #0x04
    sta.b 0x12
    lda.b #0x01
    sta.b 0x27
    lda.b #0x7F
    sta.b 0x26
    stz.b 0x2C
    rep #0x20
    ldx.b 0x0B
    lda.w 0x86DA34,X
    sta.b 0x05
    lda.w 0x86DA38,X
    sta.b 0x08
    stz.b 0x1A
    stz.b 0x1C
    lda.w #0xDA2A
    sta.b 0x20
    sep #0x20
    lda.b #0x38
    sta.b 0x1E
    stz.b 0x1A
    lda.b #0x18
    sta.b 0x28
    lda.b #0x00
    jml 0x848F07

.E623:
    dec.b 0x28
    beq .E663

    lda.b #0x04
    sta.b 0x01
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0080
    sta.w 0x002C
    lda.b 0x08
    sec
    sbc.w #0x0028
    sta.w 0x002E
    sep #0x20
    lda.b #0x00
    jsl 0x848011
    lda.w 0x0BD3
    and.b #0x04
    beq .E65F

    rep #0x20
    inc.w 0x0BB0
    inc.w 0x0BB0
    sep #0x20
    lda.b #0x04
    tsb.w 0x0BD4
    inc.b 0x2C
.E65F:
    jml 0x82808F

.E663:
    rtl

.E664:
    jsl 0x8281E8
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFB00
    bpl .E678

    lda.w #0xFB00
    sta.b 0x1C
    stz.b 0x1E
.E678:
    sep #0x20
    jsl 0x84AB6E
    jsl 0x8491BE
    lda.b 0x2B
    beq .E6C9

    lda.b #0x30
    ldx.b #0x03
    ldy.b #0x01
    jsl 0x84A33C
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0070
    sta.w 0x002C
    lda.b 0x08
    sec
    sbc.w #0x0018
    sta.w 0x002E
    sep #0x20
    lda.b #0x01
    sta.w 0x0001
    stz.w 0x0000
    jsl 0x83FE72
    lda.b #0x25
    jsl 0x8088B6
    ldy.b #0x00
    jsr _82E6CD
    ldy.b #0x40
    jsr _82E6CD
    jsr _82E6F3
    jml 0x828398

.E6C9:
    jml 0x82808F

;-----

_82E6CD:
    jsl 0x8282D3
    bne .E6F0

    inc.w 0x0000,X
    lda.b #0x22
    sta.w 0x000A,X
    lda.b #0x03
    sta.w 0x000B,X
    tya
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.E6F0:
    sep #0x30
    rts

;-----

_82E6F3:
    ldy.b #0x08
.E6F5:
    sep #0x20
    jsl 0x8282D3
    bne .E71D

    inc.w 0x0000,X
    lda.b #0x24
    sta.w 0x000A,X
    tya
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    dey
    bpl .E6F5

.E71D:
    sep #0x30
    rts

;-----

_82E720:
    ldx.b 0x01
    jmp (.E725,X)

.E725: d16[.E737, .E770, .E793, .E7BB, .E793, .E864, .E793, .E8E4, .E793]

.E737:
    ldx.b 0x0B
    lda.w 0x86DA47,X
    sta.b 0x01
    stz.b 0x2F
    lda.l 0x7F8235
    sta.b 0x18
    lda.l 0x7F8335
    sta.b 0x11
    lda.b #0x37
    sta.b 0x16
    stz.b 0x2C
    lda.b #0x04
    sta.b 0x12
    lda.b #0x00
    jsl 0x848F07
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    lda.w #0xDA58
    sta.b 0x20
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    stz.b 0x1A
    rtl

.E770:
    lda.b 0x2F
    beq .E777

    jmp .E964

.E777:
    jsr _82E9E6
    lda.b 0x2F
    beq .E788

    ldy.b 0x0B
    jsr _82EA27
    ldy.b 0x0B
    jsr _82EA55
.E788:
    jsl 0x82806E
    bcs .E78F

    rtl

.E78F:
    jml 0x828387

.E793:
    jsl 0x8281E8
    rep #0x20
    lda.w #0xDA58
    sta.b 0x20
    jsl 0x84AB6E
    lda.w #0xDA5D
    sta.b 0x20
    jsl 0x84AB43
    sep #0x20
    jsl 0x82806E
    bcs .E7B7

    jml 0x8280B4

.E7B7:
    jml 0x828398

.E7BB:
    lda.b 0x2F
    bne .E802

    stz.b 0x2A
    lda.b #0x20
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcs .E7DB

    stz.b 0x2A
    lda.b #0xE0
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .E7DE

.E7DB:
    jmp .E9A4

.E7DE:
    jsl 0x8280B4
    inc.b 0x01
    inc.b 0x01
    jsl 0x849C0E
    bcc .E7F6

    lda.w 0x0BD3
    and.b #0x04
    sta.b 0x2C
    tsb.w 0x0BD4
.E7F6:
    rtl

.E7F7:
    jsl 0x82806E
    bcc .E801

    jml 0x828387

.E801:
    rtl

.E802:
    stz.b 0x29
    stz.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .E7DE

    dec.b 0x2F
    bne .E7F7

    stz.b 0x1F
    stz.b 0x2A
    lda.b #0x20
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .E82B

    ldy.b #0x02
    jsr _82EA55
    lda.b #0x01
    tsb.b 0x1F
.E82B:
    stz.b 0x2A
    lda.b #0xE0
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .E842

    ldy.b #0x00
    jsr _82EA55
    lda.b #0x04
    tsb.b 0x1F
.E842:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0040
    sta.w 0x002C
    lda.b 0x08
    sec
    sbc.w #0x0022
    sta.w 0x002E
    sep #0x20
    ldy.b 0x1F
    lda 0x86DA3F,Y
    jsl 0x848011
    jmp .E7DE

.E864:
    lda.b 0x2F
    bne .E88F

    jmp .E9A4

.E86B:
    jsl 0x8280B4
    inc.b 0x01
    inc.b 0x01
    jsl 0x849C0E
    bcc .E883

    lda.w 0x0BD3
    and.b #0x04
    sta.b 0x2C
    tsb.w 0x0BD4
.E883:
    rtl

.E884:
    jsl 0x82806E
    bcc .E88E

    jml 0x828387

.E88E:
    rtl

.E88F:
    dec.b 0x2F
    bne .E884

    ldy.b #0x02
    jsr _82EA55
    stz.b 0x1F
    stz.b 0x2A
    lda.b #0xE0
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .E8B1

    ldy.b #0x00
    jsr _82EA55
    lda.b #0x02
    tsb.b 0x1F
.E8B1:
    stz.b 0x2A
    lda.b #0xC0
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .E8C3

    lda.b #0x04
    tsb.b 0x1F
.E8C3:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0060
    sta.w 0x002C
    lda.b 0x08
    sec
    sbc.w #0x0022
    sta.w 0x002E
    sep #0x20
    ldy.b 0x1F
    lda 0x86DA3F,Y
    jsl 0x848011
    bra .E86B

.E8E4:
    lda.b 0x2F
    bne .E90F

    jmp .E9A4

.E8EB:
    jsl 0x8280B4
    inc.b 0x01
    inc.b 0x01
    jsl 0x849C0E
    bcc .E903

    lda.w 0x0BD3
    and.b #0x04
    sta.b 0x2C
    tsb.w 0x0BD4
.E903:
    rtl

.E904:
    jsl 0x82806E
    bcc .E90E

    jml 0x828387

.E90E:
    rtl

.E90F:
    dec.b 0x2F
    bne .E904

    ldy.b #0x00
    jsr _82EA55
    stz.b 0x1F
    stz.b 0x2A
    lda.b #0x20
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .E931

    ldy.b #0x02
    jsr _82EA55
    lda.b #0x02
    tsb.b 0x1F
.E931:
    stz.b 0x2A
    lda.b #0x40
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .E943

    lda.b #0x01
    tsb.b 0x1F
.E943:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0020
    sta.w 0x002C
    lda.b 0x08
    sec
    sbc.w #0x0022
    sta.w 0x002E
    sep #0x20
    ldy.b 0x1F
    lda 0x86DA3F,Y
    jsl 0x848011
    bra .E8EB

.E964:
    dec.b 0x2F
    bne .E9A3

    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0020
    sta.w 0x002C
    lda.b 0x08
    sec
    sbc.w #0x0020
    sta.w 0x002E
    ldx.b 0x0B
    lda.w 0x86DA3C,X
    jsl 0x848011
    jsl 0x8280B4
    inc.b 0x01
    inc.b 0x01
    ldy.b 0x0B
    jsr _82EA55
    jsl 0x849C0E
    bcc .E9A3

    lda.w 0x0BD3
    and.w #0x0004
    sta.b 0x2C
    tsb.w 0x0BD4
.E9A3:
    rtl

.E9A4:
    jsr _82E9E6
    lda.b 0x2F
    beq .E9DC

    stz.b 0x2A
    lda.b #0x20
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .E9C3

    ldy.b #0x02
    jsr _82EA27
    ldy.b #0x02
    jsr _82EA55
.E9C3:
    stz.b 0x2A
    lda.b #0xE0
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .E9DB

    ldy.b #0x00
    jsr _82EA27
    ldy.b #0x00
    jsr _82EA55
.E9DB:
    rtl

.E9DC:
    jsl 0x82806E
    bcc .E9DB

    jml 0x828387

;-----

_82E9E6:
    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .EA24

    lda.w 0x0BD3
    and.b #0x04
    beq .EA24

    rep #0x20
    lda.w 0x0002
    bpl .EA24

    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .EA0B

    eor.w #0xFFFF
    inc
.EA0B:
    cmp.w #0x0010
    bcs .EA24

    stz.b 0x1A
    stz.b 0x1C
    sep #0x30
    lda.b #0x30
    sta.b 0x1F
    lda.b #0x1E
    sta.b 0x2F
    lda.b #0x22
    jsl 0x80888B
.EA24:
    sep #0x30
    rts

;-----

_82EA27:
    lda 0x86DA4D,Y
    sta.w 0x0000
    jsl 0x8282D3
    bne .EA52

    inc.w 0x0000,X
    lda.b #0x22
    sta.w 0x000A,X
    lda.b #0x02
    sta.w 0x000B,X
    lda.w 0x0000
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.EA52:
    sep #0x30
    rts

;-----

_82EA55:
    lda 0x86DA4D,Y
    asl
    asl
    rep #0x20
    lda.w #0x0010
    bcs .EA64

    lda.w #0xFFF0
.EA64:
    sta.b 0x29
    lda.w #0xFFF0
    sta.b 0x2D
    jsl 0x849086
    and.w #0x0007
    asl
    asl
    asl
    adc.w #0xDA62
    sta.b 0x26
    ldy.b #0x07
.EA7C:
    sep #0x20
    jsl 0x8282D3
    bne .EAB8

    inc.w 0x0000,X
    lda.b #0x23
    sta.w 0x000A,X
    lda (0x26),Y
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    rep #0x20
    lda.b 0x05
    clc
    adc.b 0x29
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.b 0x2D
    sta.w 0x0008,X
    lda.b 0x2D
    clc
    adc.w #0x0004
    sta.b 0x2D
    dey
    bpl .EA7C

.EAB8:
    sep #0x30
    stz.b 0x19
    rts

;-----

_82EABD:
    ldx.b 0x01
    jmp (.EAC2,X)

.EAC2: d16[.EAC8, .EAF7, .EB83]

.EAC8:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x12
    lda.b #0x03
    sta.b 0x28
    lda.b #0x06
    sta.b 0x27
    lda.b #0x04
    sta.b 0x26
    rep #0x20
    lda.w #0xDAA2
    sta.b 0x20
    sep #0x20
    lda.l 0x7F8231
    sta.b 0x18
    lda.b #0x33
    sta.b 0x16
    lda.b #0x04
    sta.b 0x29
    jsl 0x848F07
.EAF7:
    lda.l 0x7F8331
    sta.b 0x11
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    and.b #0x7F
    bne .EB10

    lda.b #0x04
    sta.b 0x01
    sep #0x10
    bra .EB73

.EB10:
    lda.w 0x0001,X
    cmp.b #0x02
    bne .EB35

    lda.w 0x0002,X
    cmp.b #0x02
    bne .EB35

    lda.b #0x05
    ldy.w 0x001A,X
    cpy.w #0xFF00
    bcc .EB29

    inc
.EB29:
    cmp.b 0x29
    beq .EB41

    sta.b 0x29
    jsl 0x848F07
    bra .EB41

.EB35:
    lda.b #0x04
    cmp.b 0x29
    beq .EB41

    sta.b 0x29
    jsl 0x848F07
.EB41:
    ldx.b 0x0C
    lda.w 0x002A,X
    sep #0x10
    bpl .EB4E

    lda.b #0x0E
    trb.b 0x11
.EB4E:
    lda.b 0x30
    sta.b 0x2A
    stz.b 0x30
    lda.b 0x2B
    bne .EB73

    jsl 0x849B43
    beq .EB73

    bmi .EB66

    lda.b #0x0E
    trb.b 0x11
    bra .EB73

.EB66:
    lda.b #0x04
    sta.b 0x01
    rep #0x10
    ldx.b 0x0C
    stz.w 0x0029,X
    sep #0x10
.EB73:
    lda.b 0x2A
    sta.b 0x30
    jsl 0x849B03
    jsl 0x848EEA
.EB7F:
    jml 0x8280B4

.EB83:
    ldx.b 0x02
    bne .EBAC

    rep #0x10
    inc.b 0x02
    ldx.w #0xFF00
    stx.b 0x1A
    ldx.w #0x0100
    stx.b 0x1C
    stz.b 0x1F
    lda.b #0x10
    sta.b 0x1E
    lda.l 0x7F8331
    sta.b 0x11
    jsl 0x82806E
    bcs .EBAB

    jml 0x84A4AB

.EBAB:
    rtl

.EBAC:
    jsl 0x82806E
    bcc .EBB6

    jml 0x828398

.EBB6:
    jsl 0x828174
    lda.w 0x0B9B
    lsr
    bcc .EB7F

    rtl

;-----

_82EBC1:
    ldx.b 0x01
    jmp (.EBC6,X)

.EBC6: d16[.EBCC, .EBF4, .ED1B]

.EBCC:
    lda.b #0x02
    sta.b 0x01
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x02
    sta.b 0x0F
    sta.b 0x10
    jsl 0x828321
    bne .EBF1

    inc.w 0x0000,X
    lda.b #0x28
    sta.w 0x000A,X
    stz.w 0x000B,X
    stx.b 0x1A
.EBF1:
    sep #0x10
    rtl

.EBF4:
    jsr _82ED1F
    ldx.b 0x02
    jsr (.EBFD,X)
    rtl

.EBFD: d16[.ECF3, .ECCD, .EC05, .ECF4]

.EC05:
    ldx.b 0x03
    jmp (.EC0A,X)

.EC0A: d16[.EC16, .EC34, .EC45, .EC60, .EC77, .EC87]

.EC16:
    lda.b #0x02
    sta.b 0x03
    jsr _82ED5B
    jsl 0x80E01C
    rep #0x20
    lda.w #0x0A08
    sta.w 0x1E8D
    lda.w #0x0098
    sta.w 0x1E90
    sep #0x20
    jmp _82ED64

.EC34:
    lda.b #0x04
    sta.b 0x03
    inc.w 0x1E88
    stz.w 0x1E9A
    jsl 0x80E02C
    jmp _82ED72

.EC45:
    lda.w 0x1F27
    bne .EC5F

    lda.b #0x06
    sta.b 0x03
    rep #0x21
    lda.w 0x1E8D
    adc.w #0x0100
    sta.w 0x1E8D
    sep #0x20
    jsl 0x80E02C
.EC5F:
    rts

.EC60:
    lda.w 0x1F27
    bne .EC76

    lda.b #0x08
    sta.b 0x03
    rep #0x21
    lda.w 0x1E8D
    adc.w #0xFF00
    sta.w 0x1E8D
    sep #0x20
.EC76:
    rts

.EC77:
    lda.b #0x0A
    sta.b 0x03
    jsl 0x80E01C
    lda.b #0x01
    sta.w 0x1E88
    jmp _82ED64

.EC87:
    stz.b 0x02
    jmp _82ED52

    ldx.b 0x03
    jmp (.EC91,X)

.EC91: d16[.EC97, .ECA5, .ECB6]

.EC97:
    lda.b #0x02
    sta.b 0x03
    jsr _82ED5B
    jsl 0x80E01C
    jmp _82ED72

.ECA5:
    lda.b #0x04
    sta.b 0x03
    inc.w 0x1E88
    stz.w 0x1E9A
    jsl 0x80E02C
    jmp _82ED88

.ECB6:
    lda.w 0x1F27
    bne .ECCC

    stz.b 0x02
    jsr _82ED52
    jsl 0x80E01C
    lda.b #0x01
    sta.w 0x1E88
    jmp _82ED7C

.ECCC:
    rts

.ECCD:
    ldx.b 0x03
    bne .ECEA

    inc.b 0x03
    lda.b #0x0E
    sta.w 0x1E89
    lda.b #0x12
    sta.b 0x12
    lda.b #0x01
    sta.w 0x1E88
    stz.w 0x1E9A
    jsr _82ED5B
    jmp _82ED72

.ECEA:
    dec.b 0x12
    bne .ECF3

    jsr _82ED47
    stz.b 0x02
.ECF3:
    rts

.ECF4:
    ldx.b 0x03
    bne .ED11

    inc.b 0x03
    lda.b #0x0E
    sta.w 0x1E89
    lda.b #0x12
    sta.b 0x12
    lda.b #0x01
    sta.w 0x1E88
    stz.w 0x1E9A
    jsr _82ED5B
    jmp _82ED72

.ED11:
    dec.b 0x12
    bne .ED1A

    jsr _82ED47
    stz.b 0x02
.ED1A:
    rts

.ED1B:
    jml 0x828398

;-----

_82ED1F:
    rep #0x20
    ldx.b 0x0F
    stx.b 0x10
    ldx.b #0x02
    lda.w 0x0BAD
    cmp.w #0x1400
    bcc .ED38

    inx
    inx
    cmp.w #0x1710
    bcc .ED38

    inx
    inx
.ED38:
    stx.b 0x0F
    sep #0x20
    lda.b 0x0F
    cmp.b 0x10
    beq .ED46

    sta.b 0x02
    stz.b 0x03
.ED46:
    rts

;-----

_82ED47:
    lda.b #0x17
    sta.w 0x00C0
    lda.b #0x13
    sta.w 0x00C1
    rts

;-----

_82ED52:
    lda.b #0x02
    tsb.w 0x00C0
    tsb.w 0x00C1
    rts

;-----

_82ED5B:
    lda.b #0x02
    trb.w 0x00C0
    trb.w 0x00C1
    rts

;-----

_82ED64:
    rep #0x10
    ldx.b 0x1A
    beq .ED6F

    lda.b #0x01
    sta.w 0x0010,X
.ED6F:
    sep #0x10
    rts

;-----

_82ED72:
    rep #0x10
    ldx.b 0x1A
    stz.w 0x0010,X
    sep #0x10
    rts

;-----

_82ED7C:
    rep #0x10
    ldx.b 0x1C
    lda.b #0x01
    sta.w 0x0010,X
    sep #0x10
    rts

;-----

_82ED88:
    rep #0x10
    ldx.b 0x1C
    stz.w 0x0010,X
    sep #0x10
    rts

;-----

_82ED92:
    rep #0x10
    ldx.b 0x1A
    lda.w 0x0027,X
    and.b #0x7F
    sep #0x10
    rts

;-----

_82ED9E:
    lda.b 0x01
    bne .EDD2

    inc.b 0x01
    lda.b 0x0B
    asl
    asl
    tay
    lda 0x86DD24,Y
    tax
    lda.l 0x7F8200,X
    sta.b 0x18
    lda.b 0x11
    and.b #0x70
    sta.b 0x11
    lda.l 0x7F8300,X
    and.b #0x0F
    tsb.b 0x11
    lda 0x86DD27,Y
    sta.b 0x12
    lda 0x86DD25,Y
    sta.b 0x16
    lda 0x86DD26,Y
    jml 0x848F07

.EDD2:
    ldx.b 0x02
    jmp (.EDD7,X)

.EDD7: d16[.EDDF, .EDF9, .EE05, .EE0D]

.EDDF:
    lda.b 0x0F
    bpl .EDE7

    jml 0x828398

.EDE7:
    jsl 0x848EEA
    lda.b 0x0B
    cmp.b #0x1D
    beq .EDF5

    jml 0x8280B4

.EDF5:
    jml 0x82808F

.EDF9:
    lda.b 0x0F
    bmi .EE01

    jsl 0x848EEA
.EE01:
    jml 0x8280B4

.EE05:
    jsl 0x848EEA
    jml 0x8280B4

.EE0D:
    lda.b 0x0F
    bmi .EE15

    jsl 0x848EEA
.EE15:
    jml 0x82808F

;-----

_82EE19:
    ldx.b 0x01
    jmp (.EE1E,X)

.EE1E: d16[.EE22, .EE4A]

.EE22:
    lda.b #0x02
    sta.b 0x01
    lda.l 0x7F8223
    sta.b 0x18
    lda.l 0x7F8323
    ora.b #0x30
    sta.b 0x11
    stz.b 0x12
    lda.b #0x27
    sta.b 0x16
    lda.b 0x0B
    and.b #0x7F
    jsl 0x848F07
    lda.b #0x40
    sta.b 0x1E
    jml 0x82808F

.EE4A:
    lda.b 0x0B
    bpl .EE52

    jsl 0x8281E8
.EE52:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .EE5E

    jml 0x828398

.EE5E:
    jml 0x82808F

;-----

_82EE62:
    ldx.b 0x01
    jmp (.EE67,X)

.EE67: d16[.EE6D, .EEA2, .EEB9]

.EE6D:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x2B
    sta.b 0x16
    lda.l 0x7F8229
    sta.b 0x18
    lda.b #0x25
    tsb.b 0x11
    lda.b 0x0B
    jsl 0x848F07
    lda.b 0x0B
    bne .EE91

    lda.b #0x02
    sta.b 0x01
    jml 0x8280B4

.EE91:
    lda.b #0x04
    sta.b 0x01
    rep #0x20
    lda.w #0x0100
    sta.b 0x1C
    sep #0x20
    jml 0x8280B4

.EEA2:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0003,X
    sep #0x10
    bne .EEB1

    jml 0x828398

.EEB1:
    jsl 0x848EEA
    jml 0x8280B4

.EEB9:
    jsl 0x82825D
    jsr _82EED9
    cmp.b #0x0E
    beq .EEC8

    cmp.b #0x0D
    bne .EED5

.EEC8:
    jsl 0x848EEA
    jsl 0x8280B4
    lda.b 0x0E
    beq .EED5

    rtl

.EED5:
    jml 0x828398

;-----

_82EED9:
    rep #0x30
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sec
    sbc.w #0x0012
    sta.w 0x0002
    phd
    lda.w #0x0000
    tcd
    jsl 0x849156
    lda.l 0x7E2000,X
    tay
    lda.w 0x0B92
    sta.b 0x10
    lda.w 0x0B94
    lda.w 0x0B94
    sta.b 0x12
    lda [0x10],Y
    and.w #0x00FF
    sep #0x30
    pld
    rts

;-----

_82EF0D:
    lda.b 0x01
    bne .EF35

    jsl 0x84A23A
    tya
    beq .EF1C

    jml 0x828398

.EF1C:
    inc.b 0x01
    lda.l 0x7F8229
    sta.b 0x18
    stz.b 0x12
    lda.b #0xFF
    sta.b 0x1F
    lda.b #0x2B
    sta.b 0x16
    lda.b #0x03
    jsl 0x848F07
    rtl

.EF35:
    rep #0x21
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    adc.w #0x0008
    and.w #0xFFF0
    sta.b 0x08
    lda.b 0x29
    pha
    lda.w #0x0800
    sta.b 0x29
    jsl 0x8490A0
    tax
    pla
    sta.b 0x29
    sep #0x20
    cpx.b #0x0E
    bne .EFA8

    lda.b #0x04
    cmp.w 0x0BAA
    bne .EF6A

    cmp.b 0x1F
    beq .EFCE

    bra .EFC0

.EF6A:
    lda.b #0x02
    cmp.w 0x0BAA
    bne .EF77

    cmp.b 0x1F
    beq .EFCE

    bra .EFC0

.EF77:
    lda.b #0x14
    cmp.w 0x0BAA
    bne .EF84

    cmp.b 0x1F
    beq .EFCE

    bra .EFC0

.EF84:
    lda.w 0x0BAA
    bne .EFA8

    lda.b 0x1F
    bne .EFDE

    lda.b 0x02
    cmp.b #0x04
    beq .EFEC

    ldx.b 0x03
    bne .EFBA

    bra .EFAE

.EF99:
    lda.b #0x25
    bit.w 0x0BB9
    bvc .EFA2

    lda.b #0x65
.EFA2:
    sta.b 0x11
    jsl 0x8280B4
.EFA8:
    lda.w 0x0BAA
    sta.b 0x1F
    rtl

.EFAE:
    stz.b 0x02
    inc.b 0x03
    lda.b #0x04
    jsl 0x848F07
    bra .EF99

.EFBA:
    jsl 0x848EEA
    bra .EF99

.EFC0:
    lda.b #0x02
    sta.b 0x02
    inc.b 0x03
    lda.b #0x03
    jsl 0x848F07
    bra .EF99

.EFCE:
    lda.w 0x0B9C
    bit.b #0x03
    bne .EFD8

    jsr _82EFFA
.EFD8:
    jsl 0x848EEA
    bra .EF99

.EFDE:
    lda.b #0x04
    sta.b 0x02
    inc.b 0x03
    lda.b #0x05
    jsl 0x848F07
    bra .EF99

.EFEC:
    lda.b 0x0F
    bpl .EFF4

    stz.b 0x02
    stz.b 0x03
.EFF4:
    jsl 0x848EEA
    bra .EF99

;-----

_82EFFA:
    jsl 0x8282D3
    bne .F030

    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    lda.b #0x83
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x08
    adc.w #0x0010
    sta.w 0x0008,X
    jsl 0x849086
    and.w #0x000F
    sta.w 0x0000
    lda.b 0x05
    sec
    sbc.w #0x0008
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    sep #0x20
.F030:
    sep #0x10
    rts

;-----

_82F033:
    lda.w 0x1F7A
    bne .F03B

    jmp .F0D2

.F03B:
    lda.b #0x10
    sta.b 0x0A
    jsl 0x84A205
    cpy.b #0x00
    beq .F04B

    jml 0x828398

.F04B:
    lda.b #0x04
    sta.w 0x00A2
    phb
    lda.b #0x7F
    pha
    plb
    rep #0x30
    lda.w #0x2002
    ldx.w #0x0880
.F05D:
    dex
    dex
    bmi .F066

    sta.w 0xD000,X
    bra .F05D

.F066:
    sep #0x30
    plb
    ldx.w 0x00A3
    lda.b #0x80
    sta.w 0x0500,X
    rep #0x20
    lda.w #0x0BC0
    sta.w 0x0501,X
    lda.w #0x0880
    sta.w 0x0503,X
    lda.w #0xD000
    sta.w 0x0505,X
    sep #0x20
    lda.b #0x7F
    sta.w 0x0507,X
    txa
    clc
    adc.b #0x08
    sta.w 0x00A3
    lda.b #0x17
    sta.w 0x00C0
    lda.b #0x13
    sta.w 0x00C1
    lda.b #0x02
    sta.w 0x00C9
    lda.b #0x7F
    sta.w 0x00CA
    lda.b #0x55
    sta.w 0x0303
    lda.b #0x65
    sta.w 0x0302
    lda.b #0x01
    tsb.w 0x00A1
    jsl 0x828307
    bne .F0CE

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    phd
    phx
    pld
    sep #0x10
    jsl 0x82FCA9
    pld
.F0CE:
    jml 0x828398

.F0D2:
    lda.b #0x11
    sta.b 0x0A
    jsl 0x84A205
    cpy.b #0x00
    bne .F10B

    stz.w 0x00C9
    stz.w 0x00CB
    stz.w 0x00CC
    stz.w 0x00CD
    lda.b #0x13
    sta.w 0x212C
    sta.w 0x00C0
    lda.b #0xBD
    sta.w 0x00CA
    jsl 0x828307
    inc.w 0x0000,X
    lda.b #0x11
    sta.w 0x000A,X
    lda.b #0x04
    sta.w 0x000B,X
    stz.w 0x0004,X
.F10B:
    jml 0x828398

;-----

_82F10F:
    ldx.b 0x01
    bne .F12D

    inc.b 0x01
    lda.b #0x30
    sta.b 0x16
    stz.b 0x1F
    lda.b #0x08
    sta.b 0x1E
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b 0x17
    jml 0x848F07

.F12D:
    jsl 0x828174
    rep #0x20
    lda.w #0xFE00
    cmp.b 0x1C
    bmi .F13C

    sta.b 0x1C
.F13C:
    lda.w 0x1E5C
    clc
    adc.w #0x0140
    cmp.b 0x08
    bcc .F15F

    lda.b 0x29
    pha
    sep #0x20
    stz.b 0x29
    lda.b #0x10
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x0D
    beq .F16F

    rep #0x20
    pla
    sta.b 0x29
.F15F:
    sep #0x20
    jsl 0x84A4AB
    lda.b #0x3C
    jsl 0x84A333
    jml 0x828398

.F16F:
    rep #0x20
    pla
    sta.b 0x29
    sep #0x20
    lda.w 0x0B9C
    bit.b #0x1F
    bne .F180

    jsr _82C500
.F180:
    lda.w 0x0B9C
    lsr
    bcc .F18A

    jml 0x8280B4

.F18A:
    rtl

;-----

_82F18B:
    ldx.b 0x01
    jmp (.F190,X)

.F190: d16[.F196, .F1D0, .F2D8]

.F196:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x12
    lda.b #0x25
    sta.b 0x11
    lda.l 0x7F8218
    sta.b 0x18
    lda.b 0x0B
    cmp.b #0x80
    bne .F1C6

    lda.b #0x0F
    sta.b 0x10
    stz.b 0x03
    lda.b #0x50
    sta.b 0x1F
    stz.b 0x1E
    rep #0x20
    lda.w #0x047D
    sta.b 0x1A
    lda.w #0x0100
    sta.b 0x1C
    sep #0x20
.F1C6:
    lda.b #0x1A
    sta.b 0x16
    lda.b #0x03
    jsl 0x848F07
.F1D0:
    lda.b 0x0B
    bmi .F1DB

    ldx.b 0x02
    jsr (.F23E,X)
    bra .F236

.F1DB:
    cmp.b #0x80
    beq .F1E6

    ldx.b 0x02
    jsr (.F242,X)
    bra .F236

.F1E6:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0002,X
    beq .F1F9

    sep #0x10
    jsr _82F2DC
    jsr _82F340
    bra .F213

.F1F9:
    lda.w 0x000B,X
    sep #0x10
    cmp.b #0xEE
    bcc .F210

    lda.b #0x25
    sta.b 0x11
    lda.b #0x08
    sta.b 0x1F
    stz.b 0x1A
    stz.b 0x1B
    stz.b 0x12
.F210:
    jsr _82F30E
.F213:
    rep #0x20
    lda.b 0x29
    pha
    stz.b 0x29
    jsl 0x8490A0
    cmp.w #0x000E
    bne .F227

    ldx.b #0x04
    stx.b 0x01
.F227:
    pla
    sta.b 0x29
    sep #0x20
    jsl 0x82806E
    bcc .F236

    lda.b #0x04
    sta.b 0x01
.F236:
    jsl 0x848EEA
    jml 0x8280B4

.F23E: d16[.F246, .F272]

.F242: d16[.F28F, .F2BD]

.F246:
    rep #0x21
    ldx.b 0x0B
    lda.b 0x08
    adc.w 0x00DE30,X
    sta.b 0x08
    lda.b 0x05
    sec
    sbc.w 0x00DE2E,X
    sta.b 0x05
    sta.b 0x0C
    lda.w 0x00DE4E,X
    sta.b 0x1A
    lda.w 0x00DE50,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x10
    sta.b 0x1F
    stz.b 0x1E
    lda.b #0x02
    sta.b 0x02
    rts

.F272:
    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x0C
    sep #0x20
    ldx.b 0x0B
    cmp.w 0x00DE2E,X
    bcc .F286

    lda.b #0x04
    sta.b 0x01
.F286:
    jsl 0x828195
    jsl 0x848EEA
    rts

.F28F:
    lda.b #0x02
    sta.b 0x02
    jsl 0x849086
    and.b #0x1C
    tax
    rep #0x20
    lda.w 0x00DE6E,X
    sta.b 0x1A
    jsl 0x849086
    and.w #0x001C
    tax
    lda.w 0x00DE70,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x3C
    sta.b 0x10
    lda.b #0x10
    sta.b 0x1F
    lda.b #0x10
    sta.b 0x1E
    rts

.F2BD:
    dec.b 0x10
    bne .F2C5

    lda.b #0x04
    sta.b 0x01
.F2C5:
    jsl 0x8281CF
    lda.b 0x1B
    bmi .F2CF

    stz.b 0x1B
.F2CF:
    lda.b #0x02
    cmp.b 0x1D
    bpl .F2D7

    sta.b 0x1D
.F2D7:
    rts

.F2D8:
    jml 0x828398

;-----

_82F2DC:
    ldx.b 0x03
    bne .F2F7

    dec.b 0x10
    bne .F2F2

    lda.b #0x0F
    sta.b 0x10
    inc.b 0x03
    lda.b #0x83
    sta.b 0x1A
    lda.b #0xFB
    sta.b 0x1B
.F2F2:
    jsl 0x828174
    rts

.F2F7:
    dec.b 0x10
    bne .F309

    lda.b #0x0F
    sta.b 0x10
    stz.b 0x03
    lda.b #0x7D
    sta.b 0x1A
    lda.b #0x04
    sta.b 0x1B
.F309:
    jsl 0x828195
    rts

;-----

_82F30E:
    ldx.b 0x03
    bne .F329

    dec.b 0x10
    bne .F324

    lda.b #0x39
    sta.b 0x10
    inc.b 0x03
    lda.b #0x40
    sta.b 0x1A
    lda.b #0xFE
    sta.b 0x1B
.F324:
    jsl 0x828174
    rts

.F329:
    dec.b 0x10
    bne .F33B

    lda.b #0x39
    sta.b 0x10
    stz.b 0x03
    lda.b #0xC0
    sta.b 0x1A
    lda.b #0x01
    sta.b 0x1B
.F33B:
    jsl 0x828195
    rts

;-----

_82F340:
    lda.b #0x25
    sta.b 0x11
    stz.b 0x12
    lda.b 0x1B
    bpl .F352

    lda.b #0x05
    sta.b 0x11
    lda.b #0x04
    sta.b 0x12
.F352:
    rts

;-----

_82F353:
    ldx.b 0x01
    jmp (.F358,X)

.F358: d16[.F35E, .F376, .F3B4]

.F35E:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x12
    lda.l 0x7F8231
    sta.b 0x18
    lda.b #0x33
    sta.b 0x16
    lda.b #0x02
    jsl 0x848F07
.F376:
    lda.l 0x7F8331
    sta.b 0x11
    rep #0x10
    ldx.b 0x0C
    lda.w 0x002A,X
    beq .F389

    lda.b #0x0E
    trb.b 0x11
.F389:
    lda.w 0x0027,X
    and.b #0x7F
    bne .F3AA

    lda.b #0x04
    sta.b 0x01
    lda.l 0x7F8331
    sta.b 0x11
    ldx.w #0x0100
    stx.b 0x1A
    ldx.w #0x0200
    stx.b 0x1C
    stz.b 0x1F
    lda.b #0x10
    sta.b 0x1E
.F3AA:
    sep #0x10
    jsl 0x848EEA
.F3B0:
    jml 0x8280B4

.F3B4:
    jsl 0x82806E
    bcc .F3BE

    jml 0x828398

.F3BE:
    jsl 0x828174
    lda.w 0x0B9B
    lsr
    bcc .F3B0

    rtl

;-----

_82F3C9:
    ldx.b 0x01
    jmp (.F3CE,X)

.F3CE: d16[.F3D4, .F3EC, .F45A]

.F3D4:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x12
    lda.l 0x7F8231
    sta.b 0x18
    lda.b #0x33
    sta.b 0x16
    lda.b #0x03
    jsl 0x848F07
.F3EC:
    lda.l 0x7F8331
    sta.b 0x11
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    bpl .F3FF

    lda.b #0x0E
    trb.b 0x11
.F3FF:
    lda.w 0x0000,X
    bne .F41E

    lda.b #0x04
    sta.b 0x01
    lda.l 0x7F8331
    sta.b 0x11
    ldx.w #0xFEE0
    stx.b 0x1A
    ldx.w #0x0200
    stx.b 0x1C
    stz.b 0x1F
    lda.b #0x10
    sta.b 0x1E
.F41E:
    lda.w 0x0001,X
    beq .F454

    lda.w 0x0002,X
    cmp.b #0x04
    bne .F437

    lda.w 0x002C,X
    beq .F450

    lda.b #0x03
    jsl 0x848F07
    bra .F450

.F437:
    cmp.b #0x06
    bne .F454

    lda.w 0x002C,X
    beq .F450

    ldy.w #0x0003
    lda.w 0x001F,X
    bne .F44B

    ldy.w #0x0007
.F44B:
    tya
    jsl 0x848F07
.F450:
    jsl 0x848EEA
.F454:
    sep #0x10
    jml 0x8280B4

.F45A:
    jml 0x828398

;-----

_82F45E:
    jsl 0x82806E
    bcs .F474

    inc.b 0x0B
    lda.b 0x0B
    cmp.b #0x06
    bne .F474

    stz.b 0x0B
    lda.b #0x1C
    jsl 0x80888B
.F474:
    ldx.b 0x01
    jmp (.F479,X)

.F479: d16[.F47F, .F499, .F4CB]

.F47F:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x0B
    stz.b 0x18
    lda.l 0x7F832D
    and.b #0xFE
    sta.b 0x11
    lda.b #0x36
    sta.b 0x16
    lda.b #0x00
    jml 0x848F07

.F499:
    rep #0x30
    ldx.b 0x0C
    lda.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    sta.b 0x08
    sep #0x20
    lda.w 0x0027,X
    and.b #0x7F
    bne .F4C1

    lda.b #0x04
    sta.b 0x01
    ldx.w #0x0200
    stx.b 0x1C
    lda.b #0x20
    sta.b 0x1E
    stz.b 0x1A
    stz.b 0x1B
.F4C1:
    sep #0x10
    jsl 0x848EEA
    jml 0x82808F

.F4CB:
    jsl 0x848EEA
    jsl 0x8281FB
    jsl 0x82808F
    lda.b 0x0E
    bne .F4DF

    jml 0x828398

.F4DF:
    rtl

;-----

_82F4E0:
    ldx.b 0x01
    jmp (.F4E5,X)

.F4E5: d16[.F4EB, .F52F, .F549]

.F4EB:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x12
    lda.l 0x7F8238
    sta.b 0x18
    lda.l 0x7F8338
    sta.b 0x11
    rep #0x20
    jsl 0x849086
    and.w #0x0006
    tax
    lda.w 0x00DE8E,X
    sta.b 0x1A
    jsl 0x849086
    and.w #0x0006
    tax
    lda.w 0x00DE96,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x04
    sta.b 0x1E
    stz.b 0x1F
    lda.b #0x78
    sta.b 0x10
    lda.b #0x39
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
.F52F:
    dec.b 0x10
    bne .F537

    lda.b #0x04
    sta.b 0x01
.F537:
    jsl 0x828174
    lda.w 0x0B9C
    lsr
    bcc .F545

    jsl 0x8280B4
.F545:
    jml 0x848EEA

.F549:
    jml 0x828398

;-----

_82F54D:
    ldx.b 0x01
    bne .F5A2

    rep #0x20
    lda.w 0x0BAD
    cmp.b 0x05
    sep #0x20
    bcc .F560

    jml 0x828398

.F560:
    inc.b 0x01
    lda.b 0x0B
    and.b #0x07
    tax
    lda.w 0x86DEA1,X
    sta.b 0x12
    txa
    asl
    tax
    rep #0x20
    lda.w 0x86DEA9,X
    sta.b 0x1A
    sep #0x20
    lda.b 0x0B
    and.b #0x30
    lsr
    lsr
    lsr
    lsr
    sta.w 0x0000
    tax
    lda.w 0x86DE9E,X
    tax
    lda.l 0x7F8200,X
    sta.b 0x18
    lda.l 0x7F8300,X
    sta.b 0x11
    lda.b #0x3A
    clc
    adc.w 0x0000
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
.F5A2:
    lda.b 0x16
    and.b #0x7F
    cmp.b #0x3C
    bne .F5AD

    jsr _82F5C1
.F5AD:
    jsl 0x82823E
    jsl 0x82808F
    lda.b 0x0E
    bne .F5BD

    jml 0x828398

.F5BD:
    jml 0x848EEA

;-----

_82F5C1:
    lda.w 0x0B9C
    and.b #0x07
    bne .F610

    jsl 0x8282D3
    bne .F60E

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
    stz.w 0x000C,X
    rep #0x20
    jsl 0x849086
    and.w #0x000F
    sta.w 0x0000
    jsl 0x849086
    and.w #0x000F
    sta.w 0x0002
    lda.b 0x05
    clc
    adc.w #0x0011
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0xFFED
    clc
    adc.w 0x0002
    sta.w 0x0008,X
.F60E:
    sep #0x30
.F610:
    rts

;-----

_82F611:
    lda.b 0x01
    bne .F627

    inc.b 0x01
    lda.b #0x34
    tsb.b 0x11
    stz.b 0x18
    lda.b #0x17
    sta.b 0x16
    lda.b 0x0B
    jsl 0x848F07
.F627:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .F633

    jml 0x828398

.F633:
    jml 0x82808F

;-----

_82F637:
    lda.b 0x01
    bne .F66C

    inc.b 0x01
    lda.b #0x37
    sta.b 0x16
    lda.b 0x0B
    bpl .F649

    lda.b #0x49
    sta.b 0x16
.F649:
    lda.b 0x0B
    and.b #0x7F
    tax
    lda.w 0x86DF09,X
    sta.b 0x1E
    lda.w 0x86DEB9,X
    jsl 0x848F07
    lda.b 0x0B
    asl
    tax
    rep #0x20
    lda.w 0x86DEC9,X
    sta.b 0x1A
    lda.w 0x86DEE9,X
    sta.b 0x1C
    sep #0x20
.F66C:
    jsl 0x848EEA
    jsl 0x8281E8
    lda.b 0x0B
    eor.w 0x0B9C
    lsr
    bcc .F684

    jsl 0x8280B4
    lda.b 0x0E
    beq .F685

.F684:
    rtl

.F685:
    jml 0x828398

;-----

_82F689:
    lda.b 0x01
    bne .F6DD

    inc.b 0x01
    stz.b 0x18
    lda.b #0x27
    sta.b 0x16
    ldx.b 0x0B
    lda.w 0x86DF19,X
    jsl 0x848F07
    ldx.b 0x0B
    lda.w 0x86DF46,X
    sta.b 0x1E
    lda.w 0x86DF34,X
    sta.b 0x1B
    stz.b 0x1A
    lda.w 0x86DF3D,X
    sta.b 0x1D
    stz.b 0x1C
    rep #0x20
    lda.w 0x86DF22,X
    and.w #0x00FF
    bit.w #0x0080
    beq .F6C3

    ora.w #0xFF00
.F6C3:
    clc
    adc.b 0x05
    sta.b 0x05
    lda.w 0x86DF2B,X
    and.w #0x00FF
    bit.w #0x0080
    beq .F6D6

    ora.w #0xFF00
.F6D6:
    clc
    adc.b 0x08
    sta.b 0x08
    sep #0x20
.F6DD:
    jsl 0x8281E8
    jsl 0x82806E
    bcs .F6EB

    jml 0x8280B4

.F6EB:
    jml 0x828398

;-----

_82F6EF:
    lda.b 0x01
    bne .F743

    inc.b 0x01
    stz.b 0x18
    lda.b #0x36
    sta.b 0x16
    ldx.b 0x0B
    lda.w 0x86DF4F,X
    jsl 0x848F07
    ldx.b 0x0B
    lda.w 0x86DF90,X
    sta.b 0x1E
    lda.w 0x86DF76,X
    sta.b 0x1B
    stz.b 0x1A
    lda.w 0x86DF83,X
    sta.b 0x1D
    stz.b 0x1C
    rep #0x20
    lda.w 0x86DF5C,X
    and.w #0x00FF
    bit.w #0x0080
    beq .F729

    ora.w #0xFF00
.F729:
    clc
    adc.b 0x05
    sta.b 0x05
    lda.w 0x86DF69,X
    and.w #0x00FF
    bit.w #0x0080
    beq .F73C

    ora.w #0xFF00
.F73C:
    clc
    adc.b 0x08
    sta.b 0x08
    sep #0x20
.F743:
    jsl 0x8281E8
    jsl 0x82806E
    bcs .F759

    lda.w 0x0B9C
    eor.b 0x0B
    lsr
    bcc .F75D

    jml 0x8280B4

.F759:
    jml 0x828398

.F75D:
    rtl

;-----

_82F75E:
    ldx.b 0x01
    jmp (.F763,X)

.F763: d16[.F769, .F781, .F7BD]

.F769:
    lda.b #0x02
    sta.b 0x01
    lda.l 0x7F823F
    sta.b 0x18
    lda.b #0x04
    sta.b 0x12
    lda.b #0x3F
    sta.b 0x16
    lda.b 0x0B
    jml 0x848F07

.F781:
    lda.l 0x7F833F
    ora.b #0x30
    sta.b 0x11
    rep #0x31
    ldx.b 0x0C
    lda.w 0x0005,X
    adc.w #0xFFF5
    sta.b 0x05
    lda.w 0x0008,X
    clc
    adc.w #0x002F
    sta.b 0x08
    sep #0x20
    lda.w 0x0027,X
    bmi .F7AF

    and.b #0x7F
    bne .F7B3

    lda.b #0x04
    sta.b 0x01
    bra .F7B3

.F7AF:
    lda.b #0x0E
    trb.b 0x11
.F7B3:
    sep #0x10
    jsl 0x8280B4
    jml 0x848EEA

.F7BD:
    jml 0x828398

;-----

_82F7C1:
    ldx.b 0x01
    bne .F7EB

    jsl 0x84A23A
    tya
    beq .F7D0

    jml 0x828398

.F7D0:
    inc.b 0x01
    stz.b 0x0F
    rep #0x30
    stz.b 0x0C
    lda.w #0x0004
    sta.b 0x14
    phb
    ldx.w #0xDF9D
    ldy.w #0x0AAF
    lda.w #0x0006
    mvn 0x00,0x86
    plb
.F7EB:
    rep #0x30
    jsr _82F8AC
    jsr _82F7FD
    lda.b 0x0F
    eor.w #0x0001
    sta.b 0x0F
    sep #0x30
    rtl

;-----

_82F7FD:
    ldx.w #0x0000
    lda.b 0x0F
    lsr
    bcc .F808

    ldx.w #0x0024
.F808:
    stx.w 0x0000
    ldx.w #0x0014
    lda.w #0x02F8
    sec
    sbc.w 0x1E90
    beq .F84F

    bmi .F84F

    cmp.w #0x0071
    bcc .F83F

    cmp.w #0x00E0
    bcc .F826

    lda.w #0x00E0
.F826:
    tay
    lda.w #0x0070
    sta.w 0x0B22,X
    lda.w #0xDA3C
    clc
    adc.w 0x0000
    sta.w 0x0B23,X
    tya
    inx
    inx
    inx
    sec
    sbc.w #0x0070
.F83F:
    sta.w 0x0B22,X
    lda.w #0xDA3C
    clc
    adc.w 0x0000
    sta.w 0x0B23,X
    inx
    inx
    inx
.F84F:
    lda.w 0x1E90
    clc
    adc.w #0x00E0
    sec
    sbc.w #0x02F8
.F85A:
    cmp.w #0x0011
    bcc .F882

    cmp.w #0x00E0
    bcc .F867

    lda.w #0x00E0
.F867:
    tay
    lda.w #0x0090
    sta.w 0x0B22,X
    lda.w #0xDA1A
    clc
    adc.w 0x0000
    sta.w 0x0B23,X
    tya
    inx
    inx
    inx
    sec
    sbc.w #0x0010
    bra .F85A

.F882:
    ora.w #0x0080
    sta.w 0x0B22,X
    lda.w #0xDA1A
    clc
    adc.w 0x0000
    sta.w 0x0B23,X
    inx
    inx
    inx
    lda.w #0x0001
    sta.w 0x0B22,X
    lda.w #0xDA3C
    clc
    adc.w 0x0000
    sta.w 0x0B23,X
    inx
    inx
    inx
    stz.w 0x0B22,X
    rts

;-----

_82F8AC:
    ldx.w #0x0000
    lda.b 0x0F
    lsr
    bcc .F8B7

    ldx.w #0x0024
.F8B7:
    lda.w 0x1E90
    sta.l 0x7FDA3C,X
    lda.w #0x0010
    sta.w 0x0000
    lda.w 0x1E90
    sec
    sbc.w #0x02F8
    bpl .F8D0

    lda.w #0x0000
.F8D0:
    clc
    adc.b 0x0C
    and.w #0x000F
    tay
.F8D7:
    lda 0x00DFA4,Y
    and.w #0x00FF
    clc
    adc.w 0x1E90
    sta.l 0x7FDA1A,X
    tya
    inc
    and.w #0x000F
    tay
    inx
    inx
    dec.w 0x0000
    bpl .F8D7

    dec.b 0x14
    bne .F8FD

    lda.w #0x0004
    sta.b 0x14
    inc.b 0x0C
.F8FD:
    rts

;-----

_82F8FE:
    lda.b 0x01
    bne .F92E

    inc.b 0x01
    stz.b 0x18
    lda.b 0x11
    and.b #0x70
    ora.b #0x04
    sta.b 0x11
    stz.b 0x12
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    lda.w #0x0010
    ldx.b 0x0B
    beq .F920

    lda.w #0x0008
.F920:
    sta.b 0x1E
    sep #0x20
    lda.b #0x17
    sta.b 0x16
    lda.b 0x0B
    jml 0x848F07

.F92E:
    lda.b 0x0F
    bpl .F936

    jml 0x828398

.F936:
    jsl 0x848EEA
    jsl 0x8281B2
    jml 0x8280B4

;-----

_82F942:
    ldx.b 0x01
    jmp (.F947,X)

.F947: d16[.F94D, .F95F, .F9B8]

.F94D:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x12
    lda.l 0x7F825C
    sta.b 0x18
    lda.b #0x61
    sta.b 0x16
.F95F:
    lda.l 0x7F835C
    ora.b #0x02
    sta.l 0x7F835C
    lda.l 0x7F835C
    ora.b #0x20
    and.b #0xFD
    sta.b 0x11
    ldx.b 0x02
    jsr (.F9A5,X)
    rep #0x30
    ldx.b 0x0C
    lda.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    sta.b 0x08
    sep #0x20
    lda.w 0x0038,X
    lsr
    bcc .F992

    lda.b #0x0E
    trb.b 0x11
.F992:
    lda.w 0x0027,X
    cmp.b #0xFF
    bne .F99F

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.F99F:
    sep #0x10
    jml 0x8280B4

.F9A5: d16[.F9A9, .F9B3]

.F9A9:
    lda.b #0x02
    sta.b 0x02
    lda.b 0x10
    jsl 0x848F07
.F9B3:
    jsl 0x848EEA
    rts

.F9B8:
    rep #0x10
    lda.l 0x7F835C
    ora.b #0x02
    sta.l 0x7F835C
    ldx.b 0x0C
    lda.w 0x0027,X
    bne .F9CF

    jml 0x828398

.F9CF:
    lda.w 0x0B9C
    lsr
    bcc .F9D9

    jml 0x8280B4

.F9D9:
    rtl

;-----

_82F9DA:
    ldx.b 0x01
    bne .FA44

    rep #0x30
    ldx.w #0x1928
.F9E3:
    lda.w 0x0000,X
    beq .F9FC

    tdc
    sta.w 0x0000
    cpx.w 0x0000
    beq .F9FC

    lda.w 0x000A,X
    cmp.b 0x0A
    bne .F9FC

    jml 0x828387

.F9FC:
    txa
    clc
    adc.w #0x0020
    tax
    cmp.w #0x1D08
    bcc .F9E3

    sep #0x30
    lda.b #0x80
    tsb.b 0x00
    inc.b 0x01
    stz.w 0x0000
    lda.w 0x00D2
    cmp.b #0x02
    beq .FA3A

    lda.w 0x1F7A
    cmp.b #0x04
    beq .FA30

    cmp.b #0x06
    bne .FA3A

    bit.w 0x1F90
    bvc .FA3A

    lda.b #0x0E
    sta.w 0x0000
    bra .FA3A

.FA30:
    bit.w 0x1F96
    bvc .FA3A

    lda.b #0x0A
    sta.w 0x0000
.FA3A:
    lda.b 0x0B
    clc
    adc.w 0x0000
    jml 0x848F7D

.FA44:
    lda.w 0x0BCF
    and.b #0x7F
    beq .FA65

    rep #0x30
    lda.b 0x0B
    and.w #0x00FF
    asl
    tax
    lda.w 0x0BAD
    cmp.w 0x86E327,X
    bcc .FA66

    cmp.w 0x86E363,X
    bcs .FA65

    jml 0x848F52

.FA65:
    rtl

.FA66:
    jml 0x828387

;-----

_82FA6A:
    ldx.b 0x01
    jmp (.FA6F,X)

.FA6F: d16[.FA75, .FA91, .FAE6]

.FA75:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x02
    sta.b 0x12
    stz.b 0x18
    lda.l 0x7F8325
    sta.b 0x11
    rep #0x20
    stz.b 0x1A
    stz.b 0x1E
    sep #0x20
    lda.b #0x26
    sta.b 0x16
.FA91:
    ldx.b 0x02
    jsr (.FA9A,X)
    jml 0x8280B4

.FA9A: d16[.FA9E, .FAD3]

.FA9E:
    lda.b #0x02
    sta.b 0x02
    rep #0x20
    jsl 0x849086
    and.w #0x07FF
    sta.w 0x0000
    lda.b 0x0B
    and.w #0x00FF
    asl
    tax
    lda.w 0x86E3ED,X
    sec
    sbc.w 0x0000
    sta.b 0x1C
    lda.b 0x08
    clc
    adc.w #0x0028
    sta.b 0x0C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    lda.b #0x03
    jsl 0x848F07
.FAD3:
    rep #0x20
    lda.b 0x08
    cmp.b 0x0C
    sep #0x20
    bcc .FAE1

    lda.b #0x04
    sta.b 0x01
.FAE1:
    jsl 0x828174
    rts

.FAE6:
    jml 0x828398

;-----

_82FAEA:
    ldx.b 0x01
    bne .FB0F

    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x12
    lda.l 0x7F838F
    sta.b 0x11
    lda.l 0x7F828F
    sta.b 0x18
    lda.b #0x9B
    sta.b 0x16
    lda.b 0x0B
    clc
    adc.b #0x05
    jsl 0x848F07
.FB0F:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .FB1B

    jml 0x828398

.FB1B:
    rep #0x30
    ldx.b 0x0C
    lda.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    sta.b 0x08
    sep #0x30
    jml 0x8280B4

;-----

_82FB2F:
    ldx.b 0x01
    bne .FB51

    rep #0x20
    lda.w 0x0BAD
    cmp.w #0x1B60
    bcc .FB50

    lda.w #0x1B40
    sta.w 0x1E5E
    lda.w #0x1D00
    sta.w 0x1E60
    ldx.b #0x02
    stx.w 0x1F81
    inc.b 0x01
.FB50:
    rtl

.FB51:
    rep #0x10
    ldx.w 0x1E4D
    cpx.w #0x1AE0
    bcc .FB50

    jsl 0x828321
    bne .FB50

    inc.w 0x0000,X
    lda.b #0x1A
    sta.w 0x000A,X
    jml 0x828398

;-----

_82FB6D:
    ldx.b 0x01
    jsr (.FB7D,X)
    ldx.b #0x00
    ldy.b #0x00
    jsl 0x82FC41
    jmp _82FC73

.FB7D: d16[.FB85, .FBA0, .FBED, .FBF6]

.FB85:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x01
    sta.b 0x03
    lda.b 0x0B
    beq .FB97

    lda.b #0x04
    sta.b 0x02
    bra .FB9B

.FB97:
    lda.b #0x06
    sta.b 0x02
.FB9B:
    lda.b #0x01
    sta.b 0x0F
    rts

.FBA0:
    ldx.b #0x00
    ldy.b #0x00
    jsl 0x82FC41
    beq .FBAD

    jmp .FBEC

.FBAD:
    lda.b 0x02
    beq .FBEC

    lda.b 0x0B
    beq .FBBD

    lda.b 0x02
    cmp.b #0x04
    bne .FBDD

    bra .FBC3

.FBBD:
    lda.b 0x02
    cmp.b #0x06
    bne .FBDD

.FBC3:
    dec.b 0x03
    bne .FBEC

    lda.b #0x80
    sta.b 0x03
    jsl 0x849086
    and.b #0x0F
    cmp.b #0x0D
    bpl .FBDD

    dec.b 0x0F
    bne .FBEC

    lda.b #0x03
    sta.b 0x0F
.FBDD:
    lda.b #0x04
    sta.b 0x01
    jsr _82FC7E
    lda.b #0x24
    sta.b 0x03
    bra .FBEC

    dec.b 0x0F
.FBEC:
    rts

.FBED:
    dec.b 0x03
    bne .FBF5

    lda.b #0x06
    sta.b 0x01
.FBF5:
    rts

.FBF6:
    jsl 0x828321
    bne .FC28

    dec.b 0x02
    dec.b 0x02
    lda.b 0x02
    sta.w 0x0033,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    lda.b #0x1C
    sta.w 0x000A,X
    inc.w 0x0000,X
    lda.b 0x0B
    sta.w 0x000B,X
    lda.b 0x02
    bne .FBF6

.FC28:
    sep #0x10
    lda.b #0x3C
    sta.b 0x03
    lda.b 0x0B
    beq .FC38

    lda.b #0x04
    sta.b 0x02
    bra .FC3C

.FC38:
    lda.b #0x06
    sta.b 0x02
.FC3C:
    lda.b #0x02
    sta.b 0x01
    rts

;-----

_82FC41:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .FC4F

    eor.w #0xFFFF
    inc
.FC4F:
    cmp.w 0x86E47E,X
    bcs .FC6E

    cpy.b #0x00
    beq .FC69

    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .FC64

    eor.w #0xFFFF
    inc
.FC64:
    cmp.w 0x86E47E,X
    bcs .FC6E

.FC69:
    sep #0x20
    lda.b #0x00
    rtl

.FC6E:
    sep #0x20
    lda.b #0x01
    rtl

;-----

_82FC73:
    jsl 0x82806E
    bcc .FC7D

    jml 0x828387

.FC7D:
    rtl

;-----

_82FC7E:
    rep #0x10
    jsl 0x8282D3
    bne .FCA6

    inc.w 0x0000,X
    lda.b #0x17
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.FCA6:
    sep #0x30
    rts

;-----

_82FCA9:
    lda.b 0x01
    bne .FCBE

    inc.b 0x01
    stz.b 0x06
    ldx.b #0x00
    lda.w 0x00E482,X
    sta.w 0x1F2D
    lda.w 0x00E483
    sta.b 0x07
.FCBE:
    rep #0x20
    lda.w 0x1E50
    sec
    sbc.w 0x1F2D
    sec
    sbc.w #0x00B0
    sta.b 0x04
    bmi .FCDB

    cmp.w #0x0100
    bcc .FCDD

    lda.w #0x0100
    sta.b 0x04
    bra .FCDD

.FCDB:
    stz.b 0x04
.FCDD:
    lda.b 0x04
    sta.w 0x00BE
    sep #0x30
    bra .FD02

    dec.b 0x07
    bne .FD02

    ldx.b 0x06
    inx
    inx
    lda.w 0x00E482,X
    bpl .FCF8

    ldx.b #0x00
    lda.w 0x00E482,X
.FCF8:
    sta.w 0x1F2D
    lda.w 0x00E483,X
    sta.b 0x07
    stx.b 0x06
.FD02:
    rtl

;-----

_82FD03:
    lda.b 0x01
    bne .FD19

    lda.w 0x0BCF
    and.b #0x7F
    bne .FD14

    inc.b 0x01
    lda.b #0x3C
    sta.b 0x09
.FD14:
    jsr _82FD4B
    bra .FD2E

.FD19:
    lda.b 0x09
    beq .FD21

    dec.b 0x09
    bra .FD2E

.FD21:
    lda.w 0x0B9C
    and.b #0x03
    bne .FD2E

    dec.b 0x0B
    bpl .FD2E

    stz.b 0x0B
.FD2E:
    lda.b 0x0B
    cmp.b 0x04
    beq .FD46

    stz.b 0x05
    stz.b 0x06
    lda.b 0x0B
    sta.w 0x00CB
    sta.w 0x00CC
    lda.b 0x0B
    lsr
    sta.w 0x00CD
.FD46:
    lda.b 0x0B
    sta.b 0x04
    rtl

;-----

_82FD4B:
    rep #0x20
    stz.b 0x05
    ldx.b #0x00
.FD51:
    lda.w 0x86E4BF,X
    cmp.w 0x1E4D
    beq .FD63

    bcs .FD69

    sta.b 0x05
    inx
    inx
    cpx.b #0x20
    bcc .FD51

.FD63:
    ldx.b #0x00
    stx.b 0x0B
    bra .FDC3

.FD69:
    sta.b 0x07
    sec
    sbc.w 0x1E4D
    bcs .FD75

    eor.w #0xFFFF
    inc
.FD75:
    sta.b 0x07
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    bcs .FD83

    eor.w #0xFFFF
    inc
.FD83:
    cmp.b 0x07
    bcc .FD98

    lda.b 0x07
    bra .FD98

    lda.w 0x1E4D
    sec
    sbc.w 0x86E4BF
    bcs .FD98

    eor.w #0xFFFF
    inc
.FD98:
    cmp.w #0x0040
    bcs .FDA2

    lda.w #0x0000
    bra .FDA6

.FDA2:
    sec
    sbc.w #0x0040
.FDA6:
    sta.w 0x4204
    sep #0x20
    lda.b #0x0C
    sta.w 0x4206
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    lda.w 0x4214
    cmp.b #0x07
    bcc .FDC1

    lda.b #0x07
.FDC1:
    sta.b 0x0B
.FDC3:
    sep #0x30
    rts

;-----

_82FDC6:
    ldx.b 0x01
    bne .FDD1

    inc.b 0x01
    lda.b #0x78
    sta.b 0x0E
    rtl

.FDD1:
    dec.b 0x0E
    bne .FDD9

    jml 0x828398

.FDD9:
    lda.w 0x0B9C
    and.b #0x07
    bne .FE06

    jsl 0x8282D3
    bne .FE04

    inc.w 0x0000,X
    lda.b #0x20
    sta.w 0x000A,X
    rep #0x21
    lda.b 0x08
    sta.w 0x0008,X
    jsl 0x849086
    and.w #0x001F
    clc
    adc.b 0x05
    sta.w 0x0005,X
    sep #0x20
.FE04:
    sep #0x10
.FE06:
    rtl

;-----

_82FE07:
    lda.b 0x01
    bne .FE18

    inc.b 0x01
    lda.w 0x1F90
    and.b #0x40
    bne .FE18

    jml 0x828398

.FE18:
    rep #0x20
    lda.b 0x05
    cmp.w 0x0BAD
    bcs .FE3C

    lda.w 0x1E4D
    sta.w 0x1E60
    sta.w 0x1E5E
    lda.w 0x1E50
    sta.w 0x1E6E
    sta.w 0x1E68
    sep #0x20
    inc.w 0x1F23
    jml 0x828398

.FE3C:
    sep #0x20
    jsl 0x82806E
    bcc .FE48

    jml 0x828387

.FE48:
    rtl

;-----

_82FE49:
    ldx.b 0x01
    bne .FE53

    inc.b 0x01
    jml 0x84A187

.FE53:
    jsl 0x828321
    inc.w 0x0000,X
    lda.b #0x23
    sta.w 0x000A,X
    lda.b 0x0B
    sta.w 0x000B,X
    beq .FE6E

    rep #0x20
    lda.w #0x04A0
    sta.w 0x0008,X
.FE6E:
    sep #0x30
    jml 0x828398

;-----

_82FE74:
    ldx.b 0x01
    bne .FE7E

    lda.b #0x02
    sta.b 0x02
    stz.b 0x0F
.FE7E:
    jsl 0x82806E
    bcc _82FE88

    jml 0x828387

;-----

_82FE88:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x02
    bne .FE93

    jmp .FF17

.FE93:
    dec.b 0x02
    rep #0x10
    jsl 0x828321
    bne .FF17

    rep #0x20
    lda.b 0x0B
    and.w #0x00FF
    beq .FEBF

    lda.b 0x02
    and.w #0x00FF
    beq .FEB6

    lda.w #0xFFE0
    sta.w 0x0000
    jmp .FED5

.FEB6:
    lda.w #0xFFD0
    sta.w 0x0000
    jmp .FED5

.FEBF:
    lda.b 0x02
    and.w #0x00FF
    beq .FECF

    lda.w #0x0020
    sta.w 0x0000
    jmp .FED5

.FECF:
    lda.w #0x0030
    sta.w 0x0000
.FED5:
    lda.b 0x02
    and.w #0x00FF
    beq .FEE2

    stz.w 0x0002
    jmp .FEE8

.FEE2:
    lda.w #0x0010
    sta.w 0x0002
.FEE8:
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w 0x0002
    sta.w 0x0008,X
    tdc
    sta.w 0x0036,X
    sep #0x20
    lda.b #0x3F
    sta.w 0x000A,X
    inc.w 0x0000,X
    lda.b 0x02
    sta.w 0x0038,X
    lda.b 0x0B
    sta.w 0x000B,X
    sep #0x10
    jmp _82FE88

.FF17:
    lda.b 0x0F
    bne .FF59

    rep #0x10
    jsl 0x8282D3
    bne .FF59

    inc.w 0x0000,X
    lda.b #0x38
    sta.w 0x000A,X
    lda.b #0x03
    sta.w 0x000B,X
    lda.b #0x01
    sta.b 0x0F
    lda.b #0x00
    sta.w 0x0011,X
    sta.w 0x000C,X
    lda.b #0x02
    sta.w 0x0002,X
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0024
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0008
    sta.w 0x0008,X
    tdc
    sta.w 0x001E,X
.FF59:
    sep #0x30
    rtl

;-----

_82FF5C:
    lda.b 0x01
    bne .FF77

    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    sep #0x20
    bcc .FF9F

    inc.b 0x01
    lda.b #0xA6
    sta.b 0x03
    lda.b #0x01
    sta.b 0x02
    rtl

.FF77:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bmi .FF9E

    asl
    sep #0x20
    lda.b #0x00
    xba
    sec
    sbc.b 0x02
    bmi .FF9E

    ldy.b 0x03
    jsl _828000.8011
    inc.b 0x03
    inc.b 0x03
    lda.b 0x02
    cmp.b #0x09
    beq .FF9F

    inc.b 0x02
.FF9E:
    rtl

.FF9F:
    jml 0x828398

;-----

d08[
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,
]
