org 0x8000*7
base 0x878000

;-----

_878000:
    php
    phd
    rep #0x20
    lda.w #0x1928
.8007:
    tcd
    sep #0x30
    jsr _87801C
    rep #0x20
    tdc
    clc
    adc.w #0x0020
    cmp.w #0x1AA8
    bcc .8007

    pld
    plp
    rtl

;-----

_87801C:
    lda.b 0x01
    bne .8057

    inc.b 0x01
    stz.b 0x18
    lda.b #0x55
    sta.b 0x16
    rep #0x20
    tdc
    sec
    sbc.w #0x1928
    lsr
    lsr
    lsr
    lsr
    lsr
    sep #0x20
    sta.b 0x0B
    stz.b 0x07
    bra .803E

.803C:
    inc.b 0x07
.803E:
    sec
    sbc.b #0x04
    bcs .803C

    clc
    adc.b #0x04
    tax
    lda.w 0x86BD63,X
    sta.b 0x05
    stz.b 0x06
    ldx.b 0x07
    lda.w 0x86BD67,X
    sta.b 0x08
    stz.b 0x09
.8057:
    ldx.b 0x0B
    lda.w 0x1E54,X
    sta.w 0x0000
    lda.b 0x0B
    asl
    asl
    asl
    clc
    adc.w 0x0000
    tax
    lda.w 0x86BD72,X
    tax
    lda.w 0x86BD6A,X
    ora.b #0x30
    sta.b 0x11
    txa
    jsl _848EEA.8F07
    jsl 0x8280B4
    rts

;-----

_87807E:
    phd
    pea 0x0E68
    pld
    lda.b 0x01
    bne .80A5

    inc.b 0x01
    stz.b 0x18
    lda.b #0x55
    sta.b 0x16
    lda.b #0x34
    sta.b 0x11
    lda.b #0xFF
    sta.b 0x04
    sta.b 0x07
    stz.b 0x06
    stz.b 0x09
    lda.b #0x09
    sta.b 0x0B
    jsl _848EEA.8F07
.80A5:
    lda.w 0x1E4F
    cmp.b 0x07
    beq .80E9

    cmp.b #0x03
    bcs .80D1

    sta.b 0x07
    lda.b #0x09
    cmp.b 0x0B
    beq .80BE

    sta.b 0x0B
    jsl _848EEA.8F07
.80BE:
    lda.b 0x07
    asl
    asl
    asl
    asl
    sta.b 0x08
    asl
    clc
    adc.b 0x08
    clc
    adc.b #0x26
    sta.b 0x08
    bra .80E9

.80D1:
    sta.b 0x07
    lda.b #0x08
    sta.b 0x0B
    jsl _848EEA.8F07
    lda.b 0x07
    sec
    sbc.b #0x03
    asl
    asl
    asl
    asl
    clc
    adc.b #0xAB
    sta.b 0x08
.80E9:
    lda.b 0x07
    cmp.b #0x03
    bcs .8105

    lda.w 0x1E4C
    sta.b 0x04
    asl
    asl
    asl
    asl
    sta.b 0x05
    asl
    clc
    adc.b 0x05
    clc
    adc.b #0x38
    sta.b 0x05
    bra .810E

.8105:
    lda.w 0x1E4C
    sta.b 0x04
    lda.b #0x30
    sta.b 0x05
.810E:
    jsl _848EEA
    jsl 0x8280B4
    pld
    rtl

;-----

_878118:
    lda.w 0x00AC
    bit.b #0x08
    beq .8123

    dec.b 0x07
    bra .8129

.8123:
    bit.b #0x04
    beq .8129

    inc.b 0x07
.8129:
    lda.w 0x00AC
    bit.b #0x02
    beq .8134

    dec.b 0x04
    bra .813A

.8134:
    bit.b #0x01
    beq .813A

    inc.b 0x04
.813A:
    rtl

;-----

_87813B:
    php
    phd
    sep #0x30
    pea 0x1628
    pld
    ldy.b #0x0B
.8145:
    sep #0x30
    phy
    jsr _87815C
    sep #0x30
    ply
    rep #0x20
    tdc
    clc
    adc.w #0x0030
    tcd
    dey
    bpl .8145

    pld
    plp
    rtl

;-----

_87815C:
    ldx.b 0x01
    jsr (.8166,X)
    jsl 0x8280B4
    rts

.8166: d16[.8170, .81C1, .81E1, .8204, .8218]

.8170:
    sty.b 0x0B
    lda.b #0x02
    sta.b 0x01
    lda.b #0x30
    sta.b 0x18
    jsl get_rng
    and.b #0x40
    ora.b #0x38
    sta.b 0x11
    lda.b #0x4D
    sta.b 0x16
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b 0x0B
    ldy.b #0x00
.8192:
    sec
    sbc.b #0x04
    bcc .819A

    iny
    bra .8192

.819A:
    clc
    adc.b #0x04
    asl
    asl
    asl
    asl
    sta.b 0x1C
    asl
    clc
    adc.b 0x1C
    clc
    adc.b #0x3C
    sta.b 0x05
    stz.b 0x06
    tya
    asl
    asl
    asl
    asl
    sta.b 0x1C
    asl
    clc
    adc.b 0x1C
    clc
    adc.b #0x37
    sta.b 0x08
    stz.b 0x09
    rts

.81C1:
    jsr _87822B
    beq .81D6

    jsl get_rng
    cmp.b #0x3A
    bne .81E0

    jsl get_rng
    and.b #0x03
    bne .81E0

.81D6:
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x01
.81E0:
    rts

.81E1:
    jsl _848EEA
    lda.b 0x0F
    bpl .8203

    jsr _87822B
    bne .81F9

    lda.b #0x02
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x01
    rts

.81F9:
    lda.b #0x03
    jsl _848EEA.8F07
    lda.b #0x08
    sta.b 0x01
.8203:
    rts

.8204:
    jsl _848EEA
    jsr _87822B
    beq .8217

    lda.b #0x03
    jsl _848EEA.8F07
    lda.b #0x08
    sta.b 0x01
.8217:
    rts

.8218:
    jsl _848EEA
    lda.b 0x0F
    bpl .822A

    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
.822A:
    rts

;-----

_87822B:
    lda.w 0x1E4F
    asl
    asl
    adc.w 0x1E4C
    cmp.b 0x0B
    rts

;-----

_878236:
    ldx.b 0x01
    jmp (.823B,X)

.823B: d16[.8241, .82A9, .82B8]

.8241:
    stz.b 0x12
    lda.b #0x02
    sta.b 0x18
    lda.b #0x44
    sta.b 0x16
    ldx.b 0x0B
    lda.w 0x00BDDA,X
    jsl _848EEA.8F07
    inc.w 0x1F31
    lda.b 0x0B
    bne .8276

    lda.b #0x02
    sta.b 0x01
    rep #0x20
    lda.w #0x00A0
    sta.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b #0x10
    sta.b 0x1E
    lda.b #0x1E
    sta.b 0x1F
    jml 0x8280B4

.8276:
    lda.b #0x04
    sta.b 0x01
    jsl get_rng
    and.b #0x0E
    tax
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w 0x00BDDD,X
    bcs .8290

    eor.w #0xFFFF
    inc
.8290:
    sta.b 0x1A
    jsl get_rng
    and.w #0x000E
    tax
    lda.w 0x00BDED,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    jml 0x8280B4

.82A9:
    jsl _848EEA
    dec.b 0x1F
    bne .82B8

    dec.w 0x1F31
    jml 0x828398

.82B8:
    jsl update_pos_xy.neg_ay
    jsl 0x8280B4
    lda.b 0x0E
    bne .82CB

    dec.w 0x1F31
    jml 0x828398

.82CB:
    rtl

;-----

_8782CC:
    ldy.b #0x0B
    lda (0x0C),Y
    sta.b 0x0B
    ldx.b 0x01
    jmp (.82D7,X)

.82D7: d16[.82DB, .82F3]

.82DB:
    lda.b #0x02
    sta.b 0x01
    inc.w 0x1F31
    lda.b #0x0C
    sta.b 0x18
    stz.b 0x12
    lda.b #0x97
    sta.b 0x16
    lda.b #0x01
    jsl _848EEA.8F07
    rtl

.82F3:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0000,X
    beq .8321

    lda.b 0x17
    lsr
    rep #0x20
    bcc .830F

    lda.w 0x0028,X
    sta.b 0x05
    lda.w 0x003A,X
    sta.b 0x08
    bra .8319

.830F:
    lda.w 0x002D,X
    sta.b 0x05
    lda.w 0x003E,X
    sta.b 0x08
.8319:
    jsl _848EEA
    jml 0x8280B4

.8321:
    dec.w 0x1F31
    jml 0x828398

;-----

_878328:
    ldy.b #0x27
    lda (0x0C),Y
    and.b #0x7F
    beq .8335

    ldx.b 0x01
    jmp (.8339,X)

.8335:
    jml 0x8283A3

.8339: d16[.833F, .83E4, .83F9]

.833F:
    lda.l 0x7F8220
    sta.b 0x18
    lda.l 0x7F8320
    sta.b 0x11
    lda.b #0x23
    sta.b 0x16
    lda.b #0x02
    sta.b 0x26
    sta.b 0x27
    sta.b 0x28
    stz.b 0x30
    lda.b #0x02
    sta.b 0x12
    lda.b 0x0B
    bne .83AC

    lda.b #0x08
    jsl 0x84A311
    rep #0x20
    lda.w #0xC2B6
    sta.b 0x20
    jsl get_rng
    and.w #0x00FF
    clc
    adc.w 0x1E4D
    sta.b 0x05
    lda.w 0x1E50
    clc
    adc.w #0x0008
    sta.b 0x08
    stz.b 0x1A
    lda.w #0x0200
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x02
    sta.b 0x01
    jsl get_rng
    and.b #0x01
    clc
    adc.b #0x7A
    jsl _80888B
    lda.b #0x10
    jsl _848EEA.8F07
    jml 0x8280B4

.83AC:
    lda.b 0x0B
    cmp.b #0x05
    bcs .83B6

    lda.b #0x40
    tsb.b 0x11
.83B6:
    ldx.b 0x0B
    lda.w 0x00C2BD,X
    jsl _848EEA.8F07
    lda.b 0x0B
    asl
    adc.b #0x06
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    asl
    sta.b 0x1A
    lda.w 0x00EE3C,X
    asl
    sta.b 0x1C
    lda.w #0xC2BA
    sta.b 0x20
    sep #0x20
    lda.b #0x04
    sta.b 0x01
    jml 0x8280B4

.83E4:
    jsl update_pos_xy.neg_ay
.83E8:
    jsl 0x849B03
    jsl 0x8280B4
    lda.b 0x0E
    beq .83F5

    rtl

.83F5:
    jml 0x8283A3

.83F9:
    jsl 0x82820A
    bra .83E8

;-----

_8783FF:
    ldx.b 0x01
    jmp (.8404,X)

.8404: d16[.840C, .843F, .8463, .84C8]

.840C:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x28
    lda.b #0x02
    sta.b 0x37
    lda.l 0x7F826B
    sta.b 0x18
    lda.l 0x7F836B
    ora.b #0x20
    tsb.b 0x11
    stz.b 0x12
    lda.b #0x77
    sta.b 0x16
    lda.b #0x00
    jsl _848EEA.8F07
    rep #0x20
    lda.w 0x1E50
    clc
    adc.w #0x0050
    sta.b 0x08
    jml 0x8280B4

.843F:
    jsl _848EEA
    lda.b 0x0F
    bpl .8451

    lda.b #0x04
    sta.b 0x01
    lda.b #0x01
    jsl _848EEA.8F07
.8451:
    dec.b 0x37
    bne .845F

    lda.b #0x1E
    sta.b 0x37
    lda.b #0x31
    jsl _80888B
.845F:
    jml 0x8280B4

.8463:
    jsl _848EEA
    dec.b 0x37
    bne .8475

    lda.b #0x1E
    sta.b 0x37
    lda.b #0x31
    jsl _80888B
.8475:
    rep #0x20
    lda.b 0x05
    cmp.w 0x0BAD
    beq .84A0

    bpl .8491

    lda.w 0x0BAC
    sec
    sbc.w #0x0180
    sta.w 0x0BAC
    bcs .84A0

    dec.w 0x0BAE
    bra .84A0

.8491:
    lda.w 0x0BAC
    clc
    adc.w #0x0180
    sta.w 0x0BAC
    bcc .84A0

    inc.w 0x0BAE
.84A0:
    sep #0x20
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    and.b #0x7F
    beq .84B8

    lda.w 0x0039,X
    beq .84B8

    sep #0x10
    jml 0x8280B4

.84B8:
    sep #0x10
    lda.b #0x06
    sta.b 0x01
    lda.b #0x02
    jsl _848EEA.8F07
    jml 0x8280B4

.84C8:
    jsl _848EEA
    lda.b 0x0F
    bpl .84D4

    jml 0x8283A3

.84D4:
    jml 0x8280B4

;-----

_8784D8:
    ldx.b 0x01
    jmp (.84DD,X)

.84DD: d16[.84E1, .8550]

.84E1:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x03
    sta.b 0x28
    lda.b #0x76
    sta.b 0x16
    lda.l 0x7F826A
    sta.b 0x18
    lda.l 0x7F836A
    ora.b 0x11
    sta.b 0x11
    asl
    asl
    lda.b #0x08
    bcs .8503

    lda.b #0x18
.8503:
    clc
    adc.b 0x0B
    dec
    sta.b 0x37
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    sta.b 0x1A
    bpl .8519

    eor.w #0xFFFF
    inc
.8519:
    asl
    asl
    asl
    xba
    tay
    sty.b 0x1F
    lda.w 0x00EE3C,X
    bne .8528

    lda.w #0x0040
.8528:
    sta.b 0x1C
    bpl .8530

    eor.w #0xFFFF
    inc
.8530:
    asl
    asl
    asl
    xba
    tay
    sty.b 0x1E
    lda.w #0xC35F
    sta.b 0x20
    sep #0x20
    lda.b #0x7F
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x10
    jsl _848EEA.8F07
    jml 0x8280B4

.8550:
    lda.b 0x1D
    bpl .8564

    lda.b 0x1B
    bpl .855E

    jsl update_pos_xy.neg_ay_ax
    bra .8572

.855E:
    jsl update_pos_xy.neg_ay_pos_ax
    bra .8572

.8564:
    lda.b 0x1B
    bpl .856E

    jsl update_pos_xy.pos_ay_neg_ax
    bra .8572

.856E:
    jsl update_pos_xy.pos_ay_ax
.8572:
    jsl 0x849B03
    beq .8580

.8578:
    jsl 0x84A4AB
.857C:
    jml 0x8283A3

.8580:
    jsl 0x849B43
    bne .8578

    jsl 0x8280B4
    lda.b 0x0E
    beq .857C

    rtl

;-----

_87858F:
    ldx.b 0x01
    jsr (.85B9,X)
    lda.b 0x03
    bne .85B4

    lda.b 0x37
    bne .85AC

    lda.w 0x0BCF
    sta.b 0x02
    jsl 0x849B03
    lda.w 0x0BCF
    cmp.b 0x02
    bne .85B4

.85AC:
    jsl 0x8280B4
    lda.b 0x0E
    bne .85B8

.85B4:
    jsl 0x8283A3
.85B8:
    rtl

.85B9: d16[.85BF, .85F1, .8613]

.85BF:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x02
    sta.b 0x26
    lda.b #0x06
    sta.b 0x12
    stz.b 0x03
    stz.b 0x37
    stz.b 0x38
    lda.b #0x01
    sta.b 0x28
    rep #0x20
    lda.w #0xC363
    sta.b 0x20
    sep #0x20
    stz.b 0x29
    lda.b #0x08
    sta.b 0x2A
    lda.b #0x02
    jsl _848EEA.8F07
    rts

.85F1:
    jsl _8490A0
    cmp.b #0x00
    beq .860A

    lda.b #0x03
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x37
    lda.b #0x04
    sta.b 0x01
    jmp .8612

.860A:
    jsl update_pos_xy.neg_ay
    jsl _848EEA
.8612:
    rts

.8613:
    lda.b 0x38
    bne .8627

    lda.b 0x0F
    cmp.b #0x01
    bne .8627

    lda.b #0x01
    sta.b 0x38
    lda.b #0x56
    jsl _80888B
.8627:
    lda.b 0x0F
    bmi .8632

    jsl _848EEA
    jmp .8636

.8632:
    lda.b #0x01
    sta.b 0x03
.8636:
    rts

;-----

_878637:
    ldy.b #0x27
    lda (0x0C),Y
    and.b #0x7F
    bne .8643

    jml 0x8283A3

.8643:
    ldx.b 0x01
    jmp (.8648,X)

.8648: d16[.864E, .86AE, .86CA]

.864E:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x28
    lda.b #0x06
    sta.b 0x16
    lda.l 0x7F8201
    sta.b 0x18
    lda.l 0x7F8301
    ora.b 0x11
    sta.b 0x11
    lda.b #0x02
    sta.b 0x26
    sta.b 0x27
    rep #0x20
    lda.w #0xC368
    sta.b 0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .867F

    eor.w #0xFFFF
    inc
.867F:
    cmp.w #0x0050
    lda.w #0x0440
    bcs .868A

    lda.w #0x0260
.868A:
    sta.b 0x1A
    lda.b 0x10
    asl
    asl
    bcs .869A

    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
.869A:
    stz.b 0x1C
    sep #0x20
    lda.b #0x10
    sta.b 0x1E
    lda.b #0x17
    jsl _848EEA.8F07
    lda.b #0x5B
    jsl _80888B
.86AE:
    jsl update_pos_xy.neg_ay
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x2B
    beq .86DA

    lda.b #0x04
    sta.b 0x01
    lda.b #0x18
    jsl _848EEA.8F07
    bra .86DA

.86CA:
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x0F
    bpl .86DA

    jml 0x8283A3

.86DA:
    jsl 0x849B03
    jml 0x8280B4

;-----

_8786E2:
    ldy.b #0x27
    lda (0x0C),Y
    and.b #0x7F
    bne .86EE

    jml 0x8283A3

.86EE:
    ldx.b 0x01
    jmp (.86F3,X)

.86F3: d16[.8701, .875B, .877F, .87D3, .8817, .885A, .8881]

.8701:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x12
    sta.b 0x28
    lda.b #0x02
    sta.b 0x26
    sta.b 0x27
    lda.l 0x7F8201
    sta.b 0x18
    lda.l 0x7F8301
    ora.b 0x11
    sta.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0280
    bcs .8729

    lda.w #0xFD00
.8729:
    sta.w 0x0000
    jsl get_rng
    and.w #0x007F
    clc
    adc.w 0x0000
    sta.b 0x1A
    lda.w #0x0200
    sta.b 0x1C
    lda.w #0xC372
    sta.b 0x20
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    lda.b #0x06
    sta.b 0x16
    lda.b #0x0E
    jsl _848EEA.8F07
    lda.b #0xFF
    sta.b 0x2F
    jml 0x8280B4

.875B:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .877B

    lda.b #0x56
    jsl _80888B
    lda.b #0x04
    sta.b 0x01
    stz.b 0x2F
    lda.b #0x0F
    jsl _848EEA.8F07
.877B:
    jml 0x8280B4

.877F:
    jsl _848EEA
    jsl 0x8491BE
    jsr _878886
    jsr .8881
    beq .8793

    jml 0x8283A3

.8793:
    rep #0x10
    ldx.w #0x1428
.8798:
    lda.w 0x0000,X
    beq .87C0

    lda.w 0x000A,X
    cmp.b #0x20
    bne .87C0

    jsl 0x849C0E
    bcc .87C0

    sep #0x10
    lda.b #0x06
    sta.b 0x01
    lda.b #0x11
    jsl _848EEA.8F07
    lda.b #0x5C
    jsl _80888B
    jml 0x8280B4

.87C0:
    rep #0x20
    txa
    clc
    adc.w #0x0040
    tax
    sep #0x20
    cpx.w #0x1628
    bcc .8798

    jml 0x8280B4

.87D3:
    jsl 0x8491BE
    jsl _848EEA
    jsr .8881
    beq .87E4

    jml 0x8283A3

.87E4:
    lda.b 0x0F
    bpl .8813

    lda.b #0x08
    sta.b 0x01
    lda.l 0x7F8205
    sta.b 0x18
    lda.l 0x7F8305
    sta.b 0x11
    lda.b #0x0C
    sta.b 0x16
    lda.b #0x02
    jsl _848EEA.8F07
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.b 0x08
    lda.w #0xC386
    sta.b 0x20
    sep #0x20
.8813:
    jml 0x8280B4

.8817:
    jsl _848EEA
    jsl 0x8491BE
    jsr .8881
    beq .8828

    jml 0x8283A3

.8828:
    lda.b 0x0F
    rep #0x20
    and.w #0x000F
    clc
    adc.w #0xC390
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    rep #0x20
    lda.w #0xC386
    sta.b 0x20
    sep #0x20
    lda.b 0x0F
    bpl .8856

    lda.b #0x0A
    sta.b 0x01
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0xB4
    sta.b 0x37
.8856:
    jml 0x8280B4

.885A:
    jsl _848EEA
    jsl 0x8491BE
    jsr .8881
    bne .886B

    dec.b 0x37
    bne .886F

.886B:
    jml 0x8283A3

.886F:
    jsl 0x849B03
    lda.b 0x37
    cmp.b #0x1E
    bcs .887D

    lsr
    bcs .887D

    rtl

.887D:
    jml 0x8280B4

.8881:
    lda.b 0x2B
    and.b #0x03
    rts

;-----

_878886:
    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .88B2

    rep #0x20
    ldx.w #0x0000
    lda.w 0x0BCA
    cmp.w 0x0BAD
    bcs .88A1

    ldx.w #0x0001
.88A1:
    stx.w 0x0000
    clc
    adc.w 0x0BAD
    lsr
    bcc .88AF

    clc
    adc.w 0x0000
.88AF:
    sta.w 0x0BAD
.88B2:
    sep #0x30
    rts

;-----

_8788B5:
    ldx.b 0x01
    jsr (.88BB,X)
    rtl

.88BB: d16[.88C1, .88E0, .8931]

.88C1:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    inc.b 0x28
    lda.b #0x02
    sta.b 0x12
    jsl 0x8280B4
    lda.b #0x40
    sta.b 0x39
    lda.b 0x0B
    jsl _848EEA.8F07
    rts

.88E0:
    lda.b 0x0F
    bmi .88EB

    jsl _848EEA
    jmp .892C

.88EB:
    lda.b #0x04
    jsl _848EEA.8F07
    lda.b 0x11
    and.b #0x40
    beq .8902

    rep #0x20
    lda.w #0x0012
    sta.w 0x0000
    jmp .890A

.8902:
    rep #0x20
    lda.w #0xFFEE
    sta.w 0x0000
.890A:
    lda.w #0x0014
    sta.w 0x0002
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.b 0x05
    lda.b 0x08
    sec
    sbc.w 0x0002
    sta.b 0x08
    sep #0x20
    lda.b #0x04
    sta.b 0x01
    lda.b #0x33
    jsl _80888B
.892C:
    jsl 0x8280B4
    rts

.8931:
    dec.b 0x39
    bne .8938

    jmp .8959

.8938:
    lda.b 0x28
    bne .8940

    jsl 0x849B43
.8940:
    jsl 0x849B03
    bne .8959

    jsl update_pos_x
    jsl _848EEA
    jsl 0x8280B4
    lda.b 0x0E
    bne .8967

    jmp .8963

.8959:
    lda.b 0x16
    cmp.b #0x28
    bne .8963

    jsl 0x84A4AB
.8963:
    jsl 0x8283A3
.8967:
    rts

;-----

_878968:
    ldx.b 0x01
    jsr (.896E,X)
    rtl

.896E: d16[.8972, .89A2]

.8972:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x06
    sta.b 0x12
    lda.b #0x01
    sta.b 0x28
    rep #0x20
    lda.w #0xC3A5
    sta.b 0x20
    sep #0x20
    jsl 0x8280B4
    lda.b 0x0B
    jsl _848EEA.8F07
    lda.b #0x40
    sta.b 0x38
    lda.b #0x34
    jsl _80888B
    rts

