org 0x8000*1
base 0x818000

;-----

_818000:
    phd
    pea 0x0E68
    pld
    ldx.b 0x01
    jsr (.801D,X)
    lda.w 0x1E5D
    beq .8013

    lda.b 0x0F
    bmi .8017

.8013:
    jsl 0x848EEA
.8017:
    jsl 0x8280B4
    pld
    rtl

.801D: d16[.8021, .803D]

.8021:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x38
    sta.b 0x11
    stz.b 0x18
    stz.b 0x12
    stz.b 0x06
    stz.b 0x09
    lda.b #0x40
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    bra .804D

.803D:
    lda.w 0x1E4C
    cmp.w 0x1E6A
    bne .804D

    lda.w 0x1E4F
    cmp.w 0x1E6C
    beq .808E

.804D:
    ldx.w 0x1E4C
    lda.w 0x86A6B9,X
    sta.b 0x05
    ldx.w 0x1E4F
    lda.w 0x86A6BD,X
    sta.b 0x08
    lda.b #0x80
    sec
    sbc.b 0x05
    bcs .8067

    eor.b #0xFF
    inc
.8067:
    cmp.b #0x20
    bcs .8088

    lda.b #0x70
    sec
    sbc.b 0x08
    bcs .8075

    eor.b #0xFF
    inc
.8075:
    cmp.b #0x20
    bcs .8088

    lda.b #0x80
    sta.b 0x05
    lda.b #0x70
    sta.b 0x08
    lda.b #0x01
    jsl 0x848F07
    rts

.8088:
    lda.b #0x00
    jsl 0x848F07
.808E:
    rts

;-----

_81808F:
    phd
    pea 0x1428
    pld
    lda.b 0x01
    bne .80B0

    inc.b 0x01
    lda.b #0x38
    sta.b 0x11
    stz.b 0x18
    stz.b 0x12
    stz.b 0x06
    stz.b 0x09
    lda.b #0x40
    sta.b 0x16
    lda.b #0x02
    jsl 0x848F07
.80B0:
    lda.w 0x1E4B
    cmp.b #0x02
    bne .80D4

    lda.w 0x1E4F
    asl
    asl
    adc.w 0x1E4C
    tax
    lda.w 0x86A6C1,X
    bmi .80D4

    tax
    lda.w 0x86A6D1,X
    sta.b 0x05
    lda.w 0x86A6D9,X
    sta.b 0x08
    jsl 0x8280B4
.80D4:
    lda.w 0x1E5D
    beq .80DD

    lda.b 0x0F
    bpl .80E1

.80DD:
    jsl 0x848EEA
.80E1:
    pld
    rtl

;-----

_8180E3:
    jsr .local
    rtl

.local:
    phd
    php
    rep #0x20
    lda.w #0x0000
    tcd
    sep #0x30
    lda 0x86A6E1,Y
    sta.b 0x10
    lda 0x86A6E2,Y
    sta.b 0x11
    ldy.b #0x00
.80FD:
    lda (0x10),Y
    beq .812B

    iny
    sta.b 0x00
    lda (0x10),Y
    iny
    sta.b 0x02
.8109:
    lda (0x10),Y
    iny
    sta.b 0x14
    lda (0x10),Y
    iny
    sta.b 0x15
    ldx.b 0x02
.8115:
    lda (0x10),Y
    iny
    sta (0x14)
    dex
    beq .8125

    rep #0x20
    inc.b 0x14
    sep #0x20
    bra .8115

.8125:
    dec.b 0x00
    bne .8109

    bra .80FD

.812B:
    plp
    pld
    rts

;-----

_81812E:
    php
    phd
    sep #0x30
    pea 0x0BA8
    pld
    jsl 0x849ACD
    sta.b 0x65
    lda.b 0x2B
    ora.b 0x2C
    sta.b 0x5E
    lda.w 0x1F0C
    ora.b 0x30
    ora.b 0x89
    sta.b 0x8A
    jsr _819AC2
    jsr _819B23
    jsr _819FD7
    lda.b 0x02
    cmp.b #0x40
    bne .815C

    stz.b 0x37
.815C:
    lda.b 0x8C
    tsb.b 0x37
    ldx.b 0x01
    jsr (.819A,X)
    stz.b 0x2C
    lda.b 0x65
    sta.b 0x66
    sta.l 0x700800
    cmp.l 0x700800
    beq .817D

    dec.b 0x83
    bpl .817F

    stz.b 0x83
    bra .817F

.817D:
    inc.b 0x83
.817F:
    jsr _8199C9
    jsr _819B71
    jsl 0x848FCA
    lda.b #0x08
    trb.b 0x7E
    stz.b 0x19
    lda.b 0x11
    and.b #0x3F
    ora.b 0x69
    sta.b 0x11
    pld
    plp
    rtl

.819A: d16[.819E, .8258]

.819E:
    lda.b #0xFF
    sta.b 0x10
    stz.b 0x18
    stz.b 0x73
    lda.b #0x40
    sta.b 0x69
    lda.w 0x1F7F
    beq .81B1

    stz.b 0x69
.81B1:
    lda.b #0xFF
    sta.b 0x10
    stz.b 0x64
    lda.b #0x04
    sta.b 0x78
    stz.b 0x04
    stz.b 0x07
    lda.b #0x22
    sta.b 0x6F
    lda.b #0x02
    sta.b 0x01
    lda.b #0x22
    sta.b 0x02
    lda.w 0x1F7F
    beq .81D4

    lda.b #0x44
    sta.b 0x02
.81D4:
    ldx.w 0x1F7A
    lda.b #0x02
    ora.w 0x86BAC5,X
    sta.b 0x11
    stz.b 0x5B
    stz.b 0x5A
    lda.b #0xFF
    sta.b 0x66
    stz.b 0x82
    lda.w 0x1F7A
    asl
    asl
    tax
    rep #0x20
    jsl _80E687
    stz.b 0x79
    lda.b 0x05
    sta.b 0x22
    lda.b 0x08
    sta.b 0x24
    lda.w #0xA555
    sta.b 0x20
    lda.w #0xFA80
    sta.b 0x5F
    lda.w #0x0060
    sta.w 0x1E70
    lda.w #0x0080
    sta.w 0x1E72
    lda.w #0x0080
    sta.w 0x1E74
    lda.w #0x0080
    sta.w 0x1E76
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    inc.b 0x0E
    stz.b 0x30
    stz.b 0x89
    stz.b 0x88
    stz.b 0x8A
    stz.b 0x7F
    stz.b 0x80
    lda.b #0x03
    sta.b 0x67
    lda.b #0x08
    sta.b 0x2F
    jsl get_rng
    tax
    lda.l 0x008000,X
    cmp.l 0x408000,X
    beq .824F

    stz.w 0x1F99
.824F:
    lda.b #0x47
    jsl 0x848F07
    jmp 0x819D7E

.8258:
    lda.w 0x1F23
    beq .826C

    bmi .826C

    lda.b 0x02
    cmp.b #0x1A
    beq .826C

    lda.b 0x27
    beq .826C

    jmp 0x8196DC

.826C:
    lda.b 0x6B
    beq .8287

    lda.w 0x0B9C
    and.b #0x01
    sta.b 0x0E
    lda.b 0x02
    cmp.b #0x18
    beq .8287

    dec.b 0x6B
    bne .8287

    lda.b #0x01
    sta.b 0x0E
    stz.b 0x30
.8287:
    lda.b 0x56
    beq .828D

    dec.b 0x56
.828D:
    jsr _81A058
    jsr _8197C8
    jsr _819712
    jsr _819789
    jsr _819A66
    ldx.b 0x02
    jmp (.82A1,X)

.82A1: d16[
    .82E9, .8398, .8403, .8481, .851D, .85F6, .8A45, .8651,
    .870E, .8834, .8904, .8B31, .8B43, .8BA7, .8B44, .8B4D,
    .89A0, .89F0, .8D29, .8D69, .8DAB, .8DE1, .8E75, .8E86,
    .8F41, .917C, .91DD, .923F, .92E9, .930E, .8F29, .8F4E,
    .8FB4, .900D, .9051, .8B4D,
]

.82E9:
    ldx.b 0x03
    jmp (.82EE,X)

.82EE: d16[.82F2, .831B]

.82F2:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    lda.w #0xA555
    sta.b 0x20
    lda.w #0xA597
    sta.b 0x31
    jsr _81992A
    sep #0x20
    jsr _819588
    lda.b #0x00
    clc
    adc.b 0x6F
    clc
    adc.b 0x73
    jsl 0x848F07
.831B:
    jsr _819E45
    lda.b 0x5E
    bit.b #0x04
    bne .8327

    jmp 0x819658

.8327:
    lda.b 0x59
    bne .8331

    lda.b 0x3B
    bit.b #0x40
    beq .8339

.8331:
    lda.b #0x00
    clc
    adc.b 0x73
    jsr _81942B
.8339:
    lda.b 0x3B
    bit.b #0x80
    beq .8348

    jsl 0x849958
    bcs .8348

    jmp 0x8195E2

.8348:
    lda.b 0x4F
    beq .834E

    dec.b 0x4F
.834E:
    jsr _819576
    beq .8368

    jsl 0x8499AF
    bcs .8368

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    lda.b 0x4F
    beq .8368

    lda.b #0x04
    sta.b 0x02
    rts

.8368:
    lda.b 0x37
    bit.b #0x04
    beq .837E

    stz.b 0x29
    lda.b #0x18
    sta.b 0x2A
    jsr _819D70
    cmp.b #0x13
    bne .837E

    jmp 0x8196F7

.837E:
    lda.b 0x37
    bit.b #0x08
    beq .8390

    jsr _819FB1
    bne .8390

    lda.b #0x2A
    sta.b 0x4E
    jmp 0x8196E5

.8390:
    lda.b #0x22
    clc
    adc.b 0x73
    jmp 0x819560

.8398:
    ldx.b 0x03
    jmp (.839D,X)

.839D: d16[.83A1, .83B5]

.83A1:
    lda.b #0x02
    sta.b 0x03
    jsr _81992A
    lda.b #0x05
    sta.b 0x4E
    lda.b #0x1C
    clc
    adc.b 0x6F
    jsl 0x848F07
.83B5:
    lda.b 0x59
    bne .83BF

    lda.b 0x3B
    bit.b #0x40
    beq .83C4

.83BF:
    lda.b #0x1C
    jsr _81942B
.83C4:
    lda.b 0x3B
    bit.b #0x80
    beq .83D3

    jsl 0x849958
    bcs .83D3

    jmp 0x8195E2

.83D3:
    lda.b 0x37
    and.b #0x03
    bit.b 0x5E
    beq .83DE

    jmp 0x8195CC

.83DE:
    lda.b 0x5E
    bit.b #0x04
    bne .83E7

    jmp 0x819658

.83E7:
    jsr _819576
    bne .83EF

    jmp 0x8195CC

.83EF:
    dec.b 0x4E
    bne .83FA

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

.83FA:
    jsl update_pos_x
    lda.b #0x3E
    jmp 0x819560

.8403:
    ldx.b 0x03
    jmp (.8408,X)

.8408: d16[.840C, .8425]

.840C:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    sep #0x20
    jsr _81992A
    lda.b #0x09
    clc
    adc.b 0x6F
    jsl 0x848F07
.8425:
    lda.b 0x59
    bne .842F

    lda.b 0x3B
    bit.b #0x40
    beq .8434

.842F:
    lda.b #0x09
    jsr _8193A8
.8434:
    lda.b 0x3B
    bit.b #0x80
    beq .8446

    jsl 0x849958
    bcs .8446

    jsr _8195E2
    jmp 0x818481

.8446:
    lda.b 0x37
    and.b #0x03
    bit.b 0x5E
    beq .8453

    stz.b 0x4F
    jmp 0x8195CC

.8453:
    lda.b 0x5E
    bit.b #0x04
    bne .845C

    jmp 0x819658

.845C:
    jsr _819576
    bne .8468

    lda.b #0x0A
    sta.b 0x4F
    jmp 0x8195CC

.8468:
    jsr _819960
    jsl update_pos_x
    lda.b 0x7E
    bit.b #0x08
    beq .847B

    lda.w 0x0B9C
    lsr
    bcc .8480

.847B:
    lda.b #0x2B
    jmp 0x819536

.8480:
    rts

.8481:
    ldx.b 0x03
    jmp (.8486,X)

.8486: d16[.848C, .84A2, .8514]

.848C:
    lda.b #0x02
    sta.b 0x03
    jsr _819978
    lda.b #0x06
    jsl _80888B.88B6
    lda.b #0x01
    clc
    adc.b 0x6F
    jsl 0x848F07
.84A2:
    lda.w 0x1F9E
    bpl .84AD

    bit.b #0x01
    bne .84AD

    sta.b 0x1E
.84AD:
    lda.b 0x59
    bne .84B7

    lda.b 0x3B
    bit.b #0x40
    beq .84BC

.84B7:
    lda.b #0x01
    jsr _8193A8
.84BC:
    lda.b 0x5E
    bit.b #0x08
    beq .84D9

    jsr _819E97
    beq .84D6

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    sta.b 0x84
    lda.b #0x0F
    jsl 0x84A333
    rts

.84D6:
    jmp 0x819658

.84D9:
    stz.b 0x1A
    stz.b 0x1B
    stz.b 0x1F
    jsr _819978
    lda.b 0x1D
    bpl .84EC

    jsr _819658
    jmp 0x81851D

.84EC:
    lda.b 0x37
    bit.b #0x80
    bne .84F8

    jsr _819658
    jmp 0x81851D

.84F8:
    bit.b #0x08
    beq .8508

    jsr _819FB1
    bne .8508

    lda.b #0x2A
    sta.b 0x4E
    jmp 0x8196E5

.8508:
    jsl update_pos_xy.neg_ay_ax
    jsr _819D00
    lda.b #0x23
    jmp 0x819536

.8514:
    dec.b 0x84
    bne .851C

    lda.b #0x02
    sta.b 0x03
.851C:
    rts

.851D:
    ldx.b 0x03
    jmp (.8522,X)

.8522: d16[.8526, .8552]

.8526:
    sta.l 0x700804
    cmp.l 0x700804
    beq .853A

    dec.w 0x1F9E
.8533:
    bpl .8542

    stz.w 0x1F9E
    bra .8542

.853A:
    inc.w 0x1F9E
    bne .8542

    dec.w 0x1F9E
.8542:
    lda.b #0x02
    sta.b 0x03
    jsr _81992A
    lda.b #0x04
    clc
    adc.b 0x6F
    jsl 0x848F07
.8552:
    lda.b 0x59
    bne .855C

    lda.b 0x3B
    bit.b #0x40
    beq .8561

.855C:
    lda.b #0x04
    jsr _8193A8
.8561:
    lda.b 0x5E
    bit.b #0x04
    beq .856D

    jsr _819665
    jmp 0x8185F6

.856D:
    lda.b 0x3B
    bit.b #0x80
    beq .85B4

    lda.b 0x2C
    bpl .8581

    and.b #0x40
    tay
    stz.b 0x81
    inc.b 0x81
    jmp 0x819687

.8581:
    jsl 0x849958
    bcs .85B4

    jsl 0x849A24
    bcc .85AD

    cmp.b #0x3E
    beq .859F

    cmp.b #0x3F
    beq .85A6

    bvc .859C

    phy
    jsr _8198F2
    ply
.859C:
    jmp 0x819687

.859F:
    lda.b 0x8A
    bne .859C

    jmp 0x81967C

.85A6:
    lda.b 0x8A
    bne .859C

    jmp 0x8196CB

.85AD:
    lda.b 0x3C
    beq .85B4

    jmp 0x8195E2

.85B4:
    lda.b 0x37
    and.b #0x03
    bit.b 0x5E
    beq .85C5

    lda.b 0x2D
    cmp.b #0x36
    beq .85C5

    jsr _819699
.85C5:
    stz.b 0x1F
    rep #0x20
    stz.b 0x1A
    jsr _819978
    lda.b 0x5F
    cmp.b 0x1C
    bmi .85D6

    sta.b 0x1C
.85D6:
    jsl update_pos_xy.neg_ay_ax
    jsr _819D00
    sep #0x20
    lda.b 0x37
    bit.b #0x08
    beq .85F1

    jsr _819FB1
    bne .85F1

    lda.b #0x2A
    sta.b 0x4E
    jmp 0x8196E5

.85F1:
    lda.b #0x26
    jmp 0x819536

.85F6:
    ldx.b 0x03
    jmp (.85FB,X)

.85FB: d16[.85FF, .861F]

.85FF:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    sep #0x20
    lda.b #0x04
    sta.b 0x4E
    lda.b #0x07
    jsl _80888B.88B6
    lda.b #0x07
    clc
    adc.b 0x6F
    jsl 0x848F07
.861F:
    lda.b 0x59
    bne .8629

    lda.b 0x3B
    bit.b #0x40
    beq .862E

.8629:
    lda.b #0x07
    jsr _8193A8
.862E:
    dec.b 0x4E
    bne .8637

    stz.b 0x4F
    jmp 0x8195CC

.8637:
    lda.b 0x3B
    bit.b #0x80
    beq .8640

    jmp 0x8195E2

.8640:
    lda.b 0x37
    bit.b #0x03
    beq .864C

    jsr _8195D7
    jmp 0x818403

.864C:
    lda.b #0x29
    jmp 0x819536

.8651:
    ldx.b 0x03
    jmp (.8656,X)

.8656: d16[.865A, .8699]

.865A:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x09
    jsl _80888B.88B6
    lda.b #0x08
    sta.b 0x2F
    sta.b 0x30
    lda.b #0x80
    trb.b 0x87
    rep #0x20
    stz.b 0x79
    lda.w #0xA555
    sta.b 0x20
    sep #0x20
    stz.b 0x6E
    stz.b 0x64
    stz.b 0x50
    jsr _81992A
    ldx.b #0x44
    lda.w 0x1F99
    bit.b #0x04
    beq .8693

    rep #0x20
    lsr.b 0x1C
    sep #0x20
    ldx.b #0x4D
.8693:
    txa
    jsl 0x848F07
    rts

.8699:
    rep #0x20
    lda.w #0xFA80
    cmp.b 0x1C
    bmi .86A4

    sta.b 0x1C
.86A4:
    sep #0x20
    lda.b 0x0F
    bpl .86CB

    lda.b #0x3C
    sta.b 0x6B
    lda.b 0x5E
    bit.b #0x04
    beq .86BD

    lda.b #0x07
    jsl _80888B.88B6
    jmp 0x8195CC

.86BD:
    jsr _819658
    lda.b #0x02
    sta.b 0x03
    lda.b #0x26
    jsl 0x848F07
    rts

.86CB:
    jsl 0x848EEA
    lda.b 0x37
    and.b #0x03
    bit.b 0x5E
    beq .86E3

    jsr _819576
    jsr _819699
    lda.b #0x3C
    sta.b 0x6B
    stz.b 0x0F
.86E3:
    lda.b 0x5E
    bit.b #0x04
    beq .86EF

    stz.b 0x2F
    stz.b 0x1C
    stz.b 0x1D
.86EF:
    jsl update_pos_xy.neg_ay_ax
    lda.b #0x02
    bit.b 0x0F
    bvc .86FB

    lda.b #0x02
.86FB:
    ldx.w 0x1F7A
    ora.w 0x86BAC5,X
    sta.b 0x11
    lda.b 0x0F
    lsr
    bcc .870D

    lda.b #0x00
    jmp 0x819C66

.870D:
    rts

.870E:
    ldx.b 0x03
    jmp (.8713,X)

.8713: d16[.871B, .8745, .8790, .8824]

.871B:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x04
    sta.b 0x4E
    lda.b #0x06
    jsl _80888B.88B6
    lda.b 0x4F
    sta.b 0x69
    stz.b 0x79
    stz.b 0x7A
    lda.b 0x11
    and.b #0x3F
    ora.b 0x69
    sta.b 0x11
    jsr _819DBE
    lda.b #0x1A
    clc
    adc.b 0x6F
    jsl 0x848F07
.8745:
    dec.b 0x4E
    bmi .875D

    lda.b 0x59
    bne .8753

    lda.b 0x3B
    bit.b #0x40
    beq .8758

.8753:
    lda.b #0x1A
    jsr _81942B
.8758:
    lda.b #0x3C
    jmp 0x819560

.875D:
    lda.b #0x04
    sta.b 0x03
    lda.b #0x08
    sta.b 0x4E
    jsr .882D
    jsr _81992A
    rep #0x20
    lda.w #0x0178
    ldx.b 0x56
    beq .877F

    ldx.b 0x6C
    bne .877F

    ldx.b #0x10
    stx.b 0x55
    lda.w #0x0375
.877F:
    sta.b 0x5C
    bit.b 0x68
    bvs .8789

    eor.w #0xFFFF
    inc
.8789:
    sta.b 0x1A
    sep #0x20
    jmp 0x81882D

.8790:
    lda.b 0x59
    bne .879A

    lda.b 0x3B
    bit.b #0x40
    beq .879F

.879A:
    lda.b #0x1A
    jsr _8193A8
.879F:
    lda.b 0x5E
    bit.b #0x08
    beq .87BC

    jsr _819E97
    beq .87B9

    lda.b #0x06
    sta.b 0x03
    lda.b #0x02
    sta.b 0x84
    lda.b #0x0F
    jsl 0x84A333
    rts

.87B9:
    jmp 0x819658

.87BC:
    lda.b 0x3B
    bit.b #0x80
    beq .87FC

    lda.b 0x2C
    bpl .87D0

    and.b #0x40
    tay
    stz.b 0x81
    inc.b 0x81
    jmp 0x819687

.87D0:
    jsl 0x849958
    bcs .87FC

    jsl 0x849A24
    bcc .87FC

    cmp.b #0x3E
    beq .87EE

    cmp.b #0x3F
    beq .87F5

    bvc .87EB

    phy
    jsr _8198F2
    ply
.87EB:
    jmp 0x819687

.87EE:
    lda.b 0x8A
    bne .87EB

    jmp 0x81967C

.87F5:
    lda.b 0x8A
    bne .87EB

    jmp 0x8196CB

.87FC:
    dec.b 0x4E
    bne .881B

    lda.b 0x37
    bit.b #0x80
    beq .8818

    lda.b #0x06
    sta.b 0x02
    lda.b #0x02
    sta.b 0x03
    lda.b #0x03
    clc
    adc.b 0x6F
    jsl 0x848F07
    rts

.8818:
    jmp 0x819658

.881B:
    jsl update_pos_xy.neg_ay_ax
    lda.b #0x3C
    jmp 0x819536

.8824:
    dec.b 0x84
    bne .882C

    lda.b #0x04
    sta.b 0x03
.882C:
    rts

.882D:
    lda.b 0x69
    eor.b #0x40
    sta.b 0x69
    rts

.8834:
    ldx.b 0x03
    jmp (.8839,X)

.8839: d16[.883D, .886A]

.883D:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x07
    jsl _80888B.88B6
    jsr _81992A
    lda.b #0x08
    sta.b 0x77
    lda.b 0x69
    sta.b 0x4E
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    lda.b 0x1C
    sta.b 0x61
    stz.b 0x79
    sep #0x20
    lda.b #0x17
    clc
    adc.b 0x6F
    jsl 0x848F07
.886A:
    lda.b 0x59
    bne .8874

    lda.b 0x3B
    bit.b #0x40
    beq .8879

.8874:
    lda.b #0x17
    jsr _8193A8
.8879:
    lda.b #0x39
    jsr _819536
    lda.b 0x0F
    and.b #0x40
    sta.w 0x0000
    lda.b 0x4E
    eor.w 0x0000
    sta.b 0x69
    lda.b 0x11
    and.b #0x3F
    ora.b 0x69
    sta.b 0x11
    lda.b 0x3B
    bit.b #0x80
    beq .88BC

    lda.b 0x4E
    sta.b 0x4F
    jsr _819CD3
    bne .88A6

    jsr _8198F2
.88A6:
    jsl 0x849A24
    lda.b 0x2C
    bit.b #0x03
    beq .88B4

    lda.b #0x01
    sta.b 0x81
.88B4:
    lda.b 0x4E
    eor.b #0x40
    tay
    jmp 0x819687

.88BC:
    lda.b 0x5E
    bit.b #0x04
    beq .88C5

    jmp 0x8195CC

.88C5:
    lda.b 0x37
    and.b #0x03
    bit.b 0x5E
    beq .88D3

    lda.b 0x2D
    cmp.b #0x36
    bne .88D6

.88D3:
    jmp 0x819658

.88D6:
    lda.b 0x8A
    bne .88EB

    jsr _819CD3
    cmp.b #0x3E
    bne .88E4

    jmp 0x81967C

.88E4:
    cmp.b #0x3F
    bne .88EB

    jmp 0x8196CB

.88EB:
    lda.b 0x61
    sta.b 0x1C
    lda.b 0x62
    sta.b 0x1D
    lda.b 0x77
    beq .88FD

    dec.b 0x77
    stz.b 0x1C
    stz.b 0x1D
.88FD:
    jsl update_pos_xy.no_accel
    jmp 0x819BB5

.8904:
    ldx.b 0x03
    jmp (.8909,X)

.8909: d16[.890D, .8943]

.890D:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x75
    jsr _81992A
    lda.b #0x08
    jsl _80888B.88B6
    jsr _819588
    lda.b #0x13
    clc
    adc.b 0x6F
    jsl 0x848F07
    lda.b #0x10
    sta.b 0x55
    rep #0x20
    lda.w #0x0375
    sta.b 0x5C
    lda.w #0xBB3B
    sta.b 0x20
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    lda.b #0x20
    sta.b 0x52
.8943:
    jsr _819C0B
    lda.b 0x59
    bne .8950

    lda.b 0x3B
    bit.b #0x40
    beq .8955

.8950:
    lda.b #0x13
    jsr _8193A8
.8955:
    lda.b 0x3B
    bit.b #0x80
    beq .8967

    jsl 0x849958
    bcs .8967

    jsr _819E04
    jmp 0x8195E2

.8967:
    lda.b 0x5E
    bit.b #0x04
    bne .8973

    jsr _819E04
    jmp 0x819658

.8973:
    lda.b #0x01
    bit.b 0x69
    bvs .897B

    lda.b #0x02
.897B:
    bit.b 0x5E
    bne .8984

    jsr _819D1A
    bne .8987

.8984:
    jmp 0x819709

.8987:
    jsl update_pos_x
    dec.b 0x52
    bpl .8992

    jmp 0x819709

.8992:
    bit.b 0x0F
    bvc .899B

    lda.b #0x01
    jsr _819C66
.899B:
    lda.b #0x35
    jmp 0x819536

.89A0:
    ldx.b 0x03
    bne .89C1

    inc.b 0x03
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    lda.w #0xA555
    sta.b 0x20
    sep #0x20
    lda.b #0x08
    sta.b 0x4E
    lda.b #0x16
    clc
    adc.b 0x6F
    jsl 0x848F07
.89C1:
    lda.b 0x59
    bne .89CB

    lda.b 0x3B
    bit.b #0x40
    beq .89D0

.89CB:
    lda.b #0x16
    jsr _81942B
.89D0:
    dec.b 0x4E
    bne .89D9

    stz.b 0x4F
    jmp 0x8195CC

.89D9:
    lda.b 0x3B
    bit.b #0x80
    beq .89E2

    jmp 0x8195E2

.89E2:
    lda.b 0x37
    bit.b #0x03
    beq .89EB

    jmp 0x8195D7

.89EB:
    lda.b #0x29
    jmp 0x819560

.89F0:
    ldx.b 0x03
    jmp (.89F5,X)

.89F5: d16[.89FB, .8A1B, .8A39]

.89FB:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x2B
    stz.b 0x2C
    rep #0x20
    stz.b 0x1A
    lda.w #0xF800
    sta.b 0x1C
    sep #0x20
    lda.b #0x0E
    jsl _80888B.88B6
    lda.b #0x47
    jsl 0x848F07
    rts

.8A1B:
    lda.b 0x64
    beq .8A21

    dec.b 0x64
.8A21:
    lda.b 0x5E
    bit.b #0x04
    beq .8A34

    lda.b #0x04
    sta.b 0x03
    stz.b 0x64
    lda.b #0x48
    jsl 0x848F07
    rts

.8A34:
    jsl update_pos_xy.no_accel
    rts

.8A39:
    lda.b 0x0F
    bpl .8A40

    jmp 0x8195CC

.8A40:
    jsl 0x848EEA
    rts

.8A45:
    ldx.b 0x03
    jmp (.8A4A,X)

.8A4A: d16[.8A52, .8A88, .8B02, .8B30]

.8A52:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0x0101
    sta.w 0x1F13
    sta.w 0x1F15
    sta.w 0x1F17
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    sta.w 0x1F19
    jsr _819E85
    stz.b 0x6B
    stz.b 0x58
    lda.b #0x1E
    sta.b 0x8B
    sta.b 0x64
    jsr _819E0E
    jsr _819588
    lda.b #0x44
    jsl 0x848F07
.8A87:
    rts

.8A88:
    lda.b 0x8B
    cmp.b #0x02
    bne .8A92

    lda.b #0x0E
    trb.b 0x11
.8A92:
    dec.b 0x8B
    bne .8A87

    lda.b #0x04
    sta.b 0x03
    lda.b #0x0A
    jsl _80888B.88B6
    stz.b 0x19
    stz.b 0x0E
    stz.w 0x0C38
    stz.w 0x0C58
    stz.w 0x0C78
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F15
    stz.w 0x1F16
    stz.w 0x1F17
    stz.w 0x1F18
    stz.w 0x1F19
    lda.b #0x3C
    sta.b 0x4F
    lda.b #0xA0
    sta.b 0x8B
    ldy.b #0x04
    jsl _808A64
    stz.w 0x0000
.8AD3:
    rep #0x10
    ldy.w #0x0007
.8AD8:
    jsl 0x8282D3
    bne .8AFF

    inc.w 0x0000,X
    lda.b #0x0E
    sta.w 0x000A,X
    tya
    clc
    adc.w 0x0000
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dey
    bpl .8AD8

.8AFF:
    sep #0x10
    rts

.8B02:
    dec.b 0x4F
    bne .8B0D

    lda.b #0x03
    sta.b 0x4F
    jsr _819C85
.8B0D:
    lda.b 0x8B
    cmp.b #0x01
    bcc .8B1F

    and.b #0x1F
    bne .8B1F

    lda.b #0x08
    sta.w 0x0000
    jsr .8AD3
.8B1F:
    dec.b 0x8B
    bne .8B30

    lda.b #0x06
    sta.b 0x03
    inc.w 0x1F0B
    stz.w 0x1F0E
    stz.w 0x1F0F
.8B30:
    rts

.8B31:
    ldx.b 0x03
    bne .8B3E

    inc.b 0x03
    lda.b #0x45
    jsl 0x848F07
    rts

.8B3E:
    jsl 0x848EEA
    rts

.8B43:
    rts

.8B44:
    lda.b 0x2F
    bne .8B43

    jsl 0x848EEA
    rts

.8B4D:
    ldx.b 0x03
    jmp (.8B52,X)

.8B52: d16[.8B58, .8B7C, .8B94]

.8B58:
    lda.b #0x22
    sta.b 0x6F
    lda.b 0x5E
    bit.b #0x04
    bne .8B6F

    lda.b #0x02
    sta.b 0x03
    lda.b #0x28
    jsl 0x848F07
    jmp 0x81992A

.8B6F:
    lda.b #0x04
    sta.b 0x03
    stz.b 0x2F
    lda.b #0x22
    jsl 0x848F07
    rts

.8B7C:
    lda.b 0x5E
    bit.b #0x04
    beq .8B8F

    lda.b #0x04
    sta.b 0x03
    stz.b 0x2F
    lda.b #0x22
    jsl 0x848F07
    rts

.8B8F:
    jsl update_pos_xy.neg_ay_ax
    rts

.8B94:
    lda.b 0x02
    cmp.b #0x46
    beq .8BA2

    lda.b 0x5E
    bit.b #0x04
    bne .8BA2

    stz.b 0x03
.8BA2:
    jsl 0x848EEA
    rts

.8BA7:
    ldx.b 0x03
    jmp (.8BAC,X)

.8BAC: d16[.8BBC, .8C25, .8C35, .8C8B, .8CAA, .8CD1, .8CF1, .8D17]

.8BBC:
    rep #0x20
    lda.w #0xFFE0
    sta.w 0x1E70
    sta.w 0x1E74
    lda.w #0x0120
    sta.w 0x1E72
    sta.w 0x1E76
    sep #0x20
    inc.b 0x30
    jsr _819E85
    stz.b 0x5B
    lda.b 0x2B
    bit.b #0x04
    bne .8BF1

    lda.b #0x02
    sta.b 0x03
    rep #0x20
    jsr _81992A
    sep #0x20
    lda.b #0x28
    jsl 0x848F07
    rts

.8BF1:
    lda.b #0x04
    sta.b 0x03
    rep #0x20
    ldx.b #0x00
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    cmp.w #0x0080
    bpl .8C06

    ldx.b #0x40
.8C06:
    stx.b 0x69
    lda.w #0x0178
    bit.b 0x68
    bvs .8C12

    lda.w #0xFE88
.8C12:
    sta.b 0x1A
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    jsr _819588
    lda.b #0x2B
    jsl 0x848F07
    rts

.8C25:
    lda.b 0x2B
    bit.b #0x04
    beq .8C30

    stz.b 0x03
    stz.b 0x2F
    rts

.8C30:
    jsl update_pos_xy.neg_ay_ax
    rts

.8C35:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    sec
    sbc.w #0x0080
    bpl .8C47

    eor.w #0xFFFF
    inc
.8C47:
    cmp.w #0x0002
    sep #0x20
    bpl .8C82

    lda.b #0x06
    sta.b 0x03
    sta.b 0x64
    lda.l 0x001F26
    beq .8C6B

    lda.w 0x1F7A
    cmp.b #0x09
    bcs .8C73

    lda.w 0x1FA0
    bne .8C6B

    lda.w 0x1F7A
    bne .8C73

