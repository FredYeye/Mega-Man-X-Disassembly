thunder_slimer:
    ldx.b 0x01
    jmp (.AE39,X)

.AE39: d16[.AE3F, .AF09, .B2F8]

.AE3F:
    ldx.b 0x02
    jmp (.AE44,X)

.AE44: d16[.AE4A, .AE5C, .AE7B]

.AE4A:
    lda.b #0x02
    sta.b 0x02
    sta.b 0x30
    lda.b #0x08
    sta.b 0x17
    lda.b #0x04
    sta.b 0x16
    jml _848000

.AE5C:
    dec.b 0x17
    bne .AE7A

    lda.b #0x08
    sta.b 0x17
    inc.b 0x16
    lda.b 0x16
    cmp.b #0x07
    bcc .AE76

    lda.b #0x04
    sta.b 0x02
    lda.b #0x20
    jml 0x8088B6

.AE76:
    jsl _848000
.AE7A:
    rtl

.AE7B:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    lda.b #0x30
    sta.b 0x27
    sta.b 0x36
    lda.w 0x1F9E
    bpl .AE8E

    asl.b 0x27
.AE8E:
    lda.b #0x01
    sta.b 0x0E
    lda.b #0x0A
    sta.b 0x28
    lda.b #0x05
    sta.b 0x26
    stz.b 0x11
    stz.b 0x2F
    stz.b 0x38
    stz.b 0x33
    stz.b 0x10
    stz.b 0x37
    lda.b #0x10
    sta.w 0x00C1
    lda.b #0x02
    sta.w 0x00C9
    lda.b #0x42
    sta.w 0x00CA
    rep #0x30
    lda.w 0x1E56
    sta.l 0x7FD384
    lda.w 0x1E58
    sta.l 0x7FD386
    lda.w 0x1E5A
    sta.l 0x7FD388
    lda.w 0x1E5C
    sta.l 0x7FD38A
    lda.w #0x0C80
    sta.b 0x05
    lda.w #0x0340
    sta.b 0x08
    lda.w #0x0048
    sta.b 0x12
    lda.w #0x0458
    sta.b 0x14
    lda.w #0xC4CE
    sta.b 0x20
    lda.w #0x0020
    sta.b 0x1E
    phb
    ldx.w #0xC4D8
    ldy.w #0x0AA1
    lda.w #0x0006
    mvn 0x00,0x86
    plb
    sep #0x30
    jsr .B40B
    lda.b #0x00
    jsr .B5CE
.AF09:
    ldx.b 0x02
    jsr (.AF4C,X)
    jsr .B620
    jsr .B3EA
    jsr .B433
    lda.b 0x33
    eor.b #0x40
    sta.b 0x33
    jsl _849B43
    beq .AF34

    bpl .AF2C

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rtl

.AF2C:
    lda.b #0x08
    sta.b 0x38
    lda.b #0x05
    sta.b 0x28
.AF34:
    lda.b 0x38
    beq .AF40

    dec.b 0x38
    bne .AF40

    lda.b #0x03
    sta.b 0x28
.AF40:
    lda.b 0x33
    bmi .AF48

    jsl _8491AD.91BE
.AF48:
    jml _849B03

.AF4C: d16[.B1E1, .B258, .B280, .B076, .AFEA, .AF58]

.AF58:
    ldx.b 0x03
    bne .AF9F

    inc.b 0x03
    stz.b 0x16
    jsl get_rng
    and.b #0x03
    beq .AF84

    rep #0x20
    ldx.b #0x01
    lda.b 0x05
    cmp.w #0x0C40
    bcc .AF80

    inx
    cmp.w #0x0C80
    bcc .AF80

    inx
    cmp.w #0x0CC0
    bcc .AF80

    inx
.AF80:
    stx.b 0x16
    sep #0x20
.AF84:
    jsr .B68C
    inc.w 0x0AA1
    inc.w 0x0AA8
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x08
    sta.b 0x1D
    lda.b #0x5B
    sta.b 0x18
    lda.b #0x46
    jsl _80888B
.AF9F:
    lda.b 0x18
    cmp.b #0x40
    bcs .AFA8

    jsr .B743
