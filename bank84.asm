org 0x8000*4
base 0x848000

;-----

_848000:
    php
    sep #0x30
    stz.w 0x002C
    stz.w 0x002D
    stz.w 0x002E
    stz.w 0x002F
    bra .8014

.8011:
    php
    sep #0x30
.8014:
    xba
    lda.b #0x00
    xba
    asl
    tay
    phd
    phb
    lda.b #0x84
    pha
    plb
    pea 0x0000
    pld
    tya
    ldx.w 0x1F7A
    adc.w 0x84B899,X
    tax
    lda.w 0x84B899,X
    sta.b 0x20
    lda.w 0x84B89A,X
    sta.b 0x21
    rep #0x10
    ldx.w #0x5000
    stx.w 0x1FA1
    ldx.w 0x0B95
    stx.w 0x1FAD
    ldx.w #0x0000
    lda (0x20)
    bne .804E

    jmp .80E9

.804E:
    lsr
    bcs .8060

    ldx.w #0x5800
    stx.w 0x1FA1
    ldx.w 0x0B98
    stx.w 0x1FAD
    ldx.w #0x8600
.8060:
    stx.b 0x28
    ldy.w #0x0001
    rep #0x20
.8067:
    stz.w 0x1FA5
    stz.w 0x1FA3
    ldx.w #0x0020
    stz.w 0x1FA9
    lda (0x20),Y
    and.w #0x007F
    beq .80E9

    lsr
    bcc .8086

    ldx.w #0x0001
    inc.w 0x1FA9
    inc.w 0x1FA9
.8086:
    stx.b 0x08
    sta.b 0x0A
    lda (0x20),Y
    and.w #0x0081
    sta.w 0x1FA7
    iny
    lda (0x20),Y
    clc
    adc.b 0x2C
    sta.b 0x00
    iny
    iny
    lda (0x20),Y
    clc
    adc.b 0x2E
    sta.b 0x02
    iny
    iny
    lda (0x20),Y
    clc
    adc.b 0x20
    sta.b 0x24
    iny
    iny
.80AE:
    phy
    lda.b 0x28
    bne .80B8

    jsr _849156.916A
    bra .80BB

.80B8:
    jsr _849156.915E
.80BB:
    ply
    clc
    adc.b 0x28
    tax
    lda (0x24)
    sta.l 0x7E2000,X
    jsr _8480ED
    inc.b 0x24
    inc.b 0x24
    phx
    ldx.w 0x1FA9
    lda.b 0x00,X
    clc
    adc.w #0x0010
    sta.b 0x00,X
    plx
    dec.b 0x0A
    bne .80AE

    lda.w 0x1FA3
    beq .80E6

    jsr _848158
.80E6:
    jmp .8067

.80E9:
    plb
    pld
    plp
    rtl

;-----

_8480ED:
    jsr _848107
    beq .80F4

    bcs .8106

.80F4:
    inc.w 0x1FA3
    lda.w 0x1FA5
    bne .8106

    inc.w 0x1FA5
    lda.b 0x24
    sta.b 0x1C
    jsr _848317
.8106:
    rts

;-----

_848107:
    lda.w #0x1E4D
    sta.b 0x14
    lda.w #0x1E50
    sta.b 0x18
    lda.b 0x28
    beq .811F

    lda.w #0x1E8D
    sta.b 0x14
    lda.w #0x1E90
    sta.b 0x18
.811F:
    lda (0x14)
    clc
    adc.w #0x0080
    sta.b 0x22
    lda.b 0x00
    and.w #0xFFF0
    clc
    adc.w #0x0008
    sec
    sbc.b 0x22
    clc
    adc.w #0x0098
    cmp.w #0x0130
    bcs .8157

    lda (0x18)
    clc
    adc.w #0x0070
    sta.b 0x22
    lda.b 0x02
    and.w #0xFFF0
    clc
    adc.w #0x0008
    sec
    sbc.b 0x22
    clc
    adc.w #0x0078
    cmp.w #0x00F0
.8157:
    rts

;-----

_848158:
    phy
    lda.b 0x08
    lsr
    bcs .8165

    jsr _848182
    bcs .817D

    bra .816A

.8165:
    jsr _8481E7
    bcs .817D

.816A:
    jsr _848241
    lda.w 0x0012
    sta.b 0x0C
    lda.w 0x001E
    sta.b 0x1C
    lda.w 0x0026
    sta.w 0x1FA3
.817D:
    jsr _848241
    ply
    rts

;-----

_848182:
    lda.w 0x1FA3
    asl
    dec
    clc
    adc.b 0x0C
    sta.b 0x22
    lda.b 0x0C
    ora.w #0x001F
    cmp.b 0x22
    bcs .81E6

    lda.b 0x0C
    sta.w 0x0012
    lda.b 0x1C
    sta.w 0x001E
    lda.w 0x1FA3
    sta.w 0x0026
    lda.b 0x0C
    ora.w #0x001F
    inc
    sec
    sbc.b 0x0C
    lsr
    sta.w 0x0026
    eor.w #0xFFFF
    inc
    clc
    adc.w 0x1FA3
    sta.w 0x1FA3
    lda.w 0x0026
    asl
    clc
    adc.b 0x1C
    sta.b 0x1C
    ldx.w #0x5800
    lda.b 0x28
    beq .81D0

    ldx.w #0x6000
.81D0:
    stx.b 0x22
    lda.b 0x0C
    and.w #0xFFE0
    clc
    adc.w #0x0400
    cmp.b 0x22
    bcc .81E3

    sec
    sbc.w #0x0800
.81E3:
    sta.b 0x0C
    clc
.81E6:
    rts

;-----

_8481E7:
    lda.w 0x1FA3
    dec
    asl
    asl
    asl
    asl
    asl
    asl
    clc
    adc.b 0x0C
    sta.b 0x22
    lda.b 0x0C
    ora.w #0x03E0
    cmp.b 0x22
    bcs .8240

    lda.b 0x0C
    sta.w 0x0012
    lda.b 0x1C
    sta.w 0x001E
    lda.w 0x1FA3
    sta.w 0x0026
    lda.b 0x0C
    ora.w #0x03E0
    clc
    adc.w #0x0020
    sec
    sbc.b 0x0C
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.w 0x0026
    eor.w #0xFFFF
    inc
    clc
    adc.w 0x1FA3
    sta.w 0x1FA3
    lda.w 0x0026
    asl
    clc
    adc.b 0x1C
    sta.b 0x1C
    lda.b 0x0C
    and.w #0xFC1F
    sta.b 0x0C
    clc
.8240:
    rts

;-----

_848241:
    lda.w 0x00A5
    and.w #0x07FF
    clc
    adc.w #0xF000
    sta.b 0x14
    lda.w 0x1FA3
    asl
    asl
    adc.w #0x0004
    adc.b 0x14
    sta.b 0x18
    lda.w #0x007E
    sta.b 0x16
    sta.b 0x1A
    sep #0x20
    ldy.w #0x0000
    lda.w 0x1FA7
    sta [0x14],Y
    sta [0x18],Y
    iny
    rep #0x20
    lda.b 0x0C
    sta [0x14],Y
    clc
    adc.b 0x08
    sta [0x18],Y
    iny
    iny
    sep #0x20
    lda.w 0x1FA3
    asl
    asl
    sta [0x14],Y
    sta [0x18],Y
    iny
    rep #0x20
.8288:
    lda (0x1C)
    asl
    asl
    asl
    clc
    adc.w 0x1FAD
    sta.b 0x24
    phb
    sep #0x20
    lda.w 0x0B97
    phx
    ldx.b 0x28
    beq .82A1

    lda.w 0x0B9A
.82A1:
    plx
    pha
    plb
    rep #0x20
    lda.w 0x1FA9
    beq .82B0

    jsr _8482F2
    bra .82B3

.82B0:
    jsr _8482C9
.82B3:
    plb
    inc.b 0x1C
    inc.b 0x1C
    dec.w 0x1FA3
    bne .8288

    tya
    clc
    adc.b 0x18
    sec
    sbc.w #0xF000
    sta.w 0x00A5
    rts

;-----

_8482C9:
    lda (0x24)
    inc.b 0x24
    inc.b 0x24
    sta [0x14],Y
    iny
    iny
    lda (0x24)
    inc.b 0x24
    inc.b 0x24
    sta [0x14],Y
    dey
    dey
    lda (0x24)
    inc.b 0x24
    inc.b 0x24
    sta [0x18],Y
    iny
    iny
    lda (0x24)
    inc.b 0x24
    inc.b 0x24
    sta [0x18],Y
    iny
    iny
    rts

;-----

_8482F2:
    lda (0x24)
    inc.b 0x24
    inc.b 0x24
    sta [0x14],Y
    lda (0x24)
    inc.b 0x24
    inc.b 0x24
    sta [0x18],Y
    iny
    iny
    lda (0x24)
    inc.b 0x24
    inc.b 0x24
    sta [0x14],Y
    lda (0x24)
    inc.b 0x24
    inc.b 0x24
    sta [0x18],Y
    iny
    iny
    rts

;-----

_848317:
    lda.b 0x00
    and.w #0x0100
    asl
    asl
    clc
    adc.w 0x1FA1
    sta.b 0x0C
    lda.b 0x00
    and.w #0x00F0
    lsr
    lsr
    lsr
    sta.b 0x0E
    lda.b 0x02
    and.w #0x00F0
    asl
    asl
    clc
    adc.b 0x0E
    adc.b 0x0C
    sta.b 0x0C
    rts

    ldy.b #0x12
    jsl 0x828011
    rep #0x20
    phd
    lda.w #0x1E08
    tcd
    stz.b 0x00
    stz.b 0x02
    stz.b 0x14
    stz.b 0x21
    inc.b 0x00
    lda.w 0x1E4D
    sta.b 0x04
    sta.b 0x10
    lda.w 0x1E50
    sta.b 0x07
    sta.b 0x12
    lda.w 0x0B92
    sta.b 0x16
    lda.w #0x7080
    sta.b 0x1F
    sep #0x30
    lda.w 0x0B94
    sta.b 0x18
    lda.b #0x04
    sta.w 0x00A2
    lda.w 0x00C0
    sta.b 0x0E
    lda.w 0x00C1
    sta.b 0x0F
    lda.b #0x17
    sta.w 0x00C0
    stz.w 0x00C1
    lda.b #0x09
    sta.w snes_regs.bgmode
    jsl 0x80D1EF
.8393:
    stz.w 0x0B9D
.8396:
    lda.w 0x0B9D
    beq .8396

    ldx.b 0x01
    jsr (.83C5,X)
    jsr _84880F
    lda.w 0x00A7
    and.b #0x70
    cmp.b #0x70
    bne .8393

    lda.b 0x0E
    sta.w 0x00C0
    lda.b 0x0F
    sta.w 0x00C1
    pld
    stz.w 0x0B9D
.83BA:
    lda.w 0x0B9D
    beq .83BA

    lda.b #0x04
    sta.w 0x00A2
    rtl

.83C5: d16[.83D7, .845E, .84AB, .8516, .8500, .84AB, .85C2, .8500, .83D7]

.83D7:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x44
    sta.w 0x0000
    lda.b #0x08
    sta.w 0x0001
    lda.b #0x06
    sta.w 0x0002
    lda.b #0x6B
    sta.b 0x19
    lda.b #0xA5
    sta.b 0x1A
    jsr _84865B
    lda.b #0x64
    sta.w 0x0000
    lda.b #0x08
    sta.w 0x0001
    lda.b #0x06
    sta.w 0x0002
    lda.b #0x71
    sta.b 0x19
    lda.b #0xA5
    sta.b 0x1A
    jsr _84865B
    lda.b #0x84
    sta.w 0x0000
    lda.b #0x08
    sta.w 0x0001
    lda.b #0x0B
    sta.w 0x0002
    lda.b #0x77
    sta.b 0x19
    lda.b #0xA5
    sta.b 0x1A
    jsr _84865B
    lda.b #0x4F
    sta.w 0x0000
    lda.b #0x08
    sta.w 0x0001
    lda.b #0x08
    sta.w 0x0002
    lda.b #0x82
    sta.b 0x19
    lda.b #0xA5
    sta.b 0x1A
    jsr _84865B
    lda.b #0x6F
    sta.w 0x0000
    lda.b #0x08
    sta.w 0x0001
    lda.b #0x08
    sta.w 0x0002
    lda.b #0x8A
    sta.b 0x19
    lda.b #0xA5
    sta.b 0x1A
    jsr _84865B
    rts

.845E:
    jsr _848692
    rep #0x20
    phd
    lda.w #0x1E48
    tcd
    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
    lda.w 0x1E0C
    sta.b 0x05
    lda.w 0x1E0F
    sta.b 0x08
    jsl 0x80D1F9
    jsl 0x80D1FD
    pld
    sep #0x30
    jsr _848705
    rep #0x20
    lda.b 0x04
    sta.w 0x00B4
    lda.b 0x07
    sta.w 0x00B6
    stz.w 0x00BC
    stz.w 0x00BE
    sep #0x30
    jsr _848822
    lda.w 0x00AC
    and.b #0x40
    beq .84AA

    lda.b #0x04
    sta.b 0x01
.84AA:
    rts

.84AB:
    lda.b #0x04
    sta.w 0x00A2
    lda.b #0x10
    trb.w 0x00C0
    stz.b 0x29
    lda.b #0x30
    sta.b 0x2B
    rep #0x20
    lda.b 0x04
    clc
    adc.w #0x0018
    sta.b 0x25
    lda.b 0x07
    clc
    adc.w #0x0018
    sta.b 0x27
    lda.b 0x04
    and.w #0x0008
    beq .84DB

    lda.b 0x04
    ora.w #0xFFF0
    bra .84E0

.84DB:
    lda.b 0x04
    and.w #0x000F
.84E0:
    sta.w 0x00BC
    lda.b 0x07
    and.w #0x0008
    beq .84F1

    lda.b 0x07
    ora.w #0xFFF0
    bra .84F6

.84F1:
    lda.b 0x07
    and.w #0x000F
.84F6:
    sta.w 0x00BE
    sep #0x20
    inc.b 0x01
    inc.b 0x01
    rts

.8500:
    lda.w 0x00AC
    and.b #0x40
    beq .8515

    inc.b 0x01
    inc.b 0x01
    lda.b #0x04
    sta.w 0x00A2
    lda.b #0x10
    tsb.w 0x00C0
.8515:
    rts

.8516:
    rep #0x30
    jsr _8488F9
    stz.b 0x23
    stz.w 0x0010
.8520:
    rep #0x30
    ldx.b 0x23
    lda.l 0x7EF0C8,X
    tay
    lda [0x16],Y
    and.w #0x00FF
    bne .854C

    sep #0x10
    ldx.w 0x0010
    lda.w #0x0000
    sta.l 0x7EF000,X
    sta.l 0x7EF002,X
    sta.l 0x7EF100,X
    sta.l 0x7EF102,X
    sep #0x20
    bra .8592

.854C:
    lda.l 0x7EF0C8,X
    sep #0x30
    xba
    txy
    jsr _8487F4
    ldx.w 0x0010
    lda.w 0x0001
    sta.l 0x7EF000,X
    lda.w 0x0000
    sta.l 0x7EF002,X
    lda.b 0x2B
    sta.l 0x7EF001,X
    sta.l 0x7EF003,X
    xba
    tyx
    jsr _8487F4
    ldx.w 0x0010
    lda.w 0x0001
    sta.l 0x7EF100,X
    lda.w 0x0000
    sta.l 0x7EF102,X
    lda.b 0x2B
    sta.l 0x7EF101,X
    sta.l 0x7EF103,X
.8592:
    lda.b 0x2B
    eor.b #0x0C
    sta.b 0x2B
    inc.b 0x23
    inc.b 0x23
    lda.w 0x0010
    clc
    adc.b #0x04
    sta.w 0x0010
    cmp.b #0x38
    bcs .85AC

    jmp .8520

.85AC:
    jsr _84893D
    lda.b 0x2B
    eor.b #0x0C
    sta.b 0x2B
    inc.b 0x29
    lda.b 0x29
    cmp.b #0x0C
    bcc .85C1

    inc.b 0x01
    inc.b 0x01