.8C6B:
    lda.b #0x20
    sta.b 0x8B
    stz.b 0x8C
    bra .8C7B

.8C73:
    lda.b #0x68
    sta.b 0x8B
    lda.b #0x01
    sta.b 0x8C
.8C7B:
    lda.b #0x22
    jsl 0x848F07
    rts

.8C82:
    jsl update_pos_x
    jsl 0x848EEA
    rts

.8C8B:
    lda.b #0x08
    sta.b 0x03
    lda.l 0x001F26
    beq .8CA9

    lda.w 0x1F7A
    beq .8CA9

    cmp.b #0x09
    bcs .8CA3

    lda.w 0x1FA0
    bne .8CA9

.8CA3:
    lda.b #0x21
    jsl _80878B
.8CA9:
    rts

.8CAA:
    rep #0x20
    dec.b 0x8B
    sep #0x20
    bne .8CD0

    lda.l 0x001F26
    beq .8CD5

    lda.w 0x1F7A
    beq .8CD5

    cmp.b #0x09
    bcs .8CC6

    lda.w 0x1FA0
    bne .8CD5

.8CC6:
    lda.b #0x0A
    sta.b 0x03
    lda.b #0x4E
    jsl 0x848F07
.8CD0:
    rts

.8CD1:
    lda.b 0x0F
    bpl .8CE0

.8CD5:
    lda.b #0x0C
    sta.b 0x03
    lda.b #0x49
    jsl 0x848F07
    rts

.8CE0:
    lsr
    bcc .8CEC

    lda.b #0x2D
    jsl _80888B.88B6
    jsr _819A89
.8CEC:
    jsl 0x848EEA
    rts

.8CF1:
    lda.b 0x0F
    bpl .8D12

    lda.b #0x0E
    sta.b 0x03
    inc.b 0x64
    lda.b #0x0F
    jsl _80888B.88B6
    rep #0x20
    stz.b 0x1A
    lda.w #0x0AA6
    sta.b 0x1C
    sep #0x20
    lda.b #0x47
    jsl 0x848F07
.8D12:
    jsl 0x848EEA
.8D16:
    rts

.8D17:
    jsl update_pos_xy.no_accel
    jsl 0x82806E
    bcc .8D16

    lda.b #0xFF
    sta.w 0x1F23
    jmp 0x8196C2

.8D29:
    ldx.b 0x03
    bne .8D59

    inc.b 0x03
    rep #0x21
    lda.b 0x86
    and.w #0x00FF
    bit.w #0x0080
    beq .8D3E

    ora.w #0xFF00
.8D3E:
    adc.b 0x05
    sta.b 0x05
    lda.b 0x05
    and.w #0xFFF0
    clc
    adc.w #0x0008
    sta.b 0x05
    stz.b 0x79
    sep #0x20
    stz.b 0x50
    lda.b #0x40
    jsl 0x848F07
.8D59:
    lda.b 0x0F
    bpl .8D64

    lda.b 0x4E
    sta.b 0x02
    stz.b 0x03
    rts

.8D64:
    lda.b #0x40
    jmp 0x819560

.8D69:
    ldx.b 0x03
    bne .8D8E

    inc.b 0x03
    rep #0x21
    lda.b 0x08
    and.w #0xFFF0
    adc.w #0xFFF9
    sta.b 0x08
    lda.w #0x0200
    sta.b 0x1C
    sep #0x20
    stz.b 0x50
    lda.b #0x04
    sta.b 0x4E
    lda.b #0x41
    jsl 0x848F07
.8D8E:
    jsl update_pos_y
    lda.b 0x4E
    bne .8DA8

    stz.b 0x1C
    stz.b 0x1D
    lda.b 0x0F
    bpl .8DA3

    stz.b 0x64
    jmp 0x8195CC

.8DA3:
    lda.b #0x41
    jmp 0x819560

.8DA8:
    dec.b 0x4E
    rts

.8DAB:
    ldx.b 0x03
    bne .8DC7

    inc.b 0x03
    rep #0x21
    lda.b 0x05
    and.w #0xFFF0
    adc.w #0x0008
    sta.b 0x05
    sep #0x20
    stz.b 0x50
    lda.b #0x42
    jsl 0x848F07
.8DC7:
    lda.b 0x0F
    bpl .8DDC

    rep #0x21
    lda.b 0x08
    adc.w #0x0018
    sta.b 0x08
    sep #0x20
    jsr _819700
    jmp 0x818DE1

.8DDC:
    lda.b #0x42
    jmp 0x819560

.8DE1:
    ldx.b 0x03
    bne .8E04

    inc.b 0x03
    inc.b 0x64
    stz.b 0x5E
    stz.b 0x2B
    stz.b 0x2C
    jsr _81992A
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    sep #0x20
    lda.b #0x21
    clc
    adc.b 0x6F
    jsl 0x848F07
.8E04:
    lda.b 0x59
    bne .8E0E

    lda.b 0x3B
    bit.b #0x40
    beq .8E16

.8E0E:
    jsr _819576
    lda.b #0x21
    jsr _81942B
.8E16:
    rep #0x10
    stz.b 0x1C
    stz.b 0x1D
    ldx.w #0xFE88
    lda.b 0x37
    bit.b #0x0C
    beq .8E2E

    bit.b #0x04
    bne .8E2C

    ldx.w #0x0178
.8E2C:
    stx.b 0x1C
.8E2E:
    sep #0x10
    stz.b 0x29
    stz.b 0x2A
    jsr _819D70
    cmp.b #0x00
    beq .8E4E

    cmp.b #0x13
    bne .8E48

    lda.b 0x37
    bit.b #0x08
    beq .8E48

    jmp 0x8196EE

.8E48:
    lda.b 0x3B
    bit.b #0x80
    beq .8E53

.8E4E:
    stz.b 0x64
    jmp 0x819658

.8E53:
    lda.b #0x10
    sta.b 0x2A
    jsr _819D70
    cmp.b #0x3B
    bne .8E63

    stz.b 0x64
    jmp 0x8195CC

.8E63:
    lda.b 0x50
    bpl .8E6F

    lda.b 0x1D
    beq .8E74

    jsl update_pos_y
.8E6F:
    lda.b #0x43
    jmp 0x819560

.8E74:
    rts

.8E75:
    ldx.b 0x03
    bne .8E81

    inc.b 0x03
    lda.b 0x7B
    jsl 0x848F07
.8E81:
    jsl 0x848EEA
    rts

.8E86:
    ldx.b 0x03
    jmp (.8E8B,X)

.8E8B: d16[.8E91, .8EBF, .8F28]

.8E91:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x08
    sta.b 0x2F
    lda.w 0x1F7A
    cmp.b #0x09
    bne .8EA4

    lda.b #0x40
    sta.b 0x69
.8EA4:
    stz.b 0x5B
    stz.b 0x58
    jsr _819E85
    lda.b #0x97
    sta.b 0x31
    lda.b #0xA5
    sta.b 0x32
    jsr _819588
    lda.b #0x44
    jsl 0x848F07
    jmp 0x81992A

.8EBF:
    lda.b 0x0F
    bpl .8EED

    lda.b 0x5E
    bit.b #0x04
    beq .8EED

    lda.b #0x07
    jsl _80888B.88B6
    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    tsb.b 0x11
    lda.b #0x80
    tsb.b 0x7E
    jsr _8195AA
    lda.b #0x86
    sta.b 0x31
    lda.b #0xA8
    sta.b 0x32
    lda.b #0x00
    jsl 0x848F07
    rts

.8EED:
    jsl 0x848EEA
    lda.b 0x5E
    bit.b #0x04
    beq .8EFD

    stz.b 0x2F
    stz.b 0x1C
    stz.b 0x1D
.8EFD:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.w #0xFA80
    cmp.b 0x1C
    bmi .8F0C

    sta.b 0x1C
.8F0C:
    sep #0x20
    lda.b #0x02
    bit.b 0x0F
    bvc .8F16

    lda.b #0x00
.8F16:
    ldx.w 0x1F7A
    ora.w 0x86BAC5,X
    sta.b 0x11
    lda.b 0x0F
    lsr
    bcc .8F28

    lda.b #0x00
    jmp 0x819C66

.8F28:
    rts

.8F29:
    ldx.b 0x03
    bne .8F40

    inc.b 0x03
    jsr _8195AA
    lda.b #0x86
    sta.b 0x31
    lda.b #0xA8
    sta.b 0x32
    lda.b #0x00
    jsl 0x848F07
.8F40:
    rts

.8F41:
    ldx.b 0x03
    bne .8F4D

    inc.b 0x03
    lda.b #0x02
    jsl 0x848F07
.8F4D:
    rts

.8F4E:
    ldx.b 0x03
    jmp (.8F53,X)

.8F53: d16[.8F5B, .8F78, .8F8D, .8FB3]

.8F5B:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x30
    rep #0x20
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    lda.b #0x05
    sta.b 0x8B
    jsr _819588
    lda.b #0x4E
    jsl 0x848F07
    rts

.8F78:
    dec.b 0x8B
    bne .8F8C

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    sta.b 0x8B
    jsl 0x84A28B
    jml 0x81A02D

.8F8C:
    rts

.8F8D:
    dec.b 0x8B
    bne .8FB2

    lda.b #0x02
    sta.b 0x8B
    lda.b #0x0C
    jsl _80888B.88B6
    inc.b 0x27
    lda.b 0x27
    cmp.w 0x1F9A
    bcc .8FAE

    lda.b #0x06
    sta.b 0x03
    lda.b #0x22
    jsl 0x848F07
.8FAE:
    lda.b #0x80
    tsb.b 0x27
.8FB2:
    rts

.8FB3:
    rts

.8FB4:
    ldx.b 0x03
    jmp (.8FB9,X)

.8FB9: d16[.8FBF, .8FDE, .8FF2]

.8FBF:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x30
    stz.b 0x6E
    rep #0x20
    lda.w #0xA597
    sta.b 0x31
    sep #0x20
    lda.b #0xC8
    sta.b 0x8B
    jsr _819588
    lda.b #0x22
    jsl 0x848F07
    rts

.8FDE:
    dec.b 0x8B
    bne .8FED

    lda.b #0x04
    sta.b 0x03
    lda.b #0x3C
    sta.b 0x8B
    stz.b 0x8C
    rts

.8FED:
    lda.b #0x40
    tsb.b 0x8C
    rts

.8FF2:
    dec.b 0x8B
    bne .8FFF

    stz.w 0x1F31
    stz.w 0x1F3B
    jmp 0x8195CC

.8FFF:
    lda.b 0x59
    beq .9008

    lda.b #0x00
    jsr _81942B
.9008:
    lda.b #0x22
    jmp 0x819560

.900D:
    ldx.b 0x03
    jmp (.9012,X)

.9012: d16[.9018, .9025, .9045]

.9018:
    lda.b #0x02
    sta.b 0x03
    stz.b 0x50
    lda.b #0x4F
    jsl 0x848F07
    rts

.9025:
    lda.b 0x0F
    bpl .9040

    lda.b #0x04
    sta.b 0x03
    lda.b #0x50
    jsl 0x848F07
    lda.b 0x33
    bne .9040

    lda.b #0xAF
    jsl _80888B.88B6
    jmp 0x81A10A

.9040:
    jsl 0x848EEA
    rts

.9045:
    lda.b 0x0F
    bpl .904C

    jmp 0x8195CC

.904C:
    jsl 0x848EEA
    rts

.9051:
    ldx.b 0x03
    jmp (.9056,X)

.9056: d16[.9062, .9093, .90DE, .912B, .914B, .917B]

.9062:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    stz.b 0x36
    stz.b 0x38
    stz.b 0x3A
    lda.w #0x00C0
    sta.w 0x1E74
    lda.w #0x00C0
    sta.w 0x1E76
    lda.w #0xFED0
    sta.b 0x1A
    sep #0x20
    lda.b #0x2B
    jsl 0x848F07
    lda.b #0xDF
    jsl _80E9F6
    lda.b #0x01
    sta.w 0x1F34
    rts

.9093:
    lda.w 0x0060
    bne .90BE

    rep #0x20
    lda.w 0x1E4D
    sta.w 0x1E5E
    lda.w #0xFC8B
    sta.b 0x1A
    sep #0x20
    lda.b #0x04
    sta.b 0x03
    lda.b #0x40
    sta.b 0x8C
    stz.b 0x75
    lda.b #0x08
    jsl _80888B.88B6
    lda.b #0x35
    jsl 0x848F07
    rts

.90BE:
    lda.w 0x1F3C
    cmp.b #0x0C
    bne .90CD

    ldy.b #0x01
    lda.b #0xF6
    jsl _808850.8868
.90CD:
    cmp.b #0x0D
    bne .90D5

    lda.b #0x40
    sta.b 0x8C
.90D5:
    jsl update_pos_x
    jsl 0x848EEA
    rts

.90DE:
    lda.b #0x40
    sta.b 0x8C
    rep #0x21
    lda.w 0x1E4D
    adc.w #0x0088
    cmp.b 0x05
    sep #0x20
    bcc .9116

    lda.b #0x06
    sta.b 0x03
    stz.b 0x8C
    stz.b 0x37
    lda.b #0x15
    jsl 0x848F07
    lda.b #0x05
    jsl _80888B.88B6
    stz.w 0x00C9
    lda.b #0x2F
    sta.w 0x00CA
    stz.w 0x00CB
    stz.w 0x00CC
    stz.w 0x00CD
    rts

.9116:
    jsr _819C0B
    jsl update_pos_x
    bit.b 0x0F
    bvc .9126

    lda.b #0x01
    jsr _819C66
.9126:
    jsl 0x848EEA
    rts

.912B:
    lda.w 0x0B9C
    lsr
    bcc .914A

    inc.w 0x00CB
    inc.w 0x00CC
    inc.w 0x00CD
    lda.w 0x00CD
    cmp.b #0x1F
    bne .914A

    lda.b #0x08
    sta.b 0x03
    lda.b #0x04
    tsb.w 0x00A2
.914A:
    rts

.914B:
    lda.w 0x00CB
    bne .916C

    lda.b #0x0A
    sta.b 0x03
    lda.b #0x80
    sta.w 0x00C9
    lda.b #0xA0
    sta.w 0x00CA
    lda.b #0x1F
    sta.w 0x00CB
    sta.w 0x00CC
    sta.w 0x00CD
    jmp 0x81A11D

.916C:
    lda.w 0x0B9C
    lsr
    bcc .917B

    dec.w 0x00CB
    dec.w 0x00CC
    dec.w 0x00CD
.917B:
    rts

.917C:
    ldx.b 0x03
    jmp (.9181,X)

.9181: d16[.918B, .919B, .91B1, .91C7, .91D8]

.918B:
    lda.w 0x1F3C
    beq .919A

    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    jsl 0x848F07
.919A:
    rts

.919B:
    lda.w 0x1F3C
    cmp.b #0x02
    bne .91AC

    lda.b #0x04
    sta.b 0x03
    lda.b #0x01
    jsl 0x848F07
.91AC:
    jsl 0x848EEA
    rts

.91B1:
    lda.w 0x1F3C
    cmp.b #0x03
    bne .91C2

    lda.b #0x06
    sta.b 0x03
    lda.b #0x03
    jsl 0x848F07
.91C2:
    jsl 0x848EEA
    rts

.91C7:
    lda.w 0x1F3C
    cmp.b #0x05
    bne .91D8

    lda.b #0x08
    sta.b 0x03
    lda.b #0x04
    jsl 0x848F07
.91D8:
    jsl 0x848EEA
    rts

.91DD:
    ldx.b 0x03
    jmp (.91E2,X)

.91E2: d16[.91E8, .91F3, .922D]

.91E8:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x49
    jsl 0x848F07
    rts

.91F3:
    lda.b 0x0F
    bpl .9228

    lda.b #0x04
    sta.b 0x03
    sta.b 0x64
    sta.b 0x30
    lda.b #0x0F
    jsl _80888B.88B6
    rep #0x20
    stz.b 0x1A
    lda.w #0x0AA6
    sta.b 0x1C
    lda.w 0x1E4D
    sta.w 0x1E5E
    sta.w 0x1E60
    lda.w 0x1E50
    sta.w 0x1E68
    sta.w 0x1E6E
    sep #0x20
    lda.b #0x47
    jsl 0x848F07
.9228:
    jsl 0x848EEA
.922C:
    rts

.922D:
    jsl update_pos_y
    jsl 0x82806E
    bcc .922C

    lda.b #0xFF
    sta.w 0x1F23
    jmp 0x8196C2

.923F:
    ldx.b 0x03
    jmp (.9244,X)

.9244: d16[.924E, .9271, .929D, .92BE, .92CE]

.924E:
    lda.b #0x09
    jsl _80888B.88B6
    lda.b #0x4A
    jsl 0x848F07
    lda.b #0x80
    tsb.b 0x87
    jsr _81992A
    lda.b 0x5E
    bit.b #0x04
    beq .926C

    lda.b #0x08
    sta.b 0x03
    rts

.926C:
    lda.b #0x02
    sta.b 0x03
    rts

.9271:
    lda.b 0x5E
    bit.b #0x04
    beq .9294

    lda.b #0x04
    sta.b 0x03
    lda.b #0x4B
    jsl 0x848F07
    lda.b #0x07
    jsl _80888B.88B6
    rep #0x20
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    lsr
    sta.b 0x1C
    sep #0x20
.9294:
    jsl update_pos_xy.neg_ay_ax
    jsl 0x848EEA
    rts

.929D:
    lda.b 0x5E
    bit.b #0x04
    beq .92B5

    lda.b #0x06
    sta.b 0x03
    lda.b #0x07
    jsl _80888B.88B6
    stz.b 0x2F
    lda.b #0x4C
    jsl 0x848F07
.92B5:
    jsl update_pos_xy.neg_ay_ax
    jsl 0x848EEA
    rts

.92BE:
    dec.b 0x85
    bne .92C9

    lda.b #0x80
    trb.b 0x87
    jmp 0x8195CC

.92C9:
    jsl 0x848EEA
    rts

.92CE:
    lda.b 0x0F
    bpl .92E4

    lda.b #0x04
    sta.b 0x03
    lda.b #0x4B
    jsl 0x848F07
    lda.b #0x60
    sta.b 0x1C
    lda.b #0x03
    sta.b 0x1D
.92E4:
    jsl 0x848EEA
    rts

.92E9:
    ldx.b 0x03
    bne .92F6

    inc.b 0x03
    lda.b #0x4E
    jsl 0x848F07
    rts

.92F6:
    lda.b 0x0F
    bpl .92FD

    jmp 0x8195CC

.92FD:
    lsr
    bcc .9309

    lda.b #0x2D
    jsl _80888B.88B6
    jsr _819A89
.9309:
    jsl 0x848EEA
    rts

.930E:
    ldx.b 0x03
    jmp (.9313,X)

.9313: d16[.931D, .9339, .9349, .9377, .93A7]

.931D:
    lda.b #0x22
    sta.b 0x6F
    lda.b 0x5E
    bit.b #0x04
    bne .9334

    lda.b #0x02
    sta.b 0x03
    lda.b #0x28
    jsl 0x848F07
    jmp 0x81992A

.9334:
    lda.b #0x04
    sta.b 0x03
    rts

.9339:
    lda.b 0x5E
    bit.b #0x04
    beq .9344

    lda.b #0x04
    sta.b 0x03
    rts

.9344:
    jsl update_pos_xy.neg_ay_ax
    rts

.9349:
    lda.b #0x06
    sta.b 0x03
    stz.b 0x2F
    lda.b #0x2B
    jsl 0x848F07
    rep #0x30
    ldx.w #0x0178
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    cmp.w #0x0030
    bcc .9368

    ldx.w #0xFE88
.9368:
    stx.b 0x1A
    sep #0x30
    lda.b #0x00
    bit.b 0x1B
    bmi .9374

    lda.b #0x40
.9374:
    sta.b 0x69
    rts

.9377:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    sec
    sbc.w #0x0030
    bpl .9389

    eor.w #0xFFFF
    inc
.9389:
    cmp.w #0x0002
    sep #0x20
    bcs .939F

    lda.b #0x08
    sta.b 0x03
    lda.b #0x22
    jsl 0x848F07
    lda.b #0x40
    sta.b 0x69
    rts

.939F:
    jsl update_pos_x
    jsl 0x848EEA
.93A7:
    rts

;-----

_8193A8:
    sta.w 0x0000
    lda.b 0x35
    cmp.b 0x67
    bcs .9426

    lda.w 0x1F0D
    bne .9426

    lda.b 0x33
    cmp.b #0x08
    bne .93C0

    lda.b 0x7D
    bne .9426

.93C0:
    jsl 0x82833E
    bne .9426

    jsr _8194A5
    beq .9426

    inc
    sta.w 0x1F0D
    jsr _819FFA
    bit.b 0x87
    bvc .93E0

    lda.b #0x40
    trb.b 0x87
    lda.b #0x17
    jsl _80888B.88B6
.93E0:
    stz.b 0x59
    lda.b 0x3D
    bne .9426

    inc.b 0x35
    inc.w 0x0000,X
    stz.w 0x000B,X
    jsr _819D3D
    lda.w 0x1F0D
    and.b #0xFF
    tay
    lda 0x86BB22,Y
    beq .9426

    lda.b #0x10
    sta.b 0x50
    stz.b 0x6F
    lda.b 0x13
    sta.w 0x0001
    phx
    lda.b 0x0F
    and.b #0x0F
    clc
    adc.w 0x0000
    jsl 0x848F07
    plx
    lda.b 0x0F
    and.b #0x0F
    clc
    adc.w 0x0000
    asl
    sta.w 0x003C,X
    lda.w 0x0001
    sta.b 0x13
.9426:
    sep #0x10
    stz.b 0x59
    rts

;-----

_81942B:
    sta.w 0x0000
    lda.l _809D9D.9E5E ;could this be a copy protection check?
    cmp.l _81812E.853A
    beq .943D

    lda.b #0x80
    tsb.w 0x1F9E
.943D:
    lda.b 0x35
    cmp.b 0x67
    bcs .94A0

    lda.w 0x1F0D
    bne .94A0

    lda.b 0x33
    cmp.b #0x08
    bne .9452

    lda.b 0x7D
    bne .94A0

.9452:
    jsl 0x82833E
    bne .94A0

    jsr _8194A5
    beq .94A0

    inc
    sta.w 0x1F0D
    jsr _819FFA
    bit.b 0x87
    bvc .9472

    lda.b #0x40
    trb.b 0x87
    lda.b #0x17
    jsl _80888B.88B6
.9472:
    lda.b 0x3D
    bne .94A0

    inc.b 0x35
    inc.w 0x0000,X
    stz.w 0x000B,X
    jsr _819D3D
    lda.w 0x1F0D
    and.b #0xFF
    tay
    lda 0x86BB22,Y
    beq .94A0

    lda.b #0x10
    sta.b 0x50
    stz.b 0x6F
    lda.w 0x0000
    asl
    sta.w 0x003C,X
    lda.w 0x0000
    jsl 0x848F07
.94A0:
    sep #0x10
    stz.b 0x59
    rts

;-----

_8194A5:
    lda.b 0x59
    beq .94B4

    cmp.b #0x01
    beq .94B4

    lda.b 0x7D
    beq .94B4

    lda.b #0x00
    rts

.94B4:
    txy
    lda.b 0x59
    lsr
    tax
    lda.w 0x86BA79,X
    sta 0x000A,Y
    bne .94CE

    lda.b 0x55
    beq .94CE

    lda.b 0x63
    bne .94CE

    lda.b #0x06
    sta 0x000A,Y
.94CE:
    lda.b 0x33
    beq .952F

    rep #0x20
    ldx.b 0x33
    lda.w 0x1F85,X
    bit.w #0x3F00
    beq .9533

    and.w #0x3FFF
    sec
    sbc.w 0x86BA95,X
    bpl .94EA

    lda.w #0x0000
.94EA:
    ora.w #0xC000
    sta.w 0x1F85,X
    stz.w 0x0004
    lda.b 0x59
    and.w #0x00FF
    cmp.w #0x0004
    bne .9518

    lda.w 0x1F85,X
    and.w #0x3FFF
    sec
    sbc.w 0x86BAA7,X
    bpl .950C

    lda.w #0x0000
.950C:
    ora.w #0xC000
    sta.w 0x1F85,X
    lda.w #0x0009
    sta.w 0x0004
.9518:
    sep #0x20
    lda.b 0x33
    cmp.b #0x02
    bne .9524

    tyx
    stz.w 0x000B,X
.9524:
    lsr
    clc
    adc.b #0x06
    clc
    adc.w 0x0004
    sta 0x000A,Y
.952F:
    lda 0x000A,Y
    tyx
.9533:
    sep #0x20
    rts

;-----

_819536:
    sta.w 0x0000
    lda.b 0x50
    bmi .955B

    dec.b 0x50
    bpl .955B

    lda.b #0x22
    sta.b 0x6F
    lda.b 0x13
    sta.w 0x0001
    lda.b 0x0F
    and.b #0x0F
    clc
    adc.w 0x0000
    jsl 0x848F07
    lda.w 0x0001
    sta.b 0x13
.955B:
    jsl 0x848EEA
    rts

;-----

_819560:
    ldx.b 0x50
    bmi .9571

    dec.b 0x50
    bpl .9571

    jsl 0x848F07
    lda.b #0x22
    sta.b 0x6F
    rts

.9571:
    jsl 0x848EEA
    rts

;-----

_819576:
    lda.b 0x37
    bit.b #0x02
    beq .957F

    stz.b 0x69
    rts

.957F:
    bit.b #0x01
    beq .9587

    lda.b #0x40
    sta.b 0x69
.9587:
    rts

;-----

_819588:
    ldx.b #0x00
    lda.w 0x1F99
    bit.b #0x01
    beq .9593

    ldx.b #0x18
.9593:
    stx.b 0x16
    lda.b #0x5D
    sta.w 0x0C48
    sta.w 0x0C68
    sta.w 0x0C88
    stz.w 0x0C39
    stz.w 0x0C59
    stz.w 0x0C79
    rts

;-----

_8195AA:
    ldx.b #0x66
    lda.w 0x1F99
    bit.b #0x01
    beq .95B5

    ldx.b #0xA4
.95B5:
    stx.b 0x16
    lda.b #0xA5
    sta.w 0x0C48
    sta.w 0x0C68
    sta.w 0x0C88
    stz.w 0x0C39
    stz.w 0x0C59
    stz.w 0x0C79
    rts

;-----

_8195CC:
    sep #0x30
    stz.b 0x55
    stz.b 0x2F
    stz.b 0x02
    stz.b 0x03
    rts

;-----

_8195D7:
    sep #0x30
    stz.b 0x55
    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_8195E2:
    sep #0x30
    lda.b #0x08
    sta.b 0x2F
    lda.b 0x02
    cmp.b #0x04
    beq .9614

    lda.b 0x55
    bne .9646

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    jsr _81992A
    rep #0x20
    lda.w #0x0178
    sta.b 0x5C
    lda.l 0x81853B
    cmp.w #0x1F9E
    beq .9611

    lda.w #0x0080
    tsb.w 0x1F9E
.9611:
    sep #0x20
    rts

.9614:
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    rep #0x20
    lda.b 0x1A
    bpl .9624

    eor.w #0xFFFF
    inc
.9624:
    sta.b 0x5C
    cmp.w #0x01C8
    beq .9635

    cmp.w #0x0198
    beq .963A

    sep #0x20
    jmp 0x81992A

.9635:
    lda.w #0x0621
    bra .963D

.963A:
    lda.w #0x05C9
.963D:
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    rts

.9646:
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    rep #0x20
    lda.w #0x0375
    sta.b 0x5C
    sep #0x20
    jmp 0x81992A

;-----

_819658:
    sep #0x30
    lda.b #0x08
    sta.b 0x02
    stz.b 0x03
    lda.b #0x08
    sta.b 0x2F
    rts

;-----

_819665:
    sep #0x30
    lda.w 0x1F9E
.966A:
    bpl .966F

    stz.w 0x1F81
.966F:
    stz.b 0x55
    stz.b 0x6C
    lda.b #0x0A
    sta.b 0x02
    stz.b 0x03
    stz.b 0x2F
    rts

;-----

_81967C:
    sep #0x30
    stz.b 0x6C
    lda.b #0x0E
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_819687:
    sep #0x30
    stz.b 0x55
    stz.b 0x6C
    tya
    eor.b #0x40
    sta.b 0x4F
    lda.b #0x10
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_819699:
    sep #0x30
    lda.w 0x1F9E
    bpl .96AC

    lda.b 0x27
    cmp.b #0x01
    beq .96AC

    dec.b 0x27
    lda.b #0x80
    tsb.b 0x27
.96AC:
    stz.b 0x55
    stz.b 0x2F
    stz.b 0x6C
    lda.b #0x12
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_8196B9:
    sep #0x30
    lda.b #0x14
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_8196C2:
    sep #0x30
    lda.b #0x18
    sta.b 0x02
    stz.b 0x03
.96CA:
    rts

;-----

_8196CB:
    sep #0x30
    lda.b #0x80
    sta.b 0x27
    stz.b 0x6C
    lda.b #0x0C
    sta.b 0x02
    stz.b 0x03
    sta.b 0x30
    rts

;-----

_8196DC:
    sep #0x30
    lda.b #0x1A
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_8196E5:
    sep #0x30
    lda.b #0x24
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_8196EE:
    sep #0x30
    lda.b #0x26
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_8196F7:
    sep #0x30
    lda.b #0x28
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_819700:
    sep #0x30
    lda.b #0x2A
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_819709:
    sep #0x30
    lda.b #0x20
    sta.b 0x02
    stz.b 0x03
    rts

;-----

_819712:
    lda.w 0x1F99
    bit.b #0x08
    beq _8196C2.96CA

    lda.w 0x1F23
    bne _8196C2.96CA

    ldx.b 0x54
    jmp (.9723,X)

.9723: d16[.9727, .9738]

.9727:
    lda.b 0x3B
    and.b #0x03
    beq .9737

    sta.b 0x53
    lda.b #0x02
    sta.b 0x54
    lda.b #0x0C
    sta.b 0x51
.9737:
    rts

.9738:
    lda.b 0x53
    bit.b 0x3B
    beq .9766

    lda.b 0x02
    cmp.b #0x02
    beq .9748

    cmp.b #0x08
    bne .9757

.9748:
    lda.b 0x2C
    bmi .9752

    jsl 0x849A24
    bcc .9757

.9752:
    lda.b #0x0A
    sta.b 0x56
    rts

.9757:
    jsr _81976D
    bne .9766

    jsr _819576
    lda.b #0x40
    trb.b 0x7E
    jmp 0x8196B9

.9766:
    dec.b 0x51
    bne .976C

    stz.b 0x54
.976C:
    rts

;-----

_81976D:
    lda.b 0x02
    beq .9780

    cmp.b #0x02
    beq .9780

    cmp.b #0x04
    beq .9780

    cmp.b #0x0A
    beq .9780

.977D:
    lda.b #0x01
    rts

.9780:
    jsl 0x8499AF
    bcs .977D

    lda.b #0x00
.9788:
    rts

;-----

_819789:
    lda.w 0x1F99
    bit.b #0x08
    beq _81976D.9788

    lda.w 0x1F23
    bne _81976D.9788

    lda.b 0x3A
    bit.b #0x80
    beq _81976D.9788

    lda.b 0x02
    cmp.b #0x02
    beq .97AD

    cmp.b #0x08
    beq .97AD

    cmp.b #0x10
    beq .97AD

    cmp.b #0x12
    bne .97BC

.97AD:
    lda.b 0x2C
    bmi .97B7

    jsl 0x849A24
    bcc .97BC

.97B7:
    lda.b #0x0A
    sta.b 0x56
    rts

.97BC:
    jsr _81976D
    bne _81976D.9788

    lda.b #0x40
    tsb.b 0x7E
    jmp 0x8196B9

;-----

_8197C8:
    lda.b 0x7D
    bne .97F8

    lda.b 0x27
    beq .97F8

    lda.w 0x1F99
    bit.b #0x02
    bne .97DB

    lda.b 0x33
    bne .97E4

.97DB:
    lda.b 0x7C
    bne .97E4

    lda.w 0x1F23
    beq .97F9

.97E4:
    bit.b 0x87
    bvc .97F2

    lda.b #0x40
    trb.b 0x87
    lda.b #0x17
    jsl _80888B.88B6
.97F2:
    stz.b 0x58
    stz.b 0x5B
    stz.b 0x5A
.97F8:
    rts

.97F9:
    lda.b 0x5B
    beq .9831

    lda.b 0x0E
    beq .9831

    dec.b 0x5A
    bne .9831

    lda.b #0x02
    sta.b 0x5A
    ldx.b 0x82
    rep #0x30
    ldy.w 0x86BAD5,X
    beq .981B

    ldx.w #0x0010
    jsl 0x828000
    bra .9829

.981B:
    lda.b 0x33
    and.w #0x00FF
    clc
    adc.w #0x0100
    tay
    jsl 0x828011
.9829:
    sep #0x30
    lda.b 0x82
    eor.b #0x02
    sta.b 0x82
.9831:
    lda.b 0x6E
    bne .97F8
    ldx.b 0x58
    jmp (.983A,X)

.983A: d16[.9840, .984F, .9880]

.9840:
    lda.b 0x37
    bit.b #0x40
    beq .984E

    lda.b #0x02
    sta.b 0x58
    lda.b #0xB4
    sta.b 0x57
.984E:
    rts

.984F:
    lda.b 0x37
    bit.b #0x40
    bne .985F

    stz.b 0x58
    jsr _819E85
    stz.b 0x5B
    stz.b 0x5A
    rts

.985F:
    dec.b 0x57
    lda.b 0x57
    cmp.b #0x96
    bne .984E

    lda.b #0x04
    sta.b 0x58
    lda.b #0x40
    tsb.b 0x87
    lda.b #0x03
    jsl _80888B.88B6
    lda.b #0x03
    sta.b 0x5B
    sta.b 0x5A
    stz.b 0x82
    jsr _819E34