.AFA8:
    lda.b 0x18
    cmp.b #0x4B
    bcs .AFB5

    jsl 0x82825D
    jsr .B76E
.AFB5:
    dec.b 0x18
    bne .AFD7

    stz.w 0x0AA1
    stz.w 0x0AA8
    ldx.b #0x06
    jsr .B5C7
    cmp.b #0x08
    bcc .AFD3

    ldx.b #0x08
    cmp.b #0x0A
    bcc .AFD3

    jsr .B596
    ldx.b #0x02
.AFD3:
    txa
    jmp .B769

.AFD7:
    rep #0x30
    phb
    ldx.w #0xD1BC
    ldy.w #0xD1BE
    lda.w #0x01BB
    mvp 0x7F,0x7F
    plb
    sep #0x30
    rts

.AFEA:
    ldx.b 0x03
    jmp (.AFEF,X)

.AFEF: d16[.AFF5, .B025, .B04A]

.AFF5:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x02
    sta.b 0x10
    lda.b #0x80
    tsb.b 0x33
    lda.b 0x2B
    bit.b #0x04
    bne .B011

    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    stz.b 0x1E
    bra .B01A

.B011:
    rep #0x20
    lda.w #0xFE85
    sta.b 0x1C
    stz.b 0x1A
.B01A:
    sep #0x20
    lda.b #0x18
    sta.b 0x35
    lda.b #0x04
    jsr .B5CE
.B025:
    dec.b 0x35
    bne .B045

    lda.b #0x04
    sta.b 0x03
    rep #0x20
    stz.b 0x1C
    lda.b 0x08
    sta.b 0x24
    lda.w #0x0020
    sta.b 0x1E
    sep #0x20
    lda.b #0x80
    trb.b 0x33
    lda.b #0x72
    sta.b 0x35
    rts

.B045:
    jsl 0x8281B2
    rts

.B04A:
    dec.b 0x35
    bne .B075

    lda.b 0x2B
    bit.b #0x04
    beq .B063

    ldx.b #0x04
    jsr .B5C7
    cmp.b #0x04
    bcc .B05F

    ldx.b #0x0A
.B05F:
    txa
    jmp .B769

.B063:
    ldx.b #0x06
    jsr .B5C7
    cmp.b #0x0C
    bcc .B071

    jsr .B596
    ldx.b #0x02
.B071:
    txa
    jmp .B769

.B075:
    rts

.B076:
    ldx.b 0x03
    jmp (.B07B,X)

.B07B: d16[.B08B, .B0A2, .B0BA, .B0D1, .B11F, .B12D, .B18A, .B1AB]

.B08B:
    lda.b #0x02
    sta.b 0x03
    rep #0x30
    ldx.w #0x0100
    lda.w #0x0C80
    cmp.b 0x05
    bcs .B09E

    ldx.w #0xFF00
.B09E:
    stx.b 0x1A
    sep #0x30
.B0A2:
    lda.b 0x05
    cmp.b #0x80
    bne .B0B5

    lda.b #0x04
    sta.b 0x03
    lda.b #0x20
    sta.b 0x16
    lda.b #0x01
    jmp .B5CE

.B0B5:
    jsl 0x82823E
    rts

.B0BA:
    dec.b 0x16
    bne .B0D0

    lda.b #0x10
    ldx.b #0x01
    ldy.b #0x04
    jsl 0x84A33C
    lda.b #0x06
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x16
.B0D0:
    rts

.B0D1:
    dec.b 0x16
    bne .B107

    lda.b #0x08
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x16
    lda.b #0x03
    jsr .B5CE
    lda.b #0x42
    sta.w 0x00CA
    rep #0x30
    ldx.w #0x0100
    lda.w 0x0BAD
    cmp.b 0x05
    bcs .B0F6

    ldx.w #0xFF00
.B0F6:
    stx.b 0x1A
    sep #0x30
    ldx.b #0x03
    jsr .B5C7
    cmp.b #0x09
    bcc .B104

    dex
.B104:
    stx.b 0x18
    rts

.B107:
    bit.w 0x1F90
    bvs .B11E

    lda.w 0x00CA
    eor.b #0x40
    sta.w 0x00CA
    lda.w 0x0B9C
    and.b #0x07
    bne .B11E

    jmp .B5FB

