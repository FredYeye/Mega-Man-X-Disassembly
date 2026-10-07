mole_borer:
    lda.l 0x7F8348
    tsb.b 0x11
    ldx.b 0x01
    jsr (.BFC9,X)
    lda.b #0x09
    sta.b 0x28
    lda.b 0x27
    sta.b 0x0B
    jsl _849B03
    jsl 0x849B43
    beq .BF7A

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x2C
    beq .BF6C

    lda.b 0x0B
    sta.b 0x27
    bra .BF7E

.BF6C:
    lda.b #0x06
    sta.b 0x2C
    lda.b 0x01
    bne .BF7A

    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
.BF7A:
    lda.b 0x2C
    beq .BF80

.BF7E:
    dec.b 0x2C
.BF80:
    rep #0x20
    lda.b 0x0F
    and.w #0x007F
    asl
    asl
    adc.w #0xCE86
    sta.b 0x20
    sep #0x20
    lda.b 0x26
    pha
    lda.b #0x7F
    sta.b 0x26
    stz.b 0x28
    jsl _849B03
    jsl 0x849B43
    pla
    sta.b 0x26
    lda.b 0x3E
    bne .BFC1

    lda.b 0x27
    and.b #0x7F
    bne .BFC1

    inc.b 0x3E
    lda.b 0x01
    clc
    adc.b #0x04
    sta.b 0x01
    lda.b #0x21
    jsl _80888B
    lda.b #0xB4
    sta.b 0x33
.BFC1:
    rep #0x20
    lda.w #0xCE7C
    sta.b 0x20
    rtl

.BFC9: d16[.BFD3, .C02B, .C067, .C0A1, .C08F]

.BFD3:
    lda.b 0x02
    bne .C00B

    jsl 0x82827D
    lda.b #0x40
    tsb.b 0x11
    stz.b 0x3E
    lda.b #0x00
    jsl _848EEA.8F07
    stz.b 0x28
    lda.b #0x3C
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    rep #0x20
    lda.w #0xCE7C
    sta.b 0x20
    lda.w #0x0140
    sta.b 0x1A
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    inc.b 0x02
    stz.b 0x01
.C00B:
    rep #0x20
    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .C019

    eor.w #0xFFFF
    inc
.C019:
    cmp.w #0x0020
    sep #0x20
    bcs .C026

    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
.C026:
    jsl 0x82808F
    rts

.C02B:
    jsl _848EEA
    jsl 0x82808F
    lda.b 0x17
    bpl .C04A

    and.b #0x7F
    sta.b 0x17
    jsr .C0D4
    lda.b 0x17
    cmp.b #0x03
    bne .C04A

    lda.b #0x42
    jsl _80888B
.C04A:
    jsl update_pos_x
    jsl _8491AD.91BE
    lda.b 0x2B
    bne .C064

    lda.b #0x04
    sta.b 0x01
    sta.b 0x2F
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
.C064:
    jmp .C086

.C067:
    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    jsl 0x82808F
    lda.b 0x2B
    beq .C086

    lda.b #0x02
    sta.b 0x01
    stz.b 0x2F
    rep #0x20
    lda.w #0x0140
    sta.b 0x1A
    sep #0x20
.C086:
    lda.b 0x2E
    cmp.b #0x3F
    bne .C08E

    stz.b 0x27
.C08E:
    rts

.C08F:
    jsl update_pos_xy.neg_ay
    jsl _8491AD.91BE
    lda.b 0x2B
    and.b #0x04
    beq .C0A1

    lda.b #0x06
    sta.b 0x01
.C0A1:
    dec.b 0x33
    beq .C0CF

    lda.b 0x33
    lsr
    bcc .C0AE

    jsl 0x82808F
.C0AE:
    rep #0x20
    lda.w #0xFFE0
    sta.w 0x0000
    sta.w 0x0002
    lda.w #0x003F
    sta.w 0x0004
    sta.w 0x0006
    lda.w #0x0003
    sta.w 0x0008
    jsl 0x84A4C6
    sep #0x20
    rts

