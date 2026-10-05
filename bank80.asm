org 0x8000*0
base 0x808000

;-----

entry:
    sei
    clc
    xce
    jml .8007

.8007:
    stz.w snes_regs.nmitimen
    stz.w snes_regs.hdmaen
    stz.w snes_regs.mdmaen
    lda.b #0
    sta.l 0x7EFFFF
.8016:
    lda.b #1
    sta.w snes_regs.memsel
    lda.b #0x86
    pha
    plb
    rep #0x10
    ldx.w #0x8000
.8024:
    lda.w 0x0000,X
    beq .8052

    lsr
    sta.b 0x00
    inx
    lda.w 0x0000,X
    sta.b 0x10
    inx
    lda.w 0x0000,X
    sta.b 0x11
    inx
.8039:
    lda.w 0x0000,X
    sta (0x10)
    inx
    bcc .8047

    lda.w 0x0000,X
    sta (0x10)
    inx
.8047:
    ldy.b 0x10
    iny
    sty.b 0x10
    dec.b 0x00
    bne .8039

    bra .8024

.8052:
    rep #0x30
    ldx.w #0x1F9F
.8057:
    stz.b 0x00,X
    dex
    dex
    bpl .8057

    ldx.w #0x2FF
    txs
    sep #0x10
    ldx.b #0
    txy
.8066:
    lda 0x868067,Y
    sta.b 0x36,X
    iny
    iny
    txa
    clc
    adc.w #0x10
    tax
    cpx.b #0x70
    bne .8066

    lda.w #0xD37
    sta.w ram.rng_state
    ldx.b #0
    lda.w #0x852C
    jsr _80813B
    jsr _8088D5
    lda.b #0x80
    sta.b 0xB3
    lda.b #0xB1
    sta.b 0xC2
    sta.w snes_regs.nmitimen
    cli
    jmp _808099

;-----

_808097:
    bra _808097

;-----

_808099:
    rep #0x10
    ldx.w #0x2FF
    txs
    sep #0x30
.80A1:
    lda.w 0x0B9D
    beq .80A1

    inc.w 0x0B9B
    ldx.b #0x00
.80AB:
    lda.b 0x30,X
    cmp.b #1
    beq .80DA

    cmp.b #2
    bne .80B9

    dec.b 0x31,X
    beq .80E9

.80B9:
    txa
    clc
    adc.b #0x10
    tax
    cpx.b #0x60
    beq .80CC

    cpx.b #0x70
    bne .80AB

    stz.w 0x0B9D
    jmp _808099

.80CC:
    stz.w 0x0B9D
    lda.b 0x30,X
    cmp.b #1
    beq .80DA

    bcs .80E9

    jmp _808099

.80DA:
    stx.b 0xA0
    lda.b #0x03
    sta.b 0x30,X
    lda.b 0x37,X
    xba
    lda.b 0x36,X
    tcs
    jmp (0x0032,X)

.80E9:
    stx.b 0xA0
    lda.b #0x03
    sta.b 0x30,X
    rep #0x30
    lda.b 0x34,X
    tcs
    plp
    ply
    plx
    rts

.80F8:
    sep #0x30
    ldx.b 0xA0
    stz.b 0x30,X
    bra .80B9

.8100:
    phx
    phy
    php
    rep #0x20
    sep #0x10
    lda.w #0x0102
    bra .8116

.810C:
    phx
    phy
    php
    sep #0x30
    xba
    lda.b #0x02
    rep #0x20
.8116:
    ldx.b 0xA0
    sta.b 0x30,X
    tsc
    sta.b 0x34,X
    sep #0x30
    bra .80B9

.8121:
    bit.w 0x0B9D
    bmi .8127
    rts

.8127:
    phx
    phy
    php
    rep #0x20
    sep #0x10
    ldx.b 0xA0
    lda.w #0x0102
    sta.b 0x30,X
    tsc
    sta.b 0x34,X
    jmp _808099

;-----

_80813B:
    php
    rep #0x20
    sta.b 0x32,X
    lda.w #0x0101
    sta.b 0x30,X
    plp
    rts

;-----

_808147:
    php
    rep #0x20
    stz.b 0x30,X
    plp
    rts

;-----

_80814E:
    php
    rep #0x30
    ldx.w #0x0000
.8154:
    lsr
    bcc .8159

    stz.b 0x30,X
.8159:
    pha
    clc
    txa
    adc.w #0x10
    tax
    pla
    cpx.w #0x70
    bcc .8154

    plp
    rts

;-----

nmi:
    rep #0x38
    pha
    phx
    phy
    phd
    phb
    lda.w #0x0000
    tcd
    phk
    plb
    sep #0x30
    stz.w 0x1E08
    inc.w 0x0B9E
    lda.w snes_regs.rdnmi
    lda.b #0x80
    sta.w snes_regs.inidisp
    jsr _8083D9
    lda.w 0x0B9D
    ora.w 0x0BA0
    bne .8193

    jsr _80880B
.8193:
    lda.b #0xFF
    sta.w 0x0B9D
    sta.w 0x0BA0
.819B:
    lda.w snes_regs.hvbjoy
    lsr
    bcs .819B

    rep #0x30
    lda.w 0x1F48
    and.w #0xFF
    bne .81C4

    lda.b 0xA7
    sta.b 0xA9
    lda.w snes_regs.joy1l
    tax
    and.w #0x000F
    beq .81BB

    ldx.w #0x0000
.81BB:
    stx.b 0xA7
    txa
    eor.b 0xA9
    and.b 0xA7
    sta.b 0xAB
.81C4:
    lda.b 0xAD
    sta.b 0xAF
    lda.w snes_regs.joy2l
    tax
    and.w #0x000F
    beq .81D4

    ldx.w #0x0000
.81D4:
    stx.b 0xAD
    txa
    eor.b 0xAF
    and.b 0xAD
    sta.b 0xB1
    plb
    pld
    ply
    plx
    pla
    rti

;-----

_8081E3:
    rep #0x10
    stz.w snes_regs.dmap0
    stz.w snes_regs.a1b0
    stz.w snes_regs.oamaddl
    stz.w snes_regs.oamaddh
    lda.b #0x04
    sta.w snes_regs.bbad0
    ldy.w #0x0700
    sty.w snes_regs.a1t0l
    ldy.w #0x0220
    sty.w snes_regs.das0l
    lda.b #0x01
    sta.w snes_regs.mdmaen
    lda.b 0xA1
    beq .8226

    stz.w snes_regs.cgadd
    lda.b #0x22
    sta.w snes_regs.bbad0
    ldy.w #0x0300
    sty.w snes_regs.a1t0l
    ldy.w #0x0200
    sty.w snes_regs.das0l
    lda.b #0x01
    sta.w snes_regs.mdmaen
    stz.b 0xA1
.8226:
    lda.b 0xB4
    sta.w snes_regs.bg1hofs
    lda.b 0xB5
    sta.w snes_regs.bg1hofs
    lda.b 0xB6
    sta.w snes_regs.bg1vofs
    lda.b 0xB7
    sta.w snes_regs.bg1vofs
    lda.b 0xB8
    sta.w snes_regs.bg2hofs
    lda.b 0xB9
    sta.w snes_regs.bg2hofs
    lda.b 0xBA
    sta.w snes_regs.bg2vofs
    lda.b 0xBB
    sta.w snes_regs.bg2vofs
    lda.b 0xBC
    sta.w snes_regs.bg3hofs
    lda.b 0xBD
    sta.w snes_regs.bg3hofs
    lda.b 0xBE
    sta.w snes_regs.bg3vofs
    lda.b 0xBF
    sta.w snes_regs.bg3vofs
    lda.b 0xC9
    sta.w snes_regs.cgwsel
    lda.b 0xCA
    sta.w snes_regs.cgadsub
    lda.b 0xCB
    ora.b #0x20
    sta.w snes_regs.coldata
    lda.b 0xCC
    ora.b #0x40
    sta.w snes_regs.coldata
    lda.b 0xCD
    ora.b #0x80
    sta.w snes_regs.coldata
    sep #0x30
    stz.b 0xC3
    ldx.b #0x00
    ldy.b #0x70
.8289:
    lda.w 0x0AA1,X
    bne .8291

    clc
    bra .82B6

.8291:
    lda.w 0x0AA2,X ;make some defines for the dma regs
    sta 0x4300,Y
    lda.w 0x0AA3,X
    sta 0x4301,Y
    lda.w 0x0AA4,X
    sta 0x4302,Y
    lda.w 0x0AA5,X
    sta 0x4303,Y
    lda.w 0x0AA6,X
    sta 0x4304,Y
    lda.w 0x0AA7,X
    sta 0x4307,Y
    sec
.82B6:
    rol.b 0xC3
    txa
    clc
    adc.b #0x07
    tax
    tya
    sec
    sbc.b #0x10
    tay
    bne .8289

    clc
    rol.b 0xC3
    rts

;-----

_8082C8:
    lda.b 0xA2
    beq .8332

    rep #0x10
    lda.b #0x80
    sta.w snes_regs.vmain
    ldy.w #0x1000
    ldx.w #0x1809
    stx.w snes_regs.dmap0
    ldx.w #0xFFB0
    stx.w snes_regs.a1t0l
    stz.w snes_regs.a1b0
    lsr.b 0xA2
    bcc .82F7

    ldx.w #0x5000
    stx.w snes_regs.vmaddl
    sty.w snes_regs.das0l
    lda.b #0x01
    sta.w snes_regs.mdmaen
.82F7:
    lsr.b 0xA2
    bcc .8309

    ldx.w #0x5800
    stx.w snes_regs.vmaddl
    sty.w snes_regs.das0l
    lda.b #0x01
    sta.w snes_regs.mdmaen
.8309:
    lsr.b 0xA2
    bcc .831B

    ldx.w #0x0800
    stx.w snes_regs.vmaddl
    sty.w snes_regs.das0l
    lda.b #0x01
    sta.w snes_regs.mdmaen
.831B:
    lsr.b 0xA2
    bcc .8330

    ldx.w #0x6000
    stx.w snes_regs.vmaddl
    ldy.w #0x0400
    sty.w snes_regs.das0l
    lda.b #0x01
    sta.w snes_regs.mdmaen
.8330:
    sep #0x30
.8332:
    lda.b 0xA3
    beq .8378

    lda.b #0x18
    sta.w snes_regs.bbad0
    lda.b #0x01
    sta.w snes_regs.dmap0
    ldx.b #0x00
.8342:
    lda.w 0x0500,X
    sta.w snes_regs.vmain
    rep #0x21
    lda.w 0x0501,X
    sta.w snes_regs.vmaddl
    lda.w 0x0503,X
    sta.w snes_regs.das0l
    lda.w 0x0505,X
    sta.w snes_regs.a1t0l
    sep #0x20
    lda.w 0x0507,X
    sta.w snes_regs.a1b0
    lda.b #0x01
    sta.w snes_regs.mdmaen
    txa
    adc.b #0x08
.836C:
    bcs .836C

    tax
    cpx.b 0xA3
    bne .8342

    stz.b 0xA3
    stz.w 0x1F25
.8378:
    lda.b 0xA4
    beq .83C5

    lda.b #0x01
    sta.w snes_regs.dmap0
    lda.b #0x18
    sta.w snes_regs.bbad0
    clc
    ldx.b #0x00
.8389:
    lda.w 0x0600,X
    sta.w snes_regs.vmain
    lda.w 0x0601,X
    sta.w snes_regs.vmaddl
    lda.w 0x0602,X
    sta.w snes_regs.vmaddh
    lda.w 0x0603,X
    sta.w snes_regs.das0l
    stz.w snes_regs.das0h
    inx
    inx
    inx
    inx
    stx.w snes_regs.a1t0l
    lda.b #0x06
    sta.w snes_regs.a1t0h
    stz.w snes_regs.a1b0
    lda.b #0x01
    sta.w snes_regs.mdmaen
    txa
    adc.w 0x05FF,X
.83BC:
    bcs .83BC

    tax
    cpx.b 0xA4
    bne .8389

    stz.b 0xA4
.83C5:
    jmp _80BA07

;-----

_8083C8:
    stz.w snes_regs.m7a
    lda.b #0x01
    sta.w snes_regs.m7a
    stz.w snes_regs.m7b
    lda.b #0x01
    sta.w snes_regs.m7b
    rts

;-----

_8083D9:
    ldx.b #0x04
    lda.w 0x0BA5
    bne .83E8

    lda.b 0xC2
    sta.w snes_regs.nmitimen
    ldx.w 0x0BA1
.83E8:
    jmp (.83EB,X)

.83EB: d16[.83F1, .8428, .8458]

.83F1:
    stz.w 0x0BA2
    lda.b #0x60
    sta.w snes_regs.htimel
    sta.w snes_regs.vtimel
.83FC:
    lda.w 0x0B9D
    ora.w 0x0BA0
    bne .8421

    jsr _8081E3
    jsr _8082C8
    lda.b 0xC3
    sta.w snes_regs.hdmaen
    beq .8421

    rep #0x30
    ldx.w #0x0B22
    ldy.w #0x0AD2
    lda.w #0x004F
    mvn 0x00, 0x00
    sep #0x30
.8421:
    lda.b 0xB3
    sta.w snes_regs.inidisp
    bra .844D

.8428:
    lda.b #0x02
    sta.w 0x0BA2
    lda.w snes_regs.timeup
    lda.b #0xA0
    sta.w snes_regs.htimel
    rep #0x20
    lda.w 0x1F28
    sec
    sbc.w 0x1E50
    cmp.w #0xE0
    bcc .8446

    lda.w #0xE0
.8446:
    sta.w snes_regs.vtimel
    sep #0x20
    bra .83FC

.844D:
    lda.b 0xC0
    sta.w snes_regs.tm
    lda.b 0xC1
    sta.w snes_regs.ts
    rts

.8458:
    jsr _8081E3
    jsr _8082C8
    lda.b #0xB1
    sta.w snes_regs.nmitimen
    lda.b #0x0F
    sta.w snes_regs.inidisp
    lda.b #0x04
    sta.w snes_regs.tm
    lda.b #0x80
    sta.w 0x0BA2
    lda.b #0x88
    sta.w snes_regs.htimel
    lda.b #0x47
    sta.w snes_regs.vtimel
    stz.w snes_regs.bg1hofs
    stz.w snes_regs.bg1hofs
    stz.w snes_regs.bg1vofs
    stz.w snes_regs.bg1vofs
    stz.w snes_regs.bg2hofs
    stz.w snes_regs.bg2hofs
    stz.w snes_regs.bg2vofs
    stz.w snes_regs.bg2vofs
    stz.w snes_regs.bg3hofs
    stz.w snes_regs.bg3hofs
    stz.w snes_regs.bg3vofs
    stz.w snes_regs.bg3vofs
    rts

;-----

irq:
    rep #0x38
    pha
    phx
    phy
    phd
    phb
    lda.w #0x0000
    tcd
    phk
    plb
    sep #0x30
    lda.w snes_regs.timeup
    ldx.w 0x0BA2
    bmi .8517

    jmp (.84BB,X)

.84BB: d16[.84C3, .84CB, .84FF, .8515]

.84C3:
    stz.w 0x0BA2
    stz.w 0x0BA0
    bra .8524

.84CB:
    lda.w snes_regs.timeup
    lda.b #0xA0
    sta.w snes_regs.htimel
    lda.w 0x00C4
    sta.w snes_regs.bg1vofs
    lda.w 0x00C5
    sta.w snes_regs.bg1vofs
    rep #0x20
    lda.w 0x1F2A
    sec
    sbc.w 0x1E50
    cmp.w #0xE0
    bcc .84F0

    lda.w #0xE8
.84F0:
    sta.w snes_regs.vtimel
    sep #0x20
    stz.w 0x0BA0
    lda.b #0x04
    sta.w 0x0BA2
    bra .8524

.84FF:
    lda.w snes_regs.timeup
    lda.w 0x1E50
    sta.w snes_regs.bg1vofs
    lda.w 0x1E51
    sta.w snes_regs.bg1vofs
    lda.b #0x02
    sta.w 0x0BA2
    bra .8524

.8515:
    bra .8524

.8517:
    lda.w 0x0BA5
    and.b #0x17
    sta.w snes_regs.tm
    stz.w 0x0BA0
    bra .8524

.8524:
    rep #0x30
    plb
    pld
    ply
    plx
    pla
    rti

;-----

_80852C:
    ldy.b #0x20
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x2C
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x5E
    jsl _828000.8011
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    lda.b #0x17
    sta.b 0xC0
    jsr _808A2E
    jsr _808099.8100
    lda.w snes_regs.stat78
    bit.b #0x10
    beq .857B

    ldy.b #0x12
    jsl _828000.8011
    lda.b #0x15
    jsr _8089CA
    jsr _808099.8100
    lda.b #0x16
    jsr _8089CA
    jsr _80895C
    lda.b #0x78
    jsr _808099.810C
    jsr _80897E
.857B:
    lda.l 0x7EFFFF
    bne .8586

    lda.b #0x78
    jsr _808099.810C
.8586:
    lda.l 0x7EFFFF
    bne .85AB

    jsr _8086AF
    lda.b #0x01
    sta.l 0x7EFFFF
    ldy.b #0xF9
    jsr _8086AF
    lda.b #0x02
    ldy.b #0xF9
    jsr _8086AF
    lda.b #0xFF
    sta.l 0x7EFFFC
    sta.l 0x7EFFFD
.85AB:
    jsr _808850.8862
    lda.b #0x1E
    jsr _808099.810C
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808A2E
    lda.b #0x05
    jsr _8089CA
    ldx.b #0x1F
    ldy.b #0x00
.85C9:
    lda.l 0x80FFC0,X
    cmp.l 0x7EFFA0,X
    sta.l 0x7EFFA0,X
    beq .85D8

    iny
.85D8:
    dex
    bpl .85C9

    dey
    bmi .85F0

    ldx.b #0x16
.85E0:
    lda.l 0x86EE23,X
    sta.l 0x7EFFC0,X
    dex
    bpl .85E0

    lda.b #0x1E
    jsr _808099.810C
.85F0:
    lda.l 0x7EFFCA
    jsr _808850.8874
    jsr _808099.8100
    lda.b #0x10
    jsr _808799
    ldy.b #0xFF
    jsr _808850.8856
    lda.b #0x1E
    jsr _808099.810C
    lda.b #0x0F
    sta.b 0xB3
    lda.b #0xBF
    sta.b 0xCA
    ldy.b #0x20
.8613:
    dey
    beq .862B

    tya
    ora.b #0xE0
    sta.b 0xCB
    sta.b 0xCC
    sta.b 0xCD
    lda.b #0x02
    jsr _808099.810C
    jsr _808695
    bne .862D

    bra .8613

.862B:
    stz.b 0xCA
.862D:
    lda.b #0x1C
    jsr _808099.810C
    ldy.b #0x05
.8634:
    phy
    lda 0x868075,Y
    sta.b 0x00
    and.b #0xF0
    tax
    ldy.b #0x00
.863F:
    lda.w 0x0300,X
    sta 0x0340,Y
    inx
    iny
    cpy.b #0x20
    bcc .863F

    sty.b 0xA1
    lda.b 0x00
    and.b #0x0F
    jsr _808099.810C
    jsr _808695
    bne .867E

    ply
    dey
    bpl .8634

    lda.b #0x32
    jsr _808099.810C
    lda.b #0xBF
    sta.b 0xCA
    ldy.b #0xFF
.8668:
    iny
    cpy.b #0x1F
    beq .867E

    tya
    ora.b #0xE0
    sta.b 0xCB
    sta.b 0xCC
    sta.b 0xCD
    jsr _808099.8100
    jsr _808695
    beq .8668

.867E:
    lda.b #0x80
    sta.b 0xB3
    jsr _808099.8100
    stz.b 0xCA
    lda.b #0xE0
    sta.b 0xCB
    sta.b 0xCC
    sta.b 0xCD
    stz.w 0x1F7A
    jmp 0x808C37

;-----

_808695:
    lda.w 0x1F7A
    bne .86AE

    lda.w 0x00A7
    ora.w 0x00A8
    and.b #0xF0
    beq .86AE

    sta.w 0x1F7A
    jsr _808850.8862
    stz.b 0xC0
    lda.b #0x01
.86AE:
    rts

;-----

_8086AF:
    sty.b 0x02
    rep #0x30
    and.w #0xFF
    sta.b 0x00
    asl
    adc.b 0x00
    tax
    lda.l 0x898000,X
    and.w #0x7FFF
    tay
    lda.w #0x8000
    sta.b 0x10
    sep #0x20
    lda.l 0x898002,X
    clc
    adc.b #0x89
    sta.b 0x12
    txa
    beq .86F4

    ldx.w #0x1F
.86DA:
    stz.w 0x0B72,X
    dex
    bpl .86DA

    stz.w 0x0BA3
    stz.w 0x0BA4
    lda.l 0x7EFFFE
.86EA:
    cmp.w snes_regs.apui02
    bne .86EA

.86EF:
    lda.b 0x02
    sta.w snes_regs.apui00
.86F4:
    rep #0x20
    lda.w #0xBBAA
    cmp.w snes_regs.apui00
    sep #0x20
    bne .86EF

    lda.b #0xCC
    bra .8738

.8704:
    lda [0x10],Y
    iny
    bpl .870E

    ldy.w #0x0000
    inc.b 0x12
.870E:
    xba
    lda.b #0x00
    bra .8725

.8713:
    xba
    lda [0x10],Y
    iny
    bpl .871E

    ldy.w #0x0000
    inc.b 0x12
.871E:
    xba
.871F:
    cmp.w snes_regs.apui00
    bne .871F

    inc
.8725:
    rep #0x20
    sta.w snes_regs.apui00
    sep #0x20
    dex
    bne .8713

.872F:
    cmp.w snes_regs.apui00
    bne .872F

.8734:
    adc.b #0x03
    beq .8734

.8738:
    pha
    lda [0x10],Y
    xba
    iny
    bpl .8744

    ldy.w #0x0000
    inc.b 0x12
.8744:
    lda [0x10],Y
    xba
    tax
    iny
    bpl .8750

    ldy.w #0x0000
    inc.b 0x12
.8750:
    lda [0x10],Y
    xba
    iny
    bpl .875B

    ldy.w #0x0000
    inc.b 0x12
.875B:
    lda [0x10],Y
    sta.w snes_regs.apui03
    iny
    bpl .8768

    ldy.w #0x0000
    inc.b 0x12
.8768:
    xba
    sta.w snes_regs.apui02
    cpx.w #0x0001
    lda.b #0x00
    rol
    sta.w snes_regs.apui01
    adc.b #0x7F
    pla
    sta.w snes_regs.apui00
.877B:
    cmp.w snes_regs.apui00
    bne .877B

    bvs .8704

    sep #0x30
    lda.b #0x01
    sta.l 0x7EFFFE
    rts

;-----

_80878B:
    php
    rep #0x20
    phd
    pea 0x0000
    pld
    jsr _808799
    pld
    plp
    rtl

;-----

_808799:
    sep #0x30
    tay
    lda 0x86806B,Y
    tay
    lda 0x86807B,Y
    beq .87B3

    pha
    jsr _8087BF
    pla
.87AA:
    sta.l 0x7EFFFD
    ldy.b #0xFA
    jmp _8086AF

.87B3:
    txa
    cmp.l 0x7EFFFD
    bne .87AA

    lda.b #0xFB
    jmp 0x808874

;-----

_8087BF:
    lda 0x86807C,Y
    cmp.b #0xFF
    beq .87D0

    phy
    ldy.b #0xF9
    jsr _8086AF
    ply
    iny
    bra _8087BF

.87D0:
    rts

;-----

_8087D1:
    php
    rep #0x20
    phd
    pea 0x0000
    pld
    sty.b 0x04
    jsr _8087E1
    pld
    plp
    rtl

;-----

_8087E1:
    sep #0x30
    tay
    lda 0x86806B,Y
    tay
    lda 0x86807B,Y
    beq .87FD

    pha
    jsr _8087BF
    pla
.87F2:
    sta.l 0x7EFFFD
    ldy.b 0x04
    lda.b #0xF5
    jmp 0x808878

.87FD:
    txa
    cmp.l 0x7EFFFD
    bne .87F2

    ldy.b 0x04
    lda.b #0xF5
    jmp 0x808878

;-----

_80880B:
    sep #0x30
    ldx.w 0x0BA4
    cpx.w 0x0BA3
    beq .884F

    lda.w snes_regs.apui02
    cmp.l 0x7EFFFE
    bne .884F

    inc
    sta.l 0x7EFFFE
    ldy.w 0x0B73,X
    sty.w snes_regs.apui01
    lda.w 0x0B72,X
    cmp.b #0xF0
    bcc .8844

    cmp.b #0xFE
    bcc .883E

    stz.w snes_regs.apui02
    ldy.b #0x02
    sty.w snes_regs.apui03
    bra .8844

.883E:
    stz.w snes_regs.apui02
    sty.w snes_regs.apui03
.8844:
    sta.w snes_regs.apui00
    inx
    inx
    txa
    and.b #0x1E
    sta.w 0x0BA4
.884F:
    rts

;-----

_808850:
    sep #0x30
    lda.b #0xFF
    bra .8878

.8856:
    sep #0x30
    lda.b #0xFE
    bra .8878

.885C:
    sep #0x30
    lda.b #0xF6
    bra .8878

.8862:
    sep #0x30
    lda.b #0xF0
    bra .8878

.8868:
    phx
    phy
    php
    sep #0x30
    jsr .8878
    plp
    ply
    plx
    rtl

.8874:
    sep #0x30
    ldy.b #0x00
.8878:
    ldx.w 0x0BA3
    sta.w 0x0B72,X
    tya
    sta.w 0x0B73,X
    inx
    inx
    txa
    and.b #0x1E
    sta.w 0x0BA3
    rts

;-----

_80888B:
    phx
    phy
    php
    rep #0x20
    sep #0x10
    pha
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bpl .88A9

    lsr
    ora.w #0x8000
    cmp.w #0xFF81
    bpl .88B2

    lda.w #0xFF81
    bra .88B2

.88A9:
    lsr
    cmp.w #0x007F
    bmi .88B2

    lda.w #0x7F
.88B2:
    tay
    pla
    bra .88BD

.88B6:
    phx
    phy
    php
    sep #0x10
    ldy.b #0x00
.88BD:
    sep #0x31
    ldx.w 0x0BA3
    sta.w 0x0B72,X
    tya
    sta.w 0x0B73,X
    inx
    inx
    txa
    and.b #0x1E
    sta.w 0x0BA3
    plp
    ply
    plx
    rtl

;-----

_8088D5:
    rep #0x20
    stz.b 0xB4
    stz.b 0xB6
    stz.b 0xB8
    stz.b 0xBA
    stz.b 0xBC
    stz.b 0xBE
    sep #0x30
    lda.b #0x09
    sta.w snes_regs.bgmode
    lda.b #0x51
    sta.w snes_regs.bg1sc
    lda.b #0x59
    sta.w snes_regs.bg2sc
    lda.b #0x0A
    sta.w snes_regs.bg3sc
    lda.b #0x11
    sta.w snes_regs.bg12nba
    lda.b #0x00
    sta.w snes_regs.bg34nba
    rts

;-----

_808904:
    lda.b #0x09
    sta.w snes_regs.bgmode
    sta.w 0x00D0
    stz.w snes_regs.mosaic
    rep #0x20
    stz.b 0xB4
    stz.b 0xB6
    stz.b 0xB8
    stz.b 0xBA
    stz.b 0xBC
    stz.b 0xBE
    sep #0x20
    stz.w snes_regs.w12sel
    stz.w 0x00C6
    stz.w snes_regs.w34sel
    stz.w 0x00C7
    stz.b 0xC1
    stz.w snes_regs.tmw
    stz.w 0x00CE
    stz.w snes_regs.tsw
    stz.w 0x00CF
    stz.w 0x00C9
    stz.w 0x00CA
    lda.b #0xE0
    sta.w snes_regs.coldata
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    lda.b #0x17
    sta.w snes_regs.tm
    sta.w 0x00C0
    stz.w snes_regs.ts
    stz.w 0x00C1
    rts

;-----

_80895C:
    sep #0x10
    ldx.b #0x02
    ldy.b #0x01
.8962:
    sep #0x30
    lda.b 0xB3
    cmp.b #0x0F
    beq .897D

    tya
    adc.b 0xB3
    and.b #0x7F
    cmp.b #0x0F
    bcc .8975

    lda.b #0x0F
.8975:
    sta.b 0xB3
    txa
    jsr _808099.810C
    bra .8962

.897D:
    rts

;-----

_80897E:
    sep #0x10
    ldx.b #0x02
    ldy.b #0x01
.8984:
    sep #0x30
    lda.b 0xB3
    and.b #0x0F
    beq .899F

    sty.b 0x00
    lda.b 0xB3
    sec
    sbc.b 0x00
    bpl .8997

    lda.b #0x00
.8997:
    sta.b 0xB3
    txa
    jsr _808099.810C
    bra .8984

.899F:
    lda.b #0x80
    sta.b 0xB3
    jmp _808099.8100

;-----

_8089A6:
    sep #0x30
    ldx.b #0x40
    lda.b #0x89
    xba
    lda.b #0xB2
    jmp _80813B

;-----

_8089B2:
    jsr _80895C
    jmp _808099.80F8

;-----

_8089B8:
    sep #0x30
    ldx.b #0x40
    lda.b #0x89
    xba
    lda.b #0xC4
    jmp _80813B

;-----

_8089C4:
    jsr _80897E
    jmp _808099.80F8

;-----

_8089CA:
    sep #0x30
    sta.b 0x02
    and.b #0x7F
    asl
    tay
    lda 0x86910B,Y
    sta.b 0x10
    lda 0x86910C,Y
    sta.b 0x11
    ldx.b 0xA4
    ldy.b #0x00
.89E0:
    lda (0x10),Y
    beq .8A2B

    sta.b 0x00
    asl
    sta.w 0x0603,X
    iny
    lda (0x10),Y
    sta.b 0x01
    iny
    lda.b #0x80
    sta.w 0x0600,X
    inx
    lda (0x10),Y
    sta.w 0x0600,X
    iny
    inx
    lda (0x10),Y
    sta.w 0x0600,X
    iny
    inx
    inx
    lda.b 0x02
    bmi .8A1C

.8A09:
    lda (0x10),Y
    sta.w 0x0600,X
    iny
    inx
    lda.b 0x01
    sta.w 0x0600,X
    inx
    dec.b 0x00
    bne .8A09

    bra .89E0

.8A1C:
    stz.w 0x0600,X
    iny
    inx
    stz.w 0x0600,X
    inx
    dec.b 0x00
    bne .8A1C

    bra .89E0

.8A2B:
    stx.b 0xA4
    rts

;-----

_808A2E:
    jsr _808A38
    lda.b #0x07
    tsb.b 0xA2
    jmp _808099.8100

;-----

_808A38:
    ldx.b #0x00
    lda.b #0xE0
.8A3C:
    sta.w ram.oam.low+0x001,X
    sta.w ram.oam.low+0x101,X
    dex
    dex
    dex
    dex
    bne .8A3C

    ldx.b #0x1F
.8A4A:
    stz.w ram.oam.high,X
    dex
    bpl .8A4A

    stz.b 0xE4
    stz.b 0xE5
    rts

;-----

_808A55:
    lda.b #0x01
    tsb.b 0xA2
    rts

;-----

_808A5A:
    lda.b #0x02
    tsb.b 0xA2
    rts

;-----

_808A5F:
    lda.b #0x04
    tsb.b 0xA2
    rts

;-----

_808A64:
    rep #0x20
    phd
    lda.w #0x0000
    tcd
    jsr _808A70
    pld
    rtl

;-----

_808A70:
    rep #0x20
    lda 0x8698D1,Y
    sta.b 0x10
    ldy.b #0x00
    ldx.b 0xA3
.8A7B:
    rep #0x21
    lda (0x10),Y
    bit.w #0x0001
    bne .8ACE

    jsr _808AD3
    lda.b 0x00
    sta.w 0x0503,X
    lda.b 0x14
    sta.w 0x0501,X
    lda.b 0x18
    sta.w 0x0505,X
    sep #0x20
    lda.b 0x1A
    sta.w 0x0507,X
    lda.b #0x80
    sta.w 0x0500,X
    bcc .8AC8

    clc
    txa
    adc.b #0x08
    tax
    rep #0x21
    lda.b 0x02
    sta.w 0x0503,X
    lda.b 0x1C
    sta.w 0x0501,X
    lda.w #0x8000
    sta.w 0x0505,X
    sep #0x20
    lda.b 0x1A
    inc
    sta.w 0x0507,X
    lda.b #0x80
    sta.w 0x0500,X
.8AC8:
    txa
    adc.b #0x08
    tax
    bcc .8A7B

.8ACE:
    sep #0x30
    stx.b 0xA3
    rts

;-----

_808AD3:
    sta.b 0x00
    iny
    iny
    lda (0x10),Y
    sta.b 0x14
    iny
    iny
    lda (0x10),Y
    sta.b 0x18
    iny
    iny
    lda (0x10),Y
    sta.b 0x1A
    iny
    lda.b 0x18
    adc.b 0x00
    bcc .8B00

    beq .8B00

    sta.b 0x02
    eor.w #0xFFFF
    adc.b 0x00
    sta.b 0x00
    lsr
    adc.b 0x14
    sta.b 0x1C
    sec
    rts

.8B00:
    clc
    rts

;-----

_808B02:
    lda.w 0x00C3
.8B05:
    bne .8B05

    lda 0x8698D1,Y
    sta.b 0x10
    lda 0x8698D2,Y
    sta.b 0x11
    lda.b #0x80
    sta.w snes_regs.vmain
    lda.b #0x01
    sta.w snes_regs.dmap0
    lda.b #0x18
    sta.w snes_regs.bbad0
    ldy.b #0x00
.8B22:
    rep #0x21
    lda (0x10),Y
    bit.w #0x0001
    bne .8B6C

    jsr _808AD3
    lda.b 0x00
    sta.w snes_regs.das0l
    lda.b 0x14
    sta.w snes_regs.vmaddl
    lda.b 0x18
    sta.w snes_regs.a1t0l
    sep #0x20
    lda.b 0x1A
    sta.w snes_regs.a1b0
    lda.b #0x01
    sta.w snes_regs.mdmaen
    bcc .8B22

    rep #0x21
    lda.b 0x02
    sta.w snes_regs.das0l
    lda.b 0x1C
    sta.w snes_regs.vmaddl
    lda.w #0x8000
    sta.w snes_regs.a1t0l
    sep #0x20
    lda.b 0x1A
    inc
    sta.w snes_regs.a1b0
    lda.b #0x01
    sta.w snes_regs.mdmaen
    bra .8B22

.8B6C:
    sep #0x30
    rts

;-----

_808B6F:
    phd
    pea 0x0000
    pld
    jsr _808B79
    pld
    rtl

;-----

_808B79:
    lda.b #0x80
    sta.w snes_regs.vmain
    stz.w snes_regs.vmaddl
    lda.w 0x86812F,X
    sta.w snes_regs.vmaddh
    lda.b #0x00
.8B89:
    pha
    sta.b 0x02
    ldy.b #0x02
.8B8E:
    lda.b #0x00
    lsr.b 0x02
    bcc .8B95

    dec
.8B95:
    xba
    lda.b #0x00
    lsr.b 0x02
    bcc .8B9D

    dec
.8B9D:
    xba
    ldx.b #0x07
    rep #0x20
.8BA2:
    sta.w snes_regs.vmdatal
    dex
    bpl .8BA2

    sep #0x20
    dey
    bne .8B8E

    pla
    inc
    cmp.b #0x10
    bcc .8B89

    rts

;-----

_808BB4:
    stz.w 0x0AA1
    stz.w 0x0AA8
    stz.w 0x0AAF
    stz.w 0x0AB6
    stz.w 0x0ABD
    stz.w 0x0AC4
    stz.w 0x0ACB
    stz.w snes_regs.hdmaen
    rts

;-----

_808BCD:
    phd
    pea 0x0000
    pld
    rep #0x20
    lda 0x869AC0,Y
    sta.b 0x10
    ldy.b #0x00
    lda (0x10),Y
    sta.b 0x14
    iny
    iny
    lda (0x10),Y
    sta.b 0x18
    iny
    iny
    lda (0x10),Y
    sta.b 0x1C
    sep #0x20
    iny
    iny
    lda (0x10),Y
    sta.b 0x1E
    ldx.b 0xA3
    ldy.b 0x15
    stz.b 0x15
    asl.b 0x14
.8BFB:
    rep #0x20
    lda.b 0x14
    sta.w 0x0503,X
    lda.b 0x18
    sta.w 0x0501,X
    lda.b 0x1C
    sta.w 0x0505,X
    sep #0x20
    lda.b #0x80
    sta.w 0x0500,X
    lda.b 0x1E
    sta.w 0x0507,X
    txa
    clc
    adc.b #0x08
    tax
    rep #0x20
    lda.b 0x18
    clc
    adc.w #0x20
    sta.b 0x18
    lda.b 0x14
    clc
    adc.b 0x1C
    sta.b 0x1C
    dey
    bne .8BFB

    stx.b 0xA3
    sep #0x20
    pld
    rtl

;-----

_808C37:
    stz.b 0x38
    stz.b 0x39
    stz.b 0x3A
    stz.b 0x3C
.8C3F:
    ldx.b 0x38
    jsr (.8C49,X)
    jsr _808099.8100
    bra .8C3F

.8C49: d16[.8C4D, .9193]

.8C4D:
    ldx.b 0x39
    jsr (.8C6E,X)
    ldx.b 0x39
    beq .8C6D

    lda.b 0xAC
    bit.b #0x10
    beq .8C6D

    lda.b #0xF1
    jsr _808850.8874
    lda.b #0x02
    sta.b 0x38
    stz.b 0x39
    stz.b 0x3A
    stz.b 0x3B
    stz.b 0x3C
.8C6D:
    rts

.8C6E: d16[.8C76, .8C97, .8C9A, .905D]

.8C76:
    lda.b #0x02
    sta.b 0x39
    stz.w 0x0BA1
    stz.b 0xC3
    stz.b 0xC3
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jmp _808A2E

.8C97:
    jmp 0x80A637

.8C9A:
    ldx.b 0x3A
    jsr (.8CB2,X)
    phb
    rep #0x30
    ldx.w #0xD000
    ldy.w #0xD200
    lda.w #0x01BF
    mvn 0x7F,0x7F
    sep #0x30
    plb
    rts

.8CB2: d16[
    .8CCA, .8D7E, .8ED8, .8F28,
    .8F63, .8F7A, .8F95, .8FAD,
    .8FD1, .8FEC, .8FEC, .8FED,
]

.8CCA:
    lda.b #0x02
    sta.b 0x3A
    lda.b #0x01
    sta.w snes_regs.bgmode
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    jsr _808099.8100
    rep #0x20
    lda.w #0x05A0
    sta.b 0xD7
    lda.w #0xFF80
    sta.b 0xB4
    sta.b 0xB8
    lda.w #0x30
    sta.b 0xB6
    sta.b 0xBA
    sep #0x20
    ldy.b #0x20
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x46
    jsr _80B2FF
    ldy.b #0xCC
    jsl _828000.8011
    jsr _808099.8100
    jsr _809346
    jsr _808A5A
    jsr _808099.8100
    jsr _809379
    ldy.b #0x0A
    jsr _808A70
    ldy.b #0xC4
    jsl _828000.8011
    lda.b #0x1F
    sta.b 0xE1
    ldx.b #0x40
    jsr _8093A1
    ldx.b #0x20
    ldy.b #0xC4
    jsl _828000
    lda.b #0x1F
    sta.b 0xE1
    ldx.b #0x80
    jsr _8093A1
    lda.b #0x03
    sta.b 0xC0
    lda.b #0x02
    sta.b 0xC1
    jsr _808099.8100
    stz.b 0xCB
    stz.b 0xCC
    stz.b 0xCD
    lda.b #0x02
    sta.l 0xC9
    lda.b #0x43
    sta.b 0xCA
    lda.b #0x01
    sta.w 0x0BB8
    lda.b #0x14
    sta.w 0x0E78
    stz.w 0x0BB7
    lda.b #0x04
    sta.w 0x0E77
    stz.w 0x0302
    stz.w 0x0303
    inc.w 0x00A1
    lda.b #0x1F
    jsr _808799
    jmp _80895C

.8D7E:
    rep #0x20
    dec.b 0xD7
    ldx.b #0x00
    lda.b 0xD7
    cmp.w #0x0588
    bcs .8DA9

    inx
    cmp.w #0x056B
    bcs .8DA9

    inx
    cmp.w #0x054C
    bcs .8DA9

    inx
    cmp.w #0x0531
    bcs .8DA9

    inx
    cmp.w #0x0530
    bne .8DA9

    inc.w 0x0BB9
    inc.w 0x0E79
.8DA9:
    stx.w 0x0BA8
    sep #0x20
    pea 0x0BA8
    pld
    jsr .8DD1
    pea 0x0E68
    pld
    jsr .8DD1
    pea 0x0000
    pld
    lda.b #0x0A
    cmp.w 0x0BA9
    bne .8DD0

    cmp.w 0x0E69
    bne .8DD0

    lda.b #0x04
    sta.b 0x3A
.8DD0:
    rts

.8DD1:
    ldx.b 0x01
    jmp (.8DD6,X)

.8DD6: d16[.8DE2, .8E26, .8E35, .8EA2, .8EC0, .8EBF]

.8DE2:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x1F
    sta.b 0x03
    jsr _8093FF
    rep #0x20
    stz.b 0x04
    stz.b 0x07
    ldx.b 0x0F
    lda.w #0xFF80
    sta.b 0x05
    sta.w 0x00B4,X
    lda.w #0x0030
    sta.b 0x08
    sta.w 0x00B6,X
    lda.w 0x0BA8
    asl
    tay
    asl
    tax
    lda.w 0x86887C,X
    sta.b 0x1A
    lda.w 0x86887E,X
    sta.b 0x1C
    lda 0x868890,Y
    sta.b 0x1E
    sep #0x20
    ldx.w 0x0BA8
    lda.w 0x86889A,X
    sta.b 0x02
    rts

.8E26:
    dec.b 0x10
    bne .8E34

    lda.b #0x04
    sta.b 0x01
    dec.b 0x03
    lda.b #0x01
    sta.b 0x10
.8E34:
    rts

.8E35:
    dec.b 0x10
    bne .8E4B

    lda.b #0x01
    sta.b 0x10
    lda.b 0x03
    sec
    sbc.b 0x02
    bpl .8E46

    lda.b #0x00
.8E46:
    sta.b 0x03
    jsr _8093FF
.8E4B:
    rep #0x21
    lda.w #0xFFFF
    sta.w 0x0000
    lda.b 0x1C
    adc.b 0x1E
    bmi .8E5F

    stz.w 0x0000
    lda.w #0x0000
.8E5F:
    sta.b 0x1C
    lda.b 0x07
    clc
    adc.b 0x1C
    sta.b 0x07
    sep #0x20
    lda.b 0x09
    adc.w 0x0000
    sta.b 0x09
    rep #0x21
    lda.b 0x04
    adc.b 0x1A
    sta.b 0x04
    sep #0x20
    lda.b 0x06
    adc.b #0x00
    sta.b 0x06
    rep #0x20
    ldx.b 0x0F
    lda.b 0x08
    sta.w 0x00B6,X
    lda.b 0x05
    bmi .8E9C

    ldy.b #0x06
    sty.b 0x01
    stz.b 0x05
    stz.b 0x08
    stz.w 0x00B6,X
    lda.w #0x0000
.8E9C:
    sta.w 0x00B4,X
    sep #0x20
    rts

.8EA2:
    dec.b 0x10
    bne .8E4B

    lda.b #0x01
    sta.b 0x10
    lda.b 0x03
    sec
    sbc.b 0x02
    bpl .8EBD

    lda.b #0x08
    ldx.b 0x11
    beq .8EB9

    lda.b #0x0A
.8EB9:
    sta.b 0x01
    lda.b #0x00
.8EBD:
    sta.b 0x03
.8EBF:
    rts

.8EC0:
    lda.b 0x03
    clc
    adc.b #0x02
    sta.b 0x03
    lda.b 0x03
    cmp.b #0x1F
    bcc .8ED5

    ldx.b #0x01
    stx.b 0x10
    ldx.b #0x00
    stx.b 0x01
.8ED5:
    jmp 0x8093FF

.8ED8:
    lda.b #0x06
    sta.b 0x3A
    lda.b #0x03
    sta.b 0xC0
    stz.b 0xC1
    stz.w 0x00C9
    stz.w 0x00CA
    ldy.b #0x2E
    jsl _828000.8011
    phb
    rep #0x30
    lda.w #0x0100
    sta.b 0xB8
    stz.b 0xBA
    lda.w #0x0002
    sta.w 0x0BAF
    sta.w 0x0BAC
    ldx.w #0x889F
    ldy.w #0x0AA1
    lda.w #0x0006
    mvn 0x00, 0x86
    ldx.w #0x88A6
    ldy.w #0x0B22
    lda.w #0x0009
    mvn 0x00, 0x86
    sep #0x30
    plb
    lda.b #0x01
    sta.b 0xD7
    jsr _809445
    ldy.b #0x12
    jmp _808A70

.8F28:
    dec.b 0xD7
    bne .8F5F

    lda.b #0x01
    sta.b 0xD7
    rep #0x20
    inc.w 0x0BAF
    inc.w 0x0BAF
    inc.w 0x0BAF
    inc.w 0x0BAF
    lda.w #0x01C0
    cmp.w 0x0BAF
    bcs .8F49

    sta.w 0x0BAF
.8F49:
    inc.w 0x0BAC
    inc.w 0x0BAC
    lda.w #0x01C0
    cmp.w 0x0BAC
    sep #0x20
    bcs .8F60

    lda.b #0x08
    sta.b 0x3A
    stz.b 0xB9
.8F5F:
    rts

.8F60:
    jmp 0x809445

.8F63:
    lda.b #0x0A
    sta.b 0x3A
    rep #0x20
    lda.w #0xA0
    sta.w 0x0BAC
    lda.w #0x70
    sta.w 0x0BAF
    sep #0x20
    jmp 0x809472

.8F7A:
    rep #0x21
    lda.w 0x0BAC
    adc.w #0xFFF8
    sta.w 0x0BAC
    sep #0x20
    bpl .8F92

    lda.b #0x0C
    sta.b 0x3A
    lda.b #0x2D
    jmp 0x808874

.8F92:
    jmp 0x809472

.8F95:
    lda.b #0x0E
    sta.b 0x3A
    lda.b #0x03
    sta.b 0xC0
    lda.b #0xE0
    sta.w snes_regs.coldata
    sta.b 0xD9
    stz.w 0x00C9
    lda.b #0x27
    sta.w 0x00CA
    rts

.8FAD:
    lda.b 0xD9
    inc
    ora.b #0xE0
    sta.b 0xD9
    cmp.b #0xFF
    bne .8FCB

    lda.b #0x10
    sta.b 0x3A
    lda.b #0x07
    sta.b 0xC0
    ldy.b #0x12
    jsl _828000.8011
    lda.b #0x01
    jsr _8089CA
.8FCB:
    lda.b 0xD9
    sta.w snes_regs.coldata
    rts

.8FD1:
    lda.b 0xD9
    dec
    sta.b 0xD9
    cmp.b #0xE0
    bne .8FE6

    lda.b #0x16
    sta.b 0x3A
    lda.b #0x38
    sta.b 0xD7
    lda.b #0x04
    sta.b 0xD8
.8FE6:
    lda.b 0xD9
    sta.w snes_regs.coldata
    rts

.8FEC:
    rts

.8FED:
    rep #0x20
    dec.b 0xD7
    sep #0x20
    bne .905C

    lda.b #0x06
    sta.b 0x39
    stz.b 0x3A
    jsr _808850.8862
    jsr _80897E
    lda.l 0x7EFFC6
    phb
    rep #0x30
    lda.l 0x7EFFC7
    lda.w #0x0000
    and.w #0xFF
    asl
    tax
    lda.l 0x868878,X
    pha
    lda.l 0x86887A,X
    plx
    ldy.w #0x8406
    mvn 0x7F, 0x8C
    plb
    sep #0x30
    lda.l 0x7EFFC7
    inc
    cmp.b #0x02
    bcc .9032

    lda.b #0x00
.9032:
    sta.l 0x7EFFC7
    bra .904A

    rep #0x30
    phb
    ldx.w #0x0006
    ldy.w #0x8406
    lda.w #0x1C33
    mvn 0x7F, 0x70
    plb
    sep #0x30
.904A:
    lda.l 0x7F840B
    sta.w 0x1F7A
    lda.w 0x1F7A
    asl
    clc
    adc.b #0x04
    tay
    jsr _80B2FF
.905C:
    rts

.905D:
    ldx.b 0x3A
    bne .9090

    lda.b #0x02
    sta.b 0x3A
    stz.w 0x1F99
    lda.b #0x0A
    sta.w 0x1F9A
    lda.b #0x00
    sta.l 0x7F8400
    lda.l 0x7F840C
    sta.w 0x1F81
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jmp _808A2E

.9090:
    ldx.b 0x3B
    jmp (.9095,X)

.9095: d16[.909B, .90EB, .9165]

.909B:
    ldx.b 0x3C
    bne .90C4

    inc.b 0x3C
    lda.w 0x1F82
    bne .90A9

    jsr _80DB6E
.90A9:
    jsr _809D9D
    rep #0x20
    lda.w 0x1E50
    sta.b 0xD7
    sec
    sbc.w #0x0100
    sta.w 0x1E50
    sec
    sbc.w #0x20
    sta.w 0x1E6C
    sep #0x20
    rts

.90C4:
    rep #0x21
    lda.w 0x1E50
    adc.w #0x20
    sta.w 0x1E50
    cmp.b 0xD7
    beq .90D5

    bpl .90DA

.90D5:
    sep #0x20
    jmp 0x80DC4A

.90DA:
    lda.b 0xD7
    sta.w 0x1E50
    sta.w 0x1E6C
    sep #0x20
    lda.b #0x02
    sta.b 0x3B
    jmp _8089A6

.90EB:
    lda.b #0x01
    sta.w 0x1E08
.90F0:
    inc.w 0x0B9C
    jsr _80E2D0
    lda.w 0x1F24
    bne .9143

    jsl get_rng
    jsr _80D201
    jsr _80DC4A
    jsr _809E67
    bra .910F

    lda.w 0x1E08
    bne .9112

.910F:
    jsr _80D583
.9112:
    lda.l 0x7F8400
    cmp.b #0x04
    beq .9124

    lda.w 0x1F23
    bmi .917E

    lda.w 0x0BCF
    bne .9132

.9124:
    lda.b #0x04
    sta.b 0x3B
    stz.w 0x0BDE
    stz.w 0x0BE0
    stz.w 0x0BE2
.9131:
    rts

.9132:
    bra .9131

    rep #0x20
    stz.b 0xE4
    stz.b 0xE6
    stz.b 0xE8
    stz.b 0xEA
    sep #0x20
    bra .90F0

    rts

.9143:
    bpl .9162

    jsr _809ECB
    bit.w 0x1F24
    bvc .9155

    lda.b #0x01
    sta.w 0x0BB6
    jsr _809F0E
.9155:
    jsr _80D583
    stz.w 0x1F24
    ldx.b #0x01
    ldy.b #0x02
    jmp 0x808962

.9162:
    jmp 0x80C438

.9165:
    inc.w 0x0B9C
    jsr _80D201
    jsr _80DC4A
    jsr _80D583
    lda.l 0x7F8400
    cmp.b #0x04
    beq .917E

    lda.w 0x1F0B
    beq .9131

.917E:
    stz.b 0x39
    stz.b 0x3A
    stz.b 0x3B
    stz.b 0x3C
    ldx.b #0x30
    jsr _808147
    ldx.b #0x40
    jsr _808147
    jmp _80897E

.9193:
    ldx.b 0x39
    jmp (.9198,X)

.9198: d16[.919E, .925A, .92BD]

.919E:
    lda.b #0x02
    sta.b 0x39
    stz.b 0x3C
    lda.b #0x1E
    jsr _80814E
    jsr _80897E
    stz.w 0x0BA1
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    stz.w 0x1F99
    jsr _80B12B
    jsr _809431
    jsr _80941D
    ldx.b #0x10
    ldy.b #0x00
    jsl _828000
    ldy.b #0x12
    jsl _828000.8011
    ldx.b #0x30
    ldy.b #0x40
    jsl _828000
    ldy.b #0x20
    jsr _80B2FF
    jsr _808099.8100
    stz.w 0x0BA9
    lda.b #0x10
    tsb.w 0x0C26
    jsl _81812E
    stz.w 0x0BAA
    stz.w 0x0BAB
    lda.b #0x04
    sta.w 0x0BD3
    lda.b #0x1E
    sta.w 0x0BCF
    jsl _81812E
    lda.b #0x40
    sta.w 0x0C11
    ora.b #0x32
    sta.w 0x0BB9
    stz.w 0x0BD7
    rep #0x20
    lda.w #0x0020
    sta.w 0x0BAD
    lda.w #0x00A6
    sta.w 0x0BB0
    stz.w 0x0BDE
    stz.w 0x0BDF
    stz.w 0x1E4D
    stz.w 0x1E50
    sep #0x20
    lda.b #0x06
    sta.w 0x1F11
    lda.b #0x04
    sta.w 0x1F12
    jsr _80D583
    lda.b #0x04
    jsr _8089CA
    lda.b #0x10
    jsr _8089CA
    jsr _809346
    jsr _80895C
    lda.b #0xFF
    sta.b 0x3B
    rts

.925A:
    lda.b 0xAC
    bit.b #0x08
    beq .9269

    lda.b 0x3C
    dec
    bpl .9276

    lda.b #0x02
    bra .9276

.9269:
    bit.b #0x24
    beq .928B

    lda.b 0x3C
    inc
    cmp.b #0x03
    bne .9276

    lda.b #0x00
.9276:
    sta.b 0x3C
    tax
    lda.w 0x868875,X
    sta.w 0x0BB0
    lda.b 0x3C
    clc
    adc.b #0x10
    jsr _8089CA
    lda.b #0xF0
    sta.b 0x3B
.928B:
    lda.b 0xAC
    bit.b #0x10
    beq .929F

    lda.b #0x04
    sta.b 0x39
    lda.b #0x3C
    sta.b 0x3B
    lda.b #0x02
    sta.w 0x0C01
    rts

.929F:
    jsr _80D583
    jsl get_rng
    dec.b 0x3B
    beq .92AB

    rts

.92AB:
    stz.b 0x38
    stz.b 0x39
    stz.b 0x3A
    stz.b 0x3B
    stz.b 0x3C
    ldy.b #0x04
    jsr _808850.885C
    jmp _80897E

.92BD:
    lda.b #0x04
    sta.w 0x0BD3
    jsl _81812E
    php
    phd
    jsr _80D3F1
    jsr _80D44E
    pld
    plp
    jsr _80D583
    lda.b 0x3B
    beq .92E3

    dec.b 0x3B
    lda.w 0x00AC
    bit.b #0x10
    beq .92E2

    stz.b 0x3B
.92E2:
    rts

.92E3:
    ldx.b 0x3A
    bne .92EE

    bra .92E9

.92E9:
    inc.b 0x3A
    jmp _8089B8

.92EE:
    lda.b 0x70
    beq .92F3

    rts

.92F3:
    jsr _80936A
    ldy.b #0x02
    jsr _808850.885C
    lda.b 0x3C
    asl
    tax
    jmp (.9302,X)

.9302: d16[.9308, .9314, .9338]

.9308:
    stz.w 0x0BA9
    stz.w 0x0BAA
    stz.w 0x0BAB
    jmp 0x8094BA

.9314:
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    jsr _80EE81
    lda.b #0x02
    sta.b 0xD1
    stz.b 0xD2
    stz.b 0xD3
    jmp 0x94C2

.9338:
    jsr _80EA25
    stz.b 0x38
    stz.b 0x39
    stz.b 0x3A
    stz.b 0x3B
    stz.b 0x3C
    rts

;-----

_809346:
    ldy.b #0x12
    jsl _828000.8011
    ldy.b #0x2E
    jsl _828000.8011
    ldy.b #0x26
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x12
    jsr _808A70
    jsr _808099.8100
    ldy.b #0x28
    jsr _80B2FF
    jmp _808099.8100

;-----

_80936A:
    rep #0x30
    ldx.w #0x8E
.936F:
    stz.w 0x0BA8,X
    dex
    dex
    bpl .936F

    sep #0x30
    rts

;-----

_809379:
    rep #0x30
    ldx.w #0x07FE
.937E:
    lda.l 0x7F0000,X
    beq .939A

    sta.b 0x00
    and.w #0x1C00
    clc
    adc.w #0x0800
    sta.b 0x02
    lda.b 0x00
    and.w #0xE3FF
    ora.b 0x02
    sta.l 0x7F0000,X
.939A:
    dex
    dex
    bpl .937E

    sep #0x30
    rts

;-----

_8093A1:
    phd
    pea 0x0000
    pld
    rep #0x20
    lda.b 0xE1
    and.w #0xFF
    sta.b 0x00
    xba
    asl
    asl
    sta.b 0x04
    lsr
    lsr
    lsr
    lsr
    lsr
    sta.b 0x02
    ldy.b #0x20
.93BD:
    lda.w 0x0300,X
    and.w #0x1F
    sec
    sbc.b 0x00
    bpl .93CB

    lda.w #0x0000
.93CB:
    sta.b 0x06
    lda.w 0x0300,X
    and.w #0x03E0
    sec
    sbc.b 0x02
    bpl .93DB

    lda.w #0x0000
.93DB:
    sta.b 0x08
    lda.w 0x0300,X
    and.w #0x7C00
    sec
    sbc.b 0x04
    bpl .93EB

    lda.w #0x0000
.93EB:
    ora.b 0x08
    ora.b 0x06
    sta.w 0x0300,X
    inx
    inx
    dey
    dey
    bne .93BD

    sep #0x20
    inc.w 0x00A1
    pld
    rts

;-----

_8093FF:
    ldx.b #0x00
    lda.b 0x0F
    beq .9407

    ldx.b #0x20
.9407:
    ldy.b #0xC4
    jsl _828000
    ldx.b #0x40
    lda.b 0x0F
    beq .9415

    ldx.b #0x80
.9415:
    lda.b 0x03
    sta.w 0x00E1
    jmp _8093A1

;-----

_80941D:
    rep #0x30
    pea 0x867E
    plb
    ldx.w #0x85FE
.9426:
    stz.w 0x2000,X
    dex
    dex
    bpl .9426

    plb
    sep #0x30
    rts

;-----

_809431:
    rep #0x30
    pea 0x867E
    plb
    ldx.w #0x03FE
.943A:
    stz.w 0xE800,X
    dex
    dex
    bpl .943A

    plb
    sep #0x30
    rts

;-----

_809445:
    rep #0x30
    ldx.w #0x01BE
    lda.w #0xFF10
.944D:
    inc
    sta.l 0x7FD000,X
    dex
    dex
    cpx.w 0x0BAF
    bpl .944D

    lda.w 0x0BAC
    sec
    sbc.w 0x0BAF
    clc
    bpl .9464

    sec
.9464:
    ror
    dec
.9466:
    inc
    sta.l 0x7FD000,X
    dex
    dex
    bpl .9466

    sep #0x30
    rts

;-----

_809472:
    rep #0x30
    ldy.w 0x0BAC
    sty.b 0xDB
    ldx.w 0x0BAF
    lda.w #0x0001
.947F:
    dec
    sta.l 0x7FD000,X
    inx
    inx
    cpx.w #0x01C0
    bpl .9497

    dec.b 0xDB
    bpl .947F

    ldy.w 0x0BAC
    sty.b 0xDB
    inc
    bra .947F

.9497:
    ldy.w 0x0BAC
    sty.b 0xDB
    ldx.w 0x0BAF
    lda.w #0xFFFF
.94A2:
    inc
    sta.l 0x7FD000,X
    dex
    dex
    bmi .94B7

    dec.b 0xDB
    bpl .94A2

    ldy.w 0x0BAC
    sty.b 0xDB
    dec
    bra .94A2

.94B7:
    sep #0x30
    rts

;-----

_8094BA:
    stz.b 0xD1
    stz.b 0xD2
    stz.b 0xD3
    stz.b 0xD4
.94C2:
    ldx.b 0xD1
    jsr (.94CC,X)
    jsr _808099.8100
    bra .94C2

.94CC: d16[.94D0, .9528]

.94D0:
    stz.w 0x1F7A
    stz.w 0x1F7B
    stz.w 0x1F7C
    stz.w 0x1F7D
    stz.w 0x1F7E
    stz.w 0x1F7F
    lda.b #0x02
    sta.w 0x1F80
    lda.b #0x10
    sta.w 0x1F9A
    stz.w 0x1F99
    stz.w 0x1F9B
    stz.w 0x1F82
    stz.w 0x1F9C
    rep #0x20
    stz.w 0x1F83
    stz.w 0x1F85
    sep #0x20
    jsr _809EEA
    lda.b #0x40
    sta.w 0x1F98
    lda.b #0x02
    sta.b 0xD1
    stz.b 0xD2
    stz.b 0xD3
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jmp _808A2E

.9528:
    ldx.b 0xD2
    jmp (.952D,X)

.952D: d16[.9539, .9562, .995F, .9D51, .9D52, .9D53]

.9539:
    ldx.b 0xD3
    bne .955F

    inc.b 0xD3
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    lda.w 0x1F9B
    bne .955F

    stz.w 0x1F7A
    stz.w 0x1F99
    lda.b #0x02
    sta.b 0xD2
    stz.b 0xD3
    stz.b 0xD4
    rts

.955F:
    jmp 0x80BCCF

.9562:
    rep #0x20
    lda.w 0x1E50
    sta.w 0x1E6C
    lda.w 0x1E90
    sta.w 0x1EAC
    sep #0x20
    ldx.b 0xD3
    jmp (.9577,X)

.9577: d16[.958F, .970A, .9736, .9756, .9790, .97BF, .97F1, .9811, .9882, .98DB, .98EE, .9904]

.958F:
    stz.w 0x1FA0
    ldx.w 0x1F7A
    bne .959F

.9597:
    lda.b #0x16
    sta.b 0xD3
    sta.w 0x1FA0
    rts

.959F:
    lda.w 0x8688C0,X
    beq .9597

    cpx.b #0x09
    bcs .9597

    jsr _809FEA
    ldx.w 0x1F7A
    and.w 0x8688CD,X
    bne .9597

    lda.b #0x02
    sta.b 0xD3
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    ldy.b #0x12
    jsl _828000.8011
    stz.w 0x0300
    stz.w 0x0301
    inc.w 0x00A1
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    lda.b #0x01
    sta.w snes_regs.bgmode
    lda.b #0x10
    sta.b 0xC0
    lda.b #0x04
    sta.w 0x1F12
    sta.w 0x1F11
    jsr _80B12B
    jsr _808099.8100
    ldy.b #0xA2
    jsl _828000.8011
    lda.w 0x1F7A
    asl
    clc
    adc.b #0x2E
    tay
    jsr _80B2FF
    jsr _808099.8100
    lda.w 0x1F7A
    clc
    adc.b #0x0D
    sta.w 0x1F7A
    jsr _80BAD5
    lda.w 0x1F7A
    clc
    adc.b #0xF3
    sta.w 0x1F7A
    rep #0x20
    stz.w 0x1E4D
    stz.w 0x1E50
    stz.w 0x1E8D
    lda.w #0x0200
    sta.w 0x1E90
    sep #0x20
    inc.w 0x1E9A
    jsr _80B582
    jsr _80B582.B58B
    inc.w 0x1E48
    inc.w 0x1E88
    lda.b #0x04
    sta.w 0x1E49
    lda.b #0x0C
    sta.w 0x1E89
    lda.b #0x10
    sta.b 0xC1
    stz.w 0x00C9
    stz.w 0x00CA
    stz.w 0x00CB
    stz.w 0x00CC
    stz.w 0x00CD
    stz.w 0x1F08
    lda.w 0x1F7A
    clc
    adc.b #0x0D
    sta.w 0x1F7A
    jsr _80B085.local
.966A:
    jsr _808099.8100
    lda.w 0x0040
    bne .966A

    lda.w 0x1F7A
    clc
    adc.b #0xF3
    sta.w 0x1F7A
    jsr _80A002
    rep #0x10
    ldx.w #0x0050
    ldy.w #0x0154
    jsl _828000
    sep #0x10
    inc.w 0x1928
    inc.w 0x1948
    inc.w 0x1968
    inc.w 0x1988
    lda.b #0x10
    sta.w 0x1932
    sta.w 0x1952
    sta.w 0x1972
    sta.w 0x1992
    lda.b #0x30
    sta.w 0x1939
    sta.w 0x1959
    sta.w 0x1979
    sta.w 0x1999
    lda.b #0x04
    sta.w 0x1933
    sta.w 0x1973
    inc
    sta.w 0x1953
    ldx.w 0x1F7A
    lda.w 0x8688D6,X
    sta.w 0x1993
    lda.b #0x02
    sta.w 0x198A
    rep #0x20
    lda.w #0x0080
    sta.w 0x192D
    sta.w 0x194D
    sta.w 0x196D
    sta.w 0x198D
    lda.w #0x0070
    sta.w 0x1930
    sta.w 0x1950
    sta.w 0x1970
    sta.w 0x1990
    sep #0x20
    lda.b #0x22
    jsr _808799
    lda.b #0x58
    sta.b 0xD7
    stz.b 0xD9
    php
    phd
    jsr _80D359
    pld
    plp
    lda.b #0x40
    tsb.w 0x1979
    jmp _80895C

.970A:
    jsr _809F67
    ldx.b 0xD9
    lda.w 0x8688BD,X
    cmp.b 0xD7
    bne .971D

    inc.b 0xD9
    lda.b #0x1F
    jsr _808850.8874
.971D:
    dec.b 0xD7
    bne .9733

    lda.b #0x04
    sta.b 0xD3
    lda.b #0x1F
    jsr _808850.8874
    lda.b #0xE0
    sta.b 0xD7
    lda.b #0x37
    sta.w 0x00CA
.9733:
    jmp 0x80D583

.9736:
    lda.b 0xD7
    inc
    sta.b 0xD7
    cmp.b #0xFF
    bne .9747

    ldx.b #0x06
    stx.b 0xD3
    ldx.b #0x10
    stx.b 0xD9
.9747:
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    jsr _809F67
    jmp 0x80D583

.9756:
    dec.b 0xD9
    bne .978F

    lda.b #0x08
    sta.b 0xD3
    lda.b #0x17
    sta.b 0xC0
    jsr _80A013
    inc.w 0x1988
    stz.w 0x1989
    ldx.w 0x1F7A
    lda.w 0x8688D6,X
    sta.w 0x1993
    lda.b #0x04
    sta.w 0x198A
    lda.b #0x43
    sta.w 0x0300
    lda.b #0x4D
    sta.w 0x0301
    inc.w 0x00A1
    jsr _809F67
    jsr _809F67
    jmp 0x80D583

.978F:
    rts

.9790:
    lda.b 0xD7
    dec
    sta.b 0xD7
    cmp.b #0xE0
    bne .97B5

    ldx.b #0x0A
    stx.b 0xD3
    rep #0x10
    ldx.w #0x0200
    stx.b 0xD9
    ldx.w #0xFE00
    stx.b 0xDB
    ldx.w #0x00C0
    stx.b 0xDD
    ldx.w #0xFF40
    stx.b 0xDF
    sep #0x10
.97B5:
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    rts

.97BF:
    jsr _809F75
    rep #0x20
    lda.w #0x0400
    cmp.b 0xD9
    bpl .97CD

    sta.b 0xD9
.97CD:
    lda.w #0xFC00
    cmp.b 0xDB
    bmi .97D6

    sta.b 0xDB
.97D6:
    lda.w 0x1E50
    cmp.w #0x00E0
    bcc .97EC

    lda.w #0xFFD8
    sta.b 0xDD
    lda.w #0x0028
    sta.b 0xDF
    ldx.b #0x0C
    stx.b 0xD3
.97EC:
    sep #0x20
    jmp 0x809F67

.97F1:
    jsr _809F75
    lda.b 0xDA
    bpl .980E

    lda.b #0x0E
    sta.b 0xD3
    rep #0x20
    lda.w #0xFC00
    sta.b 0xD9
    lda.w #0x0400
    sta.b 0xDB
    stz.b 0xDD
    stz.b 0xDF
    sep #0x20
.980E:
    jmp 0x809F67

.9811:
    jsr _809F75
    rep #0x20
    lda.w #0x0100
    cmp.w 0x1E50
    bcc .987D

    sta.w 0x1E50
    sta.w 0x1E90
    sep #0x20
    lda.b #0x20
    jsr _808850.8874
    lda.w 0x1F7A
    clc
    adc.b #0x37
    jsr _8089CA
    lda.b #0x10
    sta.b 0xD3
    inc.w 0x1928
    inc.w 0x19C8
    stz.w 0x1929
    lda.b #0x02
    sta.w 0x192A
    lda.b #0x10
    sta.w 0x1932
    lda.b #0x33
    sta.w 0x19D2
    ldx.w 0x1F7A
    lda.w 0x8688D6,X
    inc
    sta.w 0x1933
    lda.w 0x8688DF,X
    sta.b 0xD7
    lda.b #0x13
    sta.w 0x19D3
    sta.w 0x0BCF
    rep #0x20
    lda.w #0x0080
    sta.w 0x192D
    sta.w 0x19CD
    lda.w #0x0170
    sta.w 0x1930
    sta.w 0x19D0
    sep #0x20
.987D:
    sep #0x20
    jmp 0x809F67

.9882:
    dec.b 0xD7
    bne .98D5

    lda.b #0x21
    sta.b 0xD7
    lda.b #0x12
    sta.b 0xD3
    stz.w 0x1948
    stz.w 0x1968
    stz.w 0x1988
    stz.w 0x19A8
    rep #0x20
    stz.w 0x1949
    stz.w 0x1969
    stz.w 0x1989
    stz.w 0x19A9
    sep #0x20
    lda.b #0x1D
    sta.w 0x1952
    sta.w 0x1972
    sta.w 0x1992
    sta.w 0x19B2
    stz.w 0x1959
    stz.w 0x1979
    stz.w 0x1999
    stz.w 0x19B9
    stz.w 0x1953
    lda.b #0x01
    sta.w 0x1973
    inc
    sta.w 0x1993
    inc
    sta.w 0x19B3
    rts

.98D5:
    jsr _809F67
    jmp 0x80D583

.98DB:
    dec.b 0xD7
    bne .98E8

    lda.b #0x14
    sta.b 0xD3
    lda.b #0x78
    sta.b 0xD7
    rts

.98E8:
    jsr _809F67
    jmp 0x80D583

.98EE:
    lda.w 0x00A7
    ora.w 0x00A8
    and.b #0xF0
    bne .98FC

    dec.b 0xD7
    bne .9903

.98FC:
    lda.b #0x16
    sta.b 0xD3
    jsr _80897E
.9903:
    rts

.9904:
    lda.b #0x09
    sta.w snes_regs.bgmode
    lda.b #0x01
    sta.l 0x7EFFC6
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    ldy.b #0x12
    jsl _828000.8011
    jsr _808099.8100
    ldx.b #0x01
    jsr _808B79
    ldy.b #0x20
    jsr _80B2FF
    jsr _808099.8100
    lda.w 0x1F7A
    asl
    clc
    adc.b #0x04
    tay
    jsr _80B2FF
    stz.w 0x1F81
    lda.w 0x1F7F
    beq .9953

    lda.b #0x03
    sta.w 0x1F81
.9953:
    jsr _809EF8
    lda.b #0x04
    sta.b 0xD2
    stz.b 0xD3
    stz.b 0xD4
    rts

.995F:
    ldx.b 0xD3
    jmp (.9964,X)

.9964: d16[.9972,.9A19,.9A53,.9B22,.9B6F,.9B8C,.9D35]

.9972:
    ldx.b 0xD4
    bne .99C0

    inc.b 0xD4
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    ldy.b #0x20
    jsr _80B2FF
    jsr _808A2E
    jsr _808099.8100
    lda.b #0x00
    sta.l 0x7F8400
    ldy.b #0x2A
    jsr _80B2FF
    lda.w 0x1F82
    bne .99A0

    jsr _80DB6E
.99A0:
    jsr _809D9D
    lda.b #0x01
    sta.w 0x1F82
    rep #0x20
    lda.w 0x1E50
    sta.b 0xD7
    sec
    sbc.w #0x0100
    sta.w 0x1E50
    sec
    sbc.w #0x0020
    sta.w 0x1E6C
    sep #0x20
    rts

.99C0:
    rep #0x21
    lda.w 0x1E50
    adc.w #0x0020
    sta.w 0x1E50
    cmp.b 0xD7
    beq .99D1

    bpl .99D6

.99D1:
    sep #0x20
    jmp 0x80DC4A

.99D6:
    lda.b 0xD7
    sta.w 0x1E50
    sta.w 0x1E6C
    sep #0x20
    phd
    pea 0x0BA8
    pld
    jsl _80E687
    pld
    lda.b #0x02
    sta.b 0xD3
    stz.b 0xD4
    ldx.w 0x1F7A
    lda.w 0x8688B0,X
    ldx.w 0x1F7F
    beq .9A16

    rep #0x10
    ldy.w #0x01F4
    jsl _828000.8011
    sep #0x10
    lda.b #0x04
    sta.w 0x1F11
    sta.w 0x1F12
    lda.b #0x2D
    sta.w 0x1F31
    sta.w 0x1F3B
.9A16:
    jmp _808799

.9A19:
    ldx.b 0xD4
    bne .9A3A

    inc.b 0xD4
    lda.b #0x04
    sta.w 0x1F12
    jsr _80D583
    inc.w 0x1CE8
    lda.b #0x0A
    sta.w 0x1CF2
    lda.w 0x1F7F
    beq .9A37

    stz.w 0x1CE8
.9A37:
    jmp _8089A6

.9A3A:
    php
    phd
    jsr _80D359
    pld
    plp
    jsr _80D583
    lda.w 0x1CE8
    bne .9A52

    lda.b #0x04
    sta.b 0xD3
    stz.b 0xD4
    inc.w 0x1F26
.9A52:
    rts

.9A53:
    inc.w 0x0B9C
    lda.w 0x1F7F
    bne .9A5E

    jsr _80E557
.9A5E:
    lda.w 0x1F9F
    bpl .9A7A

    lda.w 0x0B9C
    and.b #0x80
    beq .9A7A

    jsl get_rng
    tsb.w 0x0BDE
    tsb.w 0x0BDF
    tsb.w 0x0BE2
    tsb.w 0x0BE3
.9A7A:
    lda.w 0x1F24
    bne .9AEE

    jsl get_rng
    jsr _80D201
    jsr _80DC4A
    jsr _809E67
    jsr _80D583
    lda.w 0x1F30
    cmp.b #0x80
    bne .9A9D

    stz.w 0x1F30
    lda.b #0x0F
    sta.b 0xB3
.9A9D:
    lda.w 0x1F30
    beq .9AAB

    lda.b #0x80
    sta.w 0x1F30
    lda.b #0x0E
    sta.b 0xB3
.9AAB:
    lda.w 0x0BCF
    bne .9ACB

    lda.b #0x06
    sta.b 0xD3
    rep #0x20
    stz.w 0x0BDE
    stz.w 0x0BE0
    stz.w 0x0BE2
    lda.l 0x70000D
    inc
    sta.l 0x70000D
    sep #0x20
    rts

.9ACB:
    lda.w 0x1F7F
    bpl .9AD7

    lda.b #0x0C
    sta.b 0xD3
    stz.b 0xD4
    rts

.9AD7:
    lda.w 0x1F23
    beq .9AED

    lda.b #0x08
    sta.b 0xD3
    rep #0x20
    lda.l 0x70000D
    inc
    sta.l 0x70000D
    sep #0x20
.9AED:
    rts

.9AEE:
    bpl .9B1F

    lsr
    bcc .9AFD

    lda.b #0x0A
    sta.b 0xD3
    stz.b 0xD4
    sta.w 0x1FA0
    rts

.9AFD:
    jsr _809ECB
    bit.w 0x1F24
    bvc .9B0D

    lda.b #0x01
    sta.w 0x0BB6
    jsr _809F0E
.9B0D:
    jsr _80D583
    stz.w 0x1F24
    lda.b 0xD7
    sta.w 0x0BA1
    ldx.b #0x01
    ldy.b #0x02
    jmp 0x808962

.9B1F:
    jmp 0x80C438

.9B22:
    inc.w 0x0B9C
    jsr _80D201
    jsr _80DC4A
    jsr _80D583
    lda.w 0x1F0B
    beq .9B6E

    ldy.b #0x04
    jsr _808850.885C
    lda.b #0xF1
    jsr _808850.8874
    lda.w 0x1F80
    beq .9B66

    dec.w 0x1F80
    lda.b #0x04
    sta.b 0xD2
    stz.b 0xD3
    stz.b 0xD4
    jsr _80897E
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jmp _808A2E

.9B66:
    lda.b #0x0A
    sta.b 0xD2
    stz.b 0xD3
    stz.b 0xD4
.9B6E:
    rts

.9B6F:
    jsr _80D201
    jsr _80D583
    lda.w 0x1F23
    bpl .9B8B

    lda.w 0x213F
    bit.b #0x10
    beq .9B85

    jml entry.8016

.9B85:
    lda.b #0x0A
    sta.b 0xD3
    stz.b 0xD4
.9B8B:
    rts

.9B8C:
    ldx.b 0xD4
    jmp (.9B91,X)

.9B91: d16[.9B9B, .9BAC, .9CC1, .9CFF, .9CB6]

.9B9B:
    stz.w 0x1F82
    lda.b #0x02
    sta.b 0xD4
    ldy.b #0x02
    jsr _808850.885C
    lda.b #0x3C
    sta.b 0xD7
.9BAB:
    rts

.9BAC:
    dec.b 0xD7
    bne .9BAB

    lda.b #0x04
    sta.b 0xD4
    lda.b #0x3C
    sta.b 0xD7
    jsr _80897E
    stz.w 0x0BA1
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    lda.w 0x1FA0
    bne .9BDC

    jsr _80ABAE
.9BDC:
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    lda.w 0x1F7B
    cmp.b #0x04
    beq .9BF2

    jsr _80EFBA
.9BF2:
    jsr _809FEA
    beq .9BFC

.9BF7:
    stz.b 0xD2
    stz.b 0xD3
    rts

.9BFC:
    lda.w 0x1F7B
    cmp.b #0x04
    bne .9C06

    jmp 0x809C78

.9C06:
    bit.w 0x1F7C
    bvs .9BF7

    lda.b #0x09
    sta.w 0x1F7A
    lda.b #0x40
    tsb.w 0x1F7C
    stz.w 0x1F08
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    ldy.b #0x12
    jsl _828000.8011
    ldy.b #0x20
    jsr _80B2FF
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    jsr _808099.8100
    lda.w 0x1F7A
    asl
    clc
    adc.b #0x04
    tay
    jsr _80B2FF
    lda.b #0x03
    sta.w 0x1F81
    jsr _808099.8100
    jsr _80DB6E
    jsr _809D9D
    lda.b #0x04
    sta.w 0x1F12
    sta.w 0x1F11
    jsr _808099.8100
    rep #0x20
    lda.w 0x1E50
    sta.b 0xD7
    sec
    sbc.w #0x0100
    sta.w 0x1E50
    sec
    sbc.w #0x0020
    sta.w 0x1E6C
    sep #0x20
    rts

.9C78:
    jsr _80A027
    lda.b #0x01
    sta.w 0x1F7F
    stz.w 0x1F7A
    lda.b #0x02
    sta.b 0xD2
    lda.b #0x16
    sta.b 0xD3
    rts

.9C8C:
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    lda.b #0x08
    sta.b 0xD4
    ldy.b #0x12
    jsl _828000.8011
    ldy.b #0x20
    jsr _80B2FF
    jsr _808099.8100
    lda.b #0x3C
    sta.b 0xD7
    lda.b #0x03
    jsr _8089CA
    jmp _80895C

.9CB6:
    dec.b 0xD7
    bne .9CC0

    jsr _80897E
    jmp _808C37

.9CC0:
    rts

.9CC1:
    rep #0x21
    lda.w 0x1E50
    adc.w #0x0020
    sta.w 0x1E50
    cmp.b 0xD7
    beq .9CD2

    bpl .9CD7

.9CD2:
    sep #0x20
    jmp 0x80DC4A

.9CD7:
    lda.b 0xD7
    sta.w 0x1E50
    sta.w 0x1E6C
    sep #0x20
    phd
    pea 0x0BA8
    pld
    jsl _80E687
    pld
    sep #0x20
    lda.b #0x06
    sta.b 0xD4
    sta.w 0x1F31
    sta.w 0x1F3B
    lda.b #0x25
    jsr _808799
    jmp _80895C

.9CFF:
    inc.w 0x0B9C
    lda.b #0x00
    sta.w 0x1E68
    lda.b #0x05
    sta.w 0x1E69
    jsr _80E557
    jsr _80D201
    jsr _80D583
    lda.w 0x1F23
    bpl .9D34

    ldy.b #0x02
    jsr _808850.885C
    jsr _80897E
    stz.w 0x0BA1
    lda.b #0x08
    sta.w 0x1F7A
    stz.w 0x1F31
    stz.w 0x1F3B
    stz.b 0xD2
    stz.b 0xD3
.9D34:
    rts

.9D35:
    jsr _80897E
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    jmp 0x80A509

.9D51:
    rts

.9D52:
    rts

.9D53:
    jsr _80897E
    stz.w 0x0BA1
    stz.w 0x1F82
    lda.b #0x17
    sta.w 0x00C0
    jsr _808904
    jsr _808BB4
    ldx.b #0x10
    ldy.b #0x00
    jsl _828000
    ldy.b #0x12
    jsl _828000.8011
    jsr _808099.8100
    ldx.b #0x00
    jsr _808B79
    ldx.b #0x01
    jsr _808B79
    jsr _808904
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    jsr _80EFBA
    lda.b #0x02
    sta.w 0x1F80
    stz.b 0xD2
    stz.b 0xD3
    stz.b 0xD4
    rts

;-----

_809D9D:
    rep #0x10
    stz.w 0x0BA1
    jsr _80E6A2
    lda.w 0x86A783,X
    sta.w 0x1F08
    lda.w 0x86A784,X
    sta.w 0x1F09
    lda.w 0x86A785,X
    sta.w 0x1F0A
    sep #0x10
    stz.w 0x1F0B
    lda.b #0x04
    sta.w 0x1F12
    stz.w 0x1F11
    lda.b #0xA0
    sta.w 0x0BCF
    stz.w 0x1F0E
    stz.w 0x1F0F
    jsr _80B12B
    ldy.b #0x12
    jsl _828000.8011
    lda.w 0x1F7A
    asl
    clc
    adc.b #0x60
    tay
    jsl _828000.8011
    lda.w 0x1F82
    beq .9DE9

.9DE9:
    jsr _80BAD5
    ldx.b #0x00
    jsr _808B79
    jsr _808099.8100
    jsr _80E60B
    jsr _80B582
    jsr _80B582.B58B
    jsr _808099.8100
    lda.w 0x1F7A
    cmp.b #0x05
    bne .9E1F

    lda.w 0x1F08
    beq .9E1F

    rep #0x21
    lda.w 0x1E8D
    adc.w #0x0100
    sta.w 0x1E8D
    sep #0x20
    jsr _80B582.B58B
    jsr _808099.8100
.9E1F:
    ldx.b #0x10
    ldy.b #0x00
    jsl _828000
    ldx.b #0x30
    ldy.b #0x40
    jsl _828000
    ldy.b #0x00
    jsr _80B2FF
    ldx.b #0x20
    ldy.b #0x1C
    jsl _828000
    ldy.b #0xA0
    jsl _828000.8011
    jsr _808099.8100
    jsr _80B085.local
.9E48:
    jsr _808099.8100
    lda.w 0x0040
    bne .9E48

    jsr _80B42A.local
.9E53:
    jsr _808099.8100
    lda.w 0x0050
    bne .9E53

    jsr _80B4F1.B4FB
.9E5E:
    inc.w 0x1E48
    inc.w 0x1E88
    jmp 0x80DB85

;-----

_809E67:
    lda.w 0x1F3B
    bne .9EAB

    lda.w 0x0BCF
    and.b #0x7F
    beq .9EAB

    lda.w 0x0BE3
    and.b #0x10
    beq .9EAB

    lda.b #0xF1
    jsr _808850.8874
    lda.b #0x01
    sta.w 0x1F24
    jsr _809EAC
    jsr _80D583
    lda.b #0xF1
    jsr _808850.8874
    ldx.b #0x01
    ldy.b #0x02
    jsr _80897E.8984
    lda.b #0x42
    jsr _80814E
    lda.w 0x0BA1
    sta.b 0xD7
    stz.w 0x0BA1
    ldy.b #0x80
    jsr _808850
    jmp 0x80C42F

.9EAB:
    rts

;-----

_809EAC:
    phb
    rep #0x30
    ldx.w #0x00E3
    ldy.w #0xB400
    lda.w #0x0009
    mvn 0x7F, 0x00
    ldx.w #0x0920
    ldy.w #0xB40A
    lda.w #0x017F
    mvn 0x7F, 0x00
    sep #0x30
    plb
    rts

;-----

_809ECB:
    phb
    rep #0x30
    ldx.w #0xB400
    ldy.w #0x00E3
    lda.w #0x0009
    mvn 0x00, 0x7F
    ldx.w #0xB40A
    ldy.w #0x0920
    lda.w #0x017F
    mvn 0x00, 0x7F
    sep #0x30
    plb
    rts

;-----

_809EEA:
    rep #0x20
    ldx.b #0x10
.9EEE:
    stz.w 0x1F87,X
    dex
    dex
    bpl .9EEE

    sep #0x20
    rts

;-----

_809EF8:
    rep #0x20
    ldx.b #0x10
.9EFC:
    bit.w 0x1F87,X
    bvc .9F07

    lda.w #0xDC00
    sta.w 0x1F87,X
.9F07:
    dex
    dex
    bpl .9EFC

    sep #0x20
    rts

;-----

_809F0E:
    rep #0x31
    lda.w 0x1E4D
    adc.w #0x0180
    sta.b 0x00
    ldx.w #0x003E
.9F1B:
    lda.w 0x0960,X
    cmp.w #0x1228
    bcc .9F2A

    cmp.w #0x1428
    bcs .9F2A

    bra .9F34

.9F2A:
    cmp.w #0x0C98
    bcc .9F3A

    cmp.w #0x0E18
    bcs .9F3A

.9F34:
    tay
    lda.b 0x00
    sta 0x0005,Y
.9F3A:
    dex
    dex
    bpl .9F1B

    ldx.w #0x003E
.9F41:
    lda.w 0x09A0,X
    cmp.w #0x1228
    bcc .9F50

    cmp.w #0x1428
    bcs .9F50

    bra .9F5A

.9F50:
    cmp.w #0x0C98
    bcc .9F60

    cmp.w #0x0E18
    bcs .9F60

.9F5A:
    tay
    lda.b 0x00
    sta 0x0005,Y
.9F60:
    dex
    dex
    bpl .9F41

    sep #0x30
    rts

;-----

_809F67:
    php
    phd
    jsr _80D359
    jsr _80DDEF
    jsr _80DEEF
    pld
    plp
    rts

;-----

_809F75:
    php
    rep #0x21
    lda.b 0xD9
    adc.b 0xDD
    sta.b 0xD9
    lda.w 0x1E4F
    clc
    adc.b 0xD9
    sta.w 0x1E4F
    sep #0x20
    stz.w 0x0000
    lda.b 0xDA
    bpl .9F93

    dec.w 0x0000
.9F93:
    lda.w 0x1E51
    adc.w 0x0000
    sta.w 0x1E51
    rep #0x20
    lda.b 0xDB
    clc
    adc.b 0xDF
    sta.b 0xDB
    lda.w 0x1E8F
    clc
    adc.b 0xDB
    sta.w 0x1E8F
    sep #0x20
    stz.w 0x0000
    lda.b 0xDC
    bpl .9FBA

    dec.w 0x0000
.9FBA:
    lda.w 0x1E91
    adc.w 0x0000
    sta.w 0x1E91
    plp
    rts

;-----

_809FC5:
    ldx.b #0x01
    jsr _808B79
    rep #0x30
    lda.b 0x0E
    sta.w 0x0302
    inc.w 0x00A1
    ldx.w #0x07FE
    lda.w #0x2002
.9FDA:
    sta.l 0x7FD000,X
    dex
    dex
    bpl .9FDA

    sep #0x30
    ldy.b #0x06
    jsr _808A70
    rts

;-----

_809FEA:
    stz.b 0x00
    ldx.b #0x0E
.9FEE:
    asl.b 0x00
    bit.w 0x1F88,X
    bvc .9FF9

    lda.b #0x01
    tsb.b 0x00
.9FF9:
    dex
    dex
    bpl .9FEE

    lda.b 0x00
    cmp.b #0xFF
    rts

;-----

_80A002:
    rep #0x20
    ldx.b #0x1E
.A006:
    lda.w 0x04A0,X
    sta.w 0x04C0,X
    dex
    dex
    bpl .A006

    sep #0x20
    rts

;-----

_80A013:
    rep #0x20
    ldx.b #0x1E
.A017:
    lda.w 0x04C0,X
    sta.w 0x04A0,X
    dex
    dex
    bpl .A017

    sep #0x20
    inc.w 0x00A1
    rts

;-----

_80A027:
    php
    phd
    sep #0x30
    stz.w 0x1E49
.A02E:
    pea 0x1E48
    pld
    ldx.b 0x01
    jsr (.A074,X)
    jsr _80A1B3
    jsr _80A241
    jsr _80A2B6
    jsr _80A35A
    jsr _80A42A
    pea 0x0000
    pld
    jsr _80D583
    lda.w 0x1E48
    beq .A057

    jsr _808099.8100
    bra .A02E

.A057:
    jsr _80897E
    lda.b #0x80
    sta.w 0x00B3
    sta.w snes_regs.inidisp
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    jsr _808904
    stz.w 0x00B3
    pld
    plp
    rts

.A074: d16[.A082, .A0EA, .A123, .A14E, .A176, .A189, .A1A0]

.A082:
    jsr _80DB53
    jsr _808BB4
    jsr _808904
    inc.b 0x00
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.w 0x1F12
    sta.w 0x1F11
    phd
    pea 0x0000
    pld
    ldy.b #0x6A
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x6C
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x6E
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x70
    jsr _80B2FF
    jsr _808099.8100
    rep #0x10
    ldy.w #0x01F6
    jsl _828000.8011
    ldx.w #0x0040
    ldy.w #0x01F2
    jsl _828000
    ldy.w #0x0000
    jsl _828000.8011
    sep #0x10
    stz.b 0xB3
    jsr _8089A6
    pld
    rep #0x20
    lda.w #0x02D0
    sta.b 0x10
    sep #0x20
    rts

.A0EA:
    rep #0x30
    dec.b 0x10
    beq .A102

    lda.w 0x0B9B
    and.w #0x0002
    clc
    adc.w #0x01F6
    tay
    jsl _828000.8011
    sep #0x30
    rts

.A102:
    ldy.w #0x01F8
    jsl _828000.8011
    sep #0x30
    lda.b #0x04
    sta.b 0x01
    stz.w 0x00C9
    lda.b #0x32
    sta.w 0x00CA
    stz.b 0x12
    jsr _80A4C8
    lda.b #0x21
    jsl _80888B.88B6
    rts

.A123:
    lda.w 0x0B9B
    and.b #0x03
    bne .A14D

    jsr _80A4F8
    inc.b 0x12
    lda.b 0x12
    cmp.b #0x14
    bcc .A14D

    lda.b #0x06
    sta.b 0x01
    ldx.b 0x13
    stz.w 0x0AA1,X
    lda.b #0x1F
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    lda.b #0x3C
    sta.b 0x10
.A14D:
    rts

.A14E:
    dec.b 0x10
    bne .A175

    lda.b #0x02
    sta.b 0x10
    lda.w 0x00CB
    dec
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    cmp.b #0x00
    bne .A175

    lda.b #0x08
    sta.b 0x01
    stz.w 0x00CA
    stz.w 0x00C9
    lda.b #0x3C
    sta.b 0x10
.A175:
    rts

.A176:
    dec.b 0x10
    bne .A188

    lda.b #0x2C
    jsl _80878B
    lda.b #0x3C
    sta.b 0x10
    lda.b #0x0A
    sta.b 0x01
.A188:
    rts

.A189:
    dec.b 0x10
    bne .A19F

    lda.b #0x60
    jsl _80E9F6
    lda.b #0x01
    sta.w 0x1F34
    sta.w 0x1F37
    lda.b #0x0C
    sta.b 0x01
.A19F:
    rts

.A1A0:
    inc.w 0x0B9C
    lda.w 0x0060
    bne .A1B2

    stz.b 0x00
    lda.b #0xF6
    ldy.b #0x03
    jsl _808850.8868
.A1B2:
    rts

;-----

_80A1B3:
    pea 0x1428
    pld
    ldx.b 0x01
    jmp (.A1BC,X)

.A1BC: d16[.A1C6, .A200, .A218, .A225, .A240]

.A1C6:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x20
    sta.b 0x11
    stz.b 0x18
    lda.b #0xFF
    sta.b 0x10
    stz.b 0x16
    rep #0x20
    lda.w #0xA597
    sta.b 0x31
    stz.b 0x08
    lda.w #0x00A0
    sta.b 0x05
    lda.w #0xF800
    sta.b 0x1C
    sep #0x20
    lda.b #0x47
    jsl 0x848F07
    jsl 0x848FCA
    lda.b #0x0A
    sta.b 0x1F
    lda.b #0x0E
    jsl _80888B.88B6
    rts

.A200:
    jsl _82825D
    dec.b 0x1F
    bne .A213

    lda.b #0x04
    sta.b 0x01
    lda.b #0x1E
    sta.b 0x1E
    jsr _80A45B
.A213:
    jsl _82808F.80B4
    rts

.A218:
    dec.b 0x1E
    bne .A224

    lda.b #0x40
    sta.b 0x1F
    lda.b #0x06
    sta.b 0x01
.A224:
    rts

.A225:
    lda.w 0x0B9B
    and.b #0x03
    bne .A23F

    rep #0x20
    lda.w 0x00B4
    dec
    sta.w 0x00B4
    sep #0x20
    dec.b 0x1F
    bne .A23F

    lda.b #0x08
    sta.b 0x01
.A23F:
    rts

.A240:
    rts

;-----

_80A241:
    pea 0x0E68
    pld
    ldx.b 0x01
    jmp (.A24A,X)

.A24A: d16[.A252, .A28C, .A2A8, .A2B5]

.A252:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x2B
    sta.b 0x11
    stz.b 0x18
    lda.b #0xAD
    sta.b 0x16
    lda.b #0x07
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x12
    rep #0x20
    lda.w #0x0070
    sta.b 0x05
    lda.w #0x0070
    sta.b 0x08
    lda.w #0xFFF8
    sta.b 0x1A
    lda.w #0xFFE0
    sta.b 0x1C
    lda.w #0x02D0
    sta.b 0x0C
    sep #0x20
    jsl _82808F.80B4
    rts

.A28C:
    jsl _82808F.80B4
    jsl _828174.820A
    rep #0x20
    dec.b 0x0C
    sep #0x20
    bne .A2A4

    lda.b #0x04
    sta.b 0x01
    lda.b #0x3C
    sta.b 0x0C
.A2A4:
    jsr _80A2FF
    rts

.A2A8:
    jsl _82808F.80B4
    dec.b 0x0C
    bne .A2B4

    lda.b #0x06
    sta.b 0x01
.A2B4:
    rts

.A2B5:
    rts

;-----

_80A2B6:
    rep #0x30
    lda.w #0x1928
    tcd
.A2BC:
    lda.b 0x00
    beq .A2C5

    sep #0x30
    jsr _80A2D5
.A2C5:
    rep #0x30
    tdc
    clc
    adc.w #0x0020
    tcd
    cmp.w #0x1D08
    bcc .A2BC

    sep #0x30
    rts

;-----

_80A2D5:
    lda.b 0x01
    bne .A2ED

    inc.b 0x01
    lda.b #0x29
    sta.b 0x11
    lda.b #0xAD
    sta.b 0x16
    lda.b 0x0A
    jsl 0x848F07
    lda.b #0x02
    sta.b 0x12
.A2ED:
    jsl 0x848EEA
    lda.b 0x0F
    bmi .A2FA

    jsl _82808F.80B4
    rts

.A2FA:
    jsl _828372.8398
    rts

;-----

_80A2FF:
    lda.w 0x0B9B
    and.b #0x03
    bne .A357

    jsl _8282AC.82D3
    bne .A357

    inc.w 0x0000,X
    jsl get_rng
    and.b #0x01
    asl
    sta.w 0x0000
    asl
    clc
    adc.w 0x0000
    sta.w 0x000A,X
    rep #0x20
    jsl get_rng
    and.w #0x001F
    eor.w #0xFFFF
    inc
    clc
    adc.b 0x08
    sta.w 0x0008,X
    jsl get_rng
    and.w #0x003F
    lsr
    bcc .A342

    eor.w #0xFFFF
    inc
.A342:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    sep #0x30
    jsl get_rng
    and.b #0x03
    clc
    adc.b #0x93
    jsl _80888B.88B6
.A357:
    sep #0x10
    rts

;-----

_80A35A:
    pea 0x0EA8
    pld
    ldx.b 0x01
    jsr (.A36D,X)
    rep #0x20
    lda.w 0x0E6D
    sta.b 0x05
    sep #0x20
    rts

.A36D: d16[.A37D, .A3A4, .A3B1, .A3CC, .A3E7, .A402, .A419, .A429]

.A37D:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x29
    sta.b 0x11
    stz.b 0x12
    stz.b 0x18
    lda.b #0xAD
    sta.b 0x16
    lda.b #0x01
    jsl 0x848F07
    lda.b #0xFF
    sta.b 0x1F
    rep #0x20
    lda.w #0x00D0
    sta.b 0x08
    lda.w #0x0060
    sta.b 0x05
    rts

.A3A4:
    dec.b 0x1F
    bne .A3B0

    lda.b #0x7F
    sta.b 0x1F
    lda.b #0x04
    sta.b 0x01
.A3B0:
    rts

.A3B1:
    jsl 0x848EEA
    dec.b 0x1F
    bne .A3C7

    lda.b #0x7F
    sta.b 0x1F
    lda.b #0x02
    jsl 0x848F07
    lda.b #0x06
    sta.b 0x01
.A3C7:
    jsl _82808F.80B4
    rts

.A3CC:
    jsl 0x848EEA
    dec.b 0x1F
    bne .A3E2

    lda.b #0x5A
    sta.b 0x1F
    lda.b #0x03
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x01
.A3E2:
    jsl _82808F.80B4
    rts

.A3E7:
    jsl 0x848EEA
    dec.b 0x1F
    bne .A3FD

    lda.b #0x5A
    sta.b 0x1F
    lda.b #0x04
    jsl 0x848F07
    lda.b #0x0A
    sta.b 0x01
.A3FD:
    jsl _82808F.80B4
    rts

.A402:
    jsl 0x848EEA
    dec.b 0x1F
    bne .A414

    lda.b #0x05
    jsl 0x848F07
    lda.b #0x0C
    sta.b 0x01
.A414:
    jsl _82808F.80B4
    rts

.A419:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .A425

    lda.b #0x0E
    sta.b 0x01
.A425:
    jsl _82808F.80B4
.A429:
    rts

;-----

_80A42A:
    pea 0x0EE8
    pld
    lda.b 0x01
    bne .A456

    inc.b 0x01
    lda.b #0x01
    sta.b 0x11
    lda.b #0x02
    sta.b 0x12
    stz.b 0x18
    lda.b #0xAD
    sta.b 0x16
    lda.b #0x08
    jsl 0x848F07
    rep #0x20
    lda.w #0x005D
    sta.b 0x05
    lda.w #0x00DF
    sta.b 0x08
    sep #0x20
.A456:
    jsl _82808F.80B4
    rts

;-----

_80A45B:
    lda.w 0x1F99
    and.b #0x05
    lsr
    bcc .A465

    ora.b #0x01
.A465:
    rep #0x20
    and.w #0x0003
    asl
    asl
    asl
    sta.w 0x0000
    asl
    asl
    clc
    adc.w 0x0000
    clc
    adc.w #0x88E8
    sta.w 0x0000
    lda.w #0x5172
    sta.w 0x0002
    lda.w #0x0005
    sta.w 0x0004
    ldx.w 0x00A3
.A48C:
    rep #0x20
    lda.w 0x0002
    sta.w 0x0501,X
    clc
    adc.w #0x0020
    sta.w 0x0002
    lda.w #0x0008
    sta.w 0x0503,X
    lda.w 0x0000
    sta.w 0x0505,X
    clc
    adc.w #0x0008
    sta.w 0x0000
    sep #0x20
    lda.b #0x80
    sta.w 0x0500,X
    lda.b #0x86
    sta.w 0x0507,X
    txa
    clc
    adc.b #0x08
    tax
    dec.w 0x0004
    bne .A48C

    stx.w 0x00A3
    rts

;-----

_80A4C8:
    ldx.b #0x00
.A4CA:
    lda.w 0x0AA1,X
    beq .A4D6

    txa
    clc
    adc.b #0x07
    tax
    bra .A4CA

.A4D6:
    stx.b 0x13
    inc.w 0x0AA1,X
    lda.b #0x00
    sta.w 0x0AA2,X
    lda.b #0x32
    sta.w 0x0AA3,X
    lda.b #0xB0
    sta.w 0x0AA4,X
    lda.b #0x89
    sta.w 0x0AA5,X
    lda.b #0x86
    sta.w 0x0AA6,X
    sta.w 0x0AA7,X
    rts

;-----

_80A4F8:
    lda.b 0x12
    asl
    tax
    rep #0x20
    lda.w 0x8988,X
    ldx.b 0x13
    sta.w 0x0AA4,X
    sep #0x20
    rts

;-----

_80A509:
    jsr _80DB53
    jsr _808BB4
    jsr _808A2E
    jsr _808904
.A515:
    pea 0x1E48
    pld
    ldx.b 0x01
    jsr (.A527,X)
    pea 0x0000
    pld
    jsr _808099.8100
    bra .A515

.A527: d16[.A537, .A5AE, .A5C4, .A5E2, .A5F5, .A608, .A61B, .A636]

.A537:
    lda.b #0x02
    sta.b 0x01
    stz.w 0x00B3
    phd
    pea 0x0000
    pld
    ldy.b #0x72
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x74
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x76
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x20
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x6A
    jsr _808A70
    ldy.b #0x12
    jsl _828000.8011
    rep #0x10
    ldy.w #0x01F4
    jsl _828000.8011
    sep #0x10
    ldy.b #0x24
    jsl _828000.8011
    ldy.b #0x1A
    jsl _828000.8011
    lda.b #0x30
    jsl _80878B
    lda.b #0x1F
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    stz.w 0x00C9
    lda.b #0x81
    sta.w 0x00CA
    jsr _80895C
    lda.b #0xE2
    jsl _80E9F6
    lda.b #0x01
    sta.w 0x1F34
    pld
    rts

.A5AE:
    lda.w 0x0060
    bne .A5C3

    lda.b #0xF6
    ldy.b #0x02
    jsl _808850.8868
    lda.b #0x3C
    sta.b 0x10
    lda.b #0x04
    sta.b 0x01
.A5C3:
    rts

.A5C4:
    dec.b 0x10
    bne .A5E1

    lda.b #0x1D
    jsl _80878B
    lda.b #0xF5
    jsl _808850.8868
    lda.b #0x06
    sta.b 0x01
    lda.b #0x3C
    sta.b 0x10
    lda.b #0x04
    tsb.w 0x00A2
.A5E1:
    rts

.A5E2:
    dec.b 0x10
    bne .A5F4

    ldy.b #0x2A
    jsl _828000.8011
    lda.b #0x08
    sta.b 0x01
    lda.b #0x1E
    sta.b 0x10
.A5F4:
    rts

.A5F5:
    dec.b 0x10
    bne .A607

    ldy.b #0x28
    jsl _828000.8011
    lda.b #0x0A
    sta.b 0x01
    lda.b #0x1E
    sta.b 0x10
.A607:
    rts

.A608:
    dec.b 0x10
    bne .A61A

    ldy.b #0x24
    jsl _828000.8011
    lda.b #0x0C
    sta.b 0x01
    lda.b #0x3C
    sta.b 0x10
.A61A:
    rts

.A61B:
    lda.w 0x00CB
    dec
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    cmp.b #0x00
    bne .A636

    lda.b #0x61
    jsl _80E9F6
    lda.b #0x0E
    sta.b 0x01
.A636:
    rts

;-----

_80A637:
    pea 0x0E68
    pld
.A63B:
    inc.w 0x0B9C
    ldx.b 0x01
    jsr (.A651,X)
    lda.b 0x35
    bne .A64C

    jsr _80A944
    bra .A63B

.A64C:
    pea 0x0000
    pld
    rts

.A651: d16[.A657, .A702, .A919]

.A657:
    lda.b #0x02
    sta.b 0x01
    pea 0x0000
    pld
    lda.b #0x09
    sta.w snes_regs.bgmode
    lda.b #0x04
    sta.w 0x1F12
    sta.w 0x1F11
    rep #0x10
    ldy.w #0x0174
    jsl _828000.8011
    sep #0x10
    ldy.b #0x12
    jsl _828000.8011
    ldy.b #0x20
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x58
    jsr _80B2FF
    jsr _808099.8100
    lda.b #0x23
    sta.w 0x1F7A
    jsr _80BAD5
    rep #0x20
    lda.w #0x0100
    sta.w 0x1E4D
    stz.w 0x1E50
    stz.w 0x1E8D
    stz.w 0x1E90
    sep #0x20
    inc.w 0x1E9A
    jsr _80B582
    jsr _80B582.B58B
    inc.w 0x1E48
    inc.w 0x1E88
    lda.b #0x04
    sta.w 0x1E49
    lda.b #0x0C
    sta.w 0x1E89
    lda.b #0x04
    sta.b 0xC0
    lda.b #0x10
    sta.b 0xC1
    lda.b #0x02
    sta.b 0xC9
    lda.b #0x41
    sta.b 0xCA
    stz.b 0xCB
    stz.b 0xCC
    stz.b 0xCD
    stz.w 0x1F08
    lda.b #0x23
    sta.w 0x1F7A
    jsr _80B085.local
.A6E2:
    jsr _808099.8100
    lda.w 0x0040
    bne .A6E2

    lda.b #0x9D
    sta.b 0x98
    stz.b 0xF8
    stz.b 0xF9
    jsr _80B24C.local
    lda.b #0x80
    jsr _808850.8874
    jsr _80895C
    pea 0x0E68
    pld
    rts

.A702:
    rep #0x20
    lda.w 0x1E4D
    sta.w 0x1E6A
    lda.w 0x1E50
    sta.w 0x1E6C
    sep #0x20
    ldx.b 0x02
    jsr (.A72E,X)
    lda.w 0x00A7
    ora.w 0x00A8
    beq .A72B

    lda.b #0x04
    sta.b 0x01
    ldy.b #0x04
    lda.b #0xF6
    jsl _808850.8868
.A72B:
    jmp _80A92F

.A72E: d16[
    .A74A, .A7B1, .A7C8, .A7F1, .A817, .A848, .A858, .A78D,
    .A7A7, .A8A0, .A8CC, .A757, .A769, .A77B,
]

.A74A:
    lda.b #0x16
    sta.b 0x02
    lda.b #0x8F
    jsl _80E9F6
    jmp 0x80A94E

.A757:
    lda.w 0x1F3C
    cmp.b #0x02
    bne .A768

    lda.b #0x18
    sta.b 0x02
    lda.b #0x89
    jsl _80888B.88B6
.A768:
    rts

.A769:
    lda.w 0x1F3C
    cmp.b #0x03
    bne .A77A

    lda.b #0x1A
    sta.b 0x02
    lda.b #0x89
    jsl _80888B.88B6
.A77A:
    rts

.A77B:
    lda.w 0x1F3C
    cmp.b #0x04
    bne .A78C

    lda.b #0x0E
    sta.b 0x02
    lda.b #0x89
    jsl _80888B.88B6
.A78C:
    rts

.A78D:
    lda.w 0x1F3C
    cmp.b #0x05
    bne .A7A6

    phd
    pea 0x0000
    pld
    jsr _80897E
    pld
    lda.b #0x10
    sta.b 0x02
    lda.b #0x04
    tsb.w 0x00A2
.A7A6:
    rts

.A7A7:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x0F
    sta.w 0x00B3
    rts

.A7B1:
    lda.w 0x1F3C
    cmp.b #0x06
    bne .A7C7

    lda.b #0x04
    sta.b 0x02
    lda.b #0x01
    tsb.w 0x00C0
    lda.b #0x1E
    sta.b 0x34
    stz.b 0x33
.A7C7:
    rts

.A7C8:
    dec.b 0x34
    bne .A7F0

    lda.b #0x1E
    sta.b 0x34
    rep #0x30
    lda.b 0x33
    and.w #0x00FF
    clc
    adc.w #0x0176
    tay
    jsl _828000.8011
    sep #0x30
    inc.b 0x33
    inc.b 0x33
    lda.b 0x33
    cmp.b #0x08
    bcc .A7F0

    lda.b #0x06
    sta.b 0x02
.A7F0:
    rts

.A7F1:
    lda.w 0x1F3C
    cmp.b #0x09
    bne .A816

    lda.b #0x04
    tsb.w 0x00A2
    rep #0x21
    stz.w 0x00BE
    lda.w 0x1E4D
    adc.w #0xFFF8
    sta.w 0x1E4D
    cmp.w #0x0080
    sep #0x20
    bne .A816

    lda.b #0x08
    sta.b 0x02
.A816:
    rts

.A817:
    lda.w 0x1F3C
    cmp.b #0x0C
    bne .A847

    lda.b #0x0A
    sta.b 0x02
    stz.w 0x00BE
    stz.w 0x00BF
    stz.w 0x00C9
    lda.b #0x84
    sta.w 0x00CA
    lda.b #0x1F
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    lda.b #0x86
    jsl _80888B.88B6
    ldy.b #0x18
    jsl _808A64
.A847:
    rts

.A848:
    dec.w 0x00CB
    dec.w 0x00CC
    dec.w 0x00CD
    bne .A857

    lda.b #0x0C
    sta.b 0x02
.A857:
    rts

.A858:
    lda.w 0x1F3C
    cmp.b #0x0D
    bne .A89F

    phd
    pea 0x0000
    pld
    jsr _80897E
    pld
    lda.b #0x12
    sta.b 0x02
    pea 0x0000
    pld
    ldy.b #0x7C
    jsl _828000.8011
    ldy.b #0x68
    jsr _80B2FF
    jsr _808099.8100
    lda.b #0x24
    sta.w 0x1F7A
    jsr _80BAD5
    rep #0x20
    stz.w 0x1E4D
    stz.w 0x1E50
    sep #0x20
    inc.w 0x1E9A
    jsr _80B582
    pea 0x0E68
    pld
    lda.b #0x04
    tsb.w 0x00A2
.A89F:
    rts

.A8A0:
    lda.b #0x14
    sta.b 0x02
    lda.b #0x0F
    sta.w 0x00B3
    lda.b #0x02
    sta.w 0x00C9
    lda.b #0x20
    sta.w 0x00CA
    stz.w 0x00CB
    stz.w 0x00CC
    stz.w 0x00CD
    lda.b #0x01
    sta.b 0x33
    lda.b #0x90
    jsl _80E9F6
    lda.b #0x01
    sta.w 0x1F35
    rts

.A8CC:
    lda.w 0x0B9C
    and.b #0x1F
    bne .A8D9

    lda.b #0x85
    jsl _80888B.88B6
.A8D9:
    lda.w 0x1F3C
    cmp.b #0x01
    bne .A8E5

    lda.b #0x04
    sta.b 0x01
    rts

.A8E5:
    lda.w 0x0B9C
    lsr
    bcc .A901

    lda.w 0x00CB
    clc
    adc.b 0x33
    sta.w 0x00CB
    beq .A8FA

    cmp.b #0x0F
    bne .A901

.A8FA:
    lda.b 0x33
    eor.b #0xFF
    inc
    sta.b 0x33
.A901:
    rep #0x21
    lda.w 0x1E4D
    adc.w #0x0001
    cmp.w #0x0E60
    bcc .A911

    lda.w #0x0E60
.A911:
    sta.w 0x1E4D
    sep #0x20
    jmp 0x80DDEF

.A919:
    inc.b 0x35
    phd
    pea 0x0000
    pld
    jsr _80897E
    lda.b #0x04
    sta.w 0x0039
    ldx.b #0x30
    jsr _808147
    pld
    rts

;-----

_80A92F:
    php
    phd
    jsr _80D359
    jsr _80DDEF
    jsr _80DEEF
    pea 0x0000
    pld
    jsr _80D583
    pld
    plp
    rts

;-----

_80A944:
    phd
    pea 0x0000
    pld
    jsr _808099.8100
    pld
    rts

;-----

_80A94E:
    jsl _8282AC.82D3
    bne .A95C

    inc.w 0x0000,X
    lda.b #0x3D
    sta.w 0x000A,X
.A95C:
    sep #0x10
    rts

;-----

_80A95F:
    ldx.b 0x01
    jmp (.A964,X)

.A964: d16[.A96A, .A981, .AB52]

.A96A:
    lda.b #0x02
    sta.b 0x01
    lda.l 0x7F829C
    sta.b 0x18
    lda.l 0x7F839C
    sta.b 0x11
    stz.b 0x12
    lda.b #0xA9
    sta.b 0x16
.A980:
    rtl

.A981:
    ldx.b 0x02
    jsr (.A98E,X)
    lda.b 0x02
    beq .A980

    jml 0x8280B4

.A98E: d16[.A998, .A9BE, .AA2A, .AA96, .AB02]

.A998:
    lda.w 0x1F3C
    cmp.b #0x07
    bne .A9BD

    lda.b #0x02
    sta.b 0x02
    rep #0x20
    lda.w #0x0148
    sta.b 0x05
    lda.w #0x002A
    sta.b 0x08
    sep #0x20
    lda.b #0x88
    jsl _80888B.88B6
    lda.b #0x00
    jsl 0x848F07
.A9BD:
    rts

.A9BE:
    ldx.b 0x03
    jmp (.A9C3,X)

.A9C3: d16[.A9C9, .A9EB, .AA01]

.A9C9:
    bit.b 0x0F
    bpl .A9D8

    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    jsl 0x848F07
    rts

.A9D8:
    bvc .A9E6

    lda.b #0x87
    jsl _80888B.88B6
    lda.b #0x8A
    jsl _80888B.88B6
.A9E6:
    jsl 0x848EEA
    rts

.A9EB:
    lda.w 0x1F3C
    cmp.b #0x08
    bne .A9FC

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    jsl 0x848F07
.A9FC:
    jsl 0x848EEA
    rts

.AA01:
    lda.b 0x0F
    bpl .AA25

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rep #0x20
    lda.w #0x0148
    sta.b 0x05
    lda.w #0x0056
    sta.b 0x08
    sep #0x20
    lda.b #0x88
    jsl _80888B.88B6
    lda.b #0x00
    jsl 0x848F07
.AA25:
    jsl 0x848EEA
    rts

.AA2A:
    ldx.b 0x03
    jmp (.AA2F,X)

.AA2F: d16[.AA35, .AA57, .AA6D]

.AA35:
    bit.b 0x0F
    bpl .AA44

    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    jsl 0x848F07
    rts

.AA44:
    bvc .AA52

    lda.b #0x87
    jsl _80888B.88B6
    lda.b #0x8A
    jsl _80888B.88B6
.AA52:
    jsl 0x848EEA
    rts

.AA57:
    lda.w 0x1F3C
    cmp.b #0x09
    bne .AA68

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    jsl 0x848F07
.AA68:
    jsl 0x848EEA
    rts

.AA6D:
    lda.b 0x0F
    bpl .AA91

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    rep #0x20
    lda.w #0x0128
    sta.b 0x05
    lda.w #0x006C
    sta.b 0x08
    sep #0x20
    lda.b #0x88
    jsl _80888B.88B6
    lda.b #0x00
    jsl 0x848F07
.AA91:
    jsl 0x848EEA
    rts

.AA96:
    ldx.b 0x03
    jmp (.AA9B,X)

.AA9B: d16[.AAA1, .AAC3, .AAD9]

.AAA1:
    bit.b 0x0F
    bpl .AAB0

    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    jsl 0x848F07
    rts

.AAB0:
    bvc .AABE

    lda.b #0x87
    jsl _80888B.88B6
    lda.b #0x8A
    jsl _80888B.88B6
.AABE:
    jsl 0x848EEA
    rts

.AAC3:
    lda.w 0x1F3C
    cmp.b #0x0A
    bne .AAD4

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    jsl 0x848F07
.AAD4:
    jsl 0x848EEA
    rts


.AAD9:
    lda.b 0x0F
    bpl .AAFD

    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    rep #0x20
    lda.w #0x015E
    sta.b 0x05
    lda.w #0x00AA
    sta.b 0x08
    sep #0x20
    lda.b #0x88
    jsl _80888B.88B6
    lda.b #0x00
    jsl 0x848F07
.AAFD:
    jsl 0x848EEA
    rts

.AB02:
    ldx.b 0x03
    jmp (.AB07,X)

.AB07: d16[.AB0D, .AB2F, .AB45]

.AB0D:
    bit.b 0x0F
    bpl .AB1C

    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    jsl 0x848F07
    rts

.AB1C:
    bvc .AB2A

    lda.b #0x87
    jsl _80888B.88B6
    lda.b #0x8A
    jsl _80888B.88B6
.AB2A:
    jsl 0x848EEA
    rts

.AB2F:
    lda.w 0x1F3C
    cmp.b #0x0B
    bne .AB40

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    jsl 0x848F07
.AB40:
    jsl 0x848EEA
    rts

.AB45:
    lda.b 0x0F
    bpl .AB4D

    lda.b #0x04
    sta.b 0x01
.AB4D:
    jsl 0x848EEA
    rts

.AB52:
    jml 0x828398

;-----

_80AB56:
    ldx.b 0x01
    jmp (.AB5B,X)

.AB5B: d16[.AB61, .AB96, .ABAA]

.AB61:
    lda.b #0x02
    sta.b 0x01
    lda.l 0x7F829B
    sta.b 0x18
    lda.l 0x7F839B
    sta.b 0x11
    stz.b 0x12
    lda.b #0xA8
    sta.b 0x16
    lda.b #0x0E
    jsl 0x848F07
    rep #0x20
    ldx.b 0x0B
    lda.w 0x8D14,X
    asl
    asl
    tax
    lda.w 0xEEBA,X
    asl
    asl
    sta.b 0x1A
    lda.w 0xEEBC,X
    asl
    asl
    sta.b 0x1C
    rtl

.AB96:
    jsl _82808F.80B4
    lda.b 0x0E
    bne .ABA2

    lda.b #0x04
    sta.b 0x01
.ABA2:
    jsl 0x848EEA
    jml _828174.820A

.ABAA:
    jml 0x828398

;-----

_80ABAE:
    pea 0x0E68
    pld
.ABB2:
    inc.w 0x0B9C
    ldx.b 0x01
    jsr (.ABC8,X)
    lda.b 0x35
    bne .ABC3

    jsr _80AF53
    bra .ABB2

.ABC3:
    pea 0x0000
    pld
    rts

.ABC8: d16[.ABCE, .ACB8, .AF19]

.ABCE:
    lda.b #0x02
    sta.b 0x01
    pea 0x0000
    pld
    lda.b #0x09
    sta.w snes_regs.bgmode
    lda.b #0x13
    sta.w 0x00C0
    lda.b #0x04
    sta.w 0x1F12
    sta.w 0x1F11
    lda.b #0x27
    jsr _808799
    rep #0x30
    ldy.w #0x0170
    jsl _828000.8011
    sep #0x30
    ldy.b #0x12
    jsl _828000.8011
    ldy.b #0x20
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x54
    jsr _80B2FF
    jsr _808099.8100
    lda.w 0x1F7A
    asl
    clc
    adc.b #0x56
    tay
    jsr _80B2FF
    jsr _808099.8100
    lda.w 0x1F7A
    clc
    adc.b #0x1A
    sta.w 0x1F7A
    jsr _80BAD5
    lda.w 0x1F7A
    sec
    sbc.b #0x1A
    sta.w 0x1F7A
    rep #0x20
    lda.w 0x1F99
    bit.w #0x0002
    beq .AC57

    lda.w #0x006A
    sta.l 0x7E2556
    lda.w #0x006B
    sta.l 0x7E255A
    lda.w #0x0068
    sta.l 0x7E2576
    lda.w #0x0069
    sta.l 0x7E257A
.AC57:
    stz.w 0x1E4D
    stz.w 0x1E50
    stz.w 0x1E8D
    lda.w #0x0200
    sta.w 0x1E90
    sep #0x20
    inc.w 0x1E9A
    jsr _80B582
    jsr _80B582.B58B
    inc.w 0x1E48
    inc.w 0x1E88
    lda.b #0x04
    sta.w 0x1E49
    lda.b #0x0C
    sta.w 0x1E89
    stz.w 0x00C9
    stz.w 0x00CA
    stz.w 0x00CB
    stz.w 0x00CC
    stz.w 0x00CD
    stz.w 0x1F08
    lda.w 0x1F7A
    clc
    adc.b #0x1A
    sta.w 0x1F7A
    jsr _80B085.local
.AC9F:
    jsr _808099.8100
    lda.w 0x0040
    bne .AC9F

    lda.w 0x1F7A
    clc
    adc.b #0xE6
    sta.w 0x1F7A
    jsr _80895C
    pea 0x0E68
    pld
    rts

.ACB8:
    rep #0x20
    lda.w 0x1E4D
    sta.w 0x1E6A
    lda.w 0x1E50
    sta.w 0x1E6C
    lda.w 0x1E8D
    sta.w 0x1EAA
    lda.w 0x1E90
    sta.w 0x1EAC
    sep #0x20
    ldx.b 0x02
    jsr (.ACF0,X)
    lda.w 0x00A7
    ora.w 0x00A8
    beq .ACED

    lda.b #0x04
    sta.b 0x01
    ldy.b #0x04
    lda.b #0xF6
    jsl _808850.8868
.ACED:
    jmp 0x80AF5D

.ACF0: d16[
    .AD10, .AD29, .AD54, .AD6B, .AD86, .ADAD, .ADCE, .ADE6,
    .AE45, .AE63, .AE83, .AEAA, .AEE7, .AF0E, .AE06, .AE36,
]

.AD10:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x08
    sta.b 0x37
    stz.b 0x36
    rep #0x20
    lda.w #0x0800
    sta.b 0x1A
    lda.w #0xF800
    sta.b 0x1C
    sep #0x20
    rts

.AD29:
    jsr _80AF2A
    rep #0x20
    lda.w #0x0100
    cmp.w 0x1E90
    bcc .AD51

    sta.w 0x1E50
    sta.w 0x1E90
    sep #0x20
    lda.b #0x04
    sta.b 0x02
    lda.b #0xE0
    sta.b 0x33
    lda.b #0x37
    sta.w 0x00CA
    lda.b #0x2D
    jsl _80888B.88B6
.AD51:
    sep #0x20
    rts

.AD54:
    lda.b 0x33
    inc
    sta.b 0x33
    cmp.b #0xFF
    bne .AD61

    ldx.b #0x06
    stx.b 0x02
.AD61:
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    rts

.AD6B:
    rep #0x30
    lda.w #0x0000
    sta.w 0x1E4D
    lda.w #0x0200
    sta.w 0x1E8D
    sep #0x30
    jsl _80E02C
    lda.b #0x08
    sta.b 0x02
    jmp 0x80AF7E

.AD86:
    lda.w 0x1F27
    bne .AD9F

    lda.b #0x0A
    sta.b 0x02
    lda.b #0x17
    sta.w 0x00C0
    lda.b #0x00
    sta.w 0x1E4D
    lda.b #0x01
    sta.w 0x1E4E
    rts

.AD9F:
    rep #0x21
    lda.w 0x1E4D
    adc.w #0x0010
    sta.w 0x1E4D
    sep #0x20
    rts

.ADAD:
    lda.b 0x33
    dec
    sta.b 0x33
    cmp.b #0xE0
    bne .ADC2

    ldx.b #0x0C
    stx.b 0x02
    pha
    lda.b #0xC2
    jsl _80E9F6
    pla
.ADC2:
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    jmp 0x80B054

.ADCE:
    lda.w 0x0060
    bne .ADE3

    lda.b #0x0E
    sta.b 0x02
    lda.w 0x1F7A
    clc
    adc.b #0x02
    ora.b #0xC0
    jsl _80E9F6
.ADE3:
    jmp 0x80B054

.ADE6:
    lda.w 0x0060
    bne .AE03

    lda.b #0x1C
    sta.b 0x02
    lda.b #0x04
    sta.b 0x33
    lda.b #0x1F
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    lda.b #0x37
    sta.w 0x00CA
.AE03:
    jmp 0x80B054

.AE06:
    dec.b 0x33
    bne .AE33

    lda.b #0x1E
    sta.b 0x02
    rep #0x31
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    adc.w #0x01AE
    tay
    jsl _828000.8011
    sep #0x30
    lda.b #0x3C
    sta.b 0x33
    stz.w 0x00CB
    stz.w 0x00CC
    stz.w 0x00CD
    lda.b #0xB5
    sta.w 0x00CA
.AE33:
    jmp 0x80B054

.AE36:
    dec.b 0x33
    bne .AE42

    lda.b #0x10
    sta.b 0x02
    lda.b #0xE0
    sta.b 0x33
.AE42:
    jmp 0x80B054

.AE45:
    lda.b 0x33
    inc
    sta.b 0x33
    cmp.b #0xF0
    bne .AE57

    ldx.b #0x13
    stx.w 0x00C0
    ldx.b #0x12
    stx.b 0x02
.AE57:
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    jmp 0x80B054

.AE63:
    rep #0x21
    lda.w 0x1E8D
    adc.w #0xFFF0
    sta.w 0x1E8D
    cmp.w #0x0100
    bcs .AE80

    ldx.b #0x14
    stx.b 0x02
    lda.w #0x0100
    sta.w 0x1E8D
    jsr _80AFD4
.AE80:
    sep #0x20
    rts

.AE83:
    rep #0x20
    jsl _81812E
    lda.w #0x0180
    cmp.w 0x0BB0
    bcs .AEA7

    sta.w 0x0BB0
    sep #0x20
    lda.b #0x04
    sta.w 0x0BD3
    lda.b #0x16
    sta.b 0x02
    lda.b #0x14
    sta.b 0x33
    lda.b #0xF0
    sta.b 0x34
.AEA7:
    sep #0x20
    rts

.AEAA:
    dec.b 0x34
    bne .AEC3

    lda.b #0x18
    sta.b 0x02
    lda.b #0x34
    sta.w 0x0BAA
    stz.w 0x0BAB
    ldy.b #0x02
    lda.b #0xF6
    jsl _808850.8868
    rts

.AEC3:
    stz.w 0x0BE3
    dec.b 0x33
    bne .AEE2

    lda.b 0x34
    cmp.b #0x78
    bcc .AEE2

    lda.b #0x14
    ldx.w 0x1F7A
    cpx.b #0x04
    bne .AEDB

    lda.b #0x02
.AEDB:
    sta.b 0x33
    lda.b #0x40
    sta.w 0x0BE3
.AEE2:
    jsl _81812E
    rts

.AEE7:
    jsl _81812E
    rep #0x20
    lda.w 0x0BB0
    cmp.w #0x0100
    sep #0x20
    bcs .AF0D

    lda.b #0x1A
    sta.b 0x02
    lda.b #0x20
    sta.b 0x34
    rep #0x20
    lda.w #0x0800
    sta.b 0x1A
    lda.w #0xF800
    sta.b 0x1C
    sep #0x20
.AF0D:
    rts

.AF0E:
    dec.b 0x34
    bne .AF16

    lda.b #0x04
    sta.b 0x01
.AF16:
    jmp 0x80AF2A

.AF19:
    inc.b 0x35
    phd
    pea 0x0000
    pld
    jsr _80897E
    ldx.b #0x30
    jsr _808147
    pld
    rts

;-----

_80AF2A:
    rep #0x21
    lda.w 0x1E4F
    adc.b 0x1A
    sta.w 0x1E4F
    sep #0x20
    lda.w 0x1E51
    adc.b #0x00
    sta.w 0x1E51
    rep #0x21
    lda.w 0x1E8F
    adc.b 0x1C
    sta.w 0x1E8F
    sep #0x20
    lda.w 0x1E91
    adc.b #0xFF
    sta.w 0x1E91
    rts

;-----

_80AF53:
    phd
    pea 0x0000
    pld
    jsr _808099.8100
    pld
    rts

;-----

_80AF5D:
    php
    phd
    jsr _80D3F1
    jsr _80D359
    jsr _80DDEF
    jsr _80DEEF
    jsr _80D2D1
    jsr _80D44E
    pea 0x0000
    pld
    jsr _80D583
    pld
    plp
    stz.w 0x1F0D
    rts

;-----

_80AF7E:
    rep #0x10
    lda.w 0x1F99
    and.b #0x0F
    sta.w 0x0000
    ldy.w #0x0003
    ldx.w #0x1928
.AF8E:
    lsr.w 0x0000
    bcc .AFC4

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x06
    sta.w 0x0002,X
    tya
    clc
    adc.b #0x21
    sta.w 0x000B,X
    lda.b #0x20
    sta.w 0x0011,X
    rep #0x20
    lda.w #0x0148
    sta.w 0x0005,X
    lda.w #0x016E
    cpy.w #0x0000
    bne .AFBF

    lda.w #0x019E
.AFBF:
    sta.w 0x0008,X
    sep #0x20
.AFC4:
    rep #0x20
    txa
    clc
    adc.w #0x0020
    tax
    sep #0x20
    dey
    bpl .AF8E

    sep #0x10
    rts

;-----

_80AFD4:
    sep #0x20
    lda.w 0x1F7A
    sta.b 0x33
    stz.w 0x1F7A
    stz.w 0x0BA9
    lda.b #0x10
    tsb.w 0x0C26
    jsl _81812E
    lda.b #0x40
    sta.w 0x0C11
    ora.b #0x32
    sta.w 0x0BB9
    stz.w 0x0BD7
    lda.b #0x01
    sta.w 0x0C0C
    lda.b #0x10
    sta.w 0x0BCF
    lda.b 0x33
    asl
    sta.w 0x0BDB
    tax
    lda.b #0xFF
    sta.w 0x1F86,X
    lda.b 0x33
    sta.w 0x1F7A
    lda.w 0x0BDB
    clc
    adc.b #0x3E
    tay
    jsl _808A64
    lda.w 0x0BDB
    lsr
    tax
    lda.w 0xBABB,X
    sta.w 0x0C0F
    ldx.b #0x30
    lda.w 0x0BDB
    clc
    adc.b #0x40
    tay
    jsl _828000
    rep #0x31
    lda.w 0x0BDB
    and.w #0x00FF
    adc.w #0x0100
    tay
    jsl _828000.8011
    sep #0x10
    lda.w #0x0140
    sta.w 0x0BAD
    lda.w #0x0100
    sta.w 0x0BB0
    rts

;-----

_80B054:
    dec.b 0x37
    bne .B084

    lda.b #0x08
    sta.b 0x37
    lda.b 0x36
    eor.b #0x80
    sta.b 0x36
    bpl .B079

    rep #0x31
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    adc.w #0x01C0
    tay
    jsl _828000.8011
    sep #0x30
    bra .B084

.B079:
    rep #0x10
    ldy.w #0x01C0
    jsl _828000.8011
    sep #0x10
.B084:
    rts

;-----

_80B085:
    jsr .local
    rtl

.local:
    phx
    phy
    php
    phd
    rep #0x20
    sep #0x10
    lda.w #0x0000
    tcd
    lda.w #_80B0A5
    ldx.b #0x10
    stx.w 0x0040
    jsr _80813B
    pld
    plp
    ply
    plx
    rts

;-----

_80B0A5:
    rep #0x30
    lda.w #0x0000
    tcd
    stz.b 0xF8
    stz.b 0x48
    stz.b 0x49
    lda.w 0x1F08
    and.w #0x00FF
    asl
    sta.b 0x00
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    tax
    lda.w 0x86ACF1,X
    clc
    adc.b 0x00
    tax
    lda.w 0x86ACF1,X
    tax
    sep #0x20
.B0CF:
    lda.w 0x86ACF1,X
    cmp.b #0xFF
    beq .B11F

    sta.b 0x98
    jsr _80B24C.local
.B0DB:
    jsr _808099.8100
    lda.b 0xF4
    bne .B0DB

    lda.w 0x86ACF2,X
    sta.b 0x48
    lda.w 0x86ACF3,X
    sta.b 0x49
    jsr _80B16B.local
    lda.w 0x86ACF5,X
    xba
    lda.w 0x86ACF4,X
    tay
    phx
    lda.w 0x86ACF6,X
    tax
    lsr
    lsr
    lsr
    tsb.b 0x4A
    jsl _828000
    lda.b #0x00
    xba
    lda.b 0x98
    tax
    lda.b 0x4A
    ora.b #0x20
    sta.l 0x7F8300,X
    plx
    inx
    inx
    inx
    inx
    inx
    inx
    jsr _808099.8100
    bra .B0CF

.B11F:
    lda.b #0x04
    sta.l 0x7F830A
    stz.w 0x0040
    jmp 0x8080F8

;-----

_80B12B:
    php
    rep #0x30
    ldx.w #0x03FE
    lda.w #0x0000
.B134:
    sta.l 0x7F8000,X
    dex
    dex
    bpl .B134

    plp
    rts

;-----

_80B13E:
    ldx.w #0x00FE
    lda.w #0x0000
.B144:
    sta.l 0x7F8200,X
    dex
    dex
    bpl .B144

rts

;-----

_80B14D:
    ldx.w #0x00FE
    lda.w #0x0000
.B153:
    sta.l 0x7F8300,X
    dex
    dex
    bpl .B153

rts

;-----

_80B15C:
    ldx.w #0x01FE
    lda.w #0x0000
.B162:
    sta.l 0x7F8000,X
    dex
    dex
    bpl .B162

    rts

;-----

_80B16B:
    jsr .local
    rtl

.local:
    phx
    phy
    phd
    rep #0x20
    lda.w #0x0000
    tcd
    lda.b 0x98
    and.w #0x00FF
    asl
    tax
    lda.l 0x7F8000,X
    sta.b 0xED
    lda.w 0x86F1BA,X
    clc
    adc.w #0xF1BA
    tay
    lda.b 0xA3
    and.w #0x00FF
    tax
    stz.b 0xEF
    sep #0x20
    lda 0x0000,Y
    bne .B19F

    jmp 0x80B231

.B19F:
    lda.w 0x1F25
    cmp.b #0x20
    bcc .B1B1

    jsr _808099.8100
    lda.b #0x00
    xba
    lda.b 0xA3
    tax
    bra .B19F

.B1B1:
    lda 0x0000,Y
    cmp.b #0xFF
    bne .B1C9

.B1B8:
    jsr _808099.8100
    lda.w 0x1F25
    cmp.b #0x20
    bcs .B1B8

    lda.b #0x00
    xba
    lda.b 0xA3
    tax
    iny
.B1C9:
    lda.b #0x80
    sta.w 0x0500,X
    lda 0x0000,Y
    lsr
    clc
    adc.w 0x1F25
    sta.w 0x1F25
    lda 0x0000,Y
    rep #0x20
    and.w #0x00FF
    asl
    asl
    asl
    asl
    sta.w 0x0503,X
    sta.b 0x00
    lda.b 0xED
    clc
    adc.b 0xEF
    sta.w 0x0505,X
    lda.b 0xEF
    clc
    adc.b 0x00
    sta.b 0xEF
    sep #0x20
    lda.b #0x7F
    sta.w 0x0507,X
    lda.b 0x48
    sta.w 0x0501,X
    lda 0x0001,Y
    bmi .B222

    and.b #0x7F
    clc
    adc.b 0x49
    sta.w 0x0502,X
    rep #0x21
    iny
    iny
    txa
    adc.w #0x08
    tax
    sep #0x20
    sta.b 0xA3
    jmp .B19F

.B222:
    sep #0x20
    and.b #0x7F
    clc
    adc.b 0x49
    sta.w 0x0502,X
    txa
    adc.b #0x08
    sta.b 0xA3
.B231:
    rep #0x20
    lda.b 0x98
    and.w #0x00FF
    tax
    lda.b 0x48
    lsr
    lsr
    lsr
    lsr
    sep #0x20
    sta.l 0x7F8200,X
    xba
    sta.b 0x4A
    pld
    ply
    plx
    rts

;-----

_80B24C:
    jsr .local
    rtl

.local:
    phx
    phy
    php
    phd
    rep #0x20
    sep #0x10
    lda.w #0x0000
    tcd
    lda.w #decompress
    ldx.b #0x60
    jsr _80813B
    sep #0x20
    lda.b #0x01
    sta.b 0xF4
    pld
    plp
    ply
    plx
    rts

;-----

decompress:
    rep #0x30
    lda.w #0x0000
    tcd
    lda.b 0x98
    and.w #0x00FF
    sta.b 0x00
    asl
    tax
    asl
    clc
    adc.b 0x00
    tay
    lda.b 0xF8
    sta.l 0x7F8000,X
    lda compressed_data+0,Y
    adc.w #0x07
    lsr
    lsr
    lsr
    sta.b 0xFA
    stz.b 0xF5
    sep #0x20
    lda compressed_data+4,Y
    sta.b 0xF7
    ldx.w compressed_data+2,Y
    txy
    ldx.b 0xF8
.B2A3:
    lda [0xF5],Y
    sta.b 0x00
    iny
    bne .B2AF

    ldy.w #0x8000
    inc.b 0xF7
.B2AF:
    lda [0xF5],Y
    sta.b 0x01
    iny
    bne .B2BB

    ldy.w #0x8000
    inc.b 0xF7
.B2BB:
    lda.b #0x08
    sta.b 0x02
.B2BF:
    asl.b 0x00
    bcs .B2C7

    lda.b 0x01
    bra .B2D1

.B2C7:
    lda [0xF5],Y
    iny
    bne .B2D1

    ldy.w #0x8000
    inc.b 0xF7
.B2D1:
    sta.l 0x7F0000,X
    inx
    dec.b 0x02
    bne .B2BF

    lda.b 0xFA
    and.b #0x1F
    bne .B2EB

    phx
    phy
    php
    phb
    jsr _808099.8121
    plb
    plp
    ply
    plx
.B2EB:
    rep #0x20
    dec.b 0xFA
    sep #0x20
    bne .B2A3

    cpx.w #0x8000
.overflow:
    bcs .overflow

    stx.b 0xF8
    stz.b 0xF4
    jmp 0x8080F8

;-----

_80B2FF:
    rep #0x20
    stz.b 0xF8
    lda 0x86F572,Y
    sta.b 0x10
    ldy.b #0x00
    ldx.b 0xA3
.B30C:
    lda (0x10),Y
    iny
    and.w #0x00FF
    cmp.w #0x00FF
    beq .B37F

    sep #0x20
    sta.b 0x98
    rep #0x20
    jsr _80B24C.local
.B320:
    jsr _808099.8100
    lda.b 0xF4
    bne .B320

    phx
    rep #0x10
    lda.b 0x98
    and.w #0x00FF
    asl
    tax
    lda.l 0x7F8000,X
    sta.b 0x06
    sta.b 0xF8
    sep #0x10
    plx
    stz.b 0x02
.B33E:
    lda (0x10),Y
    iny
    iny
    sta.w 0x0503,X
    sta.b 0x08
    lda (0x10),Y
    iny
    iny
    sta.b 0x04
    and.w #0x7FFF
    sta.w 0x0501,X
    lda.w #0x0000
    clc
    adc.b 0x06
    clc
    adc.b 0x02
    sta.w 0x0505,X
    lda.b 0x02
    clc
    adc.b 0x08
    sta.b 0x02
    sep #0x20
    lda.b #0x7F
    sta.w 0x0507,X
    lda.b #0x80
    sta.w 0x0500,X
    txa
    clc
    adc.b #0x08
    tax
    rep #0x20
    lda.b 0x04
    bpl .B33E

    bra .B30C

.B37F:
    sep #0x20
    stx.b 0xA3
    rts

;-----

_80B384:
    jsr .local
    rtl

.local:
    phx
    phy
    php
    phd
    rep #0x20
    sep #0x10
    lda.w #0x0000
    tcd
    lda.w #0xB3A1
    ldx.b #0x10
    jsr _80813B
    pld
    plp
    ply
    plx
    rts

;-----

_80B3A1:
    rep #0x20
    sep #0x10
    stz.b 0xF8
    ldy.b 0xF1
    lda 0x86F572,Y
    sta.b 0xF2
    ldy.b #0x00
    ldx.b 0xA3
.B3B2:
    lda (0xF2),Y
    iny
    and.w #0x00FF
    cmp.w #0x00FF
    beq .B423

    sep #0x20
    sta.b 0x98
    rep #0x20
    jsr _80B24C.local
.B3C6:
    jsr _808099.8100
    lda.b 0xF4
    bne .B3C6

    phx
    rep #0x10
    lda.b 0x98
    and.w #0xFF
    asl
    tax
    lda.l 0x7F8000,X
    sta.b 0x06
    sep #0x10
    plx
    stz.b 0x02
.B3E2:
    lda (0xF2),Y
    iny
    iny
    sta.w 0x0503,X
    sta.b 0x08
    lda (0xF2),Y
    iny
    iny
    sta.b 0x04
    and.w #0x7FFF
    sta.w 0x0501,X
    lda.w #0x0000
    clc
    adc.b 0x06
    clc
    adc.b 0x02
    sta.w 0x0505,X
    lda.b 0x02
    clc
    adc.b 0x08
    sta.b 0x02
    sep #0x20
    lda.b #0x7F
    sta.w 0x0507,X
    lda.b #0x80
    sta.w 0x0500,X
    txa
    clc
    adc.b #0x08
    tax
    rep #0x20
    lda.b 0x04
    bpl .B3E2

    bra .B3B2

.B423:
    sep #0x20
    stx.b 0xA3
    jmp 0x8080F8

;-----

_80B42A:
    jsr .local
    rtl

.local:
    phx
    phy
    php
    phd
    rep #0x20
    sep #0x10
    lda.w #0x0000
    tcd
    lda.w #0xB44A
    ldx.b #0x20
    stx.w 0x0050
    jsr _80813B
    pld
    plp
    ply
    plx
    rts

;-----

_80B44A:
    rep #0x30
    lda.w #0x0000
    tcd
    lda.w 0x1F09
    and.w #0x00FF
    asl
    sta.b 0x00
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    tax
    lda.w 0x86A1D8,X
    clc
    adc.b 0x00
    tax
    lda.w 0x86A1D8,X
    tax
.B46C:
    lda.w 0x86A1D8,X
    beq .B4EE

    sta.b 0x58
    stz.b 0x5A
.B475:
    lda.w 0x1F25
    and.w #0x00FF
    cmp.w #0x0020
    bcc .B485

    jsr _808099.8100
    bra .B475

.B485:
    ldy.b 0xA3
    lda.w #0x0080
    sta 0x0500,Y
    lda.b 0x58
    sec
    sbc.w #0x0400
    sta.b 0x00
    bcs .B49E

    lda.b 0x58
    sta 0x0503,Y
    bra .B4A4

.B49E:
    lda.w #0x0400
    sta 0x0503,Y
.B4A4:
    lda.b 0x00
    sta.b 0x58
    lda.b 0x5A
    lsr
    clc
    adc.w 0x86A1DA,X
    sta 0x0501,Y
    lda.w 0x86A1DC,X
    clc
    adc.b 0x5A
    sta 0x0505,Y
    lda.b 0x5A
    clc
    adc.w #0x0400
    sta.b 0x5A
    sep #0x20
    lda.w 0x86A1DE,X
    sta 0x0507,Y
    tya
    clc
    adc.b #0x08
    sta.b 0xA3
    rep #0x20
    jsr _808099.8100
    lda.b 0x58
    beq .B4DC

    bpl .B475

.B4DC:
    ldy.w 0x86A1DF,X
    phx
    jsl _828000.8011
    plx
    txa
    clc
    adc.w #0x09
    tax
    jmp 0x80B46C

.B4EE:
    jmp 0x8080F8

;-----

_80B4F1:
    phd
    pea 0x0000
    pld
    jsr .B4FB
    pld
    rtl

.B4FB:
    php
    rep #0x30
    stz.b 0x02
    lda.w 0x1F7A
    and.w #0xFF
    cmp.w #0x04
    beq .B51C

    cmp.w #0x06
    bne .B526

    bit.w 0x1F8F
    bvc .B526

    lda.w #0x0A
    sta.b 0x02
    bra .B526

.B51C:
    bit.w 0x1F95
    bvc .B526

    lda.w #0x0A
    sta.b 0x02
.B526:
    lda.w 0x1F0A
    and.w #0xFF
    asl
    clc
    adc.b 0x02
    sta.b 0x00
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    tay
    lda 0x86A263,Y
    clc
    adc.b 0x00
    tay
    lda 0x86A263,Y
    tay
.B545:
    lda 0x86A263,Y
    cmp.w #0xFFFF
    beq .B57D

    sta.b 0x10
    lda.w #0x0085
    sta.b 0x12
    lda 0x86A265,Y
    and.w #0x00FF
    asl
    tax
    pea 0x8685
    plb
    phy
    lda.w #0x0010
    sta.b 0x02
    ldy.w #0x0000
.B569:
    lda (0x10),Y
    sta.w 0x0300,X
    inx
    inx
    iny
    iny
    dec.b 0x02
    bne .B569

    ply
    iny
    iny
    iny
    plb
    bra .B545

.B57D:
    inc.w 0x00A1
    plp
    rts

;-----

_80B582:
    phb
    php
    rep #0x30
    jsr _80BA67
    bra .B592

.B58B:
    phb
    php
    rep #0x30
    jsr _80BA9E
.B592:
    lda.w #0x00F0
.B595:
    jsr _80B5A9
    bmi .B5A6

    jsr _80B5A9
    bmi .B5A6

    pha
    jsr _808099.8100
    pla
    bra .B595

.B5A6:
    plp
    plb
    rts

;-----

_80B5A9:
    pha
    clc
    adc.w 0x1FA5
    sta.b 0x02
    lda.w 0x1FA3
    sta.b 0x00
    jsr _80B67C
    pla
    sec
    sbc.w #0x0010
    rts

;-----

_80B5BE:
    phb
    phd
    php
    rep #0x30
    lda.w #0x0000
    tcd
    jsr _80BA9E
    jsr _80B67C
    plp
    pld
    plb
    rts

;-----

_80B5D1:
    phb
    phd
    php
    rep #0x30
    lda.w #0x0000
    tcd
    jsr _80BA9E
    jsr _80B674
    plp
    pld
    plb
    rts

;-----

_80B5E4:
    php
    phd
    phb
    rep #0x30
    lda.w #0x0000
    tcd
    jsr _80BA67
    bra .B5FE

.B5F2:
    php
    phd
    phb
    rep #0x30
    lda.w #0x0000
    tcd
    jsr _80BA9E
.B5FE:
    jsr _80B612
    beq .B606

    jsr _80B634
.B606:
    jsr _80B623
    beq .B60E

    jsr _80B654
.B60E:
    plb
    pld
    plp
    rts

;-----

_80B612:
    lda.w 0x1FA3
    and.w #0xFFF8
    sta.b 0x00
    lda.w 0x1FA7
    and.w #0xFFF8
    cmp.b 0x00
    rts

;-----

_80B623:
    lda.w 0x1FA5
    and.w #0xFFF8
    sta.b 0x00
    lda.w 0x1FA9
    and.w #0xFFF8
    cmp.b 0x00
    rts

;-----

_80B634:
    bmi .B643

    lda.w 0x1FA3
    sta.b 0x00
    lda.w 0x1FA5
    sta.b 0x02
    jmp 0x80B674

.B643:
    lda.w 0x1FA3
    clc
    adc.w #0x0100
    sta.b 0x00
    lda.w 0x1FA5
    sta.b 0x02
    jmp 0x80B674

;-----

_80B654:
    bmi .B663

    lda.w 0x1FA5
    sta.b 0x02
    lda.w 0x1FA3
    sta.b 0x00
    jmp 0x80B67C

.B663:
    lda.w 0x1FA5
    clc
    adc.w #0x00E8
    sta.b 0x02
    lda.w 0x1FA3
    sta.b 0x00
    jmp 0x80B67C

;-----

_80B674:
    php
    rep #0x30
    jsr _80B684
    plp
    rts

;-----

_80B67C:
    php
    rep #0x30
    jsr _80B79B
    plp
    rts

;-----

_80B684:
    jsr _80B9C9
    lda.b 0x10
    and.w #0xFC1F
    sep #0x20
    rep #0x10
    ldx.w 0x00A5
    sta.l 0x7EF001,X
    inc
    sta.l 0x7EF045,X
    xba
    sta.l 0x7EF002,X
    sta.l 0x7EF046,X
    lda.b #0x81
    sta.l 0x7EF000,X
    sta.l 0x7EF044,X
    lda.b #0x40
    sta.l 0x7EF003,X
    sta.l 0x7EF047,X
    inx
    inx
    inx
    inx
    rep #0x30
    lda.b 0x02
    and.w #0x00F0
    lsr
    lsr
    pha
    sta.b 0x0E
    txa
    clc
    adc.b 0x0E
    tax
    pla
    lsr
    lsr
    sta.b 0x04
    lda.w #0x0010
    sta.b 0x06
    sec
    sbc.b 0x04
    sta.b 0x04
.B6DD:
    sep #0x20
    lda.b #0x7E
    pha
    plb
    lda (0x14)
    rep #0x20
    and.w #0xFF
    xba
    asl
    clc
    adc.l 0x001FAB
    sta.b 0x0E
    lda.b 0x00
    and.w #0x00F0
    lsr
    lsr
    lsr
    clc
    adc.b 0x0E
    sta.b 0x0E
    lda.b 0x02
    and.w #0x00F0
    asl
    clc
    adc.b 0x0E
    sta.b 0x18
.B70B:
    sep #0x20
    lda.b #0x7E
    pha
    plb
    rep #0x20
    lda (0x18)
    asl
    asl
    asl
    clc
    adc.l 0x001FAD
    sta.b 0x1C
    sep #0x20
    lda.l 0x001FAF
    pha
    plb
    rep #0x20
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta.l 0x7EF000,X
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta.l 0x7EF044,X
    inx
    inx
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta.l 0x7EF000,X
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta.l 0x7EF044,X
    inx
    inx
    lda.b 0x18
    clc
    adc.w #0x0020
    sta.b 0x18
    dec.b 0x06
    beq .B78C

    dec.b 0x04
    bne .B70B

    txa
    sec
    sbc.w #0x40
    tax
    lda.b 0x14
    sec
    sbc.w 0x1FB0
    clc
    adc.w #0x0020
    and.w #0x03FF
    clc
    adc.w 0x1FB0
    sta.b 0x14
    lda.b 0x02
    and.w #0xFF00
    clc
    adc.w #0x0100
    sta.b 0x02
    jmp 0x80B6DD

.B78C:
    rep #0x20
    lda.w 0x00A5
    clc
    adc.w #0x88
    sta.w 0x00A5
    rep #0x20
    rts

;-----

_80B79B:
    jsr _80B9C9
    lda.b 0x00
    and.w #0x00F0
    lsr
    lsr
    lsr
    lsr
    sta.b 0x04
    lda.w #0x0010
    sec
    sbc.b 0x04
    sta.b 0x04
    lda.w #0x0012
    sec
    sbc.b 0x04
    sta.b 0x06
    lda.w 0x00A5
    and.w #0x07FF
    clc
    adc.w #0xF000
    sta.b 0x20
    lda.b 0x04
    asl
    asl
    adc.w #0x04
    adc.b 0x20
    sta.b 0x24
    lda.w #0x7E
    sta.b 0x22
    sta.b 0x26
.B7D7:
    sep #0x30
    ldy.b #0x00
    lda.b #0x80
    sta [0x20],Y
    sta [0x24],Y
    iny
    rep #0x20
    lda.b 0x10
    sta [0x20],Y
    clc
    adc.w #0x20
    sta [0x24],Y
    iny
    iny
    sep #0x20
    lda.b 0x04
    asl
    asl
    sta [0x20],Y
    sta [0x24],Y
    iny
    sep #0x20
    lda.b #0x7E
    pha
    plb
    lda (0x14)
    rep #0x20
    and.w #0xFF
    xba
    asl
    clc
    adc.l 0x001FAB
    sta.b 0x0E
    lda.b 0x00
    and.w #0xF0
    lsr
    lsr
    lsr
    clc
    adc.b 0x0E
    sta.b 0x0E
    lda.b 0x02
    and.w #0xF0
    asl
    clc
    adc.b 0x0E
    sta.b 0x18
.B829:
    sep #0x20
    lda.b #0x7E
    pha
    plb
    rep #0x20
    lda (0x18)
    asl
    asl
    asl
    clc
    adc.l 0x001FAD
    sta.b 0x1C
    sep #0x20
    lda.l 0x001FAF
    pha
    plb
    rep #0x20
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta [0x20],Y
    iny
    iny
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta [0x20],Y
    dey
    dey
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta [0x24],Y
    iny
    iny
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta [0x24],Y
    iny
    iny
    inc.b 0x18
    inc.b 0x18
    dec.b 0x04
    bne .B829

    lda.b 0x06
    beq .B8C9

    tya
    clc
    adc.b 0x24
    sta.b 0x20
    lda.b 0x06
    cmp.w #0x0010
    bcc .B895

    sec
    sbc.w #0x0010
    sta.b 0x06
    lda.w #0x0010
    sta.b 0x04
    bra .B899

.B895:
    sta.b 0x04
    stz.b 0x06
.B899:
    asl
    asl
    clc
    adc.w #0x04
    adc.b 0x20
    sta.b 0x24
    lda.b 0x14
    inc
    and.w #0x1F
    sta.b 0x0E
    lda.b 0x14
    and.w #0xFFE0
    ora.b 0x0E
    sta.b 0x14
    lda.b 0x00
    ora.w #0xFF
    inc
    sta.b 0x00
    lda.b 0x10
    eor.w #0x0400
    and.w #0xFFE0
    sta.b 0x10
    jmp 0x80B7D7

.B8C9:
    tya
    clc
    adc.b 0x24
    sec
    sbc.w #0xF000
    sta.w 0x00A5
    rts

;-----

_80B8D5:
    jsr .local
    rtl

.local:
    phb
    phd
    php
    rep #0x30
    lda.w #0x0000
    tcd
    jsr _80BA67
    lda.b 0x00
    sec
    sbc.w 0x1FA3
    clc
    adc.w #0x10
    bpl .B8F4

    jmp 0x80B9C5

.B8F4:
    cmp.w #0x0120
    bmi .B8FC

    jmp 0x80B9C5

.B8FC:
    lda.b 0x02
    sec
    sbc.w 0x1FA5
    clc
    adc.w #0x10
    bpl .B90B

    jmp 0x80B9C5

.B90B:
    cmp.w #0x0100
    bmi .B913

    jmp 0x80B9C5

.B913:
    jsr _80B9C9
    sep #0x20
    rep #0x10
    ldx.w 0x00A5
    lda.b #0x80
    sta.l 0x7EF000,X
    sta.l 0x7EF008,X
    inx
    rep #0x20
    lda.b 0x10
    sta.l 0x7EF000,X
    clc
    adc.w #0x20
    sta.l 0x7EF008,X
    inx
    inx
    sep #0x20
    lda.b #0x04
    sta.l 0x7EF000,X
    sta.l 0x7EF008,X
    inx
    sep #0x20
    lda.b #0x7E
    pha
    plb
    lda (0x14)
    rep #0x20
    and.w #0xFF
    xba
    asl
    clc
    adc.l 0x001FAB
    sta.b 0x0E
    lda.b 0x00
    and.w #0xF0
    lsr
    lsr
    lsr
    clc
    adc.b 0x0E
    sta.b 0x0E
    lda.b 0x02
    and.w #0xF0
    asl
    clc
    adc.b 0x0E
    sta.b 0x18
    sep #0x20
    lda.b #0x7E
    pha
    plb
    rep #0x20
    lda (0x18)
    asl
    asl
    asl
    clc
    adc.l 0x001FAD
    sta.b 0x1C
    sep #0x20
    lda.l 0x001FAF
    pha
    plb
    rep #0x20
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta.l 0x7EF000,X
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta.l 0x7EF002,X
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta.l 0x7EF008,X
    lda (0x1C)
    inc.b 0x1C
    inc.b 0x1C
    sta.l 0x7EF00A,X
    lda.w 0x00A5
    clc
    adc.w #0x10
    sta.w 0x00A5
.B9C5:
    plp
    pld
    plb
    rts

;-----

_80B9C9:
    lda.b 0x00
    and.w #0x0100
    asl
    asl
    clc
    adc.w 0x1FA1
    sta.b 0x10
    lda.b 0x00
    and.w #0xF0
    lsr
    lsr
    lsr
    sta.b 0x0E
    lda.b 0x02
    and.w #0xF0
    asl
    asl
    clc
    adc.b 0x0E
    adc.b 0x10
    sta.b 0x10
    lda.b 0x00
    xba
    and.w #0x001F
    sta.b 0x0E
    lda.b 0x02
    and.w #0x1F00
    lsr
    lsr
    lsr
    clc
    adc.b 0x0E
    adc.w 0x1FB0
    sta.b 0x14
    rts

;-----

_80BA07:
    php
    sep #0x20
    rep #0x10
    ldx.b 0xA5
    beq .BA65

    lda.b #0x01
    sta.w snes_regs.dmap0
    lda.b #0x18
    sta.w snes_regs.bbad0
    clc
    ldx.w #0x0000
.BA1E:
    sep #0x20
    lda.l 0x7EF000,X
    sta.w snes_regs.vmain
    rep #0x20
    lda.l 0x7EF001,X
    sta.w snes_regs.vmaddl
    lda.l 0x7EF003,X
    and.w #0x00FF
    sta.w snes_regs.das0l
    pha
    inx
    inx
    inx
    inx
    txa
    clc
    adc.w #0xF000
    sta.w snes_regs.a1t0l
    sep #0x20
    lda.b #0x7E
    sta.w snes_regs.a1b0
    lda.b #0x01
    sta.w snes_regs.mdmaen
    rep #0x20
    txa
    adc 0x01,S
    plx
    cmp.w #0x0800
.BA5C:
    bcs .BA5C

    tax
    cpx.b 0xA5
    bne .BA1E

    stz.b 0xA5
.BA65:
    plp
    rts

;-----

_80BA67:
    lda.w #0x5000
    sta.w 0x1FA1
    lda.w 0x1E4D
    sta.w 0x1FA3
    lda.w 0x1E50
    sta.w 0x1FA5
    lda.w 0x1E6A
    sta.w 0x1FA7
    lda.w 0x1E6C
    sta.w 0x1FA9
    lda.w #0xE800
    sta.w 0x1FB0
    lda.w #0x2000
    sta.w 0x1FAB
    lda.w 0x0B95
    sta.w 0x1FAD
    lda.w 0x0B96
    sta.w 0x1FAE
    rts

;-----

_80BA9E:
    lda.w #0x5800
    sta.w 0x1FA1
    lda.w 0x1E8D
    sta.w 0x1FA3
    lda.w 0x1E90
    sta.w 0x1FA5
    lda.w 0x1EAA
    sta.w 0x1FA7
    lda.w 0x1EAC
    sta.w 0x1FA9
    lda.w #0xEC00
    sta.w 0x1FB0
    lda.w #0xA600
    sta.w 0x1FAB
    lda.w 0x0B98
    sta.w 0x1FAD
    lda.w 0x0B99
    sta.w 0x1FAE
    rts

;-----

_80BAD5:
    php
    sep #0x30
    jsr _80BC59
    lda.w 0x1F7A
    asl
    clc
    adc.w 0x1F7A
    tax
    rep #0x20
    stz.b 0xD7
    lda.w 0x868D24,X
    sta.b 0x10
    lda.w 0x868D26,X
    sta.b 0x12
    lda.w 0x868D93,X
    sta.b 0x18
    lda.w 0x868D95,X
    sta.b 0x1A
    lda.w 0x868E02,X
    sta.b 0x20
    lda.w 0x868E04,X
    sta.b 0x22
    lda.w 0x868E71,X
    sta.w 0x0B95
    lda.w 0x868EE0,X
    sta.w 0x0B92
    sep #0x20
    lda.w 0x868E73,X
    sta.w 0x0B97
    lda.w 0x868EE2,X
    sta.w 0x0B94
    jsr _80BB68
    jsr _80BC70
    sep #0x30
    lda.w 0x1F7A
    asl
    clc
    adc.w 0x1F7A
    tax
    rep #0x20
    inc.b 0xD7
    inc.b 0xD7
    lda.w 0x868F4F,X
    sta.b 0x10
    lda.w 0x868F51,X
    sta.b 0x12
    lda.w 0x868FBE,X
    sta.b 0x18
    lda.w 0x868FC0,X
    sta.b 0x1A
    lda.w 0x86902D,X
    sta.b 0x20
    lda.w 0x86902F,X
    sta.b 0x22
    lda.w 0x86909C,X
    sta.w 0x0B98
    sep #0x20
    lda.w 0x86909E,X
    sta.w 0x0B9A
    jsr _80BB68
    plp
    rts

;-----

_80BB68:
    rep #0x10
    jsr _80BC13
    ldy.w #0x0000
    lda [0x10],Y
    sta.b 0x00
    iny
    lda [0x10],Y
    sta.b 0x01
    iny
    iny
    lda.b #0x00
    xba
    lda.b 0xD7
    tax
    lda.w 0x868D1C,X
    sta.b 0x04
    lda.w 0x868D1D,X
    sta.b 0x05
.BB8B:
    ldx.b 0x04
    lda.b 0x00
    sta.b 0x02
.BB91:
    lda [0x10],Y
    sta.l 0x7EE800,X
    iny
    inx
    dec.b 0x02
    bne .BB91

    lda.b 0x04
    clc
    adc.b #0x20
    sta.b 0x04
    lda.b 0x05
    adc.b #0x00
    sta.b 0x05
    dec.b 0x01
    bne .BB8B

    rep #0x30
    ldy.w #0x0002
    lda [0x10],Y
    and.w #0xFF
    sta.b 0x00
    lda.b 0xD7
    tax
    lda.w 0x868D20,X
    tax
    ldy.w #0x0000
.BBC4:
    phy
    lda.w #0x08
    sta.b 0x02
.BBCA:
    lda.w #0x08
    sta.b 0x04
.BBCF:
    phy
    lda [0x18],Y
    asl
    asl
    asl
    tay
    lda [0x20],Y
    sta.l 0x7E2000,X
    iny
    iny
    lda [0x20],Y
    sta.l 0x7E2002,X
    iny
    iny
    lda [0x20],Y
    sta.l 0x7E2020,X
    iny
    iny
    lda [0x20],Y
    sta.l 0x7E2022,X
    ply
    iny
    iny
    inx
    inx
    inx
    inx
    dec.b 0x04
    bne .BBCF

    txa
    clc
    adc.w #0x20
    tax
    dec.b 0x02
    bne .BBCA

    pla
    adc.w #0x80
    tay
    dec.b 0x00
    bne .BBC4

    rts

;-----

_80BC13:
    ldy.w #0x0000
    tyx
    lda [0x10],Y
    sta.l 0x7EF000
    iny
    lda [0x10],Y
    sta.l 0x7EF001
    iny
    lda [0x10],Y
    sta.l 0x7EF002
    iny
.BC2C:
    lda [0x10],Y
    cmp.b #0xFF
    beq .BC4C

    sta.b 0x01
    and.b #0x7F
    sta.b 0x00
    iny
    lda [0x10],Y
    iny
.BC3C:
    sta.l 0x7EF003,X
    bit.b 0x01
    bmi .BC45

    inc
.BC45:
    inx
    dec.b 0x00
    bne .BC3C

    bra .BC2C

.BC4C:
    lda.b #0x00
    sta.b 0x10
    lda.b #0xF0
    sta.b 0x11
    lda.b #0x7E
    sta.b 0x12
    rts

;-----

_80BC59:
    rep #0x30
    ldx.w #0x03FE
    lda.w #0x0000
.BC61:
    sta.l 0x7EE800,X
    sta.l 0x7EEC00,X
    dex
    dex
    bpl .BC61

    sep #0x30
    rts

;-----

_80BC70:
    lda.w 0x1F7A
    and.w #0xFF
    cmp.w #0x02
    beq .BCA9

    cmp.w #0x06
    beq .BC97

    cmp.w #0x04
    bne .BCCE

    bit.w 0x1F95
    bvc .BCCE

    sep #0x20
    lda.l 0x7EE860
    sta.l 0x7EE840
    rep #0x20
    rts

.BC97:
    bit.w 0x1F8F
    bvc .BCCE

    sep #0x20
    lda.l 0x7EE880
    sta.l 0x7EE860
    rep #0x20
    rts

.BCA9:
    bit.w 0x1F87
    bvc .BCCE

    lda.l 0x7EE8A0
    sta.l 0x7EE864
    lda.l 0x7EE8A2
    sta.l 0x7EE866
    lda.l 0x7EE8A4
    sta.l 0x7EE841
    lda.l 0x7EE8A6
    sta.l 0x7EE843
.BCCE:
    rts

;-----

_80BCCF:
    phd
    pea 0x1E48
    pld
    lda.b 0x04
    sta.b 0x22
    lda.b 0x07
    sta.b 0x24
    ldx.b 0x01
    jsr (.BCED,X)
    jsr _80C260
    pld
    jsl _81808F
    jsr _80D583
    rts

.BCED: d16[.BCF5, .BE14, .BE48, .BE66]

.BCF5:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x15
    stz.b 0x1E
    stz.b 0x0E
    stz.b 0x18
    stz.b 0x16
    stz.b 0x17
    lda.b #0x07
    sta.b 0x0F
    stz.b 0x03
    stz.b 0x14
    jsr _80C13A
    jsr _80C1FD
    lda.w 0x1F7A
    bne .BD1D

    lda.b #0x01
    sta.w 0x1F7A
.BD1D:
    ldx.b 0x1E
    beq .BD23

    lda.b #0x09
.BD23:
    sta.b 0x1D
    dec
    tax
    lda.w 0x869B85,X
    sta.b 0x04
    lda.w 0x869B8E,X
    sta.b 0x07
    ldx.b #0x40
    ldy.b #0xCA
    jsl _828000
    ldy.b #0x18
    jsl _828000.8011
    lda.b #0x04
    sta.w 0x1F11
    sta.w 0x1F12
    rep #0x20
    stz.b 0x05
    stz.b 0x08
    stz.w 0x00B6
    stz.w 0x00B4
    phd
    lda.w #0x0000
    pha
    pld
    sep #0x20
    lda.b #0x20
    ldx.w 0x1E66
    beq .BD64

    lda.b #0x29
.BD64:
    jsl _80878B
    ldy.b #0x2E
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x40
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x42
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x20
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x24
    jsr _80B2FF
    ldy.b #0x68
    jsl _808A64
    jsr _808099.8100
    pld
    ldy.b #0xCE
    jsl _828000.8011
    ldy.b #0x00
    jsl _808BCD
    ldy.b #0x06
    jsl _808BCD
    jsr _808099.8100
    ldy.b #0x0A
    jsl _808BCD
    jsr _80C18B
    jsr _80C373
    lda.b #0x07
    jsr _80C2FD
    jsr _808099.8100
    jsr _80C22F
    lda.b 0x1E
    beq .BDD6

    ldy.b #0x0A
    jsl _828000.8011
    ldy.b #0x0C
    jsl _808BCD
    jsr _808099.8100
.BDD6:
    lda.b 0x07
    asl
    asl
    adc.b 0x04
    tax
    lda.w 0x869BE3,X
    cmp.b #0x0F
    bne .BDEF

    tax
    lda.w 0x1F90
    asl
    asl
    txa
    bcc .BDEF

    lda.b #0x13
.BDEF:
    asl
    tay
    jsl _808BCD
    lda.b 0x07
    asl
    asl
    adc.b 0x04
    tax
    lda.w 0x869C13,X
    asl
    tay
    jsl _828000.8011
    lda.b #0x0F
    sta.w 0x00B3
    lda.b #0x07
    sta.w 0x00C0
    lda.b #0x03
    sta.b 0x0C
    rts

.BE14:
    jsr _80C18B
    dec.b 0x0C
    bne .BE47

    lda.b #0x03
    sta.b 0x0C
    lda.b 0x0F
    beq .BE2A

    dec
    sta.b 0x0F
    jsr _80C2FD
    rts

.BE2A:
    lda.b #0x04
    sta.b 0x01
    lda.b #0x17
    sta.w 0x00C0
    ldx.b 0x10
    stz.w 0x0AA1,X
    ldx.b 0x11
    stz.w 0x0AA1,X
    ldx.b 0x12
    stz.w 0x0AA1,X
    ldx.b 0x13
    stz.w 0x0AA1,X
.BE47:
    rts

.BE48:
    stz.b 0x0A
    jsr _80BF4A
    lda.w 0x00AC
    and.b #0x40
    bne .BE5B

    lda.w 0x00AC
    and.b #0x80
    beq .BE5E

.BE5B:
    jsr _80BFE6
.BE5E:
    jsr _80C0C7
    jsl _818000
    rts

.BE66:
    jsl _818000
    ldx.b 0x02
    jmp (.BE6F,X)

.BE6F: d16[.BE85, .BE99, .BED0, .BE99, .BED0, .BE99, .BED0, .BE99, .BED0, .BEFE, .BF1D]

.BE85:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x2D
    jsl _80888B.88B6
    ldy.b #0x04
    jsr _808850.885C
    lda.b #0x04
    sta.b 0x0C
    rts

.BE99:
    dec.b 0x0C
    bne .BECF

    inc.b 0x02
    inc.b 0x02
    lda.b #0x01
    sta.b 0x0C
    phb
    rep #0x30
    lda.w #0x01FF
    ldx.w #0x0300
    ldy.w #0xE000
    mvn 0x7F, 0x00
    lda.w #0xFFFF
    sta.l 0x000300
    lda.w #0x01FE
    ldx.w #0x0300
    ldy.w #0x0301
    mvn 0x00, 0x00
    sep #0x30
    plb
    lda.b #0x01
    sta.w 0x00A1
.BECF:
    rts

.BED0:
    dec.b 0x0C
    bne .BEFD

    inc.b 0x02
    inc.b 0x02
    lda.b #0x04
    sta.b 0x0C
    phb
    rep #0x30
    lda.w #0x01FF
    ldx.w #0xE000
    ldy.w #0x0300
    mvn 0x00, 0x7F
    sep #0x30
    plb
    lda.b #0x01
    sta.w 0x00A1
    lda.b 0x02
    cmp.b #0x12
    bcc .BEFD

    lda.b #0x18
    sta.b 0x0C
.BEFD:
    rts

.BEFE:
    jsr _80C18B
    dec.b 0x0C
    bne .BF1C

    stz.b 0x0F
    jsr _80C373
    lda.b #0x00
    jsr _80C2FD
    lda.b #0x07
    sta.w 0x00C0
    lda.b #0x03
    sta.b 0x0C
    inc.b 0x02
    inc.b 0x02
.BF1C:
    rts

.BF1D:
    jsr _80C18B
    dec.b 0x0C
    bne .BF49

    lda.b #0x03
    sta.b 0x0C
    lda.b 0x0F
    cmp.b #0x07
    bcs .BF35

    inc
    sta.b 0x0F
    jsr _80C2FD
    rts

.BF35:
    inc.w 0x00D2
    inc.w 0x00D2
    stz.w 0x00D3
    stz.w 0x00D4
    lda.b #0x17
    sta.w 0x00C0
    stz.w 0x00B3
.BF49:
    rts

;-----

_80BF4A:
    lda.w 0x00AC
    bit.b #0x03
    beq .BF82

    and.b #0x01
    beq .BF6B

    lda.b 0x04
    inc
    and.b #0x03
    cmp.b #0x02
    bne .BF67

    ldx.b 0x07
    beq .BF67

    cpx.b #0x03
    beq .BF67

    inc
.BF67:
    sta.b 0x04
    bra .BF7F

.BF6B:
    lda.b 0x04
    dec
    and.b #0x03
    cmp.b #0x01
    bne .BF7D

    ldx.b 0x07
    beq .BF7D

    cpx.b #0x03
    beq .BF7D

    dec
.BF7D:
    sta.b 0x04
.BF7F:
    lda.w 0x00AC
.BF82:
    and.b #0x0C
    beq .BFB4

    and.b #0x08
    beq .BFA0

    lda.b 0x07
    dec
    and.b #0x03
    cmp.b #0x01
    bne .BF9C

    ldx.b 0x04
    beq .BF9C

    cpx.b #0x03
    beq .BF9C

    dec
.BF9C:
    sta.b 0x07
    bra .BFB4

.BFA0:
    lda.b 0x07
    inc
    and.b #0x03
    cmp.b #0x02
    bne .BFB2

    ldx.b 0x04
    beq .BFB2

    cpx.b #0x03
    beq .BFB2

    inc
.BFB2:
    sta.b 0x07
.BFB4:
    lda.b 0x04
    cmp.b 0x22
    bne .BFC0

    lda.b 0x07
    cmp.b 0x24
    beq .BFDF

.BFC0:
    lda.b #0x2C
    jsl _80888B.88B6
    inc.b 0x0A
    lda.b 0x07
    asl
    asl
    clc
    adc.b 0x04
    tax
    lda.w 0x869B9F,X
    bmi .BFDF

    cmp.b #0x09
    bne .BFDD

    ldx.b 0x1E
    beq .BFDF

.BFDD:
    sta.b 0x1D
.BFDF:
    jsr _80C22F
    jsr _80C18B
    rts

;-----

_80BFE6:
    lda.b 0x07
    asl
    asl
    clc
    adc.b 0x04
    asl
    tax
    jmp (.BFF2,X)

.BFF2: d16[
    .C012, .C037, .C03B, .C063, .C03F, .C089, .C089, .C043,
    .C047, .C089, .C089, .C04B, .C09E, .C04F, .C053, .C0B9,
]

.C012:
    lda.b #0x00
    cmp.b 0x03
    beq .C036

    jsr _80C248
    jsr _808099.8100
    ldy.b #0x14
    jsl _808BCD
    ldy.b #0xCE
    jsl _828000.8011
    lda.b #0x27
    jsl _80888B.88B6
    lda.b #0x01
    sta.b 0x1D
    inc.b 0x18
.C036:
    rts

.C037:
    lda.b #0x01
    bra .C057

.C03B:
    lda.b #0x08
    bra .C057

.C03F:
    lda.b #0x03
    bra .C057

.C043:
    lda.b #0x04
    bra .C057

.C047:
    lda.b #0x05
    bra .C057

.C04B:
    lda.b #0x07
    bra .C057

.C04F:
    lda.b #0x06
    bra .C057

.C053:
    lda.b #0x02
    bra .C057

.C057:
    sta.w 0x1F7A
    inc.b 0x01
    inc.b 0x01
    stz.b 0x02
    inc.b 0x15
    rts

.C063:
    lda.b #0x02
    cmp.b 0x03
    beq .C088

    jsr _80C248
    jsr _808099.8100
    ldy.b #0x10
    jsl _808BCD
    rep #0x10
    ldy.w #0x0190
    jsl _828000.8011
    sep #0x10
    lda.b #0x27
    jsl _80888B.88B6
    inc.b 0x18
.C088:
    rts

.C089:
    lda.b 0x03
    bne .C095

    lda.b 0x1D
    cmp.b #0x09
    beq .C0B9

    bra .C057

.C095:
    cmp.b #0x06
    bne .C09D

    lda.b #0xFF
    bne .C09D

.C09D:
    rts

.C09E:
    lda.b #0x04
    cmp.b 0x03
    beq .C0B8

    jsr _80C248
    jsr _808099.8100
    ldy.b #0x12
    jsl _808BCD
    lda.b #0x27
    jsl _80888B.88B6
    inc.b 0x18
.C0B8:
    rts

.C0B9:
    lda.b 0x1E
    beq .C0C6

    lda.w 0x1F7B
    clc
    adc.b #0x09
    jmp .C057

.C0C6:
    rts

;-----

_80C0C7:
    lda.b 0x0A
    beq .C139

    lda.b 0x03
    cmp.b #0x04
    bne .C0EF

    inc.b 0x18
    stz.b 0x16
    lda.b 0x07
    asl
    asl
    clc
    adc.b 0x04
    tax
    lda.w 0x869B9F,X
    bmi .C0EF

    cmp.b #0x09
    beq .C0EF

    dec
    sta.b 0x17
    inc.b 0x16
    lda.b #0x01
    sta.b 0x19
.C0EF:
    lda.b 0x07
    asl
    asl
    sta.w 0x0000
    lda.b 0x03
    asl
    asl
    asl
    adc.w 0x0000
    adc.b 0x04
    tax
    lda.w 0x869BE3,X
    beq .C139

    cmp.b #0x12
    bne .C10E

    ldx.b 0x1E
    beq .C139

.C10E:
    cmp.b #0x0F
    bne .C11D

    tax
    lda.w 0x1F90
    asl
    asl
    txa
    bcc .C11D

    lda.b #0x13
.C11D:
    asl
    tay
    jsl _808BCD
    lda.b 0x03
    bne .C139

    lda.b 0x07
    asl
    asl
    adc.b 0x04
    tax
    lda.w 0x869C13,X
    beq .C139

    asl
    tay
    jsl _828000.8011
.C139:
    rts

;-----

_80C13A:
    stz.b 0x0D
    ldx.b #0x0E
.C13E:
    lda.w 0x1F88,X
    and.b #0x40
    beq .C14D

    txa
    lsr
    tay
    lda 0x869B97,Y
    tsb.b 0x0D
.C14D:
    dex
    dex
    bpl .C13E

    ldx.b #0x00
.C153:
    lda.w 0x0AA1,X
    beq .C15E

    txa
    clc
    adc.b #0x07
    bra .C153

.C15E:
    inc.w 0x0AA1
    lda.b #0x44
    sta.w 0x0AA2,X
    lda.b #0x26
    sta.w 0x0AA3,X
    lda.b #0xD2
    sta.w 0x0AA4,X
    lda.b #0x0A
    sta.w 0x0AA5,X
    lda.b #0x00
    sta.w 0x0AA6,X
    lda.b #0x86
    sta.w 0x0AA7,X
    stz.w 0x0B22
    lda.b 0x0D
    cmp.b #0xFF
    bne .C18A

    inc.b 0x1E
.C18A:
    rts

;-----

_80C18B:
    rep #0x20
    ldx.b #0x10
    stx.w 0x0B22
    lda.w #0x9BAF
    sta.w 0x0B23
    ldx.b #0x30
    stx.w 0x0B25
    lda.b 0x0D
    and.w #0x0003
    asl
    asl
    adc.w #0x9BB3
    sta.w 0x0B26
    ldx.b #0x30
    stx.w 0x0B28
    lda.b 0x0D
    and.w #0x000C
    ora.b 0x0E
    and.w #0x00FF
    clc
    adc.w #0x9BC3
    sta.w 0x0B29
    ldx.b #0x30
    stx.w 0x0B2B
    lda.b 0x0D
    and.w #0x0030
    lsr
    lsr
    ora.b 0x0E
    and.w #0x00FF
    clc
    adc.w #0x9BC3
    sta.w 0x0B2C
    ldx.b #0x30
    stx.w 0x0B2E
    lda.b 0x0D
    and.w #0x00C0
    lsr
    lsr
    lsr
    lsr
    adc.w #0x9BB3
    sta.w 0x0B2F
    ldx.b #0x10
    stx.w 0x0B31
    lda.w #0x9BAF
    sta.w 0x0B32
    stz.w 0x0B34
    sep #0x20
    rts

;-----

_80C1FD:
    lda.b #0x17
    sta.w 0x00C0
    stz.w 0x00C1
    stz.w 0x2123
    stz.w 0x2124
    stz.w 0x00C6
    stz.w 0x00C7
    lda.b #0xA0
    sta.w 0x2125
    sta.w 0x00C8
    lda.b #0x10
    sta.w 0x00C9
    lda.b #0x83
    sta.w 0x00CA
    lda.b #0x08
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    rts

;-----

_80C22F:
    stz.b 0x0E
    lda.b 0x03
    bne .C247

    ldx.b 0x1D
    cpx.b #0x09
    beq .C247

    dex
    lda.w 0x869B97,X
    and.b 0x0D
    beq .C247

    lda.b #0x10
    sta.b 0x0E
.C247:
    rts

;-----

_80C248:
    pha
    lda.b 0x03
    sta.b 0x14
    inc
    asl
    tay
    jsl _808BCD
    pla
    sta.b 0x03
    asl
    tay
    jsl _808BCD
    stz.b 0x16
    rts

;-----

_80C260:
    lda.b 0x18
    beq .C272

    phd
    pea 0x0000
    pld
    lda.b #0x36
    jsr _8089CA
    pld
    stz.b 0x18
    rts

.C272:
    lda.b 0x16
    bne .C277

    rts

.C277:
    bmi .C296

    lda.b #0x81
    sta.b 0x16
    lda.b #0x03
    sta.b 0x19
    lda.b 0x17
    asl
    tax
    rep #0x20
    lda.w 0x869C23,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x09
    sta.b 0x1B
.C292:
    lda.b #0x0B
    sta.b 0x1A
.C296:
    dec.b 0x19
    beq .C29B

    rts

.C29B:
    lda (0x1C)
    cmp.b #0xFF
    beq .C296

    cmp.b #0xFE
    bne .C2B3

    rep #0x20
    inc.b 0x1C
    sep #0x20
    lda.b #0x03
    sta.b 0x19
    inc.b 0x1B
    bra .C292

.C2B3:
    ldx.w 0x00A4
    sta.w 0x0604,X
    lda.b #0x2C
    sta.w 0x0605,X
    rep #0x20
    lda.b 0x1A
    and.w #0x00FF
    sta.w 0x0000
    lda.b 0x1B
    and.w #0x00FF
    asl
    asl
    asl
    asl
    asl
    clc
    adc.w 0x0000
    clc
    adc.w #0x0800
    sta.w 0x0601,X
    sep #0x20
    lda.b #0x02
    sta.w 0x0603,X
    lda.b #0x80
    sta.w 0x0600,X
    txa
    clc
    adc.b #0x06
    sta.w 0x00A4
    rep #0x20
    inc.b 0x1C
    sep #0x20
    lda.b #0x03
    sta.b 0x19
    inc.b 0x1A
    rts

;-----

_80C2FD:
    rep #0x20
    phb
    ldx.b #0x7F
    phx
    plb
    pha
    and.w #0x00FF
    asl
    asl
    asl
    asl
    asl
    adc.w #0x9EA5
    sta.w 0xD001
    sta.w 0xD004
    sta.w 0xD007
    sta.w 0xD00A
    sta.w 0xD00D
    sta.w 0xD010
    sta.w 0xD013
    sta.w 0xD016
    sta.w 0xD019
    sta.w 0xD01C
    sta.w 0xD01F
    sta.w 0xD022
    sta.w 0xD025
    sta.w 0xD028
    pla
    and.w #0x00FF
    asl
    asl
    asl
    asl
    adc.w #0x9FA5
    sta.w 0xD101
    sta.w 0xD104
    sta.w 0xD107
    sta.w 0xD10A
    sta.w 0xD10D
    sta.w 0xD110
    sta.w 0xD113
    sta.w 0xD116
    sta.w 0xD119
    sta.w 0xD11C
    sta.w 0xD11F
    sta.w 0xD122
    sta.w 0xD125
    sta.w 0xD128
    plb
    sep #0x30
    rts

;-----

_80C373:
    php
    phb
    sep #0x30
    ldx.b #0x00
.C379:
    lda.w 0x0AA1,X
    beq .C385

    txa
    clc
    adc.b #0x07
    tax
    bra .C379

.C385:
    stx.b 0x10
    inc.w 0x0AA1,X
    rep #0x30
    txa
    clc
    adc.w #0x0AA1
    inc
    tay
    ldx.w #0xA025
    lda.w #0x0005
    mvn 0x00, 0x86
    sep #0x30
    ldx.b #0x00
.C3A0:
    lda.w 0x0AA1,X
    beq .C3AC

    txa
    clc
    adc.b #0x07
    tax
    bra .C3A0

.C3AC:
    stx.b 0x11
    inc.w 0x0AA1,X
    rep #0x30
    txa
    clc
    adc.w #0x0AA1
    inc
    tay
    ldx.w #0xA02B
    lda.w #0x0005
    mvn 0x00, 0x86
    sep #0x30
    ldx.b #0x00
.C3C7:
    lda.w 0x0AA1,X
    beq .C3D3

    txa
    clc
    adc.b #0x07
    tax
    bra .C3C7

.C3D3:
    stx.b 0x12
    inc.w 0x0AA1,X
    rep #0x30
    txa
    clc
    adc.w #0x0AA1
    inc
    tay
    ldx.w #0xA031
    lda.w #0x0005
    mvn 0x00, 0x86
    sep #0x30
    ldx.b #0x00
.C3EE:
    lda.w 0x0AA1,X
    beq .C3FA

    txa
    clc
    adc.b #0x07
    tax
    bra .C3EE

.C3FA:
    stx.b 0x13
    inc.w 0x0AA1,X
    rep #0x30
    txa
    clc
    adc.w #0x0AA1
    inc
    tay
    ldx.w #0xA037
    lda.w #0x0005
    mvn 0x00, 0x86
    sep #0x30
    lda.b #0x7F
    pha
    plb
    lda.b #0x90
    ldx.b #0x27
.C41B:
    sta.w 0xD000,X
    sta.w 0xD100,X
    dex
    dex
    dex
    bpl .C41B

    stz.w 0xD02A
    stz.w 0xD12A
    plb
    plp
    rts

;-----

_80C42F:
    sep #0x30
    stz.w 0x1EC9
    stz.w 0x1ECA
    rts

;-----

_80C438:
    php
    phd
    sep #0x30
    pea 0x1EC8
    pld
    ldx.b 0x01
    jsr (.C44A,X)
    pld
    plp
    jmp 0x80D583

.C44A: d16[.C452, .C4DA, .C4EF, .C501]

.C452:
    rep #0x30
    phb
    ldx.w #0x0300
    ldy.w #0xC000
    lda.w #0x00FF
    mvn 0x7F, 0x00
    plb
    stz.b 0x21
    stz.w 0x00B4
    stz.w 0x00B6
    stz.w 0x00B8
    stz.w 0x00BA
    lda.w 0x1E4D
    sta.b 0x05
    lda.w 0x1E50
    sta.b 0x08
    stz.w 0x1E4D
    stz.w 0x1E50
    sep #0x30
    jsr _80C96C
    jsr _80C9AC
    lda.b #0x04
    sta.w 0x1F11
    sta.w 0x1F12
    lda.b #0x06
    sta.w 0x1F10
    jsr _80C58E
    lda.w 0x0BDB
    lsr
    sta.b 0x0A
    inc.w 0x0AA1
    lda.b #0x01
    sta.w 0x0AA2
    lda.b #0x26
    sta.w 0x0AA3
    jsr _80C784
    lda.b #0x02
    sta.b 0x01
    phb
    rep #0x30
    ldx.w #0x1928
    ldy.w #0xBB00
    lda.w #0x009F
    mvn 0x7F, 0x00
    sep #0x30
    plb
    ldy.b #0x14
    jsl _808A64
    stz.w 0x1929
    stz.w 0x1949
    stz.w 0x1969
    stz.w 0x1989
    jsr _80C8D9
    rts

.C4DA:
    phd
    pea 0x0000
    pld
    ldx.b #0x01
    ldy.b #0x02
    jsr _80895C.8962
    pld
    lda.b #0x04
    sta.b 0x01
    jsr _80C8D9
    rts

.C4EF:
    jsr _80C8D9
    ldx.b 0x02
    jmp (.C4F7,X)

.C4F7: d16[.C4FB, _80C737]

.C4FB:
    sep #0x30
    jsr _80C693
    rts

.C501:
    ldy.b #0xFF
    lda.b #0xFE
    jsl _808850.8868
    lda.b 0x21
    beq .C518

    phd
    pea 0x0000
    pld
    jsr _80897E
    pld
    bra .C525

.C518:
    phd
    pea 0x0000
    pld
    ldx.b #0x01
    ldy.b #0x02
    jsr _80897E.8984
    pld
.C525:
    rep #0x20
    lda.b 0x05
    sta.w 0x1E4D
    sta.w 0x00B4
    lda.b 0x08
    sta.w 0x1E50
    sta.w 0x00B6
    lda.w 0x1E8D
    sta.w 0x00B8
    lda.w 0x1E90
    sta.w 0x00BA
    sep #0x20
    lda.b #0x04
    sta.w 0x1F11
    sta.w 0x1F12
    phd
    pea 0x0000
    pld
    jsr _80D583
    pld
    stz.w 0x1F11
    stz.w 0x1F12
    stz.w 0x1F10
    jsr _80C615
    lda.b 0x21
    ora.b #0x80
    sta.w 0x1F24
    stz.b 0x01
    stz.b 0x02
    jsr _80C999
    jsr _80CA2F
    jsr _80CE3C
    lda.b #0x01
    tsb.w 0x00A1
    phb
    rep #0x30
    ldx.w #0xBB00
    ldy.w #0x1928
    lda.w #0x009F
    mvn 0x00, 0x7F
    sep #0x30
    plb
    rts

;-----

_80C58E:
    phb
    phd
    php
    rep #0x20
    lda.w #0x0000
    tcd
    sep #0x20
    lda.b #0x80
    sta.w snes_regs.inidisp
    sta.b 0xB3
    jsr _80CDD9
    lda.b #0x03
    tsb.w 0x00A2
    stz.b 0xB3
    jsr _808099.8100
    ldy.b #0x48
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x52
    jsr _80B2FF
    jsr _808099.8100
    rep #0x20
    lda.w 0x1F7A
    and.w #0xFF
    asl
    adc.w #0x04
    tay
    lda 0x86F572,Y
    sta.b 0x10
    lda (0x10)
    sep #0x20
    sta.b 0x98
    rep #0x20
    stz.b 0xF8
    jsr _80B24C.local
    sep #0x30
    ldy.b #0xF8
    jsl _828000.8011
    rep #0x30
    lda.w 0x0BDB
    and.w #0xFF
    clc
    adc.w #0x0100
    tay
    jsl _828000.8011
    sep #0x30
    jsr _808099.8100
    lda.b #0x80
    sta.w snes_regs.inidisp
    jsr _80CD2A
    jsr _80CA94
    jsr _80CB2D
    jsr _80CC1F
    jsr _808099.8100
    jsr _80CC54
    plp
    pld
    plb
    rts

;-----

_80C615:
    phb
    phd
    php
    rep #0x20
    lda.w #0x0000
    tcd
    sep #0x30
    lda.b #0x80
    sta.w snes_regs.inidisp
    jsr _80CE0C
    stz.w 0x00B3
    jsr _808099.8100
    jsr _80B582
.C631:
    jsr _808099.8100
    lda.b 0xF4
    bne .C631

    ldy.b #0x00
    jsr _808A70
    jsr _808099.8100
    lda.w 0x1F7A
    asl
    clc
    adc.b #0x60
    tay
    jsl _828000.8011
    jsr _80B085.local
.C64F:
    jsr _808099.8100
    lda.w 0x40
    bne .C64F

    jsr _80B42A.local
.C65A:
    jsr _808099.8100
    lda.w 0x0050
    bne .C65A

    rep #0x30
    phb
    ldx.w #0xC000
    ldy.w #0x0300
    lda.w #0x00FF
    mvn 0x00, 0x7F
    plb
    sep #0x30
    ldx.b #0x10
    lda.w 0x0BDB
    clc
    adc.b #0x40
    tay
    jsl _828000
    ldx.b #0x20
    ldy.b #0x1C
    jsl _828000
    ldy.b #0xA0
    jsl _828000.8011
    plp
    pld
    plb
    rts

;-----

_80C693:
    lda.b 0x0A
    sta.b 0x0B
    lda.w 0x0BE3
    bit.b #0x03
    beq .C6A1

    jsr _80C79B
.C6A1:
    lda.w 0x0BE3
    bit.b #0x0C
    beq .C6B4

    bit.b #0x08
    beq .C6B1

    jsr _80C80A
    bra .C6B4

.C6B1:
    jsr _80C86A
.C6B4:
    lda.b 0x0B
    cmp.b 0x0A
    beq .C6D7

    sta.b 0x0A
    cmp.b #0x09
    bcs .C6D1

    rep #0x30
    and.w #0xFF
    asl
    clc
    adc.w #0x0100
    tay
    jsl _828000.8011
    sep #0x30
.C6D1:
    lda.b #0x2C
    jsl _80888B.88B6
.C6D7:
    jsr _80C784
    lda.w 0x0BE3
    bit.b #0x40
    beq .C70D

    lda.b 0x0A
    cmp.b #0x0A
    bcc .C70D

    lda.w 0x0BCF
    and.b #0x7F
    cmp.w 0x1F9A
    beq .C70D

    sec
    sbc.b #0x0A
    tax
    lda.b #0x02
    sta.b 0x02
    lda.b #0x04
    sta.b 0x10
    lda.b #0x01
    sta.b 0x11
    lda.w 0x1F83,X
    and.b #0x0F
    cmp.b #0x0E
    bcc .C70C

    inc.b 0x11
.C70C:
    rts

.C70D:
    lda.w 0x0BE3
    bit.b #0x10
    beq .C736

    lda.b 0x0A
    cmp.b #0x09
    bne .C732

    jsr _80C950
    beq .C736

    inc.b 0x21
    lda.b #0x2D
    jsl _80888B.88B6
    phd
    pea 0x0000
    pld
    lda.b #0x3C
    jsr _808099.810C
    pld
.C732:
    inc.b 0x01
    inc.b 0x01
.C736:
    rts

;-----

_80C737:
    dec.b 0x10
    bne .C783

    lda.b #0x04
    sta.b 0x10
    lda.b #0x0C
    jsl _80888B.88B6
    lda.b 0x0A
    sec
    sbc.b #0x0A
    tax
    lda.w 0x0BCF
    and.b #0x7F
    cmp.w 0x1F9A
    beq .C768

    clc
    adc.b 0x11
    cmp.w 0x1F9A
    bcc .C760

    lda.w 0x1F9A
.C760:
    sta.w 0x0BCF
    phx
    jsr _80CC54
    plx
.C768:
    dec.w 0x1F83,X
    jsr _80CD3B
    lda.w 0x1F83,X
    and.b #0x0F
    bne .C783

    jsr _80CDB5
    jsr _80CD2A
    stz.b 0x02
    lda.w 0x0BDB
    lsr
    sta.b 0x0A
.C783:
    rts

;-----

_80C784:
    lda.b 0x0A
    asl
    tax
    rep #0x20
    lda.w 0x86A042,X
    sta.w 0x0AA4
    sep #0x20
    lda.b #0x86
    sta.w 0x0AA6
    sta.w 0x0AA7
    rts

;-----

_80C79B:
    lda.b 0x0B
    cmp.b #0x05
    bcs .C7C0

    clc
    adc.b #0x05
    sta.b 0x0E
.C7A6:
    sta.b 0x0F
    dec
    asl
    tax
    lda.w 0x1F88,X
    asl
    asl
    bcs .C805

    lda.b 0x0F
    dec
    cmp.b #0x05
    bcs .C7BB

    lda.b #0x09
.C7BB:
    cmp.b 0x0E
    bne .C7A6

    rts

.C7C0:
    cmp.b #0x0A
    bcs .C7DC

    sec
    sbc.b #0x05
    beq .C807

.C7C9:
    sta.b 0x0F
    dec
    asl
    tax
    lda.w 0x1F88,X
    asl
    asl
    bcs .C805

    lda.b 0x0F
    dec
    beq .C807

    bra .C7C9

.C7DC:
    cmp.b #0x0C
    bcs .C7F2

    cmp.b #0x0A
    bne .C7EF

    lda.w 0x1F84
    bpl .C809

    and.b #0x3F
    beq .C809

    bra .C801

.C7EF:
    dec
    bra .C807

.C7F2:
    bne .C7EF

    lda.w 0x1F86
    bpl .C801

    and.b #0x3F
    beq .C801

    lda.b #0x0D
    bra .C807

.C801:
    lda.b #0x0B
    bra .C807

.C805:
    lda.b 0x0F
.C807:
    sta.b 0x0B
.C809:
    rts

;-----

_80C80A:
    lda.b 0x0B
    cmp.b #0x05
    bcs .C829

.C810:
    dec
    beq .C867

    bpl .C819

    lda.b #0x0C
    bra .C84A

.C819:
    sta.b 0x0F
    dec
    asl
    tax
    lda.w 0x1F88,X
    and.b #0x40
    bne .C865

    lda.b 0x0F
    bra .C810

.C829:
    cmp.b #0x0A
    bcs .C848

.C82D:
    dec
    cmp.b #0x05
    bcs .C834

    lda.b #0x09
.C834:
    sta.b 0x0F
    cmp.b 0x0B
    beq .C869

    dec
    asl
    tax
    lda.w 0x1F88,X
    and.b #0x40
    bne .C865

    lda.b 0x0F
    bra .C82D

.C848:
    dec
    dec
.C84A:
    sta.b 0x0F
    cmp.b #0x0A
    bcs .C854

    lda.b #0x04
    bra .C819

.C854:
    sec
    sbc.b #0x0A
    tax
    lda.w 0x1F83,X
    bpl .C861

    and.b #0x3F
    bne .C865

.C861:
    lda.b 0x0F
    bra .C848

.C865:
    lda.b 0x0F
.C867:
    sta.b 0x0B
.C869:
    rts

;-----

_80C86A:
    lda.b 0x0B
    cmp.b #0x05
    bcs .C889

.C870:
    inc
    cmp.b #0x05
    bcc .C879

    lda.b #0x0A
    bra .C8AA

.C879:
    sta.b 0x0F
    dec
    asl
    tax
    lda.w 0x1F88,X
    and.b #0x40
    bne .C8D4

    lda.b 0x0F
    bra .C870

.C889:
    cmp.b #0x0A
    bcs .C8A8

.C88D:
    inc
    cmp.b #0x0A
    bcc .C894

    lda.b #0x05
.C894:
    sta.b 0x0F
    cmp.b 0x0B
    beq .C8D8

    dec
    asl
    tax
    lda.w 0x1F88,X
    and.b #0x40
    bne .C8D4

    lda.b 0x0F
    bra .C88D

.C8A8:
    inc
    inc
.C8AA:
    sta.b 0x0F
    cmp.b #0x0E
    bcc .C8B4

.C8B0:
    lda.b #0x00
    bra .C8D6

.C8B4:
    sec
    sbc.b #0x0A
    tax
    lda.w 0x1F83,X
    bpl .C8C1

    and.b #0x3F
    bne .C8D4

.C8C1:
    lda.b 0x0F
    cmp.b #0x0D
    bne .C8A8

    lda.w 0x1F85
    bpl .C8B0

    and.b #0x3F
    beq .C8B0

    lda.b #0x0C
    bra .C8D6

.C8D4:
    lda.b 0x0F
.C8D6:
    sta.b 0x0B
.C8D8:
    rts

;-----

_80C8D9:
    php
    phd
    sep #0x30
    pea 0x1928
    pld
    ldx.b #0x04
    lda.w 0x1F99
    and.b #0x08
    beq .C8EF

    stx.b 0x0B
    jsr _80C924
.C8EF:
    pea 0x1948
    pld
    ldx.b #0x03
    lda.w 0x1F99
    and.b #0x04
    beq .C901

    stx.b 0x0B
    jsr _80C924
.C901:
    pea 0x1968
    pld
    ldx.b #0x02
    lda.w 0x1F99
    and.b #0x02
    beq .C913

    stx.b 0x0B
    jsr _80C924
.C913:
    pea 0x1988
    pld
    lda.w 0x1F99
    and.b #0x01
    sta.b 0x0B
    jsr _80C924
    pld
    plp
    rts

;-----

_80C924:
    lda.b 0x01
    bne .C94B

    inc.b 0x01
    stz.b 0x06
    stz.b 0x09
    lda.b #0x80
    sta.b 0x05
    lda.b #0xA0
    sta.b 0x08
    ldx.b 0x0B
    lda.w 0x86A03D,X
    sta.b 0x16
    lda.b #0x33
    sta.b 0x11
    stz.b 0x18
    stz.b 0x12
    lda.b #0x22
    jsl 0x848F07
.C94B:
    jsl _82808F.80B4
    rts

;-----

_80C950:
    lda.w 0x1F7A
    beq .C963

    cmp.b #0x09
    bcs .C963

    asl
    tax
    lda.w 0x1F86,X
    and.b #0x40
    beq .C963

    rts

.C963:
    lda.b #0x74
    jsl _80888B.88B6
    lda.b #0x00
    rts

;-----

_80C96C:
    php
    rep #0x30
    ldx.w #0x0AA1
    ldy.w #0xB600
    lda.w #0x0030
    phb
    mvn 0x7F, 0x00
    plb
    stz.w 0x0AA1
    stz.w 0x0AA8
    stz.w 0x0AAF
    stz.w 0x0AB6
    stz.w 0x0ABD
    stz.w 0x0AC4
    stz.w 0x0ACB
    sep #0x20
    stz.w 0x420C
    plp
    rts

;-----

_80C999:
    php
    rep #0x30
    ldx.w #0xB600
    ldy.w #0x0AA1
    lda.w #0x0030
    phb
    mvn 0x00, 0x7F
    plb
    plp
    rts

;-----

_80C9AC:
    lda.w 0x00C0
    sta.b 0x0C
    lda.w 0x00C1
    sta.b 0x0D
    lda.w 0x00C9
    sta.b 0x14
    lda.w 0x00CA
    sta.b 0x15
    lda.w 0x00CB
    sta.b 0x16
    lda.w 0x00CC
    sta.b 0x17
    lda.w 0x00CD
    sta.b 0x18
    lda.w 0x0BA1
    sta.b 0x19
    lda.b #0x13
    sta.w 0x00C0
    stz.w 0x00C1
    lda.b #0x09
    sta.w snes_regs.bgmode
    lda.b #0x08
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    stz.w 0x0BA1
    stz.w snes_regs.tmw
    stz.w snes_regs.tsw
    stz.w snes_regs.w12sel
    stz.w snes_regs.w34sel
    lda.b #0x20
    sta.w snes_regs.wobjsel
    lda.b #0x20
    sta.w 0x00C9
    lda.b #0x81
    sta.w 0x00CA
    lda.w 0x0BB6
    sta.w 0x1EDB
    lda.w 0x0C46
    sta.w 0x1EE2
    lda.w 0x0C66
    sta.w 0x1EE3
    lda.w 0x0C86
    sta.w 0x1EE4
    stz.w 0x0BB6
    stz.w 0x0C46
    stz.w 0x0C66
    stz.w 0x0C86
    rts

;-----

_80CA2F:
    lda.w 0x00C6
    sta.w snes_regs.w12sel
    lda.w 0x00C7
    sta.w snes_regs.w34sel
    lda.w 0x00C8
    sta.w snes_regs.wobjsel
    lda.w 0x00CE
    sta.w snes_regs.tmw
    lda.w 0x00CF
    sta.w snes_regs.tsw
    lda.w 0x00D0
    sta.w snes_regs.bgmode
    lda.b 0x0C
    sta.w 0x00C0
    lda.b 0x0D
    sta.w 0x00C1
    lda.b 0x14
    sta.w 0x00C9
    lda.b 0x15
    sta.w 0x00CA
    lda.b 0x16
    sta.w 0x00CB
    lda.b 0x17
    sta.w 0x00CC
    lda.b 0x18
    sta.w 0x00CD
    lda.b 0x19
    sta.w 0x0BA1
    lda.w 0x1EDB
    sta.w 0x0BB6
    lda.w 0x1EE2
    sta.w 0x0C46
    lda.w 0x1EE3
    sta.w 0x0C66
    lda.w 0x1EE4
    sta.w 0x0C86
    rts

;-----

_80CA94:
    ldx.b #0x10
    lda.b #0x80
    sta.w snes_regs.vmain
.CA9B:
    rep #0x20
    lda.w 0x86A0F6,X
    sta.w snes_regs.vmaddl
    sep #0x20
    lda.w 0x1F88,X
    bit.b #0x40
    bne .CAAF

    jmp .CB23

.CAAF:
    and.b #0x1F
    cmp.b #0x1D
    bcc .CAB7

    lda.b #0x1C
.CAB7:
    sta.b 0x00
    ldy.b #0x07
    sty.b 0x02
    lsr
    lsr
    beq .CAD7

    sta.b 0x04
    lda.b 0x02
    sec
    sbc.b 0x04
    sta.b 0x02
    ldy.b 0x04
    rep #0x20
    lda.w #0x2887
.CAD1:
    sta.w snes_regs.vmdatal
    dey
    bne .CAD1

.CAD7:
    sep #0x20
    lda.b 0x00
    and.b #0x03
    beq .CAF3

    dec.b 0x02
    rep #0x20
    and.w #0x00FF
    sta.b 0x00
    lda.w #0x2883
    clc
    adc.b 0x00
    sta.w snes_regs.vmdatal
    sep #0x20
.CAF3:
    lda.b 0x02
    beq .CB04

    rep #0x20
    ldy.b 0x02
    lda.w #0x2883
.CAFE:
    sta.w snes_regs.vmdatal
    dey
    bne .CAFE

.CB04:
    rep #0x20
    lda.w 0x86A0F6,X
    dec
    sta.w snes_regs.vmaddl
    lda.w #0x2882
    sta.w snes_regs.vmdatal
    lda.w 0x86A0F6,X
    clc
    adc.w #0x0007
    sta.w snes_regs.vmaddl
    lda.w #0x6882
    sta.w snes_regs.vmdatal
.CB23:
    sep #0x20
    dex
    dex
    bmi .CB2C

    jmp 0x80CA9B

.CB2C:
    rts

;-----

_80CB2D:
    lda.b #0x80
    sta.w snes_regs.vmain
    lda.b #0x85
    sta.w snes_regs.a1b0
    lda.b #0x18
    sta.w snes_regs.bbad0
    lda.b #0x01
    sta.w snes_regs.dmap0
    rep #0x20
    lda.w #0x8000
    sta.w snes_regs.a1t0l
    lda.w #0x0010
    sta.w snes_regs.das0l
    lda.w #0x50A7
    sta.w snes_regs.vmaddl
    sep #0x20
    lda.b #0x01
    sta.w snes_regs.mdmaen
    lda.b #0x85
    sta.w snes_regs.a1b0
    lda.b #0x18
    sta.w snes_regs.bbad0
    lda.b #0x01
    sta.w snes_regs.dmap0
    rep #0x20
    lda.w #0x8010
    sta.w snes_regs.a1t0l
    lda.w #0x0012
    sta.w snes_regs.das0l
    lda.w #0x50C6
    sta.w snes_regs.vmaddl
    sep #0x20
    lda.b #0x01
    sta.w snes_regs.mdmaen
    ldx.b #0x10
.CB88:
    lda.w 0x1F88,X
    asl
    asl
    bcc .CBF6

    txa
    lsr
    tay
    rep #0x20
    lda.w 0x86A0F6,X
    sec
    sbc.w #0x0023
    sta.w snes_regs.vmaddl
    lda 0x86A110,Y
    and.w #0x00FF
    ora.w #0x1400
    sta.w snes_regs.vmdatal
    inc
    sta.w snes_regs.vmdatal
    lda.w 0x86A0F6,X
    dec
    dec
    dec
    sta.w snes_regs.vmaddl
    lda 0x86A110,Y
    and.w #0x00FF
    clc
    adc.w #0x1410
    sta.w snes_regs.vmdatal
    inc
    sta.w snes_regs.vmdatal
    rep #0x10
    lda.w 0x86A119,X
    tay
    lda 0x0000,Y
    sta.w snes_regs.vmaddl
    lda 0x0002,Y
    sta.w snes_regs.a1t0l
    lda 0x0004,Y
    and.w #0x00FF
    sta.w snes_regs.das0l
    sep #0x20
    lda.b #0x86
    sta.w snes_regs.a1b0
    lda.b #0x18
    sta.w 0x4301
    lda.b #0x01
    sta.w snes_regs.mdmaen
    sep #0x10
.CBF6:
    dex
    dex
    bpl .CB88

    rep #0x20
    lda.w #0x50A4
    sta.w snes_regs.vmaddl
    lda.w #0x14A0
    sta.w snes_regs.vmdatal
    inc
    sta.w snes_regs.vmdatal
    lda.w #0x50C4
    sta.w snes_regs.vmaddl
    lda.w #0x14B0
    sta.w snes_regs.vmdatal
    inc
    sta.w snes_regs.vmdatal
    sep #0x20
    rts

;-----

_80CC1F:
    lda.b #0x80
    sta.w snes_regs.vmain
    lda.b #0xE0
    clc
    adc.w 0x1F80
    tax
    rep #0x20
    lda.w #0x5AD9
    sta.w snes_regs.vmaddl
    txa
    and.w #0x00FF
    ora.w #0x0800
    sta.w snes_regs.vmdatal
    lda.w #0x5AF9
    sta.w snes_regs.vmaddl
    txa
    and.w #0x00FF
    clc
    adc.w #0x0010
    ora.w #0x0800
    sta.w snes_regs.vmdatal
    sep #0x20
    rts

;-----

_80CC54:
    php
    sep #0x30
    phd
    pea 0x0000
    pld
    stz.b 0x01
    stz.b 0x03
    stz.b 0x05
    stz.b 0x06
    stz.b 0x07
    stz.b 0x09
    lda.w 0x1F9A
    bit.b #0x02
    beq .CC71

    inc.b 0x01
.CC71:
    lsr
    lsr
    sta.b 0x02
    lda.w 0x0BCF
    and.b #0x03
    sta.b 0x00
    lda.w 0x0BCF
    and.b #0x7F
    lsr
    lsr
    sta.b 0x04
    lda.b 0x02
    sec
    sbc.b 0x04
    sta.b 0x06
    sta.b 0x0A
    lda.w 0x0BCF
    and.b #0x03
    beq .CC9B

    lda.b 0x06
    beq .CC9B

    dec.b 0x06
.CC9B:
    ldx.w 0x00A4
    lda.b #0x80
    sta.w 0x0600,X
    lda.b 0x02
    inc
    asl
    sta.b 0x08
    inc
    inc
    sta.w 0x0603,X
    rep #0x20
    lda.w #0x5B0B
    sta.w 0x0601,X
    inx
    inx
    inx
    inx
    lda.w #0x0882
    sta.w 0x0600,X
    inx
    inx
.CCC2:
    lda.b 0x04
    beq .CCD6

    lda.w #0x0887
    sta.w 0x0600,X
    dec.b 0x04
    dec.b 0x08
    dec.b 0x08
    inx
    inx
    bra .CCC2

.CCD6:
    lda.b 0x00
    and.w #0x0003
    beq .CCF4

    ldy.b 0x01
    beq .CCE7

    ldy.b 0x08
    cpy.b #0x02
    beq .CD08

.CCE7:
    clc
    adc.w #0x0883
    sta.w 0x0600,X
    dec.b 0x08
    dec.b 0x08
    inx
    inx
.CCF4:
    lda.b 0x06
    beq .CD08

    lda.w #0x0883
    sta.w 0x0600,X
    dec.b 0x06
    dec.b 0x08
    dec.b 0x08
    inx
    inx
    bra .CCF4

.CD08:
    lda.w #0x4882
    ldy.b 0x01
    beq .CD1F

    lda.w #0x0000
    ldy.b 0x0A
    bne .CD1B

    lda.b 0x00
    and.w #0x0003
.CD1B:
    clc
    adc.w #0x0899
.CD1F:
    sta.w 0x0600,X
    inx
    inx
    stx.w 0x00A4
    pld
    plp
    rts

;-----

_80CD2A:
    ldx.b #0x00
.CD2C:
    lda.w 0x1F83,X
    bpl .CD39

    jsr _80CD3B
    inx
    cpx.b #0x04
    bcc .CD2C

.CD39:
    rts

;-----

    d08[0x60] ;rts probably

;-----

_80CD3B:
    phx
    txy
    txa
    asl
    tax
    lda 0x1F83,Y
    and.b #0x0F
    cmp.b #0x0F
    bcc .CD4B

    lda.b #0x0E
.CD4B:
    sta.w 0x0000
    sec
    sbc.b #0x06
    bcs .CD55

    lda.b #0x00
.CD55:
    rep #0x21
    and.w #0x00FF
    adc.w #0x1889
    sta.w 0x0004
    lda.w 0x86A108,X
    sta.w 0x0006
    jsr _80CD8C
    lda.w 0x0000
    cmp.b #0x07
    bcc .CD72

    lda.b #0x06
.CD72:
    rep #0x21
    and.w #0x00FF
    adc.w #0x1892
    sta.w 0x0004
    lda.w 0x86A108,X
    clc
    adc.w #0x0020
    sta.w 0x0006
    jsr _80CD8C
    plx
    rts

;-----

_80CD8C:
    ldy.w 0x00A4
    lda.w 0x0004
    sta 0x0604,Y
    ora.w #0x4000
    sta 0x0606,Y
    lda.w 0x0006
    sta 0x0601,Y
    sep #0x20
    lda.b #0x04
    sta 0x0603,Y
    lda.b #0x80
    sta 0x0600,Y
    tya
    clc
    adc.b #0x08
    sta.w 0x00A4
    rts

;-----

_80CDB5:
    lda.b 0x0A
    sec
    sbc.b #0x0A
    tax
.CDBB:
    cpx.b #0x03
    beq .CDD8

    txy
    iny
    lda 0x1F83,Y
    bpl .CDD8

    and.b #0x0F
    beq .CDD8

    lda 0x1F83,Y
    sta.w 0x1F83,X
    lda.b #0x80
    sta 0x1F83,Y
    inx
    bra .CDBB

.CDD8:
    rts

;-----

_80CDD9:
    lda.b #0x80
    sta.w snes_regs.vmain
    lda.b #0x39
    sta.w snes_regs.bbad0
    lda.b #0x7F
    sta.w snes_regs.a1b0
    lda.b #0x81
    sta.w snes_regs.dmap0
    rep #0x20
    lda.w #0xA400
    sta.w snes_regs.a1t0l
    lda.w #0x1000
    sta.w snes_regs.das0l
    lda.w #0x5800
    sta.w snes_regs.vmaddl
    sep #0x20
    lda.w snes_regs.rdvramh
    lda.b #0x01
    sta.w snes_regs.mdmaen
    rts

;-----

_80CE0C:
    lda.b #0x80
    sta.w snes_regs.vmain
    lda.b #0x18
    sta.w snes_regs.bbad0
    lda.b #0x7F
    sta.w snes_regs.a1b0
    lda.b #0x01
    sta.w snes_regs.dmap0
    rep #0x20
    lda.w #0xA400
    sta.w snes_regs.a1t0l
    lda.w #0x1000
    sta.w snes_regs.das0l
    lda.w #0x5800
    sta.w snes_regs.vmaddl
    sep #0x20
    lda.b #0x01
    sta.w snes_regs.mdmaen
    rts

;-----

_80CE3C:
    lda.w 0x0BDB
    lsr
    cmp.b 0x0A
    beq .CE81

    jsr _80CE95
    lda.b 0x0A
    cmp.b #0x09
    bcs .CE81

    asl
    sta.w 0x0BDB
    cmp.b #0x00
    beq .CE5D

    clc
    adc.b #0x3E
    tay
    jsl _808A64
.CE5D:
    ldx.b #0x30
    lda.w 0x0BDB
    clc
    adc.b #0x40
    tay
    jsl _828000
    jsl 0x84A2A7
    ldx.b 0x0A
    lda.w 0x86BABB,X
    sta.w 0x0C0F
    stz.w 0x0BDD
    stz.w 0x0C0B
    lda.b #0x40
    tsb.w 0x1F24
.CE81:
    rep #0x30
    lda.w 0x0BDB
    and.w #0x00FF
    clc
    adc.w #0x0100
    tay
    jsl _828000.8011
    sep #0x30
    rts

;-----

_80CE95:
    jsl 0x84AC5A
    cpy.b #0x00
    beq .CEAD

    rep #0x10
.CE9F:
    dey
    dey
    bmi .CEAB

    ldx.w 0x0000,Y
    stz.w 0x0028,X
    bra .CE9F

.CEAB:
    sep #0x10
.CEAD:
    rts

;-----

_80CEAE:
    php
    phd
    rep #0x30
    lda.w #0x0000
    tcd
    lda.b 0x00
    sec
    sbc.b 0x04
    bpl .CEC1

    eor.w #0xFFFF
    inc
.CEC1:
    sta.b 0x00
    sta.b 0x04
    lda.b 0x02
    sec
    sbc.b 0x06
    bpl .CED0

    eor.w #0xFFFF
    inc
.CED0:
    sta.b 0x02
    cmp.b 0x04
    bmi .CEDC

    sta.b 0x00
    lda.b 0x04
    sta.b 0x02
.CEDC:
    ldx.w #0x0000
    lda.b 0x00
.CEE1:
    bit.w #0xFF00
    beq .CEEC

    lsr.b 0x02
    lsr
    inx
    bra .CEE1

.CEEC:
    sta.b 0x00
    stx.b 0x08
    sep #0x20
    lda.b 0x00
    sta.w snes_regs.wrmpya
    sta.w snes_regs.wrmpyb
    nop
    nop
    nop
    nop
    rep #0x20
    lda.w snes_regs.rdmpyl
    sta.b 0x04
    sep #0x20
    lda.b 0x02
    sta.w snes_regs.wrmpya
    sta.w snes_regs.wrmpyb
    nop
    nop
    nop
    nop
    rep #0x20
    lda.w snes_regs.rdmpyl
    clc
    adc.b 0x04
    sta.b 0x06
    lda.b 0x04
.CF1F:
    clc
    adc.b 0x00
    adc.b 0x00
    inc
    inc.b 0x00
    cmp.b 0x06
    bcc .CF1F

    dec.b 0x00
    ldx.b 0x08
    beq .CF39

    lda.b 0x00
.CF33:
    asl
    dex
    bne .CF33

    sta.b 0x00
.CF39:
    pld
    plp
    rtl

;-----

_80CF3C:
    rep #0x20
    stz.b 0x00
.CF40:
    sec
    sbc.b 0x00
    bcc .CF4D

    sbc.b 0x00
    bcc .CF4D

    inc.b 0x00
    bra .CF40

.CF4D:
    rts

;-----

_80CF4E:
    stz.w 0x0B9D
.CF51:
    lda.w 0x0B9D
    beq .CF51

    rep #0x20
    lda.b 0xA7
    eor.b 0xA9
    and.b 0xA7
    sta.b 0xAB
    sep #0x30
    rts

;-----

_80CF63:
    lda.b #0x01
    sta.w 0x0BA5
    jsr _80CF4E
    lda.b #0xC0
    sta.w snes_regs.inidisp
    lda.b #0x0C
    sta.w snes_regs.bg1sc
    sta.w snes_regs.bg2sc
    sta.w snes_regs.bg3sc
    stz.w snes_regs.mosaic
    lda.b #0x09
    sta.w snes_regs.bgmode
    rep #0x20
    lda.w #0x0C00
    sta.w snes_regs.vmaddl
    lda.w #0x1809
    sta.w snes_regs.dmap0
    lda.w #0xFFB0
    sta.w snes_regs.a1t0l
    lda.w #0x0800
    sta.w snes_regs.das0l
    sep #0x20
    stz.w snes_regs.a1b0
    lda.b #0x80
    sta.w snes_regs.vmain
    lda.b #0x01
    sta.w snes_regs.mdmaen
    jsr _80CF4E
    lda.b #0x0A
    jsr _8089CA
    stz.w 0x1F71
    stz.w 0x1F6F
    stz.w 0x1F70
    stz.w 0x1F73
    jsr _80D0E7
.CFC3:
    sep #0x30
    jsr _80CF4E
    lda.w 0x0BA5
    beq .CFE9

    ldy.b #0x0C
    ldx.b #0x00
    rep #0x20
    lda.b 0xAB
    and.w #0x0FF0
.CFD8:
    asl
    bcs .CFE2

    inx
    inx
    dey
    bne .CFD8

    bra .CFC3

.CFE2:
    sep #0x20
    jsr (.CFEA,X)
    bra .CFC3

.CFE9:
    rts

.CFEA: d16[.D002, .D002, .D002, .D002, .D003, .D033, .D048, .D050, .D05E, .D06A, .D09F, .D09F]

.D002:
    rts

.D003:
    rep #0x20
    lda.w #0x0010
    bit.b 0xA7
    bpl .D011

    lda.w #0x0100
    bra .D016

.D011:
    bvc .D016

    lda.w #0x0040
.D016:
    clc
    adc.w 0x1F6F
    sta.w 0x1F6F
    lda.w 0x1F73
    and.w #0x0003
    asl
    tay
    lda 0xA55F,Y
    and.w 0x1F6F
    sta.w 0x1F6F
    sep #0x20
    jmp _80D0E7

.D033:
    rep #0x20
    lda.w #0xFFF0
    bit.b 0xA7
    bpl .D041

    lda.w #0xFF00
    bra .D016

.D041:
    bvc .D016

    lda.w #0xFFC0
    bra .D016

.D048:
    sec
    lda.w 0x1F71
    sbc.b #0x04
    bra .D056

.D050:
    clc
    lda.w 0x1F71
    adc.b #0x04
.D056:
    and.b #0x1C
    sta.w 0x1F71
    jmp _80D0E7

.D05E:
    lda.w 0x1F72
    clc
    adc.b #0x40
    sta.w 0x1F72
    jmp _80D0E7

.D06A:
    lda.w 0x1F73
    cmp.b #0x03
    bne .D07A

    lda.w 0x1F78
    sta.w snes_regs.bg12nba
    jsr _80D0D1

.D07A:
    lda.w 0x1F73
    inc
    and.b #0x03
    sta.w 0x1F73
    tay
    lda 0xA567,Y
    sta.w 0x0BA5
    stz.w 0x1F6F
    stz.w 0x1F70
    cpy.b #0x03
    bne .D09C

    lda.b #0x66
    sta.w snes_regs.bg12nba
    jsr _80D0D1
.D09C:
    jmp _80D0E7

.D09F:
    lda.w 0x1F73
    cmp.b #0x03
    bne .D0A9

    jsr _80D0D1
.D0A9:
    stz.w 0x0BA5
    lda.w 0x1F74
    sta.w snes_regs.bgmode
    lda.w 0x1F75
    sta.w snes_regs.bg1sc
    lda.w 0x1F76
    sta.w snes_regs.bg2sc
    lda.w 0x1F77
    sta.w snes_regs.bg3sc
    lda.w 0x1F78
    sta.w snes_regs.bg12nba
    lda.w 0x1F79
    sta.w snes_regs.bg34nba
    rts

;-----

_80D0D1:
    ldx.b #0x00
.D0D3:
    lda.w 0x0300,X
    xba
    lda.w 0x0400,X
    sta.w 0x0300,X
    xba
    sta.w 0x0400,X
    inx
    bne .D0D3

    inc.b 0xA1
    rts

;-----

_80D0E7:
    clc
    lda.w 0x1F73
    adc.b #0x0B
    jsr _8089CA
    ldx.b 0xA4
    lda.b #0x80
    sta.w 0x0600,X
    inx
    lda.b #0x93
    sta.w 0x0600,X
    inx
    lda.b #0x0C
    sta.w 0x0600,X
    inx
    lda.b #0x06
    sta.w 0x0600,X
    inx
    lda.b #0x28
    sta.b 0x00
    lda.w 0x1F70
    and.b #0x0F
    jsr _80D1DC
    lda.w 0x1F6F
    lsr
    lsr
    lsr
    lsr
    jsr _80D1DC
    lda.w 0x1F6F
    and.b #0x0F
    jsr _80D1DC
    lda.b #0x80
    sta.w 0x0600,X
    inx
    lda.b #0xD0
    sta.w 0x0600,X
    inx
    lda.b #0x0C
    sta.w 0x0600,X
    inx
    lda.b #0x0A
    sta.w 0x0600,X
    inx
    lda.w 0x1F71
    lsr
    lsr
    and.b #0x07
    jsr _80D1DC
    lda.b #0x20
    jsr _80D1DC.D1E4
    lda.b #0x56
    bit.w 0x1F72
    bmi .D158

    lda.b #0x20
.D158:
    jsr _80D1DC.D1E4
    lda.b #0x20
    jsr _80D1DC.D1E4
    lda.b #0x48
    bvs .D166

    lda.b #0x20
.D166:
    jsr _80D1DC.D1E4
    stx.b 0xA4
    jsr _80CF4E
    lda.w 0x1F73
    asl
    tay
    rep #0x20
    lda 0xA55F,Y
    sta.b 0x02
    lda.w #0x0D28
    sta.b 0x10
    lda.w 0x1F6F
    sta.b 0x00
    sep #0x20
    lda.b #0x04
    sta.b 0x05
.D18A:
    lda.b #0x04
    sta.b 0x04
.D18E:
    ldx.b 0xA4
    lda.b #0x80
    sta.w 0x0600,X
    inx
    lda.b 0x10
    sta.w 0x0600,X
    inx
    lda.b 0x11
    sta.w 0x0600,X
    inx
    lda.b #0x20
    sta.w 0x0600,X
    inx
    ldy.b #0x10
    lda.w 0x1F71
    ora.w 0x1F72
    ora.b 0x01
    xba
    lda.b 0x00
    rep #0x20
.D1B7:
    sta.w 0x0600,X
    inx
    inx
    inc
    dey
    bne .D1B7

    stx.b 0xA4
    and.b 0x02
    sta.b 0x00
    lda.b 0x10
    clc
    adc.w #0x0020
    sta.b 0x10
    sep #0x20
    dec.b 0x04
    bne .D18E

    jsr _80CF4E
    dec.b 0x05
    bne .D18A

    rts

;-----

_80D1DC:
    cmp.b #0x0A
    bcc .D1E2

    adc.b #0x06
.D1E2:
    adc.b #0x30
.D1E4:
    sta.w 0x0600,X
    inx
    lda.b 0x00
    sta.w 0x0600,X
    inx
    rts

;-----

_80D1EF:
    phd
    pea 0x0000
    pld
    jsr _80D583
    pld
    rtl

;-----

_80D1F9:
    jsr _80DEEF
    rtl

;-----

_80D1FD:
    jsr _80B5E4
    rtl

;-----

_80D201:
    php
    phd
    rep #0x20
    sep #0x10
    ldx.w 0x1F19
    bne .D218

    lda.w 0x0BAD
    sta.w 0x0BCA
    lda.w 0x0BB0
    sta.w 0x0BCC
.D218:
    sep #0x20
    stz.w 0x1F0D
    ldx.w 0x1F15
    beq .D227

    jsr _80D2BF
    bra .D22A

.D227:
    jsr _80D2B1
.D22A:
    jsl _81812E
    stz.w 0x0BD4
    ldx.w 0x1F13
    beq .D23B

    jsr _80D40E
    bra .D23E

.D23B:
    jsr _80D3F1
.D23E:
    ldx.w 0x1F13
    beq .D248

    jsr _80D46B
    bra .D24B

.D248:
    jsr _80D44E
.D24B:
    ldx.w 0x1F14
    beq .D255

    jsr _80D4BE
    bra .D258

.D255:
    jsr _80D4A1
.D258:
    ldx.w 0x1F16
    beq .D262

    jsr _80D314
    bra .D265

.D262:
    jsr _80D2F2
.D265:
    ldx.w 0x1F15
    beq .D26F

    jsr _80D51B
    bra .D272

.D26F:
    jsr _80D4FE
.D272:
    lda.b #0x80
    sta.w 0x1F1C
    ldx.w 0x1F19
    bne .D280

    jsl _819D59.local
.D280:
    stz.w 0x1F1C
    ldx.w 0x1F19
    bne .D291

    jsr _80DDEF
    jsr _80D55B
    jsr _80DEEF
.D291:
    ldx.w 0x1F17
    beq .D29B

    jsr _80D37E
    bra .D29E

.D29B:
    jsr _80D359
.D29E:
    ldx.w 0x1F18
    beq .D2A8

    jsr _80D3D0
    bra .D2AB

.D2A8:
    jsr _80D3AF
.D2AB:
    jsr _80D2D1
    pld
    plp
    rts

;-----

_80D2B1:
    lda.w 0x0E18
    beq .D2BE

    pea 0x0E18
    pld
    jsl _838000
.D2BE:
    rts

;-----

_80D2BF:
    lda.w 0x0E18
    beq _80D2B1.D2BE

    pea 0x0E18
    pld
    lda.b 0x0E
    bpl .D2D0

    jsl _82808F.80B4
.D2D0:
    rts

;-----

_80D2D1:
    rep #0x20
    lda.w #0x0C38
.D2D6:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D2E4

    lda.b 0x0A
    asl
    tax
    jsr (0x80F58F,X)
.D2E4:
    rep #0x21
    tdc
    adc.w #0x0020
    cmp.w #0x0C98
    bcc .D2D6

    sep #0x30
    rts

;-----

_80D2F2:
    rep #0x20
    lda.w #0x1628
.D2F7:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D301

    jsr _80D342
.D301:
    lda.w 0x1F16
    bne _80D314.D32F

    rep #0x21
    tdc
    adc.w #0x0030
    cmp.w #0x1928
    bcc .D2F7

    sep #0x30
    rts

;-----

_80D314:
    rep #0x20
    lda.w #0x1628
.D319:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D32F

    bpl .D327

    jsr _80D342.D34C
    bra .D32F

.D327:
    lda.b 0x0E
    bpl .D32F

    jsl _82808F.80B4
.D32F:
    lda.w 0x1F16
    beq _80D2F2.D301

    rep #0x21
    tdc
    adc.w #0x0030
    cmp.w #0x1928
    bcc .D319

    sep #0x30
    rts

;-----

_80D342:
    rep #0x20
    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
.D34C:
    sep #0x20
    lda.b #0x80
    trb.b 0x0E
    lda.b 0x0A
    asl
    tax
    jmp (0x80F31C,X)

;-----

_80D359:
    rep #0x20
    lda.w #0x1928
.D35E:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D370

    lda.b #0x80
    trb.b 0x0E
    lda.b 0x0A
    asl
    tax
    jsr (0x80F3B5,X)
.D370:
    rep #0x21
    tdc
    adc.w #0x0020
    cmp.w #0x1D08
    bcc .D35E

    sep #0x30
    rts

;-----

_80D37E:
    rep #0x20
    lda.w #0x1928
.D383:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D3A1

    bpl .D399

    lda.b #0x80
    trb.b 0x0E
    lda.b 0x0A
    asl
    tax
    jsr (0x80F3B5,X)
    bra .D3A1

.D399:
    lda.b 0x0E
    bpl .D3A1

    jsl _82808F.80B4
.D3A1:
    rep #0x21
    tdc
    adc.w #0x0020
    cmp.w #0x1D08
    bcc .D383

    sep #0x30
    rts

;-----

_80D3AF:
    rep #0x20
    lda.w #0x1D08
.D3B4:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D3C2

    lda.b 0x0A
    asl
    tax
    jsr (0x80F596,X)
.D3C2:
    rep #0x21
    tdc
    adc.w #0x0010
    cmp.w #0x1E08
    bcc .D3B4

    sep #0x30
    rts

;-----

_80D3D0:
    rep #0x20
    lda.w #0x1D08
.D3D5:
    tcd
    sep #0x30
    lda.b 0x00
    bpl .D3E3

    lda.b 0x0A
    asl
    tax
    jsr (0x80F596,X)
.D3E3:
    rep #0x21
    tdc
    adc.w #0x0010
    cmp.w #0x1E08
    bcc .D3D5

    sep #0x30
    rts

;-----

_80D3F1:
    rep #0x20
    lda.w #0x1228
.D3F6:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D400

    jsr _80D437
.D400:
    rep #0x21
    tdc
    adc.w #0x0040
    cmp.w #0x1428
    bcc .D3F6

    sep #0x30
    rts

;-----

_80D40E:
    rep #0x20
    lda.w #0x1228
.D413:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D429

    bpl .D421

    jsr _80D437.D441
    bra .D429

.D421:
    lda.b 0x0E
    bpl .D429

    jsl _82808F.80B4
.D429:
    rep #0x21
    tdc
    adc.w #0x0040
    cmp.w #0x1428
    bcc .D413

    sep #0x30
    rts

;-----

_80D437:
    rep #0x20
    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
.D441:
    sep #0x20
    lda.b #0x80
    trb.b 0x0E
    lda.b 0x0A
    asl
    tax
    jmp (0x80F68B,X)

;-----

_80D44E:
    rep #0x20
    lda.w #0x0C98
.D453:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D45D

    jsr _80D494
.D45D:
    rep #0x21
    tdc
    adc.w #0x0020
    cmp.w #0x0E18
    bcc .D453

    sep #0x30
    rts

;-----

_80D46B:
    rep #0x20
    lda.w #0x0C98
.D470:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D486

    bpl .D47E

    jsr _80D494
    bra .D486

.D47E:
    lda.b 0x0E
    bpl .D486
    jsl _82808F.80B4
.D486:
    rep #0x21
    tdc
    adc.w #0x0020
    cmp.w #0x0E18
    bcc .D470

    sep #0x30
    rts

;-----

_80D494:
    sep #0x20
    lda.b #0x80
    trb.b 0x0E
    lda.b 0x0A
    asl
    tax
    jmp (0x80F75D,X)

;-----

_80D4A1:
    rep #0x20
    lda.w #0x1428
.D4A6:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D4B0

    jsr _80D4E7
.D4B0:
    rep #0x21
    tdc
    adc.w #0x0040
    cmp.w #0x1628
    bcc .D4A6

    sep #0x30
    rts

;-----

_80D4BE:
    rep #0x20
    lda.w #0x1228
.D4C3:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D4D9

    bpl .D4D1

    jsr _80D4E7.D4F1
    bra .D4D9

.D4D1:
    lda.b 0x0E
    bpl .D4D9

    jsl _82808F.80B4
.D4D9:
    rep #0x21
    tdc
    adc.w #0x0040
    cmp.w #0x1628
    bcc .D4C3

    sep #0x30
    rts

;-----

_80D4E7:
    rep #0x20
    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
.D4F1:
    sep #0x20
    lda.b #0x80
    trb.b 0x0E
    lda.b 0x0A
    asl
    tax
    jmp (0x80F779,X)

;-----

_80D4FE:
    rep #0x20
    lda.w #ram.obj1
.D503:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D50D

    jsr _80D544
.D50D:
    rep #0x21
    tdc
    adc.w #0x0040
    cmp.w #0x1228
    bcc .D503

    sep #0x30
    rts

;-----

_80D51B:
    rep #0x20
    lda.w #0x0E68
.D520:
    tcd
    sep #0x30
    lda.b 0x00
    beq .D536

    bpl .D52E

    jsr _80D544.D54E
    bra .D536

.D52E:
    lda.b 0x0E
    bpl .D536

    jsl _82808F
.D536:
    rep #0x21
    tdc
    adc.w #0x0040
    cmp.w #0x1228
    bcc .D520

    sep #0x30
    rts

;-----

_80D544:
    rep #0x20
    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
.D54E:
    sep #0x20
    lda.b #0x80
    trb.b 0x0E
    lda.b 0x0A
    asl
    tax
    jmp (0x80F8D9,X)

;-----

_80D55B:
    rep #0x31
    ldx.w 0x1F2E
    beq .D580

    lda.w 0x0012,X
    adc.w 0x1E4D
    sec
    sbc.w 0x0005,X
    sta.w 0x1E8D
    lda.w 0x0014,X
    clc
    adc.w 0x1E50
    sec
    sbc.w 0x0008,X
    sta.w 0x1E90
    stz.w 0x1F2E
.D580:
    sep #0x30
    rts

;-----

_80D583:
    php
    phb
    sep #0x20
    rep #0x10
    jsr _80D7E2
    jsr _80D909
    jsr _80DA22
    lda.b #0x8D
    pha
    plb
    jsr _80D5F3
    jsr _80D67F
    jsr _80D6B0
    jsr _80D639
    sep #0x30
    lda.b 0xE4
    and.b #0x03
    beq .D5BA

.D5AA:
    lsr.b 0xE6
    lsr.b 0xE6
    inc
    and.b #0x03
    bne .D5AA

    ldx.b 0xE5
    lda.b 0xE6
    sta.w ram.oam.high,X
.D5BA:
    lda.b 0xE3
    sec
    sbc.b 0xE4
    beq .D5C3

    bcs .D5C5

.D5C3:
    lda.b #0x01
.D5C5:
    sta.b 0x00
    rep #0x30
    lda.b 0xE4
    and.w #0x007F
    asl
    asl
    tax
    sep #0x20
    lda.b #0xE0
.D5D5:
    sta.w ram.oam.low+1,X
    inx
    inx
    inx
    inx
    dec.b 0x00
    bne .D5D5

.D5E0:
    lda.b 0xE4
    sta.b 0xE3
    rep #0x20
    stz.b 0xE4
    stz.b 0xE6
    stz.b 0xE8
    stz.b 0xEA
    stz.b 0xEB
    plb
    plp
    rts

;-----

_80D5F3:
    stz.b 0x0E
.D5F5:
    lda.b #0x00
    xba
    lda.b 0x0E
    cmp.b 0xE7
    bcs .D60A

    asl
    tay
    ldx.w 0x0920,Y
    jsr _80D6BB
    inc.b 0x0E
    bra .D5F5

.D60A:
    stz.b 0x0E
.D60C:
    lda.b #0x00
    xba
    lda.b 0x0E
    cmp.b 0xE8
    bcs .D621

    asl
    tay
    ldx.w 0x0960,Y
    jsr _80D6BB
    inc.b 0x0E
    bra .D60C

.D621:
    stz.b 0x0E
.D623:
    lda.b #0x00
    xba
    lda.b 0x0E
    cmp.b 0xE9
    bcs .D638

    asl
    tay
    ldx.w 0x09A0,Y
    jsr _80D6BB
    inc.b 0x0E
    bra .D623

.D638:
    rts

;-----

_80D639:
    stz.b 0x0E
.D63B:
    lda.b #0x00
    xba
    lda.b 0x0E
    cmp.b 0xEA
    bcs .D650

    asl
    tay
    ldx.w 0x09E0,Y
    jsr _80D6BB
    inc.b 0x0E
    bra .D63B

.D650:
    stz.b 0x0E
.D652:
    lda.b #0x00
    xba
    lda.b 0x0E
    cmp.b 0xEB
    bcs .D667

    asl
    tay
    ldx.w 0x0A20,Y
    jsr _80D6BB
    inc.b 0x0E
    bra .D652

.D667:
    stz.b 0x0E
.D669:
    lda.b #0x00
    xba
    lda.b 0x0E
    cmp.b 0xEC
    bcs .D67E

    asl
    tay
    ldx.w 0x0A60,Y
    jsr _80D6BB
    inc.b 0x0E
    bra .D669

.D67E:
    rts

;-----

_80D67F:
    lda.w 0x0C38
    beq .D68F

    lda.w 0x0C46
    beq .D68F

    ldx.w #0x0C38
    jsr _80D6BB
.D68F:
    lda.w 0x0C58
    beq .D69F

    lda.w 0x0C66
    beq .D69F

    ldx.w #0x0C58
    jsr _80D6BB
.D69F:
    lda.w 0x0C78
    beq .D6AF

    lda.w 0x0C86
    beq .D6AF

    ldx.w #0x0C78
    jsr _80D6BB
.D6AF:
    rts

;-----

_80D6B0:
    ldx.w #0x0BA8
    lda.b 0x0E,X
    beq .D6BA

    jsr _80D6BB
.D6BA:
    rts

;-----

_80D6BB:
    lda.b 0x11,X
    and.b #0x40
    sta.b 0x0B
    lda.b 0x11,X
    and.b #0x3F
    sta.b 0x0F
    lda.b 0x18,X
    sta.b 0x10
    stz.b 0x19
    lda.b 0x19,X
    bpl .D6D3

    dec.b 0x19
.D6D3:
    sta.b 0x18
    rep #0x21
    lda.b 0x08,X
    adc.b 0x18
    sec
    sbc.w 0x1E50
    sta.b 0x02
    lda.b 0x05,X
    sec
    sbc.w 0x1E4D
    sta.b 0x00
    phx
    lda.b 0x16,X
    and.w #0x00FF
    sta.b 0x14
    asl
    clc
    adc.b 0x14
    tax
    lda.l 0x8D8000,X
    sta.b 0x1C
    lda.l 0x8D8002,X
    sta.b 0x1E
    plx
    lda.b 0x17,X
    and.w #0x007F
    sta.b 0x14
    asl
    clc
    adc.b 0x14
    tay
    lda [0x1C],Y
    sta.b 0x18
    iny
    lda [0x1C],Y
    sta.b 0x19
    lda.b 0xE4
    and.w #0x007F
    asl
    asl
    tax
    sep #0x20
    ldy.w #0x0000
    lda [0x18],Y
    sta.b 0x0C
.D729:
    jsr _80D77E
    sep #0x20
    bcs .D76C

    ldy.w #0x0003
    lda [0x18],Y
    adc.b 0x10
    sta.w ram.oam.low+2,X
    iny
    lda [0x18],Y
    and.b #0xCE
    ora.b 0x0F
    eor.b 0x0B
    sta.w ram.oam.low+3,X
    inx
    inx
    inx
    inx
    lda.b 0x05
    lsr
    ror.b 0xE6
    asl.b 0x0D
    ror.b 0xE6
    inc.b 0xE4
    lda.b 0xE4
    and.b #0x03
    bne .D76C

    phx
    lda.b 0xE5
    tax
    lda.b 0xE6
    sta.w ram.oam.high,X
    inc.b 0xE5
    cpx.w #0x001F
    plx
    bcs .D779

.D76C:
    ldy.b 0x18
    iny
    iny
    iny
    iny
    sty.b 0x18
    dec.b 0x0C
    bne .D729

    rts

.D779:
    plx
    plx
    jmp 0x80D5E0

;-----

_80D77E:
    ldy.w #0x0004
    lda [0x18],Y
    and.b #0x20
    asl
    asl
    sta.b 0x0D
    rep #0x20
    bne .D792

    lda.w #0xFFF8
    bra .D795

.D792:
    lda.w #0xFFF0
.D795:
    sta.b 0x08
    ldy.w #0x0001
    lda [0x18],Y
    bit.w #0x0080
    bne .D7A6

    and.w #0x00FF
    bra .D7A9

.D7A6:
    ora.w #0xFF00
.D7A9:
    bit.b 0x0A
    bvc .D7B3

    sec
    eor.w #0xFFFF
    adc.b 0x08
.D7B3:
    clc
    adc.b 0x00
    sta.w ram.oam.low,X
    sta.b 0x04
    clc
    adc.w #0x0010
    cmp.w #0x010F
    bcs .D7E1

    iny
    lda [0x18],Y
    bit.w #0x0080
    bne .D7D1

    and.w #0x00FF
    bra .D7D4

.D7D1:
    ora.w #0xFF00
.D7D4:
    clc
    adc.b 0x02
    sta.w ram.oam.low+1,X
    clc
    adc.w #0x000F
    cmp.w #0x00EF
.D7E1:
    rts

;-----

_80D7E2:
    lda.b #0x00
    xba
    lda.w 0x1F11
    tax
    jmp (.D7EC,X)

.D7EC: d16[.D7F4, .D840, .D8ED, .D900]

.D7F4:
    lda.b #0x02
    sta.w 0x1F11
    lda.b #0x10
    sta.b 0xE4
    lda.b #0x04
    sta.b 0xE5
    lda.b #0x80
    tsb.w 0x0BCF
    lda.b #0xAA
    sta.w ram.oam.high
    sta.w 0x0901
    sta.w 0x0902
    lda.b #0xAA
    sta.w 0x0903
    ldx.w #0x0000
.D819:
    lda.b #0x08
    sta.w ram.oam.low+0,X
    lda.b #0xE0
    sta.w ram.oam.low+1,X
    lda.b #0x80
    sta.w ram.oam.low+2,X
    lda.b #0x34
    sta.w ram.oam.low+3,X
    inx
    inx
    inx
    inx
    cpx.w #0x001C
    bne .D819

    lda.b #0x50
    sta.w ram.oam.low+1
    lda.b #0x86
    sta.w ram.oam.low+2
.D840:
    lda.b #0x10
    sta.b 0xE4
    lda.b #0x04
    sta.b 0xE5
    lda.w 0x0BCF
    bmi .D850

    jmp .D900

.D850:
    and.b #0x7F
    cmp.w 0x1F9A
    bcc .D85D

    lda.w 0x1F9A
    sta.w 0x0BCF
.D85D:
    sta.b 0x00
    lda.b #0x40
    sta.b 0x01
    ldx.w #0x0004
.D866:
    lda.b 0x00
    beq .D89E

    sec
    sbc.b #0x08
    sta.b 0x00
    bmi .D886

    lda.b 0x01
    sta.w ram.oam.low+1,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x80
    sta.w ram.oam.low+2,X
    inx
    inx
    inx
    inx
    bra .D866

.D886:
    asl.b 0x00
    lda.b 0x01
    sec
    sbc.b 0x00
    sta.w ram.oam.low+1,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x80
    sta.w ram.oam.low+2,X
    inx
    inx
    inx
    inx
.D89E:
    lda.b #0x80
    trb.w 0x0BCF
    lda.w 0x1F9A
    sec
    sbc.w 0x0BCF
    sta.b 0x00
.D8AC:
    lda.b 0x00
    sec
    sbc.b #0x08
    sta.b 0x00
    bmi .D8CA

    lda.b 0x01
    sta.w ram.oam.low+1,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x82
    sta.w ram.oam.low+2,X
    inx
    inx
    inx
    inx
    bra .D8AC

.D8CA:
    asl.b 0x00
    lda.b 0x01
    sec
    sbc.b 0x00
    sta.w ram.oam.low+1,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x82
    sta.w ram.oam.low+2,X
    inx
    inx
    inx
    inx
    lda.b 0x01
    sta.w ram.oam.low+1,X
    lda.b #0x84
    sta.w ram.oam.low+2,X
    rts

.D8ED:
    ldx.w #0x0018
.D8F0:
    lda.b #0xE0
    sta.w ram.oam.low+1,X
    dex
    dex
    dex
    dex
    bpl .D8F0

    lda.b #0x06
    sta.w 0x1F11
.D900:
    lda.b #0x10
    sta.b 0xE4
    lda.b #0x04
    sta.b 0xE5
    rts

;-----

_80D909:
    lda.b #0x00
    xba
    lda.w 0x1F12
    tax
    jmp (.D913,X)

.D913: d16[.D91B, .D95E, .DA0E, .DA0D]

.D91B:
    lda.b #0x02
    sta.w 0x1F12
    lda.w 0x0BDB
    bne .D92B

    lda.b #0x06
    sta.w 0x1F12
    rts

.D92B:
    tay
    lda 0x1F86,Y
    ora.b #0x80
    sta 0x1F86,Y
    ldx.w #0x0000
.D937:
    lda.b #0x18
    sta.w ram.oam.low+0x1C,X
    lda.b #0xE0
    sta.w ram.oam.low+0x1D,X
    lda.b #0x80
    sta.w ram.oam.low+0x1E,X
    lda.b #0x36
    sta.w ram.oam.low+0x1F,X
    inx
    inx
    inx
    inx
    cpx.w #0x0024
    bne .D937

    lda.b #0x50
    sta.w ram.oam.low+0x1D
    lda.b #0x20
    sta.w ram.oam.low+0x1E
.D95E:
    lda.w 0x0BDB
    tay
    lda 0x1F86,Y
    bmi .D96A

    jmp .DA0D

.D96A:
    and.b #0x3F
    cmp.b #0x1C
    bcc .D977

    lda.b #0x5C
    sta 0x1F86,Y
    lda.b #0x1C
.D977:
    sta.b 0x00
    lda.b #0x40
    sta.b 0x01
    ldx.w #0x0004
.D980:
    lda.b 0x00
    beq .D9B8

    sec
    sbc.b #0x08
    sta.b 0x00
    bmi .D9A0

    lda.b 0x01
    sta.w ram.oam.low+0x1D,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x80
    sta.w ram.oam.low+0x1E,X
    inx
    inx
    inx
    inx
    bra .D980

.D9A0:
    asl.b 0x00
    lda.b 0x01
    sec
    sbc.b 0x00
    sta.w ram.oam.low+0x1D,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x80
    sta.w ram.oam.low+0x1E,X
    inx
    inx
    inx
    inx
.D9B8:
    lda 0x1F86,Y
    and.b #0x7F
    ora.b #0x40
    sta 0x1F86,Y
    and.b #0x3F
    sta.b 0x02
    lda.b #0x1C
    sec
    sbc.b 0x02
    sta.b 0x00
.D9CD:
    lda.b 0x00
    sec
    sbc.b #0x08
    sta.b 0x00
    bmi .D9EB

    lda.b 0x01
    sta.w ram.oam.low+0x1D,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x82
    sta.w ram.oam.low+0x1E,X
    inx
    inx
    inx
    inx
    bra .D9CD

.D9EB:
    asl.b 0x00
    lda.b 0x01
    sec
    sbc.b 0x00
    sta.w ram.oam.low+0x1D,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x82
    sta.w ram.oam.low+0x1E,X
    inx
    inx
    inx
    inx
    lda.b 0x01
    sta.w ram.oam.low+0x1D,X
    lda.b #0x84
    sta.w ram.oam.low+0x1E,X
.DA0D:
    rts

.DA0E:
    ldx.w #0x001C
.DA11:
    lda.b #0xE0
    sta.w ram.oam.low+0x1D,X
    dex
    dex
    dex
    dex
    bpl .DA11

    lda.b #0x06
    sta.w 0x1F12
.DA21:
    rts

;-----

_80DA22:
    ldx.w 0x1F0E
    beq _80D909.DA21

    lda.b #0x18
    sta.b 0xE4
    lda.b #0x06
    sta.b 0xE5
    lda.b #0x00
    xba
    lda.w 0x1F10
    tax
    jmp (.DA39,X)

.DA39: d16[.DA43, .DA88, .DB27, .DB3F, _80D909.DA21]

.DA43:
    lda.b #0x02
    sta.w 0x1F10
    lda.b #0xAA
    sta.w 0x0903
    sta.w 0x0904
    sta.w 0x0905
    ldx.w #0x0000
.DA56:
    lda.b #0xE8
    sta.w ram.oam.low+0x40,X
    lda.b #0xE0
    sta.w ram.oam.low+0x41,X
    lda.b #0x80
    sta.w ram.oam.low+0x42,X
    lda.b #0x34
    sta.w ram.oam.low+0x43,X
    inx
    inx
    inx
    inx
    cpx.w #0x0020
    bne .DA56

    lda.b #0x50
    sta.w ram.oam.low+0x41
    lda.b #0xAA
    sta.w ram.oam.low+0x42
    ldy.w 0x1F0E
    lda 0x0027,Y
    ora.b #0x80
    sta 0x0027,Y
.DA88:
    ldy.w 0x1F0E
    lda 0x0027,Y
    bmi .DA93

    jmp .DB26

.DA93:
    and.b #0x7F
    sta.b 0x00
    lda.b #0x40
    sta.b 0x01
    ldx.w #0x0004
.DA9E:
    lda.b 0x00
    beq .DAD6

    sec
    sbc.b #0x08
    sta.b 0x00
    bmi .DABE

    lda.b 0x01
    sta.w ram.oam.low+0x41,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x80
    sta.w ram.oam.low+0x42,X
    inx
    inx
    inx
    inx
    bra .DA9E

.DABE:
    asl.b 0x00
    lda.b 0x01
    sec
    sbc.b 0x00
    sta.w ram.oam.low+0x41,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x80
    sta.w ram.oam.low+0x42,X
    inx
    inx
    inx
    inx
.DAD6:
    lda 0x0027,Y
    and.b #0x7F
    sta 0x0027,Y
    lda.b #0x20
    sec
    sbc 0x0027,Y
    sta.b 0x00
.DAE6:
    lda.b 0x00
    sec
    sbc.b #0x08
    sta.b 0x00
    bmi .DB04

    lda.b 0x01
    sta.w ram.oam.low+0x41,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x82
    sta.w ram.oam.low+0x42,X
    inx
    inx
    inx
    inx
    bra .DAE6

.DB04:
    asl.b 0x00
    lda.b 0x01
    sec
    sbc.b 0x00
    sta.w ram.oam.low+0x41,X
    sec
    sbc.b #0x10
    sta.b 0x01
    lda.b #0x82
    sta.w ram.oam.low+0x42,X
    inx
    inx
    inx
    inx
    lda.b 0x01
    sta.w ram.oam.low+0x41,X
    lda.b #0x84
    sta.w ram.oam.low+0x42,X
.DB26:
    rts

.DB27:
    ldx.w #0x0018
.DB2A:
    lda.b #0xE0
    sta.w ram.oam.low+0x41,X
    dex
    dex
    dex
    dex
    bpl .DB2A

    stz.w 0x1F10
    stz.w 0x1F0E
    stz.w 0x1F0F
    rts

.DB3F:
    ldx.w #0x0018
.DB42:
    lda.b #0xE0
    sta.w ram.oam.low+0x41,X
    dex
    dex
    dex
    dex
    bpl .DB42

    lda.b #0x08
    sta.w 0x1F10
    rts

;-----

_80DB53:
    phb
    php
    sep #0x30
    lda.b #0x00
    pha
    plb
    rep #0x30
    ldx.w #0x0BA8
    ldy.w #0x09D1
.DB63:
    stz.w 0x0000,X
    inx
    inx
    dey
    bne .DB63

    plp
    plb
    rts

;-----

_80DB6E:
    phb
    phd
    lda.b #0x7E
    pha
    plb
    rep #0x30
    ldx.w #0x03FE
.DB79:
    stz.w 0xFA02,X
    dex
    dex
    bpl .DB79

    sep #0x30
    pld
    plb
    rts

;-----

CODE_JP_80DB85:
    phb
    phd
    php
    rep #0x20
    lda.w #0x0000
    tcd
    sep #0x30
    lda.b #0x85
    pha
    plb
    lda.w 0x1F7A
    asl
    tax
    rep #0x20
    lda.w 0x8582C2,X
    sta.b 0x10
    lda.w #0xF800
    sta.b 0x14
    lda.w #0xFA02
    sta.b 0x18
    stz.b 0x00
    dec.b 0x00
    rep #0x30
.DBB0:
    lda (0x10)
    and.w #0x00FF
    sta.b 0x02
    inc.b 0x10
    cmp.b 0x00
    beq .DC2B

    sep #0x20
    lda.b #0x7E
    pha
    plb
    rep #0x20
.DBC5:
    lda.b 0x18
    sta (0x14)
    inc.b 0x14
    inc.b 0x14
    inc.b 0x00
    lda.b 0x00
    cmp.b 0x02
    bne .DBC5

    sep #0x20
    lda.b #0x85
    pha
    plb
    rep #0x20
.DBDD:
    ldx.b 0x10
    lda (0x10)
    and.w #0x00FF
    sta.b 0x04
    inc.b 0x10
    lda (0x10)
    sta.b 0x06
    inc.b 0x10
    inc.b 0x10
    phb
    sep #0x20
    lda.b #0x7E
    pha
    plb
    rep #0x20
    lda (0x18)
    and.w #0x00FF
    cmp.w #0x0087
    beq .DC08

    lda.w #0x0000
    sta (0x18)
.DC08:
    inc.b 0x18
    lda.b 0x06
    sta (0x18)
    inc.b 0x18
    inc.b 0x18
    txa
    sta (0x18)
    inc.b 0x18
    inc.b 0x18
    plb
    inc.b 0x10
    inc.b 0x10
    inc.b 0x10
    lda (0x10)
    inc.b 0x10
    and.w #0x0080
    beq .DBDD

    bra .DBB0

.DC2B:
    sep #0x20
    lda.b #0x7E
    pha
    plb
    rep #0x20
    lda.b 0x00
.DC35:
    lda.b 0x18
    sta (0x14)
    inc.b 0x14
    inc.b 0x14
    inc.b 0x00
    lda.b 0x00
    cmp.w #0x0100
    bne .DC35

    plp
    pld
    plb
    rts

;-----

_80DC4A:
    phb
    phd
    php
    sep #0x20
    lda.w 0x1F20
    asl
    asl
    asl
    asl
    sta.w 0x1FFE
    rep #0x30
    lda.w #0x0000
    tcd
    lda.w 0x1E6A
    cmp.w 0x1E4D
    bmi .DC7D

    and.w #0xFFE0
    sta.b 0x00
    lda.w 0x1E4D
    and.w #0xFFE0
    cmp.b 0x00
    beq .DCA6

    lda.w 0x1E4D
    sta.b 0x00
    bra .DC95

.DC7D:
    and.w #0xFFE0
    sta.b 0x00
    lda.w 0x1E4D
    and.w #0xFFE0
    cmp.b 0x00
    beq .DCA6

    lda.w 0x1E4D
    clc
    adc.w #0x0100
    sta.b 0x00
.DC95:
    lda.w 0x1E50
    sec
    sbc.w #0x0020
    sta.b 0x02
    lda.w #0x0120
    sta.b 0x04
    jsr _80DCEF
.DCA6:
    lda.w 0x1E50
    cmp.w 0x1E6C
    beq .DCEB

    bpl .DCC0

    lda.w 0x1E50
    sec
    sbc.w #0x0020
    sta.b 0x02
    lda.w #0x0020
    sta.b 0x04
    bra .DCCE

.DCC0:
    lda.w 0x1E50
    clc
    adc.w #0x00F0
    sta.b 0x02
    lda.w #0x0020
    sta.b 0x04
.DCCE:
    lda.w 0x1E4D
    sec
    sbc.w #0x0020
    sta.b 0x00
    lda.w #0x000A
    sta.b 0x06
.DCDC:
    jsr _80DCEF
    lda.b 0x00
    clc
    adc.w #0x0020
    sta.b 0x00
    dec.b 0x06
    bne .DCDC

.DCEB:
    plp
    pld
    plb
    rts

;-----

_80DCEF:
    phb
    sep #0x20
    lda.b #0x7E
    pha
    plb
    rep #0x20
    lda.b 0x00
    and.w #0xFFE0
    bit.w #0xE000
    beq .DD05

    jmp .DDC6

.DD05:
    lsr
    lsr
    lsr
    lsr
    clc
    adc.w #0xF800
    sta.b 0x10
    lda (0x10)
    sta.b 0x14
    inc.b 0x10
    inc.b 0x10
    lda (0x10)
    sta.b 0x10
    ldy.w #0x0001
    lda.b 0x14
.DD20:
    cmp.b 0x10
    bne .DD27

    jmp .DDC6

.DD27:
    lda (0x14),Y
    sec
    sbc.b 0x02
    cmp.b 0x04
    bcc .DD3A

    lda.b 0x14
    clc
    adc.w #0x0005
    sta.b 0x14
    bra .DD20

.DD3A:
    lda (0x14)
    and.w #0x00FF
    bne .DDAB

    iny
    iny
    lda (0x14),Y
    sta.b 0x18
    phb
    sep #0x20
    lda.b #0x85
    pha
    plb
    sep #0x20
    lda (0x18)
    and.b #0xF8
    cmp.w 0x1FFE
    beq .DD5B

    bcs .DDA8

.DD5B:
    rep #0x20
    lda (0x18)
    and.w #0x000F
    asl
    tax
    jsl _8282AC
    bne .DDA8

    sep #0x20
    phb
    lda.b #0x7E
    pha
    plb
    lda.b #0x01
    sta (0x14)
    plb
    ldy.w #0x0001
    lda (0x18),Y
    iny
    sta.w 0x0008,X
    lda (0x18),Y
    iny
    sta.w 0x0009,X
    lda (0x18),Y
    iny
    sta.w 0x000A,X
    lda (0x18),Y
    iny
    sta.w 0x000B,X
    lda (0x18),Y
    iny
    sta.w 0x0005,X
    lda (0x18),Y
    and.b #0x1F
    sta.w 0x0006,X
    inc.w 0x0000,X
    rep #0x20
    lda.b 0x14
    sta.w 0x000C,X
.DDA8:
    rep #0x20
    plb
.DDAB:
    lda.b 0x14
    clc
    adc.w #0x0005
    sta.b 0x14
    cmp.b 0x10
    beq .DDC6

    ldy.w #0x0001
    lda (0x14),Y
    sec
    sbc.b 0x02
    cmp.b 0x04
    bcs .DDC6

    jmp .DD3A

.DDC6:
    plb
    rts

;-----

_80DDC8:
    rep #0x20
    sec
    lda.b 0x05
    sbc.w 0x1E4D
    clc
    adc.w #0x0020
    cmp.w #0x0140
    bcs .DDE5

    sec
    lda.b 0x08
    sbc.w 0x1E50
    clc
    cmp.w #0x00F2
    bcc .DDEA

.DDE5:
    sep #0x20
    lda.b #0x00
    rtl

.DDEA:
    sep #0x20
    lda.b #0x01
    rtl

;-----

_80DDEF:
    php
    phd
    rep #0x20
    lda.w #0x1E48
    tcd
    ldx.b 0x01
    jsr (.DE27,X)
    lda.b 0x30
    bit.w #0x0001
    beq .DE06

    jsr _80E167
.DE06:
    lda.b 0x30
    bit.w #0x0002
    beq .DE10

    jsr _80E198
.DE10:
    jsr _80E1C9
    ldx.b 0x00
    beq .DE1A

    jsr _80B5E4
.DE1A:
    lda.b 0x05
    sta.w 0x00B4
    lda.b 0x08
    sta.w 0x00B6
    pld
    plp
    rts

.DE27: d16[.DE2D, .DE54, .DE53]

.DE2D:
    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
    lda.b 0x10
    sta.b 0x18
    lda.b 0x0E
    sta.b 0x16
    lda.b 0x14
    sta.b 0x26
    lda.b 0x12
    sta.b 0x20
    lda.w #0x0002
    sta.b 0x0A
    lda.w #0x0008
    sta.b 0x0C
    ldx.b #0x02
    stx.b 0x01
.DE53:
    rts

.DE54:
    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
    lda.b 0x0C
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    jsr _80DED0
    jsr _80DEB1
    jsr _80DE92
    jsr _80DE73
    jmp 0x80E0F2

;-----

_80DE73:
    lda.b 0x08
    sec
    sbc.b 0x24
    bmi .DE86

    cmp.b 0x0C
    bmi .DE80

    lda.b 0x0C
.DE80:
    clc
    adc.b 0x24
    sta.b 0x08
    rts

.DE86:
    cmp.b 0x1A
    bpl .DE8C

    lda.b 0x1A
.DE8C:
    clc
    adc.b 0x24
    sta.b 0x08
    rts

;-----

_80DE92:
    lda.b 0x05
    sec
    sbc.b 0x22
    bmi .DEA5

    cmp.b 0x0C
    bmi .DE9F

    lda.b 0x0C
.DE9F:
    clc
    adc.b 0x22
    sta.b 0x05
    rts

.DEA5:
    cmp.b 0x1A
    bpl .DEAB

    lda.b 0x1A
.DEAB:
    clc
    adc.b 0x22
    sta.b 0x05
    rts

;-----

_80DEB1:
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sec
    sbc.b 0x2C
    bmi .DECA

    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sec
    sbc.b 0x2E
    beq .DEC9

    bpl .DECA

.DEC9:
    rts

.DECA:
    clc
    adc.b 0x05
    sta.b 0x05
    rts

;-----

_80DED0:
    lda.w 0x0BB0
    sec
    sbc.b 0x08
    sec
    sbc.b 0x28
    bmi .DEE9

    lda.w 0x0BB0
    sec
    sbc.b 0x08
    sec
    sbc.b 0x2A
    beq .DEE8

    bpl .DEE9

.DEE8:
    rts

.DEE9:
    clc
    adc.b 0x08
    sta.b 0x08
    rts

;-----

_80DEEF:
    php
    phd
    rep #0x20
    lda.w #0x1E88
    tcd
    ldx.b 0x12
    bne .DF03

    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
.DF03:
    ldx.b 0x01
    jsr (.DF1C,X)
    ldx.b 0x00
    beq .DF0F

    jsr _80B5E4.B5F2
.DF0F:
    lda.b 0x05
    sta.w 0x00B8
    lda.b 0x08
    sta.w 0x00BA
    pld
    plp
    rts

.DF1C: d16[.DF2E, .DF37, .DFC8, .DFEE, 0x80E04A, 0x80E08B, .DF36, .DFDB, .DFE0]

.DF2E:
    sep #0x20
    lda.b #0x02
    sta.b 0x01
    rep #0x20
.DF36:
    rts

.DF37:
    jsr _80E0E8
    jsr _80E0DE
.DF3D:
    sec
    lda.b 0x05
    sbc.b 0x22
    bmi .DF62

    cmp.w #0x0010
    bmi .DF82

    cmp.w #0x0108
    bmi .DF58

    sec
    lda.b 0x05
    sbc.w #0x0100
    sta.b 0x05
    bra .DF82

.DF58:
    clc
    lda.b 0x22
    adc.w #0x0010
    sta.b 0x05
    bra .DF82

.DF62:
    eor.w #0xFFFF
    inc
    cmp.w #0x0010
    bmi .DF82

    cmp.w #0x0108
    bmi .DF7A

    clc
    lda.b 0x05
    adc.w #0x0100
    sta.b 0x05
    bra .DF82

.DF7A:
    sec
    lda.b 0x22
    sbc.w #0x0010
    sta.b 0x05
.DF82:
    sec
    lda.b 0x08
    sbc.b 0x24
    bmi .DFA7

    cmp.w #0x0010
    bmi .DFC7

    cmp.w #0x0108
    bmi .DF9D

    sec
    lda.b 0x08
    sbc.w #0x0100
    sta.b 0x08
    bra .DFC7

.DF9D:
    clc
    lda.b 0x24
    adc.w #0x0010
    sta.b 0x08
    bra .DFC7

.DFA7:
    eor.w #0xFFFF
    inc
    cmp.w #0x0010
    bmi .DFC7

    cmp.w #0x0108
    bmi .DFBF

    clc
    lda.b 0x08
    adc.w #0x0100
    sta.b 0x08
    bra .DFC7

.DFBF:
    sec
    lda.b 0x24
    sbc.w #0x0010
    sta.b 0x08
.DFC7:
    rts

.DFC8:
    lda.w 0x1E4D
    clc
    adc.b 0x0A
    sta.b 0x05
.DFD0:
    lda.w 0x1E50
    clc
    adc.b 0x0C
    sta.b 0x08
    jmp .DF3D

.DFDB:
    jsr _80E0DE
    bra .DFD0

.DFE0:
    lda.w 0x1E4D
    clc
    adc.b 0x0A
    sta.b 0x05
    jsr _80E0E8
    jmp .DF3D

.DFEE:
    ldx.b 0x02
    jmp (.DFF3,X)

.DFF3: d16[.DFF7, .E006]

.DFF7:
    lda.b 0x08
    sta.b 0x1C
    clc
    adc.w #0x0100
    sta.b 0x08
    ldx.b #0x02
    stx.b 0x02
    rts

.E006:
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.b 0x08
    cmp.b 0x1C
    bne .E01B

    ldx.b 0x03
    stx.b 0x01
    stz.b 0x02
    stz.w 0x1F27
.E01B:
    rts

;-----

_80E01C:
    php
    sep #0x20
    lda.b #0x0C
    sta.w 0x1E89
    sta.w 0x1E9A
    stz.w 0x1E88
    plp
    rtl

;-----

_80E02C:
    jsr .local
    rtl

.local:
    php
    sep #0x30
    lda.w 0x1E89
    cmp.b #0x06
    beq .E03D

    sta.w 0x1E8B
.E03D:
    lda.b #0x06
    sta.w 0x1E89
    stz.w 0x1E8A
    sta.w 0x1F27
    plp
    rts

.E04A:
    ldx.b 0x02
    jmp (.E04F,X)

.E04F: d16[.E053, .E062]

.E053:
    stz.b 0x1C
    lda.b 0x05
    sta.b 0x0E
    lda.b 0x08
    sta.b 0x10
    ldx.b #0x02
    stx.b 0x02
    rts

.E062:
    lda.b 0x0E
    sta.w 0x0000
    clc
    lda.b 0x10
    adc.b 0x1C
    sta.w 0x0002
    jsr _80B5BE
    ldx.b 0x03
    jsr (0x80DF1C,X)
    clc
    lda.b 0x1C
    adc.w #0x0010
    sta.b 0x1C
    cmp.w #0x0100
    bmi .E08A

    ldx.b 0x03
    stx.b 0x01
    stz.b 0x02
.E08A:
    rts

.E08B:
    ldx.b 0x02
    jmp (.E090,X)

.E090: d16[.E096, .E0A9, .E0CA]

.E096:
    stz.b 0x1A
    lda.b 0x05
    sta.b 0x0E
    lda.b 0x08
    sta.b 0x10
    ldx.b #0x02
    stx.b 0x02
    ldx.b #0x00
    stx.w 0x1E88
.E0A9:
    clc
    lda.b 0x0E
    adc.b 0x1A
    sta.w 0x0000
    lda.b 0x10
    sta.w 0x0002
    jsr _80B5D1
    clc
    lda.b 0x1A
    adc.w #0x0010
    sta.b 0x1A
    cmp.w #0x0200
    bmi .E0CA

    ldx.b #0x04
    stx.b 0x02
.E0CA:
    lda.w 0x1E4D
    and.w #0x01FF
    clc
    adc.b 0x0A
    sta.b 0x05
    lda.w 0x1E50
    clc
    adc.b 0x0C
    sta.b 0x08
    rts

;-----

_80E0DE:
    lda.w 0x1E4D
    lsr
    clc
    adc.b 0x0A
    sta.b 0x05
    rts

;-----

_80E0E8:
    lda.w 0x1E50
    lsr
    clc
    adc.b 0x0C
    sta.b 0x08
    rts

;-----

_80E0F2:
    lda.b 0x10
    cmp.b 0x05
    bpl .E116

    sta.b 0x05
    clc
    adc.w #0x0100
    sta.w 0x0000
    lda.w 0x0BAD
    clc
    adc.w #0x0008
    cmp.w 0x0000
    bmi .E116

    lda.b 0x10
    clc
    adc.w #0x00F8
    sta.w 0x0BAD
.E116:
    lda.b 0x0E
    cmp.b 0x05
    bmi .E132

    sta.b 0x05
    lda.w 0x0BAD
    sec
    sbc.w #0x0008
    cmp.b 0x0E
    bpl .E132

    lda.b 0x0E
    clc
    adc.w #0x0008
    sta.w 0x0BAD
.E132:
    lda.b 0x14
    cmp.b 0x08
    bpl .E15E

    sta.b 0x08
    clc
    adc.w #0x00E0
    sta.w 0x0000
    lda.w 0x0BB0
    clc
    adc.w #0xFFE0
    cmp.w 0x0000
    bmi .E166

    lda.w 0x0BCF
    and.w #0x007F
    beq .E166

    ldx.b #0x7F
    stx.w 0x0BCE
    jsl 0x849F2A
.E15E:
    lda.b 0x12
    cmp.b 0x08
    bmi .E166

    sta.b 0x08
.E166:
    rts

;-----

_80E167:
    sep #0x20
    dec.b 0x31
    beq .E191

    dec.b 0x38
    bne .E17B

    lda.b 0x3C
    eor.b #0x80
    sta.b 0x3C
    lda.b 0x36
    sta.b 0x38
.E17B:
    lda.b 0x3C
    bmi .E195

    lda.b 0x3A
    sta.w 0x0000
    stz.w 0x0001
    rep #0x21
    lda.b 0x05
    adc.w 0x0000
    sta.b 0x05
    rts

.E191:
    lda.b #0x01
    trb.b 0x30
.E195:
    rep #0x20
    rts

;-----

_80E198:
    sep #0x20
    dec.b 0x32
    beq .E1C2

    dec.b 0x39
    bne .E1AC

    lda.b 0x3D
    eor.b #0x80
    sta.b 0x3D
    lda.b 0x37
    sta.b 0x39
.E1AC:
    lda.b 0x3D
    bmi .E1C6

    lda.b 0x3B
    sta.w 0x0000
    stz.w 0x0001
    rep #0x21
    lda.b 0x08
    adc.w 0x0000
    sta.b 0x08
    rts

.E1C2:
    lda.b #0x02
    trb.b 0x30
.E1C6:
    rep #0x20
    rts

;-----

_80E1C9:
    lda.b 0x16
    cmp.b 0x0E
    beq .E209

    cmp.b 0x05
    bmi .E1DE

    lda.b 0x05
    clc
    adc.b 0x0A
    cmp.b 0x16
    bmi .E207

    bra .E205

.E1DE:
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sec
    sbc.b 0x2C
    adc.w #0x0002
    cmp.w #0x0004
    bcc .E205

    lda.w 0x0BAD
    sec
    sbc.w 0x0BCA
    bmi .E1FB

    lda.w #0x0000
.E1FB:
    clc
    adc.b 0x05
    sec
    sbc.b 0x0A
    cmp.b 0x16
    bpl .E207

.E205:
    lda.b 0x16
.E207:
    sta.b 0x0E
.E209:
    lda.b 0x18
    cmp.b 0x10
    beq .E249

    cmp.b 0x05
    bpl .E21E

    lda.b 0x05
    sec
    sbc.b 0x0A
    cmp.b 0x18
    bpl .E247

    bra .E245

.E21E:
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sec
    sbc.b 0x2E
    adc.w #0x0002
    cmp.w #0x0004
    bcc .E245

    lda.w 0x0BAD
    sec
    sbc.w 0x0BCA
    bpl .E23B

    lda.w #0x0000
.E23B:
    clc
    adc.b 0x05
    clc
    adc.b 0x0A
    cmp.b 0x18
    bmi .E247

.E245:
    lda.b 0x18
.E247:
    sta.b 0x10
.E249:
    lda.b 0x20
    cmp.b 0x12
    beq .E28C

    cmp.b 0x08
    bmi .E25E

    lda.b 0x08
    clc
    adc.b 0x0A
    cmp.b 0x20
    bmi .E28A

    bra .E288

.E25E:
    lda.w 0x0BB0
    sec
    sbc.b 0x08
    sec
    sbc.b 0x28
    sta.w 0x0000
    adc.w #0x0002
    cmp.w #0x0004
    bcc .E288

    lda.w 0x0BB0
    sec
    sbc.w 0x0BCC
    bmi .E27E

    lda.w #0x0000
.E27E:
    clc
    adc.b 0x08
    sec
    sbc.b 0x0A
    cmp.b 0x20
    bpl .E28A

.E288:
    lda.b 0x20
.E28A:
    sta.b 0x12
.E28C:
    lda.b 0x26
    cmp.b 0x14
    beq .E2CF

    cmp.b 0x08
    bpl .E2A1

    lda.b 0x08
    sec
    sbc.b 0x0A
    cmp.b 0x26
    bpl .E2CD

    bra .E2CB

.E2A1:
    lda.w 0x0BB0
    sec
    sbc.b 0x08
    sec
    sbc.b 0x2A
    sta.w 0x0000
    adc.w #0x0002
    cmp.w #0x0004
    bcc .E2CB

    lda.w 0x0BB0
    sec
    sbc.w 0x0BCC
    bpl .E2C1

    lda.w #0x0000
.E2C1:
    clc
    adc.b 0x08
    clc
    adc.b 0x0A
    cmp.b 0x26
    bmi .E2CD

.E2CB:
    lda.b 0x26
.E2CD:
    sta.b 0x14
.E2CF:
    rts

;-----

_80E2D0:
    lda.w 0x0BDE
    sta.w 0x0BE0
    lda.w 0x0BDF
    sta.w 0x0BE1
    jmp 0x80E3BC

;-----

d08[0x60] ;rts probably

d16[.E2E6, .E34B, .E3BB]

.E2E6:
    lda.b #0x02
    sta.l 0x7F8400
    lda.b #0x01
    sta.l 0x001F26
    jsr _80E4D5
    lda.l 0x000B9C
    sta.w 0x000A
    lda.l 0x001F7A
    sta.w 0x000B
    lda.l 0x001F81
    sta.w 0x000C
    lda.l 0x000BDF
    and.b #0xCF
    sta.b 0x00
    lda.l 0x000BDE
    and.b #0x30
    ora.b 0x00
    sta.w 0x0040
    lda.l 0x000BDF
    and.b #0x10
    asl
    asl
    sta.w 0x0041
    lda.l 0x000BDE
    and.b #0x80
    tsb.w 0x0041
    rep #0x20
    lda.l 0x000BDE
    sta.w 0x0004
    lda.l 0x000BA6
    sta.w 0x0006
    stz.w 0x0001
    stz.w 0x0008
    stz.w 0x000D
    rts

.E34B:
    rep #0x10
    inc.w 0x0001
    lda.w 0x0001
    cmp.b #0x3F
    beq .E364

    rep #0x20
    lda.l 0x000BDE
    cmp.w 0x0004
    sep #0x20
    beq .E3BB

.E364:
    ldx.w 0x0008
    lda.l 0x000BDF
    and.b #0xCF
    sta.b 0x00
    lda.l 0x000BDE
    and.b #0x30
    ora.b 0x00
    sta.w 0x0042,X
    lda.l 0x000BDF
    and.b #0x10
    asl
    asl
    sta.b 0x00
    lda.l 0x000BDE
    and.b #0x80
    ora.b 0x00
    sta.w 0x0043,X
    lda.w 0x0001
    and.b #0x3F
    ora.w 0x0041,X
    sta.w 0x0041,X
    rep #0x20
    lda.l 0x000BDE
    sta.w 0x0004
    sep #0x20
    inx
    inx
    stx.w 0x0008
    stx.w 0x000D
    stz.w 0x0001
    cpx.w #0x1C00
    bne .E3BB

    lda.b #0x04
    sta.l 0x7F8400
.E3BB:
    rts

;-----

_80E3BC:
    phb
    phd
    php
    sep #0x30
    lda.b #0x7F
    pha
    plb
    ldx.w 0x8400
    jsr (.E3CF,X)
    plp
    pld
    plb
    rts

.E3CF: d16[.E3D5, .E44C, .E4C3]

.E3D5:
    lda.b #0x00
    sta.l 0x001F26
    lda.b #0x02
    sta.w 0x8400
    jsr _80E513
    lda.w 0x840A
    sta.l 0x000B9C
    lda.w 0x840B
    sta.l 0x001F7A
    lda.w 0x840C
    sta.l 0x001F81
    lda.w 0x8441
    and.b #0x3F
    sta.w 0x8401
    lda.w 0x8440
    and.b #0xCF
    sta.b 0x00
    lda.w 0x8441
    lsr
    lsr
    and.b #0x10
    ora.b 0x00
    sta.l 0x000BDF
    lda.w 0x8440
    and.b #0x30
    sta.b 0x00
    lda.w 0x8441
    and.b #0x80
    ora.b 0x00
    sta.l 0x000BDE
    rep #0x20
    lda.l 0x000BA6
    sta.w 0x8402
    lda.w 0x8406
    sta.l 0x000BA6
    stz.w 0x8408
    lda.w 0x843F
    and.w #0xFF00
    sta.l 0x000BDE
    sta.l 0x000BE0
    sta.l 0x000BE2
    rts

.E44C:
    rep #0x10
    lda.w 0x8401
    dec
    beq .E459

    sta.w 0x8401
    bra .E488

.E459:
    ldx.w 0x8408
    inx
    inx
    stx.w 0x8408
    lda.w 0x8441,X
    and.b #0x3F
    sta.w 0x8401
    cpx.w #0x1BFE
    beq .E473

    cpx.w 0x840D
    bcc .E488

.E473:
    lda.b #0x04
    sta.w 0x8400
    lda.w 0x8402
    sta.l 0x000BA6
    lda.w 0x8403
    sta.l 0x000BA7
    bra .E4C3

.E488:
    ldx.w 0x8408
    lda.w 0x8440,X
    and.b #0xCF
    sta.b 0x00
    lda.w 0x8441,X
    lsr
    lsr
    and.b #0x10
    ora.b 0x00
    sta.l 0x000BDF
    lda.w 0x8440,X
    and.b #0x30
    sta.b 0x00
    lda.w 0x8441,X
    and.b #0x80
    ora.b 0x00
    sta.l 0x000BDE
    rep #0x20
    lda.l 0x000BE0
    eor.w #0xFFFF
    and.l 0x000BDE
    sta.l 0x000BE2
    rts

.E4C3:
    rep #0x20
    lda.w #0x0000
    sta.l 0x000BDE
    sta.l 0x000BE0
    sta.l 0x000BE2
    rts

;-----

_80E4D5:
    lda.l 0x001F83
    sta.w 0x0010
    lda.l 0x001F84
    sta.w 0x0011
    lda.l 0x001F85
    sta.w 0x0012
    lda.l 0x001F86
    sta.w 0x0013
    lda.l 0x001F9A
    sta.w 0x0014
    lda.l 0x001F99
    sta.w 0x0015
    lda.l 0x001F9C
    sta.w 0x0028
    ldx.b #0x11
.E508:
    lda.l 0x001F87,X
    sta.w 0x0016,X
    dex
    bpl .E508

    rts

;-----

_80E513:
    lda.w 0x8410
    sta.l 0x001F83
    lda.w 0x8411
    sta.l 0x001F84
    lda.w 0x8412
    sta.l 0x001F85
    lda.w 0x8413
    sta.l 0x001F86
    lda.w 0x8414
    sta.l 0x001F9A
    lda.w 0x8415
    sta.l 0x001F99
    lda.w 0x8428
    sta.l 0x001F9C
    ldx.b #0x11
.E546:
    lda.w 0x8416,X
    sta.l 0x001F87,X
    dex
    bpl .E546

    stz.w 0x1F7B
    stz.w 0x1F7E
    rts

;-----

_80E557:
    rep #0x20
    lda.w 0x0BDE
    sta.w 0x0BE0
    sep #0x30
    lda.b 0xA7
    lsr
    lsr
    and.b #0x3C
    sta.b 0x02
    lda.b 0xA8
    and.b #0xC0
    tsb.b 0x02
    lda.b 0xA8
    lsr
    lsr
    lsr
    lsr
    and.b #0x03
    tsb.b 0x02
    lda.b 0xA8
    and.b #0x0F
    sta.w 0x0BDF
    jsr _80E594
    rep #0x20
    lda.w 0x0BE0
    eor.w #0xFFFF
    and.w 0x0BDE
    sta.w 0x0BE2
    sep #0x20
    rts

;-----

_80E594:
    stz.b 0x00
    stz.b 0x01
    lda.l 0x7EFFC4
    bne .E5A1

    clc
    bra .E5A7

.E5A1:
    and.b 0x02
    cmp.l 0x7EFFC4
.E5A7:
    ror.b 0x00
    lda.l 0x7EFFC3
    bne .E5B2

    clc
    bra .E5B8

.E5B2:
    and.b 0x02
    cmp.l 0x7EFFC3
.E5B8:
    ror.b 0x00
    lsr.b 0x00
    lda.l 0x7EFFC2
    bne .E5C5

    clc
    bra .E5CB

.E5C5:
    and.b 0x02
    cmp.l 0x7EFFC2
.E5CB:
    lda.b 0x00
    ror
    sta.w 0x0BDE
    lda.l 0x7EFFC5
    bne .E5DA

    clc
    bra .E5E0

.E5DA:
    and.b 0x02
    cmp.l 0x7EFFC5
.E5E0:
    ror.b 0x01
    lsr.b 0x01
    lda.l 0x7EFFC0
    bne .E5ED

    clc
    bra .E5F3

.E5ED:
    and.b 0x02
    cmp.l 0x7EFFC0
.E5F3:
    ror.b 0x01
    lda.l 0x7EFFC1
    bne .E5FE

    clc
    bra .E604

.E5FE:
    and.b 0x02
    cmp.l 0x7EFFC1
.E604:
    lda.b 0x01
    ror
    tsb.w 0x0BDF
    rts

;-----

_80E60B:
    php
    sep #0x20
    rep #0x10
    lda.b #0x02
    sta.w 0x1E89
    jsr _80E6A2
    rep #0x20
    lda.w 0x86A78A,X
    sta.w 0x1E4D
    sta.w 0x1E6A
    sta.w 0x00B4
    lda.w 0x86A78C,X
    sta.w 0x1E50
    sta.w 0x1E6C
    sta.w 0x00B6
    lda.w 0x86A78E,X
    sta.w 0x1E8D
    sta.w 0x1EAA
    sta.w 0x00B8
    lda.w 0x86A790,X
    sta.w 0x1E90
    sta.w 0x1EAC
    sta.w 0x00BA
    lda.w 0x86A792,X
    sta.w 0x1E56
    sta.w 0x1E5E
    lda.w 0x86A794,X
    sta.w 0x1E58
    sta.w 0x1E60
    lda.w 0x86A796,X
    sta.w 0x1E5A
    sta.w 0x1E68
    lda.w 0x86A798,X
    sta.w 0x1E5C
    sta.w 0x1E6E
    lda.w 0x86A79A,X
    sta.w 0x1E92
    lda.w 0x86A79C,X
    sta.w 0x1E94
    lda.w 0x86A79E,X
    and.w #0x00FF
    tay
    jsl _8180E3
    plp
    rts

;-----

_80E687:
    php
    sep #0x20
    rep #0x10
    jsr _80E6A2
    lda.w 0x86A79F,X
    sta.b 0x64
    rep #0x20
    lda.w 0x86A786,X
    sta.b 0x05
    lda.w 0x86A788,X
    sta.b 0x08
    plp
    rtl

;-----

_80E6A2:
    rep #0x20
    lda.w 0x1F81
    and.w #0x00FF
    asl
    sta.w 0x0000
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    tax
    lda.w 0x86A783,X
    clc
    adc.w 0x0000
    tax
    lda.w 0x86A783,X
    tax
    sep #0x20
    rts

;-----

_80E6C5:
    sep #0x30
    jsr _80E9E0
    lda.w 0x1F32
    bmi .E6D4

    ldy.b #0x0E
    jsr _808A70
.E6D4:
    jsr _808099.8100
    lda.b #0x04
    tsb.b 0xC0
    lda.w 0x1F32
    and.b #0x3F
    asl
    tax
    rep #0x20
    lda.l 0x84C87D,X
    sta.b 0x68
    stz.b 0x6C
    stz.b 0x6E
    stz.b 0xBC
    stz.b 0xBE
    stz.w 0x1F38
    sep #0x20
    stz.w 0x1F3C
    stz.w 0x1F3D
    inc.b 0x6F
    ldy.b #0x00
    lda.w 0x1F33
    sta.w 0x1F36
.E707:
    jsr _80E99C
    bit.b #0x80
    beq .E711

    jmp .E7CB

.E711:
    ldx.b 0xA4
    sta.w 0x0604,X
    lda.b 0x6E
    sta.w 0x0605,X
    lda.b #0x80
    sta.w 0x0600,X
    rep #0x21
    lda.b 0x6A
    adc.b 0x6C
    clc
    adc.w #0x0020
    and.w #0x07FF
    ora.w #0x0800
    sta.w 0x0601,X
    inc.b 0x6C
    sep #0x20
    lda.b #0x02
    sta.w 0x0603,X
    txa
    clc
    adc.b #0x06
    sta.b 0xA4
    lda.w 0x1F35
    beq .E77F

    ldx.b 0xA4
    lda.w 0x05FE,X
    cmp.b #0x20
    beq .E77F

    lda.b #0x2B
    sta.w 0x0604,X
    lda.b 0x6E
    sta.w 0x0605,X
    lda.b #0x80
    sta.w 0x0600,X
    rep #0x21
    lda.b 0x6A
    adc.b 0x6C
    clc
    adc.w #0x0020
    and.w #0x07FF
    ora.w #0x0800
    sta.w 0x0601,X
    sep #0x20
    lda.b #0x02
    sta.w 0x0603,X
    txa
    clc
    adc.b #0x06
    sta.b 0xA4
.E77F:
    lda.w 0x1F36
    bmi .E78C

    dec.w 0x1F36
    beq .E78C

    jmp .E707

.E78C:
    ldx.b 0x6F
    beq .E7B9

    lda.w 0x1F7F
    bne .E7AC

    phy
    lda.w 0x1F35
    beq .E7A6

    jsl get_rng
    and.b #0x03
    clc
    adc.b #0x81
    bra .E7A8

.E7A6:
    lda.b #0x0B
.E7A8:
    jsr _808850.8874
    ply
.E7AC:
    ldx.b 0x6F
    jsr _80E9ED
    beq .E7B5

    ldx.b #0x01
.E7B5:
    txa
    jsr _808099.810C
.E7B9:
    ldx.w 0x1F33
    lda.w 0x0BDF
    bit.b #0x10
    beq .E7C5

    ldx.b #0x08
.E7C5:
    stx.w 0x1F36
    jmp .E707

.E7CB:
    bit.b #0x40
    bne .E7EC

    and.b #0x0F
    asl
    tax
    jmp (.E7D6,X)

.E7D6: d16[.E7FF, .E81C, .E844, .E852, .E863, .E869, .E8BD, .E94A, .E96C, .E974, .E993]

.E7EC:
    and.b #0x0F
    asl
    asl
    and.b #0x1C
    sta.b 0x6E
    lda.w 0x1F32
    and.b #0x40
    lsr
    tsb.b 0x6E
    jmp .E707

.E7FF:
    rep #0x21
    lda.b 0x6A
    adc.w #0x0020
    and.w #0x07FF
    ora.w #0x0800
    sta.b 0x6A
    stz.b 0x6C
    tya
    adc.b 0x68
    sta.b 0x68
    sep #0x20
    ldy.b #0x00
    jmp .E707

.E81C:
    inc.w 0x1F3D
    jsr _808099.8100
.E822:
    jsr _80E9ED
    bne .E83B

    lda.w 0x0B9C
    and.b #0x10
    beq .E833

    jsr _80E9A5.E9AB
    bra .E836

.E833:
    jsr _80E9A5
.E836:
    jsr _808099.8100
    bra .E822

.E83B:
    stz.w 0x1F3D
    jsr _80E9A5
    jmp .E707

.E844:
    stz.w 0x0060
    stz.w 0x1F3C
    lda.b #0x01
    sta.w 0x1F3D
    jmp 0x8080F8

.E852:
    lda.b #0x00
    xba
    jsr _80E99C
    rep #0x21
    adc.b 0x6C
    sta.b 0x6C
    sep #0x20
    jmp .E707

.E863:
    lda.b #0x49
    sta.b 0x00
    bra .E86D

.E869:
    lda.b #0x47
    sta.b 0x00
.E86D:
    ldx.b 0xA4
    lda.b #0x81
    sta.w 0x0600,X
    sta.w 0x0606,X
    rep #0x21
    lda.b 0x6A
    adc.b 0x6C
    and.w #0x07FF
    ora.w #0x0800
    sta.w 0x0601,X
    clc
    adc.w #0x0020
    and.w #0x07FF
    ora.w #0x0800
    sta.w 0x0607,X
    inc.b 0x6C
    sep #0x20
    lda.b #0x02
    sta.w 0x0603,X
    sta.w 0x0609,X
    lda.b 0x00
    sta.w 0x0604,X
    lda.b 0x6E
    sta.w 0x0605,X
    jsr _80E99C
    sta.w 0x060A,X
    lda.b 0x6E
    sta.w 0x060B,X
    txa
    clc
    adc.b #0x0C
    sta.b 0xA4
    jmp .E707

.E8BD:
    inc.w 0x1F3D
    jsr _80E99C
    sta.w 0x1F3A
.E8C6:
    rep #0x21
    ldx.w 0x1F37
    beq .E8D5

    lda.w 0x0B9C
    and.w #0x0007
    bne .E8EE

.E8D5:
    lda.w 0x1F34
    and.w #0x00FF
    adc.b 0xBE
    sta.b 0xBE
    and.w #0xFFF8
    sta.b 0x00
    lda.w 0x1F38
    and.w #0xFFF8
    cmp.b 0x00
    bne .E8F3

.E8EE:
    jsr _808099.8100
    bra .E8C6

.E8F3:
    lda.b 0xBE
    sta.w 0x1F38
    ldx.b 0xA4
    clc
    adc.w #0x00E0
    and.w #0xFFF8
    asl
    asl
    and.w #0x07FF
    ora.w #0x0800
    sta.w 0x0601,X
    sep #0x20
    lda.b #0x80
    sta.w 0x0600,X
    lda.b #0x40
    sta.w 0x0603,X
    phx
    rep #0x20
    lda.w #0x0020
    sta.b 0x04
.E920:
    lda.w #0x0000
    sta.w 0x0604,X
    inx
    inx
    dec.b 0x04
    bne .E920

    sep #0x20
    pla
    clc
    adc.b #0x44
    sta.b 0xA4
    jsr _808099.8100
    dec.w 0x1F3A
    bne .E8C6

    stz.w 0x1F3D
    lda.w 0x1F7F
    bne .E947

    jsr _808099.8100
.E947:
    jmp .E707

.E94A:
    inc.w 0x1F3D
    jsr _808099.8100
    jsr _80E9ED
    beq .E95A

    jsr _80E99C
    bra .E960

.E95A:
    jsr _80E99C
    jsr _808099.810C
.E960:
    stz.w 0x1F3D
    lda.w 0x1F33
    sta.w 0x1F36
    jmp .E707

.E96C:
    jsr _80E99C
    sta.b 0x6F
    jmp .E707

.E974:
    jsr _80E99C
    sta.b 0x6A
    jsr _80E99C
    sta.b 0x6B
    rep #0x20
    lda.b 0xBE
    and.w #0x01F8
    asl
    asl
    clc
    adc.b 0x6A
    sta.b 0x6A
    stz.b 0x6C
    sep #0x20
    jmp .E707

.E993:
    inc.w 0x1F3C
    jsr _808099.8100
    jmp .E707

;-----

_80E99C:
    pea 0x8684
    plb
    lda (0x68),Y
    iny
    plb
    rts

;-----

_80E9A5:
    lda.b #0x00
    sta.b 0x00
    bra .E9AF

.E9AB:
    lda.b #0x7E
    sta.b 0x00
.E9AF:
    lda.b #0x20
    sta.b 0x01
    ldx.b 0xA4
    lda.b #0x80
    sta.w 0x0600,X
    lda.b #0x02
    sta.w 0x0603,X
    rep #0x21
    lda.b 0x6A
    adc.b 0x6C
    clc
    adc.w #0x0020
    and.w #0x07FF
    ora.w #0x0800
    sta.w 0x0601,X
    lda.b 0x00
    sta.w 0x0604,X
    sep #0x20
    txa
    clc
    adc.b #0x06
    sta.b 0xA4
    rts

;-----

_80E9E0:
    lda.w 0x1F25
    cmp.b #0x40
    bcc .E9EC

    jsr _808099.8100
    bra _80E9E0

.E9EC:
    rts

;-----

_80E9ED:
    lda.w 0x0BDE
    ora.w 0x0BDF
    and.b #0xF0
    rts

;-----

_80E9F6:
    phx
    phy
    php
    phd
    sep #0x30
    sta.w 0x1F32
    stz.w 0x1F35
    stz.w 0x1F37
    lda.b #0x01
    sta.w 0x1F33
    lda.b #0x02
    sta.w 0x1F34
    rep #0x20
    lda.w #0x0000
    tcd
    ldx.b #0x30
    stx.w 0x0060
    lda.w #0xE6C5
    jsr _80813B
    pld
    plp
    ply
    plx
    rtl

;-----

_80EA25:
    php
    rep #0x20
    phd
    lda.w #0x0000
    tcd
    sep #0x30
    jsr _808A2E
    jsr _808BB4
    lda.b #0x00
    sta.l 0x7EFFC8
    sta.l 0x7EFFC9
    sta.l 0x7EFF84
    sta.l 0x7EFF85
    jsr _8088D5
    lda.b #0x1C
    jsr _8089CA
    ldx.b #0x09
.EA51:
    phx
    lda.w 0x86BCDE,X
    jsr _8089CA
    plx
    dex
    bpl .EA51

    lda.b #0x07
    tsb.w 0x00A2
    jsr _808099.8100
    jsr _80ECE1
    lda.b #0x20
    jsr _8089CA
    ldy.b #0x4E
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x50
    jsr _80B2FF
    jsr _808099.8100
    rep #0x10
    ldy.w #0x0132
    jsl _828000.8011
    sep #0x10
    jsr _80EDAB
    jsr _80EDED
    jsr _808099.8100
    lda.l 0x7EFFCA
    cmp.b #0xF7
    beq .EA9C

    lda.b #0x42
    bra .EA9E

.EA9C:
    lda.b #0x40
.EA9E:
    jsr _8089CA
    jsr _80895C
    lda.b #0x00
    sta.l 0x7EFF80
.EAAA:
    lda.l 0x7EFF80
    sta.l 0x7EFF81
    lda.b 0xAC
    bit.b #0x04
    beq .EAC3

    lda.l 0x7EFF80
    inc
    sta.l 0x7EFF80
    bra .EAD5

.EAC3:
    bit.b #0x08
    beq .EAD2

    lda.l 0x7EFF80
    dec
    sta.l 0x7EFF80
    bra .EAD5

.EAD2:
    jsr _80EE2F
.EAD5:
    lda.l 0x7EFF80
    bpl .EAE3

    lda.b #0x09
    sta.l 0x7EFF80
    bra .EAED

.EAE3:
    cmp.b #0x0A
    bcc .EAED

    lda.b #0x00
    sta.l 0x7EFF80
.EAED:
    lda.l 0x7EFF81
    cmp.l 0x7EFF80
    beq .EB38

    lda.l 0x7EFF81
    tax
    lda.w 0x86BCDE,X
    cpx.b #0x06
    bne .EB11

    lda.l 0x7EFFCA
    cmp.b #0xF7
    beq .EB0F

    lda.b #0x42
    bra .EB11

.EB0F:
    lda.b #0x40
.EB11:
    jsr _8089CA
    lda.l 0x7EFF80
    tax
    lda.w 0x86BCDE,X
    inc
    cpx.b #0x06
    bne .EB2F

    lda.l 0x7EFFCA
    cmp.b #0xF7
    beq .EB2D

    lda.b #0x43
    bra .EB2F

.EB2D:
    lda.b #0x41
.EB2F:
    jsr _8089CA
    jsr _808099.8100
    jmp .EAAA

.EB38:
    lda.l 0x7EFF80
    asl
    tax
    jmp (.EB41,X)

.EB41: d16[.EB55, .EB55, .EB55, .EB55, .EB55, .EB55, .EBE8, .EC30, .EC74, .ECC0]

.EB55:
    lda.b 0xAB
    and.b #0xF0
    lsr
    lsr
    sta.b 0x00
    lda.b 0xAC
    and.b #0xC0
    tsb.b 0x00
    lda.b 0xAC
    lsr
    lsr
    lsr
    lsr
    and.b #0x03
    tsb.b 0x00
    lda.b 0x00
    bne .EBA0

    lda.b 0xAC
    bit.b #0x03
    beq .EBDF

    lda.l 0x7EFF80
    tax
    lda.l 0x7EFFC0,X
    beq .EB92

    sta.b 0x00
    lda.b 0xAC
    bit.b #0x02
    beq .EB8E

    asl.b 0x00
    bra .EBA0

.EB8E:
    lsr.b 0x00
    bra .EBA0

.EB92:
    lda.b 0xAC
    bit.b #0x02
    beq .EB9C

    lda.b #0x01
    bra .EB9E

.EB9C:
    lda.b #0x80
.EB9E:
    sta.b 0x00
.EBA0:
    lda.b #0x80
    sta.b 0x01
    lda.b 0x00
    ldx.b #0x00
.EBA8:
    asl
    bcs .EBB4

    lsr.b 0x01
    inx
    cpx.b #0x09
    bcs .EBB4

    bra .EBA8

.EBB4:
    ldx.b #0x05
.EBB6:
    lda.l 0x7EFFC0,X
    beq .EBC0

    cmp.b 0x01
    beq .EBC5

.EBC0:
    dex
    bpl .EBB6

    bra .EBD4

.EBC5:
    phx
    lda.l 0x7EFF80
    tax
    lda.l 0x7EFFC0,X
    plx
    sta.l 0x7EFFC0,X
.EBD4:
    lda.l 0x7EFF80
    tax
    lda.b 0x01
    sta.l 0x7EFFC0,X
.EBDF:
    jsr _80ECE1
    jsr _808099.8100
    jmp .EAAA

.EBE8:
    lda.b 0xAC
    and.b #0x03
    bne .EBF4

    jsr _808099.8100
    jmp .EAAA

.EBF4:
    lda.l 0x7EFFCA
    cmp.b #0xF7
    beq .EC16

    lda.b #0x41
    jsr _8089CA
    jsr _808850.8862
    jsr _808099.8100
    lda.b #0xF7
    sta.l 0x7EFFCA
    jsr _808850.8874
    jsr _808099.8100
    jmp .EAAA

.EC16:
    lda.b #0x43
    jsr _8089CA
    jsr _808850.8862
    jsr _808099.8100
    lda.b #0xF8
    sta.l 0x7EFFCA
    jsr _808850.8874
    jsr _808099.8100
    jmp .EAAA

.EC30:
    lda.b 0xAC
    bit.b #0x03
    beq .EC54

    bit.b #0x02
    beq .EC45

    lda.l 0x7EFFC8
    dec
    bpl .EC50

    lda.b #0x20
    bra .EC50

.EC45:
    lda.l 0x7EFFC8
    inc
    cmp.b #0x21
    bcc .EC50

    lda.b #0x00
.EC50:
    sta.l 0x7EFFC8
.EC54:
    lda.b 0xAC
    and.b #0x40
    bne .EC60

    lda.b 0xAB
    and.b #0x80
    beq .EC6B

.EC60:
    lda.l 0x7EFFC8
    clc
    adc.b #0x10
    jsl _80878B
.EC6B:
    jsr _80EDAB
    jsr _808099.8100
    jmp .EAAA

.EC74:
    lda.b 0xAC
    bit.b #0x03
    beq .EC9A

    bit.b #0x02
    beq .EC8B

    lda.l 0x7EFFC9
    dec
    cmp.b #0xFF
    bne .EC96

    lda.b #0xA2
    bra .EC96

.EC8B:
    lda.l 0x7EFFC9
    inc
    cmp.b #0xA3
    bcc .EC96

    lda.b #0x00
.EC96:
    sta.l 0x7EFFC9
.EC9A:
    lda.b 0xAC
    and.b #0x40
    bne .ECA6

    lda.b 0xAB
    and.b #0x80
    beq .ECB7

.ECA6:
    lda.b #0xF1
    jsr _808850.8874
    lda.l 0x7EFFC9
    bne .ECB3

    lda.b #0x01
.ECB3:
    jsl _80888B.88B6
.ECB7:
    jsr _80EDED
    jsr _808099.8100
    jmp .EAAA

.ECC0:
    lda.b 0xAC
    and.b #0x50
    bne .ECCC

    lda.b 0xAB
    and.b #0x80
    beq .ECDB

.ECCC:
    ldy.b #0x04
    jsr _808850.885C
    lda.b #0xF1
    jsr _808850.8874
    pld
    plp
    jmp _80897E

.ECDB:
    jsr _808099.8100
    jmp .EAAA

;-----

_80ECE1:
    rep #0x20
    lda.w #0x0953
    sta.b 0x10
    sep #0x20
    lda.l 0x7EFFC0
    jsr _80ED42
    rep #0x20
    lda.w #0x0973
    sta.b 0x10
    sep #0x20
    lda.l 0x7EFFC1
    jsr _80ED42
    rep #0x20
    lda.w #0x0993
    sta.b 0x10
    sep #0x20
    lda.l 0x7EFFC2
    jsr _80ED42
    rep #0x20
    lda.w #0x09B3
    sta.b 0x10
    sep #0x20
    lda.l 0x7EFFC3
    jsr _80ED42
    rep #0x20
    lda.w #0x09D3
    sta.b 0x10
    sep #0x20
    lda.l 0x7EFFC4
    jsr _80ED42
    rep #0x20
    lda.w #0x09F3
    sta.b 0x10
    sep #0x20
    lda.l 0x7EFFC5
    jsr _80ED42
    rts

;-----

_80ED42:
    ldy.b #0x00
.ED44:
    asl
    bcs .ED4C

    iny
    cpy.b #0x08
    bcc .ED44

.ED4C:
    tya
    sta.b 0x00
    asl
    clc
    adc.b 0x00
    asl
    tay
    ldx.b 0xA4
    lda.b #0x80
    sta.w 0x0600,X
    lda.b 0x10
    sta.w 0x0601,X
    lda.b 0x11
    sta.w 0x0602,X
    lda.b #0x0C
    sta.w 0x0603,X
    lda 0xBCE8,Y
    sta.w 0x0604,X
    lda 0xBCE9,Y
    sta.w 0x0606,X
    lda 0xBCEA,Y
    sta.w 0x0608,X
    lda 0xBCEB,Y
    sta.w 0x060A,X
    lda 0xBCEC,Y
    sta.w 0x060C,X
    lda 0xBCED,Y
    sta.w 0x060E,X
    lda.b #0x20
    sta.w 0x0605,X
    sta.w 0x0607,X
    sta.w 0x0609,X
    sta.w 0x060B,X
    sta.w 0x060D,X
    sta.w 0x060F,X
    lda.b 0xA4
    clc
    adc.b #0x10
    sta.b 0xA4
    rts

;-----

_80EDAB:
    ldx.b 0xA4
    lda.b #0x80
    sta.w 0x0600,X
    lda.b #0x04
    sta.w 0x0603,X
    rep #0x20
    lda.w #0x0AD3
    sta.w 0x0601,X
    sep #0x20
    lda.l 0x7EFFC8
    lsr
    lsr
    lsr
    lsr
    tay
    lda 0xEE13,Y
    sta.w 0x0604,X
    lda.l 0x7EFFC8
    and.b #0x0F
    tay
    lda 0xEE13,Y
    sta.w 0x0606,X
    lda.b #0x20
    sta.w 0x0605,X
    sta.w 0x0607,X
    lda.b 0xA4
    clc
    adc.b #0x08
    sta.b 0xA4
    rts

;-----

_80EDED:
    ldx.b 0xA4
    lda.b #0x80
    sta.w 0x0600,X
    lda.b #0x04
    sta.w 0x0603,X
    rep #0x20
    lda.w #0x0AF3
    sta.w 0x0601,X
    sep #0x20
    lda.l 0x7EFFC9
    lsr
    lsr
    lsr
    lsr
    tay
    lda 0xEE13,Y
    sta.w 0x0604,X
    lda.l 0x7EFFC9
    and.b #0x0F
    tay
    lda 0xEE13,Y
    sta.w 0x0606,X
    lda.b #0x20
    sta.w 0x0605,X
    sta.w 0x0607,X
    lda.b 0xA4
    clc
    adc.b #0x08
    sta.b 0xA4
    rts

;-----

_80EE2F:
    lda.l 0x7EFF84
    tax
    jmp (.EE37,X)

.EE37: d16[.EE3B, .EE4E]

.EE3B:
    lda.b 0xA8
    and.b #0x0C
    beq .EE4D

    lda.b #0x02
    sta.l 0x7EFF84
    lda.b #0x28
    sta.l 0x7EFF85
.EE4D:
    rts

.EE4E:
    lda.b 0xA8
    and.b 0xAA
    and.b #0x0C
    bne .EE5D

    lda.b #0x00
    sta.l 0x7EFF84
    rts

.EE5D:
    lda.l 0x7EFF85
    dec
    bne .EE7C

    lda.b 0xA8
    and.b #0x08
    beq .EE71

    lda.l 0x7EFF80
    dec
    bra .EE76

.EE71:
    lda.l 0x7EFF80
    inc
.EE76:
    sta.l 0x7EFF80
    lda.b #0x04
.EE7C:
    sta.l 0x7EFF85
    rts

;-----

_80EE81:
    php
    phd
    sep #0x30
.EE85:
    pea 0x1E48
    pld
    ldx.b 0x01
    jsr (.EEBA,X)
    jsr _80F2E5
    lda.b 0x00
    beq .EEAD

    jsl 0x87813B
    jsl 0x87807E
    jsl 0x878000
    pea 0x0000
    pld
    jsr _80D583
    jsr _808099.8100
    bra .EE85

.EEAD:
    pea 0x0000
    pld
    jsr _80D583
    jsr _808099.8100
    pld
    plp
    rts

.EEBA: d16[.EEC2, .EF22, .EF30, .EFA0]

.EEC2:
    jsr _80DB53
    inc.b 0x00
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.w 0x1F12
    sta.w 0x1F11
    lda.b #0x28
    jsl _80878B
    phd
    pea 0x0000
    pld
    ldy.b #0x48
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x4A
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x4C
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x56
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0xF8
    jsl _828000.8011
    ldy.b #0xEC
    ldx.b #0x40
    jsl _828000
    lda.b #0x35
    jsr _8089CA
    pld
    stz.b 0x04
    stz.b 0x07
    ldx.b #0x0B
.EF18:
    lda.l 0x7EFFCB,X
    sta.b 0x18,X
    dex
    bpl .EF18

    rts

.EF22:
    phd
    pea 0x0000
    pld
    jsr _80895C
    pld
    lda.b #0x04
    sta.b 0x01
    rts

.EF30:
    jsl 0x878118
    lda.b 0x04
    and.b #0x03
    sta.b 0x04
    lda.b 0x07
    cmp.b #0x04
    bcc .EF4A

    bmi .EF46

    stz.b 0x07
    bra .EF4A

.EF46:
    lda.b #0x03
    sta.b 0x07
.EF4A:
    lda.w 0x00AC
    and.b #0x80
    beq .EF67

    lda.b 0x07
    cmp.b #0x03
    bcs .EF67

    lda.b 0x07
    asl
    asl
    adc.b 0x04
    tax
    lda.b 0x18,X
    dec
    and.b #0x07
    sta.b 0x18,X
    bra .EF98

.EF67:
    lda.w 0x00AC
    and.b #0x40
    beq .EF98

    lda.b 0x07
    cmp.b #0x03
    bcc .EF89

.EF74:
    jsr _80F188
    bne .EF9F

    ldx.b #0x0B
.EF7B:
    lda.b 0x18,X
    sta.l 0x7EFFCB,X
    dex
    bpl .EF7B

    lda.b #0x06
    sta.b 0x01
    rts

.EF89:
    lda.b 0x07
    asl
    asl
    clc
    adc.b 0x04
    tax
    lda.b 0x18,X
    inc
    and.b #0x07
    sta.b 0x18,X
.EF98:
    lda.w 0x00AC
    and.b #0x10
    bne .EF74

.EF9F:
    rts

.EFA0:
    ldy.b #0x04
    jsr _808850.885C
    phd
    pea 0x0000
    pld
    jsr _80897E
    lda.b #0x07
    tsb.w 0x00A2
    jsr _808099.8100
    pld
    jsr _80DB53
    rts

;-----

_80EFBA:
    php
    phd
.EFBC:
    sep #0x30
    pea 0x1E48
    pld
    ldx.b 0x01
    jsr (.EFEC,X)
    lda.b 0x00
    beq .EFDF

    pea 0x0000
    pld
    jsl 0x87813B
    jsl 0x878000
    jsr _80D583
    jsr _808099.8100
    bra .EFBC

.EFDF:
    pea 0x0000
    pld
    jsr _80D583
    jsr _808099.8100
    pld
    plp
    rts

.EFEC: d16[.EFF4, .F049, .F05A, .F06D]

.EFF4:
    jsr _80DB53
    inc.b 0x00
    lda.b #0x03
    sta.b 0x07
    sta.b 0x04
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.w 0x1F12
    sta.w 0x1F11
    jsr _80F08C
    lda.b #0x28
    jsl _80878B
    phd
    pea 0x0000
    pld
    ldy.b #0x48
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x4A
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x4C
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0x56
    jsr _80B2FF
    jsr _808099.8100
    ldy.b #0xF8
    jsl _828000.8011
    ldy.b #0xEC
    ldx.b #0x40
    jsl _828000
    pld
    rts

.F049:
    phd
    pea 0x0000
    pld
    stz.w 0x00B3
    jsr _80895C
    pld
    lda.b #0x04
    sta.b 0x01
    rts

.F05A:
    lda.w 0x00A8
    and.b #0xD0
    bne .F068

    lda.w 0x00A7
    and.b #0xC0
    beq .F06C

.F068:
    lda.b #0x06
    sta.b 0x01
.F06C:
    rts

.F06D:
    ldy.b #0x04
    jsr _808850.885C
    phd
    pea 0x0000
    pld
    jsr _80897E
    lda.b #0x07
    tsb.w 0x00A2
    jsr _808099.8100
    pld
    stz.b 0x00
    stz.b 0x01
    stz.b 0x02
    stz.b 0x03
    rts

;-----

_80F08C:
    lda.w 0x1F99
    sta.b 0x18
    lda.w 0x1F9C
    sta.b 0x19
    ldx.b #0x0E
    stz.b 0x30
.F09A:
    lda.w 0x1F88,X
    asl
    asl
    rol.b 0x30
    dex
    dex
    bpl .F09A

    lda.b 0x30
    sta.b 0x1A
    lda.w 0x1F7E
    asl
    rol
    and.b #0x01
    sta.b 0x1B
    jsl get_rng
    and.b #0xE0
    tsb.b 0x1B
    lda.w 0x1F9B
    beq .F0C3

    lda.b #0x10
    tsb.b 0x1B
.F0C3:
    ldx.b #0x08
    ldy.b #0x00
    lda.b 0x18
.F0C9:
    lsr
    bcc .F0CD

    iny
.F0CD:
    dex
    bne .F0C9

    tya
    and.b #0x01
    asl
    asl
    asl
    tsb.b 0x1B
    ldx.b #0x08
    ldy.b #0x00
    lda.b 0x19
.F0DE:
    lsr
    bcc .F0E2

    iny
.F0E2:
    dex
    bne .F0DE

    tya
    and.b #0x01
    asl
    asl
    tsb.b 0x1B
    ldx.b #0x08
    ldy.b #0x00
    lda.b 0x1A
.F0F2:
    lsr
    bcc .F0F6

    iny
.F0F6:
    dex
    bne .F0F2

    tya
    and.b #0x01
    asl
    tsb.b 0x1B
    lda.b 0x18
    eor.b 0x19
    eor.b 0x1A
    eor.b 0x1B
    sta.b 0x30
    lsr
    lsr
    lsr
    lsr
    eor.b 0x30
    and.b #0x0F
    sta.b 0x1C
    lda.b 0x1B
    and.b #0xF0
    sta.b 0x30
    lsr
    lsr
    lsr
    lsr
    tsb.b 0x30
    lda.b 0x18
    eor.b 0x30
    sta.b 0x18
    lda.b 0x19
    eor.b 0x30
    sta.b 0x19
    lda.b 0x1A
    eor.b 0x30
    sta.b 0x1A
    ldx.b #0x0B
.F133:
    stz.b 0x30
    lda.w 0x86BD27,X
    beq .F141

    and.b 0x18
    cmp.w 0x86BD27,X
    rol.b 0x30
.F141:
    lda.w 0x86BD33,X
    beq .F14D

    and.b 0x19
    cmp.w 0x86BD33,X
    rol.b 0x30
.F14D:
    lda.w 0x86BD3F,X
    beq .F159

    and.b 0x1A
    cmp.w 0x86BD3F,X
    rol.b 0x30
.F159:
    lda.w 0x86BD4B,X
    beq .F165

    and.b 0x1B
    cmp.w 0x86BD4B,X
    rol.b 0x30
.F165:
    lda.w 0x86BD57,X
    beq .F171

    and.b 0x1C
    cmp.w 0x86BD57,X
    rol.b 0x30
.F171:
    lda.b 0x30
    sta.b 0x0C,X
    txa
    asl
    asl
    asl
    clc
    adc.b 0x30
    tay
    lda 0x86BD72,Y
    sta.l 0x7EFFCB,X
    dex
    bpl .F133

    rts

;-----

_80F188:
    rep #0x20
    stz.b 0x24
    stz.b 0x26
    stz.b 0x28
    sep #0x20
    lda.b #0x0B
    sta.b 0x32
.F196:
    ldy.b #0x00
    ldx.b 0x32
    lda.b 0x0C,X
    asl
    asl
    asl
    asl
    asl
    sta.b 0x30
    jsr _80F2C6
    jsr _80F2C6
    jsr _80F2C6
    dec.b 0x32
    bpl .F196

    lda.b 0x27
    and.b #0xF0
    sta.b 0x30
    lsr
    lsr
    lsr
    lsr
    tsb.b 0x30
    lda.b 0x24
    eor.b 0x30
    sta.b 0x24
    lda.b 0x25
    eor.b 0x30
    sta.b 0x25
    lda.b 0x26
    eor.b 0x30
    sta.b 0x26
    lda.b 0x27
    and.b #0x10
    bne .F1E7

    lda.b 0x24
    bne .F1E0

    lda.b 0x25
    bne .F1E0

    lda.b 0x26
    beq .F1E7

.F1E0:
    lda.b #0x74
    jsl _80888B.88B6
    rts

.F1E7:
    lda.b 0x24
    eor.b 0x25
    eor.b 0x26
    eor.b 0x27
    sta.b 0x30
    lsr
    lsr
    lsr
    lsr
    eor.b 0x30
    and.b #0x0F
    cmp.b 0x28
    bne .F1E0

    lda.b 0x24
    sta.b 0x30
    lda.b 0x27
    lsr
    lsr
    lsr
    and.b #0x01
    sta.b 0x31
    jsr _80F30A
    bne .F1E0

    lda.b 0x25
    sta.b 0x30
    lda.b 0x27
    lsr
    lsr
    and.b #0x01
    sta.b 0x31
    jsr _80F30A
    bne .F1E0

    lda.b 0x26
    sta.b 0x30
    lda.b 0x27
    lsr
    and.b #0x01
    sta.b 0x31
    jsr _80F30A
    bne .F1E0

    lda.b 0x24
    sta.w 0x1F99
    and.b #0xF0
    sta.b 0x30
    stz.w 0x1F83
    stz.w 0x1F84
    stz.w 0x1F85
    stz.w 0x1F86
    ldx.b #0x00
.F247:
    lda.b 0x30
    and.b #0x80
    beq .F251

    sta.w 0x1F83,X
    inx
.F251:
    asl.b 0x30
    bne .F247

    lda.b 0x25
    sta.w 0x1F9C
    ldy.b #0x00
.F25C:
    lsr
    bcc .F260

    iny
.F260:
    cmp.b #0x00
    bne .F25C

    tya
    asl
    clc
    adc.b #0x10
    sta.w 0x1F9A
    stz.w 0x1F7C
    lda.b 0x26
    sta.b 0x30
    cmp.b #0xFF
    bne .F27C

    lda.b #0x40
    sta.w 0x1F7C
.F27C:
    ldx.b #0x0F
.F27E:
    asl.b 0x30
    bcc .F289

    lda.b #0x40
    sta.w 0x1F87,X
    bra .F28C

.F289:
    stz.w 0x1F87,X
.F28C:
    dex
    dex
    bpl .F27E

    lda.b #0x40
    sta.w 0x1F98
    lda.b 0x27
    lsr
    bcc .F29F

    lda.b #0x80
    sta.w 0x1F7E
.F29F:
    lda.b 0x27
    and.b #0x10
    sta.w 0x1F9B
    lda.b #0x02
    sta.w 0x1F80
    stz.w 0x1F7B
    stz.w 0x1F7A
    rep #0x20
    lda.w 0x00A7
    and.w #0x0470
    cmp.w #0x0470
    sep #0x20
    beq .F2C3

    stz.w 0x1F7E
.F2C3:
    lda.b #0x00
    rts

;-----

_80F2C6:
    tya
    asl
    asl
    sta.b 0x33
    asl
    adc.b 0x33
    clc
    adc.b 0x32
    tax
    lda.w 0x86BD27,X
    bne .F2DA

    iny
    bra _80F2C6

.F2DA:
    tyx
    asl.b 0x30
    bcc .F2E3

    ora.b 0x24,X
    sta.b 0x24,X
.F2E3:
    iny
    rts

;-----

_80F2E5:
    ldx.b #0x0B
.F2E7:
    txa
    asl
    asl
    asl
    rep #0x20
    and.w #0x00FF
    clc
    adc.w #0xBD72
    sta.b 0x30
    sep #0x20
    ldy.b #0x07
.F2FA:
    lda (0x30),Y
    cmp.b 0x18,X
    beq .F303

    dey
    bra .F2FA

.F303:
    tya
    sta.b 0x0C,X
    dex
    bpl .F2E7

    rts

;-----

_80F30A:
    ldx.b #0x00
    lda.b 0x30
.F30E:
    lsr
    bcc .F312

    inx
.F312:
    cmp.b #0x00
    bne .F30E

    txa
    eor.b 0x31
    and.b #0x01
    rts

;-----

_80F31C:

d16[
    .F34A, .F34B, .F350, .F355, .F35A, .F35F, .F364, .F365,
    .F36A, .F36F, .F374, .F379, .F37E, .F383, .F388, .F38D,
    .F392, .F397, .F39C, .F3A1, .F3A6, .F3AB, .F3B0,
]

.F34A:
    rts

.F34B:
    jsl _81DEA4
    rts

.F350:
    jsl _82E33B
    rts

.F355:
    jsl _81E158
    rts

.F35A:
    jsl _81E327
    rts

.F35F:
    jsl _81E4A8
    rts

.F364:
    rts

.F365:
    jsl _81E6B2
    rts

.F36A:
    jsl _82E5CF
    rts

.F36F:
    jsl _82E720
    rts

.F374:
    jsl _82EABD
    rts

.F379:
    jsl _81E97F
    rts

.F37E:
    jsl _82EBC1
    rts

.F383:
    jsl _83EF32
    rts

.F388:
    jsl _83EFFB
    rts

.F38D:
    jsl _83F134
    rts

.F392:
    jsl 0x87EE82
    rts

.F397:
    jsl 0x87EF19
    rts

.F39C:
    jsl 0x87EF92
    rts

.F3A1:
    jsl _83F27A
    rts

.F3A6:
    jsl _83F35D
    rts

.F3AB:
    jsl _81EBA5
    rts

.F3B0:
    jsl _81EC3D
    rts

;-----

_80F3B5:

d16[
    .F441, .F442, .F447, .F44C, .F451, .F456, .F45B, .F460,
    .F465, .F46A, .F46F, .F474, .F479, .F47E, .F483, .F488,
    .F48D, .F492, .F497, .F49C, .F4A1, .F4A2, .F4A3, .F4A8,
    .F4AD, .F4B2, .F4B7, .F4BC, .F4C1, .F4C6, .F4C7, .F4CC,
    .F4D1, .F4D6, .F4DB, .F4E0, .F4E5, .F4EA, .F4EF, .F4F4,
    .F4F9, .F4FE, .F503, .F508, .F50D, .F512, .F517, .F51C,
    .F521, .F526, .F52B, .F530, .F535, .F53A, .F53F, .F544,
    .F549, .F54E, .F553, .F558, .F55D, .F562, .F567, .F56C,
    .F571, .F576, .F57B, .F580, .F585, .F58A,
]

.F441:
    rts

.F442:
    jsl _81EE18
    rts

.F447:
    jsl _81EE84
    rts

.F44C:
    jsl _81EEB4
    rts

.F451:
    jsl _81EF07
    rts

.F456:
    jsl _81EF68
    rts

.F45B:
    jsl 0x88E939
    rts

.F460:
    jsl 0x88E9BA
    rts

.F465:
    jsl _81BE11
    rts

.F46A:
    jsl _81EFEE
    rts

.F46F:
    jsl _81F07E
    rts

.F474:
    jsl _81F0C4
    rts

.F479:
    jsl _81F11A
    rts

.F47E:
    jsl _81F1D8
    rts

.F483:
    jsl _81F2C3
    rts

.F488:
    jsl _81F35B
    rts

.F48D:
    jsl _82ED9E
    rts

.F492:
    jsl _81F3ED
    rts

.F497:
    jsl _81F424
    rts

.F49C:
    jsl _82EE19
    rts

.F4A1:
    rts

.F4A2:
    rts

.F4A3:
    jsl _81F480
    rts

.F4A8:
    jsl _82EE62
    rts

.F4AD:
    jsl _82EF0D
    rts

.F4B2:
    jsl _82F033
    rts

.F4B7:
    jsl _82F10F
    rts

.F4BC:
    jsl _82F18B
    rts

.F4C1:
    jsl _82F353
    rts

.F4C6:
    rts

.F4C7:
    jsl _82F3C9
    rts

.F4CC:
    jsl _82F45E
    rts

.F4D1:
    jsl _82F4E0
    rts

.F4D6:
    jsl _82F54D
    rts

.F4DB:
    jsl _82F611
    rts

.F4E0:
    jsl _82F637
    rts

.F4E5:
    jsl _82F689
    rts

.F4EA:
    jsl _82F6EF
    rts

.F4EF:
    jsl _82F75E
    rts

.F4F4:
    jsl _82F7C1
    rts

.F4F9:
    jsl _83F40C
    rts

.F4FE:
    jsl _83F49A
    rts

.F503:
    jsl _83F517
    rts

.F508:
    jsl _83F942
    rts

.F50D:
    jsl _83F9F1
    rts

.F512:
    jsl _83FA33
    rts

.F517:
    jsl 0x87F110
    rts

.F51C:
    jsl _83FACC
    rts

.F521:
    jsl 0x88EA33
    rts

.F526:
    jsl _82F8FE
    rts

.F52B:
    jsl _82F942
    rts

.F530:
    jsl _82F9DA
    rts

.F535:
    jsl 0x87F3C0
    rts

.F53A:
    jsl 0x86E3A3
    rts

.F53F:
    jsl 0x87F42A
    rts

.F544:
    jsl _82FA6A
    rts

.F549:
    jsl 0x87F477
    rts

.F54E:
    jsl 0x87F56F
    rts

.F553:
    jsl 0x87F5FF
    rts

.F558:
    jsl _82FAEA
    rts

.F55D:
    jsl _82E28B
    rts

.F562:
    jsl _80A95F
    rts

.F567:
    jsl 0x88EB44
    rts

.F56C:
    jsl 0x88E364
    rts

.F571:
    jsl _80AB56
    rts

.F576:
    jsl 0x88E3DE
    rts

.F57B:
    jsl 0x88D852
    rts

.F580:
    jsl 0x88CF4A
    rts

.F585:
    jsl _83F77E
    rts

.F58A:
    jsl 0x88EA64
    rts

;-----

_80F58F:

d16[.F591]

.F591:
    jsl _81A133
    rts

;-----

_80F596:

d16[
    .F5DC, .F5E1, .F5E6, .F5EB, .F5F0, .F5F5, .F5FA, .F5FF,
    .F604, .F609, .F60E, .F613, .F618, .F61D, .F622, .F627,
    .F62C, .F631, .F636, .F63B, .F640, .F645, .F64A, .F64F,
    .F654, .F659, .F65E, .F663, .F668, .F66D, .F672, .F677,
    .F67C, .F681, .F686,
]

.F5DC:
    jsl _81F698
    rts

.F5E1:
    jsl _81F75F
    rts

.F5E6:
    jsl 0x87F797
    rts

.F5EB:
    jsl _81F872
    rts

.F5F0:
    jsl _81F917
    rts

.F5F5:
    jsl _81FC44
    rts

.F5FA:
    jsl _81FCDA
    rts

.F5FF:
    jsl _81FD69
    rts

.F604:
    jsl 0x87F8A0
    rts

.F609:
    jsl _81FDF6
    rts

.F60E:
    jsl _81FE83
    rts

.F613:
    jsl _81FF0F
    rts

.F618:
    jsl 0x88EBBA
    rts

.F61D:
    jsl 0x88EBE7
    rts

.F622:
    jsl _82FB2F
    rts

.F627:
    jsl _82FB6D
    rts

.F62C:
    jsl _82FCA9
    rts

.F631:
    jsl _82FD03
    rts

.F636:
    jsl _82FDC6
    rts

.F63B:
    jsl _82FE07
    rts

.F640:
    jsl _82FE49
    rts

.F645:
    jsl _83FD78
    rts

.F64A:
    jsl _83FD78
    rts

.F64F:
    jsl _83FD78
    rts

.F654:
    jsl _83FD78
    rts

.F659:
    jsl _83FD78
    rts

.F65E:
    jsl _83FD78
    rts

.F663:
    jsl _83FE41
    rts

.F668:
    jsl _83FE9D
    rts

.F66D:
    jsl 0x87FB40
    rts

.F672:
    jsl _82FE74
    rts

.F677:
    jsl 0x87FCE7
    rts

.F67C:
    jsl 0x87FD4F
    rts

.F681:
    jsl 0x87FDC7
    rts

.F686:
    jsl _82FF5C
    rts

;-----

_80F68B:

d16[
    .F6C7, .F6CC, .F6D1, .F6D6, .F6DB, .F6E0, .F6E5, .F6EA,
    .F6EF, .F6F4, .F6F9, .F6FE, .F703, .F708, .F70D, .F712,
    .F717, .F71C, .F721, .F726, .F72B, .F730, .F735, .F73A,
    .F73F, .F744, .F749, .F74E, .F753, .F758,
]

.F6C7:
    jsl _81A21E
    rts

.F6CC:
    jsl _81A2C8
    rts

.F6D1:
    jsl _83898E
    rts

.F6D6:
    jsl _838C3E
    rts

.F6DB:
    jsl _838DAF
    rts

.F6E0:
    jsl _81A408
    rts

.F6E5:
    jsl _81A4C2
    rts

.F6EA:
    jsl _838E9D
    rts

.F6EF:
    jsl _8391D2
    rts

.F6F4:
    jsl _8392EC
    rts

.F6F9:
    jsl _83943D
    rts

.F6FE:
    jsl _839550
    rts

.F703:
    jsl _83965B
    rts

.F708:
    jsl _8283B0
    rts

.F70D:
    jsl _839807
    rts

.F712:
    jsl _839550
    rts

.F717:
    jsl _83995D
    rts

.F71C:
    jsl _839B7D
    rts

.F721:
    jsl _839C53
    rts

.F726:
    jsl _839DD4
    rts

.F72B:
    jsl _839FAA
    rts

.F730:
    jsl _83A0DA
    rts

.F735:
    jsl _83A1DB
    rts

.F73A:
    jsl _83A391
    rts

.F73F:
    jsl _839550
    rts

.F744:
    jsl _81A700
    rts

.F749:
    jsl _81A700
    rts

.F74E:
    jsl _81A751
    rts

.F753:
    jsl _81A5AC
    rts

.F758:
    jsl _83A59B
    rts

;-----

_80F75D:

d16[.F765, .F76A, .F76F, .F774]

.F765:
    jsl _81A163
    rts

.F76A:
    jsl _81A1B5
    rts

.F76F:
    jsl 0x878236
    rts

.F774:
    jsl 0x8782CC
    rts

;-----

_80F779:

d16[
    .F7DF, .F7DF, .F7E4, .F7E9, .F7EE, .F7F3, .F7F8, .F7FD,
    .F802, .F807, .F80C, .F811, .F816, .F81B, .F820, .F825,
    .F82A, .F82F, .F834, .F839, .F83E, .F843, .F848, .F84D,
    .F852, .F857, .F85C, .F861, .F866, .F86B, .F870, .F875,
    .F87A, .F87F, .F884, .F889, .F88E, .F893, .F898, .F89D,
    .F8A2, .F8A7, .F8AC, .F8B1, .F8B6, .F8BB, .F8C0, .F8C5,
    .F8CA, .F8CF, .F8D4,
]

.F7DF:
    jsl _81A799
    rts

.F7E4:
    jsl _829B7B
    rts

.F7E9:
    jsl _81AB24
    rts

.F7EE:
    jsl _83B938
    rts

.F7F3:
    jsl _81ABFC
    rts

.F7F8:
    jsl _81BB77
    rts

.F7FD:
    jsl _81AE1E
    rts

.F802:
    jsl _81B187
    rts

.F807:
    jsl _82859B
    rts

.F80C:
    jsl _828BF3
    rts

.F811:
    jsl _828C4C
    rts

.F816:
    jsl _828D97
    rts

.F81B:
    jsl _828E72
    rts

.F820:
    jsl _829028
    rts

.F825:
    jsl _82910A
    rts

.F82A:
    jsl _83A605
    rts

.F82F:
    jsl 0x878328
    rts

.F834:
    jsl _82951D
    rts

.F839:
    jsl _83A652
    rts

.F83E:
    jsl _83A6B4
    rts

.F843:
    jsl _81B379
    rts

.F848:
    jsl _81B3D9
    rts

.F84D:
    jsl _83A73E
    rts

.F852:
    jsl _81B49C
    rts

.F857:
    jsl _83A8BD
    rts

.F85C:
    jsl _81BC7B
    rts

.F861:
    jsl _83AB58
    rts

.F866:
    jsl _83AC6A
    rts

.F86B:
    jsl 0x8783FF
    rts

.F870:
    jsl 0x8784D8
    rts

.F875:
    jsl 0x87858F
    rts

.F87A:
    jsl 0x878637
    rts

.F87F:
    jsl 0x8786E2
    rts

.F884:
    jsl 0x8788B5
    rts

.F889:
    jsl 0x878968
    rts

.F88E:
    jsl 0x8789BF
    rts

.F893:
    jsl _83AD4B
    rts

.F898:
    jsl 0x888000
    rts

.F89D:
    jsl _83AE3F
    rts

.F8A2:
    jsl 0x88803C
    rts

.F8A7:
    jsl 0x888108
    rts

.F8AC:
    jsl 0x88BDB4
    rts

.F8B1:
    jsl 0x888162
    rts

.F8B6:
    jsl 0x8882C4
    rts

.F8BB:
    jsl 0x88833C
    rts

.F8C0:
    jsl 0x8883BE
    rts

.F8C5:
    jsl 0x8884B0
    rts

.F8CA:
    jsl 0x88E89E
    rts

.F8CF:
    jsl 0x88D0B3
    rts

.F8D4:
    jsl 0x88D13B
    rts

;-----

_80F8D9: d16[
    .F9B1, .thunk_hoganmer, .thunk_icy_penguigo, .thunk_thunder_slimer, .thunk_flammingle, .thunk_boomer_kuwanger, .thunk_planty, .thunk_launcher_octopuld,
    .F9D5, .thunk_rt_55j, .thunk_sting_chameleao, .F9E4, .F9E9, .thunk_rush_roader, .F9F3, .thunk_crusher,
    .F9FD, .FA02, .FA07, .thunk_dodge_blaster, .thunk_armor_armarge, .thunk_spiky, .FA1B, .thunk_turn_cannon,
    .FA25, .thunk_bomb_been, .FA2F, .FA34, .thunk_sea_attacker, .thunk_gulpfer, .thunk_mad_pecker, .thunk_creeper,
    .thunk_amenhopper, .thunk_anglerge, .thunk_bee_blader, .thunk_utuboros_head, .thunk_utuboros_body, .thunk_utuboros_tail, .FA6B, .thunk_ball_de_voux,
    .FA75, .thunk_gun_volt, .FA7F, .thunk_mine_cart, .thunk_mole_borer, .thunk_batton_bone, .thunk_mettool_c_15, .thunk_ride_armor,
    .thunk_dig_labour, .thunk_spark_mandriller, .FAA7, .FAAC, .thunk_crag_man, .thunk_metal_wing, .thunk_jamminger, .thunk_hotarion,
    .thunk_flamer, .FACA, .FACF, .FAD4, .FAD9, .FADE, .FAE3, .FAE8,
    .FAED, .FAF2, .FAF7, .FAFC, .FB01, .FB06, .FB0B, .FB10,
    .FB15, .thunk_sky_claw, .FB1F, .FB24, .FB29, .thunk_capsule, .FB33, .FB38,
    .FB3D, .thunk_ray_bit, .thunk_storm_eagleed, .FB4C, .FB51, .FB56, .FB5B, .FB60,
    .FB65, .FB6A, .FB6F, .thunk_mega_tortoise, .FB79, .FB7E, .FB83, .FB88,
    .FB8D, .FB92, .FB97, .thunk_bospider, .FBA1, .FBA6, .FBAB, .FBB0,
    .FBB5, .FBBA, .FBBF, .FBC4,
]

.F9B1:
    rts

.thunk_hoganmer:
    jsl hoganmer
    rts

.thunk_icy_penguigo:
    jsl icy_penguigo
    rts

.thunk_thunder_slimer:
    jsl thunder_slimer
    rts

.thunk_flammingle:
    jsl flammingle
    rts

.thunk_boomer_kuwanger:
    jsl boomer_kuwanger
    rts

.thunk_planty:
    jsl planty
    rts

.thunk_launcher_octopuld:
    jsl launcher_octopuld
    rts

.F9D5:
    jsl _81CAF6
    rts

.thunk_rt_55j:
    jsl rt_55j
    rts

.thunk_sting_chameleao:
    jsl sting_chameleao
    rts

.F9E4:
    jsl _81D020
    rts

.F9E9:
    jsl 0x8791A7
    rts

.thunk_rush_roader:
    jsl rush_roader
    rts

.F9F3:
    jsl _82959D
    rts

.thunk_crusher:
    jsl crusher
    rts

.F9FD:
    jsl _81D2CC
    rts

.FA02:
    jsl _81D53E
    rts

.FA07:
    jsl _81DCBD
    rts

.thunk_dodge_blaster:
    jsl dodge_blaster
    rts

.thunk_armor_armarge:
    jsl armor_armarge
    rts

.thunk_spiky:
    jsl spiky
    rts

.FA1B:
    jsl 0x879794
    rts

.thunk_turn_cannon:
    jsl turn_cannon
    rts

.FA25:
    jsl _83BBCF
    rts

.thunk_bomb_been:
    jsl bomb_been
    rts

.FA2F:
    jsl 0x8893A4
    rts

.FA34:
    jsl _82A0DE
    rts

.thunk_sea_attacker:
    jsl sea_attacker
    rts

.thunk_gulpfer:
    jsl gulpfer
    rts

.thunk_mad_pecker:
    jsl mad_pecker
    rts

.thunk_creeper:
    jsl creeper
    rts

.thunk_amenhopper:
    jsl amenhopper
    rts

.thunk_anglerge:
    jsl anglerge
    rts

.thunk_bee_blader:
    jsl bee_blader
    rts

.thunk_utuboros_head:
    jsl utuboros_head
    rts

.thunk_utuboros_body:
    jsl utuboros_body
    rts

.thunk_utuboros_tail:
    jsl utuboros_tail
    rts

.FA6B:
    jsl _82C833
    rts

.thunk_ball_de_voux:
    jsl ball_de_voux
    rts

.FA75:
    jsl _82D519
    rts

.thunk_gun_volt:
    jsl gun_volt
    rts

.FA7F:
    jsl 0x879B70
    rts

.thunk_mine_cart:
    jsl mine_cart
    rts

.thunk_mole_borer:
    jsl mole_borer
    rts

.thunk_batton_bone:
    jsl batton_bone
    rts

.thunk_mettool_c_15:
    jsl mettool_c_15
    rts

.thunk_ride_armor:
    jsl ride_armor ;todo: also armor soldier?
    rts

.thunk_dig_labour:
    jsl dig_labour
    rts

.thunk_spark_mandriller:
    jsl spark_mandriller
    rts

.FAA7:
    jsl _83CF6D
    rts

.FAAC:
    jsl 0x88A382
    rts

.thunk_crag_man:
    jsl crag_man
    rts

.thunk_metal_wing:
    jsl metal_wing
    rts

.thunk_jamminger:
    jsl jamminger
    rts

.thunk_hotarion:
    jsl hotarion
    rts

.thunk_flamer:
    jsl flamer
    rts

.FACA:
    jsl _83E1B9
    rts

.FACF:
    jsl _83E401
    rts

.FAD4:
    jsl 0x87A9DF
    rts

.FAD9:
    jsl 0x87ABA3
    rts

.FADE:
    jsl 0x87ADD8
    rts

.FAE3:
    jsl 0x87AF5D
    rts

.FAE8:
    jsl 0x87B216
    rts

.FAED:
    jsl 0x87B443
    rts

.FAF2:
    jsl 0x87B542
    rts

.FAF7:
    jsl 0x87B808
    rts

.FAFC:
    jsl 0x87B91C
    rts

.FB01:
    jsl 0x87BA72
    rts

.FB06:
    jsl 0x87BBBE
    rts

.FB0B:
    jsl 0x87BC8B
    rts

.FB10:
    jsl 0x87BD70
    rts

.FB15:
    jsl 0x87C07A
    rts

.thunk_sky_claw:
    jsl sky_claw
    rts

.FB1F:
    jsl 0x87C70A
    rts

.FB24:
    jsl 0x87C75E
    rts

.FB29:
    jsl 0x87C994
    rts

.thunk_capsule:
    jsl capsule
    rts

.FB33:
    jsl 0x87D012
    rts

.FB38:
    jsl 0x87D119
    rts

.FB3D:
    jsl 0x87D3AF
    rts

.thunk_ray_bit:
    jsl ray_bit
    rts

.thunk_storm_eagleed:
    jsl storm_eagleed
    rts

.FB4C:
    jsl 0x87DE93
    rts

.FB51:
    jsl 0x87E037
    rts

.FB56:
    jsl 0x87E23A
    rts

.FB5B:
    jsl 0x87E2B9
    rts

.FB60:
    jsl 0x87E354
    rts

.FB65:
    jsl 0x87E547
    rts

.FB6A:
    jsl 0x87E7D4
    rts

.FB6F:
    jsl 0x87EB09
    rts

.thunk_mega_tortoise:
    jsl mega_tortoise
    rts

.FB79:
    jsl 0x88A793
    rts

.FB7E:
    jsl 0x88A985
    rts

.FB83:
    jsl 0x88AE0B
    rts

.FB88:
    jsl 0x88B216
    rts

.FB8D:
    jsl 0x88B452
    rts

.FB92:
    jsl 0x88B689
    rts

.FB97:
    jsl 0x88BF48
    rts

.thunk_bospider:
    jsl bospider
    rts

.FBA1:
    jsl 0x87ED8D
    rts

.FBA6:
    jsl 0x88C3B2
    rts

.FBAB:
    jsl 0x88D1B1
    rts

.FBB0:
    jsl _83E7DE
    rts

.FBB5:
    jsl 0x88D8A2
    rts

.FBBA:
    jsl 0x88DAD3
    rts

.FBBF:
    jsl 0x88D93B
    rts

.FBC4:
    jsl 0x88E53F
    rts

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
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
    0xFF,0xFF,0xFF,
]

;-----

_80FFA4:
    jml nmi

_80FFA8:
    jml irq

_80FFAC:
    jml _808097

;-----

d08[
    0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
]

;-----

_80FFC0:
    
d08[ ;"ROCKMAN X            "
    0x52, 0x4F, 0x43, 0x4B, 0x4D, 0x41, 0x4E,
    0x20, 0x58, 0x20, 0x20, 0x20, 0x20, 0x20,
    0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
]

d08[
    0x30,
    0x00,
    0x0B,
    0x00,
    0x00,
    0x08,
    0x00,
]

d16[0x9A96, 0x6569]

d16[
    0xFFFF,
    0xFFFF,
    _80FFAC, ;cop
    _80FFAC, ;brk
    _80FFAC, ;unused
    _80FFA4, ;nmi
    _80FFAC, ;unused
    _80FFA8, ;irq
]

d16[
    0xFFFF,
    0xFFFF,
    _80FFAC, ;cop
    _80FFAC, ;unused
    _80FFAC, ;unused
    _80FFAC, ;nmi
    entry,   ;reset
    _80FFAC, ;irq/break
]