.9880:
    lda.b 0x37
    bit.b #0x40
    bne .98AE

    lda.b #0x40
    trb.b 0x87
    lda.b #0x17
    jsl _80888B.88B6
    jsr _8198D5
    beq .98A4

    lda.b 0x7D
    beq .989D

    lda.b #0x04
    sta.b 0x5B
.989D:
    ldx.b 0x5B
    lda.w 0x86BA74,X
    sta.b 0x59
.98A4:
    stz.b 0x58
    jsr _819E85
    stz.b 0x5B
    stz.b 0x5A
    rts

.98AE:
    lda.b 0x57
    beq .98D4

    dec.b 0x57
    ldy.b #0x00
    ldx.b #0x02
    cmp.b #0x50
    beq .98CE

    lda.w 0x1F99
    bit.b #0x02
    beq .98D4

    ldy.b #0x04
    ldx.b #0x01
    lda.b 0x57
    cmp.b #0x01
    beq .98CE

    rts

.98CE:
    stx.b 0x5B
    stx.b 0x5A
    sty.b 0x82
.98D4:
    rts

;-----

_8198D5:
    lda.b 0x02
    cmp.b #0x0E
    beq .98F1

    cmp.b #0x16
    beq .98F1

    cmp.b #0x18
    beq .98F1

    cmp.b #0x22
    beq .98F1

    cmp.b #0x2E
    beq .98F1

    cmp.b #0x36
    beq .98F1

    cmp.b #0x42
.98F1:
    rts

;-----

_8198F2:
    lda.w 0x1F99
    bit.b #0x08
    beq .9929

    rep #0x31
    lda.b 0x29
    and.w #0x00FF
    bit.w #0x0080
    beq .9908

    ora.w #0xFF00
.9908:
    adc.b 0x05
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0008
    sta.w 0x0002
    jsl 0x849129
    jsl _80B8D5
    sep #0x30
    jsr _819F08
    lda.b #0x23
    jsl _80888B.88B6
.9929:
    rts

;-----

_81992A:
    lda.b 0x02
    sta.w 0x0000
    asl
    clc
    adc.w 0x0000
    tax
    rep #0x20
    lda.w 0x86B9B4,X
    bit.b 0x68
    bvs .9942

    eor.w #0xFFFF
    inc
.9942:
    sta.b 0x1A
    lda.w 0x86B9B6,X
    sta.b 0x1C
    sep #0x20
    lda.w 0x86B9B8,X
    sta.b 0x1E
    lda.l _81812E.8533 ;copy protection?
    cmp.l _819665.966A
    beq .995F

    lda.b #0x80
    tsb.w 0x1F9E
.995F:
    rts

;-----

_819960:
    jsl 0x849ACD
    asl
    tax
    rep #0x20
    lda.w 0x86BA68,X
    bit.b 0x68
    bvs .9973

    eor.w #0xFFFF
    inc
.9973:
    sta.b 0x1A
    sep #0x20
    rts

;-----

_819978:
    php
    sep #0x30
    jsr _819576
    beq .998E

    rep #0x20
    lda.b 0x5C
    bit.b 0x68
    bvs .998C

    eor.w #0xFFFF
    inc
.998C:
    sta.b 0x1A
.998E:
    plp
    rts

;-----

_819990:
    jsr .local
    rtl

.local:
    lda.w 0x1F21
    cmp.b #0x01
    bne .99C6

    lda.b 0x2F
    bne .99C5

    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x1E4D
    lsr
    lsr
    and.w #0xFFFE
    dec
    dec
    and.w #0x003F
    tax
    lda.l 0x7EFE04,X
    and.w #0x0FFF
    sec
    sbc.w 0x1E50
    eor.w #0xFFFF
    inc
    sep #0x20
    sta.b 0x19
.99C5:
    rts

.99C6:
    stz.b 0x19
.99C8:
    rts

;-----

_8199C9:
    lda.w 0x1F23
    bne _819990.99C8

    lda.b 0x35
    bne _819990.99C8

    lda.w 0x1F31
    bne _819990.99C8

    lda.b 0x02
    cmp.b #0x18
    beq _819990.99C8

    cmp.b #0x42
    beq _819990.99C8

    lda.b 0x36
    and.b #0x30
    cmp.b #0x30
    beq .9A0A

    lda.b 0x3A
    bit.b #0x20
    beq .9A13

.99EF:
    lda.b 0x33
    beq .9A04

    cmp.b #0x02
    beq .9A0A

    dec.b 0x33
    dec.b 0x33
.99FB:
    ldx.b 0x33
    bit.w 0x1F86,X
    bvs .9A28

    bra .99EF

.9A04:
    lda.b #0x10
    sta.b 0x33
    bra .99FB

.9A0A:
    stz.b 0x33
    lda.b #0x04
    sta.w 0x1F12
    bra .9A3F

.9A13:
    bit.b #0x10
    beq .9A65

.9A17:
    lda.b 0x33
    cmp.b #0x10
    beq .9A0A

    inc.b 0x33
    inc.b 0x33
    ldx.b 0x33
    bit.w 0x1F86,X
    bvc .9A17

.9A28:
    ldx.w 0x1F7A
    lda.b #0x02
    ora.w 0x86BAC5,X
    sta.b 0x11
    stz.w 0x1F12
    lda.b 0x33
    clc
    adc.b #0x3E
    tay
    jsl _808A64
.9A3F:
    lda.b 0x33
    lsr
    tax
    lda.w 0x86BABB,X
    sta.b 0x67
    ldx.b #0x30
    lda.b 0x33
    clc
    adc.b #0x40
    tay
    jsl 0x828000
    rep #0x31
    lda.b 0x33
    and.w #0x00FF
    adc.w #0x0100
    tay
    jsl 0x828011
    sep #0x30
.9A65:
    rts

;-----

_819A66:
    lda.w 0x1F9A
    lsr
    lsr
    cmp.b 0x27
    bcc .9A74

    lda.b #0x1D
    sta.b 0x73
    rts

.9A74:
    lda.b 0x73
    beq .9A88

    lda.b 0x02
    beq .9A84

    cmp.b #0x18
    bne .9A86

    lda.b 0x6A
    bne .9A86

.9A84:
    stz.b 0x03
.9A86:
    stz.b 0x73
.9A88:
    rts

;-----

_819A89:
    ldy.b #0x16
    jsl _808A64
    jsl 0x8282D3
    bne .9ABF

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x2D
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b #0x30
    sta.l 0x7F839B
    lda.b #0x08
    sta.l 0x7F829B
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.9ABF:
    sep #0x30
    rts

;-----

_819AC2:
    asl.b 0x72
    stz.b 0x29
    lda.b #0x08
    sta.b 0x2A
    jsr _819D70
    cmp.b #0x0E
    bne .9B20

    lda.b 0x27
    beq .9B20

    lda.b #0x01
    tsb.b 0x72
    lda.b #0x02
    bit.b 0x72
    bne .9B20

    jsl 0x8282D3
    bne .9B20

    lda.b #0x2E
    jsl _80888B.88B6
    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    ldy.w #0x0001
    rep #0x20
    lda.b 0x08
    sec
    sbc.b 0x24
    sep #0x20
    beq .9B03

    bmi .9B08

.9B03:
    lda.b #0x20
    sta.b 0x74
    dey
.9B08:
    tya
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x2A
    and.w #0x00FF
    adc.b 0x08
    and.w #0xFFF0
    sta.w 0x0008,X
.9B20:
    sep #0x30
    rts

;-----

_819B23:
    rep #0x10
    lda.b 0x74
    beq .9B6E

    dec
    sta.b 0x74
    and.b #0x03
    bne .9B6E

    ldy.w #0x0003
.9B33:
    jsl 0x8282D3
    bne .9B6E

    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    lda.b #0x02
    sta.w 0x000B,X
    rep #0x21
    jsl get_rng
    and.w #0x000F
    adc.b 0x05
    sec
    sbc.w #0x0008
    sta.w 0x0005,X
    jsl get_rng
    and.w #0x0007
    clc
    adc.b 0x08
    clc
    adc.w #0x0008
    sta.w 0x0008,X
    sep #0x20
    dey
    bne .9B33

.9B6E:
    sep #0x30
    rts

;-----

_819B71:
    lda.b 0x70
    beq .9BB2

    lda.b 0x27
    beq .9BB2

    inc.b 0x71
    lda.b 0x71
    cmp.b #0x3C
    bcc .9BB2

    jsl 0x8282D3
    bne .9BAE

    inc.w 0x0000,X
    lda.b #0x0C
    sta.w 0x000A,X
    lda.b #0x03
    sta.w 0x000B,X
    rep #0x21
    lda.w #0x0007
    bit.b 0x68
    bvs .9BA0

    lda.w #0xFFF9
.9BA0:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    adc.w #0xFFFA
    sta.w 0x0008,X
.9BAE:
    sep #0x20
    stz.b 0x71
.9BB2:
    sep #0x30
    rts

;-----

_819BB5:
    lda.b 0x70
    bit.b #0x01
    bne .9C08

    lda.b 0x77
    bne .9C08

    lda.w 0x0B9C
    bit.b #0x03
    bne .9C08

    jsl 0x8282D3
    bne .9C08

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x0D
    sta.w 0x000B,X
    lda.b 0x11
    eor.b #0x40
    sta.w 0x0011,X
    rep #0x21
    lda.b 0x08
    adc.w #0x000C
    sta.w 0x0008,X
    jsl get_rng
    and.w #0x0003
    sta.w 0x0000
    lda.w #0x000C
    bit.b 0x4D
    bvs .9BFE

    lda.w #0xFFF4
.9BFE:
    clc
    adc.w 0x0000
    clc
    adc.b 0x05
    sta.w 0x0005,X
.9C08:
    sep #0x30
    rts

;-----

_819C0B:
    lda.b 0x70
    bit.b #0x01
    bne .9C4A

    lda.b 0x75
    cmp.b #0x06
    bcs .9C4A

    lda.w 0x0B9C
    bit.b #0x03
    bne .9C4A

    jsr _819C4D
    beq .9C4A

    jsl 0x8282D3
    bne .9C4A

    inc.b 0x75
    inc.w 0x0000,X
    lda.b #0x31
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x21
    lda.b 0x08
    adc.w #0x000F
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0005,X
.9C4A:
    sep #0x30
    rts

;-----

_819C4D:
    stz.b 0x29
    lda.b #0x22
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x11
    beq .9C65

    lda.b #0x10
    sta.b 0x2A
    jsl 0x8490A0
    cmp.b #0x11
.9C65:
    rts

;-----

_819C66:
    sta.w 0x0000
    jsl 0x8282D3
    bne .9C82

    inc.w 0x0000,X
    lda.b #0x0B
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.w 0x0000
    sta.w 0x000B,X
.9C82:
    sep #0x10
    rts

;-----

_819C85:
    rep #0x30
    ldx.w #0x01FE
.9C8A:
    lda.w 0x0300,X
    sta.w 0x0000
    stz.w 0x0002
    and.w #0x001F
    cmp.w #0x001F
    beq .9C9C

    inc
.9C9C:
    sta.w 0x0002
    lda.w 0x0000
    and.w #0x03E0
    cmp.w #0x03E0
    beq .9CAE

    clc
    adc.w #0x0020
.9CAE:
    tsb.w 0x0002
    lda.w 0x0000
    and.w #0x7C00
    cmp.w #0x7C00
    beq .9CC0

    clc
    adc.w #0x0400
.9CC0:
    tsb.w 0x0002
    lda.w 0x0002
    sta.w 0x0300,X
    dex
    dex
    bpl .9C8A

    sep #0x30
    inc.w 0x00A1
    rts

;-----

_819CD3:
    sep #0x20
    rep #0x11
    ldx.b 0x20
    lda.w 0x0007,X
    adc.b #0x08
    bit.b 0x4F
    bvs .9CE5

    eor.b #0xFF
    inc
.9CE5:
    clc
    adc.w 0x0005,X
    sta.b 0x29
    lda.w 0x0006,X
    clc
    adc.w 0x0008,X
    sec
    sbc.w 0x0009,X
    sta.b 0x2A
    jsr _819D70
    cmp.b #0x3C
    sep #0x10
    rts

;-----

_819D00:
    rep #0x21
    stz.w 0x0000
    lda.b 0x79
    bpl .9D0C

    dec.w 0x0000
.9D0C:
    adc.b 0x04
    sta.b 0x04
    sep #0x20
    lda.b 0x06
    adc.w 0x0000
    sta.b 0x06
    rts

;-----

_819D1A:
    bit.b 0x7E
    bvs .9D29

    lda.b #0x01
    bit.b 0x69
    bvs .9D26

    lda.b #0x02
.9D26:
    bit.b 0x37
    rts

.9D29:
    lda.b #0x02
    bit.b 0x69
    bvs .9D31

    lda.b #0x01
.9D31:
    bit.b 0x37
    bne .9D3A

    lda.b #0x80
    bit.b 0x36
    rts

.9D3A:
    lda.b #0x00
    rts

;-----

_819D3D:
    lda.b 0x33
    bne .9D58

    lda.w 0x000A,X
    cmp.b #0x02
    bne .9D58

    phx
    jsl 0x82833E
    bne .9D57

    inc.w 0x0000,X
    lda.b #0x1D
    sta.w 0x000A,X
.9D57:
    plx
.9D58:
    rts

;-----

_819D59:
    jsr .local
    rtl

.local:
    phd
    rep #0x20
    lda.w #0x0BA8
    tcd
    sep #0x20
    lda.b 0x64
    bne .9D6E

    jsl 0x8491BE
.9D6E:
    pld
    rtl

;-----

_819D70:
    lda.b 0x7E
    bit.b #0x10
    bne .9D7B

    jsl 0x8490A0
    rts

.9D7B:
    lda.b #0x00
    rts

;-----

_819D7E:
    rep #0x10
    stz.b 0x16
    lda.w 0x1F99
    lsr
    sta.w 0x0000
    bcc .9D8F

    lda.b #0x18
    sta.b 0x16
.9D8F:
    ldx.w #0x0C38
    ldy.w #0x0000
.9D95:
    lsr.w 0x0000
    bcc .9DAC

    inc.w 0x0000,X
    stz.w 0x000A,X
    stz.w 0x0001,X
    tya
    sta.w 0x000B,X
    lda.b #0x5D
    sta.w 0x0010,X
.9DAC:
    rep #0x21
    txa
    adc.w #0x0020
    tax
    sep #0x20
    iny
    cpy.w #0x0003
    bne .9D95

    sep #0x30
    rts

;-----

_819DBE:
    jsl 0x8282D3
    bne .9E01

    inc.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    lda.b #0x0E
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x21
    lda.w #0xFFF2
    bit.b 0x68
    bvc .9DE2

    lda.w #0x000E
.9DE2:
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x81
    and.w #0x00FF
    tay
    lda 0x86BAD2,Y
    and.w #0x00FF
    bit.w #0x0080
    beq .9DFB

    ora.w #0xFF00
.9DFB:
    clc
    adc.b 0x08
    sta.w 0x0008,X
.9E01:
    sep #0x30
    rts

;-----

_819E04:
    rep #0x20
    lda.w #0xA555
    sta.b 0x20
    sep #0x20
    rts

;-----

_819E0E:
    jsl 0x8282D3
    bne .9E31

    dec.w 0x0000,X
    lda.b #0x10
    sta.w 0x000A,X
    inc
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
.9E31:
    sep #0x30
    rts

;-----

_819E34:
    jsl 0x8282ED
    bne .9E42

    dec.w 0x0000,X
    lda.b #0x01
    sta.w 0x000A,X
.9E42:
    sep #0x10
    rts

;-----

_819E45:
    lda.w 0x1F7A
    cmp.b #0x08
    bne .9E84

    bit.b 0x0F
    bvc .9E84

    jsl 0x8282D3
    bne .9E82

    inc.w 0x0000,X
    lda.b #0x31
    sta.w 0x000A,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b #0x07
    sta.w 0x000B,X
    rep #0x21
    lda.b 0x08
    adc.w #0xFFFD
    sta.w 0x0008,X
    lda.w #0xFFF5
    bit.b 0x68
    bvc .9E7C

    lda.w #0x000B
.9E7C:
    clc
    adc.b 0x05
    sta.w 0x0005,X
.9E82:
    sep #0x30
.9E84:
    rts

;-----

_819E85:
    rep #0x31
    lda.b 0x33
    and.w #0x00FF
    adc.w #0x0100
    tay
    jsl 0x828011
    sep #0x30
    rts

;-----

_819E97:
    lda.b #0x04
    trb.b 0x7E
    lda.w 0x1F99
    bit.b #0x01
    beq .9EE4

    lda.b #0xED
    sta.b 0x2A
    lda.b #0x08
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x3C
    bne .9EC5

    rep #0x21
    lda.b 0x05
    adc.w #0x0008
    sta.w 0x0000
    jsr _819EE9
    sep #0x20
    lda.b #0x04
    tsb.b 0x7E
.9EC5:
    lda.b #0xF8
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x3C
    bne .9EE4

    rep #0x21
    lda.b 0x05
    adc.w #0xFFF8
    sta.w 0x0000
    jsr _819EE9
    sep #0x20
    lda.b #0x04
    tsb.b 0x7E
.9EE4:
    lda.b 0x7E
    bit.b #0x04
    rts

;-----

_819EE9:
    lda.b 0x08
    clc
    adc.w #0xFFED
    sta.w 0x0002
    jsl 0x849129
    jsl _80B8D5
    sep #0x20
    lda.b #0x23
    jsl _80888B.88B6
    jsr _819F08.9F0E
    rep #0x20
    rts

;-----

_819F08:
    lda.b #0x02
    tsb.b 0x7E
    bra .9F12

.9F0E:
    lda.b #0x02
    trb.b 0x7E
.9F12:
    rep #0x10
    ldy.w #0x0004
.9F17:
    jsl 0x8282D3
    beq .9F20

    jmp .9FAE

.9F20:
    inc.w 0x0000,X
    lda.b #0x2B
    sta.w 0x000A,X
    jsl get_rng
    and.b #0x03
    clc
    sta.w 0x0000
    phy
    lda.b #0x00
    xba
    lda.w 0x1F7A
    asl
    asl
    adc.w 0x0000
    tay
    lda 0xBADD,Y
    sta.w 0x000B,X
    lda.b #0x30
    sta.w 0x0011,X
    rep #0x21
    ldy.w #0xFFED
    lda.b 0x7E
    bit.w #0x0002
    beq .9F59

    ldy.w #0x0008
.9F59:
    sty.w 0x0000
    lda.b 0x08
    adc.w 0x0000
    sta.w 0x0008,X
    stz.w 0x000C,X
    ldy.w #0x0008
    lda.b 0x7E
    bit.w #0x0002
    beq .9F74

    ldy.w #0x0010
.9F74:
    tya
    bit.b 0x28
    bpl .9F7D

    eor.w #0xFFFF
    inc
.9F7D:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.w #0x0030
    sta.w 0x001E,X
    jsl get_rng
    and.w #0x000C
    tay
    lda 0xCE6C,Y
    sta.w 0x001A,X
    jsl get_rng
    and.w #0x000C
    tay
    lda 0xCE74,Y
    sta.w 0x001C,X
    ply
    sep #0x20
    dey
    bmi .9FAE

    jmp .9F17

.9FAE:
    sep #0x10
    rts

;-----

_819FB1:
    stz.b 0x2A
    stz.b 0x29
    jsr _819D70
    cmp.b #0x12
    beq .9FD0

    lda.b #0x08
    sta.b 0x29
    jsr _819D70
    cmp.b #0x12
    beq .9FD0

    lda.b #0xF8
    sta.b 0x29
    jsr _819D70
    cmp.b #0x12
.9FD0:
    php
    lda.b 0x29
    sta.b 0x86
    plp
    rts

;-----

_819FD7:
    lda.b 0x33
    cmp.b #0x08
    bne .9FF9

    lda.b #0x40
    bit.b 0x37
    beq .9FF9

    lda.b 0x7D
    bne .9FF9

    lda.b 0x5B
    cmp.b #0x01
    beq .9FF9

    dec.b 0x78
    bne .9FF9

    lda.b #0x02
    sta.b 0x78
    lda.b #0x40
    tsb.b 0x3B
.9FF9:
    rts

;-----

_819FFA:
    phx
    sep #0x10
    lda.b 0x33
    bne .A013

    lda.b 0x59
    cmp.b #0x02
    beq .A00F

    cmp.b #0x08
    bne .A013

    lda.b #0x02
    bra .A025

.A00F:
    lda.b #0x04
    bra .A025

.A013:
    lda.b #0x00
    ldx.b 0x59
    cpx.b #0x04
    bne .A01C

    inc
.A01C:
    clc
    adc.b 0x33
    tax
    lda.w 0x86BB11,X
    bmi .A029

.A025:
    jsl _80888B.88B6
.A029:
    rep #0x10
    plx
    rts

;-----

_81A02D:
    rep #0x10
    ldy.w #0x0007
.A032:
    jsl 0x8282D3
    bne .A055

    inc.w 0x0000,X
    lda.b #0x40
    sta.w 0x000A,X
    tya
    sta.w 0x000B,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dey
    bpl .A032

.A055:
    sep #0x10
    rts

;-----

_81A058:
    ldx.b 0x7F
    jmp (.A05D,X)

.A05D: d16[.A065, .A076, .A099, .A0BC]

.A065:
    lda.b 0x37
    and.b #0x0F
    cmp.b #0x04
    bne .A075

    lda.b #0x02
    sta.b 0x7F
    lda.b #0x14
    sta.b 0x80
.A075:
    rts

.A076:
    dec.b 0x80
    bne .A07C

    stz.b 0x7F
.A07C:
    lda.b #0x05
    bit.b 0x69
    bvs .A084

    lda.b #0x06
.A084:
    sta.w 0x0000
    lda.b 0x37
    and.b #0x0F
    cmp.w 0x0000
    bne .A098

    lda.b #0x04
    sta.b 0x7F
    lda.b #0x14
    sta.b 0x80
.A098:
    rts

.A099:
    dec.b 0x80
    bne .A09F

    stz.b 0x7F
.A09F:
    lda.b #0x01
    bit.b 0x69
    bvs .A0A7

    lda.b #0x02
.A0A7:
    sta.w 0x0000
    lda.b 0x37
    and.b #0x0F
    cmp.w 0x0000
    bne .A0BB

    lda.b #0x06
    sta.b 0x7F
    lda.b #0x14
    sta.b 0x80
.A0BB:
    rts

.A0BC:
    dec.b 0x80
    bne .A0C2

    stz.b 0x7F
.A0C2:
    lda.b 0x39
    eor.b 0x37
    and.b 0x39
    bit.b #0x40
    bne .A0D2

    lda.b 0x3B
    bit.b #0x40
    beq .A0DF

.A0D2:
    jsr _81A0E0
    bne .A0DF

    lda.b #0x42
    sta.b 0x02
    stz.b 0x03
    stz.b 0x7F
.A0DF:
    rts

;-----

_81A0E0:
    lda.b 0x8D
    bne .A109

    lda.b 0x7D
    bne .A109

    lda.b 0x33
    bne .A109

    lda.b 0x27
    cmp.b #0x20
    bne .A109

    lda.w 0x1F7E
    and.b #0x80
    cmp.b #0x80
    bne .A109

    lda.b 0x02
    beq .A109

    cmp.b #0x02
    beq .A109

    cmp.b #0x04
    beq .A109

    cmp.b #0x0A
.A109:
    rts

;-----

_81A10A:
    jsl 0x82833E
    bne .A11A

    inc.w 0x0000,X
    inc.b 0x35
    lda.b #0x04
    sta.w 0x000A,X
.A11A:
    sep #0x10
    rts

;-----

_81A11D:
    jsl 0x8282D3
    bne .A130

    inc.w 0x0000,X
    lda.b #0x44
    sta.w 0x000A,X
    lda.b #0x80
    tsb.w 0x1F2C
.A130:
    sep #0x10
    rts

;-----

_81A133:
    ldx.b 0x01
    bne .A142

    inc.b 0x01
    stz.b 0x18
    lda.b 0x0B
    clc
    adc.b 0x10
    sta.b 0x16
.A142:
    lda.w 0x0BB6
    sta.b 0x0E
    lda.w 0x0BBF
    sta.b 0x17
    lda.w 0x0BB9
    sta.b 0x11
    lda.w 0x0BC1
    sta.b 0x19
    rep #0x20
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    sta.b 0x08
    rtl

;-----

_81A163:
    ldx.b 0x01
    bne .A17D

    inc.b 0x01
    stz.b 0x18
    lda.w #0x850E
    asl.b 0xA9,X
    adc.l 0xA61C85,X
    phd
    lda.w 0x86BDD2,X
    jsl 0x848F07
    rtl

.A17D:
    rep #0x10
    lda.w #0xEB00
    lda.b 0x0B
    tay
    ldx.b 0x0C
.A187:
    lda.w 0x003A,X
    sec
    sbc 0x86BDD6,Y
    tay
    rep #0x20
    sep #0x10
    lda [0x1A],Y
    bpl .A19B

    jml 0x828398

.A19B:
    ldx.b #0x00
    bit.w #0x4000
    beq .A1A4

    ldx.b #0x02
.A1A4:
    stx.b 0x12
    and.w #0x1FFF
    sta.b 0x05
    iny
    iny
    lda [0x1A],Y
    sta.b 0x08
    jml 0x8280B4

;-----

_81A1B5:
    ldx.b 0x01
    bne .A1CF

    inc.b 0x01
    stz.b 0x18
    lda.b #0x02
    sta.b 0x12
    lda.b #0x6F
    sta.b 0x16
    stz.b 0x11
    stz.b 0x10
    lda.b #0x00
    jsl 0x848F07
.A1CF:
    lda.w 0x0C00
    bne .A1D8

    jml 0x828398

.A1D8:
    ldx.b #0x70
    lda.w 0x0BFF
    cmp.b #0x50
    beq .A1F9

    lda.w 0x1F99
    bit.b #0x02
    beq .A1FF

    ldx.b #0x71
    lda.w 0x0BFF
    cmp.b #0x01
    bne .A1FF

    stx.b 0x16
    lda.b #0x06
    tsb.b 0x10
    bra .A1FF

.A1F9:
    stx.b 0x16
    lda.b #0x04
    tsb.b 0x10
.A1FF:
    rep #0x20
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    sta.b 0x08
    sep #0x20
    lda.w 0x0BB9
    and.b #0x70
    ora.b 0x10
    sta.b 0x11
    jsl 0x848EEA
    jml 0x8280B4

;-----

    incsrc "weapons/x_buster.asm"

;-----

_81A2C8:
    ldx.b 0x01
    jsr (.A2D2,X)
    jsl 0x848FCA
    rtl

.A2D2: d16[.A2DC, .A324, .A38B, .A320, .A3C4]

.A2DC:
    jsr _81A54C
    inc.w 0x0C25
    lda.b #0xFF
    sta.b 0x10
    rep #0x21
    lda.w 0x0BB0
    adc.w 0x0002
    sta.b 0x08
    lda.w #0xBE24
    sta.b 0x20
    lda.w #0xAAF3
    sta.b 0x31
    lda.w #0x0600
    bit.b 0x10
    bvs .A304

    lda.w #0xFA00
.A304:
    sta.b 0x1A
    stz.b 0x1C
    ldx.w 0x1F9F
    bpl .A30F

    stz.b 0x1A
.A30F:
    sep #0x20
    jsl 0x8280B4
    lda.b #0x0E
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rts

.A320:
    lda.b #0x02
    sta.b 0x01
.A324:
    ldx.b 0x02
    jsr (.A33C,X)
    jsl 0x8280B4
    lda.b 0x0E
    bne .A33B

    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
    sta.b 0x30
.A33B:
    rts

.A33C: d16[.A340, .A36D]

.A340:
    ldx.b 0x03
    bne .A34C

    inc.b 0x03
    lda.b #0x00
    jsl 0x848F07
.A34C:
    lda.b 0x0F
    bpl .A356

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.A356:
    jsl 0x848EEA
    jsr _81A54C.A56E
    rep #0x20
    lda.b 0x0F
    and.w #0x007F
    clc
    adc.w #0xBE24
    sta.b 0x20
    sep #0x20
    rts

.A36D:
    ldx.b 0x03
    bne .A382

    inc.b 0x03
    rep #0x20
    lda.w #0xBE34
    sta.b 0x20
    sep #0x20
    lda.b #0x01
    jsl 0x848F07
.A382:
    jsl update_pos_xy.no_accel
    jsl 0x848EEA
    rts

.A38B:
    ldx.b 0x02
    jsr (.A395,X)
    jsl 0x8280B4
    rts

.A395: d16[.A399, .A3B2]

.A399:
    rep #0x31
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x30
    lda.b #0x02
    sta.b 0x02
    inc.b 0x30
    lda.b #0x03
    jsl 0x848F07
    rts

.A3B2:
    lda.b 0x0F
    bpl .A3BF

    lda.b #0x08
    sta.b 0x01
    lda.b #0x04
    sta.b 0x02
    rts

.A3BF:
    jsl 0x848EEA
    rts

.A3C4:
    ldx.b 0x02
    jmp (.A3C9,X)

.A3C9: d16[.A3CF, .A3EC, .A3FD]

.A3CF:
    rep #0x31
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x30
    inc.b 0x30
    lda.b #0x02
    sta.b 0x02
    jsl 0x8280B4
    lda.b #0x02
    jsl 0x848F07
    rts

.A3EC:
    lda.b 0x0F
    bpl .A3F4

    lda.b #0x04
    sta.b 0x02
.A3F4:
    jsl 0x8280B4
    jsl 0x848EEA
    rts

.A3FD:
    dec.w 0x0BDD
    dec.w 0x0C25
    jsl 0x8283A3
    rts

;-----

_81A408:
    ldx.b 0x01
    jsr (.A40E,X)
    rtl

.A40E: d16[.A418, .A43C, .A498, .A4AF, .A4B8]

.A418:
    jsr _81A54C
    stz.b 0x37
    rep #0x20
    lda.w #0x0600
    sta.b 0x38
    stz.b 0x3A
    lda.w #0xBE38
    sta.b 0x20
    sep #0x20
    jsl 0x8280B4
    lda.b #0x08
    sta.b 0x16
    lda.b #0x05
    jsl 0x848F07
    rts

.A43C:
    bit.b 0x11
    bvc .A44E

    lda.b 0x37
    inc
    inc
    inc
    inc
    cmp.b #0x1D
    bmi .A458

    lda.b #0x00
    bra .A458

.A44E:
    lda.b 0x37
    dec
    dec
    dec
    dec
    bpl .A458

    lda.b #0x1C
.A458:
    sta.b 0x37
    asl
    asl
    tax
    rep #0x20
    lda.w 0xEEBA,X
    asl
    asl
    asl
    sta.b 0x1A
    lda.w 0xEEBC,X
    asl
    asl
    asl
    sta.b 0x1C
    lda.b 0x38
    bit.b 0x10
    bvs .A479

    eor.w #0xFFFF
    inc
.A479:
    clc
    adc.b 0x1A
    sta.b 0x1A
    lda.b 0x3A
    clc
    adc.b 0x1C
    sta.b 0x1C
    sep #0x20
    jsl update_pos_xy.no_accel
    jsl 0x8280B4
    lda.b 0x0E
    beq .A4B8

    jsl 0x848EEA
    rts

.A498:
    rep #0x20
    lda.b 0x38
    eor.w #0xFFFF
    inc
    sta.b 0x38
    lda.w #0x0300
    sta.b 0x3A
    sep #0x20
    jsl 0x8280B4
    inc.b 0x30
.A4AF:
    lda.b #0x02
    sta.b 0x01
    jsl 0x848EEA
    rts

.A4B8:
    inc.b 0x30
    dec.w 0x0BDD
    jsl 0x8283A3
    rts

;-----

_81A4C2:
    ldx.b 0x01
    jsr (.A4C8,X)
    rtl

.A4C8: d16[.A4D2, .A50A, .A51B, .A53B, .A53B] 

.A4D2:
    jsr _81A54C
    inc.w 0x0C0B
    rep #0x20
    lda.w #0x0600
    bit.b 0x10
    bvs .A4E4

    lda.w #0xFA00
.A4E4:
    sta.b 0x1A
    stz.b 0x1C
    lda.w #0xBE20
    sta.b 0x20
    sep #0x20
    lda.w 0x1F9D
    bpl .A4F7

    stz.w 0x1F9B
.A4F7:
    stz.b 0x1F
    stz.b 0x1E
    jsl 0x8280B4
    lda.b #0x08
    sta.b 0x16
    lda.b #0x04
    jsl 0x848F07
    rts

.A50A:
    jsl update_pos_xy.neg_ay_ax
    jsl 0x8280B4
    lda.b 0x0E
    beq .A541

    jsl 0x848EEA
    rts

.A51B:
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    jsl 0x8280B4
    inc.b 0x30
    lda.b #0x02
    sta.b 0x01
    rts

.A53B:
    inc.b 0x30
    jsl 0x84A51A
.A541:
    dec.w 0x0BDD
    dec.w 0x0C0B
    jsl 0x8283A3
    rts

;-----

_81A54C:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x18
    ldy.b #0x04
    lda.b 0x0A
    cmp.b #0x01
    bne .A55C

    ldy.b #0x06
.A55C:
    sty.w 0x0000
    ldx.w 0x1F7A
    lda.w 0x0BB9
    and.b #0x70
    ora.w 0x0000
    sta.b 0x11
    stz.b 0x30
.A56E:
    ldx.b 0x3C
    lda.w 0x86BE3C,X
    sta.w 0x0000
    stz.w 0x0001
    stz.w 0x0003
    lda.w 0x86BE3D,X
    sta.w 0x0002
    bpl .A587

    dec.w 0x0003
.A587:
    rep #0x20
    lda.w 0x0000
    bit.b 0x10
    bvs .A594

    eor.w #0xFFFF
    inc