.89A2:
    dec.b 0x38
    beq .89BA

    jsl 0x849B03
    jsl 0x82820A
    jsl _848EEA
    jsl 0x8280B4
    lda.b 0x0E
    bne .89BE

.89BA:
    jsl 0x8283A3
.89BE:
    rts

;-----

_8789BF:
    ldx.b 0x01
    jmp (.89C4,X)

.89C4: d16[.89CA, .8A21, .8A35]

.89CA:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x28
    lda.b #0x83
    sta.b 0x10
    stz.b 0x12
    lda.b #0xFF
    sta.b 0x0B
    stz.b 0x18
    lda.l 0x7F8383
    ora.b 0x11
    ora.b #0x30
    clc
    adc.b #0x02
    sta.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0400
    bcs .89F5

    lda.w #0xFC00
.89F5:
    sta.b 0x1A
    lda.w #0xB32E
    sta.b 0x31
    lda.w #0xC3AA
    sta.b 0x20
    sep #0x20
    stz.b 0x26
    lda.b #0x01
    sta.b 0x27
    lda.b #0x8A
    sta.b 0x16
    lda.b #0x00
    jsl _848EEA.8F07
    jsl 0x848FCA
    lda.b #0x5A
    jsl _80888B
    jml 0x8280B4

.8A21:
    jsl _848EEA
    lda.b 0x0F
    cmp.b #0x10
    bne .8A3D

    lda.b #0x04
    sta.b 0x01
    lda.b #0x55
    sta.b 0x0B
    bra .8A3D

.8A35:
    jsl _848EEA
    jsl update_pos_x
.8A3D:
    rep #0x20
    lda.b 0x0F
    and.w #0x001F
    clc
    adc.w #0xC3AA
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    beq .8A6D

    lda.b 0x11
    asl
    asl
    rep #0x20
    bcs .8A63

    lda.w 0x0BAD
    sec
    sbc.w #0x0004
    bra .8A6A

.8A63:
    lda.w 0x0BAD
    clc
    adc.w #0x0004
.8A6A:
    sta.w 0x0BAD
.8A6D:
    jsl 0x82808F
    lda.b 0x0E
    beq .8A7A

    dec.b 0x0B
    beq .8A7A

    rtl

.8A7A:
    jml 0x8283A3

;-----

    incsrc "obj/boomer_kuwanger.asm"

;-----

_8791A7:
    lda.b #0xFF
    sta.b 0x37
    ldx.b 0x01
    jmp (.91B0,X)

.91B0: d16[.91BA, .9229, .9303, .9639, .9639]

.91BA:
    lda.b 0x02
    bne .9202

    jsl 0x84AACA
    beq .91C8

    jml 0x828398

.91C8:
    lda.b #0x3C
    sta.b 0x34
    lda.b #0x03
    sta.b 0x36
    lda.b #0x02
    sta.b 0x38
    stz.b 0x3A
    stz.b 0x35
    stz.b 0x39
    jsl 0x828321
    beq .91E1

    rtl

.91E1:
    inc.w 0x0000,X
    lda.b #0x0E
    sta.w 0x000A,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    sep #0x30
    inc.b 0x02
    jsl 0x849FE6
    lda.w 0x1F26
    beq .9202

    lda.b #0x2E
    jsl _80878B
.9202:
    dec.b 0x34
    beq .9207

    rtl

.9207:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x06
    sta.b 0x12
    lda.b #0x04
    sta.b 0x26
    rep #0x20
    lda.w #0xC83C
    sta.b 0x20
    sep #0x20
    stz.b 0x02
    stz.b 0x3B
    stz.b 0x3C
    rtl

.9229:
    ldx.b 0x02
    jsr (.9232,X)
    jml 0x8280B4

.9232: d16[.923C, .9270, .929B, .92A8, .92DC]

.923C:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x37
    stz.b 0x2B
    rep #0x20
    lda.w 0x1E60
    clc
    adc.w #0x0070
    sta.w 0x1E60
    lda.b 0x05
    clc
    adc.w #0x0040
    sta.b 0x05
    lda.w 0x0BAD
    sec
    sbc.w 0x1E4D
    sta.w 0x1E74
    sta.w 0x1E76
    sep #0x20
    rts

.9270:
    jsl 0x8491BE
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    cmp.w #0x0080
    bcs .9298

    tdc
    sta.w 0x1F0E
    sep #0x20
    inc.w 0x0C0C
    lda.b #0x04
    sta.b 0x02
    lda.b #0x0C
    jsl _848EEA.8F07
    lda.b #0x13
    sta.b 0x37
.9298:
    sep #0x20
    rts

.929B:
    jsl _848EEA
    lda.b 0x0F
    beq .92A7

    lda.b #0x06
    sta.b 0x02
.92A7:
    rts

.92A8:
    inc.b 0x34
    lda.b 0x34
    lsr
    bcc .92D7

    lda.b #0x0C
    jsl _80888B.88B6
    lda.b 0x27
    and.b #0x7F
    inc
    sta.b 0x27
    cmp.b #0x20
    bcc .92D7

    lda.b #0x08
    sta.b 0x02
    rep #0x20
    lda.w #0x0080
    sta.w 0x1E74
    sta.w 0x1E76
    lda.w #0x0002
    sta.w 0x1E54
    sep #0x20
.92D7:
    lda.b #0x80
    tsb.b 0x27
    rts

.92DC:
    dec.b 0x34
    bne .9302

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    jsl 0x849FFE
    stz.w 0x0C0C
    rep #0x20
    lda.w #0x0008
    sta.w 0x1E54
    sep #0x20
    lda.w 0x1F26
    beq .9302

    lda.b #0x1E
    jsl _80878B
.9302:
    rts

.9303:
    lda.b 0x33
    tsb.b 0x11
    ldx.b 0x02
    jsr (.9394,X)
    lda.b #0x08
    ldx.b 0x39
    beq .9314

    lda.b #0x05
.9314:
    sta.b 0x28
    jsl 0x849B43
    beq .936F

    bpl .9350

    lda.b #0x06
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b #0x01
    sta.w 0x1F0C
    sta.w 0x0BD8
    lda.w 0x1F7A
    cmp.b #0x09
    bcs .933B

    lda.b #0x04
    jsl 0x848000
.933B:
    lda.b #0x14
    jsl _848EEA.8F07
    lda.b #0x15
    sta.b 0x37
    jsl 0x84AC92
    lda.b #0x13
    jsl _80888B
    rtl

.9350:
    lda.b 0x39
    bne .936F

    lda.b #0x3C
    sta.b 0x39
    lda.b #0x13
    jsl _80888B
    lda.w 0x1F1D
    cmp.b #0x0D
    beq .9369

    cmp.b #0x16
    bne .936F

.9369:
    lda.b 0x36
    beq .936F

    dec.b 0x36
.936F:
    lda.b 0x39
    beq .937E

    dec
    sta.b 0x39
    and.b #0x03
    bne .937E

    lda.b #0x0E
    trb.b 0x11
.937E:
    jsl 0x849B03
    lda.w 0x0BCF
    and.b #0x7F
    bne .938D

    lda.b #0x01
    sta.b 0x30
.938D:
    jsr _87971B
    jml 0x8280B4

.9394: d16[.939C, .9475, .9503, .95B4]

.939C:
    ldx.b 0x03
    jmp (.93A1,X)

.93A1: d16[.93AD, .93D7, .93F0, .940F, .9442, .9461]

.93AD:
    lda.b #0x02
    sta.b 0x03
    jsl 0x84AC92
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x07
    sta.b 0x37
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    asl
    asl
    sta.b 0x1A
    lda.w #0x0593
    sta.b 0x1C
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    rts

.93D7:
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x0F
    bpl .93EF

    lda.b #0x04
    sta.b 0x03
    lda.b #0xFF
    sta.b 0x2F
    jsl update_pos_xy.neg_ay
.93EF:
    rts

.93F0:
    jsl update_pos_xy.neg_ay
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x1D
    bpl .940E

    lda.b #0x06
    sta.b 0x03
    lda.b #0x03
    jsl _848EEA.8F07
    lda.b #0x09
    sta.b 0x37
.940E:
    rts

.940F:
    jsl update_pos_xy.neg_ay
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .9441

    lda.b #0x08
    sta.b 0x03
    lda.b #0x04
    jsl _848EEA.8F07
    lda.b #0x0A
    sta.b 0x37
    stz.b 0x2F
    lda.b #0x4D
    jsl _80888B
    lda.b #0x1E
    sta.b 0x3A
    lda.b #0x4B
    jsl 0x84A333
.9441:
    rts

.9442:
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x0F
    bpl .9460

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x34
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x37
.9460:
    rts

.9461:
    jsl 0x84AC92
    jsl _848EEA
    jsl 0x8491BE
    dec.b 0x34
    bne .9474

    jmp .9663

.9474:
    rts

.9475:
    ldx.b 0x03
    jmp (.947A,X)

.947A: d16[.9480, .9497, .94EF]

.9480:
    lda.b #0x02
    sta.b 0x03
    jsl 0x84AC92
    lda.b #0x0D
    jsl _848EEA.8F07
    lda.b #0x16
    sta.b 0x37
    jsl 0x8491BE
    rts

.9497:
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x0F
    beq .94EE

    bmi .94DC

    jsl 0x828358
    bne .94D9

    inc.w 0x0000,X
    lda.b #0x21
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.w #0x002E
    bcs .94C6

    lda.w #0xFFD2
.94C6:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0006
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.94D9:
    sep #0x30
    rts

.94DC:
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x37
    lda.b #0x3C
    sta.b 0x34
    lda.b #0x04
    sta.b 0x03
.94EE:
    rts

.94EF:
    jsl 0x84AC92
    jsl 0x8491BE
    jsl _848EEA
    dec.b 0x34
    bne .9502

    jmp .9663

.9502:
    rts

.9503:
    ldx.b 0x03
    jmp (.9508,X)

.9508: d16[.950E, .953C, .95A0]

.950E:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x05
    jsl _848EEA.8F07
    lda.b #0x0B
    sta.b 0x37
    lda.b 0x35
    bne .9537

    lda.b #0x04
    sta.b 0x35
    jsl get_rng
    lsr
    bcc .9537

    and.b #0x0F
    cmp.b #0x03
    bcs .9535

    dec.b 0x35
    bra .9537

.9535:
    inc.b 0x35
.9537:
    jsl 0x8491BE
    rts

.953C:
    jsl 0x84AC92
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x0F
    beq .959D

    bmi .9587

    jsl 0x828358
    bne .9582

    inc.w 0x0000,X
    lda.b #0x20
    sta.w 0x000A,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.w #0x002A
    bcs .956F

    lda.w #0xFFD6
.956F:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0007
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.9582:
    sep #0x30
    dec.b 0x35
    rts

.9587:
    lda.b 0x35
    bne .959D

    lda.b #0x04
    sta.b 0x03
    lda.b #0x5A
    sta.b 0x34
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x37
.959D:
    jmp _87973C

.95A0:
    jsl 0x84AC92
    jsl _848EEA
    jsl 0x8491BE
    dec.b 0x34
    bne .95B3

    jmp .9663

.95B3:
    rts

.95B4:
    ldx.b 0x03
    jmp (.95B9,X)

.95B9: d16[.95C1, .95D8, .95F3, .9618]

.95C1:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x0C
    jsl _848EEA.8F07
    lda.b #0x13
    sta.b 0x37
    jsl 0x8491BE
    jsl 0x84AC92
    rts

.95D8:
    jsl _848EEA
    jsl 0x8491BE
    lda.b 0x0F
    bpl .95F2

    lda.b #0x3C
    sta.b 0x34
    lda.b #0x04
    sta.b 0x03
    lda.b #0xA1
    jsl _80888B.88B6
.95F2:
    rts

.95F3:
    jsl 0x8491BE
    dec.b 0x34
    bne .9617

    lda.b 0x38
    eor.b #0x01
    sta.b 0x38
    jsl 0x848000
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x06
    sta.b 0x37
    lda.b #0x06
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x34
.9617:
    rts

.9618:
    jsl 0x8491BE
    jsl 0x84AC92
    dec.b 0x34
    bne .9638

    lda.b 0x35
    beq .9635

    lda.b #0x04
    sta.b 0x02
    sta.b 0x3B
    lda.b #0x01
    sta.b 0x3C
    stz.b 0x03
    rts

.9635:
    jmp .9663

.9638:
    rts

.9639:
    jsl 0x84A66D
    bpl .9658

    lda.w 0x1F7A
    cmp.b #0x09
    bcc .9654

    lda.b #0x1C
    jsl _80878B
    lda.b #0xF5
    ldy.b #0x03
    jsl _808850.8868
.9654:
    jml 0x828398

.9658:
    lda.b 0x03
    cmp.b #0x14
    bcs .9662

    jml 0x8280B4

.9662:
    rtl

.9663:
    stz.b 0x03
    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.w 0x1E50
    cmp.w #0x0070
    bcs .9687

    sep #0x20
    stz.b 0x02
    stz.b 0x03
    lda.b 0x3B
    beq .9684

    stz.b 0x3B
    lda.b #0x01
    sta.b 0x3C
    rts

.9684:
    inc.b 0x3C
    rts

.9687:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .9695

    eor.w #0xFFFF
    inc
.9695:
    cmp.w #0x0080
    sep #0x20
    bcc .96A0

    lda.b #0x20
    bra .96AA

.96A0:
    cmp.b #0x50
    bcc .96A8

    lda.b #0x10
    bra .96AA

.96A8:
    lda.b #0x00
.96AA:
    ldx.b 0x36
    bne .96B1

    clc
    adc.b #0x30
.96B1:
    sta.w 0x0000
    jsl get_rng
    and.b #0x0F
    clc
    adc.w 0x0000
    tax
    lda.w 0x00C846,X
    sta.b 0x02
    cmp.b #0x02
    bne .96F9

    lda.b #0x02
    sta.w 0x0000
    rep #0x10
    ldx.w #0x1428
.96D2:
    lda.w 0x0000,X
    beq .96E8

    lda.w 0x000A,X
    cmp.b #0x21
    bne .96E8

    dec.w 0x0000
    bne .96E8

    sep #0x10
    jmp .9663

.96E8:
    rep #0x20
    txa
    clc
    adc.w #0x0040
    tax
    sep #0x20
    cpx.w #0x1628
    bcc .96D2

    sep #0x10
.96F9:
    lda.b 0x02
    cmp.b 0x3B
    beq .9707

    sta.b 0x3B
    lda.b #0x01
    sta.b 0x3C
    bra .9717

.9707:
    lda.b 0x3C
    cmp.b #0x03
    bcc .9714

    ldx.b 0x36
    beq .9714

    jmp .9687

.9714:
    inc
    sta.b 0x3C
.9717:
    jsr _87973C
    rts

;-----

_87971B:
    lda.b 0x3A
    beq .973B

    bmi .973B

    lda.w 0x0C32
    ora.w 0x1F0C
    bne .9739

    lda.w 0x0C06
    and.b #0x04
    beq .9739

    lda.b 0x3A
    jsl 0x84A008
    stz.b 0x3A
    rts

.9739:
    dec.b 0x3A
.973B:
    rts

;-----

_87973C:
    lda.b 0x36
    beq .9793

    rep #0x10
    ldx.w #0x1428
.9745:
    lda.w 0x0000,X
    beq .9782

    lda.w 0x000A,X
    cmp.b #0x21
    bne .9782

    lda.b 0x38
    lsr
    rep #0x20
    bcc .9761

    lda.w 0x0005,X
    sec
    sbc.w 0x1E5E
    bra .976C

.9761:
    lda.w 0x1E60
    clc
    adc.w #0x0100
    sec
    sbc.w 0x0005,X
.976C:
    bcc .9782

    cmp.w #0x0040
    bcs .9782

    sep #0x30
    lda.b #0x06
    sta.b 0x02
    sta.b 0x3B
    lda.b #0x01
    sta.b 0x3C
    stz.b 0x03
    rts

.9782:
    rep #0x20
    txa
    clc
    adc.w #0x0040
    tax
    sep #0x20
    cpx.w #0x0040
    bcc .9745

    sep #0x10
.9793:
    rts

;-----

_879794:
    ldx.b 0x01
    jsr (.97AA,X)
    jsl 0x82806E
    bcc .97A6

    jsr _879930
    jml 0x828387

.97A6:
    jml 0x8280B4

.97AA: d16[.97B0, .97F7, .98BE]

.97B0:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    sta.b 0x30
    lda.b #0x04
    sta.b 0x12
    sta.b 0x2F
    stz.b 0x28
    stz.b 0x35
    stz.b 0x36
    lda.b 0x0B
    rep #0x20
    bmi .97D3

    lda.w #0x0180
    sta.b 0x1A
    bra .97DC

.97D3:
    lda.w #0xFE80
    sta.b 0x1A
    lda.b 0x05
    sta.b 0x37
.97DC:
    stz.b 0x1C
    lda.w #0xCA42
    sta.b 0x20
    sep #0x20
    stz.b 0x1F
    stz.b 0x1E
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    jsr _8798E5
    rts

.97F7:
    lda.b 0x35
    bne .97FD

    stz.b 0x36
.97FD:
    lda.b 0x36
    bne .9809

    jsl update_pos_x
    jsl 0x8491BE
.9809:
    jsl _848EEA
    jsl 0x84AB6E
    rep #0x10
    ldx.w #0xCA4C
    stx.b 0x20
    sep #0x10
    jsl 0x84AB43
    rep #0x10
    ldx.w #0xCA42
    stx.b 0x20
    ldx.b 0x33
    lda.b 0x35
    beq .9847

    bpl .983E

    rep #0x20
    stz.w 0x0000,X
    stz.w 0x000E,X
    stz.w 0x0002,X
    sep #0x20
    stz.b 0x35
    bra .9847

.983E:
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    sep #0x20
.9847:
    lda.b 0x1B
    bmi .9884

    lda.b 0x0B
    bpl .985F

    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x37
    bmi .98BB

    cmp.w #0x0030
    sep #0x20
    bcs .9865

.985F:
    lda.b 0x2B
    bit.b #0x01
    beq .98BB

.9865:
    lda.b 0x35
    bne .9873

    lda.b #0x04
    sta.b 0x01
    lda.b #0x40
    sta.b 0x39
    bra .987D

.9873:
    ldx.b 0x33
    lda.w 0x0011,X
    ora.b #0x40
    sta.w 0x0011,X
.987D:
    ldx.w #0xFE80
    stx.b 0x1A
    bra .98BB

.9884:
    lda.b 0x0B
    bpl .9898

    rep #0x20
    lda.b 0x37
    sec
    sbc.b 0x05
    bmi .98BB

    cmp.w #0x0030
    sep #0x20
    bcs .989E

.9898:
    lda.b 0x2B
    bit.b #0x02
    beq .98BB

.989E:
    lda.b 0x35
    bne .98AC

    lda.b #0x04
    sta.b 0x01
    lda.b #0x40
    sta.b 0x39
    bra .98B6

.98AC:
    ldx.b 0x33
    lda.w 0x0011,X
    and.b #0xBF
    sta.w 0x0011,X
.98B6:
    ldx.w #0x0180
    stx.b 0x1A
.98BB:
    sep #0x10
    rts

.98BE:
    dec.b 0x39
    bne .98C6

    lda.b #0x02
    sta.b 0x01
.98C6:
    jsl _848EEA
    jsl 0x84AB6E
    rep #0x10
    ldx.w #0xCA4C
    stx.b 0x20
    sep #0x10
    jsl 0x84AB43
    rep #0x10
    ldx.w #0xCA42
    stx.b 0x20
    sep #0x10
    rts

;-----

_8798E5:
    rep #0x10
    lda.b 0x0B
    bit.b #0x01
    beq .992D

    jsl 0x828321
    bne .992D

    inc.b 0x35
    stx.b 0x33
    inc.w 0x0000,X
    lda.b #0x17
    sta.w 0x000A,X
    lda.l 0x7F8287
    sta.w 0x0018,X
    lda.b #0x8D
    sta.w 0x0016,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b #0x80
    sta.w 0x000B,X
    lda.b #0x02
    sta.w 0x0001,X
    rep #0x21
    lda.b 0x08
    sbc.w #0x0010
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    tdc
    sta.w 0x0033,X
.992D:
    sep #0x30
    rts

;-----

_879930:
    lda.b 0x35
    beq .9943

    rep #0x30
    ldx.b 0x33
    stz.w 0x0000,X
    stz.w 0x000E,X
    stz.w 0x0002,X
    sep #0x30
.9943:
    rts

;-----

    incsrc "obj/turn_cannon.asm"
    incsrc "obj/scrap_robo.asm"

;-----

_879ED4:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .9EE9

    sep #0x20
    lda.b #0x40
    ora.b 0x11
    sta.b 0x11
    jmp .9EF1

.9EE9:
    sep #0x20
    lda.b #0xBF
    and.b 0x11
    sta.b 0x11
.9EF1:
    rtl

;-----

_879EF2:
    rep #0x10
    sep #0x20
    jsl 0x8282D3
    bne .9F46

    inc.w 0x0000,X
    lda.b #0x28
    sta.w 0x000A,X
    tya
    clc
    adc.w 0x0000
    sta.w 0x000B,X
    lda.b 0x0B
    beq .9F16

    inc.w 0x0002,X
    jmp .9F1B

.9F16:
    lda.b #0x00
    sta.w 0x0002,X
.9F1B:
    lda.b 0x34
    ora.b 0x11
    sta.w 0x0011,X
    lda.b 0x0B
    bne .9F30

    lda.l 0x7F8245
    sta.w 0x0018,X
    jmp .9F37

.9F30:
    lda.l 0x7F8247
    sta.w 0x0018,X
.9F37:
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    dey
    bpl _879EF2

.9F46:
    sep #0x30
    rts

;-----

_879F49:
    stz.b 0x2F
    jsl 0x8491BE
    lda.b 0x2E
    cmp.b #0x00
    beq .9F7D

    cmp.b #0x3E
    beq .9F61

    cmp.b #0x33
    beq .9F61

    cmp.b #0x3F
    bne .9F7A

.9F61:
    lda.b #0x0A
    sta.b 0x01
    rep #0x20
    lda.w #0xFFA0
    sta.b 0x1C
    sep #0x20
    lda.b #0x10
    sta.b 0x1E
    lda.b #0x07
    sta.b 0x33
    lda.b #0x01
    sta.b 0x38
.9F7A:
    lda.b #0x01
    rts

.9F7D:
    rep #0x20
    lda.w #0xFE80
    sta.b 0x1C
    lda.w #0x0000
    sta.b 0x1A
    sep #0x20
    lda.b #0x30
    sta.b 0x1E
    lda.b #0x02
    sta.b 0x01
    lda.b 0x0F
    cmp.b #0x02
    beq .9FA7

    lda.b 0x0B
    bne .9FA7

    lda.b 0x39
    bne .9FA7

    lda.b #0x01
    jsl _848EEA.8F07
.9FA7:
    lda.b #0x00
    rts

;-----

_879FAA:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x45
    sta.b 0x16
    lda.l 0x7F8247
    sta.b 0x18
    lda.l 0x7F8347
    sta.b 0x11
    stz.b 0x30
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    stz.b 0x1E
    sep #0x20
    rts

;-----

_879FCB:
    jsl 0x849B7E
    beq .A024

    cmp.b #0x39
    bne .A024

    rep #0x10
    ldx.w 0x0000
    lda.w 0x0001,X
    cmp.b #0x06
    bne .A024

    sep #0x10
    lda.b 0x0B
    bne .9FEC

    lda.b #0x04
    jmp .9FEE

.9FEC:
    lda.b #0x01
.9FEE:
    jsl _848EEA.8F07
    lda.b 0x0B
    bne .A000

    rep #0x20
    lda.w #0xCE23
    sta.b 0x20
    jmp .A007

.A000:
    rep #0x20
    lda.w #0xCE37
    sta.b 0x20