.85C1:
    rts

.85C2:
    rep #0x30
    jsr _8488F9
    stz.b 0x23
    stz.w 0x0010
.85CC:
    rep #0x30
    ldx.b 0x23
    lda.l 0x7EF0C8,X
    tay
    lda [0x16],Y
    and.w #0x00FF
    bne .85FA

    sep #0x10
    phx
    ldx.w 0x0010
    lda.w #0x0000
    sta.l 0x7EF000,X
    sta.l 0x7EF002,X
    sta.l 0x7EF100,X
    sta.l 0x7EF102,X
    plx
    sep #0x20
    bra .862E

.85FA:
    sep #0x30
    phx
    jsr _8487F4
    ldx.w 0x0010
    lda.w 0x0001
    sta.l 0x7EF000,X
    lda.w 0x0000
    sta.l 0x7EF002,X
    lda.b 0x2B
    sta.l 0x7EF001,X
    sta.l 0x7EF003,X
    lda.b #0x00
    sta.l 0x7EF100,X
    sta.l 0x7EF102,X
    sta.l 0x7EF101,X
    sta.l 0x7EF103,X
    plx
.862E:
    lda.b 0x2B
    eor.b #0x0C
    sta.b 0x2B
    inc.b 0x23
    inc.b 0x23
    lda.w 0x0010
    clc
    adc.b #0x04
    sta.w 0x0010
    cmp.b #0x38
    bcc .85CC

    jsr _84893D
    lda.b 0x2B
    eor.b #0x0C
    sta.b 0x2B
    inc.b 0x29
    lda.b 0x29
    cmp.b #0x0C
    bcc .865A

    inc.b 0x01
    inc.b 0x01
.865A:
    rts

;-----

_84865B:
    ldx.w 0x00A4
    lda.b #0x80
    sta.w 0x0600,X
    lda.w 0x0000
    sta.w 0x0601,X
    lda.w 0x0001
    sta.w 0x0602,X
    lda.w 0x0002
    asl
    sta.w 0x0603,X
    inx
    inx
    inx
    inx
    ldy.b #0x00
.867C:
    lda (0x19),Y
    sta.w 0x0600,X
    lda.b #0x20
    sta.w 0x0601,X
    inx
    inx
    iny
    cpy.w 0x0002
    bne .867C

    stx.w 0x00A4
    rts

;-----

_848692:
    stz.w 0x0001
    lda.w 0x00A8
    bit.b #0x80
    bne .86A3

    ldx.b #0x02
    stx.w 0x0000
    bra .86A8

.86A3:
    ldx.b #0x08
    stx.w 0x0000
.86A8:
    bit.b #0x0C
    beq .86AF

    jsr _8486BC
.86AF:
    lda.w 0x00A8
    bit.b #0x03
    beq .86B9

    jsr _8486E2
.86B9:
    rep #0x20
    rts

;-----

_8486BC:
    bit.b #0x08
    rep #0x20
    beq .86D4

    lda.b 0x07
    sec
    sbc.w 0x0000
    cmp.w #0x0000
    bpl .86D0

    lda.w #0x0000
.86D0:
    sta.b 0x07
    bra .86DC

.86D4:
    lda.b 0x07
    clc
    adc.w 0x0000
    sta.b 0x07
.86DC:
    sep #0x20
    lda.w 0x00A8
    rts

;-----

_8486E2:
    bit.b #0x02
    rep #0x20
    beq .86FA

    lda.b 0x04
    sec
    sbc.w 0x0000
    cmp.w #0x0000
    bpl .86F6

    lda.w #0x0000
.86F6:
    sta.b 0x04
    bra .8702

.86FA:
    lda.b 0x04
    clc
    adc.w 0x0000
    sta.b 0x04
.8702:
    sep #0x20
    rts

;-----

_848705:
    lda.b #0x4A
    sta.w 0x0000
    lda.b #0x08
    sta.w 0x0001
    lda.b 0x1B
    sta.w 0x0002
    lda.b 0x1C
    sta.w 0x0003
    jsr _84878B
    lda.b #0x6A
    sta.w 0x0000
    lda.b #0x08
    sta.w 0x0001
    lda.b 0x1D
    sta.w 0x0002
    lda.b 0x1E
    sta.w 0x0003
    jsr _84878B
    lda.b #0x8F
    sta.w 0x0000
    lda.b #0x08
    sta.w 0x0001
    lda.b 0x14
    sta.w 0x0002
    lda.b 0x15
    sta.w 0x0003
    jsr _84878B
    rep #0x30
    lda.b 0x1B
    sta.w 0x0000
    lda.b 0x1D
    sta.w 0x0002
    phd
    lda.w #0x0000
    tcd
    jsl _849156
    lda.l 0x7E2000,X
    sta.b 0x02
    pld
    sta.b 0x21
    lda.w #0x0857
    sta.w 0x0000
    sep #0x30
    jsr _84878B
    rep #0x10
    ldy.b 0x21
    lda [0x16],Y
    sta.w 0x0002
    stz.w 0x0003
    ldx.w #0x0877
    stx.w 0x0000
    sep #0x10
    jsr _84878B
    rts

;-----

_84878B:
    ldx.w 0x00A4
    lda.b #0x80
    sta.w 0x0600,X
    lda.w 0x0000
    sta.w 0x0601,X
    lda.w 0x0001
    sta.w 0x0602,X
    lda.b #0x08
    sta.w 0x0603,X
    lda.w 0x0003
    lsr
    lsr
    lsr
    lsr
    tay
    lda 0x00A592,Y
    sta.w 0x0604,X
    lda.b #0x28
    sta.w 0x0605,X
    lda.w 0x0003
    and.b #0x0F
    tay
    lda 0x00A592,Y
    sta.w 0x0606,X
    lda.b #0x28
    sta.w 0x0607,X
    lda.w 0x0002
    lsr
    lsr
    lsr
    lsr
    tay
    lda 0x00A592,Y
    sta.w 0x0608,X
    lda.b #0x28
    sta.w 0x0609,X
    lda.w 0x0002
    and.b #0x0F
    tay
    lda 0x00A592,Y
    sta.w 0x060A,X
    lda.b #0x28
    sta.w 0x060B,X
    txa
    clc
    adc.b #0x0C
    sta.w 0x00A4
    rts

;-----

_8487F4:
    sta.w 0x0002
    lsr
    lsr
    lsr
    lsr
    tax
    lda.w 0x00A592,X
    sta.w 0x0001
    lda.w 0x0002
    and.b #0x0F
    tax
    lda.w 0x00A592,X
    sta.w 0x0000
    rts

;-----

_84880F:
    lda.w 0x00AB
    and.b #0x80
    beq .8821

    lda.w 0x00C0
    inc
    and.b #0x13
    ora.b #0x04
    sta.w 0x00C0
.8821:
    rts

;-----

_848822:
    lda.b #0x02
    sta.w 0x0000
    lda.w 0x00AE
    bit.b #0x80
    beq .8833

    lda.b #0x08
    sta.w 0x0000
.8833:
    lda.w 0x00AE
    bit.b #0x03
    beq .8859

    bit.b #0x02
    beq .884A

    lda.b 0x1F
    sec
    sbc.w 0x0000
    bcs .8854

    lda.b #0x00
    bra .8854

.884A:
    lda.b 0x1F
    clc
    adc.w 0x0000
    bcc .8854

    lda.b #0xFF
.8854:
    sta.b 0x1F
    lda.w 0x00AE
.8859:
    bit.b #0x0C
    beq .887B

    bit.b #0x08
    beq .886D

    lda.b 0x20
    sec
    sbc.w 0x0000
    bcs .8879

    lda.b #0x00
    bra .8879

.886D:
    lda.b 0x20
    clc
    adc.w 0x0000
    cmp.b #0xE0
    bcc .8879

    lda.b #0xDF
.8879:
    sta.b 0x20
.887B:
    rep #0x20
    lda.b 0x1F
    and.w #0x00FF
    clc
    adc.b 0x04
    sta.w 0x0000
    sta.b 0x1B
    lda.b 0x20
    and.w #0x00FF
    clc
    adc.b 0x07
    sta.w 0x0002
    sta.b 0x1D
    sep #0x20
    lda.w 0x00B1
    bit.b #0x30
    beq .88B3

    bit.b #0x20
    rep #0x20
    beq .88AA

    inc.b 0x14
    bra .88AC

.88AA:
    dec.b 0x14
.88AC:
    lda.w #0xE000
    trb.b 0x14
    sep #0x20
.88B3:
    lda.w 0x00B1
    bit.b #0x80
    beq .88C2

    rep #0x20
    lda.b 0x21
    sta.b 0x14
    sep #0x20
.88C2:
    lda.w 0x00B2
    and.b #0x40
    beq .88DB

    lda.b 0x14
    sta.w 0x0008
    lda.b 0x15
    sta.w 0x0009
    jsl _849111
    jsl 0x80B8D5
.88DB:
    lda.b #0x80
    sta.w 0x08FE
    lda.b #0x30
    sta.w 0x08FF
    lda.b 0x1F
    sec
    sbc.b #0x04
    sta.w 0x08FC
    lda.b 0x20
    sec
    sbc.b #0x04
    sta.w 0x08FD
    stz.w 0x091F
    rts

;-----

_8488F9:
    rep #0x30
    stz.b 0x23
    lda.b 0x25
    sta.w 0x0000
    lda.b 0x29
    and.w #0x00FF
    asl
    asl
    asl
    asl
    clc
    adc.b 0x27
    sta.w 0x0002
.8911:
    phd
    lda.w #0x0000
    tcd
    jsl _849156
    pld
    lda.l 0x7E2000,X
    phx
    ldx.b 0x23
    sta.l 0x7EF0C8,X
    cpx.w #0x001C
    plx
    bcs .893C

    lda.w 0x0000
    clc
    adc.w #0x0010
    sta.w 0x0000
    inc.b 0x23
    inc.b 0x23
    bra .8911

.893C:
    rts

;-----

_84893D:
    rep #0x20
    lda.b 0x29
    and.w #0x00FF
    asl
    asl
    asl
    asl
    asl
    asl
    clc
    adc.w #0x0842
    ldx.w 0x00A3
    sta.w 0x0501,X
    clc
    adc.w #0x0020
    sta.w 0x0509,X
    lda.w #0x0038
    sta.w 0x0503,X
    sta.w 0x050B,X
    lda.w #0xF000
    sta.w 0x0505,X
    lda.w #0xF100
    sta.w 0x050D,X
    sep #0x20
    lda.b #0x80
    sta.w 0x0500,X
    sta.w 0x0508,X
    lda.b #0x7E
    sta.w 0x0507,X
    sta.w 0x050F,X
    txa
    clc
    adc.b #0x10
    sta.w 0x00A3
    rts

    php
    phd
    rep #0x20
    lda.w #0x1E08
    tcd
    stz.b 0x00
    stz.b 0x02
    stz.b 0x07
    stz.w 0x00BE
    stz.w 0x00BC
    stz.b 0x14
    stz.b 0x18
    lda.w 0x0300
    sta.b 0x2F
    sep #0x30
    lda.w 0x00C0
    sta.b 0x12
    lda.w 0x00C1
    sta.b 0x13
    lda.b #0x17
    sta.w 0x00C0
    sta.w 0x00C1
    stz.b 0x11
    stz.b 0x10
    stz.b 0x17
    inc.b 0x00
    lda.b #0x04
    sta.w 0x00A2
    jsr _848AF0
    jsr _848E4D
    stz.w 0x0B9D
    stz.b 0x14
    stz.b 0x15
.89D5:
    lda.w 0x0B9D
    beq .89D5

    jsr _848BA0
.89DD:
    stz.w 0x0B9D
    stz.b 0x14
    stz.b 0x15
    stz.w 0x08FC
    lda.w 0x2137
    lda.w 0x213D
    sta.w 0x08FD
    lda.b #0x01
    sta.w 0x08FE
    lda.b #0x20
    sta.w 0x08FF
.89FA:
    lda.w 0x0B9D
    beq .89FA

    lda.b 0x18
    sta.w 0x2126
    lda.b 0x19
    sta.w 0x2127
    ldx.b 0x01
    jsr (.8A4B,X)
    jsr _848C5E
    jsr _848D28
    jsr _848E77
    lda.w 0x00AD
    cmp.b #0x80
    bne .89DD

    stz.w 0x0B9D
.8A21:
    lda.w 0x0B9D
    beq .8A21

    lda.b #0x04
    sta.w 0x00A2
    jsr _848E64
    lda.b 0x12
    sta.w 0x00C0
    lda.b 0x13
    sta.w 0x00C1
    stz.w 0x2123
    stz.w 0x2124
    stz.w 0x2125
    rep #0x20
    lda.b 0x2F
    sta.w 0x0300
    pld
    plp
    rtl

.8A4B: d16[.8A51, .8A6D, .8A93]

.8A51:
    lda.w 0x00B2
    and.b #0x03
    beq .8A61

    lda.b #0x01
    eor.b 0x11
    sta.b 0x11
    jsr _848BA0
.8A61:
    lda.w 0x00B2
    and.b #0x10
    beq .8A6C

    lda.b #0x02
    sta.b 0x01
.8A6C:
    rts

.8A6D:
    lda.w 0x00B2
    bit.b #0x03
    beq .8A87

    bit.b #0x02
    beq .8A7A

    dec.b 0x10
.8A7A:
    bit.b #0x01
    beq .8A80

    inc.b 0x10
.8A80:
    lda.b #0xF8
    trb.b 0x10
    jsr _848BA0
.8A87:
    lda.w 0x00B2
    bit.b #0x10
    beq .8A92

    lda.b #0x04
    sta.b 0x01
.8A92:
    rts

.8A93:
    lda.w 0x00B2
    bit.b #0x03
    beq .8AB5

    bit.b #0x01
    beq .8AA9

    lda.b 0x07
    inc
    cmp.b #0x03
    bcc .8AB0

    lda.b #0x00
    bra .8AB0

.8AA9:
    lda.b 0x07
    dec
    bpl .8AB0

    lda.b #0x02
.8AB0:
    sta.b 0x07
    lda.w 0x00B2
.8AB5:
    bit.b #0x0C
    beq .8AD1

    bit.b #0x08
    beq .8AC6

    lda.b 0x08
    dec
    bpl .8ACF

    lda.b #0x0F
    bra .8ACF

.8AC6:
    lda.b 0x08
    inc
    cmp.b #0x10
    bcc .8ACF

    lda.b #0x00
.8ACF:
    sta.b 0x08
.8AD1:
    lda.w 0x00B1
    lsr
    lsr
    ora.w 0x00B2
    sta.w 0x0000
    bit.b #0xC0
    beq .8AE3

    jsr _848D57
.8AE3:
    lda.w 0x00B2
    and.b #0x10
    beq .8AEC

    stz.b 0x01
.8AEC:
    jsr _848BA0
    rts

;-----

_848AF0:
    phd
    pea 0x0000
    pld
    ldx.b #0x06
.8AF7:
    lda.w 0x00A5A2,X
    sta.b 0x10
    lda.w 0x00A5A3,X
    sta.b 0x14
    rep #0x20
    lda.w #0xA5B2
    sta.b 0x18
    lda.w 0x00A5AA,X
    sta.b 0x1C
    sep #0x20
    jsr _848B18
    dex
    dex
    bpl .8AF7

    pld
    rts

;-----

_848B18:
    phx
    phy
    php
    phd
    pea 0x0000
    pld
    rep #0x20
    sep #0x10
    ldx.b 0x14
    stx.b 0x15
    ldx.b 0x1D
    txa
    asl
    asl
    asl
    asl
    asl
    sta.b 0x0E
    ldx.b 0x1C
    txa
    clc
    adc.b 0x0E
    clc
    adc.w #0x0800
    sta.b 0x1C
    lda.b 0x10
    and.w #0x00FF
    clc
    adc.b 0x18
    rep #0x10
    tay
    sep #0x20
    ldx.w 0x1E1C
    stx.b 0x20