.A594:
    clc
    adc.w 0x0BAD
    sta.b 0x05
    ldx.b 0x0A
    cpx.b #0x01
    beq .A5A9

    lda.w 0x0BB0
    clc
    adc.w 0x0002
    sta.b 0x08
.A5A9:
    sep #0x20
    rts

;-----

_81A5AC:
    ldx.b 0x01
    jsr (.A5B6,X)
    jsl 0x848FCA
    rtl

.A5B6: d16[.A5C0, .A60E, .A66C, .A60A, .A6A5]

.A5C0:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x18
    lda.b 0x11
    and.b #0x0E
    clc
    adc.b #0x02
    sta.w 0x0000
    lda.b 0x11
    and.b #0xF1
    ora.w 0x0000
    sta.b 0x11
    stz.b 0x30
    lda.b #0xFF
    sta.b 0x10
    rep #0x20
    lda.w #0xC03D
    sta.b 0x20
    lda.w #0xAAF3
    sta.b 0x31
    lda.w #0x0500
    bit.b 0x10
    bvs .A5F5

    lda.w #0xFB00
.A5F5:
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    jsl 0x8280B4
    lda.b #0x0E
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rts

.A60A:
    lda.b #0x02
    sta.b 0x01
.A60E:
    ldx.b 0x02
    jsr (.A624,X)
    jsl 0x8280B4
    lda.b 0x0E
    bne .A623

    lda.b #0x08
    sta.b 0x01
    lda.b #0x06
    sta.b 0x02
.A623:
    rts

.A624: d16[.A628, .A64E]

.A628:
    ldx.b 0x03
    bne .A634

    inc.b 0x03
    lda.b #0x00
    jsl 0x848F07
.A634:
    lda.b 0x0F
    bpl .A63E

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
.A63E:
    jsl 0x848EEA
    lda.b 0x0F
    and.b #0x7F
    clc
    adc.b #0x3D
    sta.b 0x20
    sep #0x20
    rts

.A64E:
    ldx.b 0x03
    bne .A663

    inc.b 0x03
    rep #0x20
    lda.w #0xC049
    sta.b 0x20
    sep #0x20
    lda.b #0x01
    jsl 0x848F07
.A663:
    jsl update_pos_xy.no_accel
    jsl 0x848EEA
    rts

.A66C:
    ldx.b 0x02
    jsr (.A676,X)
    jsl 0x8280B4
    rts

.A676: d16[.A67A, .A693]

.A67A:
    rep #0x31
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x30
    lda.b #0x02
    sta.b 0x02
    inc.b 0x30
    lda.b #0x03
    jsl 0x848F07
    rts

.A693:
    lda.b 0x0F
    bpl .A6A0

    lda.b #0x08
    sta.b 0x01
    lda.b #0x06
    sta.b 0x02
    rts

.A6A0:
    jsl 0x848EEA
    rts

.A6A5:
    ldx.b 0x02
    jmp (.A6AA,X)

.A6AA: d16[.A6B2, .A6D3, .A6EA, .A6FB]

.A6B2:
    rep #0x31
    lda.b 0x33
    sta.b 0x05
    lda.b 0x35
    sta.b 0x08
    sep #0x30
    jsl 0x84A28B
    inc.b 0x30
    lda.b #0x02
    sta.b 0x02
    jsl 0x8280B4
    lda.b #0x02
    jsl 0x848F07
    rts

.A6D3:
    rep #0x10
    ldx.b 0x0C
    lda.w 0x003B,X
    ora.b #0x80
    sta.w 0x003B,X
    sep #0x10
    jsl 0x8280B4
    lda.b #0x04
    sta.b 0x02
    rts

.A6EA:
    lda.b 0x0F
    bpl .A6F2

    lda.b #0x06
    sta.b 0x02
.A6F2:
    jsl 0x8280B4
    jsl 0x848EEA
    rts

.A6FB:
    jsl 0x8283A3
    rts

;-----

_81A700:
    ldx.b 0x01
    jmp (.A705,X)

.A705: d16[.A70F, .A71A, .A71A, .A71A, .A71A]

.A70F:
    lda.b #0x02
    sta.b 0x01
    dec
    sta.b 0x0E
    stz.b 0x1A
    stz.b 0x1B
.A71A:
    stx.b 0x30
    lda.w 0x0E3F
    and.b #0x7F
    bne .A727

.A723:
    jml 0x8283A3

.A727:
    bit.w 0x0E27
    bmi .A723

    bvc .A750

    stz.b 0x30
    lda.w 0x0E29
    sta.b 0x11
    rep #0x21
    lda.w 0x0E27
    and.w #0x0030
    lsr
    lsr
    adc.w #0xC02D
    sta.b 0x20
    lda.w 0x0E1D
    sta.b 0x05
    lda.w 0x0E20
    sta.b 0x08
    sep #0x20
.A750:
    rtl

;-----

_81A751:
    ldx.b 0x01
    jmp (.A756,X)

.A756: d16[.A760, .A76E, .A76E, .A76E, .A76E]

.A760:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x30
    lda.b #0x39
    sta.b 0x20
    lda.b #0xC0
    sta.b 0x21
.A76E:
    rep #0x30
    ldx.b 0x0C
    lda.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    sta.b 0x08
    lda.w 0x001A,X
    sta.b 0x1A
    sep #0x20
    lda.w 0x0011,X
    sta.b 0x11
    lda.w 0x000A,X
    cmp.b #0x2B
    bne .A794

    lda.w 0x0000,X
    bne .A798

.A794:
    jml 0x8283A3

.A798:
    rtl

;-----

_81A799:
    ldx.b 0x01
    jsr (.A79F,X)
    rtl

.A79F: d16[.A7A5, .A7D2, .A8EB]

.A7A5:
    lda.b #0x02
    sta.b 0x01
    sta.b 0x27
    stz.b 0x28
    lda.b #0x02
    sta.b 0x26
    stz.b 0x12
    rep #0x10
    ldx.b 0x33
    lda.w 0x0011,X
    sta.b 0x11
    ldx.w #0xC06D
    stx.b 0x20
    sep #0x10
    jsl 0x8280B4
    lda.b #0x02
    sta.b 0x16
    lda.b #0x09
    jsl 0x848F07
    rts

.A7D2:
    ldx.b 0x02
    jsr (.A804,X)
    jsl 0x8280B4
    rep #0x10
    ldx.b 0x33
    lda.w 0x0011,X
    sta.b 0x11
    lda.w 0x0027,X
    and.b #0x7F
    bne .A7F1

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.A7F1:
    sep #0x10
    lda.b 0x30
    pha
    stz.b 0x30
    jsl 0x849B43
    pla
    sta.b 0x30
    jsl 0x849B03
    rts

.A804: d16[.A80C, .A8A2, .A8B5, .A8D6]

.A80C:
    lda.b #0x02
    sta.b 0x02
    lda.b 0x35
    bit.b 0x11
    bvc .A82B

    cmp.b #0x0C
    bmi .A823

    ldx.b #0x0C
    cmp.b #0x18
    bmi .A822

    ldx.b #0x04
.A822:
    txa
.A823:
    cmp.b #0x04
    bpl .A83E

    lda.b #0x04
    bra .A83E

.A82B:
    cmp.b #0x1C
    bmi .A831

    lda.b #0x1C
.A831:
    cmp.b #0x14
    bpl .A83E

    ldx.b #0x14
    cmp.b #0x08
    bpl .A83D

    ldx.b #0x1C
.A83D:
    txa
.A83E:
    asl
    asl
    tax
    stz.b 0x0B
    rep #0x21
    lda.w 0xEEBA,X
    asl
    sta.b 0x1A
    bpl .A855

    inc.b 0x0B
    inc.b 0x0B
    eor.w #0xFFFF
    inc
.A855:
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    sep #0x20
    sta.b 0x1F
    rep #0x20
    clc
    lda.w 0xEEBC,X
    asl
    sta.b 0x1C
    bpl .A876

    inc.b 0x0B
    inc.b 0x0B
    inc.b 0x0B
    inc.b 0x0B
    eor.w #0xFFFF
    inc
.A876:
    lsr
    lsr
    lsr
    lsr
    lsr
    lsr
    sep #0x20
    sta.b 0x1E
    lda.b #0x25
    sta.b 0x03
    jsr _81A96F
    bne .A897

    rep #0x10
    ldx.b 0x33
    inc.w 0x0036,X
    sep #0x10
    jsl 0x8283A3
    rts

.A897:
    lda.b #0x02
    sta.b 0x16
    lda.b #0x09
    jsl 0x848F07
    rts

.A8A2:
    dec.b 0x03
    bne .A8AF

    lda.b #0x04
    sta.b 0x02
    lda.b #0x10
    sta.b 0x03
    rts

.A8AF:
    jsr _81AB03
    jmp _81A9C4

.A8B5:
    dec.b 0x03
    bne .A8D5

    lda.b #0x06
    sta.b 0x02
    lda.b #0x25
    sta.b 0x03
    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    lda.b 0x1C
    eor.w #0xFFFF
    inc
    sta.b 0x1C
    sep #0x20
.A8D5:
    rts

.A8D6:
    dec.b 0x03
    bne .A8E5

    rep #0x10
    ldx.b 0x33
    inc.w 0x0036,X
    sep #0x10
    bra .A955

.A8E5:
    jsr _81AB03
    jmp _81A9C4

.A8EB:
    ldx.b 0x02
    jmp (.A8F0,X)

.A8F0: d16[.A8F6, .A93D, .A955]

.A8F6:
    lda.b #0x02
    sta.b 0x02
    lda.b 0x11
    and.b #0xF0
    ora.l 0x7F8300
    sta.b 0x11
    rep #0x20
    lda.w #0x0300
    bit.b 0x10
    bvs .A910

    lda.w #0xFD00
.A910:
    sta.b 0x1A
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
    rep #0x10
    ldy.w #0x0008
.A924:
    ldx.b 0x29,Y
    lda.b #0x04
    sta.w 0x0001,X
    stz.w 0x0002,X
    tya
    sta.w 0x000B,X
    dey
    dey
    bpl .A924

    sep #0x10
    jsl 0x8280B4
    rts

.A93D:
    lda.w 0x0B9C
    lsr
    bcc .A950

    jsl 0x8280B4
    lda.b 0x0E
    bne .A950

    jsl 0x8283A3
    rts

.A950:
    jsl update_pos_xy.neg_ay_ax
    rts

.A955:
    rep #0x10
    ldy.w #0x0008
.A95A:
    ldx.b 0x29,Y
    lda.b #0x04
    sta.w 0x0001,X
    sta.w 0x0002,X
    dey
    dey
    bpl .A95A

    sep #0x10
    jsl 0x8283A3
    rts

;-----

_81A96F:
    rep #0x10
    ldy.w #0x0008
.A974:
    jsl 0x8282D3
    bne .A9B3

    inc.w 0x0000,X
    lda.b #0x05
    sta.w 0x000A,X
    lda.b 0x18
    sta.w 0x0018,X
    lda.b 0x11
    sta.w 0x0011,X
    rep #0x21
    lda.w #0x0004
    bit.b 0x10
    bvc .A998

    lda.w #0xFFFC
.A998:
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
    sep #0x20
    stx 0x29,Y
    dey
    dey
    bpl .A974

    lda.b #0x01
    sep #0x10
    rts

.A9B3:
    cpy.w #0x0008
    beq .A9C1

    iny
    iny
    ldx.b 0x29,Y
    stz.w 0x0000,X
    bra .A9B3

.A9C1:
    sep #0x12
    rts

;-----

_81A9C4:
    rep #0x31
    ldy.b 0x33
    lda.w #0x0008
    bit.b 0x10
    bvs .A9D2

    lda.w #0xFFF8
.A9D2:
    adc 0x0005,Y
    sta.w 0x0000
    lda 0x0008,Y
    sta.w 0x0002
    sep #0x10
    lda.b 0x05
    sec
    sbc.w 0x0000
    bpl .A9EC

    eor.w #0xFFFF
    inc
.A9EC:
    sta.w snes_regs.wrdivl
    ldx.b #0x06
    stx.w snes_regs.wrdivb
    lda.b 0x08
    sec
    sbc.w 0x0002
    bpl .AA00

    eor.w #0xFFFF
    inc
.AA00:
    sta.w 0x0006
    nop
    lda.w snes_regs.rddivl
    sta.w 0x0004
    lda.w 0x0006
    sta.w snes_regs.wrdivl
    stx.w snes_regs.wrdivb
    rep #0x10
    ldx.w #0x0000
    lda.b 0x05
    cmp.w 0x0000
    bpl .AA2C

    inx
    inx
    sta.w 0x0008
    lda.w 0x0000
    sta.w 0x000A
    bra .AA35

.AA2C:
    sta.w 0x000A
    lda.w 0x0000
    sta.w 0x0008
.AA35:
    lda.w snes_regs.rddivl
    sta.w 0x0006
    lda.b 0x08
    cmp.w 0x0002
    bpl .AA51

    inx
    inx
    inx
    inx
    sta.w 0x000C
    lda.w 0x0002
    sta.w 0x000E
    bra .AA5A

.AA51:
    sta.w 0x000E
    lda.w 0x0002
    sta.w 0x000C
.AA5A:
    ldy.b 0x29
    lda.b 0x05
    clc
    adc.w 0x0000
    lsr
    sta 0x0005,Y
    sta.w 0x0010
    lda.b 0x08
    clc
    adc.w 0x0002
    lsr
    sta 0x0008,Y
    sta.w 0x0012
    jsr (.AA8A,X)
    ldx.b 0x2B
    ldy.b 0x2F
    jsr _81AAEC
    ldx.b 0x2D
    ldy.b 0x31
    jsr _81AAEC
    sep #0x30
    rts

.AA8A: d16[.AA92, .AABF, .AABF, .AA92]

.AA92:
    ldy.b 0x2B
    lda.w 0x0008
    clc
    adc.w 0x0004
    sta 0x0005,Y
    lda.w 0x000C
    clc
    adc.w 0x0006
    sta 0x0008,Y
    ldy.b 0x2D
    lda.w 0x000A
    sec
    sbc.w 0x0004
    sta 0x0005,Y
    lda.w 0x000E
    sec
    sbc.w 0x0006
    sta 0x0008,Y
    rts

.AABF:
    ldy.b 0x2B
    lda.w 0x0008
    clc
    adc.w 0x0004
    sta 0x0005,Y
    lda.w 0x000E
    sec
    sbc.w 0x0006
    sta 0x0008,Y
    ldy.b 0x2D
    lda.w 0x000A
    sec
    sbc.w 0x0004
    sta 0x0005,Y
    lda.w 0x000C
    clc
    adc.w 0x0006
    sta 0x0008,Y
    rts

;-----

_81AAEC:
    lda.w 0x0005,X
    clc
    adc.w 0x0010
    lsr
    sta 0x0005,Y
    lda.w 0x0008,X
    clc
    adc.w 0x0012
    lsr
    sta 0x0008,Y
    rts

;-----

_81AB03:
    ldx.b 0x0B
    jmp (.AB08,X)

.AB08: d16[.AB10, .AB15, .AB1A, .AB1F]

.AB10:
    jsl update_pos_xy.neg_ay_ax
    rts

.AB15:
    jsl update_pos_xy.neg_ay_pos_ax
    rts

.AB1A:
    jsl update_pos_xy.pos_ay_neg_ax
    rts

.AB1F:
    jsl update_pos_xy.pos_ay_ax
    rts

;-----

_81AB24:
    ldx.b 0x01
    jsr (.AB2A,X)
    rtl

.AB2A: d16[.AB30, .AB5E, .ABF7]

.AB30:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x04
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x03
    sta.b 0x28
    lda.b 0x11
    sta.b 0x3C
    stz.b 0x12
    rep #0x10
    ldx.w #0xC071
    stx.b 0x20
    sep #0x10
    jsl 0x8280B4
    lda.b #0x09
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rts

.AB5E:
    lda.b 0x3C
    sta.b 0x11
    ldx.b 0x02
    jsr (.ABB2,X)
    rep #0x30
    ldx.b 0x3A
    lda.w 0x0005,X
    sec
    sbc.b 0x05
    bpl .AB77

    eor.w #0xFFFF
    inc
.AB77:
    cmp.w #0x0120
    sep #0x30
    bcc .AB85

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rts

.AB85:
    jsl 0x8280B4
    jsl 0x849B03
    beq .AB9F

.AB8F:
    rep #0x10
    ldx.b 0x3A
    inc.w 0x0035,X
    sep #0x10
    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rts

.AB9F:
    jsl 0x849B43
    beq .ABB1

    bpl .ABAD

    jsl 0x84A4AB
    bra .AB8F

.ABAD:
    lda.b #0x0E
    trb.b 0x11
.ABB1:
    rts

.ABB2: d16[.ABB6, .ABE2]

.ABB6:
    lda.b #0x02
    sta.b 0x02
    jsl 0x84A07C
    sta.w 0x0000
    lda.b #0x00
    bit.b 0x11
    bvc .ABC9

    lda.b #0x20
.ABC9:
    clc
    adc.w 0x0000
    tax
    lda.w 0x86C075,X
    asl
    asl
    tax
    rep #0x20
    lda.w 0x86EEBA,X
    sta.b 0x1A
    lda.w 0x86EEBC,X
    sta.b 0x1C
    sep #0x20
.ABE2:
    jsl update_pos_xy.no_accel
    jsl 0x82806E
    bcc .ABF2

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.ABF2:
    jsl 0x848EEA
    rts

.ABF7:
    jsl 0x8283A3
    rts

;-----

_81ABFC:
    ldx.b 0x01
    jsr (.AC02,X)
    rtl

.AC02: d16[.AC08, .AC5A, .AE19]

.AC08:
    lda.b #0x02
    sta.b 0x01
    lda.b #0x02
    sta.b 0x27
    lda.b #0x01
    sta.b 0x26
    sta.b 0x28
    lda.w 0x0C2B
    bpl .AC1F

    lda.b #0x05
    sta.b 0x28
.AC1F:
    lda.l 0x7F8304
    sta.b 0x11
    lda.b #0x06
    sta.b 0x12
    sta.b 0x2F
    stz.b 0x30
    lda.b #0x40
    sta.b 0x1E
    rep #0x10
    ldx.w #0xC0B5
    stx.b 0x20
    sep #0x10
    stz.b 0x38
    jsl get_rng
    cmp.b #0x0A
    bne .AC48

    lda.b #0x03
    sta.b 0x38
.AC48:
    jsl 0x8280B4
    lda.b #0x0B
    sta.b 0x16
    lda.b #0x02
    clc
    adc.b 0x38
    jsl 0x848F07
    rts

.AC5A:
    jsl 0x82806E
    bcc .AC67

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
    rts

.AC67:
    ldx.b 0x02
    jsr (.ACAB,X)
    jsl 0x8280B4
    lda.b 0x11
    and.b #0xC0
    ora.l 0x7F8304
    sta.b 0x11
    jsl 0x849B43
    beq .ACA2

    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    bne .ACA2

    lda.b #0x04
    sta.b 0x01
    jsl 0x84A4AB
    ldx.b 0x38
    beq .AC9B

    jsl 0x84A3F7
    rts

.AC9B:
    lda.b #0x01
    jsl 0x84A37F
    rts

.ACA2:
    jsl 0x849B03
    jsl 0x8491BE
    rts

.ACAB: d16[.ACB3, .AD1A, .AD7B, .ADB1]

.ACB3:
    ldx.b 0x03
    bne .ACD6

    inc.b 0x03
    lda.b #0x21
    sta.b 0x39
    sta.b 0x30
    lda.b #0x08
    sta.b 0x37
    rep #0x20
    lda.w #0x0020
    sta.b 0x1C
    sep #0x20
    lda.b #0x02
    clc
    adc.b 0x38
    jsl 0x848F07
    rts

.ACD6:
    rep #0x10
    ldx.b 0x3A
    lda.w 0x0027,X
    and.b #0x7F
    sep #0x10
    bne .ACF0

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    stz.b 0x1A
    stz.b 0x1B
    stz.b 0x30
    rts

.ACF0:
    dec.b 0x39
    bne .AD07

    rep #0x21
    lda.b 0x08
    adc.w #0xFFF8
    sta.b 0x08
    sep #0x20
    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    stz.b 0x30
.AD07:
    dec.b 0x37
    bne .AD15

    lda.b #0x08
    sta.b 0x37
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
.AD15:
    jsl update_pos_y
    rts

.AD1A:
    ldx.b 0x03
    bne .AD56

    inc.b 0x03
    rep #0x20
    ldx.b #0x00
    lda.w 0x0BAD
    cmp.b 0x05
    bcc .AD2D

    ldx.b #0x40
.AD2D:
    stx.b 0x37
    lda.w #0x0200
    bit.b 0x36
    bvs .AD39

    lda.w #0xFE00
.AD39:
    sta.b 0x1A
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
    lda.b #0x08
    sta.b 0x37
    lda.b #0x08
    sta.b 0x39
    stz.b 0x1F
    lda.b #0x02
    clc
    adc.b 0x38
    jsl 0x848F07
    rts

.AD56:
    dec.b 0x39
    bne .AD5E

    lda.b #0x02
    sta.b 0x12
.AD5E:
    jsl update_pos_xy.neg_ay_ax
    lda.b 0x1D
    bpl .AD6C

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.AD6C:
    dec.b 0x37
    bne .AD7A

    lda.b #0x08
    sta.b 0x37
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
.AD7A:
    rts

.AD7B:
    ldx.b 0x03
    bne .AD8F

    inc.b 0x03
    stz.b 0x1C
    stz.b 0x1D
    lda.b #0x02
    clc
    adc.b 0x38
    jsl 0x848F07
    rts

.AD8F:
    lda.b 0x2B
    bit.b #0x04
    beq .AD9E

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    stz.b 0x2F
    rts

.AD9E:
    jsl update_pos_xy.neg_ay_ax
    dec.b 0x37
    bne .ADB0

    lda.b #0x08
    sta.b 0x37
    lda.b 0x11
    eor.b #0x40
    sta.b 0x11
.ADB0:
    rts

.ADB1:
    ldx.b 0x03
    bne .ADE6

    inc.b 0x03
    rep #0x20
    ldx.b #0x00
    lda.w 0x0BAD
    cmp.b 0x05
    bcc .ADC4

    ldx.b #0x40
.ADC4:
    stx.b 0x37
    lda.w #0x0080
    bit.b 0x36
    bvs .ADD0

    lda.w #0xFF80
.ADD0:
    sta.b 0x1A
    sep #0x20
    lda.b 0x11
    and.b #0x3F
    ora.b 0x37
    sta.b 0x11
    lda.b #0x03
    clc
    adc.b 0x38
    jsl 0x848F07
    rts

.ADE6:
    lda.b 0x2B
    bit.b #0x04
    bne .ADF9

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
    sta.b 0x2F
    lda.b #0x08
    sta.b 0x37
    rts

.ADF9:
    bit.b #0x03
    beq .AE10

    rep #0x20
    lda.b 0x1A
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    lda.b 0x11
    eor.w #0x0040
    sta.b 0x11
    sep #0x20
.AE10:
    jsl update_pos_x
    jsl 0x848EEA
    rts

.AE19:
    jsl 0x8283A3
    rts

;-----

_81AE1E:
    ldy.b #0x11
    lda (0x0C),Y
    sta.b 0x11
    ldx.b 0x01
    jsr (.AE78,X)
    jsl 0x849B43
    jsl 0x849B03
    beq .AE4D

    lda.b 0x26
    bpl .AE4D

    lda.b #0x0A
    sta.b 0x01
    jsl 0x849F14
    lda.b #0x01
    sta.b 0x3A
    lda.b #0x0C
    jsl 0x848F07
    stz.b 0x1A
    stz.b 0x1B
.AE4D:
    lda.b 0x01
    cmp.b #0x10
    beq .AE6D

    ldy.b #0x37
    lda (0x0C),Y
    beq .AE6D

    lda.b #0x10
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    stz.b 0x27
    lda.b 0x3A
    beq .AE6D

    stz.b 0x3A
    jsl 0x849F79
.AE6D:
    lda.b 0x00
    bne .AE74

    stz.b 0x01
    rtl

.AE74:
    jml 0x8280B4

.AE78: d16[.AE8A, .AF0F, .AF5F, .AF6C, .AF90, .AFC4, .AFFE, .B07E, .B0B9]

.AE8A:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x18
    stz.b 0x3A
    lda.b #0x02
    sta.b 0x12
    stz.b 0x37
    lda.b #0x16
    sta.b 0x16
    lda.b #0x06
    jsl 0x848F07
    lda.b 0x11
    asl
    asl
    rep #0x20
    bcs .AEB7

    lda.w #0xFA00
    sta.b 0x1A
    lda.b 0x05
    sec
    sbc.w #0x0024
    bra .AEC2

.AEB7:
    lda.w #0x0600
    sta.b 0x1A
    lda.b 0x05
    clc
    adc.w #0x0024
.AEC2:
    sta.b 0x05
    stz.b 0x1C
    lda.b 0x05
    sta.b 0x31
    lda.w #0xC0BF
    sta.b 0x20
    sep #0x20
    lda.b #0x30
    sta.b 0x1F
    stz.b 0x1E
    lda.b #0x01
    sta.b 0x27
    stz.b 0x28
    jsr _81B112
    lda.b 0x0B
    bmi .AEE5

    rts

.AEE5:
    lda.b #0x0E
    sta.b 0x01
    lda.b #0x01
    sta.b 0x3A
    lda.b #0x0C
    jsl 0x848F07
    rep #0x20
    lda.b 0x1A
    asl
    lda.w #0x0800
    bcc .AF00

    lda.w #0xF800
.AF00:
    sta.b 0x1A
    lda.b 0x05
    sta.w 0x0BAD
    lda.b 0x08
    sta.w 0x0BB0
    sep #0x20
    rts

.AF0F:
    lda.b 0x11
    asl
    asl
    bcc .AF1B

    jsl update_pos_xy.neg_ay_ax
    bra .AF1F

.AF1B:
    jsl update_pos_xy.neg_ay_pos_ax
.AF1F:
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .AF46

    lda.b #0x06
    jsl 0x848F07
    lda.b #0x10
    jsl 0x84A311
    lda.b #0x3C
    sta.b 0x38
    lda.b #0x06
    sta.b 0x01
    lda.b #0x01
    sta.b 0x37
    lda.b #0x02
    sta.b 0x26
    rts

.AF46:
    rep #0x20
    lda.b 0x1A
    sep #0x20
    bne .AF5A

    lda.b #0x1E
    sta.b 0x38
    lda.b #0x04
    sta.b 0x01
    lda.b #0x02
    sta.b 0x26
.AF5A:
    jsl 0x848EEA
    rts

.AF5F:
    dec.b 0x38
    bne .AF67

    lda.b #0x08
    sta.b 0x01
.AF67:
    jsl 0x848EEA
    rts

.AF6C:
    dec.b 0x38
    bne .AF8F

    stz.b 0x1A
    stz.b 0x1B
    stz.b 0x37
    lda.w 0x0BD8
    bne .AF82

    jsl get_rng
    lsr
    bcc .AF87

.AF82:
    lda.b #0x08
    sta.b 0x01
    rts

.AF87:
    lda.b #0x0C
    sta.b 0x01
    lda.b #0x14
    sta.b 0x38
.AF8F:
    rts

.AF90:
    jsl 0x848EEA
    lda.b 0x11
    asl
    asl
    bcc .AFA0

    jsl update_pos_xy.neg_ay_ax
    bra .AFA4

.AFA0:
    jsl update_pos_xy.neg_ay_pos_ax
.AFA4:
    rep #0x20
    lda.b 0x31
    sec
    sbc.b 0x05
    sep #0x20
    beq .AFB9

    lda.b #0x00
    ror
    lsr
    eor.b 0x11
    and.b #0x40
    bne .AFC3

.AFB9:
    lda.b #0x01
    ldy.b #0x36
    sta (0x0C),Y
    jsl 0x8283A3
.AFC3:
    rts

.AFC4:
    lda.b 0x11
    asl
    asl
    bcc .AFD0

    jsl update_pos_xy.neg_ay_ax
    bra .AFD4

.AFD0:
    jsl update_pos_xy.neg_ay_pos_ax
.AFD4:
    rep #0x20
    lda.b 0x05
    sta.w 0x0BAD
    lda.b 0x08
    sta.w 0x0BB0
    lda.b 0x31
    sec
    sbc.b 0x05
    sep #0x20
    beq .AFF3

    lda.b #0x00
    ror
    lsr
    eor.b 0x11
    and.b #0x40
    bne .AFFD

.AFF3:
    lda.b #0x80
    ldy.b #0x36
    sta (0x0C),Y
    jsl 0x8283A3
.AFFD:
    rts

.AFFE:
    lda.b 0x38
    beq .B008

    dec.b 0x38
    bne .B07D

    stz.b 0x37
.B008:
    rep #0x10
    ldx.b 0x0C
    lda.b 0x11
    and.b #0x40
    rep #0x20
    beq .B032
    lda.w 0x0B9C
    and.w #0x0003
    asl
    tax
    lda.w 0xC0C9,X
    clc
    adc.b 0x31
    sta.b 0x31
    lda.w 0xC0C9,X
    ldx.b 0x0C
    clc
    adc.w 0x0005,X
    sta.w 0x0005,X
    bra .B056

.B032:
    lda.w 0x0B9C
    and.w #0x0003
    asl
    tax
    lda.w 0xC0C9,X
    eor.w #0xFFFF
    inc
    clc
    adc.b 0x31
    sta.b 0x31
    lda.w 0xC0C9,X
    eor.w #0xFFFF
    inc
    ldx.b 0x0C
    clc
    adc.w 0x0005,X
    sta.w 0x0005,X
.B056:
    sep #0x10
    lda.b 0x05
    sec
    sbc.b 0x31
    sep #0x20
    lda.b #0x00
    ror
    ror
    eor.b 0x11
    and.b #0x40
    beq .B073

    jsl 0x8283A3
    lda.b #0x01
    ldy.b #0x36
    sta (0x0C),Y
.B073:
    lda.w 0x0B9C
    and.b #0x03
    bne .B07D

    jsr _81B14A
.B07D:
    rts

.B07E:
    jsl update_pos_x
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x03
    beq .B0AA

    lda.b #0x02
    sta.w 0x0BCE
    jsl 0x849F2A
    lda.b #0x06
    sta.b 0x01
    lda.b #0x1E
    sta.b 0x38
    lda.b #0x10
    jsl 0x84A311
    lda.b #0x06
    jsl 0x848F07
    rts

.B0AA:
    rep #0x20
    lda.b 0x05
    sta.w 0x0BAD
    lda.b 0x08
    sta.w 0x0BB0
    sep #0x20
    rts

.B0B9:
    ldx.b 0x02
    jsr (.B0CB,X)
    lda.b 0x0E
    and.b #0x7F
    bne .B0CA

    jsl 0x8283A3
    sep #0x10
.B0CA:
    rts

.B0CB: d16[.B0D1, .B0E4, .B0FB]

.B0D1:
    lda.b #0x02
    sta.b 0x02
    rep #0x20
    lda.w #0x0400
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    stz.b 0x1F
.B0E4:
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .B0FB

    lda.b #0x04
    sta.b 0x02
    rep #0x20
    lda.w #0x0300
    sta.b 0x1C
    sep #0x20
.B0FB:
    jsl update_pos_xy.neg_ay
    rts

;-----

_81B100:
    rep #0x10
    ldx.b 0x0C
    lda.b 0x37
    ora.b #0x01
    sta.w 0x0036,X
    inc.b 0x39
    jsl 0x8283A3
    rts

;-----

_81B112:
    lda.b #0x01
.B114:
    pha
    jsl 0x8282D3
    bne .B146

    inc.w 0x0000,X
    lda.b #0x0D
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
    lda.b 0x0C
    sta.w 0x001A,X
    sep #0x20
    pla
    sta.w 0x000B,X
    inc
    cmp.b #0x0B
    bcc .B114

    sep #0x10
    rts

.B146:
    sep #0x30
    pla
    rts

;-----

_81B14A:
    jsl 0x8282D3
    bne .B184

    inc.w 0x0000,X
    stz.w 0x000B,X
    lda.b #0x09
    sta.w 0x000A,X
    ldy.b 0x0C
    lda.b 0x11
    and.b #0x40
    rep #0x20
    beq .B16A

    lda.w #0x0010
    bra .B16D

.B16A:
    lda.w #0xFFF0
.B16D:
    sta.w 0x0000
    lda 0x0005,Y
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    lda 0x0008,Y
    clc
    adc.w #0x0020
    sta.w 0x0008,X
.B184:
    sep #0x30
    rts

;-----

_81B187:
    lda.b #0x03
    sta.b 0x28
    lda.b 0x3D
    beq .B19A

    rep #0x10
    ldx.b 0x37
    lda.w 0x0000,X
    sta.b 0x3D
    sep #0x10
.B19A:
    lda.b 0x3C
    tsb.b 0x11
    ldx.b 0x01
    jsr (.B1C7,X)
    jsl 0x8280B4
    jsl 0x82806E
    bcs .B1C1

    jsl 0x849B43
    beq .B1B7

    lda.b #0x0E
    trb.b 0x11
.B1B7:
    lda.b 0x27
    and.b #0x7F
    bne .B1C4

    jsl 0x84A4AB
.B1C1:
    jsr _81B353
.B1C4:
    stz.b 0x28
    rtl

.B1C7: d16[.B1D1, .B215, .B20E, .B236, .B286]

.B1D1:
    lda.b #0x0B
    sta.b 0x0A
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x3D
    lda.b #0x08
    sta.b 0x0A
    lda.b 0x0D
    sta.b 0x01
    lda.b 0x11
    and.b #0x0E
    sta.b 0x3C
    lda.b 0x0C
    cmp.b #0x02
    bne .B1F3

    inc.b 0x30
.B1F3:
    jsl 0x848F07
    lda.b #0x03
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b #0x7D
    jsl _80888B
    rep #0x20
    lda.w #0xC0D9
    sta.b 0x20
    sep #0x20