.B11E:
    rts

.B11F:
    dec.b 0x16
    bne .B12C

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x00
    jmp .B5CE

.B12C:
    rts

.B12D:
    jsl 0x82823E
    rep #0x30
    ldx.w #0x0100
    lda.w 0x0BAD
    cmp.b 0x05
    bcs .B140

    ldx.w #0xFF00
.B140:
    cpx.b 0x1A
    sep #0x30
    beq .B149

    jmp .B1CF

.B149:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    clc
    adc.w #0x000C
    cmp.w #0x0018
    sep #0x20
    bcs .B164

    lda.b #0x0C
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x16
.B164:
    ldx.b #0x1F
    jsr .B892
    bcs .B16D

    ldx.b #0x07
.B16D:
    stx.w 0x0000
    lda.w 0x0C2B
    bpl .B17A

    lda.b #0x03
    sta.w 0x0000
.B17A:
    lda.b 0x05
    and.w 0x0000
    bne .B189

    lda.b #0x0E
    sta.b 0x03
    lda.b #0x1E
    sta.b 0x16
.B189:
    rts

.B18A:
    dec.b 0x16
    bne .B199

    dec.b 0x18
    bne .B1C1

    lda.b #0x42
    sta.w 0x00CA
    bra .B1CF

.B199:
    lda.b 0x16
    cmp.b #0x0F
    bne .B1A2

    jsr .B5DB
.B1A2:
    lda.w 0x00CA
    eor.b #0x40
    sta.w 0x00CA
    rts

.B1AB:
    dec.b 0x16
    beq .B1C1

    lda.b 0x16
    cmp.b #0x0F
    bne .B1B8

    jsr .B5DB
.B1B8:
    lda.w 0x00CA
    eor.b #0x40
    sta.w 0x00CA
    rts

.B1C1:
    lda.b #0x0A
    sta.b 0x03
    lda.b #0x08
    sta.b 0x17
    lda.b #0x42
    sta.w 0x00CA
    rts

.B1CF:
    ldx.b #0x08
    jsr .B5C7
    cmp.b #0x0A
    bcs .B1DD

    jsr .B596
    ldx.b #0x02
.B1DD:
    txa
    jmp .B769

.B1E1:
    ldx.b 0x03
    jmp (.B1E6,X)

.B1E6: d16[.B1EC, .B215, .B232]

.B1EC:
    rep #0x20
    lda.w 0x0BAD
    cmp.w #0x0C20
    bcc .B212

    lda.w #0x0C00
    sta.w 0x1E5E
    sta.w 0x1E60
    lda.w #0x0300
    sta.w 0x1E68
    sta.w 0x1E6E
    sep #0x20
    lda.b #0x02
    sta.b 0x03
    jsl _849FE6
.B212:
    sep #0x20
.B214:
    rts

.B215:
    rep #0x20
    lda.w 0x1E4D
    cmp.w 0x1E56
    sep #0x20
    bne .B214

    lda.b #0x04
    sta.b 0x03
    stz.b 0x16
    lda.b #0x08
    sta.b 0x17
    lda.b #0x00
    jsl _848000
    rts

.B232:
    dec.b 0x17
    bne .B257

    lda.b #0x08
    sta.b 0x17
    inc.b 0x16
    lda.b 0x16
    cmp.b #0x03
    bcc .B253

    stz.b 0x30
    lda.b #0x20
    jsl _80888B.88B6
    jsl _849FFE
    lda.b #0x06
    jmp .B769

.B253:
    jsl _848000
.B257:
    rts

.B258:
    ldx.b 0x03
    bne .B262

    inc.b 0x03
    stz.b 0x1C
    stz.b 0x1D
.B262:
    lda.b 0x2B
    bit.b #0x04
    beq .B27B

    lda.b #0x02
    sta.b 0x10
    ldx.b #0x04
    jsr .B5C7
    cmp.b #0x0A
    bcs .B277

    ldx.b #0x08
.B277:
    txa
    jmp .B769

.B27B:
    jsl 0x828174
    rts