.A007:
    sep #0x20
    inc.b 0x35
    lda.b #0x01
    sta.b 0x39
    lda.b #0x3E
    jsl _80888B
    jsl get_rng
    and.b #0x07
    sta.w 0x0000
    ldy.b #0x03
    jsr _879EF2
    rts

.A024:
    sep #0x10
    rts

;-----

_87A027:
    rep #0x10
    dec.b 0x3A
    beq .A078

    rep #0x20
    lda.w 0x0000
    clc
    adc.w #0x000C
    sta.w 0x0000
    jsl get_rng
    and.w #0x0008
    sta.w 0x0002
    sep #0x20
    jsl 0x8282D3
    bne .A078

    inc.w 0x0000,X
    lda.b #0x31
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    stz.w 0x000B,X
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0010
    sec
    sbc.w 0x0002
    sta.w 0x0008,X
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    sep #0x20
    jmp _87A027

.A078:
    sep #0x10
    lda.b #0x01
    sta.b 0x3A
    rts

;-----

    incsrc "obj/batton_bone.asm"
    incsrc "obj/hotarion.asm"
    incsrc "obj/ladder_yadder.asm"

;-----

_87ABA3:
    ldx.b 0x01
    jmp (.ABA8,X)

.ABA8: d16[.ABAE, .ABF9, .ADCC]

.ABAE:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x06
    sta.b 0x12
    lda.b #0x20
    sta.b 0x18
    rep #0x20
    lda.b 0x0B
    and.w #0x00FF
    asl
    tax
    lda.w 0x86D179,X
    and.w #0x00FF
    clc
    adc.w 0x1E4D
    sta.b 0x05
    lda.w 0x86D17A,X
    and.w #0x00FF
    clc
    adc.w 0x1E50
    sta.b 0x08
    lda.w #0xA8E8
    sta.b 0x31
    sep #0x20
    ldy.b 0x0B
    lda 0x86D197,Y
    sta.b 0x10
    tax
    lda.l 0x7F8300,X
    ora 0x86D18D,Y
    ora.b #0x30
    sta.b 0x11
    lda.b #0x7A
    sta.b 0x16
.ABF9:
    lda.b 0x0B
    asl
    tax
    jmp (.AC00,X)

.AC00: d16[.AC14, .AC5D, .AC7F, .ACAB, .ACD5, .AD03, .AD2F, .AD79, .AD03, .AC5D]

.AC14:
    ldx.b 0x02
    jmp (.AC19,X)

.AC19: d16[.AC1F, .AC32, .AC52]

.AC1F:
    lda.w 0x1F3C
    bne .AC25

    rtl

.AC25:
    lda.b #0x02
    sta.b 0x02
.AC29:
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .ADD0

.AC32:
    lda.w 0x1F3C
    cmp.b #0x03
    bne .AC46

    lda.b #0x04
    sta.b 0x02
    lda.b #0x00
    jsl _848EEA.8F07
    jmp .ADD0

.AC46:
    lda.w 0x1F3D
    bne .AC29

.AC4B:
    jsl _848EEA
    jmp .ADD0

.AC52:
    lda.w 0x1F3C
    cmp.b #0x04
    bne .AC4B

    jml 0x828398

.AC5D:
    ldx.b 0x02
    bne .AC72

    lda.w 0x1F3C
    bne .AC67

    rtl

.AC67:
    inc.b 0x02
    lda.b #0x03
    jsl _848EEA.8F07
    jmp .ADD0

.AC72:
    lda.w 0x0060
    bne .AC7B

    jml 0x828398

.AC7B:
    jml 0x8280B4

.AC7F:
    ldx.b 0x02
    bne .AC96

    lda.w 0x1F3C
    cmp.b #0x04
    beq .AC8B

    rtl

.AC8B:
    inc.b 0x02
.AC8D:
    lda.b #0x05
    jsl _848EEA.8F07
    jmp .ADD0

.AC96:
    lda.w 0x0060
    bne .AC9F

    jml 0x828398

.AC9F:
    lda.w 0x1F3D
    bne .AC8D

    jsl _848EEA
    jmp .ADD0

.ACAB:
    ldx.b 0x02
    bne .ACC0

    lda.w 0x1F3C
    bne .ACB5

    rtl

.ACB5:
    inc.b 0x02
.ACB7:
    lda.b #0x05
    jsl _848EEA.8F07
    jmp .ADD0

.ACC0:
    lda.w 0x1F3C
    bne .ACC9

    jml 0x828398

.ACC9:
    lda.w 0x1F3D
    bne .ACB7

    jsl _848EEA
    jmp .ADD0

.ACD5:
    ldx.b 0x02
    bne .ACEC

    lda.w 0x1F3C
    cmp.b #0x03
    beq .ACE1

    rtl

.ACE1:
    inc.b 0x02
.ACE3:
    lda.b #0x05
    jsl _848EEA.8F07
    jmp .ADD0

.ACEC:
    lda.w 0x1F3C
    cmp.b #0x05
    bne .ACF7

    jml 0x828398

.ACF7:
    lda.w 0x1F3D
    bne .ACE3

    jsl _848EEA
    jmp .ADD0

.AD03:
    ldx.b 0x02
    bne .AD18

    lda.w 0x1F3C
    bne .AD0D

    rtl

.AD0D:
    inc.b 0x02
.AD0F:
    lda.b #0x05
    jsl _848EEA.8F07
    jmp .ADD0

.AD18:
    lda.w 0x1F3C
    cmp.b #0x02
    bne .AD23

    jml 0x828398

.AD23:
    lda.w 0x1F3D
    bne .AD0F

    jsl _848EEA
    jmp .ADD0

.AD2F:
    ldx.b 0x02
    bne .AD49

    lda.w 0x1F3C
    bne .AD39

    rtl

.AD39:
    inc.b 0x02
    lda.w 0x1F3D
    sta.b 0x33
    lda.b #0x07
    jsl _848EEA.8F07
    jmp .ADD0

.AD49:
    lda.w 0x1F3C
    cmp.b #0x02
    bne .AD54

    jml 0x828398

.AD54:
    lda.w 0x1F3D
    cmp.b 0x33
    beq .AD6D

    lda.b 0x33
    bne .AD67

    lda.b #0x06
    jsl _848EEA.8F07
    bra .AD6D

.AD67:
    lda.b #0x07
    jsl _848EEA.8F07
.AD6D:
    jsl _848EEA
    lda.w 0x1F3D
    sta.b 0x33
    jmp .ADD0

.AD79:
    ldx.b 0x02
    jmp (.AD7E,X)

.AD7E: d16[.AD86, .AD99, .ADA8, .ADBD]

.AD86:
    lda.w 0x1F3C
    bne .AD8C

    rtl

.AD8C:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x02
    jsl _848EEA.8F07
    jmp .ADD0

.AD99:
    lda.w 0x1F3C
    cmp.b #0x02
    bne .ADA4

    lda.b #0x04
    sta.b 0x02
.ADA4:
    jml 0x8280B4

.ADA8:
    lda.w 0x1F3C
    cmp.b #0x06
    bne .ADBC

    lda.b #0x06
    sta.b 0x02
    lda.b #0x02
    jsl _848EEA.8F07
    jmp .ADD0

.ADBC:
    rtl

.ADBD:
    lda.w 0x1F3C
    cmp.b #0x07
    bne .ADC8

    jml 0x828398

.ADC8:
    jml 0x8280B4

.ADCC:
    jml 0x828398

.ADD0:
    jsl 0x848FCA
    jml 0x8280B4

;-----

_87ADD8:
    ldx.b 0x01
    bne .ADFE

    jsl 0x82827D
    stz.b 0x12
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x30
    rep #0x20
    lda.w #0x0580
    sta.b 0x05
    lda.w #0x1180
    sta.b 0x08
    lda.w #0xD1A1
    sta.b 0x20
    rtl

.ADFE:
    jsl 0x82806E
    bcc .AE05

    rtl

.AE05:
    stz.b 0x2C
    jsr _87AF10
    ldx.b 0x02
    jsr (.AE1B,X)
    lda.b 0x2C
    beq .AE17

    jsl 0x82C70E
.AE17:
    jml 0x82808F

.AE1B: d16[.AE21, .AE62, .AEA2]

.AE21:
    lda.b 0x2C
    beq .AE61

    lda.b #0x02
    sta.b 0x02
    lda.b #0x00
    jsl 0x848000
    lda.b #0x5E
    jsl _80888B
    lda.b #0x3C
    sta.b 0x33
    lda.b #0x40
    sta.b 0x35
    sta.b 0x34
    rep #0x20
    lda.w #0x0080
    sta.w 0x1E70
    lda.w #0x00A0
    sta.w 0x1E72
    lda.w #0x0500
    sta.w 0x1E5E
    lda.w #0x0500
    sta.w 0x1E60
    lda.w #0x0A00
    sta.w 0x1E68
    sep #0x20
.AE61:
    rts

.AE62:
    ldx.b 0x03
    jmp (.AE67,X)

.AE67: d16[.AE6D, .AE76, .AE80]

.AE6D:
    dec.b 0x33
    bne .AE75

    lda.b #0x02
    sta.b 0x03
.AE75:
    rts

.AE76:
    lda.b #0x04
    sta.b 0x03
    lda.b #0x10
    jsl 0x84A333
.AE80:
    dec.b 0x34
    bne .AE8E

    lda.b 0x35
    sta.b 0x34
    lda.b #0x5F
    jsl _80888B
.AE8E:
    jsr _87AEDA
    lda.b 0x1C
    ora.b 0x1D
    bne .AE9D

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.AE9D:
    jsl update_pos_y
    rts

.AEA2:
    ldx.b 0x03
    bne .AED9

    inc.b 0x03
    lda.b #0x10
    ldx.b #0x01
    ldy.b #0x04
    jsl 0x84A33C
    lda.b #0x5D
    jsl _80888B
    rep #0x20
    lda.w #0x0ACF
    sta.b 0x08
    lda.w #0x0060
    sta.w 0x1E70
    lda.w #0x0080
    sta.w 0x1E72
    lda.w #0x0600
    sta.w 0x1E60
    lda.w #0x0A00
    sta.w 0x1E6E
    sep #0x20
.AED9:
    rts

;-----

_87AEDA:
    rep #0x20
    ldx.b #0x00
    ldy.b #0x10
    lda.b 0x08
    cmp.w #0x1040
    bcs .AF06

    inx
    inx
    ldy.b #0x10
    cmp.w #0x0F80
    bcs .AF06

    inx
    inx
    ldy.b #0x10
    cmp.w #0x0C80
    bcs .AF06

    inx
    inx
    ldy.b #0x10
    cmp.w #0x0ACF
    bcs .AF06

    inx
    inx
    ldy.b #0x10
.AF06:
    lda.w 0x00D1A5,X
    sta.b 0x1C
    sty.b 0x35
    sep #0x20
    rts

;-----

_87AF10:
    lda.w 0x0BCF
    and.b #0x7F
    beq .AF5C

    rep #0x20
    lda.w 0x0BAD
    cmp.w #0x0520
    bcc .AF5A

    cmp.w #0x05DF
    bcs .AF5A

    lda.b 0x08
    clc
    adc.w #0x002D
    cmp.w 0x0BB0
    bcc .AF5A

    lda.b 0x08
    clc
    adc.w #0xFFED
    sta.w 0x0000
    lda.w 0x0BB0
    clc
    adc.w #0x000D
    sec
    sbc.w 0x0000
    bcc .AF5A

    eor.w #0xFFFF
    inc
    clc
    adc.w 0x0BB0
    sta.w 0x0BB0
    lda.w #0x0004
    tsb.w 0x0BD4
    sta.b 0x2C
.AF5A:
    sep #0x20
.AF5C:
    rts

;-----

_87AF5D:
    ldx.b 0x01
    jsr (.AFA5,X)
    lda.b 0x27
    beq .AF99

    jsr _87B1FA
    jsl 0x849B43
    beq .AF8F

    lda.b 0x27
    and.b #0x7F
    bne .AF87

    jsl 0x84A4AB
    jsr _87B16F
    jsr _87B134
    jsl 0x828398
    sep #0x10
    bra .AFA4

.AF87:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .AF95

.AF8F:
    lda.b 0x37
    ora.b 0x11
    sta.b 0x11
.AF95:
    jsl 0x849B03
.AF99:
    jsl 0x8280B4
    jmp .AFA4

    jsl 0x828398
.AFA4:
    rtl

.AFA5: d16[.AFB1, .AFF3, .B032, .B042, .B0B9, .B0C9]

.AFB1:
    jsl 0x82827D
    lda.b 0x11
    ora.b #0x10
    sta.b 0x11
    and.b #0x0E
    sta.b 0x37
    lda.b 0x0B
    beq .AFC9

    lda.b 0x11
    ora.b #0x40
    sta.b 0x11
.AFC9:
    lda.b 0x0B
    cmp.b #0x02
    beq .AFD2

    jsr _87B0F7
.AFD2:
    lda.b #0x06
    sta.b 0x27
    lda.b #0x04
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    rep #0x20
    lda.w #0x003C
    sta.b 0x33
    lda.w #0xD1AF
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.AFF3:
    lda.b #0x3A
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x3E
    sta.b 0x0A
    tya
    cmp.b #0x04
    bpl .B02B

    rep #0x20
    dec.b 0x33
    bne .B02B

    lda.w #0x0080
    sta.b 0x33
    sep #0x20
    lda.b #0x04
    sta.b 0x01
    lda.b #0x10
    sta.b 0x35
    rep #0x20
    lda.w #0xD1B4
    sta.b 0x20
    sep #0x20
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .B031

.B02B:
    sep #0x20
    jsl _848EEA
.B031:
    rts

.B032:
    lda.b 0x0F
    bmi .B03D

    jsl _848EEA
    jmp .B041

.B03D:
    lda.b #0x06
    sta.b 0x01
.B041:
    rts

.B042:
    rep #0x20
    dec.b 0x33
    bne .B05E

.B048:
    rep #0x20
    lda.w #0x0080
    sta.b 0x33
    sep #0x20
    lda.b #0x08
    sta.b 0x01
    lda.b #0x02
    jsl _848EEA.8F07
    jmp .B0B6

.B05E:
    sep #0x20
    lda.b #0x3A
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x3E
    sta.b 0x0A
    lda.b 0x0B
    and.b #0x02
    cmp.b #0x02
    bne .B07C

    lda.b #0x0C
    sta.w 0x0000
    jmp .B081

.B07C:
    lda.b #0x04
    sta.w 0x0000
.B081:
    tya
    cmp.w 0x0000
    bpl .B048

    dec.b 0x35
    bne .B0B6

    lda.b #0x60
    sta.b 0x35
    sep #0x20
    jsl 0x828321
    bne .B0B6

    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0017
    sta.w 0x0008,X
    sep #0x20
    lda.b #0x3A
    sta.w 0x000A,X
    inc.w 0x0000,X
    lda.b 0x0B
    sta.w 0x000B,X
.B0B6:
    sep #0x30
    rts

.B0B9:
    lda.b 0x0F
    bmi .B0C4

    jsl _848EEA
    jmp .B0C8

.B0C4:
    lda.b #0x0A
    sta.b 0x01
.B0C8:
    rts

.B0C9:
    rep #0x20
    dec.b 0x33
    bne .B0F0

    lda.w #0x0040
    sta.b 0x33
    sep #0x20
    lda.b #0x02
    sta.b 0x01
    lda.b #0x10
    sta.b 0x35
    lda.b #0x00
    jsl _848EEA.8F07
    rep #0x20
    lda.w #0xD1AF
    sta.b 0x20
    sep #0x20
    jmp .B0F6

.B0F0:
    sep #0x20
    jsl _848EEA
.B0F6:
    rts

;-----

_87B0F7:
    rep #0x10
    jsl 0x8282D3
    bne .B131

    inc.w 0x0000,X
    lda.b #0x38
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x001C
    sta.w 0x0008,X
    sep #0x20
    lda.b 0x37
    ora.b 0x11
    and.b #0xEF
    sta.w 0x0011,X
    lda.b #0x00
    sta.w 0x0002,X
    lda.b #0x00
    sta.w 0x000B,X
    lda.b #0x00
    sta.w 0x000C,X
.B131:
    sep #0x10
    rts

;-----

_87B134:
    rep #0x10
    jsl 0x8282D3
    bne .B16C

    inc.w 0x0000,X
    lda.b #0x38
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0008
    sta.w 0x0008,X
    sep #0x20
    lda.b 0x37
    ora.b 0x11
    sta.w 0x0011,X
    lda.b #0x00
    sta.w 0x0002,X
    lda.b #0x01
    sta.w 0x000B,X
    lda.b #0x01
    sta.w 0x000C,X
.B16C:
    sep #0x10
    rts

;-----

_87B16F:
    rep #0x10
    ldy.w #0x0006
.B174:
    jsl 0x8282D3
    bne .B1AA

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    phy
    jsl get_rng
    rep #0x20
    and.w #0x0003
    tay
    sep #0x20
    lda 0x00D1B9,Y
    sta.w 0x000B,X
    ply
    stz.w 0x000C,X
    dey
    bne .B174

.B1AA:
    sep #0x10
    rts

    rep #0x10
    ldy.w #0x0003
.B1B2:
    jsl 0x8282D3
    bne .B1F7

    inc.w 0x0000,X
    lda.b #0x39
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000C,X
    lda.b #0x80
    sta.w 0x000B,X
    rep #0x20
    jsl get_rng
    and.w #0x000F
    sta.w 0x0000
    jsl get_rng
    and.w #0x000F
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
    dey
    bne .B1B2

.B1F7:
    sep #0x10
    rts

;-----

_87B1FA:
    lda.b 0x0F
    and.b #0x01
    sta.b 0x28
    beq .B20C

    rep #0x20
    lda.w #0xD1AF
    sta.b 0x20
    jmp .B213

.B20C:
    rep #0x20
    lda.w #0xD1B4
    sta.b 0x20
.B213:
    sep #0x20
    rts

;-----

    incsrc "obj/slide_cannon.asm"

;-----

_87B443:
    ldx.b 0x01
    jsr (.B45B,X)
    jsl 0x849B43
    jsl 0x8280B4
    jsl 0x82806E
    bcc .B45A

    jsl 0x828387
.B45A:
    rtl

.B45B: d16[.B461, .B481, .B4CA]

.B461:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    stz.b 0x28
    stz.b 0x36
    lda.b #0x04
    sta.b 0x12
    rep #0x20
    lda.w #0xD1CE
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.B481:
    lda.b 0x0F
    cmp.b #0x81
    bne .B48D

    lda.b #0x00
    jsl _848EEA.8F07
.B48D:
    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .B4C3

    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x70
    jsl _80888B.88B6
    lda.b #0x04
    sta.b 0x01
    sta.b 0x36
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0007
    sta.b 0x34
    lda.w #0x0800
    sta.b 0x1C
    sep #0x20
    lda.b 0x07
    sta.b 0x33
    lda.b #0x40
    sta.b 0x1E
.B4C3:
    sep #0x10
    jsl _848EEA
    rts

.B4CA:
    lda.b 0x0F
    cmp.b #0x81
    bne .B4D6

    lda.b #0x00
    jsl _848EEA.8F07
.B4D6:
    lda.b 0x36
    beq .B4DF

    stz.b 0x36
    jmp .B50A

.B4DF:
    rep #0x20
    lda.b 0x1C
    bpl .B4F2

    rep #0x10
    sep #0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcs .B501

.B4F2:
    sep #0x20
    lda.w 0x0BD3
    beq .B4FC

    jmp .B501

.B4FC:
    lda.w 0x0C06
    beq .B50A

.B501:
    sep #0x10
    lda.b #0x02
    sta.b 0x01
    jmp .B53D

.B50A:
    rep #0x20
    sec
    lda.b 0x1E
    and.w #0x00FF
    sbc.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sec
    lda.b 0x33
    sbc.b 0x1C
    sta.b 0x33
    sep #0x20
    stz.w 0x0000
    bit.b 0x1D
    bpl .B52D

    dec.w 0x0000
.B52D:
    lda.b 0x35
    sbc.w 0x0000
    sta.b 0x35
    rep #0x20
    lda.b 0x34
    sta.w 0x0BB0
    sep #0x20
.B53D:
    jsl _848EEA
    rts

;-----

_87B542:
    lda.b 0x0B
    bmi .B5A2

    ldx.b 0x01
    bne .B560

    lda.b #0x02
    sta.b 0x01
    sta.b 0x27
    sta.b 0x0E
    lda.b #0x03
    sta.b 0x28
    stz.b 0x30
    rep #0x20
    lda.w #0xD1D3
    sta.b 0x20
.B55F:
    rtl

.B560:
    jsl 0x82806E
    bcc .B56A

    jml 0x828387

.B56A:
    ldx.b 0x0B
    lda.w 0x1F3F,X
    bne .B59E

    jsl 0x849B43
    beq .B55F

    rep #0x20
    lda.w 0x86D1F6
    ldx.b 0x0B
    beq .B583

    lda.w 0x86D206
.B583:
    sta.w 0x002C
    lda.w #0x0230
    sta.w 0x002E
    sep #0x20
    lda.b 0x0B
    jsl 0x848011
    lda.b 0x0B
    jsr _87B69F
    ldx.b 0x0B
    inc.w 0x1F3F,X
.B59E:
    jml 0x828398

.B5A2:
    ldx.b 0x01
    bne .B5B0

    inc.b 0x01
    stz.b 0x38
    stz.b 0x39
    jsr _87B675
    rtl

.B5B0:
    lda.b 0x33
    ora.b 0x34
    beq .B5C3

    jsl 0x82806E
    bcc .B5C3

    jsr _87B7F4
    jml 0x828387

.B5C3:
    jsr _87B7CF
    ldx.b 0x02
    jsr (.B5D0,X)
    ldx.b 0x03
    jmp (.B5D6,X)

.B5D0: d16[.B5FE, .B5DC, .B5E9]

.B5D6: d16[.B674, .B5FF, .B62A]

.B5DC:
    lda.b #0x04
    sta.b 0x02
    stz.b 0x37
    lda.b #0x06
    sta.b 0x36
    jmp _87B77F

.B5E9:
    dec.b 0x36
    bne .B5FE

    lda.b #0x06
    sta.b 0x36
    jsr _87B6EA
    inc.b 0x37
    lda.b 0x37
    cmp.b #0x08
    bne .B5FE

    stz.b 0x02
.B5FE:
    rts

.B5FF:
    dec.b 0x10
    bne .B674

    lda.b #0x04
    sta.b 0x03
    lda.b #0x06
    sta.b 0x10
    stz.b 0x35
    rep #0x20
    lda.w #0x0670
    sta.w 0x002C
    lda.w #0x0230
    sta.w 0x002E
    sep #0x20
    lda.w 0x00D1DF
    jsl 0x848011
    lda.b #0x14
    jml 0x84A311

.B62A:
    dec.b 0x10
    bne .B674

    lda.b #0x06
    sta.b 0x10
    rep #0x20
    lda.b 0x35
    asl
    tax
    lda.w 0x00D1E8,X
    sta.w 0x002C
    lda.w #0x0230
    sta.w 0x002E
    ldx.b 0x35
    lda.w 0x00D1D7,X
    jsl 0x848011
    lda.b 0x35
    asl
    tax
    lda.w 0x00D1F8,X
    sta.w 0x002C
    lda.w #0x0230
    sta.w 0x002E
    ldx.b 0x35
    lda.w 0x00D1E0,X
    jsl 0x848011
    sep #0x20
    inc.b 0x35
    lda.b 0x35
    cmp.b #0x08
    bne .B674

    jml 0x828398

.B674:
    rtl

;-----

_87B675:
    jsl 0x828321
    bne .B69C

    inc.w 0x0000,X
    lda.b #0x29
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
    stx.b 0x33
    rep #0x21
    lda.b 0x08
    adc.w #0xFFFA
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    stz.w 0x000C,X
.B69C:
    sep #0x30
    rts

;-----

_87B69F:
    sta.w 0x0000
    stz.w 0x0001
    jsl 0x8282D3
    bne .B6E7

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x13
    sta.w 0x000B,X
    lda.b #0x30
    ldy.w 0x0000
    beq .B6C1

    lda.b #0x70