.B20E:
    lda.b #0x04
    sta.b 0x12
    jmp 0x81B2B6

.B215:
    lda.b 0x02
    bne .B223

    inc.b 0x02
    lda.b #0x10
    sta.b 0x39
    lda.b #0x06
    sta.b 0x12
.B223:
    rep #0x20
    dec.b 0x08
    sep #0x20
    dec.b 0x39
    bne .B233

    lda.b #0x04
    sta.b 0x01
    stz.b 0x02
.B233:
    jmp 0x81B2B6

.B236:
    lda.b 0x02
    bne .B25A

    inc.b 0x02
    rep #0x30
    ldx.b 0x37
    lda.w 0x0005,X
    sec
    sbc.b 0x05
    bcc .B24D

    lda.w #0xFD00
    bra .B250

.B24D:
    lda.w #0x0300
.B250:
    sta.b 0x1A
    sep #0x20
    lda.b #0x04
    jsl 0x848F07
.B25A:
    jsl update_pos_x
    jsr .B2B6
    jsl 0x849B03
    beq .B27B

    jsl 0x84A4AB
    lda.b 0x3D
    beq .B276

    rep #0x10
    ldx.b 0x37
    inc.w 0x003D,X
.B276:
    jsr _81B353
    sep #0x10
.B27B:
    jsl 0x8491BE
    lda.b 0x2B
    beq .B285

    stz.b 0x27
.B285:
    rts

.B286:
    lda.b 0x02
    bne .B298

    inc.b 0x02
    rep #0x20
    stz.b 0x1C
    stz.b 0x1A
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
.B298:
    jsl update_pos_xy.neg_ay
    rep #0x20
    lda.b 0x08
    sec
    sbc.b 0x3A
    bcc .B2B1

    lda.b 0x3A
    sta.b 0x08
    ldx.b #0x04
    stx.b 0x01
    ldx.b #0x00
    stx.b 0x02
.B2B1:
    sep #0x20
    jmp .B2B6

.B2B6:
    lda.w 0x0BCF
    and.b #0x7F
    bne .B2BE

    rts

.B2BE:
    rep #0x10
    stz.b 0x2C
    ldx.w #0xC0D1
    stx.b 0x20
    ldx.w #0x0BA8
    jsl 0x849C0E
    ldx.w #0xC0D5
    stx.b 0x20
    bcc .B31C

    rep #0x20
    lda.w 0x0004
    cmp.w 0x0006
    beq .B302

    bcc .B302

    lda.w 0x0002
    bpl .B2EE

    inc
    clc
    adc.w 0x0BB0
    sta.w 0x0BB0
.B2EE:
    sep #0x20
    lda.w 0x0003
    bmi .B2F9

    lda.b #0x08
    bra .B2FD

.B2F9:
    lda.b #0x04
    sta.b 0x2C
.B2FD:
    tsb.w 0x0BD4
    bra .B31C

.B302:
    lda.w 0x0000
    clc
    adc.w 0x0BAD
    sta.w 0x0BAD
    sep #0x20
    lda.w 0x0001
    bmi .B317

    lda.b #0x02
    bra .B319

.B317:
    lda.b #0x01
.B319:
    tsb.w 0x0BD4
.B31C:
    sep #0x10
    lda.b 0x2C
    beq .B332

    rep #0x20
    lda.b 0x05
    sec
    sbc.b 0x22
    clc
    adc.w 0x0BAD
    sta.w 0x0BAD
    sep #0x20
.B332:
    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    ldx.w #0xC0D9
    stx.b 0x20
    sep #0x10
    bcc .B352

    lda.w 0x0001
    bmi .B34D

    lda.b #0x02
    bra .B34F

.B34D:
    lda.b #0x01
.B34F:
    tsb.w 0x0BD4
.B352:
    rts

;-----

_81B353:
    php
    sep #0x20
    rep #0x10
    lda.b 0x3D
    beq .B373

    ldx.b 0x37
    rep #0x20
    tdc
    cmp.w 0x0037,X
    bne .B36B

    stz.w 0x0037,X
    bra .B373

.B36B:
    cmp.w 0x0039,X
    bne .B373

    stz.w 0x0039,X
.B373:
    jsl 0x8283A3
    plp
    rts

;-----

_81B379:
    ldx.b 0x01
    bne .B3BF

    inc.b 0x01
    stz.b 0x30
    lda.l 0x7F8249
    sta.b 0x18
    stz.b 0x28
    lda.b 0x11
    and.b #0x40
    ora.l 0x7F8349
    sta.b 0x11
    stz.b 0x12
    lda.b #0x01
    sta.b 0x26
    sta.b 0x27
    rep #0x20
    lda.w #0x0300
    bit.b 0x10
    bvs .B3A7

    lda.w #0xFD00
.B3A7:
    sta.b 0x1A
    lda.w #0xC2D0
    sta.b 0x20
    sep #0x20
    lda.b #0x2A
    sta.b 0x10
    lda.b #0x4F
    sta.b 0x16
    lda.b #0x19
    jsl 0x848F07
    rtl

.B3BF:
    dec.b 0x10
    beq .B3C9

    jsl 0x82806E
    bcc .B3CD

.B3C9:
    jml 0x8283A3

.B3CD:
    jsl update_pos_x
    jsl 0x8280B4
    jml 0x849B03

;-----

_81B3D9:
    ldx.b 0x01
    bne .B444

    inc.b 0x01
    stz.b 0x30
    lda.l 0x7F8250
    sta.b 0x18
    lda.b 0x11
    and.b #0x40
    ora.l 0x7F8350
    sta.b 0x11
    stz.b 0x12
    stz.b 0x26
    lda.b #0x01
    sta.b 0x27
    jsl 0x84A07C
    sta.w 0x0000
    lda.b #0x00
    bit.b 0x11
    bvc .B408

    lda.b #0x20
.B408:
    clc
    adc.w 0x0000
    tax
    lda.w 0x86C075,X
    asl
    asl
    tax
    rep #0x20
    lda.w 0x86EEBA,X
    sta.b 0x1A
    lda.w 0x86EEBC,X
    sta.b 0x1C
    lda.w #0xC2D4
    sta.b 0x20
    jsl get_rng
    and.w #0x0003
    bne .B437

    lda.b 0x1A
    asl
    sta.b 0x1A
    lda.b 0x1C
    asl
    sta.b 0x1C
.B437:
    sep #0x20
    lda.b #0x52
    sta.b 0x16
    lda.b #0x12
    jsl 0x848F07
    rtl

.B444:
    jsl 0x82806E
    bcc .B44E

    jml 0x8283A3

.B44E:
    ldx.b 0x02
    jsr (.B457,X)
    jml 0x8280B4

.B457: d16[.B45B, .B47E]

.B45B:
    jsl update_pos_xy.no_accel
    jsl 0x849B03
    beq .B479

    lda.b #0x02
    sta.b 0x02
    lda.b #0x09
    jsl _80888B
    lda.b #0x13
    jsl 0x848F07
    jsl 0x84A04D
.B479:
    jsl 0x848EEA
    rts

.B47E:
    rep #0x20
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    sta.b 0x08
    sep #0x20
    lda.w 0x0BCF
    and.b #0x7F
    bne .B497

    jsl 0x8283A3
.B497:
    jsl 0x848EEA
    rts

;-----

_81B49C:
    ldx.b 0x01
    bne .B4D3

    inc.b 0x01
    stz.b 0x30
    lda.l 0x7F825C
    sta.b 0x18
    lda.l 0x7F835C
    sta.b 0x11
    stz.b 0x12
    lda.b #0x04
    sta.b 0x26
    sta.b 0x27
    lda.b #0xDC
    sta.b 0x20
    lda.b #0x61
    sta.b 0x16
    lda.b #0x02
    bit.w 0x1F90
    bvc .B4C9

    lda.b #0x05
.B4C9:
    jsl 0x848F07
    lda.b #0x44
    jsl _80888B
.B4D3:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .B4DF

    jml 0x8283A3

.B4DF:
    bit.b #0x40
    beq .B4F5

    sta.b 0x30
    bit.w 0x1F90
    bvc .B4F5

    rep #0x21
    lda.b 0x08
    adc.w #0xFFBC
    sta.b 0x08
    sep #0x20
.B4F5:
    rep #0x20
    lda.b 0x0F
    and.w #0x003F
    clc
    adc.w #0xC2DC
    sta.b 0x20
    sep #0x20
    jsl 0x8280B4
    jml 0x849B03

;-----

    incsrc "obj/icy_penguigo.asm"

;-----

_81BB77:
    ldy.b #0x27
    lda (0x0C),Y
    and.b #0x7F
    bne .BB83

    jml 0x8283A3

.BB83:
    ldx.b 0x01
    jsr (.BBDC,X)
    lda.b 0x2B
    and.b #0x03
    beq .BB9B

.BB8E:
    lda.b #0x78
    jsl _80888B
    jsr _81BF8F
    jml 0x8283A3

.BB9B:
    jsl 0x849B03
    bne .BB8E

    jsl 0x849B43
    beq .BBA9

    bmi .BB8E

.BBA9:
    rep #0x10
    ldx.w #0x1428
.BBAE:
    lda.w 0x0000,X
    beq .BBC9

    lda.w 0x000A,X
    cmp.b #0x1A
    bne .BBC9

    lda.w 0x000B,X
    beq .BBC9

    jsl 0x849C0E
    bcc .BBC9

    sep #0x10
    bra .BB8E

.BBC9:
    rep #0x30
    txa
    clc
    adc.w #0x0040
    tax
    sep #0x20
    cpx.w #0x1628
    bcc .BBAE

    jml 0x8280B4

.BBDC: d16[.BBE4, .BC56, .BC56, .BC72]

.BBE4:
    lda.l 0x7F8261
    sta.b 0x18
    lda.l 0x7F8362
    ora.b #0x01
    tsb.b 0x11
    lda.b #0x67
    sta.b 0x16
    stz.b 0x2B
    lda.b #0x03
    sta.b 0x27
    stz.b 0x28
    lda.b #0x02
    sta.b 0x26
    stz.b 0x30
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x02
    sta.b 0x12
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0400
    bcs .BC1A

    lda.w #0xFC00
.BC1A:
    sta.b 0x1A
    lda.w #0xC44A
    sta.b 0x20
    sep #0x20
    lda.b #0x0A
    jsl 0x848F07
    jsl get_rng
    and.b #0x0F
    cmp.b #0x0A
    bcs .BC38

    lda.b #0x06
    sta.b 0x01
    rts

.BC38:
    rep #0x20
    lda.w #0x0221
    sta.b 0x1C
    lda.w #0x0200
    ldx.b 0x1B
    bpl .BC49

    lda.w #0xFE00
.BC49:
    sta.b 0x1A
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x02
    sta.b 0x01
    rts

.BC56:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .BC71

    inc.b 0x01
    inc.b 0x01
    rep #0x20
    lda.w #0x018B
    sta.b 0x1C
    sep #0x20
.BC71:
    rts

.BC72:
    jsl update_pos_x
    jsl 0x8491BE
    rts

;-----

_81BC7B:
    ldy.b #0x27
    lda (0x0C),Y
    and.b #0x7F
    bne .BC87

    jml 0x8283A3

.BC87:
    ldx.b 0x01
    jmp (.BC8C,X)

.BC8C: d16[.BC98, .BD0C, .BD4A, .BD79, .BD79, .BDBB]

.BC98:
    lda.b 0x0B
    bne .BCD7

    lda.b #0x02
    sta.b 0x01
    lda.l 0x7F8261
    sta.b 0x18
    lda.l 0x7F8362
    ora.b #0x01
    tsb.b 0x11
    lda.b #0x67
    sta.b 0x16
    lda.b #0x0F
    jsl 0x848F07
    lda.b 0x11
    asl
    asl
    rep #0x20
    lda.w #0x0200
    bcs .BCC6

    lda.w #0xFE00
.BCC6:
    sta.b 0x1A
    lda.w #0xC44A
    sta.b 0x20
    sep #0x20
    lda.b #0x28
    sta.b 0x34
    jml 0x8280B4

.BCD7:
    lda.l 0x7F8262
    sta.b 0x18
    lda.l 0x7F8362
    tsb.b 0x11
    lda.b #0x68
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rep #0x20
    lda.w #0xC454
    sta.b 0x20
    sep #0x20
    lda.b #0x04
    sta.b 0x01
    lda.b #0x03
    sta.b 0x28
    lda.b #0x08
    sta.b 0x27
    lda.b #0x04
    sta.b 0x26
    stz.b 0x30
    jml 0x8280B4

.BD0C:
    jsl update_pos_x
    jsl 0x848EEA
    dec.b 0x34
    bne .BD1C

    jml 0x8283A3

.BD1C:
    lda.w 0x0C16
    bne .BD46

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .BD44

    jsl 0x8282D3
    bne .BD44

    inc.w 0x0000,X
    lda.b #0x08
    sta.w 0x000A,X
    stz.w 0x000B,X
    rep #0x20
    lda.b 0x0C
    sta.w 0x000C,X
.BD44:
    sep #0x30
.BD46:
    jml 0x8280B4

.BD4A:
    jsl 0x848EEA
    lda.b 0x0F
    bpl .BD75

    jsl 0x8491BE
    lda.b 0x2B
    beq .BD61

    jsr _81BF8F
    jml 0x8283A3

.BD61:
    lda.b #0x06
    sta.b 0x01
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
.BD75:
    jml 0x8280B4

.BD79:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    jsl 0x849B03
    jsl 0x849B43
    beq .BD94

    bpl .BD94

    jsr _81BF8F
    jml 0x8283A3

.BD94:
    lda.b 0x2B
    and.b #0x04
    beq .BDA4

    inc.b 0x01
    inc.b 0x01
    lda.b #0x02
    sta.b 0x1D
    stz.b 0x1C
.BDA4:
    lda.b 0x2B
    and.b #0x03
    beq .BDB7

    lda.b #0x4C
    jsl _80888B
    jsr _81BF8F
    jml 0x8283A3

.BDB7:
    jml 0x8280B4

.BDBB:
    lda.w 0x1F3F
    beq .BDD7

    lda.w 0x1F40
    asl
    asl
    rep #0x20
    lda.w #0x0200
    bcs .BDCF

    lda.w #0xFE00
.BDCF:
    sta.b 0x1A
    sep #0x20
    jsl update_pos_x
.BDD7:
    jsl 0x8491BE
    jsl 0x849B03
    jsl 0x849B43
    beq .BDF4

    bpl .BDF4

.BDE7:
    lda.b #0x4C
    jsl _80888B
    jsr _81BF8F
    jml 0x8283A3

.BDF4:
    lda.b 0x2B
    and.b #0x03
    bne .BDE7

    rep #0x10
    ldx.b 0x0C
    lda.w 0x0027,X
    and.b #0x7F
    beq .BDE7

    jsl 0x849C0E
    sep #0x10
    bcs .BDE7

    jml 0x8280B4

;-----

_81BE11:
    ldy.b #0x27
    lda (0x0C),Y
    and.b #0x7F
    bne .BE1D

    jml 0x828398

.BE1D:
    ldx.b 0x01
    jmp (.BE22,X)

.BE22: d16[.BE28, .BE93, .BEFB]

.BE28:
    lda.l 0x7F8362
    sta.b 0x11
    lda.b 0x0B
    bne .BE71

    lda.b #0x02
    sta.b 0x12
    lda.l 0x7F8262
    sta.b 0x18
    lda.b #0x02
    sta.b 0x01
    lda.w 0x0C16
    bne .BE56

    lda.w 0x0C32
    bne .BE56

    lda.w 0x0BCF
    and.b #0x7F
    beq .BE56

    lda.w 0x1F0C
    beq .BE5A

.BE56:
    jml 0x828398

.BE5A:
    jsl 0x849FE6
    lda.b #0x68
    sta.b 0x16
    lda.b #0x01
    jsl 0x848F07
    rep #0x20
    lda.w #0x012C
    sta.b 0x1A
    bra .BE93

.BE71:
    lda.l 0x7F8261
    sta.b 0x18
    lda.b #0x01
    tsb.b 0x11
    stz.b 0x12
    lda.b #0x04
    sta.b 0x01
    lda.b #0x67
    sta.b 0x16
    lda.b #0x0B
    jsl 0x848F07
    lda.b #0x40
    sta.b 0x1E
    jml 0x8280B4

.BE93:
    rep #0x20
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    sta.b 0x08
    sep #0x20
    lda.b #0x40
    trb.b 0x11
    lda.w 0x0BB9
    and.b #0x40
    tsb.b 0x11
    lda.w 0x0C16
    beq .BEB8

    lda.w 0x0BCF
    and.b #0x7F
    bne .BEC5

.BEB8:
    lda.b #0x4C
    jsl _80888B
    jsr _81BF8F
    jml 0x828398

.BEC5:
    rep #0x20
    lda.w 0x0BE3
    beq .BEDB

    lda.b 0x1A
    sec
    sbc.w #0x000A
    beq .BED6

    bpl .BED9

.BED6:
    lda.w #0x0001
.BED9:
    sta.b 0x1A
.BEDB:
    dec.b 0x1A
    sep #0x20
    bne .BEF7

    lda.w 0x0C32
    bne .BEEA

    jsl 0x849FFE
.BEEA:
    lda.b #0x4C
    jsl _80888B
    jsr _81BF8F
    jml 0x828398

.BEF7:
    jml 0x8280B4

.BEFB:
    jsl update_pos_xy.neg_ay
    jsl 0x8280B4
    lda.b 0x0E
    bne .BF0B

    jml 0x828398

.BF0B:
    rtl

;-----

_81BF0C:
    lda.b 0x17
    bpl .BF51

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    bpl .BF51

    jsl 0x828358
    bne .BF4F

    inc.w 0x0000,X
    lda.b #0x1A
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.w #0x001A
    bcs .BF3C

    lda.w #0xFFE6
.BF3C:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0002
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.BF4F:
    sep #0x30
.BF51:
    rts

;-----

_81BF52:
    jsl 0x828358
    bne .BF8C

    inc.w 0x0000,X
    lda.b #0x1A
    sta.w 0x000A,X
    lda.b #0x01
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0x40
    sta.w 0x0011,X
    asl
    asl
    rep #0x20
    lda.w 0x0000
    bcs .BF79

    eor.w #0xFFFF
    inc
.BF79:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
.BF8C:
    sep #0x30
    rts

;-----

_81BF8F:
    lda.b #0x04
    sta.w 0x0000
.BF94:
    jsl 0x8282D3
    bne .C00C

    inc.w 0x0000,X
    lda.b #0x08
    sta.w 0x000A,X
    lda.w 0x0000
    sta.w 0x000B,X
    dec
    lsr
    rep #0x20
    lda.w #0x0008
    bcs .BFB4

    lda.w #0xFFF8
.BFB4:
    clc
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x0C
    sta.w 0x000C,X
    lda.w 0x0000
    dec
    lsr
    lsr
    lda.w #0x0004
    bcs .BFCD

    lda.w #0xFFFC
.BFCD:
    clc
    adc.b 0x08
    sta.w 0x0008,X
    jsl get_rng
    and.w #0x01FF
    clc
    adc.w #0x0080
    pha
    lda.w 0x0000
    inc
    lsr
    pla
    bcs .BFEB

    eor.w #0xFFFF
    inc
.BFEB:
    sta.w 0x001A,X
    jsl get_rng
    and.w #0x03FF
    pha
    lda.w 0x0000
    dec
    lsr
    lsr
    pla
    bcs .C002

    and.w #0x01FF
.C002:
    sta.w 0x001C,X
    sep #0x20
    dec.w 0x0000
    bne .BF94

.C00C:
    sep #0x30
    rts

;-----

_81C00F:
    lda.b 0x02
    asl
    asl
    asl
    sta.w 0x0000
    jsl get_rng
    and.b #0x0F
    clc
    adc.w 0x0000
    tax
    lda.w 0xC45E,X
    sta.b 0x02
    stz.b 0x03
    rts

;-----

    incsrc "obj/flammingle.asm"
    incsrc "obj/planty.asm"
    incsrc "obj/launcher_octopuld.asm"

;-----

_81CAF6:
    ldy.b #0x27
    lda (0x0C),Y
    and.b #0x7F
    bne .CB02

    jml 0x828398

.CB02:
    ldx.b 0x01
    jmp (.CB07,X)

.CB07: d16[.CB13, .CB5D, .CBD0, .CBD6, .CBDC, .CBE2]

.CB13:
    jsl 0x82827D
    lda.b #0x01
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    lda.b 0x11
    clc
    adc.b #0x02
    sta.b 0x11
    lda.b 0x0B
    lsr
    bcc .CB37

    lda.b #0x08
    sta.b 0x33
    lda.b #0x21
    bra .CB3D

    jsl 0x848F07
.CB37:
    lda.b #0x18
    sta.b 0x33
    lda.b #0x19
.CB3D:
    jsl 0x848F07
    lda.b 0x33
    asl
    asl
    tax
    rep #0x20
    lda.w 0xEE3A,X
    sta.b 0x1A
    lda.w 0xEE3C,X
    sta.b 0x1C
    lda.w #0xC700
    sta.b 0x20
    sep #0x20
    jml 0x8280B4

.CB5D:
    jsl update_pos_xy.no_accel
    lda.b 0x0B
    eor.w 0x0B9C
    lsr
    bcc .CBCE

    jsl 0x84A07C
    sec
    sbc.b 0x33
    beq .CBA2

    and.b #0x10
    beq .CB7A

    dec.b 0x33
    bra .CB7C

.CB7A:
    inc.b 0x33
.CB7C:
    lda.b 0x33
    and.b #0x1F
    sta.b 0x33
    asl
    asl
    tax
    rep #0x20
    lda.w 0xEE3A,X
    sta.b 0x1A
    lda.w 0xEE3C,X
    sta.b 0x1C
    sep #0x20
    lda.b 0x33
    eor.b #0x1F
    lsr
    clc
    adc.b #0x15
    jsl 0x848F07
    jmp .CBE6

.CBA2:
    rep #0x20
    lda.b 0x1A
    bpl .CBAC

    eor.w #0xFFFF
    inc
.CBAC:
    lsr
    lsr
    lsr
    lsr
    tax
    stx.b 0x1F
    lda.b 0x1C
    bpl .CBBB

    eor.w #0xFFFF
    inc
.CBBB:
    lsr
    lsr
    lsr
    lsr
    sep #0x20
    sta.b 0x1E
    lda.b 0x33
    lsr
    lsr
    and.b #0x06
    clc
    adc.b #0x04
    sta.b 0x01
.CBCE:
    bra .CBE6

.CBD0:
    jsl update_pos_xy.pos_ay_ax
    bra .CBE6

.CBD6:
    jsl update_pos_xy.neg_ay_pos_ax
    bra .CBE6

.CBDC:
    jsl update_pos_xy.neg_ay_ax
    bra .CBE6

.CBE2:
    jsl update_pos_xy.pos_ay_neg_ax
.CBE6:
    jsl 0x849B43
    bne .CBFB

    jsl 0x849B03
    bne .CBFF

    jsl 0x8280B4
    lda.b 0x0E
    beq .CBFF

    rtl

.CBFB:
    jsl 0x84A4AB
.CBFF:
    jml 0x828398

;-----

    incsrc "obj/rt_55j.asm"
    incsrc "obj/axe_max.asm"
    incsrc "obj/sine_faller.asm"

;-----

_81D53E:
    lda.b 0x3D
    tsb.b 0x11
    ldx.b 0x01
    jsr (.D5BE,X)
    lda.b 0x00
    bne .D54C

    rtl

.D54C:
    rep #0x20
    lda.b 0x38
    sta.b 0x20
    sep #0x20
    stz.b 0x31
    jsl 0x849B43
    beq .D586

    inc.b 0x31
    lda.b #0x0E
    trb.b 0x11
    lda.b 0x27
    and.b #0x7F
    beq .D57C

    lda.b #0x04
    sta.b 0x3B
    lda.b #0x0A
    cmp.b 0x01
    beq .D586

    lda.b 0x01
    sta.b 0x3C
    lda.b #0x0A
    sta.b 0x01
    bra .D586

.D57C:
    lda.b 0x3B
    beq .D586

    lda.b 0x3C
    sta.b 0x01
    stz.b 0x3B
.D586:
    rep #0x20
    lda.w #0xC8E2
    sta.b 0x20
    sep #0x20
    lda.b 0x00
    beq .D5BD

    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    bcs .D5A1

    eor.w #0xFFFF
    inc
.D5A1:
    cmp.w #0x0180
    bcs .D5AD

    lda.b 0x08
    cmp.w #0x0300
    bcc .D5B9

.D5AD:
    ldx.b 0x0B
    bmi .D5B5

    jml 0x828387

.D5B5:
    jml 0x828398

.D5B9:
    jml 0x8280B4

.D5BD:
    rtl

.D5BE: d16[.D5CE, .D6DE, .D802, .D98F, .DA14, 0x81DC48, .DA83, .DAB5]

.D5CE:
    stz.b 0x3B
    lda.b 0x0B
    bmi .D5EE

    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    sep #0x20
    bcc .D610

    lda.b #0x10
    sta.b 0x2A
    stz.b 0x29
    jsl 0x8490A0
    cmp.b #0x34
    bcc .D610

.D5EE:
    jsl 0x84A1D0
    cpy.b #0x00
    beq .D60C

    cpy.b #0x04
    bcs .D610

    rep #0x10
    ldx.w 0x0000
    lda.w 0x0012,X
    cmp.b #0x06
    sep #0x10
    bne .D60C

    lda.b #0x02
    bra .D61E

.D60C:
    lda.b #0x06
    bra .D61E

.D610:
    lda.b 0x0B
    bmi .D619

    jsl 0x828387
    rts

.D619:
    jsl 0x828398
    rts

.D61E:
    sta.b 0x12
    jsl 0x82827D
    lda.b 0x0B
    bpl .D62E

    lda.b #0x0C
    sta.b 0x01
    stz.b 0x35
.D62E:
    lda.b 0x11
    and.b #0x0E
    sta.b 0x3D
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x64
    sta.b 0x36
    lda.b #0x06
    jsl 0x848F07
    stz.b 0x37
    lda.b #0x05
    sta.b 0x27
    lda.b #0x02
    sta.b 0x26
    stz.b 0x3A
    jsl 0x828321
    beq .D662

    lda.b 0x0B
    bmi .D65D

    jsl 0x828387
    rts

.D65D:
    jsl 0x828398
    rts

.D662:
    rep #0x20
    tdc
    sta.w 0x0000
    cpx.w 0x0000
    bcs .D685

    txy
    phx
    ldx.w 0x0000
    lda.w #0x001F
    phb
    mvn 0x00,0x00
    plb
    plx
    stz.w 0x0001,X
    jsl 0x828398
    sep #0x30
    rts

.D685:
    tdc
    sta.w 0x0033,X
    stx.b 0x33
    lda.w #0xC8E2
    sta.b 0x20
    sta.b 0x38
    sep #0x20
    inc.w 0x0000,X
    lda.b #0x12
    sta.w 0x000A,X
    lda.b 0x12
    dec
    dec
    sta.w 0x0012,X
    lda.b 0x0B
    bpl .D6DB

    jsl 0x828321
    beq .D6BE

    ldx.b 0x33
    rep #0x20
    stz.w 0x0000,X
    stz.w 0x0002,X
    jsl 0x828398
    sep #0x30
    rts

.D6BE:
    inc.w 0x0000,X
    lda.b #0x1B
    sta.w 0x000A,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    tdc
    sta.w 0x0020,X
    lda.b 0x0C
    sta.w 0x000C,X
.D6DB:
    sep #0x30
    rts

.D6DE:
    ldx.b 0x02
    jsr (.D6E8,X)
    jsl 0x849B03
    rts

.D6E8: d16[.D6F0, .D739, .D78C, .D7C7]

.D6F0:
    lda.b 0x03
    bne .D6FC

    lda.b #0x30
    sta.b 0x1E
    stz.b 0x1F
    inc.b 0x03
.D6FC:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    rep #0x20
    lda.b 0x1C
    cmp.w #0xF800
    bpl .D712

    lda.w #0xF800
    sta.b 0x1C
.D712:
    sep #0x20
    lda.b 0x2B
    and.b #0x04
    beq .D731

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    stz.b 0x1C
    stz.b 0x1D
    stz.b 0x2F
    rep #0x10
    ldx.b 0x33
    lda.b #0x04
    sta.w 0x0037,X
    sep #0x10
.D731:
    jsl 0x848EEA
    jsr _81DB37
    rts

.D739:
    lda.b 0x03
    bne .D757

    inc.b 0x03
    lda.b #0x40
    trb.b 0x11
    lda.b 0x37
    tsb.b 0x11
    lda.b #0x07
    jsl 0x848F07
    stz.b 0x1C
    sep #0x20
    lda.b #0x10
    sta.b 0x1F
    stz.b 0x1E
.D757:
    jsr _81DB02
    jsl 0x8491BE
    lda.b 0x3A
    beq .D766

    dec.b 0x3A
    bne .D771

.D766:
    jsr _81DAEF
    beq .D771

    lda.b #0x04
    sta.b 0x02
    stz.b 0x03
.D771:
    jsr _81DBF2
    lda.b 0x2B
    and.b #0x04
    bne .D782

    lda.b #0xFF
    sta.b 0x2F
    stz.b 0x02
    stz.b 0x03
.D782:
    jsl 0x848EEA
    jsr _81DB37
    jmp 0x81DC6B

.D78C:
    lda.b 0x03
    bne .D796

    inc.b 0x03
    lda.b #0x20
    sta.b 0x35
.D796:
    dec.b 0x35
    bne .D7AB

    jsr _81DAEF
    beq .D7A5

    lda.b #0x06
    sta.b 0x02
    bra .D7A9

.D7A5:
    lda.b #0x02
    sta.b 0x02
.D7A9:
    stz.b 0x03
.D7AB:
    jsr _81DBF2
    jsr _81DB02
    jsl 0x848EEA
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    bne .D7C3

    stz.b 0x02
    stz.b 0x03
.D7C3:
    jsr _81DB37
    rts

.D7C7:
    lda.b 0x03
    bne .D7DB

    inc.b 0x03
    lda.b #0x10
    sta.b 0x1F
    lda.b #0x14
    sta.b 0x35
    lda.b #0x11
    jsl 0x848F07
.D7DB:
    lda.b 0x11
    and.b #0x40
    beq .D7E7

    jsl update_pos_xy.neg_ay_ax
    bra .D7EB

.D7E7:
    jsl update_pos_xy.neg_ay_pos_ax
.D7EB:
    jsl 0x8491BE
    dec.b 0x35
    bne .D801

    lda.b #0x02
    sta.b 0x02
    stz.b 0x03
    lda.b 0x11
    and.b #0x40
    eor.b #0x40
    sta.b 0x37
.D801:
    rts

.D802:
    ldx.b 0x02
    jsr (.D837,X)
    rep #0x20
    lda.w #0xC8F4
    sta.b 0x20
    sep #0x20
    jsl 0x849B03
    rep #0x20
    lda.w #0xC8E2
    sta.b 0x20
    sep #0x20
    rep #0x10
    ldx.b 0x33
    lda.w 0x002C,X
    sep #0x10
    beq .D82E

    lda.b #0xFF
    sta.b 0x35
    bra .D834

.D82E:
    dec.b 0x35
    bne .D834

    stz.b 0x27
.D834:
    jmp 0x81DB37

.D837: d16[.D841, .D87C, .D8D4, .D92C, .D953]

.D841:
    lda.b #0x04
    sta.b 0x27
    lda.b #0xFF
    sta.b 0x35
    stz.b 0x2F
    lda.b #0x07
    jsl 0x848F07
    rep #0x20
    lda.w #0xC8EC
    sta.b 0x38
    lda.b 0x1A
    bpl .D860

    eor.w #0xFFFF
    inc
.D860:
    cmp.w #0x0180
    sep #0x20
    beq .D86D

    bcc .D871

    lda.b #0x04
    bra .D873

.D86D:
    lda.b #0x06
    bra .D873

.D871:
    lda.b #0x02
.D873:
    sta.b 0x02
    lda.b #0x10
    sta.b 0x1F
    stz.b 0x1E
    rts

.D87C:
    lda.b 0x11
    and.b #0x40
    beq .D888

    jsl update_pos_xy.neg_ay_pos_ax
    bra .D88C

.D888:
    jsl update_pos_xy.neg_ay_ax
.D88C:
    jsl 0x8491BE
    rep #0x20
    lda.b 0x1A
    bpl .D89A

    eor.w #0xFFFF
    inc
.D89A:
    cmp.w #0x0180
    bcc .D8B3

    lda.b 0x1A
    bmi .D8A8

    lda.w #0x0180
    bra .D8AB

.D8A8:
    lda.w #0xFE80
.D8AB:
    sta.b 0x1A
    sep #0x20
    lda.b #0x06
    sta.b 0x02
.D8B3:
    sep #0x20
    lda.b 0x2B
    and.b #0x04
    bne .D8C7

    lda.b #0x08
    sta.b 0x02
    lda.b #0x30
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
.D8C7:
    jsl 0x848EEA
    lda.b 0x2B
    and.b #0x03
    beq .D8D3

    stz.b 0x27
.D8D3:
    rts

.D8D4:
    lda.b 0x11
    and.b #0x40
    beq .D8E0

    jsl update_pos_xy.neg_ay_ax
    bra .D8E4

.D8E0:
    jsl update_pos_xy.neg_ay_pos_ax
.D8E4:
    jsl 0x8491BE
    rep #0x20
    lda.b 0x1A
    bpl .D8F2

    eor.w #0xFFFF
    inc
.D8F2:
    cmp.w #0x0180
    bcs .D90B

    lda.b 0x1A
    bmi .D900

    lda.w #0x0180
    bra .D903

.D900:
    lda.w #0xFE80
.D903:
    sta.b 0x1A
    sep #0x20
    lda.b #0x06
    sta.b 0x02
