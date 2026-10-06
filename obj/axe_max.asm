axe_max:
    lda.b 0x3C
    tsb.b 0x11
    ldx.b 0x01
    jsr (.D065,X)
    lda.b 0x27
    and.b #0x7F
    beq .D033

    jsl 0x849B03
.D033:
    jsl 0x849B43
    beq .D057

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .D057

    lda.b #0x06
    sta.b 0x01
    jsl 0x84A4AB
    rep #0x20
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x20
.D057:
    jsr .D2AB
    lda.b 0x27
    and.b #0x7F
    bne .D061

    rtl

.D061:
    jml 0x8280B4

.D065: d16[.D06D, .D103, .D165, .D1E7]

.D06D:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x3C
    lda.b #0x03
    sta.b 0x26
    lda.b #0x08
    sta.b 0x27
    stz.b 0x3D
    rep #0x20
    lda.w #0xC832
    sta.b 0x20
    lda.b 0x05
    sta.b 0x33
    sta.w 0x0000
    lda.b 0x08
    sta.b 0x35
    sta.w 0x0002
    lda.w #0x0402
    sta.w 0x0004
    jsr .D1ED
    cmp.w #0x0000
    bne .D0A9

    pla
    jml 0x828387

.D0A9:
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.w 0x0002
    lda.w #0x0403
    sta.w 0x0004
    jsr .D1ED
    sta.b 0x37
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sec
    sbc.w #0x0020
    sta.w 0x0002
    lda.w #0x0403
    jsr .D1ED
    sta.b 0x39
    sep #0x20
    lda.b #0x04
    sta.b 0x12
    rep #0x20
    lda.w #0x0020
    clc
    adc.b 0x05
    sta.b 0x05
    lda.b 0x08
    sec
    sbc.w #0x000E
    sta.b 0x08
    sep #0x20
    stz.b 0x0B
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x1E
    sta.b 0x3B
    lda.b #0x05
    jsl 0x848F07
    rts

.D103:
    jsr .D227
    ldx.b 0x02
    jsr (.D10E,X)
    jmp .D26F

.D10E: d16[.D114, .D114, .D14E]

.D114:
    jsl 0x848EEA
    lda.b 0x3D
    beq .D12D

    lda.b #0x78
    sta.b 0x3B
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x02
    stz.b 0x3D
    rts

.D12D:
    dec.b 0x3B
    bne .D14D

    rep #0x10
    ldx.b 0x39
    beq .D147

    lda.w 0x0001,X
    cmp.b #0x04
    bne .D147

    sep #0x10
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rts

.D147:
    sep #0x10
    lda.b #0x01
    sta.b 0x3B
.D14D:
    rts

.D14E:
    jsl 0x848EEA
    dec.b 0x3B
    bne .D164

    lda.b #0x05
    jsl 0x848F07
    lda.b #0x20
    sta.b 0x3B
    lda.b #0x02
    sta.b 0x02
.D164:
    rts

.D165:
    jsr .D227
    ldx.b 0x02
    jmp (.D16D,X)

.D16D: d16[.D17B, .D189, .D1B1, .D17B, .D189, .D1B1, .D1C4]

.D17B:
    inc.b 0x02
    inc.b 0x02
    lda.b #0x01
    jsl 0x848F07
    lda.b #0x24
    sta.b 0x3B
.D189:
    jsl 0x848EEA
    dec.b 0x3B
    bne .D1B0

    rep #0x10
    ldx.b 0x37
    beq .D1AA

    lda.b #0x06
    sta.w 0x0001,X
    stz.w 0x0002,X
    sep #0x10
    inc.b 0x02
    inc.b 0x02
    stz.b 0x37
    stz.b 0x38
    rts

.D1AA:
    sep #0x10
    lda.b #0x0C
    sta.b 0x02
.D1B0:
    rts

.D1B1:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .D1C3

    lda.b 0x13
    cmp.b #0x02
    bne .D1C3

    inc.b 0x02
    inc.b 0x02
.D1C3:
    rts

.D1C4:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .D1E6

    lda.b 0x13
    cmp.b #0x01
    bne .D1E6

    lda.b #0x05
    jsl 0x848F07
    lda.b #0x02
    sta.b 0x01
    sta.b 0x02
    lda.b #0x20
    sta.b 0x3B
    lda.b #0x28
    sta.b 0x0B
.D1E6:
    rts

.D1E7:
    jsr .D227
    jmp .D26F

;-----

.D1ED:
    php
    jsl 0x828358
    bne .D220

    inc.w 0x0000,X
    lda.b #0x08
    sta.w 0x000A,X
    rep #0x20
    lda.w 0x0000
    sta.w 0x0005,X
    lda.w 0x0002
    sta.w 0x0008,X
    lda.w 0x0004
    sta.w 0x000C,X
    lda.b 0x35
    sec
    sbc.w #0x0010
    sta.w 0x003A,X
    tdc
    sta.w 0x0037,X
    txa
    plp
    rts

.D220:
    rep #0x20
    lda.w #0x0000
    plp
    rts

;-----

.D227:
    lda.b 0x0B
    bne .D22F

    lda.b #0x10
    sta.b 0x0B
.D22F:
    rep #0x10
    ldx.b 0x37
    beq .D24F

    lda.w 0x0000,X
    beq .D24F

    ldx.b 0x39
    beq .D248

    lda.w 0x0000,X
    beq .D248

    rep #0x10
    stz.b 0x0B
    rts

.D248:
    stz.b 0x39
    stz.b 0x3A
    sep #0x10
    rts

.D24F:
    ldx.b 0x39
    beq .D264

    lda.w 0x0000,X
    beq .D264

    stx.b 0x37
    lda.b #0x08
    sta.w 0x0001,X
    stz.w 0x0002,X
    bra .D268

.D264:
    stz.b 0x37
    stz.b 0x38
.D268:
    stz.b 0x39
    stz.b 0x3A
    sep #0x10
    rts

;-----

.D26F:
    lda.b 0x0B
    beq .D2AA

    dec.b 0x0B
    bne .D2AA

    rep #0x30
    lda.b 0x33
    sta.w 0x0000
    lda.w #0x0203
    sta.w 0x0004
    ldx.b 0x37
    beq .D298

    lda.b 0x35
    sec
    sbc.w #0x0010
    sta.w 0x0002
    jsr .D1ED
    sta.b 0x39
    bra .D2A8

.D298:
    lda.b 0x35
    sta.w 0x0002
    jsr .D1ED
    sta.b 0x37
    sep #0x20
    lda.b #0x10
    sta.b 0x0B
.D2A8:
    sep #0x30
.D2AA:
    rts

;-----

.D2AB:
    rep #0x10
    ldx.b 0x05
    phx
    ldx.b 0x08
    phx
    ldx.b 0x33
    stx.b 0x05
    ldx.b 0x35
    stx.b 0x08
    jsl 0x82806E
    plx
    stx.b 0x08
    plx
    stx.b 0x05
    bcc .D2CB

    jsl 0x828387
.D2CB:
    rts