.8B50:
    lda 0x0000,Y
    sta.l 0x7EF000,X
    lda.b #0x20
    sta.l 0x7EF001,X
    iny
    inx
    inx
    dec.b 0x14
    bne .8B50

    stx.w 0x1E1C
    sep #0x10
    ldx.b 0xA3
    lda.b #0x80
    sta.w 0x0500,X
    lda.b 0x1C
    sta.w 0x0501,X
    lda.b 0x1D
    sta.w 0x0502,X
    lda.b 0x15
    asl
    sta.w 0x0503,X
    stz.w 0x0504,X
    rep #0x20
    lda.b 0x20
    clc
    adc.w #0xF000
    sta.w 0x0505,X
    sep #0x20
    lda.b #0x7E
    sta.w 0x0507,X
    txa
    clc
    adc.b #0x08
    sta.b 0xA3
    pld
    plp
    ply
    plx
    rts

;-----

_848BA0:
    php
    sep #0x30
    jsr _848EBC
    lda.b 0x11
    asl
    asl
    asl
    clc
    adc.b 0x10
    rep #0x30
    and.w #0x00FF
    asl
    asl
    asl
    asl
    asl
    tax
    ldy.w #0x0000
    sep #0x20
.8BBE:
    lda.b #0x00
    xba
    stz.w 0x0000
    phy
    lda.w 0x0300,X
    and.b #0x0F
    tay
    lda 0x00A5D0,Y
    sta.w 0x0002
    lda.w 0x0300,X
    and.b #0x10
    lsr
    lsr
    lsr
    lsr
    tay
    lda 0x00A5D0,Y
    sta.w 0x0001
    stz.w 0x0003
    rep #0x20
    lda.w 0x0300,X
    sta.w 0x000E
    sep #0x20
    lda.b #0x00
    xba
    lsr.w 0x000F
    lda.w 0x000E
    ror
    lsr
    lsr
    lsr
    lsr
    tay
    lda 0x00A5D0,Y
    sta.w 0x0005
    lda.w 0x000F
    and.b #0x01
    tay
    lda 0x00A5D0,Y
    sta.w 0x0004
    stz.w 0x0006
    lsr.w 0x000F
    lda.w 0x000F
    and.b #0x0F
    tay
    lda 0x00A5D0,Y
    sta.w 0x0008
    lda.w 0x000F
    lsr
    lsr
    lsr
    lsr
    tay
    lda 0x00A5D0,Y
    sta.w 0x0007
    stz.w 0x0010
    lda.b #0x09
    sta.w 0x0014
    lda.b #0x00
    sta.w 0x0018
    lda.b #0x00
    sta.w 0x0019
    ply
    tya
    clc
    adc.b #0x0A
    sta.w 0x001D
    lda.b #0x00
    sta.w 0x001C
    jsr _848B18
    inx
    inx
    iny
    cpy.w #0x0010
    beq .8C5C

    jmp .8BBE

.8C5C:
    plp
    rts

;-----

_848C5E:
    lda.b 0x11
    bne .8C66

    lda.b #0x04
    bra .8C68

.8C66:
    lda.b #0x00
.8C68:
    sta.w 0x001C
    lda.b #0x05
    sta.w 0x001D
    lda.b #0x01
    sta.w 0x0014
    rep #0x20
    stz.w 0x0018
    stz.w 0x0010
    sep #0x20
    stz.w 0x0000
    jsr _848B18
    lda.b 0x11
    asl
    asl
    clc
    adc.b #0x00
    sta.w 0x001C
    lda.b #0x05
    sta.w 0x001D
    rep #0x20
    stz.w 0x0018
    stz.w 0x0010
    sep #0x20
    lda.b #0x3E
    sta.w 0x0000
    lda.b 0x01
    bne .8CAC

    lda.b #0x7C
    sta.w 0x0000
.8CAC:
    lda.b #0x01
    sta.w 0x0014
    jsr _848B18
    rep #0x20
    stz.w 0x0000
    stz.w 0x0002
    stz.w 0x0004
    stz.w 0x0006
    sep #0x20
    lda.b 0x01
    cmp.b #0x02
    beq .8CCE

    lda.b #0x3E
    bra .8CD0

.8CCE:
    lda.b #0x7C
.8CD0:
    ldx.b 0x10
    sta.w 0x0000,X
    rep #0x20
    stz.w 0x0018
    stz.w 0x0010
    sep #0x20
    lda.b #0x01
    sta.w 0x001C
    lda.b #0x06
    sta.w 0x001D
    lda.b #0x08
    sta.w 0x0014
    jsr _848B18
    lda.b 0x07
    asl
    clc
    adc.b 0x07
    clc
    adc.b #0x00
    sta.w 0x001C
    lda.b 0x08
    clc
    adc.b #0x0A
    sta.w 0x001D
    lda.b #0x01
    sta.w 0x0014
    rep #0x20
    stz.w 0x0018
    stz.w 0x0010
    sep #0x20
    lda.b #0x3E
    sta.w 0x0000
    lda.b 0x01
    cmp.b #0x04
    bne .8D24

    lda.b #0x7C
    sta.w 0x0000
.8D24:
    jsr _848B18
    rts

;-----

_848D28:
    lda.w 0x00B1
    and.b #0x40
    beq .8D56

    lda.b 0x17
    eor.b #0x01
    sta.b 0x17
    beq .8D4A

    lda.b #0x22
    sta.w 0x2123
    stz.w 0x2124
    lda.b #0x02
    sta.w 0x2125
    lda.b #0x17
    sta.w 0x212E
    rts

.8D4A:
    stz.w 0x2123
    stz.w 0x2124
    stz.w 0x2125
    stz.w 0x212E
.8D56:
    rts

;-----

_848D57:
    lda.b 0x11
    asl
    asl
    asl
    clc
    adc.b 0x10
    rep #0x20
    and.w #0x00FF
    asl
    asl
    asl
    asl
    asl
    sta.w 0x0002
    lda.b 0x08
    and.w #0x00FF
    asl
    clc
    adc.w 0x0002
    sta.w 0x0002
    sep #0x20
    lda.b 0x07
    asl
    tax
    jsr (.8DA3,X)
    lda.w 0x0000
    bit.b #0x40
    beq .8D8E

    inc.w 0x0004
    bra .8D91

.8D8E:
    dec.w 0x0004
.8D91:
    lda.b #0xE0
    trb.w 0x0004
    lda.b 0x07
    asl
    tax
    jsr (.8DA9,X)
    lda.b #0x01
    sta.w 0x00A1
    rts

.8DA3: d16[.8DAF, .8DC0, .8DD6]

.8DA9: d16[.8DEA, .8E07, .8E29]

.8DAF:
    php
    rep #0x30
    ldx.w 0x0002
    lda.w 0x0300,X
    and.w #0x001F
    sta.w 0x0004
    plp
    rts

.8DC0:
    php
    rep #0x30
    ldx.w 0x0002
    lda.w 0x0300,X
    and.w #0x03E0
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.w 0x0004
    plp
    rts

.8DD6:
    php
    rep #0x30
    ldx.w 0x0002
    lda.w 0x0300,X
    and.w #0x7C00
    lsr
    lsr
    xba
    sta.w 0x0004
    plp
    rts

.8DEA:
    php
    rep #0x30
    ldx.w 0x0002
    lda.w 0x0300,X
    and.w #0xFFE0
    sta.w 0x0300,X
    lda.w 0x0004
    and.w #0x001F
    ora.w 0x0300,X
    sta.w 0x0300,X
    plp
    rts

.8E07:
    php
    rep #0x30
    ldx.w 0x0002
    lda.w 0x0300,X
    and.w #0xFC1F
    sta.w 0x0300,X
    lda.w 0x0004
    and.w #0x001F
    asl
    asl
    asl
    asl
    asl
    ora.w 0x0300,X
    sta.w 0x0300,X
    plp
    rts

.8E29:
    php
    rep #0x30
    ldx.w 0x0002
    lda.w 0x0300,X
    and.w #0x03FF
    sta.w 0x0300,X
    lda.w 0x0004
    and.w #0x001F
    sep #0x20
    xba
    rep #0x20
    asl
    asl
    ora.w 0x0300,X
    sta.w 0x0300,X
    plp
    rts

;-----

_848E4D:
    ldx.b #0x00
    stz.b 0x16
.8E51:
    lda.w 0x0AA1,X
    lsr
    rol.b 0x16
    stz.w 0x0AA1,X
    txa
    clc
    adc.b #0x07
    tax
    cmp.b #0x38
    bcc .8E51

    rts

;-----

_848E64:
    lda.b #0x31
.8E66:
    tax
    lsr.b 0x16
    bcc .8E70

    lda.b #0x01
    sta.w 0x0AA1,X
.8E70:
    txa
    sec
    sbc.b #0x07
    bcs .8E66

    rts

;-----

_848E77:
    lda.w 0x00AD
    bit.b #0x30
    beq .8EAF

    bit.b #0x20
    rep #0x20
    beq .8E91

    lda.b 0x04
    clc
    adc.w #0x0004
    bmi .8E9F

    lda.w #0x0000
    bra .8E9F

.8E91:
    lda.b 0x04
    sec
    sbc.w #0x0004
    cmp.w #0xFF50
    bpl .8E9F

    lda.w #0xFF50
.8E9F:
    sta.b 0x04
    sep #0x20
    lda.b 0x04
    eor.b #0xFF
    inc
    sta.b 0x18
    clc
    adc.b #0x48
    sta.b 0x19
.8EAF:
    rep #0x20
    lda.b 0x04
    sta.w 0x00BC
    stz.w 0x00BE
    sep #0x20
    rts

;-----

_848EBC:
    lda.b 0x11
    asl
    asl
    asl
    clc
    adc.b 0x10
    rep #0x30
    and.w #0x00FF
    asl
    asl
    asl
    asl
    asl
    sta.w 0x0002
    lda.b 0x08
    and.w #0x00FF
    asl
    clc
    adc.w 0x0002
    tax
    lda.w 0x0300,X
    sta.w 0x0300
    sep #0x30
    lda.b #0x01
    sta.w 0x00A1
    rts

;-----

_848EEA:
    php
    phb
    sep #0x30
    dec.b 0x13
    bne .8F4F

    lda.b #0xAF
    pha
    plb
    rep #0x21
    lda.b 0x14
    adc.w #0x0003
    ldy.b 0x0F
    bpl .8F38

    sta.b 0x14
    adc (0x14)
    bra .8F38

.8F07:
    php
    phb
    rep #0x30
    sta.w 0x000E
    lda.b 0x16
    and.w #0x00FF
    sta.w 0x000C
    asl
    clc
    adc.w 0x000C
    tax
    lda.l 0xAFA000,X
    sta.b 0x14
    sep #0x20
    lda.l 0xAFA002,X
    pha
    plb
    rep #0x20
    lda.w 0x000E
    and.w #0x00FF
    asl
    tay
    lda (0x14),Y
    adc.b 0x14
.8F38:
    sta.b 0x14
    sep #0x30
    lda (0x14)
    sta.b 0x13
    ldy.b #0x01
    lda (0x14),Y
    sta.b 0x0F
    iny
    lda (0x14),Y
    sta.b 0x17
    lda.b #0x80
    tsb.b 0x17
.8F4F:
    plb
    plp
    rtl

;-----

_848F52:
    php
    sep #0x30
    lda.w 0x1F1A
    bne .8FC8

    dec.b 0x13
    bne .8FC8

    pea 0x8685
    plb
    rep #0x21
    lda.b 0x14
    adc.w #0x0003
    sta.b 0x14
    lda (0x14)
    and.w #0x00FF
    bne .8F9C

    inc.b 0x14
    lda.b 0x14
    clc
    adc (0x14)
    sta.b 0x14
    bra .8F9C

.8F7D:
    php
    pea 0x8685
    plb
    rep #0x30
    and.w #0x00FF
    asl
    tax
    lda.w 0x858022,X
    sta.b 0x14
    sep #0x20
    lda (0x14)
    asl
    sta.b 0x0F
    rep #0x20
    lda.b 0x14
    inc
    sta.b 0x14
.8F9C:
    sep #0x30
    lda (0x14)
    sta.b 0x13
    ldy.b #0x01
    rep #0x20
    lda (0x14),Y
    sta.w 0x0000
    ldx.b 0x0F
    ldy.b #0x00
    phd
    pea 0x0000
    pld
.8FB4:
    lda (0x00),Y
    sta.w 0x0300,X
    inx
    inx
    iny
    iny
    cpy.b #0x20
    bne .8FB4

    pld
    sep #0x20
    inc.w 0x00A1
    plb
.8FC8:
    plp
    rtl

;-----

_848FCA:
    php
    sep #0x30
    lda.l _84A462.A481
    cmp.l _849D07.9D29
    beq .8FDA

    inc.w 0x1F9D
.8FDA:
    lda.b 0x17
    bpl _848F52.8FC8

    and.b #0x7F
    sta.b 0x17
    pea 0x8685
    plb
    rep #0x30
    lda.b 0x10
    and.w #0x00FF
    asl
    tax
    lda.l 0x7F8000,X
    sta.w 0x0000
    lda.b 0x17
    and.w #0x00FF
    asl
    tay
    clc
    lda (0x31),Y
    adc.b 0x31
    tax
    lda.w 0x00A3
    and.w #0x00FF
    tay
    sep #0x20
    lda.w 0x0000,X
    beq .9083

.9011:
    sep #0x20
    lda.b #0x80
    sta 0x0500,Y
    lda.w 0x0000,X
    lsr
    clc
    adc.w 0x1F25
    sta.w 0x1F25
    lda.w 0x0000,X
    rep #0x21
    and.w #0x00FF
    asl
    asl
    asl
    asl
    sta 0x0503,Y
    lda.w 0x0001,X
    clc
    adc.w 0x0000
    sta 0x0505,Y
    lda.b 0x17
    and.w #0xFF00
    lsr
    lsr
    lsr
    lsr
    sta.w 0x0002
    sep #0x20
    lda.w 0x0003,X
    sta 0x0507,Y
    lda.w 0x0002
    sta 0x0501,Y
    lda.w 0x0004,X
    bmi .9072

    and.b #0x7F
    clc
    adc.w 0x0003
    sta 0x0502,Y
    rep #0x21
    tya
    adc.w #0x0008
    tay
    txa
    adc.w #0x0005
    tax
    bra .9011

.9072:
    sep #0x30
    and.b #0x7F
    clc
    adc.w 0x0003
    sta 0x0502,Y
    tya
    adc.b #0x08
    sta.w 0x00A3
.9083:
    plb
    plp
    rtl

;-----

get_rng:
    php
    rep #0x20
    lda.w 0x0BA6
    asl
    clc
    adc.w 0x0BA6
    xba
    sep #0x20
    sta.w 0x0BA7
    clc
    adc.w 0x0BA6
    sta.w 0x0BA6
    plp
    rtl

;-----

_8490A0:
    jsr .local
    rtl

.local:
    phd
    phx
    php
    rep #0x30
    tdc
    tax
    lda.w #0x0000
    tcd
    sep #0x20
    bra .90BA

.90B3:
    phd
    phx
    php
    sep #0x20
    rep #0x10
.90BA:
    stz.b 0x01
    lda.b 0x29,X
    bpl .90C2

    dec.b 0x01
.90C2:
    clc
    adc.b 0x05,X
    sta.b 0x00
    lda.b 0x06,X
    adc.b 0x01
    sta.b 0x01
    stz.b 0x03
    lda.b 0x2A,X
    bpl .90D5

    dec.b 0x03
.90D5:
    clc
    adc.b 0x08,X
    sta.b 0x02
    and.b #0xF0
    sta.b 0x0A
    lda.b 0x09,X
    adc.b 0x03
    sta.b 0x03
    sta.b 0x0B
    lda.b 0x00
    and.b #0x0F
    inc
    sta.b 0x0C
    lda.b 0x02
    and.b #0x0F
    inc
    sta.b 0x0E
    rep #0x20
    jsr _849156.916A
    lda.l 0x7E2000,X
    tay
    lda.w 0x0B92
    sta.b 0x10
    lda.w 0x0B94
    sta.b 0x12
    lda [0x10],Y
    and.w #0x00FF
    plp
    plx
    pld
    rts

;-----

_849111:
    jsr .local
    rtl