.D90B:
    sep #0x20
    lda.b 0x2B
    and.b #0x04
    bne .D91F

    lda.b #0x08
    sta.b 0x02
    lda.b #0x30
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
.D91F:
    jsl 0x848EEA
    lda.b 0x2B
    and.b #0x03
    beq .D92B

    stz.b 0x27
.D92B:
    rts

.D92C:
    jsl update_pos_x
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    bne .D946

    lda.b #0x08
    sta.b 0x02
    lda.b #0x30
    sta.b 0x1E
    lda.b #0xFF
    sta.b 0x2F
.D946:
    jsl 0x848EEA
    lda.b 0x2B
    and.b #0x03
    beq .D952

    stz.b 0x27
.D952:
    rts

.D953:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .D98A

    stz.b 0x2F
    rep #0x10
    ldx.b 0x33
    lda.b #0x04
    sta.w 0x0037,X
    sep #0x10
    lda.b 0x11
    and.b #0x40
    rep #0x20
    beq .D97B

    lda.w #0x0100
    bra .D97E

.D97B:
    lda.w #0xFF00
.D97E:
    sta.b 0x1A
    stz.b 0x1C
    sep #0x20
    stz.b 0x1E
    lda.b #0x06
    sta.b 0x02
.D98A:
    jsl 0x848EEA
    rts

.D98F:
    ldx.b 0x02
    jsr (.D9AE,X)
    rep #0x10
    ldx.b 0x33
    lda.w 0x002C,X
    sep #0x10
    beq .D9A5

    lda.b #0xFF
    sta.b 0x35
    bra .D9AB

.D9A5:
    dec.b 0x35
    bne .D9AB

    stz.b 0x27
.D9AB:
    jmp _81DB37

.D9AE: d16[.D9B4, .D9F0, .D9FF]

.D9B4:
    lda.b #0x02
    sta.b 0x02
    lda.b #0x03
    sta.b 0x27
    lda.b #0xFF
    sta.b 0x35
    stz.b 0x1A
    stz.b 0x1B
    stz.b 0x1F
    lda.b #0x30
    sta.b 0x1E
    jsl 0x8491BE
    lda.b 0x2B
    beq .D9D8

    stz.b 0x2F
    lda.b #0x02
    bra .D9DE

.D9D8:
    lda.b #0xFF
    sta.b 0x2F
    lda.b #0x04
.D9DE:
    sta.b 0x02
    lda.b #0x06
    jsl 0x848F07
    rep #0x20
    lda.w #0xC8EC
    sta.b 0x38
    sep #0x20
    rts

.D9F0:
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    bne .D9FE

    lda.b #0x04
    sta.b 0x02
.D9FE:
    rts

.D9FF:
    jsl update_pos_xy.neg_ay
    jsl 0x8491BE
    lda.b 0x2B
    and.b #0x04
    beq .DA13

    lda.b #0x02
    sta.b 0x02
    stz.b 0x2F
.DA13:
    rts

.DA14:
    lda.b 0x02
    bne .DA2C

    inc.b 0x02
    lda.b #0x11
    jsl 0x848F07
    jsl 0x84A4AB
    lda.b #0x05
    sta.b 0x35
    lda.b #0x03
    sta.b 0x36
.DA2C:
    dec.b 0x35
    bne .DA80

    dec.b 0x36
    lda.b #0x05
    sta.b 0x35
    lda.b 0x36
    asl
    tax
    rep #0x20
    lda.w #0x0508
    sta.w 0x0004
    lda.w 0x86C910,X
    clc
    adc.b 0x05
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    sep #0x20
    jsl 0x84A462
    lda.b #0x23
    jsl _80888B
    lda.b 0x36
    bne .DA80

    lda.b #0x01
    jsl 0x84A37F
    lda.b 0x0B
    bmi .DA71

    jsl 0x828387
    sep #0x10
    rts

.DA71:
    jsl 0x828398
    lda.b 0x32
    beq .DA80

    rep #0x10
    ldx.b 0x0C
    inc.w 0x000E,X
.DA80:
    sep #0x10
    rts

.DA83:
    lda.b 0x35
    asl
    tax
    rep #0x30
    lda.l 0x8581F6,X
    sec
    sbc.w #0x0014
    ldx.b 0x0C
    clc
    adc.w 0x0008,X
    sta.b 0x08
    lda.w 0x0005,X
    sta.b 0x05
    sep #0x30
    inc.b 0x35
    lda.b 0x35
    cmp.b #0x44
    bcc .DAB4

    lda.b #0x0E
    sta.b 0x01
    stz.b 0x35
    lda.b #0x07
    jsl 0x848F07
.DAB4:
    rts

.DAB5:
    lda.b 0x35
    asl
    tax
    rep #0x31
    lda.l 0x85827E,X
    ldx.b 0x0C
    adc.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    clc
    adc.w #0x0014
    sta.b 0x08
    sep #0x20
    inc.b 0x35
    lda.b 0x35
    cmp.b #0x22
    bcc .DAEA

    lda.b #0x02
    sta.b 0x01
    stz.b 0x02
    stz.b 0x03
    rep #0x20
    lda.w #0xFDC6
    sta.b 0x1A
    sep #0x20
.DAEA:
    jsl 0x848EEA
    rts

;-----

_81DAEF:
    rep #0x20
    lda.w 0x0BAD
    sec
    sbc.b 0x05
    sep #0x20
    lda.b #0x00
    ror
    ror
    eor.b 0x11
    and.b #0x40
    rts

;-----

_81DB02:
    lda.b 0x11
    and.b #0x40
    beq .DB20

    jsl update_pos_xy.neg_ay_pos_ax
    rep #0x20
    lda.b 0x1A
    cmp.w #0x0200
    beq .DB34

    bmi .DB34

    lda.w #0x0200
    sta.b 0x1A
    stz.b 0x1E
    bra .DB34

.DB20:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.b 0x1A
    cmp.w #0xFE00
    bpl .DB34

    lda.w #0xFE00
    sta.b 0x1A
    stz.b 0x1E
.DB34:
    sep #0x30
    rts

;-----

_81DB37:
    lda.b 0x27
    and.b #0x7F
    bne .DB52

    lda.b #0x23
    jsl _80888B
    jsr _81DB53
    inc.b 0x01
    inc.b 0x01
    stz.b 0x02
    stz.b 0x03
    lda.b 0x31
    sta.b 0x32
.DB52:
    rts

;-----

_81DB53:
    ldx.b 0x01
    dex
    dex
    jmp (.DB5A,X)

.DB5A: d16[.DB60, .DB92, .DBC4]

.DB60:
    ldy.b #0x05
.DB62:
    jsl 0x8282D3
    bne .DB8B

    inc.w 0x0000,X
    lda.b #0x0F
    sta.w 0x000A,X
    lda 0x86C8F8,Y
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    sep #0x20
    dey
    bpl .DB62

.DB8B:
    sep #0x10
    jsl 0x84A4AB
    rts

.DB92:
    ldy.b #0x05
.DB94:
    jsl 0x8282D3
    bne .DBBD

    inc.w 0x0000,X
    lda.b #0x0F
    sta.w 0x000A,X
    lda 0x86C8FE,Y
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    sep #0x20
    dey
    bpl .DB94

.DBBD:
    sep #0x10
    jsl 0x84A4AB
    rts

.DBC4:
    ldy.b #0x0B
.DBC6:
    jsl 0x8282D3
    bne .DBEF

    inc.w 0x0000,X
    lda.b #0x0F
    sta.w 0x000A,X
    lda 0x86C904,Y
    sta.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    rep #0x20
    tdc
    sta.w 0x000C,X
    sep #0x20
    dey
    bpl .DBC6

.DBEF:
    sep #0x10
    rts

;-----

_81DBF2:
    lda.b 0x11
    and.b #0x40
    bne .DBFC

    lda.b #0xC0
    bra .DBFE

.DBFC:
    lda.b #0x40
.DBFE:
    sta.b 0x29
    stz.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcc .DC2F

    lda.b 0x11
    and.b #0x40
    bne .DC14

    lda.b #0xE0
    bra .DC16

.DC14:
    lda.b #0x20
.DC16:
    sta.b 0x29
    jsl 0x8490A0
    cmp.b #0x00
    beq .DC24

    cmp.b #0x0D
    bcc .DC2E

.DC24:
    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    lda.b #0x3C
    sta.b 0x3A
.DC2E:
    rts

.DC2F:
    lda.b 0x11
    and.b #0x40
    bne .DC39

    lda.b #0xE0
    bra .DC3B

.DC39:
    lda.b #0x20
.DC3B:
    sta.b 0x29
    stz.b 0x2A
    jsl 0x8490A0
    cmp.b #0x34
    bcs .DC24

    rts

.DC48:
    dec.b 0x3B
    ldx.b 0x3B
    lda.w 0x86C916,X
    rep #0x20
    bmi .DC58

    and.w #0x00FF
    bra .DC5B

.DC58:
    ora.w #0xFF00
.DC5B:
    clc
    adc.b 0x05
    sta.b 0x05
    sep #0x20
    lda.b 0x3B
    bne .DC6A

    lda.b 0x3C
    sta.b 0x01
.DC6A:
    rts

;-----

_81DC6B:
    dec.b 0x36
    bne .DCBC

    jsl 0x828358
    bne .DCB8

    inc.w 0x0000,X
    lda.b #0x0A
    sta.w 0x000A,X
    stz.w 0x000B,X
    lda.b 0x11
    sta.w 0x0011,X
    and.b #0x40
    rep #0x21
    beq .DC90

    lda.w #0x0018
    bra .DC93

.DC90:
    lda.w #0xFFE8
.DC93:
    adc.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    clc
    adc.w #0xFFF4
    sta.w 0x0008,X
    sep #0x20
    jsl get_rng
    and.b #0x0F
    xba
    lda.b #0x00
    xba
    tax
    lda.w 0x86C91E,X
    sta.b 0x36
    ldx.b 0x33
    inc.w 0x003B,X
.DCB8:
    sep #0x10
    inc.b 0x36
.DCBC:
    rts

;-----

_81DCBD:
    rep #0x30
    ldx.b 0x33
    lda.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    sta.b 0x08
    sep #0x20
    lda.w 0x0011,X
    sta.b 0x11
    sep #0x10
    ldx.b 0x01
    jsr (.DD0A,X)
    jsr _81DDCD
    rep #0x30
    lda.b 0x35
    clc
    adc.b 0x2C
    and.w #0x00FF
    clc
    adc.b 0x08
    sta.b 0x08
    ldx.b 0x33
    lda.w 0x0000,X
    sta.b 0x00
    lda.w 0x0002,X
    sta.b 0x02
    sep #0x30
    lda.b 0x01
    cmp.b #0x04
    bcc .DD06

    cmp.b #0x0A
    beq .DD06

    jsr _81DE09
.DD06:
    jml 0x8280B4

.DD0A: d16[.DD1A, .DD38, .DD8D, .DDA5, .DDBD, .DD37, .DDCC, .DDC8]

.DD1A:
    jsl 0x82827D
    stz.b 0x3B
    lda.b #0x03
    jsl 0x848F07
    stz.b 0x36
    stz.b 0x35
    stz.b 0x37
    stz.b 0x2C
    rep #0x20
    lda.w #0xC92E
    sta.b 0x20
    sep #0x20
.DD37:
    rts

.DD38:
    ldx.b 0x02
    jmp (.DD3D,X)

.DD3D: d16[.DD45, .DD54, .DD6F, .DD7E]

.DD45:
    lda.b 0x03
    bne .DD4F

    lda.b #0x03
    jsl 0x848F07
.DD4F:
    jsl 0x848EEA
    rts

.DD54:
    lda.b 0x03
    bne .DD5E

    lda.b #0x03
    jsl 0x848F07
.DD5E:
    lda.b 0x3B
    beq .DD6A

    stz.b 0x3B
    lda.b #0x05
    jsl 0x848F07
.DD6A:
    jsl 0x848EEA
    rts

.DD6F:
    lda.b 0x03
    bne .DD79

    lda.b #0x04
    jsl 0x848F07
.DD79:
    jsl 0x848EEA
    rts

.DD7E:
    lda.b 0x03
    bne .DD88

    lda.b #0x10
    jsl 0x848F07
.DD88:
    jsl 0x848EEA
    rts

.DD8D:
    ldx.b 0x02
    bne .DDA0

    lda.b #0x01
    jsl 0x848F07
    rep #0x20
    lda.w #0xC932
    sta.b 0x20
    sep #0x20
.DDA0:
    jsl 0x848EEA
    rts

.DDA5:
    lda.b 0x02
    bne .DDB8

    lda.b #0x02
    jsl 0x848F07
    rep #0x20
    lda.w #0xC936
    sta.b 0x20
    sep #0x20
.DDB8:
    jsl 0x848EEA
    rts

.DDBD:
    lda.b 0x02
    bne .DDC7

    lda.b #0x11
    jsl 0x848F07
.DDC7:
    rts

.DDC8:
    jsl 0x848EEA
.DDCC:
    rts

;-----

_81DDCD:
    lda.b 0x37
    bne .DDD8

    lda.b 0x36
    cmp.b 0x35
    bne .DDE0

    rts

.DDD8:
    sta.b 0x36
    stz.b 0x37
    lda.b #0x01
    sta.b 0x39
.DDE0:
    dec.b 0x39
    bne .DE08

    lda.b #0x01
    sta.b 0x39
    lda.b 0x36
    cmp.b 0x35
    bcc .DDF2

    inc.b 0x35
    bra .DDF4

.DDF2:
    dec.b 0x35
.DDF4:
    lda.b 0x36
    bne .DDFC

    lda.b #0x03
    sta.b 0x39
.DDFC:
    lda.b 0x35
    cmp.b 0x36
    bne .DE08

    stz.b 0x36
    lda.b #0x03
    sta.b 0x39
.DE08:
    rts

;-----

_81DE09:
    lda.b 0x2C
    sta.b 0x3A
    beq .DE32

    lda.w 0x0BD4
    and.b #0x04
    bne .DE32

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
.DE32:
    stz.b 0x2C
    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .DEA1

    rep #0x20
    lda.w 0x0004
    cmp.w 0x0006
    beq .DE81

    bcc .DE81

    lda.w 0x0002
    bpl .DE59

    inc
    inc
    clc
    adc.w 0x0BB0
    sta.w 0x0BB0
.DE59:
    sep #0x20
    lda.w 0x0003
    bmi .DE6E

    lda.w 0x0BD3
    ora.w 0x0BD4
    and.b #0x04
    bne .DEA1

    lda.b #0x08
    bra .DE7C

.DE6E:
    lda.b 0x3A
    bne .DE76

    lda.b #0x02
    sta.b 0x37
.DE76:
    lda.b #0x01
    sta.b 0x2C
    lda.b #0x04
.DE7C:
    tsb.w 0x0BD4
    bra .DEA1

.DE81:
    lda.w 0x0000
    bmi .DE89

    dec
    bra .DE8A

.DE89:
    inc
.DE8A:
    clc
    adc.w 0x0BAD
    sta.w 0x0BAD
    sep #0x20
    lda.w 0x0001
    bmi .DE9C

    lda.b #0x02
    bra .DE9E

.DE9C:
    lda.b #0x01
.DE9E:
    tsb.w 0x0BD4
.DEA1:
    sep #0x30
    rts

;-----

_81DEA4:
    ldx.b 0x01
    jsr (.DEAA,X)
    rtl

.DEAA: d16[.DEB0, .DEED, .E0F1]

.DEB0:
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
    beq .DED7

    ldx.w #0xD89E
.DED7:
    stx.b 0x20
    sep #0x10
    jsl 0x8280B4
    lda.b #0x07
    sta.b 0x16
    lda.b 0x0B
    and.b #0x7F
    inc
    jsl 0x848F07
    rts

.DEED:
    jsl 0x82806E
    bcc .DF01

    lda.b 0x0B
    bpl .DEFC

    jsl 0x828387
    rts

.DEFC:
    lda.b #0x04
    sta.b 0x01
    rts

.DF01:
    ldx.b 0x02
    jmp (.DF06,X)

.DF06: d16[.DF0E, .DF6D, .DFCD, .E024]

.DF0E:
    ldx.b 0x03
    bne .DF2C

    inc.b 0x03
    rep #0x20
    stz.b 0x1A
    lda.w #0x02F5
    sta.b 0x1C
    ldy.b 0x0B
    bpl .DF23

    stz.b 0x1C
.DF23:
    sep #0x20
    lda.b #0x37
    sta.b 0x1E
    stz.b 0x1F
    rts

.DF2C:
    lda.b 0x2B
    bit.b #0x08
    bne .DF3E

    jsl update_pos_xy.neg_ay_ax
    jsl 0x8280B4
    lda.b 0x1D
    bpl .DF47

.DF3E:
    lda.b #0x02
    sta.b 0x02
    stz.b 0x1C
    stz.b 0x1D
    rts

.DF47:
    jsl 0x81E0F6
    lda.w 0x0BCF
    and.b #0x7F
    beq .DF68

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .DF68

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    jmp .E024

.DF68:
    jsl 0x848EEA
    rts

.DF6D:
    lda.b 0x2B
    bit.b #0x04
    beq .DF83

    stz.b 0x2F
    lda.b #0x04
    sta.b 0x02
    lda.b 0x26
    bpl .DF81

    lda.b #0xF0
    sta.b 0x26
.DF81:
    stz.b 0x27
.DF83:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFB00
    bpl .DF95

    lda.w #0xFB00
    sta.b 0x1C
.DF95:
    sep #0x20
    lda.b 0x26
    cmp.b #0x3C
    bcs .DFA3

    lda.w 0x0B9C
    lsr
    bcc .DFA7

.DFA3:
    jsl 0x8280B4
.DFA7:
    jsl 0x81E0F6
    lda.w 0x0BCF
    and.b #0x7F
    beq .DFC8

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .DFC8

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    jmp .E024

.DFC8:
    jsl 0x848EEA
    rts

.DFCD:
    jsl 0x81E0F6
    lda.b 0x2B
    bit.b #0x04
    bne .DFE0

    lda.b #0x02
    sta.b 0x02
    stz.b 0x1C
    stz.b 0x1D
    rts

.DFE0:
    lda.b 0x28
    bne .DFFF

    lda.b 0x0B
    bmi .DFFF

    lda.b 0x26
    cmp.b #0x3C
    bcs .DFF0

    dec.b 0x27
.DFF0:
    dec.b 0x26
    bne .DFF9

    lda.b #0x04
    sta.b 0x01
    rts

.DFF9:
    lda.b 0x27
    bit.b #0x01
    bne .E003

.DFFF:
    jsl 0x8280B4
.E003:
    lda.w 0x0BCF
    and.b #0x7F
    beq .E01F

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .E01F

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    bra .E024

.E01F:
    jsl 0x848EEA
    rts

.E024:
    ldx.b 0x03
    jmp (.E029,X)

.E029: d16[.E02F, .E083, .E0CF]

.E02F:
    lda.w 0x0BCF
    and.b #0x7F
    beq .E04A

    ldx.b #0x08
    lda.b 0x0B
    and.b #0x7F
    beq .E040

    ldx.b #0x02
.E040:
    stx.b 0x27
    ldy.w 0x0BDB
    bne .E04F

.E047:
    jsr _81E107
.E04A:
    lda.b #0x04
    sta.b 0x01
    rts

.E04F:
    lda 0x1F86,Y
    and.b #0x3F
    cmp.b #0x1C
    beq .E047

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
    jsl 0x849F85
    rts

.E083:
    lda.b #0xCF
    and.b #0x7F
    beq .E0CA

    dec.b 0x26
    bne .E0CE

    lda.b #0x04
    sta.b 0x26
    ldy.w 0x0BDB
    rep #0x21
    lda 0x1F85,Y
    and.w #0x3FFF
    adc.w #0x0100
    cmp.w #0x1C00
    bcc .E0B8

    lda.b 0x27
    and.w #0x00FF
    dec
    beq .E0B1

    sta.b 0x27
    jsr _81E107
.E0B1:
    ldx.b #0x04
    stx.b 0x03
    lda.w #0x1C00
.E0B8:
    ora.w #0xC000
    sta 0x1F85,Y
    sep #0x20
    lda.b #0x0C
    jsl _80888B.88B6
    dec.b 0x27
    bne .E0CE

.E0CA:
    lda.b #0x04
    sta.b 0x03
.E0CE:
    rts

.E0CF:
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

.E0F1:
    jsl 0x828398
    rts

;-----

_81E0F6:
    lda.b 0x28
    bne .E106

    lda.b 0x30
    pha
    stz.b 0x30
    jsl 0x8491BE
    pla
    sta.b 0x30
.E106:
    rtl

;-----

_81E107:
    php
    rep #0x20
    stz.w 0x0002
    lda.b 0x27
    and.w #0x00FF
    xba
    sta.w 0x0000
    ldx.b #0x02
.E118:
    lda.w 0x1F85,X
    bit.w #0x4000
    beq .E150

    and.w #0x3FFF
    cmp.w #0x1C00
    bcs .E150

    adc.w 0x0000
    cmp.w #0x1C00
    bcc .E13E

    sbc.w #0x1C00
    sta.w 0x0000
    beq .E13B

    inc.w 0x0002
.E13B:
    lda.w #0x1C00
.E13E:
    ora.w #0xC000
    sta.w 0x1F85,X
    lda.w #0x000D
    jsl _80888B.88B6
    lda.w 0x0002
    beq .E156

.E150:
    inx
    inx
    cpx.b #0x12
    bne .E118

.E156:
    plp
    rts

;-----

_81E158:
    ldx.b 0x01
    jsr (.E16B,X)
    rep #0x10
    ldx.b 0x29
    lda.w 0x0011,X
    ora.b 0x2C
    sta.b 0x11
    sep #0x10
    rtl

.E16B: d16[.E171, .E19B, .E2DD]

.E171:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x2B
    lda.b #0x00
    sta.b 0x2C
    stz.b 0x2D
    stz.b 0x28
    sta.b 0x26
    lda.b #0x08
    sta.b 0x27
    stz.b 0x12
    rep #0x20
    lda.w #0xD8B2
    sta.b 0x20
    sep #0x20
    lda.b #0x02
    sta.b 0x16
    lda.b #0x01
    jsl 0x848F07
    rts

.E19B:
    lda.b #0x00
    sta.b 0x2C
    ldx.b 0x02
    jsr (.E1C7,X)
    rep #0x10
    ldx.b 0x29
    lda.w 0x0002,X
    cmp.b 0x2B
    beq .E1B3

    sta.b 0x02
    stz.b 0x03
.E1B3:
    sta.b 0x2B
    lda.b 0x27
    and.b #0x7F
    beq .E1C0

    lda.w 0x0001,X
    sta.b 0x01
.E1C0:
    sep #0x10
    jsl 0x8280B4
    rts

.E1C7: d16[.E1D1, .E237, .E297, .E237, .E1D1]

.E1D1:
    ldx.b 0x03
    jsr (.E211,X)
    lda.b 0x30
    sta.b 0x2E
    stz.b 0x30
    jsl 0x849B43
    beq .E208

    lda.b 0x2E
    sta.b 0x30
    lda.b #0x0E
    sta.b 0x2C
    lda.b 0x27
    and.b #0x7F
    bne .E1FB

    lda.b #0x04
    sta.b 0x01
    lda.b #0x03
    jsl 0x84A37F
    rts

.E1FB:
    cmp.b #0x07
    bpl .E208

    sta.b 0x2D
    lda.b #0x07
    jsl 0x848F07
    rts

.E208:
    lda.b 0x2E
    sta.b 0x30
    jsl 0x849B03
    rts

.E211: d16[.E215, .E236]

.E215:
    rep #0x10
    lda.b #0x02
    sta.b 0x03
    ldx.b 0x29
    ldy.w 0x0005,X
    sty.b 0x05
    ldy.w 0x0008,X
    sty.b 0x08
    sep #0x10
    lda.b #0x01
    ldx.b 0x2D
    beq .E231

    lda.b #0x07
.E231:
    jsl 0x848F07
    rts

.E236:
    rts

.E237:
    ldx.b 0x03
    jsr (.E271,X)
    lda.b 0x30
    sta.b 0x2E
    stz.b 0x30
    jsl 0x849B43
    beq .E268

    lda.b 0x2E
    sta.b 0x30
    lda.b #0x0E
    sta.b 0x2C
    lda.b 0x27
    and.b #0x7F
    bne .E25B

    lda.b #0x04
    sta.b 0x01
    rts

.E25B:
    cmp.b #0x07
    bpl .E268

    sta.b 0x2D
    lda.b #0x07
    jsl 0x848F07
    rts

.E268:
    lda.b 0x2E
    sta.b 0x30
    jsl 0x849B03
    rts

.E271: d16[.E275, .E286]

.E275:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    ldx.b 0x2D
    beq .E281

    lda.b #0x07
.E281:
    jsl 0x848F07
    rts

.E286:
    rep #0x30
    ldx.b 0x29
    lda.w 0x0005,X
    sta.b 0x05
    lda.w 0x0008,X
    sta.b 0x08
    sep #0x30
    rts

.E297:
    ldx.b 0x03
    jmp (.E29C,X)

.E29C: d16[.E2A4, .E2B5, .E2C2, .E2D8]

.E2A4:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x03
    ldx.b 0x2D
    beq .E2B0

    lda.b #0x08
.E2B0:
    jsl 0x848F07
    rts

.E2B5:
    lda.b 0x0F
    bpl .E2BD

    lda.b #0x04
    sta.b 0x03
.E2BD:
    jsl 0x848EEA
    rts

.E2C2:
    rep #0x10
    ldx.b 0x29
    lda.w 0x0036,X
    sep #0x10
    beq .E2BD

    lda.b #0x06
    sta.b 0x03
    lda.b #0x05
    jsl 0x848F07
    rts

.E2D8:
    jsl 0x848EEA
    rts

.E2DD:
    rep #0x10
    ldx.b 0x29
    inc.w 0x0037,X
    stz.w 0x0034,X
    stz.w 0x0035,X
    ldy.w #0x0002
.E2ED:
    jsl 0x8282D3
    bne .E320

    inc.w 0x0000,X
    lda.b #0x04
    sta.w 0x000A,X
    tya
    sta.w 0x000B,X
    lda.b 0x11
    and.b #0xF0
    ora.l 0x7F8300
    sta.w 0x0011,X
    lda.b 0x18
    sta.w 0x0018,X
    rep #0x20
    lda.b 0x05
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    dey
    bpl .E2ED

.E320:
    sep #0x10
    jsl 0x828398
    rts

;-----

_81E327:
    ldx.b 0x01
    jsr (.E32D,X)
    rtl

.E32D: d16[.E333, .E364, .E487]

.E333:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x12
    stz.b 0x18
    stz.b 0x28
    lda.b #0xFF
    sta.b 0x26
    lda.w 0x0BB9
    and.b #0x30
    ora.b #0x02
    sta.b 0x11
    sta.b 0x2F
    rep #0x20
    lda.w #0xD8B6
    sta.b 0x20
    sep #0x20
    jsl 0x8280B4
    lda.b #0x11
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rts

.E364:
    jsl 0x82806E
    bcc .E378

    lda.b 0x0B
    bpl .E373

    jsl 0x828387
    rts

.E373:
    lda.b #0x04
    sta.b 0x01
    rts

.E378:
    ldx.b 0x02
    jmp (.E37D,X)

.E37D: d16[.E383, .E3DC, .E436]

.E383:
    ldx.b 0x03
    bne .E3A1

    inc.b 0x03
    rep #0x20
    stz.b 0x1A
    lda.w #0x02F5
    sta.b 0x1C
    ldy.b 0x0B
    bpl .E398

    stz.b 0x1C
.E398:
    sep #0x20
    lda.b #0x37
    sta.b 0x1E
    stz.b 0x1F
    rts

.E3A1:
    lda.b 0x2B
    bit.b #0x08
    bne .E3B3

    jsl update_pos_xy.neg_ay_ax
    jsl 0x8280B4
    lda.b 0x1D
    bpl .E3BC

.E3B3:
    lda.b #0x02
    sta.b 0x02
    stz.b 0x1C
    stz.b 0x1D
    rts

.E3BC:
    jsl 0x81E0F6
    lda.w 0x0BCF
    and.b #0x7F
    beq .E3D7

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .E3D7

    jmp .E48C

.E3D7:
    jsl 0x848EEA
    rts

.E3DC:
    lda.b 0x2B
    bit.b #0x04
    beq .E3F2

    stz.b 0x2F
    lda.b #0x04
    sta.b 0x02
    lda.b 0x26
    bpl .E3F0

    lda.b #0xF0
    sta.b 0x26
.E3F0:
    stz.b 0x27
.E3F2:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFB00
    bpl .E404

    lda.w #0xFB00
    sta.b 0x1C
.E404:
    sep #0x20
    lda.b 0x26
    cmp.b #0x3C
    bcs .E412

    lda.w 0x0B9C
    lsr
    bcc .E416

.E412:
    jsl 0x8280B4
.E416:
    jsl 0x81E0F6
    lda.w 0x0BCF
    and.b #0x7F
    beq .E431

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .E431

    jmp .E48C

.E431:
    jsl 0x848EEA
    rts

.E436:
    jsl 0x81E0F6
    lda.b 0x2B
    bit.b #0x04
    bne .E449

    lda.b #0x02
    sta.b 0x02
    stz.b 0x1C
    stz.b 0x1D
    rts

.E449:
    lda.b 0x28
    bne .E468

    lda.b 0x0B
    bmi .E468

    lda.b 0x26
    cmp.b #0x3C
    bcs .E459

    dec.b 0x27
.E459:
    dec.b 0x26
    bne .E462

    lda.b #0x04
    sta.b 0x01
    rts

.E462:
    lda.b 0x27
    bit.b #0x01
    bne .E46C

.E468:
    jsl 0x8280B4
.E46C:
    lda.w 0x0BCF
    and.b #0x7F
    beq .E482

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .E482

    bra .E48C

.E482:
    jsl 0x848EEA
    rts

.E487:
    jsl 0x828398
    rts

.E48C:
    lda.b #0x09
    cmp.w 0x1F80
    beq .E4A3

    bcs .E49A

    sta.w 0x1F80
    bra .E4A3

.E49A:
    lda.b #0x28
    jsl _80888B.88B6
    inc.w 0x1F80
.E4A3:
    lda.b #0x04
    sta.b 0x01
    rts

;-----

_81E4A8:
    ldx.b 0x01
    jsr (.E4AE,X)
    rtl

.E4AE: d16[.E4B4, .E4FF, .E6AA]

.E4B4:
    lda.w 0x1F99
    and.b 0x0B
    beq .E4C0

    jsl 0x828398
    rts

.E4C0:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x12
    stz.b 0x18
    stz.b 0x28
    lda.b #0xFF
    sta.b 0x26
    sta.b 0x2F
    lda.l 0x7F828C
    sta.b 0x18
    lda.w 0x0BB9
    and.b #0x30
    ora.b #0x04
    sta.b 0x11
    lda.l 0x7F838C
    and.b #0x01
    tsb.b 0x11
    rep #0x20
    lda.w #0xD8C0
    sta.b 0x20
    sep #0x20
    jsl 0x8280B4
    lda.b #0x96
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rts

.E4FF:
    jsl 0x82806E
    bcc .E50A

    jsl 0x828387
    rts

.E50A:
    ldx.b 0x02
    jmp (.E50F,X)

.E50F: d16[.E517, .E56D, .E5CD, .E625]

.E517:
    ldx.b 0x03
    bne .E52C

    inc.b 0x03
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x37
    sta.b 0x1E
    stz.b 0x1F
    rts

.E52C:
    lda.b 0x2B
    bit.b #0x08
    bne .E53E

    jsl update_pos_xy.neg_ay_ax
    jsl 0x8280B4
    lda.b 0x1D
    bpl .E547

.E53E:
    lda.b #0x02
    sta.b 0x02
    stz.b 0x1C
    stz.b 0x1D
    rts

.E547:
    jsl 0x81E0F6
    lda.w 0x0BCF
    and.b #0x7F
    beq .E568

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .E568

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    sta.w 0x1F3B
.E568:
    jsl 0x848EEA
    rts

.E56D:
    lda.b 0x2B
    bit.b #0x04
    beq .E583

    stz.b 0x2F
    lda.b #0x04
    sta.b 0x02
    lda.b 0x26
    bpl .E581

    lda.b #0xF0
    sta.b 0x26
.E581:
    stz.b 0x27
.E583:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFB00
    bpl .E595

    lda.w #0xFB00
    sta.b 0x1C
.E595:
    sep #0x20
    lda.b 0x26
    cmp.b #0x3C
    bcs .E5A3

    lda.w 0x0B9C
    lsr
    bcc .E5A7

.E5A3:
    jsl 0x8280B4
.E5A7:
    jsl 0x81E0F6
    lda.w 0x0BCF
    and.b #0x7F
    beq .E5C8

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .E5C8

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    sta.w 0x1F3B
.E5C8:
    jsl 0x848EEA
    rts

.E5CD:
    jsl 0x81E0F6
    lda.b 0x2B
    bit.b #0x04
    bne .E5E0

    lda.b #0x02
    sta.b 0x02
    stz.b 0x1C
    stz.b 0x1D
    rts

.E5E0:
    lda.b 0x28
    bne .E5FF

    lda.b 0x0B
    bne .E5FF

    lda.b 0x26
    cmp.b #0x3C
    bcs .E5F0

    dec.b 0x27
.E5F0:
    dec.b 0x26
    bne .E5F9

    lda.b #0x04
    sta.b 0x01
    rts

.E5F9:
    lda.b 0x27
    bit.b #0x01
    bne .E603

.E5FF:
    jsl 0x8280B4
.E603:
    lda.w 0x0BCF
    and.b #0x7F
    beq .E620

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .E620

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    sta.w 0x1F3B
.E620:
    jsl 0x848EEA
    rts

.E625:
    ldx.b 0x03
    jmp (.E62A,X)