.B280:
    ldx.b 0x03
    bne .B2E4

    inc.b 0x03
    rep #0x30
    ldx.w #0x000A
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bpl .B297

    eor.w #0xFFFF
    inc
.B297:
    cmp.w #0x0080
    bcs .B29F

    ldx.w #0x0006
.B29F:
    stx.w 0x0000
    ldx.w #0x0421
    lda.b 0x27
    and.w #0x007F
    cmp.w #0x0018
    bcs .B2B2

    ldx.w #0x0600
.B2B2:
    stx.b 0x1C
    ldx.w #0x0100
    lda.w 0x0BAD
    cmp.b 0x05
    bcs .B2C1

    ldx.w #0xFF00
.B2C1:
    stx.b 0x1A
    sep #0x20
    jsr .B5C7
    cmp.w 0x0000
    bcs .B2DD

    ldx.w #0x0507
    jsr .B892
    bcs .B2D8

    ldx.w #0x0800
.B2D8:
    stx.b 0x1C
    jsr .B596
.B2DD:
    sep #0x10
    lda.b #0x00
    jsr .B5CE
.B2E4:
    lda.b 0x2B
    bit.b #0x08
    bne .B2EE

    lda.b 0x1D
    bpl .B2F3

.B2EE:
    lda.b #0x02
    jmp .B769

.B2F3:
    jsl 0x828174
    rts

.B2F8:
    ldx.b 0x02
    jmp (.B2FD,X)

.B2FD: d16[.B309, .B31D, .B343, .B362, .B377, .B37F]

.B309:
    lda.b #0x02
    sta.b 0x02
    lda.b #0xFF
    sta.b 0x27
    inc.b 0x30
    lda.b #0x21
    jsl _80888B
    lda.b #0x01
    sta.b 0x18
.B31D:
    dec.b 0x18
    beq .B325

    jsr .B788
    rtl

.B325:
    lda.b #0x04
    sta.b 0x02
    inc.w 0x0AA1
    rep #0x30
    phb
    ldx.w #0xC4E6
    ldy.w #0x0B22
    lda.w #0x0009
    mvn 0x00,0x86
    plb
    lda.w #0x0001
    sta.b 0x18
    sep #0x30
.B343:
    lda.w 0x0B9C
    lsr
    bcc .B354

    inc.b 0x18
    lda.b 0x18
    cmp.b #0x10
    beq .B358

    jsr .B822
.B354:
    jsr .B788
    rtl

.B358:
    lda.b #0x06
    sta.b 0x02
    lda.b #0x10
    sta.b 0x18
    stz.b 0x19
.B362:
    dec.b 0x18
    dec.b 0x18
    bmi .B36F

    jsr .B876
    jsr .B788
    rtl

.B36F:
    lda.b #0x08
    sta.b 0x02
    lda.b #0xF0
    sta.b 0x18
.B377:
    dec.b 0x18
    beq .B37F

    jsr .B788
    rtl

.B37F:
    lda.b #0x02
    sta.w 0x1E89
    stz.b 0x27
    stz.w 0x0AA1
    stz.w 0x0AA8
    stz.w 0x1E9A
    inc.w 0x1E88
    lda.b #0x03
    jsl _848000
    lda.b #0x05
    jsl _84A355.A37F
    rep #0x20
    lda.w #0x0CF8
    sta.w 0x0000
    lda.w #0x0508
    sta.w 0x0004
    lda.w #0x0390
    sta.w 0x0002
    jsl _84A462
    lda.w #0x03A0
    sta.w 0x0002
    jsl _84A462
    lda.w #0x03B0
    sta.w 0x0002
    jsl _84A462
    lda.l 0x7FD384
    sta.w 0x1E5E
    lda.l 0x7FD386
    sta.w 0x1E60
    lda.l 0x7FD388
    sta.w 0x1E68
    lda.l 0x7FD38A
    sta.w 0x1E6E
    jml 0x828398

;-----

.B3EA:
    lda.w 0x1F27
    bne .B40A

    lda.w 0x1E89
    cmp.b #0x0C
    bne .B40A

    rep #0x20
    lda.w 0x1E8D
    sta.w 0x1EAA
    lda.w 0x1E90
    sta.w 0x1EAC
    tdc
    sta.w 0x1F2E
    sep #0x20