.local:
    php
    phd
    rep #0x30
    lda.w #0x0000
    tcd
    jsr _849156.916A
    lda.b 0x08
    sta.l 0x7E2000,X
    pld
    plp
    rts

;-----

_849129:
    jsr .local
    rtl

.local:
    php
    phd
    rep #0x30
    lda.w #0x0000
    tcd
    jsr _849156.916A
    lda.l 0x7E2000,X
    inc
    sta.l 0x7E2000,X
    pld
    plp
    rts

;-----

_849144:
    jsr .local
    rtl

.local:
    php
    phd
    rep #0x30
    lda.w #0x0000
    tcd
    jsr _849156.916A
    pld
    plp
    rts

;-----

_849156:
    jsr .916A
    rtl

    jsr .915E
    rtl

.915E:
    lda.w #0xEC00
    sta.b 0x10
    lda.w #0x007E
    sta.b 0x12
    bra .9174

.916A:
    lda.w #0xE800
    sta.b 0x10
    lda.w #0x007E
    sta.b 0x12
.9174:
    lda.b 0x02
    and.w #0x00F0
    asl
    sta.b 0x04
    lda.b 0x00
    and.w #0x00FF
    lsr
    lsr
    lsr
    and.w #0xFFFE
    clc
    adc.b 0x04
    sta.b 0x06
    lda.b 0x00
    xba
    and.w #0x001F
    sta.b 0x04
    lda.b 0x02
    and.w #0x1F00
    lsr
    lsr
    lsr
    clc
    adc.b 0x04
    tay
    lda [0x10],Y
    and.w #0x00FF
    tay
    xba
    asl
    clc
    adc.b 0x06
    tax
    rts

;-----

_8491AD:
    php
    phd
    rep #0x30
    tdc
    tax
    lda.w #0x0000
    tcd
    lda.w #0x0001
    sta.b 0x14
    bra .91CE

.91BE:
    php
    phd
    rep #0x30
    lda.b 0x20
    beq .91DB

    tdc
    tax
    lda.w #0x0000
    tcd
    stz.b 0x14
.91CE:
    lda.b 0x2B,X
    and.w #0xFF00
    sta.b 0x2B,X
    jsr _8492AC
    jsr _8491DE.91ED
.91DB:
    pld
    plp
    rtl

;-----

_8491DE:
    lda.b 0x14
    beq .9242

    sep #0x30
    rtl

.91E5:
    lda.b 0x1C,X
    beq _8491DE

    bpl .91F5

    bra .9242

.91ED:
    lda.b 0x08,X
    cmp.b 0x24,X
    beq .91E5

    bpl .9242

.91F5:
    sep #0x20
    ldy.b 0x20,X
    lda 0x0006,Y
    sec
    sbc 0x0008,Y
    sta.b 0x2A,X
    lda 0x0005,Y
    bit.b 0x11,X
    bvc .920C

    eor.b #0xFF
    inc
.920C:
    sta.b 0x29,X
    jsr _849473
    bne .923F

    ldy.b 0x20,X
    lda 0x0005,Y
    bit.b 0x11,X
    bvc .921F

    eor.b #0xFF
    inc
.921F:
    sec
    sbc 0x0007,Y
    sta.b 0x29,X
    jsr _849473
    bne .923F

    ldy.b 0x20,X
    lda 0x0005,Y
    bit.b 0x11,X
    bvc .9236

    eor.b #0xFF
    inc
.9236:
    clc
    adc 0x0007,Y
    sta.b 0x29,X
    jsr _849473
.923F:
    rep #0x30
    rts

.9242:
    sep #0x20
    ldy.w #0x0004
    lda.w 0x1F1C
    beq .924F

    ldy.w #0x0006
.924F:
    lda.b 0x2F,X
    beq .9256

    ldy.w #0x0000
.9256:
    tya
    ora.b #0x80
    sta.b 0x08
    ldy.b 0x20,X
    lda 0x0006,Y
    clc
    adc 0x0008,Y
    sta.b 0x2A,X
    lda 0x0005,Y
    bit.b 0x11,X
    bvc .9270

    eor.b #0xFF
    inc
.9270:
    sta.b 0x29,X
    jsr _8495C4
    bne .92A9

    lda.b 0x08
    and.b #0x7F
    sta.b 0x08
    ldy.b 0x20,X
    lda 0x0005,Y
    bit.b 0x11,X
    bvc .9289

    eor.b #0xFF
    inc
.9289:
    sec
    sbc 0x0007,Y
    sta.b 0x29,X
    jsr _8495C4
    bne .92A9

    ldy.b 0x20,X
    lda 0x0005,Y
    bit.b 0x11,X
    bvc .92A0

    eor.b #0xFF
    inc
.92A0:
    clc
    adc 0x0007,Y
    sta.b 0x29,X
    jsr _8495C4
.92A9:
    rep #0x30
    rts

;-----

_8492AC:
    rep #0x30
    lda.b 0x05,X
    sec
    sbc.b 0x22,X
    sta.b 0x00
    sep #0x20
    beq .9305

    ldy.b 0x20,X
    lda 0x0005,Y
    bit.b 0x11,X
    bvc .92C5

    eor.b #0xFF
    inc
.92C5:
    bit.b 0x00
    bpl .92CF

    sec
    sbc 0x0007,Y
    bra .92D3

.92CF:
    clc
    adc 0x0007,Y
.92D3:
    sta.b 0x29,X
    lda 0x0006,Y
    sta.b 0x2A,X
    jsr _849315
    bne .9305

    ldy.b 0x20,X
    lda 0x0006,Y
    sec
    sbc 0x0008,Y
    clc
    adc 0x0009,Y
    sta.b 0x2A,X
    jsr _849315
    bne .9305

    ldy.b 0x20,X
    lda 0x0006,Y
    clc
    adc 0x0008,Y
    sec
    sbc 0x0009,Y
    sta.b 0x2A,X
    jsr _849315
.9305:
    rep #0x30
    rts

;-----

_849308:
    lda.b 0x14
    beq .9314

    ldy.b 0x10
    sty 0x05,X
    ldy.b 0x12
    sty 0x08,X
.9314:
    rts

;-----

_849315:
    jsr _8490A0.90B3
    ldy.b 0x05,X
    sty.b 0x10
    ldy.b 0x08,X
    sty.b 0x12
    sta.b 0x2D,X
    stx.b 0x2C
    and.b #0x3F
    asl
    xba
    lda.b #0x00
    xba
    tax
    jsr (.935D,X)
    php
    ldx.b 0x2C
    lda.b #0x01
    bit.b 0x29,X
    bpl .933A

    lda.b #0x02
.933A:
    plp
    beq .9349

    bmi .9355

    ora.b 0x2B,X
    sta.b 0x2B,X
.9343:
    jsr _849308
    lda.b #0x01
    rts

.9349:
    eor.b #0xFF
    and.b 0x2B,X
    sta.b 0x2B,X
    jsr _849308
    lda.b #0x00
    rts

.9355:
    eor.b #0xFF
    and.b 0x2B,X
    sta.b 0x2B,X
    bra .9343

.935D: d16[
    _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, .93FF, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, _8495C4.977A, _8495C4.977A, .942B, .93DD, .93DD, .93DD, .93DD,
    .93DD, .93DD, .93DD, .93DD, .93DD, .93DD, .943F, .944B,
]

.93DD:
    ldx.b 0x2C
    stz.b 0x01
    lda.b #0x11
    sec
    sbc.b 0x0C
    bit.b 0x29,X
    bmi .93F1

    dec.b 0x01
    lda.b 0x0C
    eor.b #0xFF
    inc
.93F1:
    clc
    adc.b 0x05,X
    sta.b 0x05,X
    lda.b 0x06,X
    adc.b 0x01
    sta.b 0x06,X
    lda.b #0x01
    rts

.93FF:
    rep #0x20
    ldx.b 0x2C
    ldy.w #0x0001
    lda.b 0x22,X
    cmp.b 0x05,X
    bcs .940F

    ldy.w #0x0000
.940F:
    sty.b 0x06
    clc
    adc.b 0x05,X
    lsr
    bcc .941A

    clc
    adc.b 0x06
.941A:
    sta.b 0x05,X
    sep #0x20
    ldx.w 0x1F1C
    beq .9428

    lda.b #0x08
    tsb.w 0x0C26
.9428:
    lda.b #0xFF
    rts

.942B:
    lda.w 0x1F1C
    beq .9455

    bit.w 0x1F96
    bvc .9438

    jmp .93DD

.9438:
    lda.b #0x08
    sta.w 0x0BCE
    bra .9455

.943F:
    lda.w 0x1F1C
    beq .9455

    lda.b #0x08
    sta.w 0x0BCE
    bra .9455

.944B:
    lda.w 0x1F1C
    beq .9455

    lda.b #0x7F
    sta.w 0x0BCE
.9455:
    jsr .93DD
    lda.w 0x1F1C
    beq .9470

    lda.w 0x0BB9
    and.b #0x40
    sta.w 0x1F1B
    lda.w 0x0C32
    bne .9470

    jsl _849F25.9F2A
    rep #0x10
.9470:
    lda.b #0x01
    rts

;-----

_849473:
    lda.b #0xF7
    and.b 0x2B,X
    sta.b 0x2B,X
    jsr _8490A0.90B3
    ldy.b 0x05,X
    sty.b 0x10
    ldy.b 0x08,X
    sty.b 0x12
    sta.b 0x2E,X
    stx.b 0x2C
    and.b #0x3F
    asl
    xba
    lda.b #0x00
    xba
    tax
    jsr (.94A9,X)
    beq .94A3

    ldx.b 0x2C
    lda.b #0x08
    ora.b 0x2B,X
    sta.b 0x2B,X
    jsr _849308
    lda.b #0x01
    rts

.94A3:
    ldx.b 0x2C
    jsr _849308
    rts

.94A9: d16[
    .9529, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, .9557, .9557, .9529,
    .9529, .9575, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A, _8495C4.977A,
    _8495C4.977A, _8495C4.977A, _8495C4.977A, .957C, .9542, .9542, .9542, .9542,
    .9542, .9542, .9542, .9542, .9542, .9542, .9590, .959C,
]

.9529:
    lda.w 0x1F1C
    beq .953F

    lda.b #0x01
    trb.w 0x0C18
    ldy.w #0x0040
    sty.w 0x0BC6
    ldy.w #0xFA80
    sty.w 0x0C07
.953F:
    lda.b #0x00
    rts

.9542:
    ldx.b 0x2C
    lda.b #0x11
    sec
    sbc.b 0x0E
    clc
    adc.b 0x08,X
    sta.b 0x08,X
    lda.b 0x09,X
    adc.b #0x00
    sta.b 0x09,X
    lda.b #0x01
    rts

.9557:
    lda.w 0x1F1C
    beq .9572

    lda.b #0x01
    tsb.w 0x0C18
    lda.b #0x21
    sta.w 0x0BC6
    ldy.w #0xFD40
    sty.w 0x0C07
    ldy.w #0xFF00
    sty.w 0x0C09
.9572:
    lda.b #0x00
    rts

.9575:
    lda.b #0x63
    sta.b 0x1E
    lda.b #0x00
    rts

.957C:
    lda.w 0x1F1C
    beq .95A6

    bit.w 0x1F96
    bvc .9589

    jmp .9542

.9589:
    lda.b #0x08
    sta.w 0x0BCE
    bra .95A6

.9590:
    lda.w 0x1F1C
    beq .95A6

    lda.b #0x08
    sta.w 0x0BCE
    bra .95A6

.959C:
    lda.w 0x1F1C
    beq .95A6

    lda.b #0x7F
    sta.w 0x0BCE
.95A6:
    jsr .9542
    lda.w 0x1F1C
    beq .95C1

    lda.w 0x0BB9
    and.b #0x40
    sta.w 0x1F1B
    lda.w 0x0C32
    bne .95C1

    jsl _849F25.9F2A
    rep #0x10
.95C1:
    lda.b #0x01
    rts

;-----

_8495C4:
    lda.b 0x2A,X
    pha
    lda.b 0x08
    and.b #0x7F
    clc
    adc.b 0x2A,X
    sta.b 0x2A,X
    jsr _8490A0.90B3
    sta.b 0x2E,X
    sta.b 0x18
    and.b #0x3F
    asl
    xba
    lda.b #0x00
    xba
    tay
    sty.b 0x28
    stx.b 0x2C
    pla
    sta.b 0x2A,X
.95E6:
    ldx.b 0x2C
    lda.b #0xFB
    and.b 0x2B,X
    sta.b 0x2B,X
    stz.b 0x01
    lda.b 0x2A,X
    sta.b 0x02
    stz.b 0x03
    ldy.b 0x05,X
    sty.b 0x10
    ldy.b 0x08,X
    sty.b 0x12
    ldx.b 0x28
    jsr (.961C,X)
    beq .9616

    ldx.b 0x2C
    lda.b #0x04
    ora.b 0x2B,X
    sta.b 0x2B,X
    jsr _84994C
    jsr _849308
    lda.b #0x01
    rts

.9616:
    ldx.b 0x2C
    jsr _849308
    rts

.961C: d16[
    .969C, .96D3, .96EB, .9733, .9745, .977D, .9781,
    .9785, .9789, .97CD, .97D1, .97D5, .97D9,
    .987E, .987E, .969C, .969C, .992C, .977A, .96B5, .977A,
    .977A, .977A, .977A, .977A, .977A, .977A, .977A, .977A,
    .977A, .977A, .977A, .977A, .977A, .977A, .977A, .977A,
    .977A, .977A, .977A, .977A, .977A, .977A, .977A, .977A,
    .977A, .977A, .977A, .977A, .977A, .977A, .989C, .96B5,
    .96B5, .96B5, .9908, .98FA, .9816, .9816, .96B5, .96B5,
    .96B5, .98B0, .98BC,
]

.969C:
    lda.w 0x1F1C
    beq .96B2

    lda.b #0x01
    trb.w 0x0C18
    ldy.w #0x0040
    sty.w 0x0BC6
    ldy.w #0xFA80
    sty.w 0x0C07
.96B2:
    lda.b #0x00
    rts

.96B5:
    ldx.b 0x2C
    lda.b 0x0E
    sta.b 0x00
    stz.b 0x01
    rep #0x20
    lda.b 0x08
    and.w #0x007F
    clc
    adc.b 0x08,X
    sec
    sbc.b 0x00
    sta.b 0x08,X
    sep #0x20
    stz.b 0x2F,X
    lda.b #0x01
    rts

.96D3:
    lda.b 0x08
    bmi .96DA

    jmp .977A

.96DA:
    lda.b 0x0C
    lsr
    sta.b 0x00
    lda.b #0x10
    sec
    sbc.b 0x00
    cmp.b 0x0E
    bcc .9706

    jmp .977A

.96EB:
    lda.b 0x08
    bmi .96F2

    jmp .977A

.96F2:
    lda.b 0x0C
    lsr
    clc
    adc.b #0x08
    sta.b 0x00
    lda.b #0x10
    sec
    sbc.b 0x00
    cmp.b 0x0E
    bcc .9706

    jmp .977A

.9706:
    rep #0x21
    ldx.b 0x2C
    lda.b 0x0A
    adc.w #0x000F
    sec
    sbc.b 0x00
    sec
    sbc.b 0x02
    sta.b 0x08,X
    bit.b 0x17
    bvc .972E

    lda.b 0x04,X
    clc
    adc.w #0xFEE0
    sta.b 0x04,X
    sep #0x20
    lda.b 0x06,X
    adc.b #0xFF
    sta.b 0x06,X
    jsr _8492AC
.972E:
    sep #0x20
    lda.b #0x01
    rts

.9733:
    lda.b 0x08
    bpl .977A

    lda.b 0x0C
    lsr
    clc
    adc.b #0x08
    sta.b 0x00
    cmp.b 0x0E
    bcs .977A

    bra .9752

.9745:
    lda.b 0x08
    bpl .977A

    lda.b 0x0C
    lsr
    sta.b 0x00
    cmp.b 0x0E
    bcs .977A