.B6C1:
    sta.w 0x0011,X
    rep #0x21
    jsr _87B7C4
    lda.w 0x00D1F6
    ldy.w 0x0000
    beq .B6D4

    lda.w 0x00D206
.B6D4:
    adc.w #0x0008
    sta.w 0x0005,X
    sta.b 0x05
    lda.w #0x025C
    sta.w 0x0008,X
    sta.b 0x08
    jsr _87B7B2
.B6E7:
    sep #0x30
.B6E9:
    rts

;-----

_87B6EA:
    lda.b 0x37
    cmp.b #0x07
    bne .B70A

    lda.w 0x1F3F
    bne .B6FD

    inc.w 0x1F3F
    lda.b #0x00
    jsr _87B69F
.B6FD:
    lda.w 0x1F40
    bne _87B69F.B6E9

    inc.w 0x1F40
    lda.b #0x01
    jmp _87B69F

.B70A:
    rep #0x10
    ldy.w #0x0001
.B70F:
    jsl 0x8282D3
    bne .B751

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x12
    sta.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    rep #0x20
    jsr _87B7C4
    jsr _87B75A
    lda.w #0x0260
    sta.w 0x0008,X
    sta.b 0x08
    cpy.b 0x38
    bne .B742

    lda.w #0x001B
    jsl _80888B
.B742:
    lda.w 0x0000
    sta.b 0x05
    lda.w 0x0002
    sta.b 0x08
    sep #0x20
    dey
    bpl .B70F

.B751:
    sep #0x10
    lda.b 0x38
    eor.b #0x01
    sta.b 0x38
    rts

;-----

_87B75A:
    phy
    tya
    bne .B76A

    lda.b 0x37
    and.w #0x00FF
    asl
    tay
    lda 0x00D1E8,Y
    bra .B774

.B76A:
    lda.b 0x37
    and.w #0x00FF
    asl
    tay
    lda 0x00D1F8,Y
.B774:
    clc
    adc.w #0x0010
    sta.w 0x0005,X
    sta.b 0x05
    ply
    rts

;-----

_87B77F:
    jsl 0x8282D3
    bne .B7AF

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x12
    sta.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    rep #0x20
    jsr _87B7C4
    lda.w #0x0680
    sta.w 0x0005,X
    sta.b 0x05
    lda.w #0x0260
    sta.w 0x0008,X
    sta.b 0x08
    jsr _87B7B2
.B7AF:
    sep #0x30
    rts

;-----

_87B7B2:
    lda.w #0x001B
    jsl _80888B
    lda.w 0x0000
    sta.b 0x05
    lda.w 0x0002
    sta.b 0x08
    rts

;-----

_87B7C4:
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    rts

;-----

_87B7CF:
    rep #0x10
    ldx.b 0x33
    beq .B7F1

    lda.w 0x0027,X
    cmp.b #0x80
    beq .B7E3

    lda.w 0x000A,X
    cmp.b #0x29
    beq .B7F1

.B7E3:
    lda.b #0x02
    sta.b 0x02
    sta.b 0x03
    lda.b #0x08
    sta.b 0x10
    stz.b 0x33
    stz.b 0x34
.B7F1:
    sep #0x10
    rts

;-----

_87B7F4:
    rep #0x30
    ldx.b 0x33
    beq .B805

    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x000E,X
    stz.b 0x33
.B805:
    sep #0x30
    rts

;-----

_87B808:
    ldx.b 0x01
    jsr (.B81C,X)
    jsl 0x8280B4
    jsl 0x82806E
    bcc .B81B

    jml 0x828387

.B81B:
    rtl

.B81C: d16[.B824, .B873, .B89D, .B8CF]

.B824:
    lda.b #0x73
    sta.b 0x16
    ldx.b #0x67
    lda.l 0x7F8200,X
    sta.b 0x18
    lda.l 0x7F8300,X
    sta.b 0x11
    lda.b #0x02
    sta.b 0x01
    lda.b #0x06
    sta.b 0x12
    inc.b 0x30
    stz.b 0x1F
    stz.b 0x1A
    stz.b 0x1B
    lda.b 0x0B
    and.b #0x0F
    lsr
    tax
    stx.b 0x1E
    stx.b 0x1D
    cpx.b #0x04
    bne .B85A

    lda.b #0x01
    sta.b 0x1F
    sta.b 0x1D
.B85A:
    lda.w 0x00D208,X
    jsl _848EEA.8F07
    lda.b 0x0B
    and.b #0x10
    beq .B86E

    lda.b #0x14
    sta.b 0x03
    jmp .B872

.B86E:
    lda.b #0x01
    sta.b 0x03
.B872:
    rts

.B873:
    dec.b 0x03
    bne .B898

    ldx.b 0x1E
    lda.w 0x00D20D,X
    jsl _848EEA.8F07
    lda.b #0x04
    sta.b 0x01
    lda.b 0x1A
    bne .B88F

    lda.b #0x20
    sta.b 0x03
    jmp .B89C

.B88F:
    lda.b #0x3C
    sta.b 0x03
    stz.b 0x1A
    jmp .B89C

.B898:
    jsl _848EEA
.B89C:
    rts

.B89D:
    dec.b 0x03
    bne .B8CA

    lda.b #0x32
    sta.b 0x03
    lda.b #0x06
    sta.b 0x01
    ldx.b 0x1E
    cpx.b #0x02
    bne .B8B3

    lda.b #0x01
    sta.b 0x02
.B8B3:
    lda.b 0x1F
    beq .B8BD

    lda.b 0x1D
    eor.b #0x01
    sta.b 0x1D
.B8BD:
    lda.w 0x00D208,X
    jsl _848EEA.8F07
    jsr _87B8ED
    jmp .B8CE

.B8CA:
    jsl _848EEA
.B8CE:
    rts

.B8CF:
    dec.b 0x03
    bne .B8E8

    lda.b #0x02
    sta.b 0x01
    lda.b 0x0B
    and.b #0x10
    beq .B8E4

    lda.b #0x14
    sta.b 0x03
    jmp .B8E8

.B8E4:
    lda.b #0x01
    sta.b 0x03
.B8E8:
    jsl _848EEA
    rts

;-----

_87B8ED:
    rep #0x10
    jsl 0x828321
    bne .B919

    lda.b #0x43
    sta.w 0x000A,X
    inc.w 0x0000,X
    lda.b 0x0B
    sta.w 0x000B,X
    lda.b 0x1D
    sta.w 0x0033,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x0035,X
    sep #0x20
.B919:
    sep #0x10
    rts

;-----

_87B91C:
    ldx.b 0x01
    jsr (.B930,X)
    lda.b 0x3A
    bne .B92F

    jsl 0x82806E
    bcc .B92F

    jsl 0x828398
.B92F:
    rtl

.B930: d16[.B936, .B982, .BA02]

.B936:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    inc.b 0x30
    stz.b 0x3A
    lda.b #0x06
    sta.b 0x12
    rep #0x10
    lda.b 0x33
    beq .B95D

    cmp.b #0x01
    beq .B965

    ldx.w #0xD212
    stx.b 0x20
    ldx.w #0xD217
    stx.b 0x3B
    jmp .B96A

.B95D:
    ldx.w #0xD212
    stx.b 0x20
    jmp .B96A

.B965:
    ldx.w #0xD217
    stx.b 0x20
.B96A:
    sep #0x10
    ldx.b 0x33
    lda.w 0x00D221,X
    jsl _848EEA.8F07
    lda.b #0x32
    sta.b 0x34
    lda.b #0x04
    sta.b 0x01
    lda.b #0x08
    sta.b 0x3D
    rts

.B982:
    dec.b 0x34
    beq .B9F9

    rep #0x10
    lda.b 0x33
    cmp.b #0x02
    bne .B9A3

    ldx.b 0x3B
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .B99E

    jmp .B9AC

.B99E:
    ldx.w #0xD212
    stx.b 0x20
.B9A3:
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .B9EC

.B9AC:
    ldx.b 0x35
    lda.w 0x000A,X
    cmp.b #0x42
    bne .B9E7

    lda.b #0x02
    sta.w 0x0001,X
    lda.b #0x01
    sta.w 0x0003,X
    sta.w 0x001A,X
    lda.b #0x01
    sta.w 0x001B,X
    lda.b 0x0B
    and.b #0x20
    beq .B9E4

    lda.b #0x01
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x43
    sta.b 0x0A
    tya
    cmp.b #0x02
    bpl .B9E7

    jsr _87BA17
    jmp .B9E7

.B9E4:
    jsr _87BA44
.B9E7:
    sep #0x10
    jmp .B9F9

.B9EC:
    sep #0x10
    jsl _848EEA
    jsl 0x8280B4
    jmp .BA01

.B9F9:
    lda.b #0x01
    sta.b 0x3A
    jsl 0x828398
.BA01:
    rts

.BA02:
    dec.b 0x3D
    bne .BA0E

    lda.b #0x02
    sta.b 0x01
    lda.b #0x08
    sta.b 0x3D
.BA0E:
    jsl _848EEA
    jsl 0x8280B4
    rts

;-----

_87BA17:
    jsl 0x828321
    bne .BA43

    lda.b #0x01
    sta.w 0x000A,X
    inc.w 0x0000,X
    rep #0x20
    lda.w #0x0030
    sta.w 0x0000
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0040
    sta.w 0x0008,X
    sep #0x20
    stx.b 0x38
.BA43:
    rts

;-----

_87BA44:
    rep #0x20
    tdc
    sta.w 0x0002
    lda.w #0x0E68
.BA4D:
    tcd
    sep #0x20
    lda.b 0x00
    beq .BA5E

    lda.b 0x0A
    cmp.b #0x44
    bne .BA5E

    lda.b #0x01
    sta.b 0x36
.BA5E:
    rep #0x21
    tdc
    adc.w #0x0040
    cmp.w #0x1228
    bcc .BA4D

    rep #0x20
    lda.w 0x0002
    tcd
    sep #0x20
    rts

;-----

    incsrc "obj/ray_trap.asm"

;-----

_87BBBE:
    ldx.b 0x01
    jsr (.BC0D,X)
    lda.w 0x0BCF
    sta.b 0x34
    jsl 0x849B03
    lda.w 0x0BCF
    cmp.b 0x34
    bne .BC04

    jsl 0x82808F
    lda.b 0x0B
    and.b #0x0C
    bne .BBED

    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x35
    bcs .BBFA

    eor.w #0xFFFF
    inc
    jmp .BBFA

.BBED:
    rep #0x20
    lda.b 0x08
    sec
    sbc.b 0x37
    bcs .BBFA

    eor.w #0xFFFF
    inc
.BBFA:
    cmp.w #0x0140
    bcs .BC04

    sep #0x20
    jmp .BC0A

.BC04:
    sep #0x20
    jsl 0x828398
.BC0A:
    sep #0x20
    rtl

.BC0D: d16[.BC13, .BC68, .BC75]

.BC13:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    sta.b 0x26
    sta.b 0x30
    lda.b #0x04
    sta.b 0x12
    rep #0x20
    lda.w #0xD232
    sta.b 0x20
    lda.b 0x0B
    and.w #0x000F
    cmp.w #0x0001
    beq .BC46

    cmp.w #0x0002
    beq .BC4E

    cmp.w #0x0004
    beq .BC56

    lda.w #0x0300
    sta.b 0x1C
    jmp .BC5B

.BC46:
    lda.w #0x0300
    sta.b 0x1A
    jmp .BC5B

.BC4E:
    lda.w #0xFD00
    sta.b 0x1A
    jmp .BC5B

.BC56:
    lda.w #0xFD00
    sta.b 0x1C
.BC5B:
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x40
    sta.b 0x33
    rts

.BC68:
    dec.b 0x33
    bne .BC70

    lda.b #0x04
    sta.b 0x01
.BC70:
    jsl _848EEA
    rts

.BC75:
    lda.b 0x0B
    and.b #0x0C
    bne .BC82

    jsl update_pos_x
    jmp .BC86

.BC82:
    jsl update_pos_y
.BC86:
    jsl _848EEA
    rts

;-----

_87BC8B:
    ldx.b 0x01
    bne .BCB5

    inc.b 0x01
    lda.b #0x20
    sta.b 0x27
    lda.b #0x03
    sta.b 0x28
    stz.b 0x30
    rep #0x21
    lda.b 0x0B
    and.w #0x00FF
    asl
    asl
    tax
    adc.w #0xD237
    sta.b 0x20
    lda.w 0x86D26D,X
    sta.b 0x05
    lda.w 0x86D26F,X
    sta.b 0x08
    rtl

.BCB5:
    lda.b #0x01
    sta.b 0x0E
    jsl 0x849B43
    beq .BCC5

    bpl .BCC5

    lda.b #0x02
    sta.b 0x02
.BCC5:
    stz.b 0x0E
    ldx.b 0x02
    jmp (.BCCC,X)

.BCCC: d16[.BD36, .BCD2, .BCDD]

.BCD2:
    lda.b #0x04
    sta.b 0x02
    lda.b #0x06
    sta.b 0x10
    stz.b 0x33
    rtl

.BCDD:
    dec.b 0x10
    bne .BD36

    lda.b #0x06
    sta.b 0x10
    ldx.b #0x05
    ldy.b #0x02
    lda.b #0x06
    jsl 0x84A31A
    rep #0x20
    lda.b 0x0B
    and.w #0x00FF
    asl
    asl
    tax
    lda.b 0x33
    and.w #0x00FF
    asl
    asl
    asl
    asl
    clc
    adc.w 0x00D24F,X
    sta.w 0x002C
    lda.w 0x00D251,X
    sta.w 0x002E
    jsr _87BD37
    sep #0x20
    lda.b #0x09
    ldx.b 0x0B
    cpx.b #0x05
    beq .BD23

    lda.b 0x33
    and.b #0x01
    clc
    adc.b #0x07
.BD23:
    jsl 0x848011
    inc.b 0x33
    ldx.b 0x0B
    lda.w 0x00D267,X
    cmp.b 0x33
    bne .BD36

    jml 0x828398

.BD36:
    rtl

;-----

_87BD37:
    lda.w #0x0508
    sta.w 0x0004
    ldy.b #0x01
.BD3F:
    jsl get_rng
    and.w #0x000F
    clc
    adc.w 0x002C
    sta.w 0x0000
    sta.b 0x05
    jsl get_rng
    and.w #0x003F
    clc
    adc.w 0x002E
    sta.w 0x0002
    sta.b 0x08
    lda.w #0x0023
    jsl _80888B
    phy
    jsl 0x84A462
    ply
    dey
    bpl .BD3F

    rts

;-----

_87BD70:
    ldx.b 0x01
    jsr (.BDAB,X)
    bit.w 0x1F96
    bvs .BDA6

    jsl 0x849B03
    rep #0x20
    lda.b 0x08
    sta.b 0x36
    lda.b 0x38
    sta.b 0x08
    sep #0x20
    jsl 0x8280B4
    jsl 0x82806E
    bcc .BD9B

    jsl 0x828387
    jmp .BDAA

.BD9B:
    rep #0x20
    lda.b 0x36
    sta.b 0x08
    sep #0x20
    jmp .BDAA

.BDA6:
    jsl 0x828398
.BDAA:
    rtl

.BDAB: d16[.BDB5, .BDF0, .BE37, .BECE, .BEF3]

.BDB5:
    jsl 0x82827D
    lda.b #0x0C
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x01
    sta.b 0x30
    lda.b #0x05
    sta.b 0x28
    stz.b 0x3B
    stz.b 0x3C
    rep #0x20
    lda.w #0xD285
    sta.b 0x20
    lda.b 0x08
    sta.b 0x38
    lda.w #0x0423
    sta.b 0x08
    sta.b 0x34
    stz.b 0x3D
    sep #0x20
    lda.b #0xDB
    sta.b 0x2A
    lda.b #0x30
    sta.b 0x33
    rts

.BDF0:
    dec.b 0x33
    bne .BE14

    lda.b #0x04
    sta.b 0x01
    lda.b #0x3F
    jsl _80888B
    rep #0x20
    lda.w #0x0100
    sta.b 0x1C
    sep #0x20
    lda.b #0x80
    sta.b 0x1E
    lda.b #0x00
    jsl _848EEA.8F07
    jmp .BE36

.BE14:
    lda.b 0x33
    cmp.b #0x12
    beq .BE29

    cmp.b #0x10
    beq .BE29

    cmp.b #0x07
    beq .BE29

    cmp.b #0x13
    beq .BE33

    jmp .BE36

.BE29:
    lda.b #0x02
    sta.b 0x3A
    jsr _87BF17
    jmp .BE36

.BE33:
    jsr _87C042
.BE36:
    rts

.BE37:
    rep #0x20
    lda.b 0x3B
    and.w #0x00FF
    beq .BE4A

    dec.b 0x3B
    beq .BE47

    jmp .BEC7

.BE47:
    jmp .BE81

.BE4A:
    lda.b 0x1C
    cmp.w #0x0200
    beq .BE5A

    sep #0x20
    jsl update_pos_xy.pos_ay
    jmp .BE60

.BE5A:
    sep #0x20
    jsl 0x82820A
.BE60:
    stz.b 0x29
    jsl _8490A0
    cmp.b #0x3F
    beq .BEB0

    cmp.b #0x00
    beq .BEB0

    cmp.b #0x3E
    beq .BEB0

    cmp.b #0x33
    beq .BEB0

    lda.b 0x0B
    bne .BE81

    lda.b #0x02
    sta.b 0x3B
    jmp .BEC7

.BE81:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0020
    sta.w 0x002C
    lda.b 0x08
    sec
    sbc.w #0x0025
    sta.w 0x002E
    sep #0x20
    lda.b 0x0B
    jsl 0x848011
    lda.b 0x0B
    bne .BEAB

    lda.b #0x20
    ldx.b #0x06
    ldy.b #0x01
    jsl 0x84A31A
.BEAB:
    inc.b 0x0B
    jsr _87BFE5
.BEB0:
    rep #0x20
    lda.b 0x34
    sec
    sbc.b 0x08
    cmp.w #0x0080
    bcc .BEC7

    lda.w #0xFE00
    sta.b 0x1C
    sep #0x20
    lda.b #0x06
    sta.b 0x01
.BEC7:
    sep #0x20
    jsl _848EEA
    rts

.BECE:
    jsl update_pos_y
    jsl _848EEA
    rep #0x20
    lda.b 0x34
    sec
    sbc.b 0x08
    cmp.w #0x0080
    bcc .BEF0

    lda.b 0x34
    sta.b 0x08
    sep #0x20
    lda.b #0x02
    sta.b 0x01
    lda.b #0x5A
    sta.b 0x33
.BEF0:
    sep #0x20
    rts

.BEF3:
    rep #0x20
    sep #0x20
    lda.b #0x01
    sta.b 0x28
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    jmp .BF16

    sep #0x20
    lda.b 0x03
    sta.b 0x01
    lda.b #0x05
    sta.b 0x28
    stz.b 0x3C
    lda.b #0x0C
    sta.b 0x27
.BF16:
    rts

;-----

_87BF17:
    rep #0x10
    jsl 0x8282D3
    beq .BF22

    jmp .BFD5

.BF22:
    inc.w 0x0000,X
    lda.b #0x35
    sta.w 0x000A,X
    stz.w 0x001F,X
    lda.b #0x20
    sta.w 0x001E,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x3A
    cmp.b #0x01
    beq .BF52

    lda.b 0x11
    sta.w 0x0011,X
    rep #0x20
    lda.w #0x0000
    sta.w 0x0000
    sta.w 0x0002
    sep #0x20
    jmp .BF69

.BF52:
    lda.b 0x11
    ora.b #0x40
    sta.w 0x0011,X
    rep #0x20
    lda.w #0xFFF4
    sta.w 0x0000
    lda.w #0xFFF0
    sta.w 0x0002
    sep #0x20
.BF69:
    lda.b 0x16
    sta.w 0x0016,X
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0002
    sta.w 0x0005,X
    lda.w #0x03D9
    sec
    sbc.w 0x0000
    sta.w 0x0008,X
    lda.b 0x33
    and.w #0x00FF
    cmp.w #0x0012
    bne .BF93

    stz.w 0x001A,X
    jmp .BFAC

.BF93:
    lda.b 0x3A
    and.w #0x00FF
    cmp.w #0x0002
    bne .BFA6

    lda.w #0x0100
    sta.w 0x001A,X
    jmp .BFAC

.BFA6:
    lda.w #0xFF00
    sta.w 0x001A,X
.BFAC:
    lda.w #0x0200
    sta.w 0x001C,X
    sep #0x20
    lda.b 0x33
    cmp.b #0x12
    bne .BFC2

    lda.b #0x06
    sta.w 0x000B,X
    jmp .BFD5

.BFC2:
    lda.b 0x33
    cmp.b #0x10
    bne .BFD0

    lda.b #0x04
    sta.w 0x000B,X
    jmp .BFD5

.BFD0:
    lda.b #0x07
    sta.w 0x000B,X
.BFD5:
    ldx.w #0x0005
    stx.w 0x0000
    dec.b 0x3A
    beq .BFE2

    jmp _87BF17

.BFE2:
    sep #0x10
    rts

;-----

_87BFE5:
    rep #0x10
    ldy.w #0x0004
.BFEA:
    jsl 0x8282D3
    bne .C03F

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda 0x00D28A,Y
    sta.w 0x000B,X
    stz.w 0x001F,X
    lda.b #0x40
    sta.w 0x001E,X
    rep #0x20
    lda.w #0x0C80
    sta.w 0x000C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0025
    sta.w 0x0008,X
    phy
    jsl get_rng
    and.w #0x0006
    tay
    lda 0x00D28F,Y
    sta.w 0x001A,X
    jsl get_rng
    and.w #0x0006
    tay
    lda 0x00D297,Y
    sta.w 0x001C,X
    ply
    sep #0x20
    dey
    bpl .BFEA

.C03F:
    sep #0x10
    rts

;-----

_87C042:
    rep #0x10
    jsl 0x8282D3
    bne .C077

    inc.w 0x0000,X
    lda.b #0x36
    sta.w 0x000A,X
    lda.b #0x00
    sta.w 0x000B,X
    lda.b #0x00
    sta.w 0x0002,X
    lda.b 0x11
    ora.b #0x10
    sta.w 0x0011,X
    lda.b #0x8C
    sta.w 0x0003,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.w #0x03DE
    sta.w 0x0008,X
    stx.b 0x3D
.C077:
    sep #0x30
    rts

;-----

_87C07A:
    ldx.b 0x01
    jmp (.C07F,X)

.C07F: d16[.C085, .C0AE, .C211]

.C085:
    jsl 0x82827D
    lda.b #0x04
    sta.b 0x12
    lda.b #0x40
    tsb.b 0x11
    lda.b #0x02
    jsl _848EEA.8F07
    rep #0x20
    lda.w #0x0100
    sta.b 0x1C
    lda.w #0x1840
    sta.b 0x05
    lda.w #0x0160
    sta.b 0x08
    lda.w #0xD29F
    sta.b 0x20
.C0AD:
    rtl

.C0AE:
    stz.b 0x2C
    jsl 0x82D7D0
    ldx.b 0x02
    jsr (.C0D0,X)
    lda.b 0x2C
    beq .C0C1

    jsl 0x82C70E
.C0C1:
    rep #0x20
    lda.b 0x08
    cmp.w #0x0120
    sep #0x20
    bcc .C0AD

    jml 0x82808F

.C0D0: d16[.C0D6, .C103, .C171]

.C0D6:
    lda.b 0x2C
    beq .C100

    lda.b #0x02
    sta.b 0x02
    sta.w 0x0C0C
    lda.b #0x02
    sta.w 0x1F81
    jsl 0x849FF2
    jsr _87C35F
    jsl 0x84A28B
    jsl 0x84A2A7
    inc.w 0x1F41
    rep #0x20
    lda.b 0x08
    sta.b 0x33
    sep #0x20
.C100:
    jmp .C242

.C103:
    ldx.b 0x03
    jmp (.C108,X)

.C108: d16[.C10E, .C11D, .C157]