.B40A:
    rts

;-----

.B40B:
    jsl 0x8282D3
    bne .B430

    inc.w 0x0000,X
    lda.b #0x32
    sta.w 0x000A,X
    lda.b #0x30
    sta.w 0x0011,X
    stx.b 0x31
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.B430:
    sep #0x30
.B432:
    rts

;-----

.B433:
    ldx.b 0x10
    jmp (.B438,X)

.B438: d16[.B432, .B43E, .B453]

.B43E:
    lda.b #0x04
    sta.b 0x10
    stz.b 0x17
    dec.b 0x17
    inc.w 0x0AA1
    lda.b #0x01
    sta.b 0x16
    lda.b #0x45
    jsl _80888B
.B453:
    dec.b 0x16
    bne .B46A

    lda.b #0x02
    sta.b 0x16
    inc.b 0x17
    ldx.b 0x17
    lda.w 0x00C4FA,X
    bpl .B46A

    stz.b 0x10
    stz.w 0x0AA1
    rts

.B46A:
    jsr .B470
    jmp .B50B

;-----

.B470:
    rep #0x30
    lda.b 0x17
    and.w #0x00FF
    tax
    lda.w 0x00C4FA,X
    and.w #0x00FF
    sta.w 0x0000
    ldx.w #0x0000
    bit.b 0x32
    bvc .B48B

    ldx.w #0x00C2
.B48B:
    tay
    lda.w 0x1E90
    sta.l 0x7FD0C0,X
.B493:
    dey
    bmi .B49E

    sta.l 0x7FD000,X
    inx
    inx
    bra .B493

.B49E:
    lda.w 0x0000
    sta.b 0x18
    eor.w #0xFFFF
    inc
    clc
    adc.w 0x1E90
.B4AB:
    dec.b 0x18
    bmi .B4BE

    ldy.w #0x0007
.B4B2:
    sta.l 0x7FD000,X
    inx
    inx
    dey
    bne .B4B2

    inc
    bra .B4AB

.B4BE:
    lda.w #0x0006
    sec
    sbc.w 0x0000
    asl
    sta.b 0x18
    lda.w 0x1E90
.B4CB:
    dec.b 0x18
    bmi .B4DD

    ldy.w #0x0008
.B4D2:
    sta.l 0x7FD000,X
    inx
    inx
    dey
    bne .B4D2

    bra .B4CB

.B4DD:
    lda.w 0x0000
    sta.b 0x18
    lda.w 0x1E90
    inc
.B4E6:
    dec.b 0x18
    bmi .B4F9

    ldy.w #0x0007
.B4ED:
    sta.l 0x7FD000,X
    inx
    inx
    dey
    bne .B4ED

    inc
    bra .B4E6

.B4F9:
    lda.w 0x1E90
    ldy.w 0x0000
.B4FF:
    dey
    bmi .B50A

    sta.l 0x7FD000,X
    inx
    inx
    bra .B4FF

.B50A:
    rts

;-----

.B50B:
    lda.w #0x0000
    bit.b 0x32
    bvc .B515

    lda.w #0x00C2
.B515:
    sta.w 0x0000
    ldx.w #0x0000
    lda.b 0x08
    sec
    sbc.w #0x0030
    sec
    sbc.w 0x1E50
    bpl .B52A

    lda.w #0x0000
.B52A:
    jsr .B55F
    lda.w #0x00E0
    sta.w 0x0B22,X
    lda.w #0xD000
    clc
    adc.w 0x0000
    sta.w 0x0B23,X
    inx
    inx
    inx
    lda.b 0x08
    clc
    adc.w #0x0030
    sta.w 0x0002
    lda.w 0x1E50
    clc
    adc.w #0x00E0
    sec
    sbc.w 0x0002
    bmi .B559

    jsr .B55F
.B559:
    stz.w 0x0B22,X
    sep #0x30
    rts

;-----

.B55F:
    cmp.w #0x007F
    bcc .B585

    cmp.w #0x00E0
    bcc .B56C

    lda.w #0x00E0
.B56C:
    sec
    sbc.w #0x007F
    tay
    lda.w #0x007F
    sta.w 0x0B22,X
    lda.w #0xD0C0
    clc
    adc.w 0x0000
    sta.w 0x0B23,X
    inx
    inx
    inx
    tya