.9752:
    rep #0x21
    ldx.b 0x2C
    lda.b 0x0A
    adc.b 0x00
    sbc.b 0x02
    sta.b 0x08,X
    bit.b 0x17
    bvc .9775

    lda.b 0x04,X
    clc
    adc.w #0x0120
    sta.b 0x04,X
    sep #0x20
    lda.b 0x06,X
    adc.b #0x00
    sta.b 0x06,X
    jsr _8492AC
.9775:
    sep #0x20
    lda.b #0x01
    rts

.977A:
    lda.b #0x00
    rts

.977D:
    lda.b #0x10
    bra .978B

.9781:
    lda.b #0x0C
    bra .978B

.9785:
    lda.b #0x08
    bra .978B

.9789:
    lda.b #0x04
.978B:
    sta.b 0x06
    stz.b 0x07
    lda.b 0x08
    bpl .977A

    lda.b 0x0C
    lsr
    lsr
    sta.b 0x00
    lda.b 0x06
    sec
    sbc.b 0x00
    cmp.b 0x0E
    bcs .977A

    rep #0x21
    ldx.b 0x2C
    lda.b 0x0A
    adc.b 0x06
    sbc.b 0x00
    sec
    sbc.b 0x02
    sta.b 0x08,X
    bit.b 0x17
    bvc .97C8

    lda.b 0x04,X
    clc
    adc.w #0xFF00
    sta.b 0x04,X
    sep #0x20
    lda.b 0x06,X
    adc.b #0xFF
    sta.b 0x06,X
    jsr _8492AC
.97C8:
    sep #0x20
    lda.b #0x01
    rts

.97CD:
    lda.b #0x0C
    bra .97DB

.97D1:
    lda.b #0x08
    bra .97DB

.97D5:
    lda.b #0x04
    bra .97DB

.97D9:
    lda.b #0x00
.97DB:
    sta.b 0x06
    lda.b 0x08
    bpl .977A

    lda.b 0x0C
    lsr
    lsr
    clc
    adc.b 0x06
    sta.b 0x00
    cmp.b 0x0E
    bcs .977A

    rep #0x21
    ldx.b 0x2C
    lda.b 0x0A
    adc.b 0x00
    sbc.b 0x02
    sta.b 0x08,X
    bit.b 0x17
    bvc .9811

    lda.b 0x04,X
    clc
    adc.w #0x0100
    sta.b 0x04,X
    sep #0x20
    lda.b 0x06,X
    adc.b #0x00
    sta.b 0x06,X
    jsr _8492AC
.9811:
    sep #0x20
    lda.b #0x01
    rts

.9816:
    lda.b 0x08
    and.b #0x7F
    sta.b 0x00
    stz.b 0x01
    rep #0x21
    ldx.b 0x2C
    lda.b 0x08,X
    adc.b 0x00
    sec
    sbc.w #0x0010
    sta.b 0x08,X
    sep #0x20
    lda.b 0x18
    sta.b 0x1A
    jsr _8490A0.90B3
    sta.b 0x2E,X
    sta.b 0x18
    and.b #0x3F
    asl
    xba
    lda.b #0x00
    xba
    tay
    sty.b 0x28
    lda.b 0x08
    bmi .9874

    lda.b 0x08
    and.b #0x7F
    sta.b 0x00
    stz.b 0x01
    rep #0x21
    ldx.b 0x2C
    lda.b 0x08,X
    adc.w #0x0010
    sec
    sbc.b 0x00
    sta.b 0x08,X
    sep #0x20
    bit.b 0x1A
    bvc .9871

    lda.b 0x1A
    and.b #0x3F
    cmp.b #0x3A
    bne .986E

    jmp .98FA

.986E:
    jmp .9908

.9871:
    jmp .96B5

.9874:
    lda.b #0x80
    sta.b 0x0E
    jsr .95E6
    lda.b #0x01
    rts

.987E:
    lda.w 0x1F1C
    beq .9899

    lda.b #0x01
    tsb.w 0x0C18
    lda.b #0x21
    sta.w 0x0BC6
    ldy.w #0xFD40
    sty.w 0x0C07
    ldy.w #0xFF00
    sty.w 0x0C09
.9899:
    lda.b #0x00
    rts

.989C:
    lda.w 0x1F1C
    beq .98C6

    bit.w 0x1F96
    bvc .98A9

    jmp .96B5

.98A9:
    lda.b #0x08
    sta.w 0x0BCE
    bra .98C6

.98B0:
    lda.w 0x1F1C
    beq .98C6

    lda.b #0x08
    sta.w 0x0BCE
    bra .98C6

.98BC:
    lda.w 0x1F1C
    beq .98C6

    lda.b #0x7F
    sta.w 0x0BCE
.98C6:
    lda.b 0x08
    and.b #0x7F
    sta.b 0x00
    lda.b 0x0E
    sec
    sbc.b 0x00
    cmp.b #0x02
    bpl .98D8

    jmp .977A

.98D8:
    dec.b 0x0E
    dec.b 0x0E
    jsr .96B5
    lda.w 0x1F1C
    beq .98F7

    lda.w 0x0BB9
    and.b #0x40
    sta.w 0x1F1B
    lda.w 0x0C32
    bne .98F7

    jsl _849F25.9F2A
    rep #0x10
.98F7:
    lda.b #0x01
    rts

.98FA:
    jsr .96B5
    beq .992B

    rep #0x21
    lda.w #0x0080
    stz.b 0x18
    bra .9916

.9908:
    jsr .96B5
    beq .992B

    rep #0x21
    lda.w #0xFF80
    stz.b 0x18
    dec.b 0x18
.9916:
    ldx.b 0x2C
    adc.b 0x04,X
    sta.b 0x04,X
    sep #0x20
    lda.b 0x06,X
    adc.b 0x18
    sta.b 0x06,X
    jsr _8492AC
    sep #0x20
    lda.b #0x01
.992B:
    rts

.992C:
    rep #0x21
    ldx.b 0x2C
    lda.b 0x07,X
    adc.w #0x0020
    sta.b 0x07,X
    sep #0x20
    lda.b 0x09,X
    adc.b #0x00
    sta.b 0x09,X
    sep #0x20
    lda.b #0x08
    sta.b 0x2F,X
    lda.b #0x63
    sta.b 0x1E
    lda.b #0x01
    rts

;-----

_84994C:
    lda.w 0x1F1C
    bpl .9957

    stz.w 0x0C21
    stz.w 0x0C22
.9957:
    rts

;-----

_849958:
    rep #0x10
    ldx.b 0x20
    lda.w 0x0006,X
    sec
    sbc.w 0x0008,X
    sec
    sbc.b #0x02
    sta.b 0x2A
    lda.w 0x0005,X
    sta.b 0x29
    jsr _8490A0.local
    and.b #0x3F
    cmp.b #0x34
    bcs .999C

    ldx.b 0x20
    lda.w 0x0005,X
    clc
    adc.w 0x0007,X
    sta.b 0x29
    jsr _8490A0.local
    and.b #0x3F
    cmp.b #0x34
    bcs .999C

    ldx.b 0x20
    lda.w 0x0005,X
    sec
    sbc.w 0x0007,X
    sta.b 0x29
    jsr _8490A0.local
    and.b #0x3F
    cmp.b #0x34
.999C:
    sep #0x10
    bcc .99AE

    cmp.b #0x3C
    bne .99AD

    lda.w 0x1F99
    bit.b #0x01
    beq .99AD

    clc
    rtl

.99AD:
    sec
.99AE:
    rtl

;-----

_8499AF:
    rep #0x11
    ldx.b 0x20
    lda.w 0x0007,X
    inc
    bit.b 0x11
    bvs .99BE

    eor.b #0xFF
    inc
.99BE:
    adc.w 0x0005,X
    sta.b 0x29
    lda.w 0x0006,X
    clc
    adc.w 0x0008,X
    sec
    sbc.w 0x0009,X
    sta.b 0x2A
    jsr _8490A0.local
    and.b #0x3F
    cmp.b #0x34
    bcs .99FF

    ldx.b 0x20
    lda.w 0x0006,X
    sec
    sbc.w 0x0008,X
    clc
    adc.w 0x0009,X
    sta.b 0x2A
    jsr _8490A0.local
    and.b #0x3F
    cmp.b #0x34
    bcs .99FF

    lda.b #0x01
    bit.b 0x11
    bvs .99F9

    lda.b #0x02
.99F9:
    clc
    and.b 0x2C
    beq .99FF

    sec
.99FF:
    sep #0x10
    rtl

;-----

_849A02:
    php
    rep #0x10
    ldx.w #0x0BA8
    jsl _849C0E
    bcc .9A22

    lda.b #0x80
    tsb.w 0x0BD4
    lda.b #0x40
    tsb.w 0x0BD4
    ldy.w 0x0000
    bpl .9A22

    lda.b #0x40
    trb.w 0x0BD4
.9A22:
    plp
    rtl

;-----

_849A24:
    jsl _849A36
    bcs .9A33

    jsl _849A36.9A43
    bcc .9A35

    ldy.b #0x40
    rtl

.9A33:
    ldy.b #0x00
.9A35:
    rtl

;-----

_849A36:
    sep #0x20
    rep #0x11
    ldx.b 0x20
    lda.w 0x0007,X
    adc.b #0x08
    bra .9A51

.9A43:
    sep #0x21
    rep #0x10
    ldx.b 0x20
    lda.w 0x0007,X
    eor.b #0xFF
    inc
    sbc.b #0x08
.9A51:
    clc
    adc.w 0x0005,X
    sta.b 0x29
    stz.b 0x81
    lda.w 0x0006,X
    clc
    adc.w 0x0008,X
    sec
    sbc.w 0x0009,X
    sta.b 0x2A
    jsr _8490A0.local
    and.b #0x3F
    cmp.b #0x3C
    beq .9AA8

    cmp.b #0x34
    bcs .9A9B

    inc.b 0x81
    ldx.b 0x20
    lda.w 0x0006,X
    sta.b 0x2A
    jsr _8490A0.local
    and.b #0x3F
    cmp.b #0x34
    bcs .9A9B

    inc.b 0x81
    ldx.b 0x20
    lda.w 0x0006,X
    sec
    sbc.w 0x0008,X
    sta.b 0x2A
    jsr _8490A0.local
    and.b #0x3F
    cmp.b #0x34
    bcc .9AA4

.9A9B:
    cmp.b #0x36
    beq .9AA4

    sep #0x11
    rep #0x40
    rtl

.9AA4:
    sep #0x10
    clc
    rtl

.9AA8:
    sep #0x50
    rtl

;-----

_849AAB:
    lda.b #0x00
    ldx.b 0x2E
    bne .9AB4

    lda.b #0x04
    rtl

.9AB4:
    cpx.b #0x03
    bpl .9AB9

    rtl

.9AB9:
    inc
    cpx.b #0x05
    bpl .9ABF

    rtl

.9ABF:
    inc
    cpx.b #0x09
    bpl .9AC5

    rtl

.9AC5:
    inc
    cpx.b #0x0D
    bpl .9ACB

    rtl

.9ACB:
    inc
    rtl

;-----

_849ACD:
    lda.b 0x1B
    ora.b 0x1A
    beq .9AEB

    jsl _849AAB
    cmp.b #0x04
    bne .9AE2

    bit.b 0x1B
    bpl .9AE1

    lda.b #0x05
.9AE1:
    rtl

.9AE2:
    bit.b 0x1B
    bmi .9AEA

    tax
    lda.w 0x86BB9D,X
.9AEA:
    rtl

.9AEB:
    jsl _849AAB
    cmp.b #0x04
    bne .9AFA

    bit.b 0x11
.9AF5:
    bvs .9AF9

    lda.b #0x05
.9AF9:
    rtl

.9AFA:
    bit.b 0x11
    bvc .9B02

    tax
    lda.w 0x86BB9D,X
.9B02:
    rtl

;-----

_849B03:
    rep #0x10
    lda.b 0x27
    beq _849B43.9B79

    lda.b 0x0E
    beq .9B3E

    lda.w 0x1F0C
    bne .9B3E

    lda.w 0x0C32
    bne .9B28

    lda.w 0x0C30
    bne .9B28

    ldx.w #0x0BA8
    jsl _849C0E
    bcc .9B3E

    jmp _849D07

.9B28:
    lda.w 0x0E18
    beq .9B3E

    lda.w 0x0E48
    bne .9B3E

    ldx.w #0x0E18
    jsl _849C0E
    bcc .9B3E

    jmp _849D7E

.9B3E:
    sep #0x10
    lda.b #0x00
    rtl

;-----

_849B43:
    rep #0x10
    lda.b 0x27
    and.b #0x7F
    sta.b 0x27
    beq .9B79

    lda.b 0x30
    bne .9B79

    lda.b 0x0E
    beq .9B79

    ldx.w #0x1228
.9B58:
    sep #0x20
    lda.w 0x0000,X
    beq .9B6D

    lda.w 0x0030,X
    bne .9B6D

    jsl _849C0E
    bcc .9B6D

    jmp _849E10

.9B6D:
    rep #0x21
    txa
    adc.w #0x0040
    tax
    cmp.w #0x1428
    bcc .9B58

.9B79:
    sep #0x30
    lda.b #0x00
    rtl

;-----

_849B7E:
    rep #0x10
    lda.b 0x27
    and.b #0x7F
    sta.b 0x27
    beq .9BC5

    lda.b 0x30
    bne .9BC5

    lda.b 0x0E
    beq .9BC5

    ldx.w #0x0E68
.9B93:
    rep #0x20
    tdc
    sta.w 0x0000
    sep #0x20
    cpx.w 0x0000
    beq .9BB9

    lda.w 0x0000,X
    beq .9BB9

    lda.w 0x0030,X
    bne .9BB9

    jsl _849C0E
    bcc .9BB9

    lda.w 0x000A,X
    stx.w 0x0000
    sep #0x10
    rtl

.9BB9:
    rep #0x21
    txa
    adc.w #0x0040
    tax
    cmp.w #0x1228
    bcc .9B93

.9BC5:
    sep #0x32
    rtl

;-----

_849BC8:
    rep #0x10
    lda.b 0x30
    bne .9C09

    lda.b 0x0E
    beq .9C09

    ldx.w #0x1428
.9BD5:
    lda.w 0x0000,X
    beq .9BFB

    jsl _849C0E
    bcc .9BFB

    lda.w 0x0028,X
    beq .9BF8

    rep #0x20
    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x000E,X
    stz.w 0x002C,X
    sep #0x30
    lda.b #0x01
    rtl

.9BF8:
    sep #0xB0
    rtl

.9BFB:
    rep #0x21
    txa
    adc.w #0x0040
    tax
    cmp.w #0x1628
    sep #0x20
    bcc .9BD5

.9C09:
    sep #0x30
    lda.b #0x00
    rtl

;-----

_849C0E:
    phy
    ldy.b 0x20
    bne .9C16

    ply
    clc
    rtl

.9C16:
    ldy.w 0x0020,X
    bne .9C1E

    ply
    clc
    rtl

.9C1E:
    rep #0x20
    phx
    lda.w 0x0005,X
    sta.w 0x0004
    lda.w 0x0008,X
    sta.w 0x0006
    lda.b 0x05
    sta.w 0x000C
    lda.b 0x08
    sta.w 0x000E
    sep #0x20
    lda.w 0x0011,X
    sta.w 0x0008
    lda.b 0x11
    sta.w 0x0009
    ldy.w 0x0020,X
    ldx.b 0x20
    phd
    pea 0x0000
    pld
    lda.w 0x0002,X
    clc
    adc 0x0002,Y
    sta.b 0x00
    stz.b 0x01
    lda.w 0x0003,X
    clc
    adc 0x0003,Y
    sta.b 0x02
    stz.b 0x03
    rep #0x21
    lda 0x0000,Y
    and.w #0x00FF
    bit.w #0x0080
    beq .9C74

    ora.w #0xFF00
.9C74:
    bit.b 0x07
    bvc .9C7C

    eor.w #0xFFFF
    inc
.9C7C:
    sta.b 0x0A
    stz.b 0x10
    lda.w 0x0000,X
    and.w #0x00FF
    bit.w #0x0080
    beq .9C8E

    ora.w #0xFF00