.E62A: d16[.E630, .E682, .E68B]

.E630:
    lda.w 0x0BCF
    and.b #0x7F
    beq .E64F

    ldx.b #0x00
.E639:
    lda.w 0x1F83,X
    bmi .E64A

    lda.b #0x80
    sta.w 0x1F83,X
    lda.b 0x0B
    tsb.w 0x1F99
    bra .E654

.E64A:
    inx
    cpx.b #0x04
    bne .E639

.E64F:
    lda.b #0x04
    sta.b 0x01
    rts

.E654:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    sta.w 0x1F13
    sta.w 0x1F14
    sta.w 0x1F15
    sta.w 0x1F16
    sta.w 0x1F17
    sta.w 0x1F18
    sta.w 0x0BB6
    lda.b #0x80
    tsb.b 0x00
    jsl 0x849F85
    lda.b #0x50
    sta.b 0x27
    lda.b #0x29
    jsl _80888B.88B6
    rts

.E682:
    dec.b 0x27
    bne .E68A

    lda.b #0x04
    sta.b 0x03
.E68A:
    rts

.E68B:
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F15
    stz.w 0x1F16
    stz.w 0x1F17
    stz.w 0x1F18
    lda.b #0x04
    sta.b 0x01
    lda.b #0x80
    trb.b 0x00
    jsl 0x849FAD
    rts

.E6AA:
    stz.w 0x1F3B
    jsl 0x828398
    rts

;-----

_81E6B2:
    ldx.b 0x01
    jsr (.E6C2,X)
    jsl 0x82806E
    bcc .E6C1

    jml 0x828387

.E6C1:
    rtl

.E6C2: d16[.E6CC, .E6FA, .E764, .E7AB, .E7F1]

.E6CC:
    lda.b #0x02
    sta.b 0x01
    lda.l 0x7F8219
    sta.b 0x18
    lda.l 0x7F8319
    ora.b #0x20
    sta.b 0x11
    lda.b #0x04
    sta.b 0x12
    rep #0x20
    lda.b 0x05
    sta.b 0x1A
    lda.w #0xD8CA
    sta.b 0x20
    sep #0x20
    lda.b #0x1B
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rts

.E6FA:
    lda.w 0x0BD8
    beq .E704

    lda.w 0x0C13
    beq .E711

.E704:
    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcs .E712

.E711:
    rts

.E712:
    jsl 0x849F85
    rep #0x20
    lda.w 0x0BC2
    sta.b 0x1C
    rep #0x30
    lda.w 0x0BDB
    clc
    adc.w #0x0100
    tay
    jsl 0x828011
    sep #0x30
    lda.b #0x01
    tsb.w 0x0BB6
    sta.w 0x1F13
    sta.w 0x1F14
    sta.w 0x1F15
    sta.w 0x1F16
    sta.w 0x1F17
    sta.w 0x1F18
    jsl 0x84A187
    jsl 0x84A28B
    jsl 0x84A26F
    jsl 0x84A2A7
    lda.b #0xFF
    sta.b 0x00
    lda.b #0x04
    sta.b 0x01
    jsr _81E8C8
    jsl 0x8280B4
    rts

.E764:
    jsl 0x848EEA
    lda.b 0x17
    bpl .E77C

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    and.b #0x7F
    beq .E77C

    lda.b #0x40
    jsl _80888B.88B6
.E77C:
    lda.b 0x0F
    bmi .E785

    jsl 0x8280B4
    rts

.E785:
    jsl 0x849FAD
    jsl 0x849FC9
    jsr _81E8C8
    lda.b #0x06
    sta.b 0x01
    rep #0x20
    lda.w #0x0074
    sta.w 0x0BC2
    lda.b 0x1A
    clc
    adc.w #0x0008
    sta.w 0x1E60
    sta.w 0x1E5E
    sep #0x20
    rts

.E7AB:
    phd
    pea 0x0BA8
    pld
    jsl update_pos_x
    pld
    rep #0x20
    lda.w 0x1E4D
    cmp.w 0x1E60
    sep #0x20
    bne .E7E9

    lda.b #0x01
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x01
    rep #0x20
    lda.b 0x1A
    clc
    adc.w #0x0010
    sta.b 0x05
    sep #0x20
    jsl 0x849FDC
    jsl 0x849FE6
    lda.b 0x0B
    bpl .E7EA

    lda.b #0x41
    jsl _80888B.88B6
.E7E9:
    rts

.E7EA:
    lda.b #0x40
    jsl _80888B.88B6
    rts

.E7F1:
    jsl 0x848EEA
    lda.b 0x0F
    bmi .E7FE

    jsl 0x8280B4
    rts

.E7FE:
    jsr _81E829
    jsl 0x849FFE
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F15
    stz.w 0x1F16
    stz.w 0x1F17
    stz.w 0x1F18
    rep #0x20
    lda.b 0x1C
    sta.w 0x0BC2
    lda.b 0x05
    clc
    adc.w #0x0400
    sta.b 0x05
    sep #0x20
    rts

;-----

_81E829:
    rep #0x20
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    sta.b 0x27
    asl
    adc.b 0x27
    clc
    adc.w #0xD8CE
    sta.b 0x27
    lda (0x27)
    sta.w 0x0008
    lda.b 0x1A
    sta.w 0x0000
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.w 0x0002
    jsl 0x849111
    jsl _80B8D5
    lda.b 0x1A
    clc
    adc.w #0x0010
    sta.w 0x0000
    jsl 0x849111
    jsl _80B8D5
    inc.b 0x27
    inc.b 0x27
    lda.b 0x1A
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    lda (0x27)
    sta.w 0x0008
    jsl 0x849111
    jsl _80B8D5
    lda.b 0x1A
    clc
    adc.w #0x0010
    sta.w 0x0000
    jsl 0x849111
    jsl _80B8D5
    inc.b 0x27
    inc.b 0x27
    lda.b 0x1A
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0010
    sta.w 0x0002
    lda (0x27)
    sta.w 0x0008
    jsl 0x849111
    jsl _80B8D5
    lda.b 0x1A
    clc
    adc.w #0x0010
    sta.w 0x0000
    jsl 0x849111
    jsl _80B8D5
    sep #0x20
    rts

;-----

_81E8C8:
    rep #0x20
    lda.b 0x0B
    and.w #0x007F
    asl
    asl
    sta.w 0x0000
    asl
    adc.w 0x0000
    clc
    adc.w #0xD916
    sta.b 0x27
    lda (0x27)
    sta.w 0x0008
    lda.b 0x1A
    sta.w 0x0000
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.w 0x0002
    jsl 0x849111
    jsl _80B8D5
    inc.b 0x27
    inc.b 0x27
    lda (0x27)
    sta.w 0x0008
    lda.b 0x08
    sta.w 0x0002
    jsl 0x849111
    jsl _80B8D5
    inc.b 0x27
    inc.b 0x27
    lda (0x27)
    sta.w 0x0008
    lda.b 0x08
    clc
    adc.w #0x0010
    sta.w 0x0002
    jsl 0x849111
    jsl _80B8D5
    inc.b 0x27
    inc.b 0x27
    lda (0x27)
    sta.w 0x0008
    lda.b 0x1A
    clc
    adc.w #0x0010
    sta.w 0x0000
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.w 0x0002
    jsl 0x849111
    jsl _80B8D5
    inc.b 0x27
    inc.b 0x27
    lda (0x27)
    sta.w 0x0008
    lda.b 0x08
    sta.w 0x0002
    jsl 0x849111
    jsl _80B8D5
    inc.b 0x27
    inc.b 0x27
    lda (0x27)
    sta.w 0x0008
    lda.b 0x08
    clc
    adc.w #0x0010
    sta.w 0x0002
    jsl 0x849111
    jsl _80B8D5
    sep #0x20
    rts

;-----

_81E97F:
    ldx.b 0x01
    jmp (.E984,X)

.E984: d16[.E98A, .E9CE, .EB7F]

.E98A:
    lda.b 0x0B
    bit.w 0x1F9C
    beq .E995

    jml 0x828398

.E995:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x12
    stz.b 0x28
    lda.l 0x7F8236
    sta.b 0x18
    lda.w 0x0BB9
    and.b #0x30
    sta.w 0x0000
    lda.l 0x7F8336
    ora.w 0x0000
    sta.b 0x11
    sta.b 0x2F
    rep #0x20
    lda.w #0xDAA6
    sta.b 0x20
    sep #0x20
    jsl 0x8280B4
    lda.b #0x38
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rtl

.E9CE:
    jsl 0x82806E
    bcc .E9D8

    jml 0x828387

.E9D8:
    ldx.b 0x02
    jmp (.E9DD,X)

.E9DD: d16[.E9E5, .EA3A, .EA87, .EAC3]

.E9E5:
    ldx.b 0x03
    bne .E9FA

    inc.b 0x03
    rep #0x20
    stz.b 0x1A
    stz.b 0x1C
    sep #0x20
    lda.b #0x37
    sta.b 0x1E
    stz.b 0x1F
    rtl

.E9FA:
    lda.b 0x2B
    bit.b #0x08
    bne .EA0C

    jsl update_pos_xy.neg_ay_ax
    jsl 0x8280B4
    lda.b 0x1D
    bpl .EA15

.EA0C:
    lda.b #0x02
    sta.b 0x02
    stz.b 0x1C
    stz.b 0x1D
    rtl

.EA15:
    jsl 0x81E0F6
    lda.w 0x0BCF
    and.b #0x7F
    beq .EA39

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .EA39

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    sta.w 0x1F3B
    jmp .EAC3

.EA39:
    rtl

.EA3A:
    lda.b 0x2B
    bit.b #0x04
    beq .EA46

    stz.b 0x2F
    lda.b #0x04
    sta.b 0x02
.EA46:
    jsl update_pos_xy.neg_ay_ax
    rep #0x20
    lda.b 0x1C
    cmp.w #0xFB00
    bpl .EA58

    lda.w #0xFB00
    sta.b 0x1C
.EA58:
    sep #0x20
    jsl 0x8280B4
    jsl 0x81E0F6
    lda.w 0x0BCF
    and.b #0x7F
    beq .EA82

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .EA82

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    sta.w 0x1F3B
    jmp .EAC3

.EA82:
    jsl 0x848EEA
    rtl

.EA87:
    jsl 0x81E0F6
    lda.b 0x2B
    bit.b #0x04
    bne .EA9A

    lda.b #0x02
    sta.b 0x02
    stz.b 0x1C
    stz.b 0x1D
    rtl

.EA9A:
    jsl 0x8280B4
    lda.w 0x0BCF
    and.b #0x7F
    beq .EABE

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcc .EABE

    lda.b #0x06
    sta.b 0x02
    stz.b 0x03
    sta.w 0x1F3B
    jmp .EAC3

.EABE:
    jsl 0x848EEA
    rtl

.EAC3:
    ldx.b 0x03
    jmp (.EAC8,X)

.EAC8: d16[.EAD0, .EB1A, .EB27, .EB5F]

.EAD0:
    lda.w 0x0BCF
    and.b #0x7F
    beq .EAE3

    lda.b 0x0B
    tsb.w 0x1F9C
    lda.w 0x1F9A
    cmp.b #0x20
    bcc .EAE8

.EAE3:
    lda.b #0x04
    sta.b 0x01
    rtl

.EAE8:
    lda.b #0x02
    sta.b 0x03
    lda.b #0x01
    sta.w 0x1F13
    sta.w 0x1F14
    sta.w 0x1F15
    sta.w 0x1F16
    sta.w 0x1F17
    sta.w 0x1F18
    sta.w 0x0BB6
    lda.b #0x80
    tsb.b 0x00
    lda.b #0x04
    sta.b 0x26
    jsl 0x849F85
    lda.b #0x50
    sta.b 0x27
    lda.b #0x29
    jsl _80888B.88B6
    rtl

.EB1A:
    dec.b 0x27
    bne .EB26

    lda.b #0x04
    sta.b 0x03
    lda.b #0x02
    sta.b 0x27
.EB26:
    rtl

.EB27:
    lda.w 0x0BCF
    and.b #0x7F
    beq .EB59

    dec.b 0x26
    bne .EB5D

    lda.b #0x04
    sta.b 0x26
    lda.w 0x1F9A
    inc
    cmp.b #0x20
    bcc .EB44

    lda.b #0x06
    sta.b 0x03
    lda.b #0x20
.EB44:
    sta.w 0x1F9A
    inc.w 0x0BCF
    lda.b #0x80
    tsb.w 0x0BCF
    lda.b #0x0C
    jsl _80888B.88B6
    dec.b 0x27
    bne .EB5D

.EB59:
    lda.b #0x06
    sta.b 0x03
.EB5D:
    bra .EB86

.EB5F:
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F15
    stz.w 0x1F16
    stz.w 0x1F17
    stz.w 0x1F18
    lda.b #0x04
    sta.b 0x01
    lda.b #0x80
    trb.b 0x00
    jsl 0x849FAD
    bra .EB97

.EB7F:
    stz.w 0x1F3B
    jml 0x828398

.EB86:
    ldx.b #0x18
.EB88:
    lda.w 0x0703,X
    eor.b #0x04
    sta.w 0x0703,X
    dex
    dex
    dex
    dex
    bpl .EB88

    rtl

.EB97:
    ldx.b #0x18
.EB99:
    lda.b #0x34
    sta.w 0x0703,X
    dex
    dex
    dex
    dex
    bpl .EB99

    rtl

;-----

_81EBA5:
    ldx.b 0x01
    jsr (.EBAE,X)
    jml 0x8280B4

.EBAE: d16[.EBB8, .EBE5, .EBF2, .EC14, .EC2A]

.EBB8:
    lda.b #0x1B
    sta.b 0x16
    lda.l 0x7F8219
    sta.b 0x18
    lda.l 0x7F8319
    ora.b #0x20
    sta.b 0x11
    lda.b #0x04
    sta.b 0x12
    lda.b #0x02
    sta.b 0x01
    lda.b #0x40
    sta.b 0x02
    lda.b #0x00
    jsl 0x848F07
    rep #0x20
    lda.b 0x05
    sta.b 0x1A
    sep #0x20
    rts

.EBE5:
    lda.w 0x1F3F
    beq .EBF1

    lda.b #0x04
    sta.b 0x01
    jsr _81E8C8
.EBF1:
    rts

.EBF2:
    jsl 0x848EEA
    lda.b 0x17
    bpl .EC0A

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    and.b #0x7F
    beq .EC0A

    lda.b #0x40
    jsl _80888B.88B6
.EC0A:
    lda.b 0x0F
    bmi .EC0F

    rts

.EC0F:
    lda.b #0x06
    sta.b 0x01
    rts

.EC14:
    dec.b 0x02
    bne .EC23

    lda.b #0x08
    sta.b 0x01
    lda.b #0x40
    jsl _80888B.88B6
    rts

.EC23:
    lda.b #0x01
    jsl 0x848F07
    rts

.EC2A:
    jsl 0x848EEA
    lda.b 0x0F
    bmi .EC33

    rts

.EC33:
    jsr _81E829
    jsl 0x828398
    pla
    pla
    rtl

;-----

_81EC3D:
    ldx.b 0x01
    jsr (.EC4D,X)
    jsl 0x82806E
    bcc .EC4C

    jml 0x828387

.EC4C:
    rtl

.EC4D: d16[.EC57, .EC85, .ED06, .ED41, .ED77]

.EC57:
    lda.b #0x02
    sta.b 0x01
    lda.l 0x7F8219
    sta.b 0x18
    lda.l 0x7F8319
    ora.b #0x30
    sta.b 0x11
    lda.b #0x04
    sta.b 0x12
    rep #0x20
    lda.b 0x05
    sta.b 0x1A
    lda.w #0xDBB5
    sta.b 0x20
    sep #0x20
    lda.b #0x1B
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rts

.EC85:
    lda.w 0x1F41
    beq .EC91

    jsl 0x828398
    pla
    pla
    rtl

.EC91:
    lda.w 0x0BD8
    beq .EC9B

    lda.w 0x0C13
    beq .ECB3

.EC9B:
    rep #0x20
    lda.w 0x0BAD
    cmp.b 0x1A
    sep #0x20
    bcc .ECB3

    rep #0x10
    ldx.w #0x0BA8
    jsl 0x849C0E
    sep #0x10
    bcs .ECB4

.ECB3:
    rts

.ECB4:
    jsl 0x849F85
    rep #0x20
    lda.w 0x0BC2
    sta.b 0x1C
    rep #0x30
    lda.w 0x0BDB
    clc
    adc.w #0x0100
    tay
    jsl 0x828011
    sep #0x30
    lda.b #0x01
    tsb.w 0x0BB6
    sta.w 0x1F13
    sta.w 0x1F14
    sta.w 0x1F15
    sta.w 0x1F16
    sta.w 0x1F17
    sta.w 0x1F18
    jsl 0x84A1A6
    jsl 0x84A28B
    jsl 0x84A26F
    jsl 0x84A2A7
    lda.b #0xFF
    sta.b 0x00
    lda.b #0x04
    sta.b 0x01
    jsr _81E8C8
    jsl 0x8280B4
    rts

.ED06:
    jsl 0x848EEA
    lda.b 0x17
    bpl .ED1E

    and.b #0x7F
    sta.b 0x17
    lda.b 0x0F
    and.b #0x7F
    beq .ED1E

    lda.b #0x40
    jsl _80888B.88B6
.ED1E:
    lda.b 0x0F
    bmi .ED27

    jsl 0x8280B4
    rts

.ED27:
    jsl 0x849FAD
    jsl 0x849FC9
    jsr _81E8C8
    lda.b #0x06
    sta.b 0x01
    rep #0x20
    lda.w #0xFF8C
    sta.w 0x0BC2
    sep #0x20
    rts

.ED41:
    phd
    pea 0x0BA8
    pld
    jsl update_pos_x
    pld
    rep #0x20
    lda.b 0x1A
    sec
    sbc.w 0x0BAD
    bmi .ED74

    cmp.w #0x0010
    sep #0x20
    bcc .ED74

    lda.b #0x01
    jsl 0x848F07
    lda.b #0x08
    sta.b 0x01
    jsl 0x849FDC
    jsl 0x849FE6
    lda.b #0x40
    jsl _80888B.88B6
.ED74:
    sep #0x20
    rts

.ED77:
    jsl 0x848EEA
    lda.b 0x0F
    bmi .ED84

    jsl 0x8280B4
    rts

.ED84:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w #0x0010
    sta.b 0x05
    sep #0x20
    jsr _81EDB9
    jsl 0x849FFE
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F15
    stz.w 0x1F16
    stz.w 0x1F17
    stz.w 0x1F18
    rep #0x20
    lda.b 0x1C
    sta.w 0x0BC2
    sep #0x20
    jsl 0x828398
    pla
    pla
    rtl

;-----

_81EDB9:
    rep #0x20
    lda.w #0xDBB9
    sta.b 0x27
    lda (0x27)
    sta.w 0x0008
    lda.b 0x1A
    sta.w 0x0000
    lda.b 0x08
    sec
    sbc.w #0x0010
    sta.w 0x0002
    jsl 0x849111
    jsl _80B8D5
    inc.b 0x27
    inc.b 0x27
    lda.b 0x1A
    sta.w 0x0000
    lda.b 0x08
    sta.w 0x0002
    lda (0x27)
    sta.w 0x0008
    jsl 0x849111
    jsl _80B8D5
    inc.b 0x27
    inc.b 0x27
    lda.b 0x1A
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w #0x0010
    sta.w 0x0002
    lda (0x27)
    sta.w 0x0008
    jsl 0x849111
    jsl _80B8D5
    sep #0x20
    rts

;-----

_81EE18:
    ldx.b 0x01
    jsr (.EE1E,X)
    rtl

.EE1E: d16[.EE24, .EE45, .EE7F]

.EE24:
    lda.b #0x02
    sta.b 0x01
    lda.l 0x7F8304
    sta.b 0x11
    stz.b 0x12
    stz.b 0x1F
    lda.b #0x04
    sta.b 0x1E
    jsl 0x8280B4
    lda.b #0x0B
    sta.b 0x16
    lda.b #0x07
    jsl 0x848F07
    rts

.EE45:
    ldx.b 0x02
    bne .EE64

    lda.b 0x1D
    bpl .EE5B

    inc.b 0x02
    lda.b #0x3C
    sta.b 0x03
    lda.b #0xE0
    sta.b 0x1C
    lda.b #0xFF
    sta.b 0x1D
.EE5B:
    jsl update_pos_xy.neg_ay_ax
    jsl 0x8280B4
    rts

.EE64:
    jsl update_pos_y
    dec.b 0x03
    bne .EE71

    lda.b #0x04
    sta.b 0x01
    rts

.EE71:
    lda.b 0x03
    lsr
    bcc .EE7A

    jsl 0x8280B4
.EE7A:
    jsl 0x848EEA
    rts

.EE7F:
    jsl 0x828398
    rts

;-----

_81EE84:
    lda.b 0x01
    bne .EE9F

    inc.b 0x01
    lda.w 0x0BB9
    and.b #0x30
    ora.b #0x04
    sta.b 0x11
    stz.b 0x12
    lda.b 0x0B
    jsl 0x848F07
    jml 0x8280B4

.EE9F:
    jsl 0x8280B4
    lda.b 0x0E
    beq .EEB0

    jsl 0x848EEA
    lda.b 0x0F
    bmi .EEB0

    rtl

.EEB0:
    jml 0x828398

;-----

_81EEB4:
    lda.b 0x01
    bne .EEEA

    inc.b 0x01
    lda.l 0x7F8289
    sta.b 0x18
    lda.l 0x7F8389
    sta.b 0x11
    stz.b 0x12
    lda.b #0x90
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    lda.b #0x04
    sta.b 0x1E
    stz.b 0x1F
    rep #0x20
    stz.b 0x1A
    tdc
    sec
    sbc.w #0x1928
    lsr
    lsr
    lsr
    lsr
    lsr
    sep #0x20
    sta.b 0x03
.EEEA:
    jsl update_pos_xy.neg_ay
    jsl 0x848EEA
    dec.b 0x0B
    bne .EEFA

    jml 0x828398

.EEFA:
    lda.b 0x03
    eor.w 0x0B9C
    lsr
    bcc .EF06

    jml 0x8280B4

.EF06:
    rtl

;-----

_81EF07:
    ldx.b 0x01
    jsr (.EF0D,X)
    rtl

.EF0D: d16[.EF13, .EF4C, .EF63]

.EF13:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x12
    rep #0x20
    lda.b 0x0B
    asl
    asl
    tax
    lda.w 0xDBBF,X
    bit.b 0x10
    bvc .EF2B

    eor.w #0xFFFF
    inc
.EF2B:
    sta.b 0x1A
    lda.w 0xDBC1,X
    sta.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x28
    sta.b 0x1E
    jsl 0x8280B4
    lda.b #0x02
    sta.b 0x16
    lda.b #0x0B
    clc
    adc.b 0x0B
    jsl 0x848F07
    rts

.EF4C:
    lda.w 0x0B9C
    lsr
    bcc .EF5E

    jsl 0x8280B4
    lda.b 0x0E
    bne .EF5E

    lda.b #0x04
    sta.b 0x01
.EF5E:
    jsl update_pos_xy.neg_ay_ax
    rts

.EF63:
    jsl 0x828398
    rts

;-----

_81EF68:
    ldx.b 0x01
    jsr (.EF6E,X)
    rtl

.EF6E: d16[.EF74, .EF89, .EF99]

.EF74:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x12
    jsl 0x8280B4
    lda.b #0x02
    sta.b 0x16
    lda.b #0x0A
    jsl 0x848F07
    rts

.EF89:
    jsl 0x8280B4
    rep #0x10
    ldx.b 0x0C
    lda.w 0x0011,X
    sta.b 0x11
    sep #0x10
    rts

.EF99:
    ldx.b 0x02
    jmp (.EF9E,X)

.EF9E: d16[.EFA4, .EFD6, .EFE9]

.EFA4:
    lda.b #0x02
    sta.b 0x02
    lda.b 0x11
    and.b #0xF0
    ora.l 0x7F8300
    sta.b 0x11
    lda.b 0x0B
    tax
    rep #0x20
    lda.w 0xDBCB,X
    bit.b 0x10
    bvs .EFC2

    eor.w #0xFFFF
    inc
.EFC2:
    sta.b 0x1A
    lda.w 0xDBCD,X
    sta.b 0x1C
    sep #0x20
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
    jsl 0x8280B4
    rts

.EFD6:
    lda.w 0x0B9C
    lsr
    bcc .EFE4

    jsl 0x8280B4
    lda.b 0x0E
    beq .EFE9

.EFE4:
    jsl update_pos_xy.neg_ay_ax
    rts

.EFE9:
    jsl 0x828398
    rts

;-----

_81EFEE:
    lda.b 0x01
    bne .F038

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
    jsl 0x848F07
    lda.b 0x0B
    bpl .F038

    lda.b 0x0C
    beq .F026

    lda.b #0x40
    tsb.b 0x11
    rep #0x20
    lda.w #0xFF40
    bra .F02F

.F026:
    lda.b #0x40
    trb.b 0x11
    rep #0x20
    lda.w #0x00C0
.F02F:
    sta.b 0x1A
    lda.w #0x0200
    sta.b 0x1C
    sep #0x20
.F038:
    jsl 0x848EEA
    lda.b 0x0B
    bmi .F058

    lda.b 0x0F
    bpl .F054

    lda.b 0x13
    cmp.b #0x01
    beq .F050

    bra .F054

    dec.b 0x1E
    bne .F054

.F050:
    jml 0x828398

.F054:
    jml 0x8280B4

.F058:
    jsl update_pos_xy.no_accel
    rep #0x20
    lda.b 0x1A
    bmi .F06A

    sec
    sbc.w #0x0006
    bmi .F078

    bra .F070

.F06A:
    clc
    adc.w #0x0006
    bpl .F078

.F070:
    sta.b 0x1A
    sep #0x20
    jml 0x8280B4

.F078:
    sep #0x20
    jml 0x828398

;-----

_81F07E:
    lda.b 0x01
    bne .F0AD

    inc.b 0x01
    stz.b 0x18
    lda.b #0x32
    sta.b 0x11
    rep #0x21
    lda.w 0x1E4D
    adc.w #0x0080
    sta.b 0x05
    lda.w 0x1E50
    clc
    adc.w #0x0070
    sta.b 0x08
    sep #0x20
    lda.b #0x20
    sta.b 0x0C
    lda.b #0x19
    sta.b 0x16
    lda.b #0x00
    jml 0x848F07

.F0AD:
    lda.b 0x0C
    beq .F0B4

    dec.b 0x0C
    rtl

.F0B4:
    lda.b 0x0F
    bpl .F0BC

    jml 0x828398

.F0BC:
    jsl 0x848EEA
    jml 0x8280B4

;-----

_81F0C4:
    lda.b 0x01
    bne .F0F0

    inc.b 0x01
    lda.b #0x80
    tsb.b 0x00
    stz.b 0x18
    lda.b 0x11
    and.b #0x70
    ora.b #0x02
    sta.b 0x11
    rep #0x20
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    sta.b 0x08
    sep #0x20
    lda.b #0x60
    sta.b 0x16
    lda.b 0x0B
    jml 0x848F07

.F0F0:
    ldx.b 0x0B
    bne .F102

    rep #0x20
    lda.w 0x0BAD
    sta.b 0x05
    lda.w 0x0BB0
    sta.b 0x08
    sep #0x20
.F102:
    lda.w 0x0BAA
    cmp.w 0x86DC67,X
    bne .F10E

    lda.b 0x0F
    bpl .F112

.F10E:
    jml 0x828398

.F112:
    jsl 0x8280B4
    jml 0x848EEA

;-----

_81F11A:
    lda.b 0x01
    bne .F162

    inc.b 0x01
    lda.l 0x7F8218
    sta.b 0x18
    lda.b #0x25
    sta.b 0x11
    lda.b #0x1A
    sta.b 0x16
    lda.b 0x0B
    and.b #0x7F
    jsl 0x848F07
    stz.b 0x12
    lda.b 0x0B
    bit.b #0x02
    beq .F162

    stz.b 0x1E
    stz.b 0x1F
    lda.b 0x0B
    bmi .F155

    lsr
    rep #0x20
    bcc .F150

    lda.w #0x0140
    bra .F15A

.F150:
    lda.w #0x0200
    bra .F15A

.F155:
    rep #0x20
    lda.w #0x00C0
.F15A:
    sta.b 0x1C
    stz.b 0x1A
    sep #0x20
    bra .F17B

.F162:
    jsl 0x848EEA
    lda.b 0x0B
    bit.b #0x02
    bne .F17B

    lda.w 0x1F2D
    sta.b 0x19
    lda.b 0x0F
    bpl .F18E

    stz.b 0x19
    jml 0x828398

.F17B:
    jsl update_pos_xy.no_accel
    jsr _81F197
    cmp.b #0x0D
    beq .F18E

    cmp.b #0x0E
    beq .F18E

.F18A:
    jml 0x828398

.F18E:
    jsl 0x8280B4
    lda.b 0x0E
    beq .F18A

    rtl

;-----

_81F197:
    rep #0x30
    lda.b 0x05
    sta.w 0x0000
    lda.w 0x1F2D
    and.w #0x00FF
    sta.w 0x0004
    lda.b 0x08
    sec
    sbc.w 0x0004
    sec
    sbc.w #0x0003
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

_81F1D8:
    ldy.b #0x11
    lda (0x0C),Y
    sta.b 0x11
    ldx.b 0x01
    jmp (.F1E3,X)

.F1E3: d16[.F1E9, .F206, .F2A6]

.F1E9:
    lda.b #0x02
    sta.b 0x01
    lda.l 0x7F8216
    sta.b 0x18
    lda.b #0x16
    sta.b 0x16
    lda.b #0x02
    sta.b 0x12
    lda.b 0x0B
    and.b #0x06
    lsr
    adc.b #0x07
    jsl 0x848F07
.F206:
    ldy.b #0x37
    lda (0x1A),Y
    bne .F27D

    ldy.b #0x00
    lda (0x0C),Y
    bne .F216

    jml 0x828398

.F216:
    ldy.b #0x37
    lda (0x0C),Y
    bne .F220

    jsl 0x848EEA
.F220:
    rep #0x30
    ldx.b 0x0C
    lda.w 0x0031,X
    sec
    sbc.w 0x0005,X
    bcs .F231

    eor.w #0xFFFF
    inc
.F231:
    sta.b 0x1C
    sep #0x10
    ldx.b 0x0B
.F237:
    dex
    beq .F23F

    clc
    adc.b 0x1C
    bra .F237

.F23F:
    sta.w snes_regs.wrdivl
    ldx.b #0x0A
    stx.w snes_regs.wrdivb
    rep #0x10
    ldx.b 0x0C
    lda.b 0x10
    asl
    asl
    bcs .F256

    lda.w #0x000A
    bra .F259

.F256:
    lda.w #0xFFF6
.F259:
    clc
    adc.w 0x0031,X
    sta.b 0x1C
    lda.b 0x10
    asl
    asl
    lda.w snes_regs.rddivl
    bcs .F272

    tax
    lda.b 0x1C
    stx.b 0x1C
    sec
    sbc.b 0x1C
    bra .F275

.F272:
    clc
    adc.b 0x1C
.F275:
    sta.b 0x05
    sep #0x30
    jml 0x8280B4

.F27D:
    rep #0x20
    jsl get_rng
    and.w #0x07FF
    lsr
    bcc .F28D

    eor.w #0xFFFF
    inc
.F28D:
    sta.b 0x1A
    jsl get_rng
    and.w #0x07FF
    sta.b 0x1C
    sep #0x20
    lda.b #0x40
    sta.b 0x1E
    lda.b #0x04
    sta.b 0x01
    jml 0x8280B4

.F2A6:
    jsl 0x848EEA
    jsl update_pos_xy.neg_ay
    lda.b 0x0B
    eor.w 0x0B9C
    lsr
    bcc .F2B7

.F2B6:
    rtl

.F2B7:
    jsl 0x8280B4
    lda.b 0x0E
    bne .F2B6

    jml 0x828398

;-----

_81F2C3:
    ldx.b 0x01
    jsr (.F2D5,X)
    jsl 0x8280B4
    lda.b 0x0E
    bne .F2D4

    jml 0x828398

.F2D4:
    rtl

.F2D5: d16[.F2D9, .F31E]

.F2D9:
    lda.b #0x02
    sta.b 0x01
    stz.b 0x18
    stz.b 0x03
    lda.b #0x01
    sta.b 0x0C
    lda.b 0x0B
    cmp.b #0x08
    bra .F2EF

    lda.b #0x20
    bra .F2F1

.F2EF:
    lda.b #0x40
.F2F1:
    sta.b 0x0D
    ldx.b 0x0B
    lda.w 0x86DC69,X
    sta.b 0x0B
    asl
    asl
    tax
    rep #0x20
    lda.w 0x86EE3A,X
    asl
    sta.b 0x1A
    asl
    lda.w 0x86EE3C,X
    sta.b 0x1C
    stz.b 0x1E
    sep #0x20
    lda.b #0x32
    sta.b 0x11
    lda.b #0x1D
    sta.b 0x16
    lda.b #0x00
    jsl 0x848F07
    rts

.F31E:
    jsl update_pos_xy.no_accel
    jsl 0x848EEA
    lda.b 0x03
    inc
    sta.b 0x03
    cmp.b 0x0C
    bcc .F34E

    inc.b 0x0C
    stz.b 0x03
    inc.b 0x0B
    inc.b 0x0B
    lda.b 0x0B
    and.b #0x1F
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
.F34E:
    jsl 0x848EEA
    dec.b 0x0D
    bne .F35A

    jsl 0x828398
.F35A:
    rts

;-----

_81F35B:
    lda.b 0x01
    beq .F362

    jmp .F3D0