.C0CF:
    jsl 0x828398
    rts

;-----

.C0D4:
    jsr .C2DA
    lda.b 0x0F
    and.b #0x7F
    asl
    tax
    lda.w 0x00CE96,X
    sta.b 0x35
    lda.w 0x00CE97,X
    sta.b 0x36
    jsr .C12F
    lda.b #0x04
    sta.b 0x32
.C0EE:
    lda.b #0x05
    sta.b 0x31
.C0F2:
    lda.b 0x32
    asl
    asl
    asl
    adc.b 0x31
    sta.b 0x3A
    tax
    lda.l 0x7FF200,X
    bit.b #0x40
    beq .C126

    bit.b #0x80
    bne .C11F

    lda.b 0x31
    asl
    asl
    asl
    asl
    adc.b 0x35
    sta.b 0x29
    lda.b 0x32
    asl
    asl
    asl
    asl
    adc.b 0x36
    sta.b 0x2A
    jsr .C2F4
.C11F:
    bit.b #0x01
    bne .C126

    jsr .C1D5
.C126:
    dec.b 0x31
    bne .C0F2

    dec.b 0x32
    bne .C0EE

    rts

;-----

.C12F:
    stz.b 0x3D
    lda.b #0x02
    sta.b 0x31
    sta.b 0x32
    lda.b 0x35
    clc
    adc.b #0x20
    sta.b 0x29
    lda.b 0x36
    clc
    adc.b #0x20
    sta.b 0x2A
    jsr .C17A
    jsr .C17A
    jsr .C17A
    lda.b #0x02
    sta.b 0x31
    inc.b 0x32
    lda.b 0x35
    clc
    adc.b #0x20
    sta.b 0x29
    lda.b 0x2A
    clc
    adc.b #0x10
    sta.b 0x2A
    jsr .C17A
    jsr .C17A
    jsr .C17A
    lda.b 0x3D
    beq .C179

    lda.b #0x04
    ldx.b #0x02
    ldy.b #0x02
    jsl 0x84A33C
.C179:
    rts

;-----

.C17A:
    lda.b 0x32
    asl
    asl
    asl
    adc.b 0x31
    sta.b 0x3A
    tax
    lda.l 0x7FF200,X
    ora.b #0x80
    sta.l 0x7FF200,X
    jsl _8490A0
    cmp.b #0x34
    bcc .C1CB

    phb
    lda.b #0x7F
    pha
    plb
    ldx.b 0x3A
    lda.b #0x40
    ora.w 0xF200,X
    sta.w 0xF200,X
    lda.b #0x40
    ora.w 0xF1FF,X
    sta.w 0xF1FF,X
    lda.b #0x40
    ora.w 0xF201,X
    sta.w 0xF201,X
    lda.b #0x40
    ora.w 0xF1F8,X
    sta.w 0xF1F8,X
    lda.b #0x40
    ora.w 0xF208,X
    sta.w 0xF208,X
    plb
    jsr .C313
    inc.b 0x3D
.C1CB:
    lda.b 0x29
    clc
    adc.b #0x10
    sta.b 0x29
    inc.b 0x31
    rts

;-----

.C1D5:
    stz.b 0x34
    ldx.b 0x3A
    lda.l 0x7FF1FF,X
    bmi .C1FD

    lda.b 0x31
    asl
    asl
    asl
    asl
    clc
    adc.b 0x35
    sec
    sbc.b #0x10
    sta.b 0x29
    lda.b 0x32
    asl
    asl
    asl
    asl
    clc
    adc.b 0x36
    sta.b 0x2A
    dex
    jsr .C2F4
    inx
.C1FD:
    and.b #0x01
    tsb.b 0x34
    asl.b 0x34
    lda.l 0x7FF201,X
    bmi .C227

    lda.b 0x31
    asl
    asl
    asl
    asl
    clc
    adc.b 0x35
    clc
    adc.b #0x10
    sta.b 0x29
    lda.b 0x32
    asl
    asl
    asl
    asl
    clc
    adc.b 0x36
    sta.b 0x2A
    inx
    jsr .C2F4
    dex