.9C8E:
    bit.b 0x08
    bvc .9C96

    eor.w #0xFFFF
    inc
.9C96:
    adc.b 0x0C
    sec
    sbc.b 0x04
    sec
    sbc.b 0x0A
    bpl .9CA6

    dec.b 0x10
    eor.w #0xFFFF
    inc
.9CA6:
    sta.b 0x04
    lda.b 0x00
    sec
    sbc.b 0x04
    inc
    sta.b 0x04
    bit.b 0x0F
    bmi .9CB8

    eor.w #0xFFFF
    inc
.9CB8:
    sta.b 0x00
    bcc .9D01

    lda 0x0001,Y
    and.w #0x00FF
    bit.w #0x0080
    beq .9CCA

    ora.w #0xFF00
.9CCA:
    sta.b 0x0A
    stz.b 0x10
    lda.w 0x0001,X
    and.w #0x00FF
    bit.w #0x0080
    beq .9CDC

    ora.w #0xFF00
.9CDC:
    clc
    adc.b 0x0E
    sec
    sbc.b 0x06
    sec
    sbc.b 0x0A
    bpl .9CED

    dec.b 0x10
    eor.w #0xFFFF
    inc
.9CED:
    sta.b 0x06
    lda.b 0x02
    sec
    sbc.b 0x06
    inc
    sta.b 0x06
    bit.b 0x0F
    bmi .9CFF

    eor.w #0xFFFF
    inc
.9CFF:
    sta.b 0x02
.9D01:
    sep #0x20
    pld
    plx
    ply
    rtl

;-----

_849D07:
    sta.l 0x700505
    cmp.l 0x700505
    beq .9D1B

    dec.w 0x1F9F
    bpl .9D23

    stz.w 0x1F9F
    bra .9D23

.9D1B:
    inc.w 0x1F9F
    bne .9D23

    dec.w 0x1F9F
.9D23:
    lda.b 0x26
    beq .9D79

    bmi .9D79

.9D29:
    inc.w 0x0BD8
    inc.w 0x0C32
    lda.b #0x0E
    sta.w 0x0BAA
    stz.w 0x0BAB
    lda.b 0x26
    sta.w 0x0000
    lda.w 0x1F99
    bit.b #0x04
    beq .9D4B

    lsr.w 0x0000
    bcc .9D4B

    inc.w 0x0000
.9D4B:
    lda.w 0x0BCF
    and.b #0x7F
    sec
    sbc.w 0x0000
    sta.w 0x0BCF
    beq .9D5B

    bpl .9D66

.9D5B:
    stz.w 0x0BCF
    lda.b #0x0C
    sta.w 0x0BAA
    stz.w 0x0BAB
.9D66:
    lda.b #0x80
    tsb.w 0x0BCF
    lda.b #0x00
    ldy.b 0x05
    cpy.w 0x0BAD
    bcc .9D76

    lda.b #0x40
.9D76:
    sta.w 0x0C11
.9D79:
    sep #0x10
    lda.b #0x01
    rtl

;-----

_849D7E:
    lda.b 0x26
    bmi .9DC5

    inc.w 0x0E48
    lda.b #0x79
    sta.w 0x0E3E
    lda.b #0x00
    ldy.b 0x05
    cpy.w 0x0E1D
    bcc .9D95

    lda.b #0x40
.9D95:
    sta.w 0x0E4B
    lda.b 0x26
    cmp.b #0x08
    bcc .9DA0

    lda.b #0x07
.9DA0:
    bit.w 0x0E4B
    bvc .9DA8

    eor.b #0xFF
    inc
.9DA8:
    sta.w 0x0E57
    lda.w 0x0E3F
    and.b #0x7F
    sec
    sbc.b 0x26
    sta.w 0x0E3F
    bpl .9DBB

    stz.w 0x0E3F
.9DBB:
    lda.b #0x80
    tsb.w 0x0E3F
    sep #0x10
    lda.b #0x01
    rtl

.9DC5:
    sep #0x90
    rtl

;-----

_849DC8:
    php
    sep #0x20
    rep #0x10
    jsl 0x82833E
    bne .9E0E

    lda.w 0x1F0D
    dec
.9DD7:
    bmi .9DD7

    sta.w 0x000A,X
    cmp.b #0x08
    bne .9DE3

    dec.w 0x0C20
.9DE3:
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    lda.b 0x20
    sta.w 0x0020,X
    sep #0x20
    lda.b 0x11
    sta.w 0x0011,X
    phx
    jsl _849E10
    rep #0x10
    plx
    stz.w 0x0001,X
    phd
    phx
    pld
    jsl _84A51A
    pld
.9E0E:
    plp
    rtl

;-----

_849E10:
    rep #0x20
    stx.w 0x1F1E
    lda.w 0x000A,X
    and.w #0x00FF
    sta.w 0x0000
    lda.b 0x28
    and.w #0x00FF
    asl
    tay
    lda 0x86EF3A,Y
    clc
    adc.w 0x0000
    tay
    sep #0x20
    stz.w 0x0005
    lda.w 0x0000
    sta.w 0x1F1D
    lda.b #0x01
    sta.w 0x0004
    lda.b #0x00
    xba
    lda 0x86EF3A,Y
    bpl .9E53

    stx.w 0x0000
    and.b #0x7F
    tax
    jsr (.9EE5,X)
    ldx.w 0x0000
    bra .9EA4

.9E53:
    bne .9E58

    stz.w 0x0004
.9E58:
    lda.w 0x1F1D
    cmp.b #0x19
    beq .9E63

    cmp.b #0x1A
    bne .9E69

.9E63:
    lda.b #0x3C
    jsl 0x80888B
.9E69:
    lda.b 0x27
    and.b #0x7F
    sec
    sbc 0x86EF3A,Y
    bmi .9E94

    beq .9E94

    sta.b 0x27
    lda.b #0x11
    jsl 0x80888B
    lda.b #0x08
    sta.w 0x0001,X
    stz.w 0x0002,X
    stz.w 0x0003,X
    lda.w 0x000A,X
    cmp.b #0x1D
    beq .9EA0

    inc.w 0x0030,X
    bra .9EA0

.9E94:
    stz.b 0x27
    lda.b #0xFF
    sta.w 0x0004
    lda.b #0x06
    sta.w 0x0001,X
.9EA0:
    lda.b #0x80
    tsb.b 0x27
.9EA4:
    lda.b #0x00
    sta.w 0x1F1B
    ldy.w 0x001A,X
    beq .9EB7

    bpl .9EC0

.9EB0:
    lda.b #0x40
    sta.w 0x1F1B
    bra .9EC0

.9EB7:
    ldy.w 0x0005,X
    cpy.b 0x05
    bcc .9EC0

    bra .9EB0

.9EC0:
    lda.w 0x0004
    pha
    lda.w 0x0005
    pha
    phx
    jsl _84A544
    plx
    rep #0x20
    lda.w 0x0000
    sta.w 0x0033,X
    lda.w 0x0002
    sta.w 0x0035,X
    sep #0x30
    pla
    beq .9EE3

    sep #0x40
.9EE3:
    pla
    rtl

.9EE5: d16[.9EE9, .9F0B]

.9EE9:
    ldx.w 0x0000
    lda.b #0x04
    sta.w 0x0001,X
    stz.w 0x0002,X
    lda.w 0x000A,X
    cmp.b #0x1D
    beq .9EFE

    inc.w 0x0030,X
.9EFE:
    stz.w 0x0004
    inc.w 0x0005
    lda.b #0x10
    jsl 0x80888B
    rts

.9F0B:
    ldx.w 0x0000
    lda.b #0x08
    sta.w 0x0001,X
    rts

;-----

_849F14:
    lda.b #0x08
    sta.w 0x0BD7
    sta.w 0x0BD8
    lda.b #0x16
    sta.w 0x0BAA
    stz.w 0x0BAB
    rtl

;-----

_849F25:
    php
    sep #0x30
    bra .9F3D

.9F2A:
    php
    sep #0x30
    inc.w 0x0BD8
    lda.b #0x08
    sta.w 0x0BD7
    lda.b #0x0E
    sta.w 0x0BAA
    stz.w 0x0BAB
.9F3D:
    lda.w 0x0BCE
    beq .9F72

    sta.w 0x0000
    lda.w 0x1F99
    bit.b #0x04
    beq .9F54

    lsr.w 0x0000
    bcc .9F54

    inc.w 0x0000
.9F54:
    lda.w 0x0BCF
    and.b #0x7F
    sec
    sbc.w 0x0000
    sta.w 0x0BCF
    beq .9F64

    bpl .9F72

.9F64:
    stz.w 0x0BCF
    lda.b #0x0C
    sta.w 0x0BAA
    sta.w 0x0C12
    stz.w 0x0BAB
.9F72:
    lda.b #0x80
    tsb.w 0x0BCF
    plp
    rtl

;-----

_849F79:
    stz.w 0x0BD8
    lda.b #0x08
    sta.w 0x0BAA
    stz.w 0x0BAB
    rtl

;-----

_849F85:
    lda.w 0x0BAA
    cmp.b #0x18
    beq .9FAC

    sta.w 0x0C12
    sta.w 0x0C16
    lda.b #0x18
    sta.w 0x0BAA
    lda.l 0x849D0A
    cmp.l _849ACD.9AF5
    beq .9FAC

    cmp.l 0x849D0E
    beq .9FAC

    lda.b #0x80
    tsb.w 0x1F9F
.9FAC:
    rtl

;-----

_849FAD:
    lda.w 0x0C12
    sta.w 0x0BAA
    stz.w 0x0C16
    jsl get_rng
    tax
    lda.l 0x008000,X
    cmp.l 0x408000,X
    beq .9FC8

    stz.w 0x1F81
.9FC8:
    rtl

;-----

_849FC9:
    lda.w 0x0BAA
    cmp.b #0x1C
    beq .9FDB

    sta.w 0x0C15
    sta.w 0x0C16
    lda.b #0x1C
    sta.w 0x0BAA
.9FDB:
    rtl

;-----

_849FDC:
    lda.w 0x0C15
    sta.w 0x0BAA
    stz.w 0x0C16
    rtl

;-----

_849FE6:
    lda.b #0x1E
    sta.w 0x0BAA
    stz.w 0x0BAB
    sta.w 0x0C16
    rtl

;-----

_849FF2:
    lda.b #0x46
    sta.w 0x0BAA
    stz.w 0x0BAB
    sta.w 0x0C16
    rtl

;-----

_849FFE:
    stz.w 0x0BAA
    stz.w 0x0BAB
    stz.w 0x0C16
    rtl

;-----

_84A008:
    sta.w 0x0C2D
    lda.b #0x36
    sta.w 0x0BAA
    stz.w 0x0BAB
    rtl

;-----

_84A014:
    lda.b #0x34
    sta.w 0x0BAA
    stz.w 0x0BAB
    rtl

;-----

_84A01D:
    lda.b #0x38
    sta.w 0x0BAA
    stz.w 0x0BAB
    rtl

;-----

_84A026:
    lda.b #0x3C
    sta.w 0x0BAA
    stz.w 0x0BAB
    rtl

;-----

_84A02F:
    lda.b #0x3E
    sta.w 0x0BAA
    stz.w 0x0BAB
    rtl

;-----

_84A038:
    lda.b #0x40
    sta.w 0x0BAA
    stz.w 0x0BAB
    rtl

;-----

_84A041:
    lda.b #0x3A
    sta.w 0x0BAA
    stz.w 0x0BAB
    sta.w 0x0C16
    rtl

;-----

_84A04D:
    lda.b #0x2E
    sta.w 0x0BAA
    stz.w 0x0BAB
    sta.w 0x0BD8
    sta.w 0x0C16
    lda.b #0x01
    tsb.w 0x0C2F
    rtl

;-----

_84A061:
    lda.b #0x30
    sta.w 0x0BAA
    stz.w 0x0BAB
    sta.w 0x0BD8
    sta.w 0x0C16
    rtl

;-----

_84A070:
    lda.b #0x32
    sta.w 0x0BAA
    stz.w 0x0BAB
    sta.w 0x0C16
    rtl

;-----

_84A07C:
    php
    rep #0x20
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    lda.w 0x0BAD
    sta.w 0x0004
    lda.w 0x0BB0
    sta.w 0x0006
    bra .A09A

.A097:
    php
    rep #0x20
.A09A:
    sep #0x10
    phd
    lda.w #0x0000
    tcd
    ldx.b #0x00
    lda.b 0x04
    sec
    sbc.b 0x00
    sta.b 0x08
    bpl .A0B8

    eor.w #0xFFFF
    inc
    sta.b 0x08
    txa
    clc
    adc.w #0x0020
    tax
.A0B8:
    lda.b 0x02
    sec
    sbc.b 0x06
    sta.b 0x0A
    bpl .A0CD

    eor.w #0xFFFF
    inc
    sta.b 0x0A
    txa
    clc
    adc.w #0x0010
    tax
.A0CD:
    lda.b 0x0A
    cmp.b 0x08
    bcs .A0E1

    pha
    lda.b 0x08
    sta.b 0x0A
    pla
    sta.b 0x08
    txa
    clc
    adc.w #0x0008
    tax
.A0E1:
    lda.b 0x08
    asl
    asl
    asl
    sta.b 0x08
    lda.b 0x0A
    asl
    sta.b 0x0C
    ldy.b #0x04
.A0EF:
    lda.b 0x0A
    cmp.b 0x08
    bcs .A100

    lda.b 0x0A
    clc
    adc.b 0x0C
    sta.b 0x0A
    inx
    dey
    bne .A0EF

.A100:
    pld
    sep #0x20
    lda.w 0x86BB5D,X
    plp
    rtl

;-----

_84A108:
    rep #0x11
    lda.w 0x0BCF
    beq .A164

    ldx.w #0x0BA8
    jsl _849C0E
    bcc .A164

    phd
    lda.b #0x0B
    xba
    lda.b #0xA8
    tcd
    stz.w 0x0008
    lda.w 0x0006
    cmp.w 0x0004
    bpl .A14B

    lda.b #0x08
    ldx.w 0x0002
    bpl .A13B

    inc.w 0x0002
    bne .A139

    inc.w 0x0003
.A139:
    lda.b #0x04
.A13B:
    tsb.b 0x2C
    tsb.w 0x0008
    rep #0x21
    lda.b 0x08
    adc.w 0x0002
    sta.b 0x08
    bra .A162

.A14B:
    lda.b #0x02
    ldx.w 0x0000
    bpl .A154

    lda.b #0x01
.A154:
    tsb.b 0x2C
    tsb.w 0x0008
    rep #0x21
    lda.b 0x05
    adc.w 0x0000
    sta.b 0x05
.A162:
    pld
    sec
.A164:
    sep #0x30
    rtl

    ldy.b 0x20
    phy
    stx.b 0x20
    ldx.w #0x0BA8
    jsl _849C0E
    bcc .A181

    lda.b #0x80
    ldx.w 0x0000
    bmi .A17E

    ora.b #0x40
.A17E:
    tsb.w 0x0BD4
.A181:
    ply
    sty.b 0x20
    sep #0x10
    rtl

;-----

_84A187:
    rep #0x30
    ldx.w #0x0E68
.A18C:
    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x0027,X
    stz.w 0x000E,X
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1228
    bcc .A18C

    sep #0x30
    rtl

;-----

_84A1A6:
    rep #0x30
    ldx.w #0x0E68
.A1AB:
    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x0048
    beq .A1C2

    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x0027,X
    stz.w 0x000E,X
.A1C2:
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1228
    bcc .A1AB

    sep #0x30
    rtl

;-----

_84A1D0:
    rep #0x30
    ldy.w #0x0000
    ldx.w #0x0E68
.A1D8:
    lda.w 0x0000,X
    beq .A1F7

    sep #0x20
    lda.w 0x000A,X
    cmp.b 0x0A
    rep #0x20
    bne .A1F7

    txa
    sta 0x0000,Y
    tdc
    sta.w 0x002C
    cpx.w 0x002C
    beq .A1F7

    iny
    iny
.A1F7:
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1228
    bcc .A1D8

    sep #0x30
    rtl

;-----

_84A205:
    rep #0x30
    ldy.w #0x0000
    ldx.w #0x1D08
