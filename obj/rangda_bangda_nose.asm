rangda_bangda_nose:
    ldx.b 0x01
    jmp (.B21B,X)

.B21B: d16[.B221, .B244, .B3DA]

.B221:
    jsl 0x82827D
    lda.b #0x06
    sta.b 0x12
    lda.b #0x07
    sta.b 0x28
    lda.b #0x0C
    sta.b 0x27
    lda.b #0x06
    sta.b 0x26
    lda.b #0x5E
    sta.b 0x20
    lda.b #0xD5
    sta.b 0x21
    stz.b 0x33
    lda.b 0x11
    sta.b 0x36
    rtl

.B244:
    lda.b 0x36
    sta.b 0x11
    ldx.b 0x02
    jsr (.B294,X)
    lda.b #0x01
    sta.b 0x30
    bit.b 0x33
    bvs .B280

    stz.b 0x30
    jsl 0x849B43
    beq .B27C

    bpl .B26A

    lda.b #0x04
    sta.b 0x01
    jsr .B40C
    jsl 0x84A4AB
.B26A:
    lda.b #0x0E
    trb.b 0x11
    lda.b #0x13
    jsl _80888B
    lda.b #0x05
    sta.b 0x28
    lda.b #0x3C
    sta.b 0x34
.B27C:
    jsl 0x849B03
.B280:
    lda.b 0x34
    beq .B28C

    dec.b 0x34
    bne .B28C

    lda.b #0x07
    sta.b 0x28
.B28C:
    jsl 0x8491BE
    jml 0x8280B4

.B294: d16[.B29C, .B2B4, .B302, .B399]

.B29C:
    ldx.b 0x03
    bne .B2B3

    inc.b 0x03
    lda.b #0x06
    sta.b 0x12
    stz.w 0x1F41
    lda.b #0x40
    tsb.b 0x33
    lda.b #0x02
    jsl 0x848F07
.B2B3:
    rts

.B2B4:
    ldx.b 0x03
    jmp (.B2B9,X)

.B2B9: d16[.B2BF, .B2D3, .B2E8]

.B2BF:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x04
    sta.b 0x12
    lda.b #0x01
    sta.w 0x1F41
    lda.b #0x03
    jsl 0x848F07
    rts

.B2D3:
    lda.b 0x0F
    bpl .B2E3

    lda.b #0x04
    sta.b 0x03
    lda.b #0x00
    sta.b 0x1C
    lda.b #0xFF
    sta.b 0x1D
.B2E3:
    jsl 0x848EEA
    rts

.B2E8:
    jsl 0x82825D
    rep #0x20
    lda.w #0x0090
    cmp.b 0x08
    bcs .B2FF

    sta.b 0x08
    sep #0x20
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.B2FF:
    sep #0x20
    rts

.B302:
    ldx.b 0x03
    bne .B32C

    inc.b 0x03
    lda.b #0x40
    trb.b 0x33
    jsl 0x849086
    and.b #0x01
    sta.b 0x35
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00D568,X
    sta.b 0x1A
    lda.w 0x00D56A,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x80
    trb.b 0x33
    jmp .B3E3

.B32C:
    lda.b 0x2B
    bit.b #0x03
    beq .B342

    lda.b #0x80
    tsb.b 0x33
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
.B342:
    lda.b 0x2B
    bit.b #0x0C
    beq .B358

    lda.b #0x80
    tsb.b 0x33
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
.B358:
    bit.b 0x33
    bpl .B394

    rep #0x21
    lda.b 0x05
    adc.w #0xEB80
    clc
    adc.w #0x0008
    cmp.w #0x0010
    bcs .B392

    lda.b 0x08
    clc
    adc.w #0xFF70
    clc
    adc.w #0x0008
    cmp.w #0x0010
    bcs .B392

    lda.w #0x1480
    sta.b 0x05
    lda.w #0x0090
    sta.b 0x08
    sep #0x20
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    lda.b #0x40
    tsb.b 0x33
    rts

.B392:
    sep #0x20
.B394:
    jsl 0x82820A
    rts

.B399:
    ldx.b 0x03
    jmp (.B39E,X)

.B39E: d16[.B3A4, .B3B7, .B3CD]

.B3A4:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x80
    sta.b 0x1C
    lda.b #0x00
    sta.b 0x1D
    lda.b #0x04
    jsl 0x848F07
    rts

.B3B7:
    jsl 0x82825D
    rep #0x20
    lda.w #0x0088
    cmp.b 0x08
    bcc .B3CA

    sta.b 0x08
    ldx.b #0x04
    stx.b 0x03
.B3CA:
    sep #0x20
    rts

.B3CD:
    lda.b 0x0F
    bpl .B3D5

    stz.b 0x02
    stz.b 0x03
.B3D5:
    jsl 0x848EEA
    rts

.B3DA:
    lda.b #0x80
    sta.w 0x1F41
    jml 0x828398

.B3E3:
    jsl 0x8282D3
    bne .B409

    inc.w 0x0000,X
    lda.b #0x3B
    sta.w 0x000A,X
    lda.b 0x35
    clc
    adc.b #0x02
    sta.w 0x000B,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.B409:
    sep #0x30
    rts

;-----

.B40C:
    rep #0x10
    lda.b 0x11
    ora.b #0x20
    sta.l 0x7F838F
    ldy.w #0x000F
.B419:
    jsl 0x8282D3
    bne .B44F

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    eor.b #0x40
    sta.b 0x11
    jsl 0x849086
    and.b #0x03
    clc
    adc.b #0x5D
    ora.b #0x80
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dey
    bpl .B419

.B44F:
    sep #0x10
    rts