.B585:
    sta.w 0x0B22,X
    lda.w #0xD0C0
    clc
    adc.w 0x0000
    sta.w 0x0B23,X
    inx
    inx
    inx
    rts

;-----

.B596:
    rep #0x20
    stz.w 0x0000
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bpl .B5AA

    dec.w 0x0000
    eor.w #0xFFFF
    inc
.B5AA:
    xba
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    cmp.w #0x0500
    bcc .B5B9

    lda.w #0x0500
.B5B9:
    bit.w 0x0000
    bpl .B5C2

    eor.w #0xFFFF
    inc
.B5C2:
    sta.b 0x1A
    sep #0x20
    rts

;-----

.B5C7:
    jsl get_rng
    and.b #0x0F
    rts

;-----

.B5CE:
    rep #0x10
    ldx.b 0x31
    sta.w 0x0010,X
    stz.w 0x0002,X
    sep #0x10
    rts

;-----

.B5DB:
    jsl 0x828358
    bne .B5F8

    inc.w 0x0000,X
    lda.b #0x18
    sta.w 0x000A,X
    rep #0x21
    lda.b 0x08
    adc.w #0x0023
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
.B5F8:
    sep #0x30
    rts

;-----

.B5FB:
    jsl 0x8282D3
    bne .B61D

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    sta.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.B61D:
    sep #0x30
    rts

;-----

.B620:
    lda.w 0x0B9C
    and.b #0x3F
    bne .B64D

    jsl get_rng
    and.b #0x03
    beq .B640

    lda.b 0x27
    and.b #0x7F
    sta.w 0x0000
    lda.b 0x36
    sec
    sbc.w 0x0000
    cmp.b #0x03
    bcc .B647

.B640:
    lda.b 0x37
    bne .B647

    jsr .B64E
.B647:
    lda.b 0x27
    and.b #0x7F
    sta.b 0x36
.B64D:
    rts

;-----

.B64E:
    rep #0x10
    ldy.w #0x0003
.B653:
    jsl 0x828358
    bne .B689

    inc.w 0x0000,X
    inc.b 0x37
    lda.b #0x19
    sta.w 0x000A,X
    tya
    sta.w 0x000B,X
    phy
    rep #0x21
    tya
    asl
    asl
    tay
    lda.b 0x05
    adc 0x00C53A,Y
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc 0x00C53C,Y
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
    sep #0x20
    ply
    dey
    bpl .B653

.B689:
    sep #0x10
    rts

;-----

.B68C:
    rep #0x30
    lda.b 0x05
    sta.b 0x22
    stz.b 0x1A
    lda.b 0x16
    and.w #0x00FF
    asl
    tax
    lda.w 0x00C54A,X
    sta.b 0x1C
    ldx.w #0x012A
    stz.b 0x04
    lda.w 0x1E8D
    sta.b 0x05
    sta.l 0x7FD2EE
.B6AE:
    lda.b 0x05
    sta.l 0x7FD1C2,X
    stz.w 0x0000
    lda.b 0x1A
    bpl .B6BE

    dec.w 0x0000
.B6BE:
    clc
    adc.b 0x04
    sta.b 0x04
    sep #0x20
    lda.b 0x06
    adc.w 0x0000
    sta.b 0x06
    rep #0x21
    lda.b 0x1A
    clc
    adc.b 0x1C
    sta.b 0x1A
    dex
    dex
    bpl .B6AE

    lda.b 0x22
    sta.b 0x05
    phb
    ldx.w #0xC4DF
    ldy.w #0x0AA8
    lda.w #0x0006
    mvn 0x00,0x86
    ldx.w #0xC4E6
    ldy.w #0x0B22
    lda.w #0x0013
    mvn 0x00,0x86
    plb
    ldx.w #0x0092
    lda.w 0x1E8D
.B6FD:
    sta.l 0x7FD2F0,X
    dex
    dex
    bpl .B6FD

    ldx.w #0x01BE
    lda.w 0x1E90
    sta.l 0x7FD1C0