.C10E:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x10
    trb.w 0x0BB9
    lda.b #0x10
    jsl 0x84A333
.C11D:
    jsl _848EEA
    ldx.b 0x0F
    bpl .C143

    lda.b #0x04
    sta.b 0x03
    rep #0x20
    lda.w #0xD2A3
    sta.b 0x20
    lda.w #0x1760
    sta.w 0x1E5E
    lda.w #0x1760
    sta.w 0x1E60
    sep #0x20
    stz.b 0x35
    jmp .C215

.C143:
    rep #0x21
    lda.w 0x00D2A7,X
    and.w #0x00FF
    eor.w #0xFFFF
    inc
    adc.b 0x33
    sta.w 0x0BB0
    sep #0x20
    rts

.C157:
    dec.b 0x33
    bne .C16C

    jsr .C215
    bpl .C16C

    lda.b #0x40
    sta.w 0x0C11
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.C16C:
    jsl 0x82820A
    rts

.C171:
    ldx.b 0x03
    jmp (.C176,X)

.C176: d16[.C180, .C1A3, .C1B2, .C1E5, .C1F7]

.C180:
    lda.b #0x02
    sta.b 0x03
    ldx.b #0x05
    ldy.b #0x02
    lda.b #0x78
    jsl 0x84A31A
    rep #0x20
    lda.w #0x002F
    sta.w 0x1E68
    lda.w #0x002F
    sta.w 0x1E6E
    sep #0x20
    lda.b #0x3C
    sta.b 0x33
    rts

.C1A3:
    dec.b 0x33
    bne .C1B1

    inc.b 0x33
    lda.b #0x04
    sta.b 0x03
    lda.b #0x0A
    sta.b 0x34
.C1B1:
    rts

.C1B2:
    dec.b 0x33
    bne .C1E4

    lda.b #0x06
    sta.b 0x33
    lda.b #0x21
    jsl _80888B
    jsr _87C2AA
    jsr _87C269
    lda.b 0x34
    jsl 0x848000
    inc.b 0x34
    lda.b 0x34
    cmp.b #0x15
    bne .C1E4

    lda.b #0x10
    tsb.w 0x0BB9
    stz.w 0x0C0C
    lda.b #0x06
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x33
.C1E4:
    rts

.C1E5:
    dec.b 0x33
    bne .C1F6

    lda.b #0x08
    sta.b 0x03
    lda.b #0x07
    sta.w 0x1F08
    jsl _80B085
.C1F6:
    rts

.C1F7:
    lda.w 0x0040
    bne .C210

    lda.b #0x04
    sta.b 0x01
    jsl 0x828321
    bne .C20E

    inc.w 0x0000,X
    lda.b #0x52
    sta.w 0x000A,X
.C20E:
    sep #0x10
.C210:
    rts

.C211:
    jml 0x828398

.C215:
    rep #0x20
    ldx.b 0x35
    lda.w 0x00D2AB,X
    bmi .C23F

    cmp.w #0x0001
    bne .C22A

    lda.w #0x1840
    sec
    sbc.w 0x0BAD
.C22A:
    sta.b 0x33
    lda.w 0x00D2AD,X
    sta.b 0x1A
    lda.w 0x00D2AF,X
    sta.b 0x1C
    sep #0x20
    lda.b 0x35
    clc
    adc.b #0x06
    sta.b 0x35
.C23F:
    sep #0x20
    rts

.C242:
    rep #0x20
    ldx.b #0x20
    lda.w 0x0BAD
    cmp.w #0x1500
    bcc .C257

    ldx.b #0x30
    cmp.w #0x1920
    bcc .C257

    ldx.b #0x20
.C257:
    sep #0x20
    lda.w 0x0BB9
    and.b #0xCF
    sta.w 0x0000
    txa
    ora.w 0x0000
    sta.w 0x0BB9
    rts

;-----

_87C269:
    rep #0x10
    lda.b #0x04
    sta.l 0x7F830A
    ldy.w #0x0003
.C274:
    jsl 0x8282D3
    bne .C2A7

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x1C
    sta.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    phy
    rep #0x20
    lda.w #0x007F
    sta.w 0x0000
    stz.w 0x0002
    lda.w #0x000F
    sta.w 0x0004
    jsr _87C320
    sep #0x20
    ply
    dey
    bpl .C274

.C2A7:
    sep #0x10
    rts

;-----

_87C2AA:
    rep #0x10
    ldy.w #0x0001
.C2AF:
    jsl 0x8282D3
    bne .C31D

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    jsl get_rng
    and.b #0x07
    clc
    adc.b #0x3C
    ora.b #0x80
    sta.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    phy
    rep #0x20
    lda.w #0x007F
    sta.w 0x0000
    stz.w 0x0002
    lda.w #0x000F
    sta.w 0x0004
    jsr _87C320
    sep #0x20
    ply
    dey
    bpl .C2AF

    ldy.w #0x0001
.C2EE:
    jsl 0x8282D3
    bne .C31D

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    asl
    sta.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    phy
    rep #0x20
    stz.w 0x0000
    lda.w #0x0040
    sta.w 0x0002
    stz.w 0x0004
    jsr _87C320
    sep #0x20
    ply
    dey
    bpl .C2EE

.C31D:
    sep #0x10
    rts

;-----

_87C320:
    jsl get_rng
    and.w 0x0000
    clc
    adc.w #0x0070
    clc
    adc.w 0x0002
    sta.w 0x0008,X
    jsl get_rng
    and.w 0x0004
    sta.w 0x0000
    tya
    and.w #0x0001
    asl
    sta.w 0x0002
    lda.b 0x34
    and.w #0x00FF
    sec
    sbc.w #0x000A
    asl
    asl
    clc
    adc.w 0x0002
    tay
    lda 0x00D2BF,Y
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    rts

;-----

_87C35F:
    rep #0x30
    ldx.w #0x0E68
.C364:
    tdc
    sta.w 0x0000
    cpx.w 0x0000
    beq .C379

    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x0027,X
    stz.w 0x000E,X
.C379:
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1228
    bcc .C364

    sep #0x30
    rts

;-----

    incsrc "obj/sky_claw.asm"

;-----

_87C70A:
    ldx.b 0x01
    bne .C747

    jsl 0x82827D
    lda.w 0x0BB9
    and.b #0x30
    sta.w 0x0000
    lda.b 0x11
    and.b #0x01
    ora.w 0x0000
    ora.b #0x04
    sta.b 0x11
    stz.b 0x12
    lda.b #0x03
    sta.b 0x26
    sta.b 0x27
    lda.b #0x00
    jsl _848EEA.8F07
    jsl 0x82806E
    bcs .C73F

    lda.b #0x23
    jsl _80888B
.C73F:
    rep #0x20
    lda.w #0xD2F8
    sta.b 0x20
    rtl

.C747:
    lda.b 0x0F
    bpl .C74F

    jml 0x828398

.C74F:
    lsr
    bcc .C756

    jsl 0x849B03
.C756:
    jsl _848EEA
    jml 0x8280B4

;-----

_87C75E:
    ldx.b 0x01
    jmp (.C763,X)

.C763: d16[.C769, .C78B, .C8DD]

.C769:
    jsl 0x82827D
    lda.b #0x06
    sta.b 0x12
    lda.b #0x03
    sta.b 0x26
    sta.b 0x27
    stz.b 0x28
    lda.b 0x0B
    cmp.b #0x03
    bcc .C783

    lda.b #0x02
    sta.b 0x02
.C783:
    rep #0x20
    lda.w #0xD2FC
    sta.b 0x20
    rtl

.C78B:
    jsr _87C94C
    ldx.b 0x02
    jsr (.C79F,X)
    jsl 0x849B43
    jsl 0x849B03
    jml 0x8280B4

.C79F: d16[.C7A9, .C817, .C856, .C888, .C8B6]

.C7A9:
    ldx.b 0x03
    bne .C7E1

    inc.b 0x03
    rep #0x20
    jsl get_rng
    and.w #0x00FF
    sta.w 0x0000
    lda.b 0x0B
    and.w #0x00FF
    asl
    tax
    lda.w 0x00D308,X
    clc
    adc.w 0x0000
    sta.b 0x1A
    lda.w #0x0700
    sta.b 0x1C
    lda.w #0x0040
    sta.b 0x1E
    sep #0x20
    lda.b #0x05
    sta.b 0x33
    lda.b #0x01
    jsl _848EEA.8F07
.C7E1:
    lda.b 0x33
    beq .C7F0

    dec.b 0x33
    bne .C7F0

    jsr _87C8EF
    lda.b #0x30
    tsb.b 0x11
.C7F0:
    rep #0x20
    lda.b 0x08
    cmp.w #0x01A0
    sep #0x20
    bcc .C80E

    jsr _87C91F
    ldx.b #0x02
    jsl get_rng
    and.b #0x03
    bne .C80A

    ldx.b #0x08
.C80A:
    stx.b 0x02
    stz.b 0x03
.C80E:
    jsl update_pos_xy.neg_ay_ax
    jsl _848EEA
    rts

.C817:
    ldx.b 0x03
    bne .C843

    inc.b 0x03
    jsl get_rng
    and.b #0x03
    tax
    lda.w 0x00D304,X
    sta.b 0x33
    lda.b #0x30
    tsb.b 0x11
    rep #0x20
    jsl get_rng
    and.w #0x01FF
    sta.b 0x34
    sep #0x20
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .C8E6

.C843:
    dec.b 0x33
    bne .C84D

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.C84D:
    jsl update_pos_y
    jsl _848EEA
    rts

.C856:
    ldx.b 0x03
    bne .C870

    inc.b 0x03
    jsl get_rng
    and.b #0x1F
    clc
    adc.b #0x30
    sta.b 0x33
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .C8E6

.C870:
    dec.b 0x33
    bne .C87A

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
.C87A:
    jsl update_pos_y
    jsl _848EEA
    jsr _87C982
    jmp _87C977

.C888:
    ldx.b 0x03
    bne .C8A1

    inc.b 0x03
    lda.b #0x1E
    sta.b 0x33
    lda.b #0x00
    sta.b 0x1C
    lda.b #0x01
    sta.b 0x1D
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.C8A1:
    dec.b 0x33
    bne .C8AB

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.C8AB:
    jsl update_pos_y
    jsl _848EEA
    jmp _87C977

.C8B6:
    ldx.b 0x03
    bne .C8C1

    inc.b 0x03
    lda.b #0x01
    sta.b 0x33
    rts

.C8C1:
    lda.l 0x7F8379
    sta.b 0x11
    lda.b 0x33
    lsr
    bcc .C8D0

    lda.b #0x0E
    trb.b 0x11
.C8D0:
    dec.b 0x33
    bne .C8DC

    lda.b #0x04
    sta.b 0x01
    jsl 0x84A445
.C8DC:
    rts

.C8DD:
    ldx.b 0x0B
    stz.w 0x1F3F,X
    jml 0x828398

.C8E6:
    lda.b #0x00
    sta.b 0x1C
    lda.b #0xFF
    sta.b 0x1D
    rts

;-----

_87C8EF:
    jsl 0x8282D3
    bne .C91C

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x1A
    sta.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x0B
    and.w #0x00FF
    asl
    tay
    lda 0x00D30E,Y
    sta.w 0x0005,X
    lda.w #0x0178
    sta.w 0x0008,X
.C91C:
    sep #0x30
    rts

;-----

_87C91F:
    jsl 0x82806E
    bcs .C94B

    jsl 0x8282D3
    bne .C949

    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b #0x2E
    jsl _80888B
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.w #0x01A0
    sta.w 0x0008,X
.C949:
    sep #0x30
.C94B:
    rts

;-----

_87C94C:
    lda.b 0x02
    beq .C976

    cmp.b #0x08
    beq .C976

    lda.b #0x00
    sta.b 0x20
    lda.b #0xD3
    sta.b 0x21
    stz.b 0x26
    jsl 0x849B03
    beq .C96A

    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
.C96A:
    lda.b #0xFC
    sta.b 0x20
    lda.b #0xD2
    sta.b 0x21
    lda.b #0x03
    sta.b 0x26
.C976:
    rts

;-----

_87C977:
    dec.b 0x34
    bne .C981

    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
.C981:
    rts

;-----

_87C982:
    rep #0x20
    lda.b 0x08
    cmp.w #0x02B0
    sep #0x20
    bcc .C993

    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
.C993:
    rts

;-----

    incsrc "obj/lava_drop.asm"
    incsrc "obj/capsule.asm"

;-----

_87D012:
    ldx.b 0x01
    jmp (.D017,X)

.D017: d16[.D01D, .D065, .D0B9]

.D01D:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x20
    sta.b 0x18
    lda.b #0x02
    sta.b 0x12
    stz.b 0x26
    lda.b 0x0B
    asl
    tax
    lda.w 0x86D3D0,X
    sta.b 0x16
    lda.b #0x7C
    sta.b 0x10
    lda.w 0x86D3D1,X
    tax
    lda.w 0x0BB9
    and.b #0x70
    ora.l 0x7F8300,X
    sta.b 0x11
    sta.b 0x34
    rep #0x21
    lda.w 0x0BB0
    adc.w #0xFFC0
    sta.b 0x08
    lda.w 0x0BAD
    sta.b 0x05
    lda.b 0x0B
    and.w #0x00FF
    asl
    tax
    lda.w 0x86D3C8,X
    sta.b 0x31
    rtl

.D065:
    lda.b 0x34
    sta.b 0x11
    jsr .D082
    lda.b 0x0F
    lsr
    bcc .D07A

    lda.b 0x0B
    asl
    tax
    lda.w 0x86D3D1,X
    sta.b 0x10
.D07A:
    jsl 0x848FCA
    jml 0x8280B4

.D082:
    ldx.b 0x02
    bne .D099

    inc.b 0x02
    lda.b 0x03
    bne .D092

    lda.b #0x44
    jsl _80888B
.D092:
    lda.b 0x03
    jsl _848EEA.8F07
    rts

.D099:
    jsl _848EEA
    lda.b 0x0F
    bpl .D0A5

    lda.b #0x04
    sta.b 0x01
.D0A5:
    bit.b 0x0F
    bvc .D0B8

    lda.b #0x0E
    trb.b 0x11
    ldx.b 0x0B
    lda.w 0x86D3D8,X
    tsb.w 0x1F99
    jmp .D0BD

.D0B8:
    rts

.D0B9:
    jml 0x828398

.D0BD:
    lda.b 0x0B
    asl
    tax
    jmp (.D0C4,X)

.D0C4: d16[.D0CC, .D0D2, .D0F1, .D105]

.D0CC:
    lda.b #0x18
    sta.w 0x0BBE
    rts

.D0D2:
    lda.w 0x1F7A
    cmp.b #0x03
    bne .D0DF

    lda.b #0x80
    tsb.w 0x1F7E
    rts

.D0DF:
    inc.w 0x0C38
    stz.w 0x0C42
    stz.w 0x0C43
    stz.w 0x0C39
    lda.b #0x5D
    sta.w 0x0C48
    rts

.D0F1:
    inc.w 0x0C58
    stz.w 0x0C62
    lda.b #0x01
    sta.w 0x0C63
    stz.w 0x0C59
    lda.b #0x5D
    sta.w 0x0C68
    rts

.D105:
    inc.w 0x0C78
    stz.w 0x0C82
    lda.b #0x02
    sta.w 0x0C83
    stz.w 0x0C79
    lda.b #0x5D
    sta.w 0x0C88
    rts

;-----

    incsrc "obj/rolling_gabyool.asm"

;-----

_87D3AF:
    ldx.b 0x01
    jsr (.D3FF,X)
    lda.b 0x0F
    and.b #0x06
    cmp.b #0x06
    beq .D3C5

    lda.b 0x01
    cmp.b #0x04
    beq .D3C5

    jsr _87D53A
.D3C5:
    lda.b 0x27
    beq .D3F3

    jsl 0x849B43
    beq .D3E9

    lda.b 0x27
    and.b #0x7F
    bne .D3E1

    jsr _87D592
    jsr _87D5C9
    jsl 0x84A4AB
    bra .D3FA

.D3E1:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .D3EF

.D3E9:
    lda.b 0x34
    ora.b 0x11
    sta.b 0x11
.D3EF:
    jsl 0x849B03
.D3F3:
    jsl 0x8280B4
    jmp .D3FE

.D3FA:
    jsl 0x828398
.D3FE:
    rtl

.D3FF: d16[.D405, .D43D, .D472]

.D405:
    jsl 0x82827D
    lda.b 0x11
    ora.b #0x10
    sta.b 0x11
    and.b #0x0E
    sta.b 0x34
    jsl _879ED4
    lda.b #0x0D
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x03
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    stz.b 0x35
    rep #0x20
    lda.w #0xD3EB
    sta.b 0x20
    sep #0x20
    lda.b #0x01
    sta.b 0x33
    lda.b #0x01
    jsl _848EEA.8F07
    rts

.D43D:
    dec.b 0x33
    bne .D471

    lda.b 0x35
    bne .D44F

    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x35
.D44F:
    lda.b 0x0F
    bpl .D45C

    jsr _87D492
    jsr _87D4FA
    jmp .D465

.D45C:
    inc.b 0x33
    jsl _848EEA
    jmp .D471

.D465:
    lda.b #0x5A
    sta.b 0x33
    lda.b #0x01
    jsl _848EEA.8F07
    stz.b 0x35
.D471:
    rts

.D472:
    lda.b 0x0F
    bpl .D48D

    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    lda.b #0x5A
    sta.b 0x33
    jmp .D491

.D48D:
    jsl _848EEA
.D491:
    rts

;-----

_87D492:
    rep #0x10
    jsl 0x828358
    bne .D4F7

    inc.w 0x0000,X
    lda.b #0x13
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x34
    ora.b 0x11
    sta.w 0x0011,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b #0x02
    sta.w 0x000B,X
    stz.w 0x0028,X
    rep #0x20
    lda.b 0x11
    and.w #0x0040
    beq .D4D3

    lda.w #0x0020
    sta.w 0x0000
    lda.w #0x0200
    sta.w 0x001A,X
    jmp .D4DF

.D4D3:
    lda.w #0xFFE0
    sta.w 0x0000
    lda.w #0xFE00
    sta.w 0x001A,X
.D4DF:
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0002
    sta.w 0x0008,X
    lda.w #0xD3F0
    sta.w 0x0020,X
.D4F7:
    sep #0x30
    rts

;-----

_87D4FA:
    rep #0x20
    jsl 0x8282D3
    bne .D537

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    lda.b 0x11
    and.w #0x0040
    beq .D51F

    lda.w #0x0020
    sta.w 0x0000
    jmp .D525

.D51F:
    lda.w #0xFFE0
    sta.w 0x0000
.D525:
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0002
    sta.w 0x0008,X
.D537:
    sep #0x30
    rts

;-----

_87D53A:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .D54E

    lda.b 0x11
    and.w #0x0040
    bne .D564

    jmp .D555

.D54E:
    lda.b 0x11
    and.w #0x0040
    beq .D564

.D555:
    sep #0x20
    lda.b #0x04
    sta.b 0x01
    lda.b #0x01
    jsl _848EEA.8F07
    jmp .D575

.D564:
    sep #0x20
    lda.w 0x0BD3
    beq .D575

    jsr _87D576
    lda.b 0x36
    bne .D575

    jmp .D555

.D575:
    rts

;-----

_87D576:
    jsl 0x84A07C
    cmp.b #0x04
    bmi .D58F

    cmp.b #0x1C
    bpl .D58F

    lda.b #0x01
    jsl _848EEA.8F07
    lda.b #0x01
    sta.b 0x36
    jmp .D591

.D58F:
    stz.b 0x36
.D591:
    rts

;-----

_87D592:
    rep #0x10
    jsl 0x8282D3
    bne .D5C6

    inc.w 0x0000,X
    lda.b #0x38
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    lda.b 0x34
    ora.b 0x11
    sta.w 0x0011,X
    lda.b #0x00
    sta.w 0x0002,X
    lda.b #0x02
    sta.w 0x000B,X
    lda.b #0x01
    sta.w 0x000C,X
.D5C6:
    sep #0x10
    rts

;-----

_87D5C9:
    rep #0x10
    ldy.w #0x0006
.D5CE:
    jsl 0x8282D3
    bne .D604

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    phy
    jsl get_rng
    rep #0x20
    and.w #0x0003
    tay
    sep #0x20
    lda 0x00D3F5,Y
    sta.w 0x000B,X
    ply
    stz.w 0x000C,X
    dey
    bne .D5CE

.D604:
    sep #0x10
    rts

;-----

    incsrc "obj/ray_bit.asm"
    incsrc "obj/storm_eagleed.asm"
    incsrc "obj/snow_shooter.asm"

;-----

_87E037:
    lda.b 0x35
    tsb.b 0x11
    ldx.b 0x01
    jmp (.E040,X)

.E040: d16[.E046, .E097, .E1C5]

.E046:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    sep #0x20
    bcs .E056

    jml 0x828387

.E056:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x35
    lda.b #0x01
    sta.b 0x26
    lda.b #0x04
    sta.b 0x27
    lda.b #0x0C
    sta.b 0x1F
    lda.b #0x40
    sta.b 0x1E
    rep #0x20
    lda.w #0xFF80
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xD43C
    sta.b 0x20
    sep #0x20
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    stz.b 0x33
    stz.b 0x34
    stz.b 0x2B
    stz.b 0x2F
    stz.b 0x30
    rtl

.E097:
    lda.b 0x34
    cmp.b #0x1C
    bne .E0E3

    stz.b 0x34
    inc.b 0x33
    lda.b 0x33
    cmp.b #0x02
    beq .E0C7

    cmp.b #0x01
    bne .E0E3

    rep #0x21
    lda.b 0x08
    sbc.w #0x0003
    sta.b 0x08
    lda.w #0xD446
    sta.b 0x20
    sep #0x20
    lda.b #0x02
    sta.b 0x26
    lda.b #0x01
    jsl _848EEA.8F07
    bra .E0EC

.E0C7:
    rep #0x21
    lda.b 0x08
    sbc.w #0x0007
    sta.b 0x08
    lda.w #0xD450
    sta.b 0x20
    sep #0x20
    lda.b #0x03
    sta.b 0x26
    lda.b #0x02
    jsl _848EEA.8F07
    bra .E0EC

.E0E3:
    ldx.b 0x02
    jsr (.E11B,X)
    jsl _848EEA
.E0EC:
    jsl 0x8491BE
    lda.b 0x2B
    bit.b #0x02
    bne .E102

    jsl 0x849B03
    jsl 0x849B43
    beq .E10D

    bpl .E109

.E102:
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rtl

.E109:
    lda.b #0x0E
    trb.b 0x11
.E10D:
    jsl 0x82806E
    bcc .E117

    jml 0x828387

.E117:
    jml 0x8280B4

.E11B: d16[.E11F, .E167]

.E11F:
    rep #0x20
    lda.b 0x1C
    bpl .E12F

    cmp.w #0xF800
    bcs .E12F

    lda.w #0xF840
    sta.b 0x1C
.E12F:
    sep #0x20
    jsl update_pos_xy.neg_ay
    lda.b 0x1D
    bpl .E164

    lda.b 0x2B
    bit.b #0x04
    beq .E164

    lda.b #0x02
    sta.b 0x02
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFC00
    bcc .E150

    stz.b 0x1C
    bra .E157

.E150:
    eor.w #0xFFFF
    inc
    lsr
    sta.b 0x1C
.E157:
    cmp.w #0xFD00
    bcs .E164

    sep #0x20
    lda.b #0x57
    jsl _80888B
.E164:
    sep #0x20
    rts

.E167:
    rep #0x20
    lda.b 0x1A
    cmp.w #0xFC00
    bcs .E175

    lda.w #0xFC18
    sta.b 0x1A
.E175:
    sep #0x20
    jsl update_pos_xy.neg_ay_ax
    lda.b 0x2B
    bit.b #0x04
    bne .E185

    stz.b 0x02
    bra .E1C4

.E185:
    rep #0x10
    ldx.b 0x1C
    bpl .E18F

    stz.b 0x1C
    stz.b 0x1D