.C227:
    and.b #0x01
    tsb.b 0x34
    asl.b 0x34
    lda.l 0x7FF1F8,X
    bmi .C256

    lda.b 0x31
    asl
    asl
    asl
    asl
    clc
    adc.b 0x35
    sta.b 0x29
    lda.b 0x32
    asl
    asl
    asl
    asl
    clc
    adc.b 0x36
    sec
    sbc.b #0x10
    sta.b 0x2A
    phx
    txa
    sec
    sbc.b #0x08
    tax
    jsr .C2F4
    plx
.C256:
    and.b #0x01
    tsb.b 0x34
    asl.b 0x34
    lda.l 0x7FF208,X
    bmi .C283

    lda.b 0x31
    asl
    asl
    asl
    asl
    clc
    adc.b 0x35
    sta.b 0x29
    lda.b 0x32
    asl
    asl
    asl
    asl
    clc
    adc.b 0x36
    clc
    adc.b #0x10
    sta.b 0x2A
    txa
    clc
    adc.b #0x08
    tax
    jsr .C2F4
.C283:
    and.b #0x01
    ora.b 0x34
    sta.b 0x34
    asl
    tax
    lda.b 0x31
    asl
    asl
    asl
    asl
    clc
    adc.b 0x35
    sta.b 0x29
    lda.b 0x32
    asl
    asl
    asl
    asl
    clc
    adc.b 0x36
    sta.b 0x2A
    rep #0x20
    lda.w 0x00CE9E,X
    sta.w 0x0008
    lda.b 0x29
    and.w #0x00FF
    bit.w #0x0080
    beq .C2B6

    ora.w #0xFF00
.C2B6:
    clc
    adc.b 0x05
    sta.w 0x0000
    lda.b 0x2A
    and.w #0x00FF
    bit.w #0x0080
    beq .C2C9

    ora.w #0xFF00
.C2C9:
    clc
    adc.b 0x08
    sta.w 0x0002
    sep #0x20
    jsl 0x849111
    jsl _80B8D5
    rts

;-----

.C2DA:
    phb
    lda.b #0x7F
    pha
    plb
    stz.w 0xF200
    rep #0x30
    ldx.w #0xF200
    ldy.w #0xF201
    lda.w #0x002F
    mvn 0x7F,0x7F
    plb
    sep #0x30
    rts

;-----

.C2F4:
    phx
    jsl _8490A0
    plx
    cmp.b #0x34
    bcc .C308

    lda.l 0x7FF200,X
    ora.b #0x01
    sta.l 0x7FF200,X
.C308:
    lda.l 0x7FF200,X
    ora.b #0x80
    sta.l 0x7FF200,X
    rts

;-----

.C313:
    lda.b #0x03
    sta.b 0x3B
    jsl get_rng
    and.b #0x3C
    sta.b 0x3C
.C31F:
    jsl 0x8282D3
    bne .C381

    inc.w 0x0000,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b #0x23
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x29
    and.w #0x00FF
    bit.w #0x0080
    beq .C346

    ora.w #0xFF00
.C346:
    clc
    adc.b 0x05
    and.w #0xFFF0
    clc
    adc.w #0x0008
    sta.w 0x0005,X
    lda.b 0x2A
    and.w #0x00FF
    bit.w #0x0080
    beq .C360

    ora.w #0xFF00
.C360:
    clc
    adc.b 0x08
    and.w #0xFFF0
    clc
    adc.w #0x0008
    sta.w 0x0008,X
    lda.b 0x3B
    adc.b 0x3C
    and.w #0x00FF
    tay
    sep #0x20
    lda 0x00CEBE,Y
    sta.w 0x000B,X
    dec.b 0x3B
    bpl .C31F

.C381:
    sep #0x10
    rts