.B70F:
    sta.l 0x7FD000,X
    dex
    dex
    cpx.w #0x00EC
    bne .B70F

    stz.w 0x0000
.B71D:
    inc
    sta.l 0x7FD000,X
    inc.w 0x0000
    ldy.w 0x0000
    cpy.w #0x0008
    bne .B731

    stz.w 0x0000
    dec
.B731:
    dex
    dex
    cpx.w #0x0014
    bne .B71D

.B738:
    sta.l 0x7FD000,X
    dex
    dex
    bpl .B738

    sep #0x30
    rts

;-----

.B743:
    rep #0x30
    lda.l 0x7FD202
    sta.w 0x0000
    ldx.w #0x01C0
.B74F:
    lda.l 0x7FD1C2,X
    cmp.w 0x0000
    beq .B75E

    bpl .B75D

    inc
    bra .B75E

.B75D:
    dec
.B75E:
    sta.l 0x7FD1C2,X
    dex
    dex
    bpl .B74F

    sep #0x30
    rts

;-----

.B769:
    sta.b 0x02
    stz.b 0x03
    rts

;-----

.B76E:
    rep #0x30
    lda.b 0x08
    sec
    sbc.w #0x0300
    asl
    tax
    lda.b 0x12
    clc
    adc.w #0x0C00
    sec
    sbc.l 0x7FD1C2,X
    sta.b 0x05
    sep #0x30
    rts

;-----

.B788:
    rep #0x20
    lda.w #0xFFE0
    sta.w 0x0000
    lda.w #0xFFE0
    sta.w 0x0002
    lda.w #0x003F
    sta.w 0x0004
    sta.w 0x0006
    sep #0x20
    lda.b #0x07
    sta.w 0x0008
    jsl _84A4C6
    lda.w 0x0B9C
    and.b #0x03
    bne .B81F

    jsl 0x8282D3
    bne .B81F

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b 0x11
    ora.b #0x32
    sta.w 0x0011,X
    lda.b #0x23
    sta.w 0x000B,X
    rep #0x20
    lda.w #0x03B8
    sta.w 0x000C,X
    jsl get_rng
    and.w #0x000C
    tay
    lda 0x00C53A,Y
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda 0x00C53C,Y
    clc
    adc.b 0x08
    sta.w 0x0008,X
    lda.w #0x0040
    sta.w 0x001E,X
    tya
    lsr
    tay
    jsl get_rng
    and.w #0x00FF
    sta.w 0x0000
    lda 0x00C314,Y
    bpl .B80F

    lda.w 0x0000
    eor.w #0xFFFF
    inc
    sta.w 0x0000
.B80F:
    lda.w 0x0000
    clc
    adc 0x00C314,Y
    sta.w 0x001A,X
    lda.w #0x02F5
    sta.w 0x001C,X
.B81F:
    sep #0x30
    rts

;-----

.B822:
    rep #0x30
    lda.b 0x18
    sta.w 0x0000
    lda.b 0x08
    sec
    sbc.w #0x0300
    asl
    tax
    sta.w 0x0002
    lda.w 0x1E90
    sta.l 0x7FD1C0
.B83B:
    inc
    sta.l 0x7FD000,X
    dec.w 0x0000
    bne .B84B

    ldy.b 0x18
    sty.w 0x0000
    inc
.B84B:
    dex
    dex
    bpl .B83B

    lda.b 0x18
    sta.w 0x0000
    ldx.w 0x0002
    inx
    inx
    lda.w 0x1E90
.B85C:
    dec
    sta.l 0x7FD000,X
    dec.w 0x0000
    bne .B86C

    ldy.b 0x18
    sty.w 0x0000
    dec
.B86C:
    inx
    inx
    cpx.w #0x01C0
    bne .B85C

    sep #0x30
    rts

;-----

.B876:
    rep #0x30
    ldx.b 0x18
.B87A:
    txa
    lsr
    eor.w #0xFFFF
    inc
    sta.l 0x7FD000,X
    txa
    clc
    adc.w #0x0010
    tax
    cmp.w #0x01C0
    bcc .B87A

    sep #0x30
    rts

;-----

.B892:
    lda.b 0x27
    and.b #0x7F
    cmp.b #0x18
    rts