.E18F:
    lda.b 0x34
    and.b #0x03
    bne .E1C0

    jsl 0x8282D3
    bne .E1C0

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x27
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x21
    lda.b 0x05
    adc.w #0x0010
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0004
    sta.w 0x0008,X
.E1C0:
    sep #0x30
    inc.b 0x34
.E1C4:
    rts

.E1C5:
    rep #0x10
    lda.b 0x33
    and.b #0x03
    asl
    adc.b #0x06
    sta.b 0x33
.E1D0:
    jsl 0x8282D3
    bne .E22E

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    jsl get_rng
    lda.b #0x00
    xba
    and.b #0x03
    clc
    adc.b #0x48
    sta.w 0x000B,X
    rep #0x20
    jsl get_rng
    and.w #0x07FF
    lsr
    bcc .E202

    eor.w #0xFFFF
    inc
.E202:
    sta.w 0x001A,X
    jsl get_rng
    and.w #0x03FF
    clc
    adc.w #0x0200
    sta.w 0x001C,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    stz.w 0x000C,X
    sep #0x20
    stz.w 0x001F,X
    lda.b #0x40
    sta.w 0x001E,X
    dec.b 0x33
    bne .E1D0

.E22E:
    sep #0x30
    lda.b #0x57
    jsl _80888B
    jml 0x828387

;-----

_87E23A:
    lda.b 0x01
    bne .E271

    lda.b 0x11
    ora.b #0x30
    pha
    jsl 0x82827D
    pla
    tsb.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0200
    bcs .E256

    lda.w #0xFE00
.E256:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xD45A
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    stz.b 0x12
    lda.b #0x07
    jsl _848EEA.8F07
    jml 0x8280B4

.E271:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .E2AC

    lda.b #0x03
    sta.b 0x33
.E283:
    jsl 0x828321
    bne .E2A8

    inc.w 0x0000,X
    lda.b #0x56
    sta.w 0x000A,X
    lda.b 0x33
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dec.b 0x33
    bpl .E283

.E2A8:
    sep #0x30
    bra .E2B4

.E2AC:
    jsl 0x8280B4
    lda.b 0x0E
    bne .E2B8

.E2B4:
    jml 0x828398

.E2B8:
    rtl

;-----

_87E2B9:
    ldx.b 0x01
    jmp (.E2BE,X)

.E2BE: d16[.E2C4, .E308, .E32F]

.E2C4:
    jsl 0x82827D
    lda.b #0x30
    tsb.b 0x11
    stz.b 0x12
    lda.b 0x0B
    asl
    asl
    asl
    clc
    adc.b #0x04
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    sta.b 0x1A
    lda.w 0x00EE3C,X
    sta.b 0x1C
    lda.w #0xD464
    sta.b 0x20
    sep #0x20
    lda.b 0x1A
    bmi .E2F4

    lda.b #0x40
    tsb.b 0x11
.E2F4:
    lda.b #0x09
    jsl _848EEA.8F07
    lda.b #0x10
    sta.b 0x33
    lda.b #0x01
    sta.b 0x27
    sta.b 0x26
    jml 0x8280B4

.E308:
    dec.b 0x33
    bne .E32F

    lda.b #0x04
    sta.b 0x01
    jsl 0x84A07C
    asl
    asl
    tax
    rep #0x20
    lda.w 0x00EE3A,X
    sta.b 0x1A
    lda.w 0x00EE3C,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    trb.b 0x11
    ldx.b 0x1B
    bmi .E32F

    tsb.b 0x11
.E32F:
    jsl 0x82820A
    jsl _848EEA
    jsl 0x849B03
    bne .E350

    jsl 0x849B43
    bne .E34C

    jsl 0x8280B4
    lda.b 0x0E
    beq .E350

    rtl

.E34C:
    jsl 0x84A4AB
.E350:
    jml 0x828398

;-----

_87E354:
    ldx.b 0x01
    jsr (.E38D,X)
    lda.b 0x3A
    bne .E388

    lda.b 0x27
    beq .E381

    jsl 0x849B43
    beq .E37B

    lda.b 0x27
    and.b #0x7F
    bne .E373

    lda.b #0x08
    sta.b 0x01
    bra .E38C

.E373:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .E381

.E37B:
    lda.b 0x37
    ora.b 0x11
    sta.b 0x11
.E381:
    jsl 0x8280B4
    jmp .E38C

.E388:
    jsl 0x828398
.E38C:
    rtl

.E38D: d16[.E397, .E3C8, .E3E3, .E446, .E462]

.E397:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x37
    stz.b 0x3A
    lda.b #0x10
    sta.b 0x27
    lda.b #0x11
    sta.b 0x28
    lda.b #0x08
    sta.b 0x12
    lda.b #0xCB
    sta.b 0x3B
    rep #0x20
    lda.w #0x003C
    sta.b 0x33
    lda.w #0xD468
    sta.b 0x20
    sep #0x20
    lda.b #0x06
    jsl _848EEA.8F07
    rts

.E3C8:
    rep #0x20
    dec.b 0x33
    bne .E3E0

    lda.w #0x0120
    sta.b 0x33
    sep #0x20
    lda.b #0x04
    sta.b 0x01
    lda.b #0x60
    sta.b 0x35
    jmp .E3E2

.E3E0:
    sep #0x20
.E3E2:
    rts

.E3E3:
    rep #0x20
    dec.b 0x33
    bne .E3F9

.E3E9:
    rep #0x20
    lda.w #0x0120
    sta.b 0x33
    sep #0x20
    lda.b #0x06
    sta.b 0x01
    jmp .E443

.E3F9:
    sep #0x20
    lda.b #0x3A
    sta.b 0x0A
    jsl 0x84A1D0
    lda.b #0x57
    sta.b 0x0A
    lda.b #0x0C
    sta.w 0x0000
    tya
    cmp.w 0x0000
    bpl .E3E9

    dec.b 0x35
    bne .E443

    lda.b #0x60
    sta.b 0x35
    sep #0x20
    jsl 0x828321
    bne .E443

    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0x0026
    sta.w 0x0008,X
    sep #0x20
    lda.b #0x3A
    sta.w 0x000A,X
    inc.w 0x0000,X
    lda.b 0x0B
    lda.b #0x12
    sta.w 0x000B,X
.E443:
    sep #0x30
    rts

.E446:
    rep #0x20
    dec.b 0x33
    bne .E45F

    lda.w #0x0180
    sta.b 0x33
    sep #0x20
    lda.b #0x04
    sta.b 0x01
    lda.b #0x11
    sta.b 0x28
    lda.b #0x60
    sta.b 0x35
.E45F:
    sep #0x20
    rts

.E462:
    lda.b #0x10
    ldx.b #0x03
    ldy.b #0x01
    jsl 0x84A31A
    jsr _87E4A9
    jsr _87E504
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0030
    sta.w 0x002C
    lda.b 0x08
    sec
    sbc.w #0x0020
    sta.w 0x002E
    sep #0x20
    lda.b #0x00
    sta.b 0x0B
    jsl 0x848011
    lda.b #0x01
    sta.b 0x3A
    jsl 0x84A4AB
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0020
    sta.b 0x05
    sep #0x20
    jsl 0x84A4AB
    rts

;-----

_87E4A9:
    rep #0x10
    ldy.w #0x0002
.E4AE:
    jsl 0x8282D3
    bne .E503

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    cpy.w #0x0002
    beq .E4D3

    rep #0x20
    lda.w #0x0024
    sta.w 0x0000
    sep #0x20
    lda.b #0xD4
    sta.w 0x000B,X
    jmp .E4E2

.E4D3:
    rep #0x20
    lda.w #0xFFDC
    sta.w 0x0000
    sep #0x20
    lda.b #0xD3
    sta.w 0x000B,X
.E4E2:
    rep #0x20
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0012
    sta.w 0x0008,X
    stz.w 0x000C,X
    sep #0x20
    lda.b 0x11
    sta.w 0x0011,X
    dey
    bne .E4AE

.E503:
    rts

;-----

_87E504:
    rep #0x10
    ldy.w #0x0019
.E509:
    jsl 0x8282D3
    bne .E544

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
    phy
    jsl get_rng
    rep #0x20
    and.w #0x000F
    tay
    sep #0x20
    lda 0x86D46D,Y
    sta.w 0x000B,X
    ply
    lda.b 0x11
    sta.w 0x0011,X
    dey
    bne .E509

.E544:
    sep #0x10
    rts

;-----

_87E547:
    ldx.b 0x01
    jsr (.E58B,X)
    lda.b 0x27
    beq .E574

    jsl 0x849B43
    beq .E56A

    lda.b 0x27
    and.b #0x7F
    bne .E562

    jsl 0x84A4AB
    bra .E57B

.E562:
    lda.b #0xF1
    and.b 0x11
    sta.b 0x11
    bra .E570

.E56A:
    lda.b 0x33
    ora.b 0x11
    sta.b 0x11
.E570:
    jsl 0x849B03
.E574:
    jsl 0x8280B4
    jmp .E58A

.E57B:
    rep #0x10
    ldx.b 0x3A
    lda.b #0x01
    sta.w 0x003B,X
    sep #0x10
    jsl 0x828398
.E58A:
    rtl

.E58B: d16[.E591, .E5C5, .E5FA]

.E591:
    jsl 0x82827D
    lda.b 0x11
    and.b #0x0E
    sta.b 0x33
    lda.b #0x04
    sta.b 0x27
    lda.b #0x01
    sta.b 0x28
    lda.b #0x03
    sta.b 0x26
    lda.b #0x04
    sta.b 0x12
    lda.b #0x50
    sta.b 0x35
    stz.b 0x3D
    rep #0x20
    lda.w #0xD4BD
    sta.b 0x20
    sep #0x20
    lda.b #0x01
    sta.b 0x34
    lda.b #0x00
    jsl _848EEA.8F07
    rts

.E5C5:
    rep #0x30
    ldx.b 0x3A
    lda.w 0x0008,X
    sec
    sbc.w 0x0024,X
    clc
    adc.b 0x08
    sta.b 0x08
    sep #0x30
    lda.b 0x3C
    beq .E5E6

    jsr _87E62A
    jsr _87E751
    stz.b 0x3C
    jmp .E5F9

.E5E6:
    rep #0x10
    ldx.b 0x3A
    lda.w 0x0001,X
    cmp.b #0x02
    beq .E5F9

    cmp.b #0x0A
    beq .E5F9

    jsl _848EEA
.E5F9:
    rts

.E5FA:
    lda.b 0x0F
    bpl .E623

    lda.b 0x3D
    beq .E623

    lda.b 0x02
    sta.b 0x01
    stz.b 0x3D
    rep #0x10
    ldx.b 0x3A
    lda.w 0x0003,X
    beq .E61A

    lda.b #0x00
    jsl _848EEA.8F07
    jmp .E627

.E61A:
    lda.b #0x0E
    jsl _848EEA.8F07
    jmp .E627

.E623:
    jsl _848EEA
.E627:
    sep #0x10
    rts

;-----

_87E62A:
    lda.b #0x50
    sta.b 0x35
    lda.b #0x10
    sta.b 0x39
    lda.b 0x01
    sta.b 0x02
    lda.b #0x04
    sta.b 0x01
    lda.b 0x0F
    sta.b 0x3E
    cmp.b #0x01
    beq .E64B

    lda.b #0x0D
    jsl _848EEA.8F07
    jmp .E651

.E64B:
    lda.b #0x02
    jsl _848EEA.8F07
.E651:
    lda.b #0x02
    sta.b 0x38
.E655:
    lda.b 0x38
    bne .E65C

    jmp .E750

.E65C:
    rep #0x10
    jsl 0x828358
    beq .E667

    jmp .E750

.E667:
    inc.w 0x0000,X
    lda.b 0x3E
    cmp.b #0x01
    bne .E678

    lda.b #0x13
    sta.w 0x000A,X
    jmp .E67D

.E678:
    lda.b #0x27
    sta.w 0x000A,X
.E67D:
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x33
    ora.b 0x11
    sta.w 0x0011,X
    lda.b 0x16
    sta.w 0x0016,X
    lda.b #0x05
    sta.w 0x000B,X
    lda.b 0x38
    cmp.b #0x02
    bne .E6BE

    lda.b 0x3E
    cmp.b #0x01
    bne .E6AD

    rep #0x20
    lda.w #0xFFF0
    sta.w 0x0000
    stz.w 0x0002
    jmp .E6E2

.E6AD:
    rep #0x20
    lda.w #0xFFF8
    sta.w 0x0000
    lda.w #0xFFF8
    sta.w 0x0002
    jmp .E6E2

.E6BE:
    sep #0x20
    lda.b 0x3E
    cmp.b #0x01
    bne .E6D4

    rep #0x20
    lda.w #0x0010
    sta.w 0x0000
    stz.w 0x0002
    jmp .E6E2

.E6D4:
    rep #0x20
    lda.w #0x0008
    sta.w 0x0000
    lda.w #0xFFF8
    sta.w 0x0002
.E6E2:
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w 0x0002
    sta.w 0x0008,X
    lda.w #0xD4C7
    sta.w 0x0020,X
    lda.b 0x38
    and.w #0x00FF
    cmp.w #0x0002
    bne .E728

    sep #0x20
    lda.b 0x3E
    cmp.b #0x01
    bne .E717

    rep #0x20
    lda.w #0xFE00
    sta.w 0x001A,X
    jmp .E749

.E717:
    rep #0x20
    lda.w #0xFE90
    sta.w 0x001A,X
    lda.w #0x0170
    sta.w 0x001C,X
    jmp .E749

.E728:
    sep #0x20
    lda.b 0x3E
    cmp.b #0x01
    bne .E73B

    rep #0x20
    lda.w #0x0200
    sta.w 0x001A,X
    jmp .E749

.E73B:
    rep #0x20
    lda.w #0x0170
    sta.w 0x001A,X
    lda.w #0x0170
    sta.w 0x001C,X
.E749:
    sep #0x20
    dec.b 0x38
    jmp .E655

.E750:
    rts

;-----

_87E751:
    rep #0x10
    ldy.w #0x0002
.E756:
    jsl 0x8282D3
    bne .E7D1

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    cpy.w #0x0002
    bne .E796

    lda.b 0x3E
    cmp.b #0x01
    bne .E785

    rep #0x20
    lda.w #0xFFEC
    sta.w 0x0000
    stz.w 0x0002
    jmp .E7BA

.E785:
    rep #0x20
    lda.w #0xFFF4
    sta.w 0x0000
    lda.w #0xFFF4
    sta.w 0x0002
    jmp .E7BA

.E796:
    sep #0x20
    lda.b 0x3E
    cmp.b #0x01
    bne .E7AC

    rep #0x20
    lda.w #0x0014
    sta.w 0x0000
    stz.w 0x0002
    jmp .E7BA

.E7AC:
    rep #0x20
    lda.w #0x000C
    sta.w 0x0000
    lda.w #0xFFF4
    sta.w 0x0002
.E7BA:
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w 0x0002
    sta.w 0x0008,X
    sep #0x20
    dey
    bne .E756

.E7D1:
    sep #0x10
    rts

;-----

_87E7D4:
    ldx.b 0x01
    jsr (.E801,X)
    lda.b 0x3B
    beq .E7EF

    lda.b #0x0C
    sta.b 0x01
    stz.b 0x3B
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
.E7EF:
    jsl 0x849B43
    jsl 0x82808F
    bcc .E800

    jsr _87EAC2
    jsl 0x828387
.E800:
    rtl

.E801: d16[.E813, .E84F, .E89E, .E90D, .E975, .E991, .E9AB, .E9C0, .E9F1]

.E813:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    stz.b 0x28
    stz.b 0x3B
    inc.b 0x30
    lda.b #0x04
    sta.b 0x12
    lda.b #0x25
    sta.b 0x39
    lda.b #0x01
    sta.b 0x1F
    lda.b #0x07
    jsl _848EEA.8F07
    stz.b 0x2F
    stz.b 0x03
    rep #0x20
    lda.w #0xD4CC
    sta.b 0x20
    lda.b 0x08
    sec
    sbc.w #0x0090
    sta.b 0x3C
    sep #0x20
    jsr _87EA41
    jsr _87EA70
    rts

.E84F:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    dec.b 0x1F
    bne .E89D

    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.b 0x08
    bcc .E879

    lda.w #0xFFE0
    sta.w 0x0000
    lda.w #0xFE80
    sta.b 0x1C
    sep #0x20
    lda.b #0x06
    sta.b 0x01
    jmp .E88C

.E879:
    rep #0x20
    lda.w #0x0048
    sta.w 0x0000
    lda.w #0x0180
    sta.b 0x1C
    sep #0x20
    lda.b #0x04
    sta.b 0x01
.E88C:
    rep #0x20
    lda.w 0x0BB0
    sec
    sbc.w 0x0000
    sta.b 0x37
    sep #0x20
    lda.b #0x60
    sta.b 0x1F
.E89D:
    rts

.E89E:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    lda.b 0x3B
    bne .E8D6

    rep #0x10
    dec.b 0x39
    bne .E8D6

    ldx.b 0x33
    lda.b 0x03
    bne .E8C0

    lda.w 0x000F,X
    and.b #0x01
    bne .E8CE

    jmp .E8C7

.E8C0:
    lda.w 0x000F,X
    and.b #0x02
    bne .E8CE

.E8C7:
    sep #0x10
    inc.b 0x39
    jmp .E8D6

.E8CE:
    sep #0x10
    jsr _87EA15
    jmp .E902

.E8D6:
    sep #0x10
    rep #0x20
    lda.b 0x08
    cmp.b 0x3C
    bpl .E8E9

    sep #0x20
    lda.b #0x0A
    sta.b 0x01
    jmp .E8FC

.E8E9:
    jsl update_pos_y
    rep #0x20
    lda.b 0x08
    sec
    sbc.b 0x37
    bpl .E8FC

    sep #0x20
    lda.b #0x02
    sta.b 0x01
.E8FC:
    sep #0x20
    jsl _848EEA
.E902:
    lda.b 0x2C
    and.b #0x7F
    beq .E90C

    jsl 0x82C70E
.E90C:
    rts

.E90D:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    lda.b 0x3B
    bne .E945

    rep #0x10
    dec.b 0x39
    bne .E945

    ldx.b 0x33
    lda.b 0x03
    bne .E92F

    lda.w 0x000F,X
    and.b #0x01
    bne .E93D

    jmp .E936

.E92F:
    lda.w 0x000F,X
    and.b #0x02
    bne .E93D

.E936:
    sep #0x10
    inc.b 0x39
    jmp .E945

.E93D:
    sep #0x10
    jsr _87EA15
    jmp .E96A

.E945:
    sep #0x10
    jsl update_pos_y
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    bne .E95E

    rep #0x20
    lda.b 0x37
    sec
    sbc.b 0x08
    bpl .E964

.E95E:
    sep #0x20
    lda.b #0x02
    sta.b 0x01
.E964:
    sep #0x20
    jsl _848EEA
.E96A:
    lda.b 0x2C
    and.b #0x7F
    beq .E90C

    jsl 0x82C70E
    rts

.E975:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    dec.b 0x3A
    bne .E990

    lda.b 0x02
    sta.b 0x01
    rep #0x10
    ldx.b 0x33
    lda.b #0x01
    sta.w 0x003D,X
    sep #0x10
.E990:
    rts

.E991:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    lda.b 0x2C
    and.b #0x7F
    bne .E9A6

    lda.b #0x02
    sta.b 0x01
    jmp .E9AA

.E9A6:
    jsl _848EEA
.E9AA:
    rts

.E9AB:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .E9BF

    lda.b #0x0E
    sta.b 0x01
    stz.b 0x1F
.E9BF:
    rts

.E9C0:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    lda.b 0x2C
    and.b #0x7F
    bne .E9D3

    stz.b 0x1F
    jmp .E9F0

.E9D3:
    inc.b 0x1F
    lda.b 0x1F
    cmp.b #0x5A
    bne .E9F0

    lda.b #0x10
    sta.b 0x01
    rep #0x20
    lda.w #0x0180
    sta.b 0x1C
    lda.b 0x08
    sec
    sbc.w #0x00C8
    sta.b 0x37
    sep #0x20
.E9F0:
    rts

.E9F1:
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    rep #0x20
    lda.b 0x08
    sec
    sbc.b 0x37
    bmi .EA12

    sep #0x20
    jsl update_pos_y
    lda.b 0x2C
    and.b #0x7F
    beq .EA12

    jsl 0x82C70E
.EA12:
    sep #0x20
    rts

;-----

_87EA15:
    lda.b #0x25
    sta.b 0x39
    lda.b #0x10
    sta.b 0x3A
    lda.b 0x01
    sta.b 0x02
    lda.b #0x08
    sta.b 0x01
    rep #0x10
    ldx.b 0x33
    lda.b #0x01
    sta.w 0x003C,X
    lda.w 0x000F,X
    cmp.b #0x01
    beq .EA3A

    stz.b 0x03
    jmp .EA3E

.EA3A:
    lda.b #0x01
    sta.b 0x03
.EA3E:
    sep #0x10
    rts

;-----

_87EA41:
    rep #0x10
    jsl 0x828321
    bne .EA6F

    stx.b 0x33
    inc.w 0x0000,X
    lda.b #0x58
    sta.w 0x000A,X
    stz.w 0x000B,X
    stz.w 0x003C,X
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x000E
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    tdc
    sta.w 0x003A,X
    sep #0x30
.EA6F:
    rts

;-----

_87EA70:
    rep #0x10
    jsl 0x828321
    bne .EA9C

    stx.b 0x35
    inc.w 0x0000,X
    lda.b #0x5A
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0053
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    tdc
    sta.w 0x003A,X
    stz.w 0x0036,X
    stz.w 0x0035,X
.EA9C:
    sep #0x30
    rts

;-----

_87EA9F:
    rep #0x20
    lda.w #0xD4CC
    sta.b 0x20
    sep #0x20
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    rep #0x20
    lda.w #0xD4CC
    sta.b 0x20
    sep #0x20
    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
    rts

;-----

_87EAC2:
    rep #0x30
    ldx.b 0x33
    sep #0x20
    lda.w 0x000A,X
    cmp.b #0x58
    bne .EADA

    rep #0x20
    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x000E,X
.EADA:
    ldx.b 0x35
    sep #0x20
    lda.w 0x000A,X
    cmp.b #0x5A
    bne .EAF0

    rep #0x20
    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x000E,X
.EAF0:
    ldx.b 0x3E
    sep #0x20
    lda.w 0x000A,X
    cmp.b #0x5A
    bne .EB06

    rep #0x20
    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x000E,X
.EB06:
    sep #0x30
    rts

;-----

_87EB09:
    ldx.b 0x01
    jsr (.EB33,X)
    lda.b 0x35
    bne .EB16

    jsl 0x849B43
.EB16:
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0020
    sta.b 0x08
    sep #0x20
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0020
    sta.b 0x08
    sep #0x20
    jsl 0x82808F
    rtl

.EB33: d16[.EB37, .EB7E]

.EB37:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    sta.b 0x30
    stz.b 0x28
    lda.b #0x04
    sta.b 0x12
    lda.b 0x35
    bne .EB52

    rep #0x20
    lda.w #0xD4D6
    sta.b 0x20
.EB52:
    rep #0x20
    lda.b 0x08
    sec
    sbc.w #0x0060
    sta.b 0x33
    lda.b 0x36
    and.w #0x00FF
    beq .EB75

    rep #0x10
    ldx.b 0x3A
    lda.w 0x0008,X
    sec
    sbc.w 0x0024,X
    clc
    adc.b 0x08
    sta.b 0x08
    sep #0x10
.EB75:
    sep #0x20
    lda.b #0x06
    jsl _848EEA.8F07
    rts

.EB7E:
    lda.b 0x35
    bne .EB8A

    lda.b #0x80
    sta.b 0x2C
    jsl 0x82D7D0