.A20D:
    lda.w 0x0000,X
    beq .A22C

    sep #0x20
    lda.w 0x000A,X
    cmp.b 0x0A
    rep #0x20
    bne .A22C

    txa
    sta 0x0000,Y
    tdc
    sta.w 0x002C
    cpx.w 0x002C
    beq .A22C

    iny
    iny
.A22C:
    txa
    clc
    adc.w #0x0010
    tax
    cmp.w #0x1E08
    bcc .A20D

    sep #0x30
    rtl

;-----

_84A23A:
    rep #0x30
    ldy.w #0x0000
    ldx.w #0x1928
.A242:
    lda.w 0x0000,X
    beq .A261

    sep #0x20
    lda.w 0x000A,X
    cmp.b 0x0A
    rep #0x20
    bne .A261

    txa
    sta 0x0000,Y
    tdc
    sta.w 0x002C
    cpx.w 0x002C
    beq .A261

    iny
    iny
.A261:
    txa
    clc
    adc.w #0x0020
    tax
    cmp.w #0x1D08
    bcc .A242

    sep #0x30
    rtl

;-----

_84A26F:
    rep #0x30
    ldx.w #0x1628
.A274:
    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x000E,X
    txa
    clc
    adc.w #0x0030
    tax
    cmp.w #0x1928
    bcc .A274

    sep #0x30
    rtl

;-----

_84A28B:
    rep #0x30
    ldx.w #0x1428
.A290:
    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x000E,X
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1628
    bcc .A290

    sep #0x30
    rtl

;-----

_84A2A7:
    rep #0x30
    ldx.w #0x1228
.A2AC:
    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x001B
    beq .A2C0

    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x000E,X
.A2C0:
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1428
    bcc .A2AC

    ldx.w #0x0C98
.A2CE:
    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x0001
    beq .A2DF

    stz.w 0x0000,X
    stz.w 0x0002,X
.A2DF:
    txa
    clc
    adc.w #0x0020
    tax
    cmp.w #0x0E18
    bcc .A2CE

    sep #0x30
    lda.w 0x0BDB
    cmp.b #0x06
    bne .A2FB

    ldx.b #0x30
    ldy.b #0x46
    jsl 0x828000
.A2FB:
    stz.w 0x0C0B
    stz.w 0x0BDD
    stz.w 0x0C25
    stz.w 0x0C35
    stz.w 0x0C30
    stz.w 0x0C31
    stz.w 0x1F31
    rtl

;-----

_84A311:
    php
    sep #0x30
    ldx.b #0x03
    ldy.b #0x01
    bra .A31D

.A31A:
    php
    sep #0x30
.A31D:
    sta.w 0x1E79
    stx.w 0x1E82
    sty.w 0x1E7E
    sty.w 0x1E80
    stz.w 0x1E84
    lda.b #0x01
    tsb.w 0x1E78
    plp
    rtl

;-----

_84A333:
    php
    sep #0x30
    ldx.b #0x03
    ldy.b #0x01
    bra .A33F

.A33C:
    php
    sep #0x30
.A33F:
    sta.w 0x1E7A
    stx.w 0x1E83
    sty.w 0x1E7F
    sty.w 0x1E81
    stz.w 0x1E85
    lda.b #0x02
    tsb.w 0x1E78
    plp
    rtl

;-----

_84A355:
    rep #0x10
    sta.w 0x0000
    jsl 0x8282B9
    bne .A37C

    inc.w 0x0000,X
    lda.b #0x01
    sta.w 0x000A,X
    lda.w 0x0000
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
.A37C:
    sep #0x10
    rtl

.A37F:
    asl
    asl
    asl
    dec
    tax
    jsl get_rng
.A388:
    inx
    sec
    sbc.w 0x86BBA2,X
    bcs .A388

    txa
    and.b #0x07
    asl
    tax
    jmp (.A397,X)

.A397: d16[.A3BF, .A3B4, .A3B0, .A3AB, .A3A7, .A3B9, .A3BC, .A3BF]

.A3A7:
    lda.b #0x00
    bra .A3AD

.A3AB:
    lda.b #0x01
.A3AD:
    jmp _84A355

.A3B0:
    lda.b #0x00
    bra .A3B6

.A3B4:
    lda.b #0x02
.A3B6:
    jmp .A3CD

.A3B9:
    jmp .A3F7

.A3BC:
    jmp .A423

.A3BF:
    lda.l _84A462.A475
    cmp.l .A3C7
.A3C7:
    beq .A3CC

    inc.w 0x1F9D
.A3CC:
    rtl

.A3CD:
    rep #0x10
    sta.w 0x0000
    jsl 0x8282B9
    bne .A3F4

    inc.w 0x0000,X
    lda.b #0x02
    sta.w 0x000A,X
    lda.w 0x0000
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
.A3F4:
    sep #0x10
    rtl

.A3F7:
    jsl 0x8282B9
    bne .A420

    inc.w 0x0000,X
    lda.b #0x04
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    lda.l 0x00804E
    cmp.l 0x40804E
    beq .A420

    stz.w 0x1F9B
.A420:
    sep #0x10
    rtl

.A423:
    jsl 0x8282B9
    bne .A442

    inc.w 0x0000,X
    lda.b #0x05
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
.A442:
    sep #0x10
    rtl

;-----

_84A445:
    jsl 0x828321
    bne .A45F

    inc.w 0x0000,X
    lda.b #0x4A
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.A45F:
    sep #0x30
    rtl

;-----

_84A462:
    php
.A463:
    rep #0x10
    sep #0x20
    jsl 0x8282D3
    bne .A4A9

    sta.l 0x701000
    cmp.l 0x701000
.A475:
    beq .A481

    dec.w 0x1F9D
    bpl .A484

    stz.w 0x1F9D
    bra .A484

.A481:
    inc.w 0x1F9D
.A484:
    inc.w 0x0000,X
    lda.b #0x02
    sta.w 0x000A,X
    lda.w 0x0004
    sta.w 0x0016,X
    lda.w 0x0005
    sta.w 0x000B,X
    stz.w 0x0018,X
    rep #0x20
    lda.w 0x0000
    sta.w 0x0005,X
    lda.w 0x0002
    sta.w 0x0008,X
.A4A9:
    plp
    rtl

.A4AB:
    php
    lda.b #0x23
    jsl 0x80888B
    rep #0x20
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    lda.w #0x0508
    sta.w 0x0004
    bra .A463

;-----

_84A4C6:
    php
    sep #0x30
    lda.w 0x0B9C
    and.w 0x0008
    bne .A518

    jsl get_rng
    and.b #0x03
    clc
    adc.b #0x93
    jsl 0x80888B
    rep #0x20
    jsl get_rng
    and.w 0x0004
    sta.w 0x0004
    lda.b 0x05
    clc
    adc.w 0x0000
    clc
    adc.w 0x0004
    sta.w 0x0000
    jsl get_rng
    and.w 0x0006
    sta.w 0x0006
    lda.b 0x08
    clc
    adc.w 0x0002
    clc
    adc.w 0x0006
    sta.w 0x0002
    lda.w #0x0508
    sta.w 0x0004
    jsl _84A462
.A518:
    plp
    rtl

;-----

_84A51A:
    php
    sep #0x20
    rep #0x10
    jsl 0x8282D3
    bne .A542

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x33
    sta.w 0x0005,X
    lda.b 0x35
    sta.w 0x0008,X
    tdc
    sta.w 0x001A,X
.A542:
    plp
    rtl

;-----

_84A544:
    php
    sep #0x20
    jsl _849C0E
    stx.w 0x0010
    txy
    ldx.w 0x0020,Y
    txy
    ldx.b 0x20
    sep #0x20
    lda 0x0002,Y
    cmp.w 0x0004
    bcc .A5CE

    lsr.w 0x0005
    ror.w 0x0004
    lda.w 0x0001
    bmi .A59B

    lda.w 0x0000,X
    bit.b 0x11
    bvc .A574

    eor.b #0xFF
    inc
.A574:
    cmp.b #0x00
    rep #0x20
    bmi .A57F

    and.w #0x00FF
    bra .A582

.A57F:
    ora.w #0xFF00
.A582:
    clc
    adc.b 0x05
    sta.w 0x0008
    lda.w 0x0002,X
    and.w #0x00FF
    clc
    adc.w 0x0008
    sec
    sbc.w 0x0004
    sta.w 0x0000
    bra .A5DB

.A59B:
    lda.w 0x0000,X
    bit.b 0x11
    bvc .A5A5

    eor.b #0xFF
    inc
.A5A5:
    cmp.b #0x00
    rep #0x20
    bmi .A5B0

    and.w #0x00FF
    bra .A5B3

.A5B0:
    ora.w #0xFF00
.A5B3:
    clc
    adc.b 0x05
    pha
    lda.w 0x0002,X
    and.w #0x00FF
    sta.w 0x0008
    pla
    sec
    sbc.w 0x0008
    clc
    adc.w 0x0004
    sta.w 0x0000
    bra .A5DB

.A5CE:
    rep #0x20
    phy
    ldy.w 0x0010
    lda 0x0005,Y
    sta.w 0x0000
    ply
.A5DB:
    sep #0x20
    lda 0x0003,Y
    cmp.w 0x0006
    bcc .A642

    lsr.w 0x0007
    ror.w 0x0006
    lda.w 0x0003
    bmi .A618

    lda.w 0x0001,X
    rep #0x20
    bmi .A5FC

    and.w #0x00FF
    bra .A5FF

.A5FC:
    ora.w #0xFF00
.A5FF:
    clc
    adc.b 0x08
    sta.w 0x0008
    lda.w 0x0003,X
    and.w #0x00FF
    clc
    adc.w 0x0008
    sec
    sbc.w 0x0006
    sta.w 0x0002
    bra .A64D

.A618:
    lda.w 0x0001,X
    rep #0x20
    bmi .A624

    and.w #0x00FF
    bra .A627

.A624:
    ora.w #0xFF00
.A627:
    clc
    adc.b 0x08
    pha
    lda.w 0x0003,X
    and.w #0x00FF
    sta.w 0x0008
    pla
    sec
    sbc.w 0x0008
    clc
    adc.w 0x0006
    sta.w 0x0002
    bra .A64D

.A642:
    rep #0x20
    ldy.w 0x0010
    lda 0x0008,Y
    sta.w 0x0002
.A64D:
    plp
    rtl

;-----

_84A64F:
    php
    rep #0x21
    lda.b 0x12
    adc.w 0x1E4D
    sec
    sbc.b 0x05
    sta.w 0x1E8D
    lda.b 0x14
    clc
    adc.w 0x1E50
    sec
    sbc.b 0x08
    sta.w 0x1E90
    sep #0x20
    plp
    rtl

;-----

_84A66D:
    ldx.b 0x03
    jmp (.A672,X)

.A672: d16[
    .A68C, .A6CB, .A786, .A7BD, .A7EF, .A7BD, .A7EF, .A7BD,
    .A826, .A914, .A95A, .A9E2, .AA35,
]

.A68C:
    inc.b 0x03
    inc.b 0x03
    lda.b #0xFF
    sta.b 0x00
    lda.b #0x3C
    sta.l 0x7FE000
    inc.w 0x1F13
    inc.w 0x1F14
    inc.w 0x1F15
    inc.w 0x1F16
    inc.w 0x1F17
    inc.w 0x1F18
    inc.w 0x1F1A
    inc.w 0x1F3B
    inc.w 0x1F31
    lda.w 0x0BCF
    and.b #0x7F
    beq .A6C0

    jsl _849F85
.A6C0:
    lda.b #0xF6
    ldy.b #0x03
    jsl 0x808868
    lda.b #0x00
    rtl

.A6CB:
    lda.l 0x7FE000
    dec
    sta.l 0x7FE000
    beq .A6D9

    lda.b #0x00
    rtl

.A6D9:
    phb
    rep #0x30
    ldx.w #0x0300
    ldy.w #0xE200
    lda.w #0x01FF
    mvn 0x7F,0x00
    plb
    phd
    lda.w #0x0000
    tcd
    ldx.w #0x0000
.A6F1:
    lda.w 0x0300,X
    and.w #0x001F
    clc
    adc.w #0x0007
    cmp.w #0x0020
    bcc .A703

    lda.w #0x001F
.A703:
    sta.b 0x00
    lda.w 0x0300,X
    and.w #0xFFE0
    ora.b 0x00
    sta.w 0x0300,X
    inx
    inx
    cpx.w #0x0100
    bcc .A6F1

    cpx.w #0x0200
    bcs .A726

    cpx.w #0x0180
    bcs .A6F1

    ldx.w #0x0180
    bra .A6F1

.A726:
    pld
    phb
    ldx.w #0x0300
    ldy.w #0xE400
    lda.w #0x01FF
    mvn 0x7F,0x00
    plb
    sep #0x30
    lda.b #0x01
    tsb.w 0x00A1
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F15
    stz.w 0x1F16
    stz.w 0x1F17
    stz.w 0x1F18
    lda.w 0x0BCF
    and.b #0x7F
    beq .A76A

    jsl _849FAD
    lda.w 0x1F7A
    cmp.b #0x0C
    beq .A766

    jsl _849FE6
    bra .A76A

.A766:
    jsl _84A041
.A76A:
    lda.b #0x78
    sta.l 0x7FE000
    lda.b #0x1F
    sta.l 0x7FE001
    inc.b 0x03
    inc.b 0x03
    lda.b #0x21
    jsl 0x80888B
    jsr _84AA7C
    jmp .AA5A

.A786:
    lda.l 0x7FE000
    dec
    sta.l 0x7FE000
    bne .A7B7

    lda.b #0xFF
    sta.w 0x0300
    phb
    rep #0x30
    ldx.w #0x0300
    ldy.w #0x0301
    lda.w #0x01FE
    mvn 0x00,0x00
    plb
    sep #0x30
    lda.b #0x02
    sta.l 0x7FE000
    inc.b 0x03
    inc.b 0x03
    lda.b #0x01
    tsb.w 0x00A1
.A7B7:
    jsr _84AA7C
    jmp .AA5A

.A7BD:
    lda.l 0x7FE000
    dec
    sta.l 0x7FE000
    bne .A7E9

    phb
    rep #0x30
    ldx.w #0xE400
    ldy.w #0x0300
    lda.w #0x01FF
    mvn 0x00,0x7F
    plb
    sep #0x30
    lda.b #0x02
    sta.l 0x7FE000
    inc.b 0x03
    inc.b 0x03
    lda.b #0x01
    tsb.w 0x00A1
.A7E9:
    jsr _84AA7C
    jmp .AA5A

.A7EF:
    lda.l 0x7FE000
    dec
    sta.l 0x7FE000
    bne .A820

    phb
    lda.b #0xFF
    sta.w 0x0300
    rep #0x30
    ldx.w #0x0300
    ldy.w #0x0301
    lda.w #0x01FE
    mvn 0x00,0x00
    sep #0x30
    plb
    lda.b #0x02
    sta.l 0x7FE000
    inc.b 0x03
    inc.b 0x03
    lda.b #0x01
    tsb.w 0x00A1
.A820:
    jsr _84AA7C
    jmp .AA5A

.A826:
    lda.l 0x7FE000
    dec
    sta.l 0x7FE000
    beq .A839

    lda.b #0x00
    jsr _84AA7C
    jmp .AA5A

.A839:
    lda.b #0x02
    sta.l 0x7FE000
    lda.l 0x7FE001
    dec
    sta.l 0x7FE001
    rep #0x30
    phd
    lda.w #0x0000
    tcd
    ldx.w #0x0000
.A852:
    lda.w 0x0300,X
    tay
    and.w #0x7C00
    sta.b 0x00
    tya
    and.w #0x03E0
    sta.b 0x02
    tya
    and.w #0x001F
    sta.b 0x04
    lda.b 0x00
    clc
    adc.w #0x0400
    cmp.w #0x8000
    bcc .A875

    lda.w #0x7C00
.A875:
    sta.b 0x06
    lda.b 0x02
    clc
    adc.w #0x0020
    cmp.w #0x03E0
    bcc .A885

    lda.w #0x03E0