.F362:
    inc.b 0x01
    lda.b 0x0B
    asl
    asl
    asl
    clc
    adc.b 0x0B
    tay
    rep #0x10
    ldx.b 0x0C
    lda.b 0x11
    and.b #0x40
    rep #0x20
    beq .F39F

    lda 0x86DC7A,Y
    eor.w #0xFFFF
    inc
    clc
    adc.w 0x0005,X
    sta.b 0x05
    lda 0x86DC7C,Y
    clc
    adc.w 0x0008,X
    sta.b 0x08
    lda 0x86DC7E,Y
    eor.w #0xFFFF
    inc
    sta.b 0x1A
    lda 0x86DC80,Y
    sta.b 0x1C
    bra .F3BB

.F39F:
    lda 0x86DC7A,Y
    clc
    adc.w 0x0005,X
    sta.b 0x05
    lda 0x86DC7C,Y
    clc
    adc.w 0x0008,X
    sta.b 0x08
    lda 0x86DC7E,Y
    sta.b 0x1A
    lda 0x86DC80,Y
    sta.b 0x1C
.F3BB:
    sep #0x30
    lda.b #0x1F
    sta.b 0x16
    lda.b #0x40
    sta.b 0x1E
    stz.b 0x1F
    stz.b 0x12
    lda 0x86DC79,Y
    jml 0x848F07

.F3D0:
    jsl update_pos_xy.neg_ay
    jsl 0x848EEA
    lda.w 0x0B9C
    eor.b 0x0B
    lsr
    bcc .F3EC

    jsl 0x8280B4
    lda.b 0x0E
    bne .F3EC

    jml 0x828398

.F3EC:
    rtl

;-----

_81F3ED:
    lda.b 0x01
    bne .F403

    inc.b 0x01
    lda.l 0x7F821E
    sta.b 0x18
    lda.b #0x20
    sta.b 0x16
    lda.b #0x05
    jml 0x848F07

.F403:
    ldx.b 0x02
    bne .F40B

    jml 0x8280B4

.F40B:
    ldx.b 0x03
    bne .F417

    inc.b 0x03
    lda.b #0x06
    jml 0x848F07

.F417:
    lda.b 0x0F
    bpl .F41C

    rtl

.F41C:
    jsl 0x848EEA
    jml 0x8280B4

;-----

_81F424:
    lda.b 0x01
    bne .F46A

    inc.b 0x01
    lda.l 0x7F821E
    sta.b 0x18
    lda.l 0x7F831E
    sta.b 0x11
    lda.b #0x06
    sta.b 0x12
    stz.b 0x1F
    lda.b #0x40
    sta.b 0x1E
    rep #0x21
    lda.w 0x0B9C
    adc.b 0x0B
    and.w #0x0007
    asl
    asl
    tax
    lda.w 0x86DDE6,X
    sta.b 0x1A
    lda.w 0x86DDE8,X
    sta.b 0x1C
    sep #0x20
    lda.b #0x78
    sta.b 0x0C
    lda.b #0x20
    sta.b 0x16
    ldx.b 0x0B
    lda.w 0x86DDE0,X
    jml 0x848F07

.F46A:
    jsl update_pos_xy.neg_ay_ax
    dec.b 0x0C
    bne .F476

    jml 0x828398

.F476:
    lda.b 0x0C
    lsr
    bcc .F47F

    jml 0x8280B4

.F47F:
    rtl

;-----

_81F480:
    ldx.b 0x01
    bne .F49B

    inc.b 0x01
    lda.b #0xF0
    sta.b 0x0B
    stz.b 0x1F
    lda.b #0x02
    sta.b 0x1E
    stz.b 0x1A
    stz.b 0x1B
    lda.b #0x01
    jsl 0x848F7D
.F49A:
    rtl

.F49B:
    rep #0x20
    lda.w 0x0BAD
    cmp.w #0x115C
    bcc .F49A

    cmp.w #0x1800
    bcs .F49A

    lda.w 0x0BB0
    cmp.w #0x0350
    bcs .F49A

    sep #0x20
    lda.w 0x0BCF
    cmp.b #0x80
    bne .F4BF

    jsr _81F5E6
.F4BE:
    rtl

.F4BF:
    and.b #0x7F
    beq .F4BE

    stz.w 0x0BE4
    jsr _81F5FB
    jsl 0x848F52
    ldx.b 0x02
    jmp (.F4D2,X)

.F4D2: d16[.F4D8, .F528, .F540]

.F4D8:
    dec.b 0x0B
    bne .F527

    lda.b #0x00
    jsl 0x848F7D
    lda.b #0x3C
    sta.b 0x0B
    lda.b #0x02
    sta.b 0x02
    ldx.b #0x06
    ldy.b #0x0C
.F4EE:
    rep #0x20
    lda 0xDE16,Y
    sta.w 0x002C
    lda.w 0xDE26,X
    sta.w 0x002E
    sep #0x20
    lda.b #0x0B
    phx
    phy
    jsl 0x848011
    ply
    plx
    dey
    dey
    dey
    dey
    dex
    dex
    bpl .F4EE

    lda.b #0x25
    sta.b 0x16
    stz.b 0x17
    lda.b #0x01
    sta.b 0x03
    lda.b #0x08
    sta.b 0x0C
    rep #0x20
    lda.w #0x0049
    sta.b 0x1C
    stz.b 0x08
.F527:
    rtl

.F528:
    dec.b 0x0B
    bne .F53F

    lda.b #0x01
    jsl 0x848F7D
    lda.b #0x04
    sta.b 0x02
    lda.b #0xFF
    sta.b 0x0B
    ldx.b #0x10
    jsr _81F688
.F53F:
    rtl

.F540:
    lda.w 0x0B9C
    and.b #0x0F
    bne .F54D

    lda.b #0x75
    jsl _80888B.88B6
.F54D:
    jsl 0x848F52
    dec.b 0x0B
    bne .F564

    lda.b #0xF0
    sta.b 0x0B
    ldx.b #0x0C
    jsr _81F688
    stz.w 0x0BC4
    stz.b 0x02
    rtl

.F564:
    rep #0x10
    ldx.b 0x20
    phx
    ldx.w #0xDE06
    stx.b 0x20
    ldx.b 0x08
    stx.b 0x18
    ldy.w #0x000C
.F575:
    rep #0x21
    sty.w 0x0000
    lda.b 0x18
    sta.b 0x08
    lda.w #0xDE06
    adc.w 0x0000
    sta.b 0x20
    lda 0xDE16,Y
    sta.b 0x05
    lda 0xDE18,Y
    clc
    adc.b 0x08
    sta.b 0x08
    sep #0x20
    jsr _81F62D
    ldx.w #0x0BA8
    jsl 0x849C0E
    bcc .F5D6

    rep #0x21
    lda.w 0x0BC4
    bpl .F5AB

    stz.w 0x0BC4
.F5AB:
    lda.w 0x0006
    cmp.w #0x0005
    bcc .F5BD

    lda.w 0x0BB0
    clc
    adc.w #0xFFFF
    sta.w 0x0BB0
.F5BD:
    lda.w 0x0BAD
    clc
    adc.w 0x0BCA
    lsr
    sta.w 0x0BAD
    sep #0x20
    lda.b #0x01
    sta.w 0x0BE4
    lda.b #0x08
    sta.w 0x0BD7
    bra .F5DC

.F5D6:
    dey
    dey
    dey
    dey
    bpl .F575

.F5DC:
    plx
    stx.b 0x20
    ldx.b 0x18
    stx.b 0x08
    sep #0x10
    rtl

;-----

_81F5E6:
    rep #0x20
    ldx.b #0x1E
.F5EA:
    lda.l 0x85D8E0,X
    sta.w 0x03A0,X
    dex
    dex
    bpl .F5EA

    sep #0x20
    inc.w 0x00A1
    rts

;-----

_81F5FB:
    ldx.b 0x17
    bne .F616

    dec.b 0x16
    bne .F611

    lda.b #0x21
    sta.b 0x16
    inc.b 0x17
    lda.b #0x7D
    sta.b 0x1C
    lda.b #0xFF
    sta.b 0x1D
.F611:
    jsl update_pos_xy.neg_ay_ax
    rts

.F616:
    dec.b 0x16
    bne .F628

    lda.b #0x21
    sta.b 0x16
    stz.b 0x17
    lda.b #0x83
    sta.b 0x1C
    lda.b #0x00
    sta.b 0x1D
.F628:
    jsl update_pos_xy.pos_ay_neg_ax
    rts

;-----

_81F62D:
    lda.b 0x0C
    beq .F687

    jsl 0x82806E
    bcs .F687

    dec.b 0x03
    bne .F687

    lda.b #0x0F
    sta.b 0x03
    jsl 0x8282D3
    bne .F687

    dec.b 0x0C
    inc.w 0x0000,X
    lda.b #0x1B
    sta.w 0x000A,X
    lda.b #0x80
    sta.w 0x000B,X
    rep #0x21
    jsl get_rng
    and.w #0x0007
    sta.w 0x0000
    lda.b 0x05
    clc
    adc.w #0xFFF0
    clc
    adc.w 0x0000
    sta.w 0x0005,X
    jsl get_rng
    and.w #0x003F
    sta.w 0x0000
    lda.b 0x08
    clc
    adc.w 0x0000
    clc
    sta.w 0x0008,X
    tdc
    sta.w 0x000C,X
    sep #0x20
.F687:
    rts

;-----

_81F688:
    ldy.b #0x03
.F68A:
    txa
    phx
    phy
    jsl 0x848000
    ply
    plx
    inx
    dey
    bpl .F68A

    rts

;-----

_81F698:
    ldx.b 0x01
    jsr (.F6A1,X)
    jsr _81F70F
    rtl

.F6A1: d16[.F6A5, .F6C9]

.F6A5:
    lda.b #0x02
    sta.b 0x01
    rep #0x30
    lda.b 0x0B
    and.w #0x00FF
    asl
    sta.w 0x0000
    lda.w 0x1F7A
    and.w #0x00FF
    asl
    tax
    lda.w 0x86E4E5,X
    clc
    adc.w 0x0000
    tax
    lda.w 0x0000,X
    sta.b 0x04
.F6C9:
    rep #0x30
    ldx.b 0x04
    lda.w 0x0BAD
    cmp.w 0x0000,X
    bcs .F70C

    cmp.w 0x0002,X
    bcc .F70C

    lda.w 0x0BB0
    cmp.w 0x0004,X
    bcs .F70C

    cmp.w 0x0006,X
    bcc .F70C

    lda.w #0x0002
    sta.w 0x1E52
.F6ED:
    sep #0x20
    lda.w 0x0008,X
    beq .F70C

    rep #0x20
    and.w #0x00FF
    dec
    asl
    asl
    tay
    phx
    lda 0x86ECD3,Y
    tax
    lda 0x86ECD5,Y
    sta.w 0x0000,X
    plx
    inx
    bra .F6ED

.F70C:
    sep #0x30
    rts

;-----

_81F70F:
    rep #0x30
    lda.w 0x1E4D
    sec
    sbc.w #0x0040
    sta.b 0x08
    clc
    adc.w #0x0180
    sta.b 0x06
    ldx.b 0x04
    lda.w 0x0000,X
    cmp.b 0x08
    bmi .F758

    cmp.b 0x06
    bmi .F734

    lda.w 0x0002,X
    cmp.b 0x06
    bpl .F758

.F734:
    lda.w 0x1E50
    sec
    sbc.w #0x0040
    sta.b 0x08
    clc
    adc.w #0x0180
    sta.b 0x06
    lda.w 0x0004,X
    cmp.b 0x08
    bmi .F758

    cmp.b 0x06
    bmi .F755

    lda.w 0x0006,X
    cmp.b 0x06
    bpl .F758

.F755:
    sep #0x30
    rts

.F758:
    sep #0x30
    jsl 0x828387
    rts

;-----

_81F75F:
    lda.b 0x01
    bne .F775

    inc.b 0x01
    lda.w 0x1F2C
    beq .F76E

    jml 0x828387

.F76E:
    inc.w 0x1F2C
    lda.b #0xFF
    sta.b 0x00
.F775:
    rep #0x20
    lda.w 0x1E4D
    sec
    sbc.w #0x0900
    bpl .F795

    eor.w #0xFFFF
    inc
    cmp.w #0x0100
    bpl .F7B6

    sep #0x20
    sta.w 0x0000
    lda.b #0xFF
    sta.w 0x0002
    bra .F7B4

.F795:
    stz.w 0x0000
    lda.w #0x0B60
    sec
    sbc.w 0x1E4D
    bmi .F7B6

    beq .F7B6

    cmp.w #0x0100
    sep #0x20
    bpl .F7AF

    sta.w 0x0002
    bra .F7B4

.F7AF:
    lda.b #0xFF
    sta.w 0x0002
.F7B4:
    bra .F7C0

.F7B6:
    sep #0x20
    lda.b #0xFF
    sta.w 0x0000
    stz.w 0x0002
.F7C0:
    jsr _81F7C4
    rtl

;-----

_81F7C4:
    rep #0x20
    lda.w #0x0160
    sec
    sbc.w 0x1E50
    sep #0x20
    cmp.b #0x80
    bcc .F7FD

    sec
    sbc.b #0x80
    sta.w 0x0B25
    lda.b #0x60
    sec
    sbc.w 0x0B25
    sta.w 0x0B28
    lda.b #0x7F
    sta.w 0x0B22
    stz.w 0x0B2B
    rep #0x20
    lda.w #0x0ADE
    sta.w 0x0B23
    sta.w 0x0B26
    lda.w #0x0AE0
    sta.w 0x0B29
    bra .F83A

.F7FD:
    dec
    sta.w 0x0B22
    clc
    adc.b #0x7F
    bcs .F81D

    cmp.b #0xE0
    bcs .F81D

    lda.b #0x7F
    sta.w 0x0B25
    lda.b #0x60
    sec
    sbc.w 0x0B22
    sta.w 0x0B28
    stz.w 0x0B2B
    bra .F829

.F81D:
    lda.b #0xE0
    sec
    sbc.w 0x0B22
    sta.w 0x0B25
    stz.w 0x0B28
.F829:
    rep #0x20
    lda.w #0x0ADE
    sta.w 0x0B23
    lda.w #0x0AE0
    sta.w 0x0B26
    sta.w 0x0B29
.F83A:
    stz.w 0x0B2E
    sep #0x20
    lda.w 0x0000
    sta.w 0x0B30
    lda.w 0x0002
    sta.w 0x0B31
    ldx.w 0x0AA0
    lda.b #0x41
    sta.w 0x0AA1,X
    lda.b #0x26
    sta.w 0x0AA2,X
    lda.b #0xD2
    sta.w 0x0AA3,X
    lda.b #0x0A
    sta.w 0x0AA4,X
    lda.b #0x00
    sta.w 0x0AA5,X
    sta.w 0x0AA6,X
    txa
    clc
    adc.b #0x06
    sta.w 0x0AA0
    rts

;-----

_81F872:
    ldx.b 0x01
    bne .F88B

    jsl 0x84A205
    tya
    beq .F881

    jml 0x828387

.F881:
    inc.b 0x01
    lda.b #0x04
    sta.b 0x02
    lda.b 0x0B
    sta.b 0x04
.F88B:
    lda.b 0x04
    sta.b 0x05
    jsr _81F8F8
    ldx.b 0x02
    jsr (.F898,X)
    rtl

.F898: d16[.F89E, .F8E8, .F8C1]

.F89E:
    ldx.b 0x03
    jmp (.F8A3,X)

.F8A3: d16[.F8A9, .F8C2, .F8DA]

.F8A9:
    lda.b #0x02
    sta.b 0x03
    rep #0x20
    lda.w #0x0400
    sta.w 0x1E8D
    lda.w #0x0000
    sta.w 0x1E90
    sep #0x20
    jsl _80E02C
.F8C1:
    rts

.F8C2:
    lda.w 0x1F27
    bne .F8D9

    lda.b #0x04
    sta.b 0x03
    lda.b #0x00
    sta.w 0x1E8D
    lda.b #0x05
    sta.w 0x1E8E
    jsl _80E02C
.F8D9:
    rts

.F8DA:
    lda.w 0x1F27
    bne .F8E7

    lda.b #0x04
    sta.b 0x02
    jsl 0x80E01C
.F8E7:
    rts

.F8E8:
    lda.b #0x0E
    sta.w 0x1E89
    stz.w 0x1E9A
    inc.w 0x1E88
    lda.b #0x04
    sta.b 0x02
    rts

;-----

_81F8F8:
    rep #0x20
    ldx.b #0x00
    lda.w 0x0BB0
.F8FF:
    cmp.w 0xE45C,X
    bmi .F90A

    inx
    inx
    cpx.b #0x02
    bne .F8FF

.F90A:
    sep #0x20
    stx.b 0x04
    cpx.b 0x05
    beq .F916

    stx.b 0x02
    stz.b 0x03
.F916:
    rts

;-----

_81F917:
    php
    rep #0x20
    sep #0x10
    ldx.b 0x01
    jsr (.F92D,X)
    jsl 0x82806E
    bcc .F92B

    jsl 0x828387
.F92B:
    plp
    rtl

.F92D: d16[.F931, .F93E]

.F931:
    ldx.b #0x02
    stx.b 0x01
    jsr _81F967
    bpl .F93E

    ldx.b #0x02
    stx.b 0x02
.F93E:
    ldx.b 0x02
    jmp (.F943,X)

.F943: d16[.F947, .F958]

.F947:
    jsr _81F967
    bpl .F957

    ldx.b #0x02
    stx.b 0x02
    lda.b 0x0B
    asl
    tax
    jsr (_81F973.F973,X)
.F957:
    rts

.F958:
    jsr _81F967
    bmi .F966

    stz.b 0x02
    lda.b 0x0B
    asl
    tax
    jsr (_81F973.F98B,X)
.F966:
    rts

;-----

_81F967:
    ldx.b 0x0B
    lda.w 0xE45E,X
    tax
    lda.w 0x0BA8,X
    cmp.b 0x00,X
    rts

;-----

_81F973:

.F973: d16[.F9A3, .FA63, .FA7A, .FA8B, .FAB2, .FB30, .FAF4, .FB95, .FB57, .FBFA, .FBBC, .FC21]
.F98B: d16[.F9A4, .FA7A, .FA63, .FAB2, .FA8B, .FAF4, .FB30, .FB57, .FB95, .FBBC, .FBFA, .FC38]

.F9A3:
    rts

.F9A4:
    lda.w 0x1E4D
    sta.w 0x0000
    lda.w 0x1E50
    sta.w 0x0002
    lda.w #0x0100
    sta.w 0x1E4D
    sta.w 0x1E6A
    sta.w 0x1E5E
    sta.w 0x1E60
    sta.w 0x1E56
    sta.w 0x1E58
    lda.w #0x0800
    sta.w 0x1E50
    sta.w 0x1E6C
    lda.w #0x0380
    sta.w 0x1E90
    sta.w 0x1EAC
    lda.w #0x0080
    sta.w 0x1E8D
    sta.w 0x1EAA
    lda.w 0x0BAD
    sec
    sbc.w 0x0000
    ora.w #0x0100
    sta.w 0x0BAD
    sta.w 0x0BCA
    lda.w 0x0BB0
    sec
    sbc.w 0x0002
    ora.w #0x0800
    sta.w 0x0BB0
    sta.w 0x0BCC
    rep #0x10
    ldx.w #0x1228
.FA05:
    lda.w 0x0005,X
    sec
    sbc.w 0x0000
    clc
    adc.w #0x0100
    sta.w 0x0005,X
    sta.w 0x0022,X
    lda.w 0x0008,X
    sec
    sbc.w 0x0002
    clc
    adc.w #0x0800
    sta.w 0x0008,X
    sta.w 0x0024,X
    txa
    clc
    adc.w #0x0040
    tax
    cmp.w #0x1428
    bcc .FA05

    ldx.w #0x0C98
.FA35:
    lda.w 0x0005,X
    sec
    sbc.w 0x0000
    ora.w #0x0100
    sta.w 0x0005,X
    sta.w 0x0022,X
    lda.w 0x0008,X
    sec
    sbc.w 0x0002
    ora.w #0x0800
    sta.w 0x0008,X
    sta.w 0x0024,X
    txa
    clc
    adc.w #0x0020
    tax
    cmp.w #0x0E18
    bcc .FA35

    sep #0x10
    rts

.FA63:
    sep #0x30
    lda.b #0x13
    sta.w 0x00C0
    lda.b #0x10
    sta.w 0x00C1
    lda.b #0x02
    sta.w 0x00C9
    lda.b #0x4B
    sta.w 0x00CA
    rts

.FA7A:
    sep #0x30
    lda.b #0x17
    sta.w 0x00C0
    stz.w 0x00C1
    stz.w 0x00C9
    stz.w 0x00CA
    rts

.FA8B:
    rep #0x30
    ldx.w #0x1628
.FA90:
    lda.w 0x0000,X
    beq .FAA6

    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x000E
    bne .FAA6

    stz.w 0x0000,X
    stz.w 0x0002,X
.FAA6:
    txa
    clc
    adc.w #0x0030
    tax
    cmp.w #0x1928
    bcc .FA90

    rts

.FAB2:
    rep #0x30
    ldx.w #0x1628
.FAB7:
    lda.w 0x0000,X
    beq .FAC8

    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x000E
    bne .FAC8

    rts

.FAC8:
    txa
    clc
    adc.w #0x0030
    tax
    cmp.w #0x1928
    bcc .FAB7

    ldy.w #0x0009
    sep #0x30
.FAD8:
    jsl 0x8282B9
    bne .FAF3

    inc.w 0x0000,X
    lda.b #0x0E
    sta.w 0x000A,X
    tya
    cmp.b #0x06
    bcc .FAED

    ora.b #0x80
.FAED:
    sta.w 0x000B,X
    dey
    bpl .FAD8

.FAF3:
    rts

.FAF4:
    rep #0x30
    ldx.w #0x1628
.FAF9:
    lda.w 0x0000,X
    beq .FB0A

    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x000F
    bne .FB0A

    rts

.FB0A:
    txa
    clc
    adc.w #0x0030
    tax
    cmp.w #0x1928
    bcc .FAF9

    ldy.w #0x000B
    sep #0x30
.FB1A:
    jsl 0x8282B9
    bne .FB2F

    inc.w 0x0000,X
    lda.b #0x0F
    sta.w 0x000A,X
    tya
    sta.w 0x000B,X
    dey
    bpl .FB1A

.FB2F:
    rts

.FB30:
    rep #0x30
    ldx.w #0x1628
.FB35:
    lda.w 0x0000,X
    beq .FB4B

    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x000F
    bne .FB4B

    stz.w 0x0000,X
    stz.w 0x0002,X
.FB4B:
    txa
    clc
    adc.w #0x0030
    tax
    cmp.w #0x1928
    bcc .FB35

    rts

.FB57:
    rep #0x30
    ldx.w #0x1628
.FB5C:
    lda.w 0x0000,X
    beq .FB6D

    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x0013
    bne .FB6D

    rts

.FB6D:
    txa
    clc
    adc.w #0x0030
    tax
    cmp.w #0x1928
    bcc .FB5C

    ldy.w #0x0006
    sep #0x30
.FB7D:
    jsl 0x8282B9
    bne .FB94

    inc.w 0x0000,X
    lda.b #0x13
    sta.w 0x000A,X
    lda 0xE46A,Y
    sta.w 0x000B,X
    dey
    bpl .FB7D

.FB94:
    rts

.FB95:
    rep #0x30
    ldx.w #0x1628
.FB9A:
    lda.w 0x0000,X
    beq .FBB0

    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x0013
    bne .FBB0

    stz.w 0x0000,X
    stz.w 0x0002,X
.FBB0:
    txa
    clc
    adc.w #0x0030
    tax
    cmp.w #0x1928
    bcc .FB9A

    rts

.FBBC:
    rep #0x30
    ldx.w #0x1628
.FBC1:
    lda.w 0x0000,X
    beq .FBD2

    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x0014
    bne .FBD2

    rts

.FBD2:
    txa
    clc
    adc.w #0x0030
    tax
    cmp.w #0x1928
    bcc .FBC1

    ldy.w #0x0002
    sep #0x30
.FBE2:
    jsl 0x8282B9
    bne .FBF9

    inc.w 0x0000,X
    lda.b #0x14
    sta.w 0x000A,X
    lda 0xE471,Y
    sta.w 0x000B,X
    dey
    bpl .FBE2

.FBF9:
    rts

.FBFA:
    rep #0x30
    ldx.w #0x1628
.FBFF:
    lda.w 0x0000,X
    beq .FC15

    lda.w 0x000A,X
    and.w #0x00FF
    cmp.w #0x0014
    bne .FC15

    stz.w 0x0000,X
    stz.w 0x0002,X
.FC15:
    txa
    clc
    adc.w #0x0030
    tax
    cmp.w #0x1928
    bcc .FBFF

    rts

.FC21:
    sep #0x30
    lda.b #0x17
    sta.w 0x00C0
    lda.b #0x15
    sta.w 0x00C1
    lda.b #0x02
    sta.w 0x00C9
    lda.b #0x7F
    sta.w 0x00CA
    rts

.FC38:
    sep #0x30
    stz.w 0x00C1
    stz.w 0x00CA
    stz.w 0x00C9
    rts

;-----

_81FC44:
    lda.b 0x01
    beq .FC4D

    bra .FC55

.FC4A:
    jmp 0x81FCCF

.FC4D:
    inc.b 0x01
    lda.b #0x01
    sta.b 0x0E
    stz.b 0x0F
.FC55:
    jsr _81FCA1
    bne .FC9E

    rep #0x20
    dec.b 0x0E
    sep #0x20
    bne .FC9E

    jsl 0x828321
    bne .FC97

    rep #0x20
    tdc
    sta.w 0x000C,X
    lda.w 0x1E4D
    clc
    adc.w #0x0090
    sta.w 0x0005,X
    lda.w 0x1E50
    sta.w 0x0008,X
    lda.b 0x05
    sta.w 0x0037,X
    lda.b 0x08
    sta.w 0x0039,X
    sep #0x20
    lda.b #0x10
    sta.w 0x000A,X
    inc.w 0x0000,X
    lda.b 0x0B
    sta.w 0x000B,X
.FC97:
    ldx.w #0x01A4
    stx.b 0x0E
    sep #0x10
.FC9E:
    jmp .FC4A

;-----

_81FCA1:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .FCAF

    eor.w #0xFFFF
    inc
.FCAF:
    cmp.w #0x0080
    bcs .FCCA

    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .FCC0

    eor.w #0xFFFF
    inc
.FCC0:
    cmp.w #0x0080
    bcs .FCCA

    sep #0x20
    lda.b #0x00
    rts

.FCCA:
    sep #0x20
    lda.b #0x01
    rts

;-----

_81FCCF:
    jsl 0x82806E
    bcc .FCD9

    jml 0x828387

.FCD9:
    rtl

;-----

_81FCDA:
    lda.b 0x01
    beq .FCE3

    bra .FCE9

.FCE0:
    jmp 0x81FD5E

.FCE3:
    inc.b 0x01
    lda.b #0x01
    sta.b 0x02
.FCE9:
    jsr _81FD30
    bne .FD2D

    dec.b 0x02
    bne .FD2D

    jsl 0x828321
    bne .FD27

    rep #0x20
    jsl get_rng
    and.w #0x007F
    bit.w #0x0001
    bne .FD0A

    eor.w #0xFFFF
    inc
.FD0A:
    clc
    adc.w 0x0BAD
    and.w #0xFFF0
    clc
    adc.w #0x0008
    sta.w 0x0005,X
    lda.b 0x08
    sta.w 0x0008,X
    sep #0x20
    lda.b #0x07
    sta.w 0x000A,X
    inc.w 0x0000,X
.FD27:
    sep #0x10
    lda.b #0x78
    sta.b 0x02
.FD2D:
    jmp .FCE0

;-----

_81FD30:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .FD3E

    eor.w #0xFFFF
    inc
.FD3E:
    cmp.w #0x0080
    bcs .FD59

    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .FD4F

    eor.w #0xFFFF
    inc
.FD4F:
    cmp.w #0x0080
    bcs .FD59

    sep #0x20
    lda.b #0x00
    rts

.FD59:
    sep #0x20
    lda.b #0x01
    rts

;-----

_81FD5E:
    jsl 0x82806E
    bcc .FD68

    jml 0x828387

.FD68:
    rtl

;-----

_81FD69:
    lda.b 0x01
    beq .FD72

    bra .FD78

.FD6F:
    jmp 0x81FDEB

.FD72:
    inc.b 0x01
    lda.b #0x01
    sta.b 0x02
.FD78:
    jsr _81FDBD
    bne .FDBA

    dec.b 0x02
    bne .FDBA

    jsl 0x828321
    bne .FDB4

    rep #0x20
    jsl get_rng
    and.w #0x0100
    pha
    clc
    adc.w 0x1E4D
    sta.w 0x0005,X
    lda.w 0x1E50
    clc
    adc.w #0x0020
    sta.w 0x0008,X
    pla
    lsr
    lsr
    sep #0x20
    eor.b #0x40
    sta.w 0x000B,X
    lda.b #0x02
    sta.w 0x000A,X
    inc.w 0x0000,X
.FDB4:
    sep #0x10
    lda.b #0x5A
    sta.b 0x02
.FDBA:
    jmp .FD6F

;-----

_81FDBD:
    rep #0x20
    lda.b 0x05
    sec
    sbc.w 0x0BAD
    bcs .FDCB

    eor.w #0xFFFF
    inc
.FDCB:
    cmp.w #0x0080
    bcs .FDE6

    lda.b 0x08
    sec
    sbc.w 0x0BB0
    bcs .FDDC

    eor.w #0xFFFF
    inc
.FDDC:
    cmp.w #0x0080
    bcs .FDE6

    sep #0x20
    lda.b #0x00
    rts

.FDE6:
    sep #0x20
    lda.b #0x01
    rts

;-----

_81FDEB:
    jsl 0x82806E
    bcc .FDF5

    jml 0x828387

.FDF5:
    rtl

;-----

_81FDF6:
    lda.b 0x01
    bne .FE0B

    inc.b 0x01
    lda.w 0x1F81
    beq .FE05

    jml 0x828398

.FE05:
    lda.b #0x0A
    sta.b 0x0B
    stz.b 0x03
.FE0B:
    ldy.b #0x03
.FE0D:
    sep #0x20
    jsl 0x8282D3
    bne .FE66

    inc.w 0x0000,X
    lda.b #0x03
    sta.w 0x000A,X
    jsl get_rng
    and.b #0x3F
    clc
    adc.b #0x10
    sta.w 0x000B,X
    jsl get_rng
    and.b #0x7F
    sta.w 0x001C,X
    stz.w 0x001D,X
    jsl get_rng
    and.b #0x1F
    lsr
    bcc .FE41

    eor.b #0xFF
    inc
.FE41:
    clc
    adc.b 0x03
    sta.w 0x0008,X
    lda.b #0x02
    sta.w 0x0009,X
    rep #0x20
    jsl get_rng
    and.w #0x003F
    lsr
    bcc .FE5C

    eor.w #0xFFFF
    inc
.FE5C:
    clc
    adc.w #0x0080
    sta.w 0x0005,X
    dey
    bne .FE0D

.FE66:
    sep #0x30
    dec.b 0x0B
    bne .FE76

    lda.b #0x2F
    jsl _80888B.88B6
    jml 0x828398

.FE76:
    lda.b 0x0B
    lsr
    bcc .FE82

    lda.b 0x03
    clc
    adc.b #0x06
    sta.b 0x03
.FE82:
    rtl

;-----

_81FE83:
    ldx.b 0x01
    jsr (.FE89,X)
    rtl

.FE89: d16[.FE93, .FEA8, .FEE3, .FF0E, .FF0E]

.FE93:
    rep #0x20
    lda.w 0x0BAD
    cmp.w #0x0F00
    sep #0x20
    bcc .FEA7

    lda.b #0x02
    sta.b 0x01
    lda.b #0xFF
    sta.b 0x00
.FEA7:
    rts

.FEA8:
    rep #0x20
    lda.w #0x0F00
    sta.w 0x1E60
    sta.w 0x1E5E
    lda.w #0x0400
    sta.w 0x1E6E
    sta.w 0x1E68
    sep #0x20
    lda.b #0x02
    sta.w 0x1E52
    lda.b #0x04
    sta.b 0x01
    inc.w 0x1F13
    inc.w 0x1F14
    inc.w 0x1F15
    inc.w 0x1F16
    inc.w 0x1F17
    jsr 0x819F85
    jsr _81A163.A187
    jsr 0x81A26F
    jsr 0x81A28B
    rts

.FEE3:
    rep #0x20
    lda.w 0x1E4D
    cmp.w #0x0F00
    bne .FF0D

    lda.w 0x1E50
    cmp.w #0x0400
    bne .FF0D

    sep #0x20
    jsr 0x819FAD
    stz.w 0x1F13
    stz.w 0x1F14
    stz.w 0x1F15
    stz.w 0x1F16
    stz.w 0x1F17
    lda.b #0x06
    sta.b 0x01
.FF0D:
    rts

.FF0E:
    rts

;-----

_81FF0F:
    lda.b 0x01
    bne .FF2A

    inc.b 0x01
    lda.b 0x0B
    and.b #0x3F
    cmp.w 0x1F81
    beq .FF20

    bcs .FF24

.FF20:
    jml 0x828387

.FF24:
    lda.b 0x0B
    and.b #0x40
    sta.b 0x02
.FF2A:
    rep #0x20
    ldx.b 0x02
    bne .FF37

    lda.b 0x05
    cmp.w 0x0BAD
    bra .FF3C

.FF37:
    lda.b 0x08
    cmp.w 0x0BB0
.FF3C:
    sep #0x20
    lda.b #0x00
    ror
    eor.b 0x0B
    and.b #0x80
    bne .FF52

    lda.b 0x0B
    and.b #0x3F
    sta.w 0x1F81
    jml 0x828387

.FF52:
    jsl 0x82806E
    bcc .FF5C

    jml 0x828387

.FF5C:
    rtl

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
    0xFF,0xFF,0xFF,
]