.EB8A:
    rep #0x30
    ldx.b 0x3A
    lda.w 0x0008,X
    sec
    sbc.w 0x0024,X
    clc
    adc.b 0x08
    sta.b 0x08
    lda.b 0x36
    and.w #0x00FF
    bne .EBB1

    lda.b 0x08
    sec
    sbc.b 0x33
    bpl .EBB1

    sep #0x30
    lda.b #0x01
    sta.b 0x36
    jsr _87EBC6
.EBB1:
    sep #0x30
    jsl _848EEA
    lda.b 0x35
    bne .EBC5

    lda.b 0x2C
    and.b #0x7F
    beq .EBC5

    jsl 0x82C70E
.EBC5:
    rts

;-----

_87EBC6:
    rep #0x20
    jsl 0x828321
    bne .EBFB

    inc.w 0x0000,X
    lda.b #0x5A
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x0036,X
    lda.b #0x01
    sta.w 0x0035,X
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0040
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x3A
    sta.w 0x003A,X
    txa
    ldx.b 0x3A
    sta.w 0x003E,X
.EBFB:
    sep #0x30
    rts

;-----

    incsrc "obj/mega_tortoise.asm"

;-----

_87ED8D:
    ldx.b 0x01
    jmp (.ED92,X)

.ED92: d16[.ED9A, .EDEB, .EDF9, .EE17]

.ED9A:
    lda.w 0x1F7D
    cmp.b #0x02
    bcc .EDAD

    lda.b #0x02
    sta.b 0x0B
    jsl 0x848000
    jml 0x828398

.EDAD:
    jsl 0x82827D
    lda.b #0x00
    jsl _848EEA.8F07
    lda.b #0x02
    sta.b 0x01
    rep #0x10
    jsl 0x8282D3
    bne .EDE8

    stx.b 0x35
    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x2E
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b #0x04
    sta.w 0x0002,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.EDE8:
    sep #0x30
    rtl

.EDEB:
    lda.w 0x1F40
    beq .EDF8

    lda.b #0x04
    sta.b 0x01
    lda.b #0x20
    sta.b 0x34
.EDF8:
    rtl

.EDF9:
    dec.b 0x34
    bne .EE16

    lda.b #0x06
    sta.b 0x01
    lda.b #0x1B
    jsl _80888B
    rep #0x30
    ldx.b 0x35
    stz.w 0x0000,X
    stz.w 0x000E,X
    stz.w 0x0002,X
    sep #0x20
.EE16:
    rtl

.EE17:
    rep #0x10
    ldy.w #0x0000
.EE1C:
    jsl 0x8282D3
    bne .EE74

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    tya
    lsr
    lda.b 0x11
    bcc .EE32

    ora.b #0x40
.EE32:
    sta.w 0x0011,X
    stz.w 0x001F,X
    lda.b #0x40
    sta.w 0x001E,X
    lda 0x00D75C,Y
    sta.w 0x000B,X
    rep #0x20
    tya
    asl
    tay
    lda.b 0x05
    clc
    adc 0x00D6BC,Y
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc 0x00D6E4,Y
    sta.w 0x0008,X
    lda 0x00D70C,Y
    sta.w 0x001A,X
    lda 0x00D734,Y
    sta.w 0x001C,X
    stz.w 0x000C,X
    tya
    lsr
    tay
    sep #0x20
    iny
    cpy.w #0x0014
    bne .EE1C

.EE74:
    sep #0x10
    lda.b #0x02
    sta.b 0x0B
    jsl 0x848000
    jml 0x828398

;-----

_87EE82:
    ldx.b 0x01
    jsr (.EEAB,X)
    rep #0x20
    lda.w #0xDB49
    sta.b 0x20
    sep #0x20
    jsl 0x84AB6E
    rep #0x20
    lda.w #0xDB4D
    sta.b 0x20
    sep #0x20
    jsl 0x82806E
    bcc .EEA7

    jml 0x828387

.EEA7:
    jml 0x8280B4

.EEAB: d16[.EEB1, .EEE3, .EF09]

.EEB1:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcc .EEC0

    pla
    jml 0x828387

.EEC0:
    sep #0x20
    lda.b #0x02
    sta.b 0x01
    lda.b #0x5C
    sta.b 0x16
    lda.l 0x7F825B
    sta.b 0x18
    lda.l 0x7F835B
    sta.b 0x11
    lda.b #0x04
    sta.b 0x12
    lda.b #0x00
    jsl _848EEA.8F07
    stz.b 0x2C
    rts

.EEE3:
    jsl _848EEA
    lda.b 0x2C
    ora.w 0x1F45
    beq .EF08

    lda.b #0x04
    sta.b 0x01
    lda.b #0x02
    jsl _848EEA.8F07
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x10
    sta.b 0x0B
.EF08:
    rts

.EF09:
    jsl _848EEA
    lda.b 0x0B
    beq .EF14

    dec.b 0x0B
    rts

.EF14:
    jsl update_pos_xy.neg_ay
    rts

;-----

_87EF19:
    lda.b 0x01
    bne .EF46

    inc.b 0x01
    lda.l 0x7F8212
    sta.b 0x18
    lda.l 0x7F8312
    sta.b 0x11
    lda.b #0x14
    sta.b 0x16
    lda.b #0x00
    jsl _848EEA.8F07
    rep #0x20
    stz.b 0x1C
    stz.b 0x1A
    lda.w #0xDB51
    sta.b 0x20
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
.EF46:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .EF8E

    lda.b #0x10
    jsl 0x84A333
    lda.b #0x1A
    jsl _80888B.88B6
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFE00
    bmi .EF86

    lda.b 0x05
    sec
    sbc.w #0x0008
    sta.w 0x002C
    lda.b 0x08
    sec
    sbc.w #0x0008
    sta.w 0x002E
    lda.w #0x0000
    jsl 0x848011
    jml 0x828398

.EF86:
    eor.w #0xFFFF
    inc
    lsr
    lsr
    sta.b 0x1C
.EF8E:
    jml 0x8280B4

;-----

_87EF92:
    ldx.b 0x01
    jsr (.EF9B,X)
    jml 0x8280B4

.EF9B: d16[.EFA5, .EFE4, .EFF6, .F030, .F069]

.EFA5:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x13
    sta.w 0x00C0
    stz.b 0x1B
    stz.w 0x1F3F
    lda.b #0x67
    sta.b 0x16
    lda.l 0x7F8261
    sta.b 0x18
    lda.l 0x7F8361
    sta.b 0x11
    lda.b #0x0C
    jsl _848EEA.8F07
    lda.b #0x10
    sta.b 0x1A
    rep #0x20
    lda.w 0x1E4D
    clc
    adc.w #0x0080
    sta.b 0x05
    lda.w 0x1E50
    clc
    adc.w #0x000C
    sta.b 0x08
    sep #0x20
    rts

.EFE4:
    rep #0x20
    lda.b 0x08
    inc
    sta.b 0x08
    sep #0x20
    dec.b 0x1A
    bne .EFF5

    lda.b #0x04
    sta.b 0x01
.EFF5:
    rts

.EFF6:
    lda.b 0x1B
    beq .F02D

    stz.b 0x1B
    lda.b #0x78
    sta.w 0x1F3F
    and.b #0x03
    clc
    adc.b #0x30
    asl
    tay
    jsl _808A64
    lda.b #0x17
    sta.w 0x00C0
    lda.b #0x06
    sta.b 0x01
    lda.b #0x40
    trb.b 0x11
    ldy.b #0x11
    lda (0x0C),Y
    and.b #0x40
    tsb.b 0x11
    sta.w 0x1F40
    jsr _87F083
    lda.b #0x73
    jsl _80888B.88B6
.F02D:
    jmp _87F0F5

.F030:
    dec.w 0x1F3F
    bne .F041

    lda.b #0x13
    sta.w 0x00C0
    lda.b #0x04
    sta.b 0x01
    jmp _87F0F5

.F041:
    lda.w 0x1F3F
    and.b #0x03
    clc
    adc.b #0x30
    asl
    tay
    jsl _808A64
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0002
    bcs .F05D

    lda.w #0xFFFE
.F05D:
    clc
    adc.w 0x0BAD
    sta.w 0x0BAD
    sep #0x20
    jmp _87F0F5

.F069:
    rep #0x20
    lda.b 0x08
    dec
    sta.b 0x08
    sep #0x20
    dec.b 0x1A
    bne .F082

    stz.w 0x1F3F
    stz.w 0x1F40
    pla
    pla
    jml 0x828398

.F082:
    rts

;-----

_87F083:
    lda.b 0x11
    and.b #0x40
    sta.b 0x1D
    stz.b 0x1C
    rep #0x30
    stz.w 0x00BE
    stz.w 0x00BC
    ldx.w #0x0000
.F096:
    ldy.w #0x0010
    lda.w #0x20FD
    ora.b 0x1C
.F09E:
    dec
    sta.l 0x7FE000,X
    inx
    inx
    inc
    sta.l 0x7FE000,X
    inx
    inx
    dey
    bne .F09E

    ldy.w #0x0010
    lda.w #0x20FF
    ora.b 0x1C
.F0B7:
    dec
    sta.l 0x7FE000,X
    inx
    inx
    inc
    sta.l 0x7FE000,X
    inx
    inx
    dey
    bne .F0B7

    cpx.w #0x0800
    bcc .F096

    sep #0x10
    ldx.w 0x00A3
    lda.w #0x0800
    sta.w 0x0501,X
    sta.w 0x0503,X
    lda.w #0xE000
    sta.w 0x0505,X
    sep #0x20
    lda.b #0x7F
    sta.w 0x0507,X
    lda.b #0x80
    sta.w 0x0500,X
    txa
    clc
    adc.b #0x08
    sta.w 0x00A3
    rts

;-----

_87F0F5:
    ldy.b #0x27
    lda (0x0C),Y
    and.b #0x7F
    bne .F10F

    lda.b #0x20
    sta.b 0x1A
    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    tsb.w 0x00A2
    lda.b #0x17
    sta.w 0x00C0
.F10F:
    rts

;-----

_87F110:
    lda.b 0x0B
    bpl .F117

    jmp _87F202

.F117:
    ldx.b 0x01
    jsr (.F140,X)
    lda.b 0x00
    beq .F13F

    rep #0x20
    ldx.b 0x0B
    lda.w 0x00E214,X
    sta.w 0x0000
    lda.w 0x00E220,X
    sta.w 0x0002
    lda.w 0x00E22C,X
    sta.w 0x0004
    lda.w 0x00E238,X
    sta.w 0x0006
    jsr _87F24F
.F13F:
    rtl

.F140: d16[.F148, .F1C4, .F1DD, .F1FA]

.F148:
    jsl 0x84A23A
    tya
    beq .F166

    rep #0x10
.F151:
    dey
    dey
    bmi .F166

    ldx.w 0x0000,Y
    lda.w 0x000B,X
    cmp.b 0x0B
    bne .F151

    sep #0x10
    jsl 0x828387
    rts

.F166:
    sep #0x10
    lda.b #0x02
    sta.b 0x01
    bit.w 0x1F2C
    bvs .F187

    rep #0x30
    phb
    ldx.w #0xE1F8
    ldy.w #0x0AA1
    lda.w #0x000D
    mvn 0x00,0x86
    plb
    sep #0x30
    lda.b #0x40
    bra .F19B

.F187:
    rep #0x30
    phb
    ldx.w #0xE206
    ldy.w #0x0AAF
    lda.w #0x000D
    mvn 0x00,0x86
    plb
    sep #0x30
    lda.b #0x80
.F19B:
    sta.b 0x10
    tsb.w 0x1F2C
    stz.w snes_regs.w12sel
    stz.w 0x00C6
    stz.w snes_regs.w34sel
    stz.w 0x00C7
    lda.b #0x80
    bit.b 0x10
    bvs .F1B4

    lda.b #0x20
.F1B4:
    tsb.w 0x00C8
    lda.w 0x00C8
    sta.w snes_regs.wobjsel
    stz.w 0x212A
    stz.w 0x212B
    rts

.F1C4:
    lda.b #0x04
    sta.b 0x01
    lda.b #0x13
    sta.w 0x00C0
    lda.b #0x10
    sta.w 0x00C1
    lda.b #0x12
    sta.w 0x00C9
    lda.b #0x41
    sta.w 0x00CA
    rts

.F1DD:
    rep #0x20
    ldx.b 0x0B
    lda.w 0x0BAD
    cmp.w 0x00E244,X
    bcc .F1EE

    cmp.w 0x00E250,X
    bcc .F1F9

.F1EE:
    sep #0x20
    jsr _87F38D
    jsl 0x828387
    sep #0x10
.F1F9:
    rts

.F1FA:
    jsr _87F38D
    jsl 0x828398
    rts

;-----

_87F202:
    rep #0x20
    lda.w 0x0BAD
    cmp.w #0x0400
    sep #0x20
    bcc .F20F

    rtl

.F20F:
    ldx.b 0x01
    bne .F219

    inc.b 0x01
    lda.b #0xFF
    sta.b 0x04
.F219:
    lda.b 0x04
    sta.b 0x05
    jsr _87F35A
    cpx.b 0x05
    beq .F227

    jsr (.F228,X)
.F227:
    rtl

.F228: d16[.F243, .F234, .F243, .F239, .F243, .F23E]

.F234:
    lda.b #0x04
    jmp _87F371

.F239:
    lda.b #0x06
    jmp _87F371

.F23E:
    lda.b #0x08
    jmp _87F371

.F243:
    rep #0x10
    ldx.b 0x0C
    lda.b #0x06
    sta.w 0x0001,X
    sep #0x10
    rts

;-----

_87F24F:
    rep #0x20
    ldx.b #0x00
    ldy.b #0x0B
    bit.b 0x0F
    bvs .F25D

    ldx.b #0x16
    ldy.b #0x21
.F25D:
    lda.w 0x0004
    sec
    sbc.w 0x1E4D
    bpl .F269

    lda.w #0x0000
.F269:
    cmp.w #0x0100
    bcc .F271

    jmp .F34F

.F271:
    sta.w 0x000E
    lda.w 0x0006
    sec
    sbc.w 0x1E4D
    bpl .F280

    jmp .F34F

.F280:
    cmp.w #0x0100
    bcc .F288

    lda.w #0x00FF
.F288:
    sta.w 0x000C
    lda.w 0x0000
    sec
    sbc.w 0x1E50
    sep #0x20
    bpl .F298

    lda.b #0x01
.F298:
    sta.w 0x000A
    cmp.b #0x7F
    bcc .F2C0

    cmp.b #0xE0
    bcc .F2A5

    lda.b #0xE0
.F2A5:
    sec
    sbc.b #0x7F
    pha
    lda.b #0x7F
    sta.w 0x0B22,X
    sta 0x0B22,Y
    lda.b #0xFF
    sta.w 0x0B23,X
    lda.b #0x00
    sta 0x0B23,Y
    inx
    inx
    iny
    iny
    pla
.F2C0:
    sta.w 0x0B22,X
    sta 0x0B22,Y
    lda.b #0xFF
    sta.w 0x0B23,X
    lda.b #0x00
    sta 0x0B23,Y
    inx
    inx
    iny
    iny
    lda.w 0x000A
    cmp.b #0xE0
    bcs .F34F

    rep #0x20
    lda.w 0x0002
    sec
    sbc.w 0x1E50
    sep #0x20
    bmi .F34F

    cmp.b #0xE0
    bcc .F2EE

    lda.b #0xE0
.F2EE:
    sec
    sbc.w 0x000A
    sta.w 0x0B22,X
    sta 0x0B22,Y
    clc
    adc.w 0x000A
    sta.w 0x000A
    lda.w 0x000E
    sta.w 0x0B23,X
    lda.w 0x000C
    sta 0x0B23,Y
    inx
    inx
    iny
    iny
    lda.w 0x000A
    cmp.b #0xE0
    bcs .F34F

    lda.b #0xE0
    sec
    sbc.w 0x000A
    cmp.b #0x7F
    bcc .F33B

    sec
    sbc.b #0x7F
    pha
    lda.b #0x7F
    sta.w 0x0B22,X
    sta 0x0B22,Y
    lda.b #0xFF
    sta.w 0x0B23,X
    lda.b #0x00
    sta 0x0B23,Y
    inx
    inx
    iny
    iny
    pla
.F33B:
    sta.w 0x0B22,X
    sta 0x0B22,Y
    lda.b #0xFF
    sta.w 0x0B23,X
    lda.b #0x00
    sta 0x0B23,Y
    inx
    inx
    iny
    iny
.F34F:
    sep #0x20
    stz.w 0x0B22,X
    lda.b #0x00
    sta 0x0B22,Y
    rts

;-----

_87F35A:
    rep #0x20
    ldx.b #0x00
    lda.w 0x0BB0
.F361:
    cmp.w 0x00E25C,X
    bcc .F36C

    inx
    inx
    cpx.b #0x0A
    bne .F361

.F36C:
    sep #0x20
    stx.b 0x04
    rts

;-----

_87F371:
    sta.w 0x0000
    jsl 0x8282D3
    bne .F38A

    inc.w 0x0000,X
    lda.b #0x2E
    sta.w 0x000A,X
    lda.w 0x0000
    sta.w 0x000B,X
    stx.b 0x0C
.F38A:
    sep #0x10
    rts

;-----

_87F38D:
    lda.b #0x17
    sta.w 0x00C0
    stz.w 0x00C1
    stz.w 0x00C9
    stz.w 0x00CA
    bit.b 0x10
    bvc .F3A9

    stz.w 0x0AA1
    stz.w 0x0AA8
    lda.b #0x40
    bra .F3B1

.F3A9:
    stz.w 0x0AAF
    stz.w 0x0AB6
    lda.b #0x80
.F3B1:
    trb.w 0x00C8
    lda.w 0x00C8
    sta.w snes_regs.wobjsel
    lda.b 0x10
    trb.w 0x1F2C
    rts

;-----

_87F3C0:
    rep #0x10
    ldx.b 0x0C
    lda.b 0x01
    bne .F3FF

    inc.b 0x01
    lda.l 0x7F8269
    sta.b 0x18
    lda.l 0x7F8369
    clc
    adc.b #0x02
    sta.b 0x11
    lda.b #0x02
    sta.b 0x12
    stz.b 0x0B
    lda.b #0x75
    sta.b 0x16
    lda.w 0x0011,X
    and.b #0x40
    tsb.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0010
    bcc .F3F6

    lda.w #0xFFF0
.F3F6:
    sta.b 0x1A
    lda.w 0x0008,X
    sta.b 0x08
    sep #0x20
.F3FF:
    inc.b 0x0B
    lda.b 0x0B
    cmp.b #0x04
    bcs .F408

    rtl

.F408:
    lsr
    rep #0x20
    lda.b 0x1A
    bcc .F410

    asl
.F410:
    clc
    adc.w 0x0005,X
    sta.b 0x05
    sep #0x20
    lda.w 0x0017,X
    sta.b 0x17
    lda.w 0x0036,X
    beq .F426

    jml 0x8280B4

.F426:
    jml 0x828398

;-----

_87F42A:
    lda.b 0x01
    bne .F45C

    inc.b 0x01
    lda.b 0x0B
    asl
    asl
    tay
    lda 0x00E39F,Y
    tax
    lda.l 0x7F8200,X
    sta.b 0x18
    lda.b 0x11
    and.b #0x70
    ora.l 0x7F8300,X
    sta.b 0x11
    lda 0x00E3A2,Y
    and.b #0x0F
    sta.b 0x12
    lda 0x00E3A0,Y
    sta.b 0x16
    lda 0x00E3A1,Y
    jml 0x848F07

.F45C:
    ldx.b 0x02
    jmp (.F461,X)

.F461: d16[.F463]

.F463:
    dec.b 0x03
    beq .F472

    jsl _848EEA
    jsl 0x8280B4
    jmp .F476

.F472:
    jsl 0x828398

.F476:
    rtl

;-----

_87F477:
    lda.b 0x01
    bne .F4BE

    inc.b 0x01
    lda.b 0x02
    cmp.b #0x02
    beq .F48A

    rep #0x20
    lda.w #0x0100
    sta.b 0x1E
.F48A:
    sep #0x20
    lda.b #0x10
    sta.b 0x03
    lda.b 0x0B
    asl
    asl
    tay
    lda 0x00E3FD,Y
    tax
    lda.l 0x7F8200,X
    sta.b 0x18
    lda.b 0x11
    and.b #0x70
    sta.b 0x11
    lda.l 0x7F8300,X
    and.b #0x0F
    tsb.b 0x11
    lda 0x00E400,Y
    sta.b 0x12
    lda 0x00E3FE,Y
    sta.b 0x16
    lda 0x00E3FF,Y
    jml 0x848F07

.F4BE:
    ldx.b 0x02
    jmp (.F4C3,X)

.F4C3: d16[.F4C7, .F4F8]

.F4C7:
    lda.b 0x0C
    beq .F4E7

    rep #0x20
    dec.b 0x1E
    beq .F4E1

    sep #0x20
    dec.b 0x03
    bne .F4E7

    lda.b #0x08
    sta.b 0x03
    jsr _87F519
    jmp .F4E7

.F4E1:
    rep #0x20
    inc.b 0x1E
    sep #0x20
.F4E7:
    lda.w 0x1F41
    bne .F4F4

    jsl _848EEA
    jml 0x8280B4

.F4F4:
    jml 0x828398

.F4F8:
    jsl _848EEA
    jsl 0x8280B4
    rep #0x10
    ldx.b 0x1E
    lda.w 0x0000,X
    beq .F512

    lda.w 0x000A,X
    cmp.b #0x1E
    beq .F516

    sep #0x10
.F512:
    jml 0x828398

.F516:
    sep #0x10
    rtl

;-----

_87F519:
    rep #0x10
    jsl 0x8282D3
    bne .F56C

    inc.w 0x0000,X
    lda.b #0x39
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000C,X
    lda.b #0x80
    sta.w 0x000B,X
    rep #0x20
    jsl get_rng
    and.w #0x0007
    sta.w 0x0000
    jsl get_rng
    and.w #0x000F
    sta.w 0x0002
    lda.b 0x11
    and.w #0x0040
    beq .F55A

    lda.w 0x0000
    eor.w #0xFFFF
    inc
    sta.w 0x0000
.F55A:
    lda.b 0x05
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w 0x0002
    sta.w 0x0008,X
.F56C:
    sep #0x30
    rts

;-----

_87F56F:
    lda.b 0x01
    bne .F5B9

    inc.b 0x01
    stz.b 0x18
    lda.w 0x0BB9
    and.b #0x30
    ora.b #0x04
    sta.b 0x11
    lda.b #0x17
    sta.b 0x16
    lda.b #0xFF
    sta.b 0x12
    lda.b #0x78
    sta.b 0x1E
    lda.b 0x0B
    and.b #0x7F
    jsl _848EEA.8F07
    lda.b 0x0B
    bpl .F5B9

    lda.b 0x0C
    beq .F5A7

    lda.b #0x40
    tsb.b 0x11
    rep #0x20
    lda.w #0xFF40
    bra .F5B0

.F5A7:
    lda.b #0x40
    trb.b 0x11
    rep #0x20
    lda.w #0x00C0
.F5B0:
    sta.b 0x1A
    lda.w #0xFE00
    sta.b 0x1C
    sep #0x20
.F5B9:
    jsl _848EEA
    lda.b 0x0B
    bmi .F5D9

    lda.b 0x0F
    bpl .F5D5

    lda.b 0x13
    cmp.b #0x01
    beq .F5D1

    bra .F5D5

    dec.b 0x1E
    bne .F5D5

.F5D1:
    jml 0x828398

.F5D5:
    jml 0x8280B4

.F5D9:
    jsl 0x82820A
    rep #0x20
    lda.b 0x1A
    bmi .F5EB

    sec
    sbc.w #0x0006
    bmi .F5F9

    bra .F5F1

.F5EB:
    clc
    adc.w #0x0006
    bpl .F5F9

.F5F1:
    sta.b 0x1A
    sep #0x20
    jml 0x8280B4

.F5F9:
    sep #0x20
    jml 0x828398

;-----

_87F5FF:
    ldx.b 0x01
    jsr (.F610,X)
    lda.w 0x0BCF
    and.b #0x7F
    bne .F60F

    lda.b #0x0A
    sta.b 0x01