.A885:
    tsb.b 0x06
    lda.b 0x04
    inc
    cmp.w #0x001F
    bcc .A892

    lda.w #0x001F
.A892:
    ora.b 0x06
    sta.w 0x0300,X
    inx
    inx
    cpx.w #0x0100
    bcc .A852

    cpx.w #0x0200
    bcs .A8AD

    cpx.w #0x01A0
    bcs .A852

    ldx.w #0x01A0
    bra .A852

.A8AD:
    ldx.w #0x0000
.A8B0:
    lda.w 0x0480,X
    tay
    and.w #0x7C00
    sta.b 0x00
    tya
    and.w #0x03E0
    sta.b 0x02
    tya
    and.w #0x001F
    sta.b 0x04
    lda.b 0x00
    sec
    sbc.w #0x0400
    bpl .A8D0

    lda.w #0x0000
.A8D0:
    sta.b 0x06
    lda.b 0x02
    sec
    sbc.w #0x0020
    bpl .A8DD

    lda.w #0x0000
.A8DD:
    tsb.b 0x06
    lda.b 0x04
    dec
    bpl .A8E7

    lda.w #0x0000
.A8E7:
    ora.b 0x06
    sta.w 0x0480,X
    inx
    inx
    cpx.w #0x0020
    bcc .A8B0

    pld
    sep #0x30
    lda.b #0x01
    sta.w 0x00A1
    lda.l 0x7FE001
    bne .A911

    lda.b #0x5A
    sta.l 0x7FE000
    lda.b #0x1F
    sta.l 0x7FE001
    inc.b 0x03
    inc.b 0x03
.A911:
    jmp .AA5A

.A914:
    lda.l 0x7FE000
    beq .A922

    dec
    sta.l 0x7FE000
    jmp .AA5A

.A922:
    rep #0x30
    ldx.w #0x001E
.A927:
    lda.w 0x0480,X
    clc
    adc.w #0x0421
    sta.w 0x0480,X
    dex
    dex
    bpl .A927

    sep #0x30
    lda.b #0x01
    sta.w 0x00A1
    lda.l 0x7FE001
    dec
    sta.l 0x7FE001
    bne .A957

    lda.b #0x28
    sta.l 0x7FE000
    lda.b #0x1F
    sta.l 0x7FE001
    inc.b 0x03
    inc.b 0x03
.A957:
    jmp .AA5A

.A95A:
    lda.l 0x7FE000
    dec
    sta.l 0x7FE000
    beq .A968

    lda.b #0x00
    rtl

.A968:
    lda.b #0x02
    sta.l 0x7FE000
    rep #0x30
    phd
    lda.w #0x0000
    tcd
    ldx.w #0x0000
.A978:
    lda.l 0x7FE200,X
    tay
    and.w #0x7C00
    sta.b 0x00
    tya
    and.w #0x03E0
    sta.b 0x02
    tya
    and.w #0x001F
    sta.b 0x04
    lda.w 0x0300,X
    tay
    and.w #0x7C00
    cmp.b 0x00
    beq .A99D

    sec
    sbc.w #0x0400
.A99D:
    sta.b 0x06
    tya
    and.w #0x03E0
    cmp.b 0x02
    beq .A9AB

    sec
    sbc.w #0x0020
.A9AB:
    tsb.b 0x06
    tya
    and.w #0x001F
    cmp.b 0x04
    beq .A9B6

    dec
.A9B6:
    ora.b 0x06
    sta.w 0x0300,X
    inx
    inx
    cpx.w #0x0200
    bcc .A978

    pld
    sep #0x30
    lda.b #0x01
    sta.w 0x00A1
    lda.l 0x7FE001
    dec
    sta.l 0x7FE001
    bne .A9DF

    inc.b 0x03
    inc.b 0x03
    lda.b #0x1E
    sta.l 0x7FE000
.A9DF:
    lda.b #0x00
    rtl

.A9E2:
    lda.l 0x7FE000
    dec
    sta.l 0x7FE000
    bne .AA35

    lda.w 0x0BDB
    cmp.b #0x04
    bne .A9FF

    rep #0x10
    ldy.w #0x0104
    jsl 0x828011
    sep #0x10
.A9FF:
    inc.b 0x03
    inc.b 0x03
    lda.w 0x1F7A
    cmp.b #0x09
    bcs .AA38

    dec
    asl
    tax
    lda.b #0x40
    ora.w 0x1F88,X
    sta.w 0x1F88,X
    lda.w 0x0BCF
    and.b #0x7F
    beq .AA32

    dec.w 0x1F31
    dec.w 0x1F3B
    inc.w 0x1F23
    rep #0x20
    lda.w 0x1E4D
    sta.w 0x1E60
    sta.w 0x1E5E
    sep #0x20
.AA32:
    lda.b #0x80
    rtl

.AA35:
    lda.b #0x00
    rtl

.AA38:
    lda.w 0x1F7A
    cmp.b #0x0C
    beq .AA43

    jsl _849FFE
.AA43:
    stz.w 0x1F0C
    stz.w 0x0BD8
    dec.w 0x1F31
    dec.w 0x1F3B
    dec.w 0x1F1A
    lda.b #0x04
    sta.w 0x1F10
    lda.b #0x80
    rtl

.AA5A:
    lda.b #0x03
    sta.w 0x0008
    rep #0x20
    lda.w #0xFFE1
    sta.w 0x0000
    sta.w 0x0002
    lda.w #0x003F
    sta.w 0x0004
    sta.w 0x0006
    sep #0x20
    jsl _84A4C6
    lda.b #0x00
    rtl

;-----

_84AA7C:
    lda.w 0x0B9C
    and.b #0x03
    bne .AAC7

    jsl 0x8282D3
    bne .AAC7

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x000C,X
    rep #0x20
    jsl get_rng
    and.w #0x001F
    lsr
    bcc .AAAD

    eor.w #0xFFFF
    inc
.AAAD:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    jsl get_rng
    and.w #0x000F
    lsr
    bcc .AAC1

    eor.w #0xFFFF
    inc
.AAC1:
    clc
    adc.b 0x08
    sta.w 0x0008,X
.AAC7:
    sep #0x30
    rts

;-----

_84AACA:
    lda.w 0x1F7A
    cmp.b #0x09
    bcs .AAE0

    asl
    tax
    lda.w 0x1F86,X
    and.b #0x40
    beq .AAE0

    inc.w 0x1F23
    lda.b #0x01
    rtl

.AAE0:
    lda.b #0x00
    rtl

    php
    phd
    pea 0x0000
    pld
    sep #0x10
    stx.b 0x2C
    ldy.b #0x00
.AAEF:
    tyx
    cpx.b 0x2C
    bcs .AB10

.AAF4:
    lda 0x0000,Y
    cmp.b 0x00,X
    bcs .AB04

    pha
    lda.b 0x00,X
    sta 0x0000,Y
    pla
    sta.b 0x00,X
.AB04:
    inx
    inx
    cpx.b 0x2C
    beq .AAF4

    bcc .AAF4

    iny
    iny
    bra .AAEF

.AB10:
    pld
    plp
    rtl

;-----

_84AB13:
    php
    phd
    pea 0x0000
    pld
    sep #0x10
    stx.b 0x2C
    ldy.b #0x00
.AB1F:
    tyx
    cpx.b 0x2C
    bcs .AB40

.AB24:
    lda 0x0000,Y
    cmp.b 0x00,X
    bcc .AB34

    pha
    lda.b 0x00,X
    sta 0x0000,Y
    pla
    sta.b 0x00,X
.AB34:
    inx
    inx
    cpx.b 0x2C
    beq .AB24

    bcc .AB24

    iny
    iny
    bra .AB1F

.AB40:
    pld
    plp
    rtl

;-----

_84AB43:
    php
    sep #0x20
    rep #0x10
    lda.w 0x0BD4
    bmi .AB6C

    ldx.w #0x0BA8
    jsl _849C0E
    bcc .AB6C

    lda.w 0x0001
    bmi .AB62

    lda.b #0x40
    tsb.w 0x0BD4
    bra .AB67

.AB62:
    lda.b #0x40
    trb.w 0x0BD4
.AB67:
    lda.b #0x80
    tsb.w 0x0BD4
.AB6C:
    plp
    rtl

;-----

_84AB6E:
    php
    sep #0x30
    lda.b 0x2C
    beq .AB9B

    lda.w 0x0BD4
    ora.w 0x0BD3
    and.b #0x04
    bne .AB9B

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
.AB9B:
    stz.b 0x2C
    lda.w 0x0E22
    asl
    asl
    bcs .AC20

    rep #0x10
    ldx.w #0x0BA8
    jsl _849C0E
    bcc .AC20

    rep #0x20
    lda.w 0x0004
    cmp.w 0x0006
    beq .ABBB

    bcc .ABF0

.ABBB:
    lda.w 0x0002
    bpl .ABD0

    inc
    cmp.w #0xFFF8
    bpl .ABC9

    lda.w #0xFFF8
.ABC9:
    clc
    adc.w 0x0BB0
    sta.w 0x0BB0
.ABD0:
    sep #0x20
    lda.w 0x0003
    bmi .ABE5

    lda.w 0x0BD3
    ora.w 0x0BD4
    and.b #0x04
    bne .AC20

    lda.b #0x08
    bra .ABEB

.ABE5:
    lda.b #0x01
    sta.b 0x2C
    lda.b #0x04
.ABEB:
    tsb.w 0x0BD4
    bra .AC20

.ABF0:
    lda.w 0x0000
    bmi .AC00

    dec
    cmp.w #0x0009
    bcc .AC09

    lda.w #0x0008
    bra .AC09

.AC00:
    inc
    cmp.w #0xFFF8
    bpl .AC09

    lda.w #0xFFF8
.AC09:
    clc
    adc.w 0x0BAD
    sta.w 0x0BAD
    sep #0x20
    lda.w 0x0001
    bmi .AC1B

    lda.b #0x02
    bra .AC1D

.AC1B:
    lda.b #0x01
.AC1D:
    tsb.w 0x0BD4
.AC20:
    plp
    rtl

;-----

_84AC22:
    phd
    pea 0x0000
    pld
    sta.b 0x00
    sty.b 0x02
    lda.b 0x00
    beq .AC4A

    jsl get_rng
    and.b 0x02
    beq .AC46

    lda.b 0x00
    bpl .AC3D

.AC3B:
    lda.b #0x00
.AC3D:
    inc
    sta.b 0x00
    cmp.b #0x03
    bcc .AC55

    bra .AC4A

.AC46:
    lda.b 0x00
    bmi .AC4C

.AC4A:
    lda.b #0x80
.AC4C:
    inc
    sta.b 0x00
    and.b #0x7F
    cmp.b #0x03
    bcs .AC3B

.AC55:
    pld
    lda.w 0x0000
    rtl

;-----

_84AC5A:
    rep #0x30
    ldy.w #0x0000
    ldx.w #0x1628
.AC62:
    lda.w 0x0000,X
    beq .AC82

    sep #0x20
    lda.w 0x000A,X
    beq .AC82

    cmp.b #0x03
    beq .AC82

    cmp.b #0x06
    bcc .AC7A

    cmp.b #0x0B
    bne .AC82

.AC7A:
    rep #0x20
    txa
    sta 0x0000,Y
    iny
    iny
.AC82:
    rep #0x20
    txa
    clc
    adc.w #0x0030
    tax
    cmp.w #0x1928
    bcc .AC62

    sep #0x30
    rtl

;-----

_84AC92:
    php
    sep #0x20
    lda.b #0x40
    trb.b 0x11
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    lda.b #0x00
    ror
    lsr
    tsb.b 0x11
    plp
    rtl

;-----

_84ACAB:
    php
    phd
    rep #0x20
    sep #0x10
    lda.w #0x0000
    tcd
    stz.b 0x12
    lda.w #0xFFFF
    sta.b 0x10
    lda.b 0x00
    sec
    sbc.b 0x04
    bpl .ACC9

    inc.b 0x12
    eor.w #0xFFFF
    inc
.ACC9:
    sta.b 0x0A
    lda.b 0x06
    sec
    sbc.b 0x02
    cmp.w #0x0100
    bmi .ACD8

    lda.w #0x00FF
.ACD8:
    cmp.w #0x0000
    bpl .ACE3

    inc.b 0x13
    eor.w #0xFFFF
    inc
.ACE3:
    sta.b 0x0C
    xba
    sta.b 0x0E
    lda.b 0x08
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.b 0x08
    sep #0x20
    jsr _84ADE2
    jsr _84AD62
    lda.b 0x1A
    bne .AD02

    jsr _84AD41
    bcc .AD30

.AD02:
    lda.b #0x10
    sta.b 0x18
    lda.b #0x20
    sta.b 0x10
.AD0A:
    jsr _84ADE2
    jsr _84AD62
    lda.b 0x1A
    bne .AD20

    jsr _84AD41
    bcs .AD20

    lda.b 0x10
    sec
    sbc.b 0x18
    bra .AD25

.AD20:
    lda.b 0x10
    clc
    adc.b 0x18
.AD25:
    sta.b 0x10
    lsr.b 0x18
    lda.b 0x18
    bne .AD0A

    jsr _84ADE2
.AD30:
    lda.b 0x12
    beq .AD3E

    rep #0x20
    lda.b 0x00
    eor.w #0xFFFF
    inc
    sta.b 0x00
.AD3E:
    pld
    plp
    rtl

;-----

_84AD41:
    lda.b 0x00
    sta.w 0x211B
    lda.b 0x01
    sta.w 0x211B
    lda.b 0x14
    stz.w 0x211C
    sta.w 0x211C
    lda.w 0x2134
    rep #0x20
    lda.w 0x2135
    cmp.b 0x0A
    bcc .AD5F

.AD5F:
    sep #0x20
    rts

;-----

_84AD62:
    php
    rep #0x20
    sep #0x10
    stz.b 0x14
    stz.b 0x1A
    lda.b 0x02
    sta.b 0x16
    lda.w #0x0000
.AD72:
    clc
    adc.b 0x16
    bcs .ADA2

    cmp.b 0x0E
    bcs .ADA2

    inc.b 0x14
    pha
    ldx.b 0x13
    beq .AD92

    lda.b 0x16
    clc
    adc.w #0x0040
    cmp.w #0x2000
    bcs .ADA1

    sta.b 0x16
    pla
    bra .AD72

.AD92:
    lda.b 0x16
    sec
    sbc.w #0x0040
    bcc .AD9F

    sta.b 0x16
    pla
    bra .AD72

.AD9F:
    inc.b 0x1A
.ADA1:
    pla
.ADA2:
    lda.b 0x02
    sta.w 0x4204
    ldx.b #0x40
    stx.w 0x4206
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    lda.w 0x4214
    asl
    ldx.b 0x13
    beq .ADC3

    clc
    adc.b 0x14
    sta.b 0x14
    plp
    rts

.ADC3:
    sec
    sbc.b 0x14
    sta.b 0x14
    plp
    rts

;-----

_84ADCA:
    php
    phd
    rep #0x20
    pea 0x0000
    pld
    sta.b 0x10
    lda.b 0x08
    lsr
    lsr
    lsr
    lsr
    sta.b 0x08
    jsr _84ADE2
    pld
    plp
    rtl

;-----

_84ADE2:
    lda.b 0x10
    inc
    rep #0x30
    and.w #0x00FF
    asl
    asl
    tax
    sep #0x20
    lda.w 0x00BBDA,X
    sta.w 0x211B
    lda.w 0x00BBDB,X
    sta.w 0x211B
    lda.b 0x08
    stz.w 0x211C
    sta.w 0x211C
    lda.w 0x2134
    lda.w 0x2135
    sta.b 0x00
    lda.w 0x2136
    sta.b 0x01
    lda.w 0x00BBDC,X
    sta.w 0x211B
    lda.w 0x00BBDD,X
    sta.w 0x211B
    lda.b 0x08
    stz.w 0x211C
    sta.w 0x211C
    lda.w 0x2134
    lda.w 0x2135
    sta.b 0x02
    lda.w 0x2136
    sta.b 0x03
    sep #0x10
    rts

;-----

    incsrc "obj/thunder_slimer.asm"

;-----

incbin "todo/bank84.bin"
