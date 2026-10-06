slide_cannon:
    ldx.b 0x01
    jsr (.B279,X)
    lda.b 0x38
    bne .B230

    jsl _8490A0
    cmp.b #0x00
    bne .B22C

    stz.b 0x30
    jmp .B230

.B22C:
    lda.b #0x01
    sta.b 0x30
.B230:
    lda.b 0x27
    beq .B254

    jsl 0x849B43
    beq .B24E

    lda.b 0x27
    and.b #0x7F
    bne .B246

    jsl 0x84A4AB
    bra .B270

.B246:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .B254

.B24E:
    lda.b 0x3B
    ora.b 0x11
    sta.b 0x11
.B254:
    lda.b 0x38
    bne .B25C

    jsl 0x849B03
.B25C:
    jsl 0x8280B4
    rep #0x10
    ldx.b 0x36
    lda.w 0x0000,X
    beq .B270

    lda.w 0x000A,X
    cmp.b #0x1E
    beq .B276

.B270:
    sep #0x10
    jsl 0x828398
.B276:
    sep #0x10
    rtl

.B279: d16[.B283, .B2FD, .B31F, .B35B, .B3B0]

.B283:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x3B
    stz.b 0x29
    stz.b 0x2A
    lda.b 0x0B
    beq .B29B

    lda.b #0x40
    ora.b 0x11
    sta.b 0x11
.B29B:
    lda.b #0x06
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x08
    sta.b 0x12
    lda.b 0x38
    beq .B2B8

    lda.b #0x01
    sta.b 0x30
    stz.b 0x39
    lda.b #0x04
    sta.b 0x3A
    jmp .B2C2

.B2B8:
    lda.b #0x01
    sta.b 0x28
    sta.b 0x39
    lda.b #0x05
    sta.b 0x3A
.B2C2:
    stz.b 0x34
    stz.b 0x35
    rep #0x20
    lda.b 0x38
    and.w #0x00FF
    beq .B2D7

    lda.w #0xD1BF
    sta.b 0x20
    jmp .B2DC

.B2D7:
    lda.w #0xD1C4
    sta.b 0x20
.B2DC:
    lda.b 0x0B
    and.w #0x00FF
    beq .B2EB

    lda.w #0x0100
    sta.b 0x1A
    jmp .B2F0

.B2EB:
    lda.w #0xFF00
    sta.b 0x1A
.B2F0:
    sep #0x20
    lda.b #0x5A
    sta.b 0x33
    lda.b 0x39
    jsl _848EEA.8F07
    rts

.B2FD:
    jsr .B3CA
    dec.b 0x33
    bne .B31E

    lda.b 0x34
    beq .B316

    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    sep #0x20
    stz.b 0x34
.B316:
    lda.b #0x04
    sta.b 0x01
    lda.b #0x45
    sta.b 0x33
.B31E:
    rts

.B31F:
    jsr .B3CA
    dec.b 0x33
    beq .B337

    jsl update_pos_x
    lda.b 0x2C
    and.b #0x7F
    beq .B334

    jsl 0x82C70E
.B334:
    jmp .B35A

.B337:
    lda.b 0x34
    beq .B34C

    lda.b #0x04
    sta.b 0x01
    lda.b #0x1E
    sta.b 0x33
    lda.b 0x39
    jsl _848EEA.8F07
    jmp .B35A

.B34C:
    lda.b #0x06
    sta.b 0x01
    lda.b #0x03
    sta.b 0x33
    lda.b 0x3A
    jsl _848EEA.8F07
.B35A:
    rts

.B35B:
    jsr .B3CA
    dec.b 0x33
    beq .B37A

    lda.b 0x33
    and.b #0x01
    bne .B371

    lda.b 0x39
    jsl _848EEA.8F07
    jmp .B3AF

.B371:
    lda.b 0x3A
    jsl _848EEA.8F07
    jmp .B3AF

.B37A:
    lda.b #0x02
    sta.b 0x01
    lda.b 0x35
    eor.b #0x01
    sta.b 0x35
    beq .B3A1

    lda.b 0x38
    bne .B39A

    lda.b #0x08
    sta.b 0x01
    lda.b #0x02
    jsl _848EEA.8F07
    jsr .B3D7
    jmp .B3AB

.B39A:
    lda.b #0x52
    sta.b 0x33
    jmp .B3A5

.B3A1:
    lda.b #0x1E
    sta.b 0x33
.B3A5:
    lda.b 0x39
    jsl _848EEA.8F07
.B3AB:
    lda.b #0x01
    sta.b 0x34
.B3AF:
    rts

.B3B0:
    lda.b 0x0F
    bpl .B3C5

    lda.b #0x3F
    sta.b 0x33
    lda.b #0x02
    sta.b 0x01
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .B3C9

.B3C5:
    jsl _848EEA
.B3C9:
    rts

;-----

.B3CA:
    lda.b #0x80
    sta.b 0x2C
    lda.b 0x38
    beq .B3D6

    jsl 0x82D7D0
.B3D6:
    rts

;-----

.B3D7:
    jsl 0x828358
    bne .B440

    inc.w 0x0000,X
    lda.b #0x13
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x3B
    ora.b 0x11
    sta.w 0x0011,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b #0x03
    sta.w 0x000B,X
    lda.b #0x00
    sta.w 0x0028,X
    lda.b 0x11
    and.b #0x40
    beq .B417

    rep #0x20
    lda.w #0x0200
    sta.w 0x001A,X
    lda.w #0x0017
    sta.w 0x0000
    jmp .B425

.B417:
    rep #0x20
    lda.w #0xFE00
    sta.w 0x001A,X
    lda.w #0xFFE9
    sta.w 0x0000
.B425:
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    lda.w #0xD1C9
    sta.w 0x0020,X
    lda.w #0x0033
    jsl _80888B
.B440:
    sep #0x30
    rts