.F60F:
    rtl

.F610: d16[.F61C, .F69D, .F6C9, .F702, .F73D, .F785]

.F61C:
    stz.w 0x00C6
    stz.w snes_regs.w12sel
    stz.w 0x00C7
    stz.w snes_regs.w34sel
    lda.b #0xA0
    sta.w snes_regs.wobjsel
    sta.w 0x00C8
    stz.w 0x212A
    stz.w 0x212B
    stz.w 0x00C1
    stz.w snes_regs.tmw
    stz.w 0x00CE
    stz.w snes_regs.tsw
    stz.w 0x00CF
    lda.b #0xAF
    sta.w 0x00CA
    sta.w 0x2131
    lda.b #0x00
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    lda.b #0x02
    sta.b 0x01
    stz.b 0x1F
    stz.b 0x11
    stz.b 0x12
    inc.b 0x10
    lda.b #0x17
    sta.b 0x02
    lda.b #0x00
    sta.b 0x03
    bit.w 0x1F90
    bvs .F676

    ldx.b 0x0B
    jmp .F68C

.F676:
    lda.b #0x1F
    sta.b 0x02
    lda.b #0x0F
    sta.b 0x03
    lda.b #0x08
    sta.b 0x01
    lda.b #0x60
    sta.b 0x1E
    lda.b 0x0B
    clc
    adc.b #0x08
    tax
.F68C:
    rep #0x20
    lda.w 0x00E40D,X
    sta.b 0x1A
    inx
    inx
    lda.w 0x00E40D,X
    sta.b 0x1C
    sep #0x20
    rts

.F69D:
    rep #0x20
    lda.w 0x0BAD
    cmp.b 0x1A
    bmi .F6BA

    lda.w 0x0BAD
    cmp.b 0x1C
    bpl .F6BA

    sep #0x20
    lda.b 0x12
    bne .F6C8

    lda.b #0x04
    sta.b 0x01
    jmp .F6C4

.F6BA:
    sep #0x20
    lda.b 0x12
    beq .F6C8

    lda.b #0x06
    sta.b 0x01
.F6C4:
    lda.b #0x02
    sta.b 0x1E
.F6C8:
    rts

.F6C9:
    dec.b 0x1E
    bne .F701

    inc.b 0x1F
    lda.b 0x1F
    cmp.b 0x02
    bmi .F6F4

    lda.b #0x01
    sta.b 0x12
    lda.b 0x02
    sta.b 0x1F
    bit.w 0x1F90
    bvc .F6ED

    lda.b #0x08
    sta.b 0x01
    lda.b #0x60
    sta.b 0x1E
    jmp .F701

.F6ED:
    lda.b #0x02
    sta.b 0x01
    jmp .F701

.F6F4:
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    lda.b #0x02
    sta.b 0x1E
.F701:
    rts

.F702:
    dec.b 0x1E
    bne .F73C

    dec.b 0x1F
    lda.b 0x1F
    cmp.b 0x03
    bpl .F72F

    stz.b 0x12
    lda.b 0x03
    sta.b 0x1F
    bit.w 0x1F90
    bvc .F728

    lda.b #0x08
    sta.b 0x01
    lda.b #0x60
    sta.b 0x1E
    lda.b #0x0F
    sta.b 0x03
    jmp .F73C

.F728:
    lda.b #0x02
    sta.b 0x01
    jmp .F73C

.F72F:
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    lda.b #0x02
    sta.b 0x1E
.F73C:
    rts

.F73D:
    lda.b 0x10
    bne .F745

    dec.b 0x1E
    bne .F745

.F745:
    rep #0x20
    lda.w 0x0BAD
    cmp.b 0x1A
    bmi .F770

    lda.w 0x0BAD
    cmp.b 0x1C
    bpl .F770

    sep #0x20
    lda.b 0x10
    bne .F763

    lda.b 0x1E
    bne .F782

    lda.b #0x60
    sta.b 0x1E
.F763:
    lda.b 0x12
    bne .F778

    lda.b #0x04
    sta.b 0x01
    stz.b 0x10
    jmp .F77E

.F770:
    sep #0x20
    lda.b #0x01
    sta.b 0x10
    stz.b 0x03
.F778:
    sep #0x20
    lda.b #0x06
    sta.b 0x01
.F77E:
    lda.b #0x02
    sta.b 0x1E
.F782:
    sep #0x20
    rts

.F785:
    lda.b 0x1F
    beq .F796

    dec.b 0x1F
    lda.b 0x1F
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
.F796:
    rts

;-----

_87F797:
    ldx.b 0x01
    jmp (.F79C,X)

.F79C: d16[.F7A4, .F7F1, .F829, .F861]

.F7A4:
    ldx.b 0x0B
    lda.w 0x1F81
    cmp.w 0x00E455,X
    bcc .F7C0

    rep #0x20
    lda.b 0x05
    clc
    adc.w #0x0010
    and.w #0xFFF0
    sta.w 0x1E5E
    jml 0x828387

.F7C0:
    rep #0x30
    ldx.w #0x0E68
.F7C5:
    lda.w 0x0000,X
    bne .F7F0

    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1228
    bcc .F7C5

    lda.b 0x0B
    and.w #0x00FF
    asl
    sta.b 0x0C
    asl
    adc.b 0x0C
    clc
    adc.w #0xE41D
    sta.b 0x0C
    sep #0x30
    lda.b #0x3C
    sta.b 0x03
    lda.b #0x02
    sta.b 0x01
.F7F0:
    rtl

.F7F1:
    dec.b 0x03
    bne .F828

    jsl 0x84A4AB
    rep #0x20
    lda (0x0C)
    sta.w 0x0008
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    clc
    adc.w #0x0010
    sta.b 0x08
    lda.b 0x0C
    inc
    inc
    sta.b 0x0C
    sep #0x20
    jsl 0x849111
    jsl _80B8D5
    lda.b #0x0A
    sta.b 0x03
    lda.b #0x04
    sta.b 0x01
.F828:
    rtl

.F829:
    dec.b 0x03
    bne .F860

    jsl 0x84A4AB
    rep #0x20
    lda (0x0C)
    sta.w 0x0008
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    clc
    adc.w #0x0010
    sta.b 0x08
    lda.b 0x0C
    inc
    inc
    sta.b 0x0C
    sep #0x20
    jsl 0x849111
    jsl _80B8D5
    lda.b #0x0A
    sta.b 0x03
    lda.b #0x06
    sta.b 0x01
.F860:
    rtl

.F861:
    dec.b 0x03
    bne .F89F

    jsl 0x84A4AB
    rep #0x30
    lda.b 0x0B
    and.w #0x00FF
    asl
    tax
    lda.w 0x00E447,X
    sta.w 0x1E60
    lda (0x0C)
    sta.w 0x0008
    lda.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    sep #0x30
    jsl 0x849111
    jsl _80B8D5
    ldx.b 0x0B
    lda.w 0x00E455,X
    bmi .F89B

    sta.w 0x1F81
.F89B:
    jml 0x828398

.F89F:
    rtl

;-----

_87F8A0:
    ldx.b 0x01
    bne .F8A9

    lda.w 0x1F2C
    bmi .F8EC

.F8A9:
    jsr (.F8F0,X)
    jsr _87FA9A
    bcc .F8EB

    jsl 0x82806E
    bcc .F8EB

    lda.b #0x80
    trb.w 0x1F2C
    lda.b #0x13
    sta.w 0x00C0
    sta.w 0x212C
    stz.w 0x00C1
    stz.w 0x212D
    stz.w snes_regs.w34sel
    stz.w 0x00C7
    stz.w 0x2130
    stz.w 0x00C9
    stz.w 0x2131
    stz.w 0x00CA
    stz.w snes_regs.tmw
    stz.w 0x00CE
    ldx.b 0x02
    stz.w 0x0AA1,X
    jml 0x828387

.F8EB:
    rtl

.F8EC:
    jml 0x828387

.F8F0: d16[.F8F4, .F991]

.F8F4:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x80
    tsb.w 0x1F2C
    jsr _87FAD6
    lda.b #0xE0
    sta.w 0x2132
    sta.w 0x00CB
    lda.b #0x01
    sta.w 0x2126
    stz.w 0x2127
    lda.b #0x17
    sta.w 0x00C0
    lda.b #0x13
    sta.w 0x00C1
    lda.b #0x03
    sta.w snes_regs.w34sel
    sta.w 0x00C7
    lda.b #0x02
    sta.w 0x2130
    sta.w 0x00C9
    lda.b #0x7F
    sta.w 0x2131
    sta.w 0x00CA
    lda.b #0x04
    sta.w snes_regs.tmw
    sta.w 0x00CE
    rep #0x20
    stz.w 0x00BE
    stz.w 0x00BC
    sep #0x20
    ldx.w #0xBD00
    lda (0x0A,X)
    beq .F952

    txa
    clc
    adc.b #0x07
    tax
    bra 0x87F946

.F952:
    stx.b 0x02
    lda.b #0x41
    sta.w 0x0AA2,X
    lda.b #0x26
    sta.w 0x0AA3,X
    lda.b #0xD2
    sta.w 0x0AA4,X
    lda.b #0x0A
    sta.w 0x0AA5,X
    lda.b #0x00
    sta.w 0x0AA6,X
    lda.b #0x00
    sta.w 0x0AA7,X
    inc.w 0x0AA1,X
    bra .F991

.F977:
    rep #0x20
    stz.w 0x0B32
    lda.w #0x0001
    sta.w 0x0B22
    lda.w #0x00E2
    sta.w 0x0B23
    lda.w #0x000A
    sta.w 0x0B24
    sep #0x20
    rts

.F991:
    rep #0x20
    lda.w 0x00E474
    sec
    sbc.w 0x1E4D
    bcc .F977

    beq .F977

    cmp.w #0x0100
    bcc .F9A6

    lda.w #0x00FF
.F9A6:
    sta.w 0x0002
    lda.w 0x1E4D
    clc
    adc.w #0x0100
    sec
    sbc.w 0x00E476
    bcc .F977

    beq .F977

    cmp.w #0x0100
    bcc .F9C2

    lda.w #0x0000
    bra .F9CC

.F9C2:
    sta.w 0x0000
    lda.w #0x0100
    sec
    sbc.w 0x0000
.F9CC:
    sta.w 0x0000
    lda.w 0x00E47A
    sec
    sbc.w 0x1E50
    bmi .F9DF

    cmp.w #0x00E0
    bcs .F977

    bra .F9E2

.F9DF:
    lda.w #0x0000
.F9E2:
    sta.w 0x0004
    lda.w 0x1E50
    cmp.w 0x00E478
    bcs .F977

    clc
    adc.w #0x00E0
    sec
    sbc.w 0x00E478
    bcs .FA02

    lda.w #0x00F0
    sta.w 0x0006
    sta.w 0x0008
    bra .FA16

.FA02:
    sta.w 0x0006
    lda.w #0x00E0
    sec
    sbc.w 0x0006
    sta.w 0x0006
    sec
    sbc.w 0x0004
    sta.w 0x0008
.FA16:
    stz.w 0x0B32
    sep #0x20
    lda.w 0x0000
    sta.w 0x0B34
    lda.w 0x0002
    sta.w 0x0B35
    ldy.w #0xAD00
    tsb.b 0x00
    beq .FA58

    bpl .FA48

    lda.b #0x7F
    sta 0x0B22,Y
    lda.b #0xE2
    sta 0x0B23,Y
    lda.b #0x0A
    sta 0x0B24,Y
    iny
    iny
    iny
    lda.w 0x0004
    sec
    sbc.b #0x7F
.FA48:
    sta 0x0B22,Y
    lda.b #0xE2
    sta 0x0B23,Y
    lda.b #0x0A
    sta 0x0B24,Y
    iny
    iny
    iny
.FA58:
    lda.w 0x0008
    bpl .FA75

    lda.b #0x7F
    sta 0x0B22,Y
    lda.b #0xE4
    sta 0x0B23,Y
    lda.b #0x0A
    sta 0x0B24,Y
    iny
    iny
    iny
    lda.w 0x0008
    sec
    sbc.b #0x7F
.FA75:
    sta 0x0B22,Y
    lda.b #0xE4
    sta 0x0B23,Y
    lda.b #0x0A
    sta 0x0B24,Y
    iny
    iny
    iny
    lda.b #0x01
    sta 0x0B22,Y
    lda.b #0xE2
    sta 0x0B23,Y
    lda.b #0x0A
    sta 0x0B24,Y
    lda.b #0x00
    sta 0x0B25,Y
    rts

;-----

_87FA9A:
    rep #0x30
    lda.w 0x1E4D
    sec
    sbc.w #0x0040
    sec
    sbc.w 0x00E474
    bcs .FAD3

    lda.w 0x00E476
    sec
    sbc.w #0x0140
    sec
    sbc.w 0x1E4D
    bcs .FAD3

    lda.w 0x1E50
    sec
    sbc.w #0x0040
    sec
    sbc.w 0x00E478
    bcs .FAD3

    lda.w 0x00E47A
    sec
    sbc.w #0x0140
    sec
    sbc.w 0x1E50
    bcs .FAD3

    sep #0x30
    rts

.FAD3:
    sep #0x30
    rts

;-----

_87FAD6:
    lda.b #0x7F
    sta.w snes_regs.wmaddh
    lda.b #0xD0
    sta.w snes_regs.wmaddm
    lda.b #0x00
    sta.w snes_regs.wmaddl
    lda.b #0x17
    ldx.b #0x30
    ldy.b #0x00
.FAEB:
    sta.w snes_regs.wmdata
    stx.w snes_regs.wmdata
    dey
    bne .FAEB

    ldy.b #0x00
.FAF6:
    sta.w snes_regs.wmdata
    stx.w snes_regs.wmdata
    dey
    bne .FAF6

    ldy.b #0x00
.FB01:
    sta.w snes_regs.wmdata
    stx.w snes_regs.wmdata
    dey
    bne .FB01

    ldy.b #0x00
.FB0C:
    sta.w snes_regs.wmdata
    stx.w snes_regs.wmdata
    dey
    bne .FB0C

    ldx.w 0x00A3
    lda.b #0x00
    sta.w 0x0500,X
    rep #0x20
    lda.w #0x0800
    sta.w 0x0501,X
    lda.w #0x0800
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
    rts

;-----

_87FB40:
    ldx.b 0x01
    jmp (.FB45,X)

.FB45: d16[.FB55, .FB91, .FBAE, .FC08, .FC1E, .FC44, .FC64, .FCC2]

.FB55:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.w #0x0030
    cmp.b 0x05
    sep #0x20
    bcs .FB6F

    jsl 0x82806E
    bcc .FB6E

    jml 0x828387

.FB6E:
    rtl

.FB6F:
    lda.b #0x02
    sta.b 0x01
    inc.w 0x1F49
    jsl 0x849FE6
    rep #0x20
    lda.w #0x0100
    sta.w 0x1E6E
    sta.w 0x1E68
    lda.w #0x0600
    sta.w 0x1E60
    sta.w 0x1E5E
    sep #0x20
    rtl

.FB91:
    rep #0x20
    lda.w 0x1E60
    cmp.w 0x1E4D
    bne .FBAD

    lda.w #0x0004
    sta.b 0x01
    stz.w 0x1F49
    lda.w #0x0006
    sta.b 0x04
    lda.w #0x003C
    sta.b 0x07
.FBAD:
    rtl

.FBAE:
    dec.b 0x07
    bne .FC07

    jsl 0x8282B9
    beq .FBBB

    inc.b 0x07
    rtl

.FBBB:
    inc.w 0x0000,X
    lda.b #0x11
    sta.w 0x000A,X
    rep #0x20
    lda.w #0x0610
    sta.w 0x0005,X
    lda.w #0x0100
    sta.w 0x0008,X
    sep #0x20
    dec.b 0x04
    bne .FC03

    jsl 0x849FFE
    jsl 0x828321
    bne .FBFE

    inc.w 0x0000,X
    lda.b #0x09
    sta.w 0x000A,X
    lda.b #0x06
    sta.b 0x01
    rep #0x20
    lda.w #0x06D0
    sta.w 0x0005,X
    lda.w #0x00E0
    sta.w 0x0008,X
    stx.b 0x0C
    rtl

.FBFE:
    lda.b #0x0C
    sta.b 0x01
    rtl

.FC03:
    lda.b #0x3C
    sta.b 0x07
.FC07:
    rtl

.FC08:
    lda (0x0C)
    bne .FC1D

    lda.b #0x08
    sta.b 0x01
    lda.b #0x60
    sta.b 0x07
    lda.b #0x09
    sta.w 0x1F08
    jsl _80B085
.FC1D:
    rtl

.FC1E:
    dec.b 0x07
    bne .FC36

    jsl 0x828321
    bne .FC37

    inc.w 0x0000,X
    lda.b #0x4D
    sta.w 0x000A,X
    stx.b 0x0C
    lda.b #0x0A
    sta.b 0x01
.FC36:
    rtl

.FC37:
    lda.b #0x0C
    sta.b 0x01
    lda.b #0x06
    sta.b 0x04
    lda.b #0x02
    sta.b 0x07
    rts

.FC44:
    lda.w 0x1F99
    and.b #0x04
    beq .FC63

    lda.b #0x0C
    sta.b 0x01
    lda.b #0x06
    sta.b 0x04
    lda.b #0xB4
    sta.b 0x07
    rep #0x20
    lda.w #0x0610
    sta.b 0x05
    lda.w #0x0110
    sta.b 0x08
.FC63:
    rtl

.FC64:
    dec.b 0x07
    bne .FC91

    lda.b 0x04
    jsl 0x848000
    jsl 0x84A4AB
    jsr .FC92
    rep #0x20
    lda.b 0x08
    clc
    adc.w #0x0020
    sta.b 0x08
    sep #0x20
    lda.b #0x14
    sta.b 0x07
    dec.b 0x04
    bne .FC91

    lda.b #0x0E
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x07
.FC91:
    rtl

.FC92:
    ldy.b #0x07
.FC94:
    jsl 0x8282D3
    bne .FCBF

    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    jsl get_rng
    and.b #0x03
    clc
    adc.b #0xC4
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dey
    bpl .FC94

.FCBF:
    sep #0x10
    rts

.FCC2:
    dec.b 0x07
    bne .FCE6

    lda.b #0x01
    tsb.w 0x1F3F
    rep #0x20
    stz.w 0x1E5E
    lda.w #0x1D00
    sta.w 0x1E60
    lda.w #0x0100
    sta.w 0x1E68
    lda.w #0x021F
    sta.w 0x1E6E
    jml 0x828398

.FCE6:
    rtl

;-----

_87FCE7:
    ldx.b 0x01
    jsr (.FCF8,X)
    bit.w 0x1F90
    bvc .FCF5

    jml 0x828398

.FCF5:
    jmp .FD44

.FCF8: d16[.FCFC, .FD05]

.FCFC:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x01
    sta.b 0x02
    rts

.FD05:
    dec.b 0x02
    bne .FD43

    jsl 0x828321
    bne .FD43

    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    sta.w 0x0035,X
    lda.b 0x08
    sta.w 0x0008,X
    sta.w 0x0037,X
    sep #0x20
    lda.b #0x45
    sta.w 0x000A,X
    inc.w 0x0000,X
    lda.b 0x0B
    sta.w 0x000B,X
    sep #0x10
    lda.b 0x0B
    and.b #0x10
    bne .FD3F

    lda.b #0x20
    sta.b 0x02
    jmp .FD43

.FD3F:
    lda.b #0x40
    sta.b 0x02
.FD43:
    rts

.FD44:
    jsl 0x82806E
    bcc .FD4E

    jml 0x828387

.FD4E:
    rtl

;-----

_87FD4F:
    ldx.b 0x01
    jmp (.FD54,X)

.FD54: d16[.FD5A, .FD6C, .FDA7]

.FD5A:
    lda.b #0x02
    sta.b 0x01
    rep #0x20
    lda.b 0x05
    cmp.w 0x0BAD
    bcc .FD68

    rtl

.FD68:
    jml 0x828398

.FD6C:
    rep #0x20
    lda.b 0x05
    cmp.w 0x0BAD
    bcc .FD76

    rtl

.FD76:
    ldx.w 0x1F7A
    cpx.b #0x09
    bcs .FD91

    lda.w #0x1B60
    sta.w 0x1E60
    sta.w 0x1E5E
    lda.w #0x002F
    sta.w 0x1E6E
    sta.w 0x1E68
    bra .FD9A

.FD91:
    lda.w #0x1060
    sta.w 0x1E60
    sta.w 0x1E5E
.FD9A:
    sep #0x20
    jsl 0x849FE6
    inc.w 0x1F49
    lda.b #0x04
    sta.b 0x01
.FDA7:
    rep #0x20
    lda.w 0x1E4D
    cmp.w 0x1E60
    bne .FDC6

    jsl 0x828321
    bne .FDC6

    inc.w 0x0000,X
    lda.b #0x52
    sta.w 0x000A,X
    stz.w 0x1F49
    jml 0x828398

.FDC6:
    rtl

;-----

_87FDC7:
    lda.b 0x0B
    cmp.b #0x01
    bne .FDD9

    jsl 0x84A205
    cpy.b #0x00
    beq .FDD9

    jml 0x828398

.FDD9:
    lda.b #0x3A
    sta.b 0x0A
    jsl 0x84A23A
    lda.b #0x21
    sta.b 0x0A
    cpy.b #0x00
    beq .FDF0

    lda.b #0x01
    sta.b 0x0E
    jmp .FDF2

.FDF0:
    stz.b 0x0E
.FDF2:
    rep #0x20
    lda.w 0x0BAD
    cmp.w #0x0130
    bmi .FE11

    cmp.w #0x0B33
    bpl .FE11

    sep #0x20
    lda.b 0x0E
    bne .FE3A

    stz.b 0x02
    stz.b 0x03
    jsr _87FE83
    jmp .FE3A

.FE11:
    sep #0x20
    jsr _87FE3D
    rep #0x20
    lda.w 0x0BAD
    cmp.w #0x0D7C
    bmi .FE35

    cmp.w #0x1BE2
    bpl .FE35

    sep #0x20
    lda.b 0x0E
    bne .FE3A

    stz.b 0x02
    stz.b 0x03
    jsr _87FEAC
    jmp .FE3A

.FE35:
    sep #0x20
    jsr _87FE5F
.FE3A:
    sep #0x20
    rtl

;-----

_87FE3D:
    rep #0x10
    ldx.b 0x02
    lda.w 0x000A,X
    cmp.b #0x3A
    bne .FE5C

    lda.w 0x000B,X
    bne .FE5C

    stz.b 0x0E
    rep #0x20
    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x000E,X
    sep #0x20
.FE5C:
    sep #0x10
    rts

;-----

_87FE5F:
    rep #0x10
    ldx.b 0x02
    lda.w 0x000A,X
    cmp.b #0x3A
    bne .FE80

    lda.w 0x000B,X
    cmp.b #0x04
    bne .FE80

    stz.b 0x0E
    rep #0x20
    stz.w 0x0000,X
    stz.w 0x0002,X
    stz.w 0x000E,X
    sep #0x20
.FE80:
    sep #0x10
    rts

;-----

_87FE83:
    rep #0x10
    jsl 0x8282D3
    bne .FEA9

    inc.w 0x0000,X
    lda.b #0x3A
    sta.w 0x000A,X
    lda.b #0x00
    sta.w 0x000B,X
    rep #0x20
    lda.w #0x0145
    sta.w 0x0005,X
    lda.w #0x03F7
    sta.w 0x0008,X
    txa
    sta.b 0x02
.FEA9:
    sep #0x30
    rts

;-----

_87FEAC:
    rep #0x10
    jsl 0x8282D3
    bne .FED2

    inc.w 0x0000,X
    lda.b #0x3A
    sta.w 0x000A,X
    lda.b #0x04
    sta.w 0x000B,X
    rep #0x20
    lda.w #0x0E00
    sta.w 0x0005,X
    lda.w #0x03A9
    sta.w 0x0008,X
    txa
    sta.b 0x02
.FED2:
    sep #0x30
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
    0xFF,0xFF,0xFF,
]
